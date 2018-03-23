import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

# use lite drone packages
# helpers.drones_lst = helpers.drones_lite_lst

def help():
	return '''\
POC Satellite
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
		helpers.globalCameraSetup(mycams[1])
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.addCameraSeg()
		helpers.globalDiskSetup()
		
		helpers.addDiskOutput(mycams)
	
	# pX_r = [-17, 13]
	# pY_r = [1.5, 17]
	# pZ_r = [24, 42]
	
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
		'"cameras" SET Transform position ({} {} {})'.format(262, 840, 243),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(90, 0, 0),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1]),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format(helpers.clouds_lst[2]),
		'"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
		# HACK: change output type to get multiple segmentation classIds working
		'cameras/segmentation SET Segmentation.Segmentation OutputType "InstanceIds"'
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
			# 'cameras SET Transform eulerAngles ({} {} {})'.format(-20, y, 0),
			'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(random.randint(8, 12)),
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur),
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount 1',
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending 0.004'
		], read=False)
		
		common.flushBuffer()
		helpers.takeSnapshot(mycams, True)
		
		loop = loop + 1
