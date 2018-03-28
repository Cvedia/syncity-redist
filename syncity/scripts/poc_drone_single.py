import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

# use lite drone packages
# helpers.drones_lst = helpers.drones_lite_lst

def help():
	return '''\
POC Drone single scene
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
		helpers.globalCameraSetup(orbit=False)
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.addCameraSeg(segments=['drone0', 'drone1', 'drone2'], lookupTable=[['drone0', 'red'], ['drone1','blue'], ['drone2', 'green']])
		helpers.globalDiskSetup()
		
		helpers.addDiskOutput(mycams)
		helpers.spawnDroneObjs(dronesLimit=[0,0], buildingsInnerRadius=300, treesInnerRadius=60, treesRadius=100, buildingsLimit=[50,80])
		
		# single drone
		'''
		helpers.addCameraSegFilter(['drone'])
		common.sendData([
			'CREATE drone/drone0/drone0 "{}"'.format(random.choice(helpers.drones_lst)),
			'drone/drone0 ADD Segmentation.ClassGroup',
			'drone/drone0 SET Segmentation.ClassGroup itemsClassName Drone'
		], read=False)
		'''
		
		common.sendData([
			'CREATE "{}" FROM "drones" AS "drone/drone0/drone0"'.format(helpers.drones_lst[6]), # Drones/DJI Phantom 4 Pro/DJI_Phantom_4_Pro
			'"drone/drone0" ADD Segmentation.ClassGroup',
			'"drone/drone0" SET active false',
			'"drone/drone0" SET Segmentation.ClassGroup itemsClassName "drone0"',
			'"drone/drone0/drone0" SET Transform position ({} {} {})'.format(0, 1, 0),
			'"drone/drone0" SET active true',
			'"drone/drone0/drone0" SET active true',
			
			'CREATE "{}" FROM "drones" AS "drone/drone1/drone1"'.format(helpers.drones_lst[4]), # Drones/DJI S1000/DJI S1000
			'"drone/drone1" ADD Segmentation.ClassGroup',
			'"drone/drone1" SET active false',
			'"drone/drone1" SET Segmentation.ClassGroup itemsClassName "drone1"',
			'"drone/drone1/drone1" SET Transform position ({} {} {})'.format(0, 1.5, 0),
			'"drone/drone1" SET active true',
			'"drone/drone1/drone1" SET active true',
			
			'CREATE "{}" FROM "drones" AS "drone/drone2/drone2"'.format(helpers.drones_lst[7]), # Drones/Parrot Disco/Parrot Disco
			'"drone/drone2" ADD Segmentation.ClassGroup',
			'"drone/drone2" SET active false',
			'"drone/drone2" SET Segmentation.ClassGroup itemsClassName "drone2"',
			'"drone/drone2/drone2" SET Transform position ({} {} {})'.format(0, 2, 0),
			'"drone/drone2" SET active true',
			'"drone/drone2/drone2" SET active true',
		], read=False)
	
	pX_r = [-3, 3]
	pY_r = [1.5, 8]
	pZ_r = [3, 9]
	
	pX = pX_r[0]
	pY = pY_r[0]
	pZ = pZ_r[0]
	
	pX_d = 1
	pY_d = 1
	pZ_d = 1
	
	# reset camera
	common.sendData([
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 1, 0, -20, 0, 0),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1]),
		'"EnviroSky" SET EnviroSky cloudsMode "{}" cloudsSettings.globalCloudCoverage {}'.format(helpers.clouds_lst[2], -0.04),
		'"drone" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(pX, pY, pZ, 0, 0, 0),
		
		'"spawner/cars" SET active False',
		'"spawner/cars" ADD RandomProps.SpawnerRandomizers.RandomColor',
		'"spawner/cars" PUSH RandomProps.SpawnerRandomizers.RandomColor availableColors "Red" "Yellow"',
		'"spawner/cars" SET active True',
		
		# disable blooming effects
		'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false',
	], read=False)
	
	common.flushBuffer()
	loop = 0
	
	while loop < 100:
		if random.uniform(0,1) > .9:
			motionblur = 'true'
		else:
			motionblur = 'false'
		
		pX = pX + (random.uniform(.05, .75) * pX_d)
		pY = pY + (random.uniform(.01, .95) * pY_d)
		pZ = pZ + (random.uniform(.25, .75) * pZ_d)
		
		if pX_d == 1 and pX > pX_r[1]:
			pX_d = -1
		elif pX_d == -1 and pX < pX_r[0]:
			pX_d = 1
			
		if pY_d == 1 and pY > pY_r[1]:
			pY_d = -1
		elif pY_d == -1 and pY < pY_r[0]:
			pY_d = 1
		
		if pZ_d == 1 and pZ > pZ_r[1]:
			pZ_d = -1
		elif pZ_d == -1 and pZ < pZ_r[0]:
			pZ_d = 1
		
		common.sendData([
			'"spawner/animals/birds" SET Transform position ({} {}~{} {}) eulerAngles ({} {}~{} {})'.format(0, 5, 75, 0, 0, 0, 359, 0),
			'"spawner/cars" SET Transform eulerAngles ({} {}~{} {})'.format(0, 0, 359, 0),
			'"spawner/city/nature" SET Transform eulerAngles ({} {}~{} {})'.format(0, 0, 359, 0),
			'"spawner/city/buildings" SET Transform eulerAngles ({} {}~{} {})'.format(0, 0, 359, 0),
			
			'"city" SET Transform eulerAngles ({} {}~{} {})'.format(0, 0, 359, 0),
			'"EnviroSky" SET EnviroSky GameTime.Hours {}~{}'.format(8, 12),
			
			'"drone" SET Transform position ({} {} {}) eulerAngles ({}~{} {}~{} {}~{})'.format(pX, pY, pZ, 0, 359, 0, 359, 0, 359),
			
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur),
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount 1',
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending 0.004'
		], read=False)
		
		common.flushBuffer()
		helpers.takeSnapshot(mycams, True)
		
		loop = loop + 1
