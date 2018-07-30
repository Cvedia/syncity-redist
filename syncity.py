#!/usr/bin/python
# -*- coding: UTF-8 -*-

from __future__ import division

import sys
import os
import time
import argparse
import textwrap
import platform
import datetime
import syncity
import random

from syncity import common, settings_manager

SYNCITY_VERSION = '18.07.30.1820'
SIMULATOR_MIN_VERSION = '18.04.23.0000'

print ('SynCity toolbox - v{}\nCopyright (c) 2016-{} CVEDIA PVE Ltd\n'.format(SYNCITY_VERSION, datetime.date.today().year))

if sys.version_info[0] < 3:
	print ('*** WARNING: You\'re using a old version of python that is not maintained by this SDK, some functions might fail. Run at your own risk! Please use python 3.6+\n\n')

parser = argparse.ArgumentParser(
	formatter_class=argparse.RawDescriptionHelpFormatter,
	description=textwrap.dedent('''\
This script allows experimentation, recording and playback of scripted events using syncity simulator telnet api. We also added some demos that show case different specific features of the api.

You can pipe multiple scripts, tools and command line (-r , --run) files on the same run, this script will respect the order of the arguments even if they are interleaved with each other, this allows for very flexible pipelines, for example:

`syncity.py -r path/to/my.cl -s 360 -t gallery -s something something_else -r other.cl -s 360 -t gallery`
'''),
	epilog=textwrap.dedent('Scripts available:\n\n{}\n\nTools available:\n\n{}\n\nFull documentation available in: https://docs.syncity.com'.format(common.modulesHelp('scripts'), common.modulesHelp('tools')))
)

parser.add_argument('-p', '--port', type=int, default=10200, help='Port to connect, defaults to 10200')
parser.add_argument('-i', '--ip', default='127.0.0.1', help='IP of syncity simulator')

# pipeable arguments
parser.add_argument('-s', '--script', default=None, action='append', nargs='+', help='Defines one or more python scripts to run')
parser.add_argument('-t', '--tool', default=None, action='append', nargs='+', help='Defines one or more tools to run')
parser.add_argument('-r', '--run', type=argparse.FileType('r'), action='append', nargs='+', help='Defines one or more command line (.cl) script to run')

parser.add_argument('--cooldown', type=int, default=0, help='Cooldown after snapshot')

# platform specific
if platform.system() == 'Windows':
	parser.add_argument('-o', '--output', default='E:\\tmp\\', help='Defines output path for snapshots, note that this path is relative to the machine running the simulator, defaults to E:\\tmp\\', dest='output_path')
	parser.add_argument('-l', '--local_output', default='E:\\tmp\\', action=syncity.common.readableDir, help='Defines local output path for recordings, json exports, etc; This path is relative to the machine running this script, defaults to E:\\tmp\\', dest='local_path')
else:
	parser.add_argument('-o', '--output', default='/tmp/', help='Defines output path for snapshots, note that this path is relative to the machine running the simulator, defaults to /tmp/', dest='output_path')
	parser.add_argument('-l', '--local_output', default='E:\\tmp\\', action=syncity.common.readableDir, help='Defines local output path for recordings, json exports, etc; This path is relative to the machine running this script, defaults to E:\\tmp\\', dest='local_path')

# misc
parser.add_argument('-q', '--quiet', action='store_true', default=False, help='Quiet mode')
parser.add_argument('-n', '--no_color', action='store_true', default=False, help='Disable color output')
parser.add_argument('-Z', '--abort_on_error', action='store_true', default=False, help='Abort execution on error')
parser.add_argument('-A', '--assets', help='Defines assets folder name')
parser.add_argument('--db', help='Defines database folder name, if not set will follow --assets, if --assets is not defined, this value will not be touched')
parser.add_argument('--seed_py', help='Defines a seed number for random methods on python layer. Note that this will be treated as a string.', default=None)
parser.add_argument('--seed_api', type=int, help='Defines a seed number for random methods on api layer.', default=None)
parser.add_argument('--interactive', action='store_true', default=False, help='Drops to a interactive shell after executing stack or when interrupted.')
parser.add_argument('--keep', action='store_true', default=False, help='Keep created assets on scene')
parser.add_argument('-R', '--reset', action='store_true', default=False, help='Resets simulator before running anything on stack')
parser.add_argument('--record', default=False, nargs='?', help='Record commands sent to API using --local_path as output path when no parameters sent, or defines a filename to write to')
parser.add_argument('-b', '--benchmark', action='store_true', default=False, help='Enables benchmarking on API reply time')
parser.add_argument('-d', '--dry_run', action='store_true', default=False, help='Pretends to run, but never send any command thuru telnet')
parser.add_argument('-L', '--loglevel', default='DEBUG', help='Minimum log level to display / log.')
parser.add_argument('--debug', action='store_true', default=False, help='Defines a global debug flag, this will cause a lot of outputs')
parser.add_argument('--log', default=False, nargs='?', help='Log all IOs, if a parameter is specified this will log to a specific file')
parser.add_argument('--async', action='store_true', default=False, help='Send some telnet commands asyncronously -- EXPERIMENTAL')

parser.add_argument('--skip_init', action='store_true', default=False, help='Disables telnet init sequence')
parser.add_argument('--skip_disk', action='store_true', default=False, help='Disables disk export completly')
parser.add_argument('--skip_export', action='store_true', default=False, help='Disables data exports completly')
parser.add_argument('--skip_setup', action='store_true', default=False, help='Skip script setup and go straight to data extraction')
parser.add_argument('--skip_queue', action='store_true', default=False, help='Skips all queue waits, this might cause asyncronous states for exports -- NOT RECOMMENDED')

parser.add_argument('-c', '--config', default=None, help='Defines a config file to be loaded, overwriting / appending to arbitrary settings values')
# parser.add_argument('--skip_config', action='store_true', default=False, help='Skips SDK default config file')
# parser.add_argument('--save_config', action='store_true', default=False, help='Save sent parameters as SDK config file -- WARNING: This will not save the stack parameters (-r, -s and -t)')
parser.add_argument('-O', '--options', default=None, action='append', nargs='+', help='Defines a path to a json file to overload / overwrite settings.options to be used as parameters on scripts globally. You can concatenate files, they will be merged into a single option stack. Note that the order you define the parameters of this function will affect how they are merged.')
parser.add_argument('--layout', default=None, help='Path to layout file, this file must be accessible to the simulator')

parser.add_argument('--skip_shutdown', action='store_true', default=False, help='Skips shutdown sequence')
parser.add_argument('--test', action='store_true', default=False, help='Enables test suite flag')

parser.add_argument('--setup_only', action='store_true', default=False, help='Runs script setup and exits')
parser.add_argument('--enable_physics', action='store_true', default=False, help='Enable Physics, mainly affects objects with rigidbodies.')
# parser.add_argument('--enable_console_log', action='store_true', default=False, help='Enable UI console log')
parser.add_argument('--enable_canvas', action='store_true', default=False, help='Enable client rendering visualization, this is the legacy interface')
parser.add_argument('--disable_envirosky', action='store_true', default=False, help='Disables Envirosky -- NOT RECOMMENDED')

parser.add_argument('--use_old_depth_buffer', action='store_true', default=False, help='Uses old depth buffer component')
parser.add_argument('--flycam', action='store_true', default=False, help='Spawns fly cam, controllable via simulator')
parser.add_argument('--nohead', action='store_true', default=False, help='Disables header outputs on log / record')

parser.add_argument('-T', '--queue_threshold', type=int, default=0, help='Defines a threshold to wait for simulator queue, if queue is higher, SDK will wait until it\'s lower than the threshold.')

parser.add_argument('--carsLimit', type=int, default=50, help='Spawn cars into scene, defaults to 100')
parser.add_argument('--propsLimit', type=int, default=250, help='Spawn props into scene, defaults to 250')
parser.add_argument('--signsLimit', type=int, default=250, help='Spawn signs into scene, defaults to 250')
parser.add_argument('--treesLimit', type=int, default=250, help='Spawn trees into scene, defaults to 250')
parser.add_argument('--backdropsLimit', type=int, default=50, help='Spawn backdrops into scene, defaults to 50')

parser.add_argument('--X_COMP', type=float, default=0, help='Spawner X Compensation, defaults to 0')
parser.add_argument('--Y_COMP', type=float, default=1, help='Spawner Y Compensation, defaults to 1')
parser.add_argument('--Z_COMP', type=float, default=0, help='Spawner Z Compensation, defaults to 0')

parser.add_argument('-v', '--version', action='store_true', default=False, help='Shows current SDK version, by explicitly combining with -i, --ip and / or -p, --port will also return the simulator version')

scripts_parser = parser.add_argument_group('Scripts specific options')
common.modulesArgs('scripts', parser=scripts_parser)

tools_parser = parser.add_argument_group('Tool specific options')
common.modulesArgs('tools', parser=tools_parser)

args = parser.parse_args()

settings = syncity.settings_manager.Singleton()
settings._start = time.time()
settings._tn = None

settings._version = SYNCITY_VERSION
settings._simulator_min_version = SIMULATOR_MIN_VERSION

settings._root = os.path.dirname(os.path.realpath(__file__))
settings._shutdown = False
settings._interactive = False

syncity.common.init()

stack = common.findArgOrder([
	{'id': 'run', 'args': ['-r', '--run']},
	{'id': 'script', 'args': ['-s', '--script']},
	{'id': 'tool', 'args': ['-t', '--tool']}
])

stack_size = len(stack)

for k in args.__dict__:
	# print('{}: {}'.format(k, args.__dict__[k]))
	settings[k] = args.__dict__[k]

settings._root = os.path.dirname(os.path.realpath(sys.argv[0]))

if settings.config != None:
	common.loadConfig()
if settings.options != None:
	common.loadOptions()
if platform.system() == 'Windows':
	if settings.local_path.find('/') != -1:
		if settings.local_path[-1:] != '/':
			settings.local_path = settings.local_path + '/'
	elif settings.local_path[-1:] != '\\':
		settings.local_path = settings.local_path + '\\'
else:
	if settings.local_path[-1:] != '/':
		settings.local_path = settings.local_path + '/'

if stack_size == 0 and settings.version == False:
	common.output('Nothing to run, aborting!', 'ERROR')
	sys.exit(0)
elif settings.version == True:
	if common.argExists(['-i', '--ip', '-p', '--port']) == True:
		syncity.common.initTelnet(settings.ip, settings.port)
	else:
		syncity.common.output('SDK Version: {}'.format(settings._version))
	sys.exit(0)

syncity.common.init2()

if settings.seed_py != None:
	random.seed(settings.seed_py)

# setup telnet connection
if settings.run != None or settings.script != None:
	if getattr(settings, "async"):
		common.output('Telnet mode set to ASYNCRONOUS')
		settings.force_sync = False
	else:
		common.output('Telnet mode set to SYNCRONOUS')
		settings.force_sync = True
	
	syncity.common.initTelnet(settings.ip, settings.port)
	
	if settings.reset:
		syncity.common.resetSimulator()
	
	syncity.common.flushBuffer()

idx = { 'run': 0, 'script': 0, 'tool': 0 }
ran = 1

for s in stack:
	common.output('[{}% {}/{}] Running stack: {}'.format(round(100 * (ran / stack_size), 2), ran, stack_size, s))
	
	if s == 'run':
		for subject in settings.run[idx['run']]:
			syncity.common.output('Running command line script {} {}...'.format(subject.name, syncity.common.md5(subject.name)))
			syncity.common.runCL(subject.name)
		
		idx['run'] += 1
	elif s == 'script':
		for subject in settings.script[idx['script']]:
			if subject[-3:] == '.py':
				subject = subject[:-3]
			
			syncity.common.output('Running python script: {} {}'.format(subject, syncity.common.md5('syncity/scripts/{}.py'.format(subject))))
			
			# track objects created by script to remove them from scene later on
			settings._obj = []
			settings._seqSave_i = 1
			
			# this should work with both python 2.7 and 3+
			import_script = __import__('syncity.scripts.{}'.format(subject), fromlist=['syncity.scripts'])
			
			if not settings.dry_run:
				try:
					mv = import_script.minVersion()
					if common.versionCompare(settings._simulator_version, mv, '<'):
						syncity.common.output('This script requires simulator newer than {}, you\'re running {}. Aborting!'.format(mv, settings._simulator_version), 'OBSOLETE')
						sys.exit(1)
				except:
					pass
				
				try:
					mv = import_script.maxVersion()
					if common.versionCompare(settings._simulator_version, mv, '>'):
						syncity.common.output('This script requires simulator older than {}, you\'re running {}. Aborting!'.format(mv, settings._simulator_version), 'OBSOLETE')
						sys.exit(1)
				except:
					pass
			
			import_script.run()
			common.flushBuffer()
		
		idx['script'] += 1
	elif s == 'tool':
		for subject in settings.tool[idx['tool']]:
			if subject[-3:] == '.py':
				subject = subject[:-3]
			
			syncity.common.output('Running tool: {} {}'.format(subject, syncity.common.md5('syncity/tools/{}.py'.format(subject))))
			
			import_tool = __import__('syncity.tools.{}'.format(subject), fromlist=['syncity.tools'])
			import_tool.run()
		
		idx['tool'] += 1
	else:
		raise 'Trying to run unknown stack type: {}'.format(s)
	
	ran += 1

common.output('Stack completed.')
