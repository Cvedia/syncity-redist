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
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/depth']
	obj = 'Cars/VW_Golf_V/VW_Golf_V'
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(width=640, height=480, pp='EnviroFX')
		helpers.addCameraSeg(width=640, height=480, segments=['Car'], lookupTable=[['Car', 'red']])
		helpers.addCameraDepth(width=640, height=480)
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		common.sendData([
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
	
	if settings.skip_setup == False:
		helpers.setupROSTopics(
			readLinks=[
				{
					"label": "camera",
					"topic": "syncity/camera",
					"target": mycams[0],
					"component": "Camera",
					"field": "targetTexture",
					"interval": .5
				}
			]
		)
	
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
