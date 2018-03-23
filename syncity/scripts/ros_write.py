import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
ROS2 write setup
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Sets up ROS reader topics for angles, mass and drag
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	obj = 'Cars/VW_Golf_V/VW_Golf_V'
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(width=4096, height=3072, pp='EnviroFX')
		helpers.addCameraSeg(segments=['Car'], lookupTable=[['Car', 'red']])
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		common.sendData([
			'CREATE "obj/subject" {}'.format(obj),
			'"obj" SET active false',
			'"obj/subject" SET Transform position ({} {} {})'.format(0, 0, 0),
			'"obj/subject" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
			
			'"obj" ADD Segmentation.ClassGroup',
			'"obj" SET Segmentation.ClassGroup itemsClassName "Car"',
			'"obj" SET Transform position ({} {} {})'.format(-6, 0, -9),
			'"obj" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
			
			# 'CREATE city/ground_0 city/ground/Grass',
			# 'city/ground_0 SET Transform position (0 0 0)',
			# 'city/ground_0 SET Transform localScale (5 5 5)'
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
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1]),
	])
	
	helpers.setupROSTopics(
		writeLinks=[
			{
				"label": "eulerAngles",
				"topic": "obj/w/eulerAngles",
				"target": "obj/subject",
				"component": "Transform",
				"field": "eulerAngles",
				"interval": .5
			},
			{
				"label": "position",
				"topic": "obj/w/position",
				"target": "obj/subject",
				"component": "Transform",
				"field": "position",
				"interval": .5
			},
			{
				"label": "mass",
				"topic": "obj/w/mass",
				"target": "obj/subject",
				"component": "Rigidbody",
				"field": "mass",
				"interval": .5
			},
			{
				"label": "drag",
				"topic": "obj/w/drag",
				"target": "obj/subject",
				"component": "Rigidbody",
				"field": "drag",
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
