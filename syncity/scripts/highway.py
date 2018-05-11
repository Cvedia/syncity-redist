import random
import time
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Autodrive
	- Spawns autodrive track
	- Setups envirosky postprocessing filters
	- Creates a RGB camera on bumper
	- Creates a Segmentation map camera following RGB output
	- Creates a Depth map camera following RGB output
	- Setup segmentation classes
	- Setup lidar device
	- Setup multiple ROS2 ios for driving car
	- Setup ROS2 image output for each of the cameras
	- Exits leaving all objects exposed
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
		time.sleep(1)
