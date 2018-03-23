import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
POC Drone scene
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
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(width=4096, height=3072, pp='EnviroFX')
		helpers.addCameraSeg(segments=['Car'])
		helpers.globalDiskSetup()
		
		helpers.addDiskOutput(mycams)
		helpers.spawnDroneObjs()
	
	# reset camera
	common.sendData([
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {})'.format(0, 1, 0),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(-20, -45, 0),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(random.choice(helpers.weather_lst)),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format(random.choice(helpers.clouds_lst))
	])
	
	y = 24
	loop = 0
	reroll = 100
	
	while y < 160:
		if random.uniform(0,1) > .8:
			motionblur = 'true'
		else:
			motionblur = 'false'
		
		common.sendData([
			'"spawner/drones" SET Transform position ({} {} {})'.format(0, random.randint(2, 25), 0),
			'"spawner/drones" SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, 15), random.randint(0, 359), random.randint(-2, 2)),
			'"spawner/animals/birds" SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
			'"spawner/animals/birds" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/cars" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/city/nature" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/city/buildings" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"cameras" SET Transform eulerAngles ({} {} {})'.format(-20, y, 0),
			'"city" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(random.randint(8, 18)),
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur),
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount 1',
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending 0.004'
		])
		
		helpers.takeSnapshot(mycams, True)
		
		y = y + 1
		loop = loop + 1
		
		if loop % 10 == 0:
			common.sendData([
				'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(random.choice(helpers.weather_lst)),
				'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format(random.choice(helpers.clouds_lst)),
				'"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(random.uniform(-0.4, 0.1))
			])
		
		if loop == reroll:
			helpers.spawnDroneObjs(True)
			loop = 0
