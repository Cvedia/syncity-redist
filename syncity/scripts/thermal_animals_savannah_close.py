import random
import subprocess
import os
import pathlib
import time
from .. import common, helpers, settings_manager
from random import randint

settings = settings_manager.Singleton()

def help():
	return '''\
Animals thermal in Savannah scene
	- Creates a Thermal camera
	- Creates a Depth camera
	- Creates a Segmentation camera
	- Spawns animals with thermal on Savannah scene
	- Flys around as a drone, rotating height , distance and azimuth
	- Exports depth maps, thermal images, segmentation images and bounding boxes
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/depth']
	
	# dist = 8900
	# azimuth = 0
	# elevation = 72
	
	y_rot = 0
	z_rot = -5
	x_rot = 36
	
	x_range = [ 36, 45 ]
	z_range = [ -5, 5 ]
	
	incr_x = .5
	incr_z = .5
	incr_y = .5
	
	min_agc = 9
	max_agc = 35
	
	terrain_ambient_offset = 0
	terrain_ambient_bandwidth = 50
	terrain_ambient_median = 0
	
	if settings.skip_setup == False:
		common.sendData([
			'LOAD "Savannah" FROM "tile"',
			'"Savannah" ADD WindZone',
			'"Savannah" SET active true'
		])
		
		helpers.globalCameraSetup()
		
		helpers.addCameraSeg(
			width=1024, height=768, fov=90, clippingFar=10000,
			segments=['Animal'], lookupTable=[['Animal', 'blue']]
		)
		
		helpers.addCameraRGB(
			width=1024, height=768, pp='EnviroFX',
			fov=90,
			clippingFar=10000
		)

		helpers.addCameraThermal(
			fov=90,
			clippingFar=10000,
			
			trees=True,
			ambientTemperature=15, minimumTemperature=9, maximumTemperature=35,
			treesBase=8, treesBandwidth=50, treesMedian=0, treesLeafsVariance=10,
		)
		
		helpers.addCameraDepth(width=1024, height=768, fov=90)
		helpers.spawnRectangleGeneric(
			['+animal, +thermal', '+animal, +thermal', '+animal, +thermal'],
			names=['animals0', 'animals1', 'animals2'],
			
			collisionCheck=True,
			limit=100, a=100, b=100, position=[3193, 374.7158, 8161],
			segmentationClass=['Animal', 'Animal', 'Animal'],
			stickToGround=True
		)
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
	
	# warm up
	helpers.doRender(mycams)
	
	common.sendData([
		'"Savannah/Main Terrain" SET Thermal.ThermalTerrain ambientOffset {}'.format(terrain_ambient_offset),
		'"Savannah/Main Terrain" SET Thermal.ThermalTerrain bandwidth {}'.format(terrain_ambient_bandwidth),
		'"Savannah/Main Terrain" SET Thermal.ThermalTerrain median {}'.format(terrain_ambient_median),
		'"cameras" SET Transform position ({} {} {})'.format(3167, 265, 8160),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(13, 0, 0)
	], read=False)
	
	if settings.setup_only:
		return
	
	while y_rot < 360:
		common.sendData([
			'"cameras/cameraRGB" SET Thermal.ThermalCamera temperatureRange ({} {})'.format(min_agc, max_agc),
			'"cameras" SET Transform eulerAngles ({} {} {})'.format(x_rot, y_rot, z_rot)
		], read=False)
		
		helpers.takeSnapshot(mycams, True)
		
		# random agc values
		min_agc = randint(-9, 2)
		max_agc = randint(25, 35)
		
		x_rot += incr_x
		y_rot += incr_y
		z_rot += incr_z
		
		if x_rot >= x_range[1] or x_rot <= x_range[0]:
			incr_x = incr_x * -1
		if z_rot >= z_range[1] or z_rot <= z_range[0]:
			incr_z = incr_z * -1
		
