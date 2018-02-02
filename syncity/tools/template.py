"""
This is a sample template module for tools.
"""

import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	"""
	Defines a description / help section shown for this script when running
	syncity.py with --help / -h parameter.
	
	This expects a string return
	"""
	return '''\
My tool description
	- blah
	- blah
	- blah
'''

def args(parser):
	"""
	If required, you can define specific command line configurables
	
	Those parameters will become available for `run()` as `settings.<name>`. Additionally
	all options set will also appear on --help / -h
	
	# Parameters
	
	parser (argparse)
	
	"""
	parser.add_argument('--hallo', help='Defines an arbitrary global parameter')

def run():
	"""
	Entry point function, aka `main`
	"""
	
	# do something
	return
