"""
Cleans any AppData related to the simulator
Windows only.
"""
import shutil
import platform
import os

from .. import common, settings_manager

def help():
	return '''\
	Cleans any AppData related to the simulator
'''

def run():
	if platform.system() == 'Windows':
		appdata = '{}Low\\Syncity'.format(os.getenv('LOCALAPPDATA'))
		common.output('Deleting AppData ({}) for Syncity...'.format(appdata))
		
		# rmtree will return exceptions on nested folders because it doesn't know
		# the order to delete, so we will try 10 times, this should be enough to
		# clear all data ... 
		if os.path.isdir(appdata) == True:
			i = 0
			while i < 10:
				i += 1
				
				try:
					shutil.rmtree(appdata)
				except:
					common.output('...')
			
			if os.path.isdir(appdata) == True:
				common.output('ERROR: Failed deleting {}, maybe you should run this terminal as administrator?'.format(appdata))
		else:
			common.output('AppData not found / already clean')
		
		common.output('Completed')
	else:
		common.output('Error: this tool is windows only')
