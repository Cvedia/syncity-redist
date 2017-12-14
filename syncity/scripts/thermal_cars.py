import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Simple car thermal show off
	- Creates a RGB camera with thermal
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Orbits around from ground perspective looking at drones
	- Exports RGB images
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB']

	if settings.skip_setup == False:
		helpers.global_camera_setup()
		helpers.add_camera_rgb(width=4096, height=3072, audio=True, envirosky=True, thermal=True)
		helpers.add_camera_rgb_pp('EnviroFX', False)
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
		
		helpers.spawn_radius_generic(['tree'], collision_check=False, limit=50, radius=80, innerradius=30, position=[0,10,0])
		helpers.spawn_radius_generic(['sign'], limit=10, radius=35, innerradius=0, position=[0,10,0])
		helpers.spawn_radius_generic(['building'], limit=10, radius=335, innerradius=80, position=[0,10,0])
		helpers.spawn_radius_generic(['car, +thermal'], limit=10, radius=50, innerradius=0, segmentation_class="Car", orbit=True, position=[0,10,0])
		
		for i in range(0,9):
			helpers.spawn_radius_generic(['ground'], suffix='_{}'.format(i), limit=5, radius=50, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False)
	
	dist = -55
	azimuth = 30
	elevation = 75
	
	common.send_data([
		'cameras SET Orbit distance {}'.format(dist),
		'cameras SET Orbit elevation {}'.format(elevation),
		'cameras SET Orbit azimuth {}'.format(azimuth)
	])
		
	for weather in helpers.weather_lst:
		common.send_data('EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(weather))
		for hour in range(0, 23):
			common.send_data('EnviroSky SET EnviroSky GameTime.Hours {}'.format(hour))
			for minute in range(0, 5):
				common.send_data('EnviroSky SET EnviroSky GameTime.Minutes {}'.format(minute * 10))
				helpers.take_snapshot(mycams)
