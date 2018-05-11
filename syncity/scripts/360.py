import random
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
	- Exports Segmentation images
	- Exports Depth map images
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = [
		'cameras/cameraRGB',
		'cameras/segmentation',
		'cameras/depth'
	]
	
	obj = 'Cars/VW_Golf_V/VW_Golf_V'
	# obj = 'Drones/DJI_Phantom_4_Pro/DJI_Phantom_4_Pro'
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.addCameraSeg(segments=['Car'], lookupTable=[['Car', 'red']])
		
		# NOTE: This could be optimized by adding the same camera target on
		# multiple RenderCameraLink components.
		
		helpers.addCameraDepth(label=mycams[2])
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		common.sendData([
			# DEPTH shortcut to 1 channel 16bit png
			'"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"',
			
			# 'CREATE "{}" FROM "drones" AS "obj/subject"'.format(obj),
			'CREATE "{}" FROM "cars" AS "obj/subject"'.format(obj),
			'"obj" SET active false',
			'"obj/subject" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 0, 0, 0, 0, 0),
			
			'"obj" ADD Segmentation.Entity Segmentation.Class',
			'"obj" SET Segmentation.Class className "Car"',
			'"obj" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(-6, 0, -9, 0, 0, 0),
			
			# 'CREATE "city/ground_0" "city/ground/Grass"',
			# '"city/ground_0" SET Transform position (0 0 0)',
			# '"city/ground_0" SET Transform localScale (5 5 5)'
		], read=False)
	
	# reset camera
	common.sendData([
		'"obj" SET active true',
		'"obj/subject" SET active true',
		
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras/segmentation" SET Camera enabled true',
		
		'"cameras" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 1, -16, 0, -40, 0),
		'"EnviroSky" SET EnviroSky cloudsMode "{}" cloudsSettings.globalCloudCoverage {}'.format('Volume', -0.04),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1])
	], read=False)
	
	if settings.setup_only == True:
		return
	
	common.waitQueue()
	
	displ_x = 5
	displ_y = 2
	a_x = 0
	exp = 1
	
	while a_x < 360:
		a_y = 0
		# do a 360 around object
		while a_y < 360:
			common.sendData([
				'"obj" SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, 0)
			])
			a_y = a_y + displ_y
			helpers.takeSnapshot(mycams, True)
		
		# next
		a_x = a_x + displ_x
