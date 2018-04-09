import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
360 object
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Creates a Depth camera
	- Spawns a car and a drone, both segmented
	- Rotates both objects 360
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
	camera_size = [ 1024, 768 ]
	obj = [ 'Cars/VW_Golf_V/VW_Golf_V', 'Drones/DJI_Phantom_4_Pro/DJI_Phantom_4_Pron' ]
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		
		helpers.addCameraRGB(width=camera_size[0], height=camera_size[1], pp='EnviroFX')
		helpers.addCameraSeg(width=camera_size[0], height=camera_size[1], segments=['Car', 'Drone'], lookupTable=[['Car', 'red'], ['Drone', 'blue']])
		helpers.addCameraDepth(label=mycams[2], width=camera_size[0], height=camera_size[1])
		
		# NOTE: This could be optimized by adding the same camera target on
		# multiple RenderCameraLink components.
		
		helpers.addCameraDepth(label=mycams[2], width=1024, height=768)
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		common.sendData([
			# DEPTH shortcut to 1 channel 16bit png
			'"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"',
			
			# object 0
			'CREATE "{}" FROM "cars" AS "obj/subject0"'.format(obj[0]),
			'"obj" SET active false',
			'"obj/subject0" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 0, 0, 0, 0, 0),
			
			'"obj/subject0" ADD Segmentation.ClassInfo',
			'"obj/subject0" SET Segmentation.ClassInfo itemClass "Car"',
			
			# object 1
			'CREATE "{}" FROM "drones" AS "obj/subject1"'.format(obj[1]),
			'"obj" SET active false',
			'"obj/subject1" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 2, 0, 0, 0, 0),
			
			'"obj/subject1" ADD Segmentation.ClassInfo',
			'"obj/subject1" SET Segmentation.ClassInfo itemClass "Drone"',
			
			# container setup
			'"obj" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(-6, 0, -9, 0, 0, 0),
		], read=False)
	
	# reset camera
	common.sendData([
		'"obj" SET active true',
		'"obj/subject0" SET active true',
		'"obj/subject1" SET active true',
		
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras/segmentation" SET Camera enabled true',
		
		'"cameras" SET Transform position ({} {} {})'.format(0, 1, -16),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(0, -40, 0),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format('Volume'),
		'"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1])
	], read=False)
	
	if settings.setup_only == True:
		return
	
	common.flushBuffer()
	
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
