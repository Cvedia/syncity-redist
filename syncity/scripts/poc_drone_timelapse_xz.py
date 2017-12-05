import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
POC Drone time lapse scene, drone flying and landing randomness
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Goes up and down with a fixed camera X angle going from -20 to 60 depending on the Y position
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
	
	p_y = 1
	p_y_direction = True
	p_z = -16
	p_z_direction = True
	
	a_y = -45
	a_y_direction = True
	a_x = -20
	
	y_slow = 0
	loop = 0
	hour = 8
	minute = 0
	second = 0
	c = 0
	
	# reset camera
	common.send_data([
		'cameras/cameraRGB SET Camera enabled true',
		'cameras SET Transform position ({} {} {})'.format(0, p_y, p_z),
		'cameras SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, 0),
		'EnviroSky SET EnviroSky cloudsMode {}'.format('Volume'),
		'EnviroSky SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04)
	])
	
	while hour < 19:
		common.send_data([
			'spawner/drones SET Transform position ({} {} {})'.format(0, random.randint(2, 25), 0),
			'spawner/drones SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, 15), random.randint(0, 359), random.randint(-2, 2)),
			'spawner/animals/birds SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
			'spawner/animals/birds SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'spawner/cars SET Transform eulerAngles ({} {} {})'.format(0, -y_slow * 8, 0),
			'spawner/city/nature SET Transform eulerAngles ({} {} {})'.format(0, y_slow, 0),
			'cameras SET Transform position ({} {} {})'.format(0, p_y, p_z),
			'cameras SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, 0),
			'EnviroSky SET EnviroSky GameTime.Hours {}'.format(hour),
			'EnviroSky SET EnviroSky GameTime.Minutes {}'.format(minute),
			'EnviroSky SET EnviroSky GameTime.Seconds {}'.format(second)
		], read=False)
		
		helpers.take_snapshot(mycams)
		
		y_slow = y_slow + .1
		
		# angles
		if a_y_direction == True:
			a_y = a_y + random.uniform(.5, 1.75)
		else:
			a_y = a_y - random.uniform(.5, 1.75)
		
		if a_y >= 160:
			a_y_direction = False
		elif a_y <= -45:
			a_y_direction = True
		
		if p_y_direction == True:
			p_y = p_y + random.uniform(.1, .75)
		else:
			p_y = p_y - random.uniform(.1, .75)
		
		if p_y >= 30:
			p_y_direction = False
		elif p_y <= 1:
			p_y_direction = True
		
		if p_z_direction == True:
			p_z = p_z + random.uniform(.1, .75)
		else:
			p_z = p_z - random.uniform(.1, .75)
		
		if p_z >= 16:
			p_z_direction = False
		elif p_z <= -16:
			p_z_direction = True
		
		a_x = (p_y * 2.667) -20 # -20 -> 60 depending on Y
		
		# time
		second = second + 30
		
		if second >= 60:
			minute = minute + 1
			second = 0
		if minute >= 60:
			minute = 0
			hour = hour + 1
		
		loop = loop + 1
		
		if loop % 30 == 0:
			common.send_data([
				'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[c])
			], read=False)
			c = c + 1
			if c > 7:
				c = 0
