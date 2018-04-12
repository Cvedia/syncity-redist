from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
360 thermal static spawner
	- Creates a RGB camera
	- Creates a Thermal camera
	- Creates a Segmentation camera
	- Spawns a circle of objects and focus camera on it
	- Randomize thermal parameters
	- Exports RGB images
	- Exports segmentation maps
	- Exports Thermal images
	- Exports bounding boxes
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/thermal']
	obj = 'spawner/drone'
	if settings.skip_setup == False:
		helpers.globalCameraSetup(orbit=False, flycam=True)
		
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.addCameraSeg(segments=['Drone'], lookupTable=[['Drone', 'red']])
		helpers.addCameraThermal(ambientTemperature=3)
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		helpers.spawnRadiusGeneric(
			['drone'],
			segmentationClass="Drone",
			tags=['drone'],
			limit=25,
			radius=15,
			innerradius=0,
			position=[-6, 0, -9],
			collisionCheck=True,
			thermalObjectBehaviour=True,
			thermalObjectOverride=True
		)
	
	# reset camera
	common.sendData([
		'''"cameras" SET Transform
				position ({} {} {})
				eulerAngles ({} {} {})
		'''.format(-1.3375, 6.09948, -15.169, 48.75, -35.75, 0)
	], read=False)
	
	if settings.setup_only == True:
		return
	
	loop = 0
	loop_limit = 100
	
	while loop < loop_limit:
		common.sendData('"{}" SET active false'.format(obj), read=False)
		
		helpers.setThermalProps(
			'{}/container'.format(obj),
			heatiness=[0, 10], reflectivity=[0, 1], ambientOffset=[-5, 5],
			temperatureValue=[5, 25], temperatureBandwidth=[0, 20], temperatureMedian=[0, 1],
			variance=[0, 50]
		)
		
		common.sendData('"{}" SET active true'.format(obj), read=False)
		helpers.takeSnapshot(mycams, True)
		
		loop += 1
