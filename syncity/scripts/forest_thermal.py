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
	
	# start / current position
	# position = [ 1487.321, 297.3508, 6836.579 ]
	position = [ 1600, 246, 6829 ]
	rotation = [ 31.971, 60.161, 0 ]
	
	# limits
	# position_bounduaries = [ [ 1533.402, 232.6935, 6841.968 ], [ 989.1672, 297.3509, 6529.784 ] ]
	position_bounduaries = [ [ 1683, 240, 6983 ], [ 1600, 246, 6829 ] ]
	rotation_bounduaries = [ [ 25, 45, 0 ], [ 60, 70, 0 ] ] # 25 - 60 pitch angle , 45 to 70 degree side-to-side
	
	# increment settings per loop for X, Y, Z
	position_incr = [ .25, .0125, .025 ]
	rotation_incr = [ .75, .55, 0 ]
	
	min_agc = 9
	max_agc = 35
	
	if settings.skip_setup == False:
		# load forest scene
		common.send_data([
			'LOAD "Forest" FROM "tile"',
			'"Forest" SET active false',
			'"Forest" ADD Segmentation.ClassInfo',
			'"Forest" SET Segmentation.ClassInfo itemClass "{}"'.format('ground'),
			'"Forest" ADD Segmentation.ClassGroup',
			'"Forest" SET Segmentation.ClassGroup itemsClassName "{}"'.format('ground'),
			'"Forest" SET Segmentation.ClassInfo itemClass "ground"'
		])
		
		helpers.add_thermal_terrain(
			target='Forest',
			ambient_offset=0,
			bandwidth=-15.88,
			median=0.094
		)
		
		# camera setup
		helpers.global_camera_setup(position=position, rotation=rotation, flycam=True)
		
		helpers.add_camera_seg(
			width=1024, height=768, fov=90, clipping_far=10000,
			segments=['Human'],
			lookupTable=[['Human', 'green'], ['ground', '#520000FF']]
		)
		
		helpers.add_camera_rgb(
			width=1024, height=768, pp='EnviroFX',
			fov=90,
			clipping_far=10000,
			audio=False
		)
		
		helpers.add_camera_depth(width=1024, height=768, fov=90)
		helpers.add_windzone(target='Forest', main=.12, turbulence=.5)
		
		common.send_data('"Forest" SET active true')
		
		helpers.add_camera_thermal(
			width=1024, height=768, fov=90,
			clipping_far=10000,
			
			trees=True,
			ambientTemperature=4.3, minimumTemperature=4.5, maximumTemperature=35,
			trees_base=6.41, trees_bandwidth=50, trees_median=.18, trees_leafs_variance=10
		)
		
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
		
		helpers.human_spawner(
			goals=[[1696.21069, 215.3, 7000]],
			spawners=[[1723.81311, 213.312, 6838.701], [1655.723, 211.563, 6797.911], [1528.34314, 219.4655, 7124.911]],
			delay=[.01, .3], speed=[.5, 5], limit=50,
			require_thermal_clothing=True
		)
		
		helpers.add_thermal_profile_override(
			target='spawner/human_walker/container',
			heatiness_mode='Absolute',
			heatiness_value=60
		)
	
	# warm up
	helpers.do_render(mycams)
	
	if settings.setup_only == True:
		return
	
	loop = 0
	
	# loop changing camera positions with random agc bounduaries
	while loop < settings.loop_limit:
		common.send_data([
			# '"cameras/thermal" SET Thermal.ThermalCamera temperatureRange ({} {})'.format(min_agc, max_agc),
			'"cameras" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(
				position[0], position[1], position[2],
				rotation[0], rotation[1], rotation[2]
			)
		])
		
		helpers.take_snapshot(mycams, auto_segment=True, force_noop=True)
		
		# random agc values
		min_agc = randint(-3, 5)
		max_agc = randint(30, 35)
		
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
