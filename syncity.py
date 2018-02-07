#!/usr/bin/python

SYNCITY_VERSION = '3.2.11'

import sys
import os
import time
import argparse
import textwrap
import platform
import datetime
import syncity

from syncity import common, settings_manager

print ('SynCity toolbox - v{}\nCopyright (c) {} CVEDIA PVE Ltd\n'.format(SYNCITY_VERSION, datetime.date.today().year))

parser = argparse.ArgumentParser(
	formatter_class=argparse.RawDescriptionHelpFormatter,
	description=textwrap.dedent('''\
This script allows experimentation, recording and playback of scripted events
using syncity simulator telnet api. We also added some demos that show case
different specific features of the api.
'''),
	epilog=textwrap.dedent('Scripts available:\n\n{}\n\nTools available:\n\n{}'.format(common.modules_help('scripts'), common.modules_help('tools'))))
parser.add_argument('-p', '--port', type=int, default=10200, help='Port to connect, defaults to 10200')
parser.add_argument('-i', '--ip', default='127.0.0.1', help='IP of syncity simulator')
parser.add_argument('-s', '--script', default=None, help='When a --run is not set, defines a script loop to play')
parser.add_argument('-t', '--tool', default=None, help='Run a tool from repository')
parser.add_argument('--cooldown', type=int, default=0, help='Cooldown after snapshot')
parser.add_argument('-r', '--run', type=argparse.FileType('r'), help='Run command line (.cl) script')

if platform.system() == 'Windows':
	parser.add_argument('-o', '--output', default='E:\\tmp\\', help='Defines output path for snapshots, note that this path is relative to the machine running the simulator, defaults to E:\\tmp\\', dest='output_path')
	parser.add_argument('-l', '--local_output', default='E:\\tmp\\', action=syncity.common.readable_dir, help='Defines local output path for recordings, json exports, etc; This path is relative to the machine running this script, defaults to E:\\tmp\\', dest='local_path')
else:
	parser.add_argument('-o', '--output', default='/tmp/', help='Defines output path for snapshots, note that this path is relative to the machine running the simulator, defaults to /tmp/', dest='output_path')
	parser.add_argument('-l', '--local_path', default='/tmp/', action=syncity.common.readable_dir, help='Defines local output path for recordings, json exports, etc; This path is relative to the machine running this script, defaults to /tmp/', dest='local_path')

parser.add_argument('-q', '--quiet', action='store_true', help='Quiet mode')
parser.add_argument('--assets', help='Defines assets folder name')
parser.add_argument('--keep', default=False, action='store_true', help='Keep created assets on scene')
parser.add_argument('--record', action='store_true', help='Record commands sent to API using --local_path as output path')
parser.add_argument('--log', action='store_true', help='Log all IOs')
parser.add_argument('--async', action='store_true', help='Send some telnet commands asyncronously -- EXPERIMENTAL')
parser.add_argument('--skip_disk', action='store_true', help='Disables disk export completly')
parser.add_argument('--skip_setup', action='store_true', help='Skip script setup and go straight to data extraction')
parser.add_argument('--setup_only', action='store_true', help='Runs script setup and exits')
parser.add_argument('--disable_envirosky', action='store_true', help='Disables Envirosky -- NOT RECOMMENDED')
parser.add_argument('--disable_canvas', action='store_true', help='Disables client rendering visualization, better for performance, but you will only see outputs written to disk.')
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

for k in args.__dict__:
	# print ('Setting: {} value: {}'.format(k, args.__dict__[k]))
	settings[k] = args.__dict__[k]

'''
if platform.system() == 'Windows':
	if settings.output_path[-1:] != '\\':
		settings.output_path = settings.output_path + '\\'
	if settings.local_path[-1:] != '\\':
		settings.local_path = settings.local_path + '\\'
else:
	if settings.output_path[-1:] != '/':
		settings.output_path = settings.output_path + '/'
	if settings.local_path[-1:] != '/':
		settings.local_path = settings.local_path + '/'
'''

if settings.log == True:
	settings.lfh = open('{}log_{}.txt'.format(settings.local_path, settings._start), 'wb+')

syncity.common.init()

if settings.run or settings.script:
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
	
	if settings.run:
		syncity.common.output('Running script {} {}...'.format(settings.run, syncity.common.md5(settings.run)))
		with open(settings.run) as fp:
			for line in fp:
				syncity.common.send_data(line)
	else:
		if settings.script[-3:] == '.py':
			settings.script = settings.script[:-3]
		
		syncity.common.output('Using script: {} {}'.format(settings.script, syncity.common.md5('syncity/scripts/{}.py'.format(settings.script))))
		syncity.common.output('Press CTRL+C to abort')
		
		# track objects created by script to remove them from scene later on
		settings.obj = []
		settings.seq_save_i = 0
		
		# this should work with both python 2.7 and 3+
		import_script = __import__('syncity.scripts.{}'.format(settings.script), fromlist=['syncity.scripts'])
		import_script.run()

if settings.tool != None:
	if settings.tool[-3:] == '.py':
		settings.tool = settings.tool[:-3]
	
	syncity.common.output('Running tool: {} {}'.format(settings.tool, syncity.common.md5('syncity/tools/{}.py'.format(settings.tool))))
	syncity.common.output('Press CTRL+C to abort')
	
	import_tool = __import__('syncity.tools.{}'.format(settings.tool), fromlist=['syncity.tools'])
	import_tool.run()
