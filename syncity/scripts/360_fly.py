import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
360 object
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Spawns a single object and rotates it as camera flys up to 60 degrees angle
	- Exports RGB images
	- Exports segmentation maps
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	obj = 'Cars/VW_Golf_V/VW_Golf_V'
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.addCameraSeg(segments=['Car'])
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		common.sendData([
			'CREATE "{}" FROM "cars" AS "obj"'.format(obj),
			'"obj" ADD Segmentation.Entity Segmentation.Class',
			'"obj" SET Segmentation.Class className "Car"',
			'"obj" SET Transform position ({} {} {})'.format(-6, 0, -9),
			'"obj" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
			
			'CREATE "city/ground/Grass" FROM "city" AS "city/ground_0"',
			'"city/ground_0" SET Transform position (0 0 0) localScale (5 5 5)',
			'"city/ground_0" SET active true'
		], read=False)
	
	# reset camera
	common.sendData([
		'"obj" SET active true',
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {})'.format(0, 1, -16),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(0, -40, 0),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format('Volume'),
		'"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1])
	], read=False)
	
	common.flushBuffer()
	
	if settings.setup_only:
		return
	
	displ_h = .5
	displ_y = 4
	c_y = 1
	a_x = 0
	
	while c_y < 14:
		a_y = 0
		# do a 360 around object
		while a_y < 360:
			common.sendData([
				'"obj" SET Transform eulerAngles ({} {} {})'.format(0, a_y, 0)
			])
			a_y = a_y + displ_y
			helpers.takeSnapshot(mycams, False)
		
		# next
		c_y = c_y + displ_h
		a_x = c_y * 4.285714
		
		common.sendData([
			'"cameras" SET Transform position ({} {} {})'.format(0, c_y, -16),
			'"cameras" SET Transform eulerAngles ({} {} {})'.format(a_x, -40, 0)
		])
