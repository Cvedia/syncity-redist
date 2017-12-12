import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

# if you want to show a description on --help section
def help():
	return '''\
My tool description
	- blah
	- blah
	- blah
'''

# if you need to collect configurables from command line, you can define them
# here, they will be later available for run() as settings.<name> ; those options
# will also be shown on --help
def args(parser):
	parser.add_argument('--hallo', help='Defines an arbitrary global parameter')

# this is called when everything is ready to start
def run():
	# do something
	return
