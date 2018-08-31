from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
360 thermal
	- Creates a RGB camera
	- Creates a Thermal camera
	- Creates a Segmentation camera
	- Spawns a single object and rotates around it
	- Randomize thermal parameters
	- Exports RGB images
	- Exports segmentation maps
	- Exports Thermal images
	- Exports bounding boxes
	- Exits leaving all objects exposed
'''

def args(parser):
	try:
		parser.add_argument('--stream_profile', default="high", help='Defines encoding profile')
	except: pass
	try:
		parser.add_argument('--stream_length', type=int, default=300, help='Defines the size of each video in seconds')
	except: pass

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/thermal']
	obj = 'Cars/VW_Golf_V/VW_Golf_V'
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup(orbit=False, flycam=True)
		
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.addCameraSeg(segments=['Car'], lookupTable=[['Car', 'red']])
		helpers.addCameraThermal(ambientTemperature=3)
		
		# helpers.globalDiskSetup()
		# helpers.addDiskOutput(mycams)
		
		common.sendData([
			# bind object to segmentation Car
			'CREATE "obj"',
			'"obj" ADD Segmentation.Entity Segmentation.Class',
			'"obj" SET Segmentation.Class className "Car"',
			
			'CREATE "{}" FROM "cars" AS "obj/subject"'.format(obj),
			
			'"obj" ADD Thermal.ThermalObjectBehaviour',
			'"obj" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"',
			
			'"obj/subject" ADD Thermal.ThermalObjectOverride',
			
			'"obj/subject" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 0, 0, 0, 0, 0),
			'"obj" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(-6, 0, -9, 0, 0, 0)
			
	], read=False)
	
	# reset camera
	common.sendData([
		'"obj/subject" SET active true',
		'"obj" SET active true',
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 1, -16, 0, -40, 0)
	], read=False)
	
	if settings.skip_setup == False:
		helpers.addVideoExport(mycams, params={"streamLength": settings.stream_length, "streamProfile": settings.stream_profile, "exportBBoxes": True})
	
	if settings.setup_only == True:
		return
	
	displ_x = 45
	displ_y = 2
	a_x = 0
	
	while a_x < 360:
		a_y = 0
		output_fn = []
		
		# do a 360 around object
		while a_y < 360:
			helpers.setThermalProps(
				'obj/subject',
				heatiness=[0, 50], reflectivity=[0, 1], ambientOffset=[-25, 25],
				temperatureValue=[-20, 50], temperatureBandwidth=[0, 20], temperatureMedian=[0, 1],
				variance=[0, 50], toggleEnabled=False
			)
			
			common.sendData([
				'"cameras/thermal" SET Thermal.ThermalCamera temperatureRange ({}~{} {}~{})'.format(-10, 5, 30, 150),
				'"obj" SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, 0),
				'"obj" SET Transform position ({}~{} {} {})'.format(-23, -3, 0, 0)
			])
			
			a_y = a_y + displ_y
			# helpers.takeSnapshot(mycams, True)
		
		# next
		a_x = a_x + displ_x
