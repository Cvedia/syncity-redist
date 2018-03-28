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
	
	dist = [ 260, 320 ]
	azimuth = 0
	elevation = 72
	z_pos = [ 8900, 2000 ]
	y_rot = 0
	snapOffset = 60
	
	snapOffset_range = [ 55, 65 ]
	elevation_range = [ 32, 72 ]
	
	incr_e = -.25 # elevation increment
	incr_a = .5 # azimuth increment
	incr_z = -2.5 # z_position increment
	incr_s = .5 # snap offset increment
	
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
		
		helpers.globalCameraSetup(
			orbitOffset=[1667.05, 32.37876, 1000],
			orbitSnap=snapOffset,
			orbitGround='Savannah/Main Terrain'
		)
		
		helpers.addCameraSeg(
			width=1024, height=768, fov=90, clippingFar=10000,
			segments=['Car', 'Animal'], lookupTable=[['Car', 'red'], ['Animal', 'blue']]
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
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		helpers.spawnRectangleGeneric(
			['+carthermal', '+animal, +thermal, +savannah', '+animal, +thermal, +savannah', '+animal, +thermal, +savannah' ,'+animal, +thermal, +savannah'],
			names=['cars0', 'animals0', 'animals1', 'animals2', 'animals3'],
			segmentationClass=['Car', 'Animal', 'Animal', 'Animal', 'Animal'],
			limit=50, a=5000, b=625, position=[2519, 591, 9630],
			
			collisionCheck=True,
			stickToGround=True
		)
		
		helpers.spawnRectangleGeneric(
			['+animal, +thermal, +savannah' ],
			names=['animalsF'],
			segmentationClass=['Animal'],
			limit=50, a=100, b=100, position=[1685, 591, 9856],
			
			collisionCheck=True,
			stickToGround=True
		)
		
		common.sendData([
			'"Savannah/Main Terrain" SET Thermal.ThermalTerrain ambientOffset {}'.format(terrain_ambient_offset),
			'"Savannah/Main Terrain" SET Thermal.ThermalTerrain bandwidth {}'.format(terrain_ambient_bandwidth),
			'"Savannah/Main Terrain" SET Thermal.ThermalTerrain median {}'.format(terrain_ambient_median),
			
			# set profiles heatiness
			'"spawner/cars0/RangeRover(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50',
			'"spawner/animals0/Rino(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50',
			'"spawner/animals0/giraffe(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 35',
			'"spawner/animals0/Buffalo(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50',
			'"spawner/animals0/Pelican(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50',
			'"spawner/animals0/Flamingo(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50',
			'"spawner/animals0/Vulture_Red(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50',
			'"spawner/animals0/Vulture_White(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50',
			'"spawner/animals0/Elef(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 40',
			
			# respawn them to update profiles properly
			'"spawner" SET active false',
			
			'"spawner/animals1" SET Transform position (2519 591 9005)',
			'"spawner/animals2" SET Transform position (2519 591 8380)',
			'"spawner/animals3" SET Transform position (2519 591 7755)',
			
			'"spawner" SET active true'
			
		], read=False)
	
	# warm up
	helpers.doRender(mycams)
	
	while dist > 0:
		common.sendData([
			'"cameras" SET Transform position.z {}'.format(z_pos),
			'"cameras/cameraRGB" SET Thermal.ThermalCamera temperatureRange ({} {})'.format(min_agc, max_agc),
			'"cameras" SET Orbit distance {} elevation {} azimuth {} snapOffset (0 {}~{} 0)'.format(dist, elevation, azimuth, snapOffset[0], snapOffset[1])
		], read=False)
		
		helpers.takeSnapshot(mycams, True)
		
		# random agc values
		min_agc = randint(-9, 2)
		max_agc = randint(25, 35)
		
		# snapOffset = snapOffset + incr_s
		elevation = elevation + incr_e
		azimuth += incr_a
		z_pos += incr_z
		
		if elevation >= elevation_range[1] or elevation <= elevation_range[0]:
			incr_e = incr_e * -1
		if snapOffset >= snapOffset_range[1] or snapOffset <= snapOffset_range[0]:
			incr_s = incr_s * -1
		if azimuth >= 360:
			azimuth = 0
