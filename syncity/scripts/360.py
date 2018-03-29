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
	- Exports segmentation maps
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = [
		'cameras/cameraRGB',
		'cameras/segmentation',
		'cameras/depth_blob',
		'cameras/depth_depth',
		'cameras/depth_rgb',
		'cameras/depth_jpg',
		'cameras/depth_tif',
	]
	
	# obj = 'Cars/MINI_CooperS/MINI_CooperS'
	obj = 'Cars/VW_Golf_V/VW_Golf_V'
	# obj = 'Drones/DJI_Phantom_4_Pro/DJI_Phantom_4_Pro'
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(width=4096, height=3072, pp='EnviroFX')
		helpers.addCameraSeg(segments=['Car'], lookupTable=[['Car', 'red']])
		
		helpers.addCameraDepth(label=mycams[2:7], width=1024, height=768)
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		# pixel sizes:
		# 1 8bit
		# 2 16bit
		# 4 32bit
		
		common.sendData([
			# BLOB is 32bit raw binary
			'"disk1/Cameras/depth_blob" SET Sensors.RenderCameraLink outputType "BLOB"',
			
			# DEPTH shortcut to 1 channel 16bit png
			'"disk1/Cameras/depth_depth" SET Sensors.RenderCameraLink outputType "DEPTH"',
			
			# RGB shortcut to 3 channels 8bit jpg
			'"disk1/Cameras/depth_rgb" SET Sensors.RenderCameraLink outputType "RGB"',
			
			# 3 channels 8bit, this is the same of RGB shortcut
			'''"disk1/Cameras/depth_jpg" SET Sensors.RenderCameraLink
					outputType "CUSTOM"
					outputChannels 3
					outputPixelSize 1
					outputExtension "jpg"
			''',
			
			# 1 channel 16bit tif
			'''"disk1/Cameras/depth_tif" SET Sensors.RenderCameraLink
				outputType "CUSTOM"
				outputChannels 1
				outputPixelSize 2
				outputExtension "tif"
			'''
		])
		
		common.sendData([
			# 'CREATE "{}" FROM "drones" AS "obj/subject"'.format(obj),
			'CREATE "{}" FROM "cars" AS "obj/subject"'.format(obj),
			'"obj" SET active false',
			'"obj/subject" SET Transform position ({} {} {})'.format(0, 0, 0),
			'"obj/subject" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
			
			'"obj" ADD Segmentation.ClassGroup',
			'"obj" SET Segmentation.ClassGroup itemsClassName "Car"',
			'"obj" SET Transform position ({} {} {})'.format(-6, 0, -9),
			'"obj" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
			
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
