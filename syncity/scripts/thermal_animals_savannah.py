import random
import subprocess
import os
import pathlib
import time
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Animals thermal in Savannah scene
	- Creates a Thermal camera
	- Creates a Depth camera
	- Spawns animals with thermal on Savannah scene
	- Flys around as a drone, rotating planes
	- Saves images
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/cameraDepth']
	
	if settings.skip_setup == False:
		helpers.global_camera_setup(orbitOffset=[1667.05, 32.37876, 2561.789])
		helpers.add_camera_rgb(
			width=1024, height=768, pp=None, thermal=True, envirosky=False, thermal_trees=True,
			thermal_ambientTemperature=-5, thermal_minimumTemperature=-15, thermal_maximumTemperature=30,
			fov=90,
			clipping_far=10000
		)
		helpers.add_camera_depth(width=1024, height=768, fov=90)
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
		
		common.send_data([
			'CREATE savannah tiles Savannah',
			'savannah SET active true',
		])
		
		helpers.spawn_radius_generic(
			['+animal, +thermal'],
			collision_check=True,
			limit=60, radius=50, innerradius=0, position=[1667.05, 32.37876, 2561.789],
			stick_to_ground=True
		)
	
	dist = 80
	azimuth = 0
	elevation = 39.2
	y_rot = 0
	dist_a = 2.5 # azimuth increment
	ambient_temperature = -15
	
	helpers.do_render(mycams)
	
	while azimuth < 360:
		common.send_data([
			'cameras/cameraRGB SET Thermal.ThermalCamera ambientTemperature {}'.format(ambient_temperature),
			'cameras SET Orbit distance {}'.format(dist),
			'cameras SET Orbit elevation {}'.format(elevation),
			'cameras SET Orbit azimuth {}'.format(azimuth),
			'spawner/_animal___thermal SET Transform eulerAngles (0 {} 0)'.format(y_rot)
		])
		
		helpers.take_snapshot(mycams)
		ambient_temperature += 1
		
		if ambient_temperature > 30:
			ambient_temperature = -15
		
		azimuth += dist_a
		y_rot += 5
