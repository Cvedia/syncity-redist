"""
Cleans any registry settings for the simulator.
Windows only.
"""
import subprocess
import platform
import time

from .. import common, settings_manager
# from subprocess import PIPE, run

settings = settings_manager.Singleton()

def help():
	return '''\
	Resets all registry settings for simulator (windows only)
'''

def run():
	if platform.system() == 'Windows':
		common.output('WARNING: This will delete syncity simulator windows registry data!', 'WARNING')
		common.output('Press CTRL+C to abort...', 'WARNING')
		
		time.sleep(5)
		
		if settings.shutdown == False:
			common.output('Running...')
			result = subprocess.run([
				'reg', 'delete', 'HKEY_CURRENT_USER\Software\Syncity', '/f'
			], stdout=PIPE, stderr=PIPE, universal_newlines=True)
			
			common.output('Return code: {}'.format(result.returncode))
			
			if len(result.stdout) > 0:
				common.output('Result: {}'.format(result.stdout))
			if len(result.stderr) > 0:
				common.output('Error: {}'.format(result.stderr))
			
			common.output('Completed')
	else:
		common.output('Error: this tool is windows only')
