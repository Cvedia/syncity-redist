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
		helpers.globalCameraSetup()
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.globalDiskSetup()
		
		helpers.addDiskOutput(mycams)
		helpers.spawnDroneObjs(carsLimit=[50,100],treesLimit=[250,300],birdsLimit=[200,250],buildingsLimit=[100,150])
	
	pY = 1
	pY_direction = True
	pZ = -16
	pZ_direction = True
	
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
	common.sendData([
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {})'.format(0, pY, pZ),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, 0),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format('Volume'),
		'"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04)
	])
	
	if settings.setup_only:
		return
	
	while hour < 19:
		common.sendData([
			'"spawner/drones" SET Transform position ({} {} {})'.format(0, random.randint(2, 25), 0),
			'"spawner/drones" SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, 15), random.randint(0, 359), random.randint(-2, 2)),
			'"spawner/animals/birds" SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
			'"spawner/animals/birds" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/cars" SET Transform eulerAngles ({} {} {})'.format(0, -y_slow * 8, 0),
			'"spawner/city/nature" SET Transform eulerAngles ({} {} {})'.format(0, y_slow, 0),
			'"cameras" SET Transform position ({} {} {})'.format(0, pY, pZ),
			'"cameras" SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, 0),
			'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(hour),
			'"EnviroSky" SET EnviroSky GameTime.Minutes {}'.format(minute),
			'"EnviroSky" SET EnviroSky GameTime.Seconds {}'.format(second)
		], read=False)
		
		helpers.takeSnapshot(mycams)
		
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
		
		if pY_direction == True:
			pY = pY + random.uniform(.1, .75)
		else:
			pY = pY - random.uniform(.1, .75)
		
		if pY >= 30:
			pY_direction = False
		elif pY <= 1:
			pY_direction = True
		
		if pZ_direction == True:
			pZ = pZ + random.uniform(.1, .75)
		else:
			pZ = pZ - random.uniform(.1, .75)
		
		if pZ >= 16:
			pZ_direction = False
		elif pZ <= -16:
			pZ_direction = True
		
		a_x = (pY * 2.667) -20 # -20 -> 60 depending on Y
		
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
			common.sendData([
				'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[c])
			], read=False)
			c = c + 1
			if c > 7:
				c = 0
