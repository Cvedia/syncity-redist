"""
Cleans any registry settings for the simulator.
Windows only.
"""
import subprocess

from .. import common, settings_manager
from subprocess import call

settings = settings_manager.Singleton()

def help():
	return '''\
	Resets all registry settings for simulator (windows only)
'''

def run():
	common.output('Running...')
	call(['reg', 'delete', 'HKEY_CURRENT_USER\Software\Syncity', '/f'])
	common.output('Completed')
