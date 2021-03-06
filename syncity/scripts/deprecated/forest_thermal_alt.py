import subprocess
import os
import pathlib
import time
from .. import common, helpers, settings_manager
from random import randint

settings = settings_manager.Singleton()

def help():
	return '''\
Human walker at forest
	- Creates a RGB camera
	- Creates a Thermal camera
	- Creates a Depth camera
	- Creates a Segmentation camera
	- Creates a human walker spawner, this will create random body, random gender and random acessorized humans walking from a starting point to a goal
	- Disable scenario's trees and spawn random trees around the area humans will walk; Those trees are segmented and include a thermal signature.
	- Flys around as a drone, rotating height , distance and azimuth
	- Randomizes camera AGC min/max using API
	- Exports depth maps, rgb images, thermal images, segmentation images and bounding boxes
'''

def args(parser):
	parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/thermal', 'cameras/segmentation', 'cameras/depth']
	
	# start / current position
	position = [ 1600, 246, 6829 ]
	rotation = [ 31.971, 60.161, 0 ]
	
	# limits [ [ min ] , [ max ] ]
	position_bounduaries = [ [ 1600, 225, 6829 ], [ 1683, 246, 6990 ] ]
	rotation_bounduaries = [ [ 25, 45, 0 ], [ 60, 70, 0 ] ] # 25 - 60 pitch angle , 45 to 70 degree side-to-side
	
	# increment settings per loop for X, Y, Z
	position_incr = [ .25, .0125, .025 ]
	rotation_incr = [ .75, .55, 0 ]
	
	if settings.skip_setup == False:
		# load forest scene
		common.sendData([
			'LOAD "Forest" FROM "tile"',
			'"Forest" SET active false',
			'"Forest" ADD Segmentation.ClassInfo',
			'"Forest" SET Segmentation.ClassInfo itemClass "{}"'.format('ground'),
			'"Forest" ADD Segmentation.ClassGroup',
			'"Forest" SET Segmentation.ClassGroup itemsClassName "{}"'.format('ground'),
			'"Forest" SET Segmentation.ClassInfo itemClass "ground"',
			# disable trees
			'"Forest" SET Terrain drawTreesAndFoliage false'
		])
		
		helpers.addThermalTerrain(
			target='Forest',
			ambientOffset=0,
			bandwidth=-15.88,
			median=0.094
		)
		
		# camera setup
		helpers.globalCameraSetup(position=position, rotation=rotation, flycam=True)
		
		helpers.addCameraSeg(
			width=1024, height=768, fov=90, clippingFar=10000,
			segments=['Human'],
			lookupTable=[['Human', 'green'], ['Tree', 'blue'], ['ground', '#520000FF']]
		)
		
		helpers.addCameraRGB(
			width=1024, height=768, pp='EnviroFX',
			fov=90,
			clippingFar=10000,
			audio=False
		)
		
		helpers.addCameraDepth(width=1024, height=768, fov=90)
		helpers.addWindzone(target='Forest', main=.12, turbulence=.5)
		
		common.sendData('"Forest" SET active true')
		
		# spawn trees
		helpers.spawner(
			['trees'],
			tags=['tree'],
			stickToGround=True,
			collisionCheck=True,
			limit=[800, 1200],
			method='Torus',
			methodParameters={
				'innerRadius': 0,
				'radius': 450
			},
			segmentationClass='Tree',
			position=[1843, 245, 6950],
			thermalObjectBehaviour={
				'temperature.value': 6.4,
				'temperature.bandwidth': 2.3,
				'temperature.median': 0.3,
				'ambientOffset.value': 0,
				'heatiness.value': 0,
				'reflectivity.value': 0.2,
				'variance.value': 30
			}
		)
		
		helpers.addCameraThermal(
			width=1024, height=768, fov=90,
			clippingFar=10000,
			
			trees=True,
			ambientTemperature=4.3, minimumTemperature=4.5, maximumTemperature=35,
			treesBase=6.41, treesBandwidth=50, treesMedian=.18, treesLeafsVariance=10
		)
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		helpers.humanWalkerSpawner(
			goals=[[1696.21069, 215.3, 7000]],
			spawners=[[1723.81311, 213.312, 6838.701], [1655.723, 211.563, 6797.911], [1528.34314, 219.4655, 7124.911]],
			delay=[.01, .3], speed=[.5, 5], limit=50,
			requireThermalClothing=True
		)
		
		helpers.addThermalProfileOverride(
			target='spawner/human_walker/container',
			heatinessMode='Absolute',
			heatinessValue=80
		)
	
	# warm up
	helpers.doRender(mycams)
	
	if settings.setup_only == True:
		return
	
	loop = 0
	
	# temporary workaround for thermalObjectBehaviour
	common.sendData('"cameras/thermal" SET Sensors.RenderCamera alwaysOn true', read=True)
	
	# loop changing camera positions with random agc bounduaries
	while loop < settings.loop_limit:
		common.sendData([
			'"cameras/thermal" SET Thermal.ThermalCamera temperatureRange ({}~{} {}~{})'.format(-3, 5, 30, 35),
			'"cameras" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(
				position[0], position[1], position[2],
				rotation[0], rotation[1], rotation[2]
			)
		])
		
		helpers.takeSnapshot(mycams, autoSegment=True, forceNoop=True)
		
		# increments
		for k, v in enumerate(position_incr):
			position[k] += v
			
			if position[k] > position_bounduaries[1][k] or position[k] < position_bounduaries[0][k]:
				position_incr[k] = position_incr[k] * -1
		for k, v in enumerate(rotation_incr):
			rotation[k] += v
			
			if rotation[k] > rotation_bounduaries[1][k] or rotation[k] < rotation_bounduaries[0][k]:
				rotation_incr[k] = rotation_incr[k] * -1
		
		loop = loop + 1
		common.output('Loop {} ({}%)'.format(loop, round(100 * (settings.loop_limit / loop),2)))
