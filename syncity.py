#!/usr/bin/python

from __future__ import division

import sys
import os
import time
import argparse
import textwrap
import platform
import datetime
import syncity

from syncity import common, settings_manager

SYNCITY_VERSION = '3.2.2'

print ('SynCity toolbox - v{}\nCopyright (c) {} CVEDIA PVE Ltd\n'.format(SYNCITY_VERSION, datetime.date.today().year))

parser = argparse.ArgumentParser(
	formatter_class=argparse.RawDescriptionHelpFormatter,
	description=textwrap.dedent('''\
This script allows experimentation, recording and playback of scripted events using syncity simulator telnet api. We also added some demos that show case different specific features of the api.

You can pipe multiple scripts, tools and command line (-r , --run) files on the same run, this script will respect the order of the arguments even if they are interleaved with each other, this allows for very flexible pipelines, for example:

`syncity.py -r path/to/my.cl -s 360 -t gallery -s something something_else -r other.cl -s 360 -t gallery`
'''),
	epilog=textwrap.dedent('Scripts available:\n\n{}\n\nTools available:\n\n{}\n\nFull documentation available in: https://docs.syncity.com'.format(common.modules_help('scripts'), common.modules_help('tools'))))

parser.add_argument('-p', '--port', type=int, default=10200, help='Port to connect, defaults to 10200')
parser.add_argument('-i', '--ip', default='127.0.0.1', help='IP of syncity simulator')

# pipeable arguments
parser.add_argument('-s', '--script', default=None, action='append', nargs='+', help='Defines one or more python scripts to run')
parser.add_argument('-t', '--tool', default=None, action='append', nargs='+', help='Defines one or more tools to run')
parser.add_argument('-r', '--run', type=argparse.FileType('r'), action='append', nargs='+', help='Defines one or more command line (.cl) script to run')

parser.add_argument('--cooldown', type=int, default=0, help='Cooldown after snapshot')

if platform.system() == 'Windows':
	parser.add_argument('-o', '--output', default='E:\\tmp\\', help='Defines output path for snapshots, note that this path is relative to the machine running the simulator, defaults to E:\\tmp\\', dest='output_path')
	parser.add_argument('-l', '--local_output', default='E:\\tmp\\', action=syncity.common.readable_dir, help='Defines local output path for recordings, json exports, etc; This path is relative to the machine running this script, defaults to E:\\tmp\\', dest='local_path')
else:
	parser.add_argument('-o', '--output', default='/tmp/', help='Defines output path for snapshots, note that this path is relative to the machine running the simulator, defaults to /tmp/', dest='output_path')
	parser.add_argument('-l', '--local_path', default='/tmp/', action=syncity.common.readable_dir, help='Defines local output path for recordings, json exports, etc; This path is relative to the machine running this script, defaults to /tmp/', dest='local_path')

parser.add_argument('-q', '--quiet', action='store_true', help='Quiet mode')
parser.add_argument('-n', '--no_color', action='store_true', default=False, help='Disable color output')
parser.add_argument('-Z', '--abort_on_error', action='store_true', default=False, help='Abort execution on error')
parser.add_argument('--assets', help='Defines assets folder name')
parser.add_argument('--keep', default=False, action='store_true', help='Keep created assets on scene')
parser.add_argument('--record', action='store_true', help='Record commands sent to API using --local_path as output path')
parser.add_argument('--debug', action='store_true', help='Defines a global debug flag, this will cause a lot of outputs')
parser.add_argument('--log', action='store_true', help='Log all IOs')
parser.add_argument('--async', action='store_true', help='Send some telnet commands asyncronously -- EXPERIMENTAL')
parser.add_argument('--skip_disk', action='store_true', help='Disables disk export completly')
parser.add_argument('--skip_setup', action='store_true', help='Skip script setup and go straight to data extraction')
parser.add_argument('--setup_only', action='store_true', help='Runs script setup and exits')
parser.add_argument('--disable_envirosky', action='store_true', help='Disables Envirosky -- NOT RECOMMENDED')
parser.add_argument('--disable_canvas', action='store_true', help='Disables client rendering visualization, better for performance, but you will only see outputs written to disk.')
parser.add_argument('--use_old_depth_buffer', action='store_true', default=False, help='Uses old depth buffer component')
parser.add_argument('--flycam', action='store_true', help='Spawns fly cam, controllable via simulator')
parser.add_argument('--cars_limit', type=int, default=50, help='Spawn cars into scene, defaults to 100')
parser.add_argument('--props_limit', type=int, default=250, help='Spawn props into scene, defaults to 250')
parser.add_argument('--signs_limit', type=int, default=250, help='Spawn signs into scene, defaults to 250')
parser.add_argument('--trees_limit', type=int, default=250, help='Spawn trees into scene, defaults to 250')
parser.add_argument('--backdrops_limit', type=int, default=50, help='Spawn backdrops into scene, defaults to 50')
parser.add_argument('--X_COMP', type=float, default=0, help='Spawner X Compensation, defaults to 0')
parser.add_argument('--Y_COMP', type=float, default=1, help='Spawner Y Compensation, defaults to 1')
parser.add_argument('--Z_COMP', type=float, default=0, help='Spawner Z Compensation, defaults to 0')

scripts_parser = parser.add_argument_group('Scripts specific options')
common.modules_args('scripts', parser=scripts_parser)

tools_parser = parser.add_argument_group('Tool specific options')
common.modules_args('tools', parser=tools_parser)

args = parser.parse_args()

settings = syncity.settings_manager.Singleton()
settings._start = time.time()
settings._version = SYNCITY_VERSION
settings._root = os.path.dirname(os.path.realpath(__file__))
settings.shutdown = False
syncity.common.init()

stack = common.find_arg_order([
	{'id': 'run', 'args': ['-r', '--run']},
	{'id': 'script', 'args': ['-s', '--script']},
	{'id': 'tool', 'args': ['-t', '--tool']}
])

stack_size = len(stack)

if stack_size == 0:
	common.output('Nothing to run, aborting!', 'ERROR')
	sys.exit(0)

for k in args.__dict__:
	settings[k] = args.__dict__[k]

if platform.system() == 'Windows':
	if settings.local_path.find('/') != -1:
		if settings.local_path[-1:] != '/':
			settings.local_path = settings.local_path + '/'
	elif settings.local_path[-1:] != '\\':
		settings.local_path = settings.local_path + '\\'
else:
	if settings.local_path[-1:] != '/':
		settings.local_path = settings.local_path + '/'

if settings.log == True:
	settings.lfh = open('{}log_{}.txt'.format(settings.local_path, settings._start), 'wb+')

# setup telnet connection
if settings.run != None or settings.script != None:
	if settings.record == True:
		settings.fh = open('{}record_{}.txt'.format(settings.local_path, settings._start), 'wb+')
	
	syncity.common.init_telnet(settings.ip, settings.port)
	
	if settings.async == True:
		common.output('Telnet mode set to ASYNCRONOUS')
		settings.force_sync = False
	else:
		common.output('Telnet mode set to SYNCRONOUS')
		settings.force_sync = True
	
	syncity.common.flush_buffer()

idx = { 'run': 0, 'script': 0, 'tool': 0 }
ran = 1

for s in stack:
	common.output('[{}% {}/{}] Running stack: {}'.format(round(100 * (ran / stack_size), 2), ran, stack_size, s))
	
	if s == 'run':
		for subject in settings.run[idx['run']]:
			syncity.common.output('Running command line script {} {}...'.format(subject, syncity.common.md5(subject)))
			with open(subjectr) as fp:
				for line in fp:
					syncity.common.send_data(line)
		
		idx['run'] += 1
	
	elif s == 'script':
		for subject in settings.script[idx['script']]:
			if subject[-3:] == '.py':
				subject = subject[:-3]
			
			syncity.common.output('Running python script: {} {}'.format(subject, syncity.common.md5('syncity/scripts/{}.py'.format(subject))))
			
			# track objects created by script to remove them from scene later on
			settings.obj = []
			settings.seq_save_i = 1
			
			# this should work with both python 2.7 and 3+
			import_script = __import__('syncity.scripts.{}'.format(subject), fromlist=['syncity.scripts'])
			import_script.run()
		
		idx['script'] += 1
	
	elif s == 'tool':
		for subject in settings.tool[idx['tool']]:
			if subject[-3:] == '.py':
				subject = subject[:-3]
			
			syncity.common.output('Running tool: {} {}'.format(subject, syncity.common.md5('syncity/tools/{}.py'.format(subject))))
			
			import_tool = __import__('syncity.tools.{}'.format(subject), fromlist=['syncity.tools'])
			import_tool.run()
		
		idx['tool'] += 1
	
	ran += 1
