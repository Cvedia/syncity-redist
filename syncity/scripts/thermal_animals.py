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
		helpers.global_camera_setup()
		helpers.add_camera_rgb(width=4096, height=3072, pp='EnviroFX')
		helpers.add_camera_thermal(
			clipping_far=10000,
			
			trees=True,
			ambientTemperature=15, minimumTemperature=9, maximumTemperature=35,
			trees_base=8, trees_bandwidth=50, trees_median=0, trees_leafs_variance=10,
		)
		
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
		
		# helpers.spawn_radius_generic(['animal, +thermal'], limit=300, radius=50, innerradius=0, position=[0,0,0])
		helpers.spawn_radius_generic(['animal, +thermal'], limit=10, radius=50, innerradius=0, position=[0,0,0])
	
	common.send_data([
		'"cameras/cameraRGB" SET EnviroCamera enabled false',
		'"disk1/Cameras/camerargb" SET active true',
		'"cameras" SET active true',
		'"cameras/cameraRGB" SET active true'
	]);
	
	dist = 55
	azimuth = 0
	elevation = 6.95
	
	dist_a = 10 # azimuth increment
	ambient_temperature = 10
	
	while azimuth < 360:
		common.send_data([
			'"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature {}'.format(ambient_temperature),
			'"cameras" SET Orbit distance {}'.format(dist),
			'"cameras" SET Orbit elevation {}'.format(elevation),
			'"cameras" SET Orbit azimuth {}'.format(azimuth)
		])
		
		helpers.do_render(mycams)
		helpers.take_snapshot(mycams)
		ambient_temperature += 1
		
		if ambient_temperature > 30:
			ambient_temperature = 10
		
		azimuth += dist_a
