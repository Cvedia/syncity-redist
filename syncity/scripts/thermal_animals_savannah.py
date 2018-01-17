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
	- Spawns thermal animals
	- Rotates around
	- Saves images
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB']
	
	if settings.skip_setup == False:
		helpers.global_camera_setup()
		helpers.add_camera_rgb(
			width=4096, height=3072, pp=None, thermal=True, envirosky=False,
			thermal_ambientTemperature=-5, thermal_minimumTemperature=-15, thermal_maximumTemperature=30
		)
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
		
		common.send_data([
			'CREATE savannah tiles Savannah',
			'savannah SET active true',
			'cameras SET Transform position (2415.564 52.327 2493.392)',
			'cameras SET Transform eulerAngles (-1.582 -101.88 -0.004)'
		])
		
		# helpers.spawn_radius_generic(['animal, +thermal'], limit=300, radius=50, innerradius=0, position=[0,0,0])
		helpers.spawn_radius_generic(['+animal, +thermal'], collision_check=False, limit=60, radius=50, innerradius=0, position=[1852, 27.8, 2503], orbit=True)
	
	common.send_data([
		'disk1/Cameras/camerargb SET active true',
		'cameras SET active true',
		'cameras/cameraRGB SET Camera far 10000',
		'cameras/cameraRGB SET active true',
		# HACK
		'cameras/cameraRGB SET Sensors.RenderCamera enabled false',
		'cameras/cameraRGB SET Sensors.RenderCamera dumpToDisk True',
		'cameras/cameraRGB SET Sensors.RenderCamera dumpPath {}'.format(settings.output_path),
		'cameras/cameraRGB SET Sensors.RenderCamera enabled true'
	]);
	
	dist = 60
	azimuth = 0
	elevation = 8.45
	
	dist_a = 2.5 # azimuth increment
	ambient_temperature = -15
	
	while azimuth < 360:
		common.send_data([
			'cameras/cameraRGB SET Thermal.ThermalCamera ambientTemperature {}'.format(ambient_temperature),
			'cameras SET Orbit distance {}'.format(dist),
			'cameras SET Orbit elevation {}'.format(elevation),
			'cameras SET Orbit azimuth {}'.format(azimuth),
			'cameras/cameraRGB SET Camera enabled True',
			'cameras/cameraRGB EXECUTE Sensors.RenderCamera RenderFrame'
		])
		
		# helpers.do_render(mycams)
		# helpers.take_snapshot(mycams)
		ambient_temperature += 1
		
		if ambient_temperature > 30:
			ambient_temperature = -15
		
		azimuth += dist_a
