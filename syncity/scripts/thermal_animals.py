import random
import subprocess
import os
import pathlib
import time
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Animals thermal
	- Creates a Thermal camera
	- Spawns thermal animals
	- Rotates around
	- Saves images
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/thermal']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.addCameraThermal(
			clippingFar=10000,
			
			trees=True,
			ambientTemperature=15, minimumTemperature=9, maximumTemperature=35,
			treesBase=8, treesBandwidth=50, treesMedian=0, treesLeafsVariance=10,
		)
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		# helpers.spawnRadiusGeneric(['animal, +thermal'], limit=300, radius=50, innerradius=0, position=[0,0,0])
		helpers.spawnRadiusGeneric(['animal, +thermal'], limit=10, radius=50, innerradius=0, position=[0,0,0])
	
	common.sendData([
		'"cameras/cameraRGB" SET EnviroCamera enabled false',
		'"disk1/Cameras/camerargb" SET active true',
		'"cameras" SET active true',
		'"cameras/cameraRGB" SET active true'
	]);
	
	common.waitQueue()
	
	dist = 55
	azimuth = 0
	elevation = 6.95
	
	dist_a = 10 # azimuth increment
	ambient_temperature = 10
	
	while azimuth < 360:
		common.sendData([
			'"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature {}'.format(ambient_temperature),
			'"cameras" SET Orbit distance {}'.format(dist),
			'"cameras" SET Orbit elevation {}'.format(elevation),
			'"cameras" SET Orbit azimuth {}'.format(azimuth)
		])
		
		helpers.doRender(mycams)
		helpers.takeSnapshot(mycams)
		ambient_temperature += 1
		
		if ambient_temperature > 30:
			ambient_temperature = 10
		
		azimuth += dist_a
