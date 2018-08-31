import random
import time
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Highway export
	- Generate data from a already setup scene by exporting all cameras
	
	This script is just an export loop, the scene setup is made on the .cl scripts,
	since the scene is static there's no need for logic in python.
'''

def args(parser):
	try:
		parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')
	except: pass

def run():
	loop = 0
	mycams = ['mainCar/cameras/Front', 'mainCar/cameras/Depth', 'mainCar/cameras/Segment', 'mainCar/cameras/mirrorL', 'mainCar/cameras/mirrorR']
	
	common.waitQueue()
	
	while loop < settings.loop_limit:
		helpers.takeSnapshot(mycams, autoSegment=False)
		loop += 1
		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
		common.sendData('SLEEP 1', read=True)
