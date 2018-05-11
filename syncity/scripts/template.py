"""
This is a sample template module for scripts.
"""

import random
import json
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	"""
	Defines a description / help section shown for this script when running
	syncity.py with --help / -h parameter.
	
	This expects a string return
	"""
	return '''\
My script description
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
	
	# keeps created objects on scene after exit
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		# basic camera setup
		helpers.globalCameraSetup()
		# creates a camera with envirofx postprocessing
		helpers.addCameraRGB(pp='EnviroFX')
		# creates a segmentation camera
		helpers.addCameraSeg(segments=['Car'])
		# disk output setup
		helpers.globalDiskSetup()
		# binds cameras to disk output
		helpers.addDiskOutput(mycams)
		
		# spawn something, ideally you'd have this methods within this script instead of placing them on helpers
		helpers.spawnParkingLot(settings.carsLimit)
	
	# get position of the car in the center
	x = common.sendData('"cars/car_{}" GET Transform position'.format(int(settings.carsLimit / 2)))
	
	# this will return OK and a LIST, which we will parse as JSON to use as center of our spawning point
	pos = json.loads(x[1])
	
	# spawn some random props around cars
	helpers.spawnRadiusGeneric(types=['city/buildings', 'city/props', 'city/signs'], position=pos, limit=100, radius=100, innerradius=50)
	
	# center camera an point down 20 degrees
	common.sendData([
		'"cameras" SET Transform position (-10 10 -100)',
		'"cameras" SET Transform eulerAngles (20 0 0)'
	])
	
	# force a render to visualize on the ui
	helpers.doRender(mycams)
	
	# make sure there's nothing waiting on queue before processing into loop
	common.waitQueue()
	
	loop = 0
	
	# loop changing camera positions with random agc bounduaries
	while loop < settings.loop_limit:
		helpers.takeSnapshot(mycams, autoSegment=True)
		
		# do something
		
		loop += 1
		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
