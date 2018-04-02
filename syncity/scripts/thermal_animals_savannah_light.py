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
	- Creates a RGB camera
	- Creates a Thermal camera
	- Creates a Depth camera
	- Creates a Segmentation camera
	- Spawns animals, people and cars with random distribution at savannah
	- Flys around as a drone, rotating height , distance and azimuth
	- Exports depth maps, rgb images, thermal images, segmentation images and bounding boxes
'''

def args(parser):
	parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/thermal', 'cameras/segmentation', 'cameras/depth']
	
	dist = 7000
	azimuth = 0
	elevation = 72
	y_rot = 0
	snapOffset = 60
	
	snapOffset_range = [ 55, 65 ]
	elevation_range = [ 32, 72 ]
	
	incr_e = -.25 # elevation increment
	incr_a = .5 # azimuth increment
	incr_d = -2.5 # distance increment
	incr_s = .5 # snap offset increment
	
	min_agc = 9
	max_agc = 35
	
	terrain_ambient_offset = 0
	terrain_ambient_bandwidth = 50
	terrain_ambient_median = 0
	
	if settings.skip_setup == False:
		# scenario goes first as it's the base for all objects to be placed upon
		common.sendData([
			'LOAD "Savannah" FROM "tile"',
			'"Savannah" ADD WindZone'
		])
		
		# camera setup
		helpers.globalCameraSetup(
			orbitOffset=[1667.05, 32.37876, 1000],
			orbitSnap=snapOffset,
			orbitGround='Savannah/Main Terrain'
		)
		
		helpers.addCameraSeg(
			width=1024, height=768, fov=90, clippingFar=10000,
			segments=['Car', 'Animal', 'Human'],
			lookupTable=[['Car', 'red'], ['Animal', 'blue'], ['Human', 'green'], ['ground', '#807C00FF']]
		)
		
		helpers.addCameraRGB(
			width=1024, height=768, pp='EnviroFX',
			fov=90,
			clippingFar=10000
		)
		
		helpers.addCameraDepth(width=1024, height=768, fov=90)
		
		common.sendData([
			'"Savannah" SET active true',
			'"Savannah" ADD Segmentation.ClassGroup',
			'"Savannah" SET Segmentation.ClassGroup itemsClassName "{}"'.format('ground'),
			'"Savannah" SET active false',
			'"Savannah/Main Terrain" SET Segmentation.ClassInfo itemClass "ground"',
			'"Savannah/Main Terrain/SubMeshes" ADD Segmentation.ClassInfo',
			'"Savannah/Main Terrain/SubMeshes" SET Segmentation.ClassInfo itemClass "ground"',
			'"Savannah" SET active true'
		])
		
		helpers.addCameraThermal(
			fov=90,
			clippingFar=10000,
			
			trees=True,
			ambientTemperature=15, minimumTemperature=9, maximumTemperature=35,
			treesBase=8, treesBandwidth=50, treesMedian=0, treesLeafsVariance=10,
		)
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		# spawn objects in a rectangular shape
		helpers.spawnRectangleGeneric(
			['+animal, +thermal, +savannah', '+carthermal', '+humans' ],
			names=['animals0', 'cars0', 'humans0'],
			segmentationClass=['Animal', 'Car', 'Human'],
			limit=50, a=1000, b=1000, position=[1685, 591, 7894],
			collisionCheck=True,
			stickToGround=True
		)
		
		# fine tune specifics
		common.sendData([
			'"Savannah/Main Terrain" SET Thermal.ThermalTerrain ambientOffset {}'.format(terrain_ambient_offset),
			'"Savannah/Main Terrain" SET Thermal.ThermalTerrain bandwidth {}'.format(terrain_ambient_bandwidth),
			'"Savannah/Main Terrain" SET Thermal.ThermalTerrain median {}'.format(terrain_ambient_median),
			
			# HACK: set profiles heatiness to high values so objects are visible
			'"spawner/cars0/RangeRover(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50',
			
			'"spawner/animals0/Rino(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 100',
			'"spawner/animals0/giraffe(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 75',
			'"spawner/animals0/Buffalo(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 100',
			'"spawner/animals0/Pelican(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 100',
			'"spawner/animals0/Flamingo(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 100',
			'"spawner/animals0/Vulture_Red(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 100',
			'"spawner/animals0/Vulture_White(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 100',
			'"spawner/animals0/Elef(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 90',
			
			# respawn assets to update thermal profiles properly
			'"spawner" SET active false',
			
			# add more props
			'"spawner/cars0" SET RandomProps.PropArea numberOfProps 50',
			'"spawner/animals0" SET RandomProps.PropArea numberOfProps 250',
			'"spawner/humans0" SET RandomProps.PropArea numberOfProps 250',
			
			'spawner SET active true'
		], read=False)
	
	# warm up
	helpers.doRender(mycams)
	
	if settings.setup_only == True:
		return
	
	loop = 0
	
	# loop changing camera positions with random agc bounduaries
	while loop < settings.loop_limit:
		common.sendData([
			'"cameras/thermal" SET Thermal.ThermalCamera temperatureRange ({} {})'.format(min_agc, max_agc),
			'"cameras" SET Orbit distance {}'.format(dist),
			'"cameras" SET Orbit elevation {}'.format(elevation),
			'"cameras" SET Orbit azimuth {}'.format(azimuth),
			'"cameras" SET Orbit snapOffset (0 {} 0)'.format(snapOffset)
		], read=False)
		
		helpers.takeSnapshot(mycams, autoSegment=True, forceNoop=True)
		
		# random agc values
		min_agc = randint(-3, 5)
		max_agc = randint(30, 35)
		
		snapOffset = snapOffset + incr_s
		elevation = elevation + incr_e
		azimuth += incr_a
		dist += incr_d
		
		if dist <= 6500 or dist >= 7000:
			incr_d = incr_d * -1
		if elevation >= elevation_range[1] or elevation <= elevation_range[0]:
			incr_e = incr_e * -1
		if snapOffset >= snapOffset_range[1] or snapOffset <= snapOffset_range[0]:
			incr_s = incr_s * -1
		if azimuth >= 360:
			azimuth = 0
		
		loop = loop + 1
		common.output('Loop {} ({}%)'.format(loop, round(100 * (settings.loop_limit / loop),2)))
