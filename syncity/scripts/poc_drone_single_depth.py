import time
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
	- Creates a Depth camera
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Orbits around from ground perspective looking at drones
	- Exports segmentation map bounding boxes
	- Exports Depth images
	- Exports RGB images
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/depth']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(width=1024, height=768, pp='EnviroFX')
		helpers.addCameraDepth(width=1024, height=768)
		helpers.addCameraSeg(width=1024, height=768, segments=['drone0', 'drone1', 'drone2'], lookupTable=[['drone0', 'red'], ['drone1','blue'], ['drone2', 'green']])
		helpers.globalDiskSetup()
		
		helpers.addDiskOutput(mycams)
		helpers.spawnDroneObjs(dronesLimit=[0,0], buildingsInnerRadius=300, treesInnerRadius=60, treesRadius=100, buildingsLimit=[50,80])
		
		# single drone
		'''
		helpers.addCameraSegFilter(['drone'])
		common.sendData([
			'CREATE drone/drone0/drone0 "{}"'.format(random.choice(helpers.drones_lst)),
			'drone/drone0" ADD Segmentation.ClassGroup',
			'drone/drone0" SET Segmentation.ClassGroup itemsClassName Drone'
		], read=False)
		'''
		
		common.sendData([
			'CREATE "{}" FROM "drones" AS "drone/drone0/drone0"'.format(helpers.drones_lst[6]), # Drones/DJI Phantom 4 Pro/DJI_Phantom_4_Pro
			'"drone/drone0" SET active false',
			'"drone/drone0" ADD Segmentation.ClassGroup',
			'"drone/drone0" SET Segmentation.ClassGroup itemsClassName "drone0"',
			'"drone/drone0/drone0" SET Transform position ({} {} {})'.format(0, 1, 0),
			'"drone/drone0/drone0" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
			'"drone/drone0" SET active true',
			'"drone/drone0/drone0" SET active true',
			
			'CREATE "{}" FROM "drones" AS "drone/drone1/drone1"'.format(helpers.drones_lst[4]), # Drones/DJI S1000/DJI S1000
			'"drone/drone1" SET active false',
			'"drone/drone1" ADD Segmentation.ClassGroup',
			'"drone/drone1" SET Segmentation.ClassGroup itemsClassName "drone1"',
			'"drone/drone1/drone1" SET Transform position ({} {} {})'.format(0, 2, 0),
			'"drone/drone1/drone1" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
			'"drone/drone1" SET active true',
			'"drone/drone1/drone1" SET active true',
			
			'CREATE "{}" FROM "drones" AS "drone/drone2/drone2"'.format(helpers.drones_lst[7]), # Drones/Parrot Disco/Parrot Disco
			'"drone/drone2" SET active false',
			'"drone/drone2" ADD Segmentation.ClassGroup',
			'"drone/drone2" SET Segmentation.ClassGroup itemsClassName "drone2"',
			'"drone/drone2/drone2" SET Transform position ({} {} {})'.format(0, 3, 0),
			'"drone/drone2/drone2" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
			'"drone/drone2" SET active true',
			'"drone/drone2/drone2" SET active true',
			
			# magic for depth maps
			
			# '"cameras/depth" SET Sensors.Lidar_Internal.RenderDepthBufferOld outputMode "RawDepth"',
			# '"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"'
			# '"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "BLOB"'
			
			# '"cameras/depth" SET Sensors.Lidar_Internal.RenderDepthBufferOld outputMode "NormalizedDistance"',
			# '"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"'
			# '"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "BLOB"'
			
			# '"cameras/depth" SET Sensors.Lidar_Internal.RenderDepthBufferOld enabled false',
			# '"cameras/depth" ADD CameraDepthOutput',
			
			'"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"',
			
			'"{}" SET Sensors.RenderCamera alwaysOn true'.format(mycams[0]),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled true'.format(mycams[0]),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.shutterAngle {}'.format(mycams[0], 270),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount {}'.format(mycams[0], 32),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending {}'.format(mycams[0], 1)
		], read=False)
	
	if settings.setup_only == True:
		return
	
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
		'"cameras" SET Transform position ({} {} {})'.format(0, 1, 0),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(-20, 0, 0),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1]),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format(helpers.clouds_lst[2]),
		'"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
		'"drone" SET Transform position ({} {} {})'.format(pX, pY, pZ),
		'"drone" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
		
		# disable blooming effects
		'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false',
		
		# remove propellers
		'DELETE "drone/drone0/drone0/propeller_BL"',
		'DELETE "drone/drone0/drone0/propeller_BR"',
		'DELETE "drone/drone0/drone0/propeller_FL"',
		'DELETE "drone/drone0/drone0/propeller_FR"',
		
		'DELETE "drone/drone1/drone1/Motor_01"',
		'DELETE "drone/drone1/drone1/Motor_02"',
		'DELETE "drone/drone1/drone1/Motor_03"',
		'DELETE "drone/drone1/drone1/Motor_04"',
		'DELETE "drone/drone1/drone1/Motor_05"',
		'DELETE "drone/drone1/drone1/Motor_06"',
		'DELETE "drone/drone1/drone1/Motor_07"',
		'DELETE "drone/drone1/drone1/Motor_08"',
		
		'DELETE "drone/drone2/drone2/Propeller"'
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
			'"cameras/cameraRGB" SET Camera enabled false',
			'"spawner/animals/birds" SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
			'"spawner/animals/birds" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/cars" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/city/nature" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/city/buildings" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"city" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(random.randint(8, 12)),
			'"drone" SET Transform position ({} {} {})'.format(pX, pY, pZ),
			'"drone" SET Transform eulerAngles ({} {} {})'.format(random.randint(0, 359), random.randint(0, 359), random.randint(0, 359)),
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur)
		], read=False)
		
		common.flushBuffer()
		
		# this is a workaround for the propellers to blur, in order to have the 
		# motion blur correctly made, we need to allow the system to render a few
		# frames, before taking the screenshot
		if motionblur == 'true':
			common.sendData('"cameras/cameraRGB" SET Camera enabled true', read=True)
			time.sleep(0.5)
		
		helpers.takeSnapshot(mycams, True)
		
		loop = loop + 1
