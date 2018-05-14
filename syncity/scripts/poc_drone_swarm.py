import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

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

def args(parser):
	try:
		parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')
	except: pass

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.addCameraSeg(segments=['Car'])
		helpers.globalDiskSetup()
		
		helpers.addDiskOutput(mycams)
		helpers.spawnDroneObjs(dronesLimit=[0,0])
		
		i = 0
		for d in helpers.drones_lst:
			common.sendData([
				'CREATE "drone/dr_{}" "{}"'.format(i, d),
				'"drone/dr_{}" ADD Segmentation.Entity Segmentation.Class'.format(i),
				'"drone/dr_{}" SET Segmentation.Class className "Car"'.format(i),
				'"drone/dr_{}" SET Transform position ({} {} {})'.format(i, i, 1, 0)
			], read=False)
			i = i + 1
	
	pX_r = [-17, 13]
	pY_r = [0.5, 17]
	pZ_r = [24, 42]
	
	pX = pX_r[0]
	pY = pY_r[0]
	pZ = pZ_r[0]
	
	pX_d = 1
	pY_d = 1
	pZ_d = 1
	
	a_x = 0
	a_y = 0
	a_z = 0
	
	# reset camera
	common.sendData([
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {})'.format(0, 1, 0),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(-20, 0, 0),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1]),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format(helpers.clouds_lst[2]),
		'"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
		'"drone" SET Transform position ({} {} {})'.format(pX, pY, pZ),
		'"drone" SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, a_z)
	], read=False)
	
	loop = 0
	
	if settings.setup_only:
		return
	
	common.waitQueue()
	
	while loop < settings.loop_limit:
		if random.uniform(0,1) > .8:
			motionblur = 'true'
		else:
			motionblur = 'false'
		
		pX = pX + (random.uniform(.5, 2.5) * pX_d)
		pY = pY + (random.uniform(.1, 1.5) * pY_d)
		pZ = pZ + (random.uniform(.1, 1.5) * pZ_d)
		
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
			'"spawner/animals/birds" SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
			'"spawner/animals/birds" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/cars" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/city/nature" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/city/buildings" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			# '"cameras" SET Transform eulerAngles ({} {} {})'.format(-20, y, 0),
			'"city" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(random.randint(8, 18)),
			'"drone" SET Transform position ({} {} {})'.format(pX, pY, pZ),
			'"drone" SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, a_z),
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur),
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount 1',
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending 0.004'
		], read=False)
		
		common.flushBuffer()
		helpers.takeSnapshot(mycams, True)
		
		loop = loop + 1
