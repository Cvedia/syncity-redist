from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
360 thermal static
	- Creates a RGB camera
	- Creates a Thermal camera
	- Creates a Segmentation camera
	- Spawns a single object and focus camera on it
	- Randomize thermal parameters and object rotation
	- Exports RGB images
	- Exports segmentation maps
	- Exports Thermal images
	- Exports bounding boxes
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/thermal']
	obj = helpers.drones_lst[7]
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup(orbit=False, flycam=True)
		
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.addCameraSeg(segments=['Drone'], lookupTable=[['Drone', 'red']])
		helpers.addCameraThermal(ambientTemperature=3)
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		common.sendData([
			# bind object to segmentation Drone
			'CREATE "obj"',
			'"obj" ADD Segmentation.Entity Segmentation.Class',
			'"obj" SET Segmentation.Class className "Drone"',
			
			'CREATE "{}" FROM "drones" AS "obj/subject"'.format(obj),
			
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
		
		'''"cameras" SET Transform
				position ({} {} {})
				eulerAngles ({} {} {})
		'''.format(-12.588, 2.1516, -1.2039, 57.75, -33.75, 0),
		
		'''"obj" SET Transform
			position ({} {} {})
			eulerAngles ({} {} {})
		'''.format(-13.343, 0, 0, 0, 26, 0)
	], read=False)
	
	if settings.setup_only == True:
		return
	
	loop = 0
	loop_limit = 100
	common.waitQueue()
	
	while loop < loop_limit:
		common.sendData('"obj" SET active false', read=False)
		
		helpers.setThermalProps(
			'obj/subject',
			heatiness=[0, 10], reflectivity=[0, 1], ambientOffset=[-5, 5],
			temperatureValue=[5, 25], temperatureBandwidth=[0, 20], temperatureMedian=[0, 1],
			variance=[0, 50]
		)
			
		common.sendData('"obj" SET active true', read=False)
			
		common.sendData([
			'''"cameras/thermal" SET Thermal.ThermalCamera
				temperatureRange ({}~{} {}~{})
				ambientTemperature {}~{}
			'''.format(5, 15, 20, 30, 0, 5),
			'"obj" SET Transform eulerAngles ({}~{} {}~{} {}~{})'.format(0, 180, 0, 180, 0, 180)
		])
		
		helpers.takeSnapshot(mycams, True)
		
		loop += 1
