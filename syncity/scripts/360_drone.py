import time
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
360 object
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Creates a Depth camera
	- Spawns a single object and rotates around it
	- Exports RGB images
	- Exports segmentation maps
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/depth']
	obj = 'spawner'
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup(orbit=False, flycam=True)
		helpers.addCameraRGB(width=1024, height=768, pp='EnviroFX')
		helpers.addCameraSeg(segments=['Drone'], lookupTable=[['Drone', 'red']])
		helpers.addCameraDepth(width=1024, height=768, depthBuffer='simple')
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		helpers.spawnRadiusGeneric(
			['drone'],
			segmentationClass="Drone",
			tags=['drone'],
			limit=3,
			radius=10,
			innerradius=0,
			position=[0,0,0],
			collisionCheck=False
		)
		
		common.sendData([
			'"{}" SET Sensors.RenderCamera alwaysOn true'.format(mycams[0]),
			'''"{}" SET PostProcessing.PostProcessingBehaviour
				profile.motionBlur.enabled true
				profile.motionBlur.settings.shutterAngle {}
				profile.motionBlur.settings.sampleCount {}
				profile.motionBlur.settings.frameBlending {}
			'''.format(mycams[0], 360, 4, .064)
		])
		
		"""
			'"cameras/cameraRGB" ADD UnityStandardAssets.ImageEffects.motionBlur',
			'"cameras/cameraRGB" SET UnityStandardAssets.ImageEffects.motionBlur shader "Hidden/MotionBlur" blurAmount 0.92 enabled true'
		"""
	
	# reset camera
	common.sendData([
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras/segmentation" SET Camera enabled true',
		
		'"cameras" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 1, -16, 0, -40, 0),
		'"EnviroSky" SET EnviroSky cloudsMode "{}" cloudsSettings.globalCloudCoverage {}'.format('Volume', -0.04),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1])
	], read=False)
	
	if settings.setup_only == True:
		return
	
	common.flushBuffer()
	
	displ_x = 5
	displ_y = 2
	a_x = 0
	exp = 1
	
	# rotate y axis
	a_y = 0
	while a_y < 360:
		common.sendData([
			# 'cameras/cameraRGB SET UnityStandardAssets.ImageEffects.motionBlur enabled false',
			'"{}" SET Transform eulerAngles ({} {} {})'.format(obj, a_x, a_y, 0),
			# 'cameras/cameraRGB SET UnityStandardAssets.ImageEffects.motionBlur enabled true'
		])
		a_y = a_y + displ_y
		time.sleep(.5)
		helpers.takeSnapshot(mycams, True)
