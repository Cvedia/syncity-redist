import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
POC Drone time lapse scene
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Orbits around from ground perspective looking at drones
	- Exports segmentation map bounding boxes
	- Exports RGB images
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB']
	
	if settings.skip_setup == False:
		helpers.global_camera_setup()
		helpers.add_camera_rgb(width=4096, height=3072, pp='EnviroFX')
		helpers.global_disk_setup()
		
		helpers.add_disk_output(mycams)
		helpers.spawn_drone_objs(cars_limit=[50,100],trees_limit=[250,300],birds_limit=[200,250],buildings_limit=[100,150])
	
	# reset camera
	common.send_data([
		'cameras/cameraRGB SET Camera enabled true',
		'cameras SET Transform position ({} {} {})'.format(0, 1, 0),
		'cameras SET Transform eulerAngles ({} {} {})'.format(-20, -45, 0),
		'EnviroSky SET EnviroSky cloudsMode {}'.format('Volume')
	])
	
	y = 24
	y_slow = 0
	loop = 0
	hour = 8
	minute = 0
	second = 0
	c = 0
	direction = True
	
	while hour < 19:
		common.send_data([
			'spawner/drones SET Transform position ({} {} {})'.format(0, random.randint(2, 25), 0),
			'spawner/drones SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, 15), random.randint(0, 359), random.randint(-2, 2)),
			# 'spawner/drones/white SET Transform position ({} {} {})'.format(0, random.randint(2, 25), 0),
			# 'spawner/drones/white SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, 15), random.randint(0, 359), random.randint(-2, 2)),
			'spawner/animals/birds SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
			'spawner/animals/birds SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			# 'spawner/cars SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'spawner/cars SET Transform eulerAngles ({} {} {})'.format(0, -y_slow * 8, 0),
			'spawner/city/nature SET Transform eulerAngles ({} {} {})'.format(0, y_slow, 0),
			# 'spawner/city/buildings SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			# 'cameras SET Transform eulerAngles ({} {} {})'.format(-20, y, 0),
			# 'city SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'EnviroSky SET EnviroSky GameTime.Hours {}'.format(hour),
			'EnviroSky SET EnviroSky GameTime.Minutes {}'.format(minute),
			'EnviroSky SET EnviroSky GameTime.Seconds {}'.format(second)
		])
		
		helpers.take_snapshot(mycams)
		
		y_slow = y_slow + .1
		if direction == True:
			y = y + 1
		else:
			y = y - 1
		loop = loop + 1
		second = second + 30
		
		if y >= 160:
			direction = False
		elif y <= 24:
			direction = True
		
		if second >= 60:
			minute = minute + 1
			second = 0
		if minute >= 60:
			minute = 0
			hour = hour + 1
		
		if loop % 30 == 0:
			common.send_data([
				'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[c]),
			])
			c = c + 1
			if c > 7:
				c = 0
