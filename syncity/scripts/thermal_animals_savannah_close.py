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
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/cameraDepth']
	
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
		common.send_data([
			'CREATE savannah tiles Savannah',
			'savannah ADD WindZone',
			'savannah SET active true'
		])
		
		helpers.spawn_rectangle_generic(
			['+animal, +thermal, +savannah', '+animal, +thermal, +savannah', '+animal, +thermal, +savannah'],
			names=['animals0', 'animals1', 'animals2'],
			
			collision_check=True,
			limit=100, a=100, b=100, position=[3193, 374.7158, 8161],
			
			segmentation_class="animals",
			stick_to_ground=True
		)
		
		helpers.global_camera_setup()
		
		helpers.add_camera_seg(width=1024, height=768)
		
		helpers.add_camera_rgb(
			width=1024, height=768, pp=None, thermal=True, envirosky=False, thermal_trees=True,
			thermal_ambientTemperature=15, thermal_minimumTemperature=9, thermal_maximumTemperature=35,
			thermal_trees_base=8, thermal_trees_bandwidth=50, thermal_trees_median=0, thermal_trees_leafs_variance=10,
			fov=90,
			clipping_far=10000
		)
		
		helpers.add_camera_depth(width=1024, height=768, fov=90, clipping_far=10000)
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
	
	# warm up
	helpers.do_render(mycams)
	
	common.send_data([
		'"savannah/Main Terrain" SET Thermal.ThermalTerrain ambientOffset {}'.format(terrain_ambient_offset),
		'"savannah/Main Terrain" SET Thermal.ThermalTerrain bandwidth {}'.format(terrain_ambient_bandwidth),
		'"savannah/Main Terrain" SET Thermal.ThermalTerrain median {}'.format(terrain_ambient_median),
		'cameras SET Transform position ({} {} {})'.format(3167, 265, 8160),
		'cameras SET Transform eulerAngles ({} {} {})'.format(13, 0, 0)
	], read=False)
	
	while y_rot < 360:
		common.send_data([
			'cameras/cameraRGB SET Thermal.ThermalCamera temperatureRange ({} {})'.format(min_agc, max_agc),
			'cameras SET Transform eulerAngles ({} {} {})'.format(x_rot, y_rot, z_rot)
		], read=False)
		
		helpers.take_snapshot(mycams, True)
		
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
		
