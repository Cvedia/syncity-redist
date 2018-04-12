from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Spherical camera distortion
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Spawns a circle of objects and focus camera on it
	- Setups a spherical distortion on all cameras
	- Rotates spawned objects showcasing the fisheye lenses
	- Exports RGB images
	- Exports segmentation maps
	- Exports bounding boxes
	- Exits leaving all objects exposed
'''

def args(parser):
	try:
		parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')
	except: pass

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	obj = 'spawner'
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup(orbit=False, flycam=True)
		
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.addCameraSeg(segments=['Drone'], lookupTable=[['Drone', 'red']])
		
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
			collisionCheck=True
		)
		
		helpers.sphericalCamera(
			camera=mycams,
			fisheye=True,
			azimuth=360,
			elevation=90
		)
	
	# reset camera
	common.sendData([
		'''"cameras" SET Transform
				position ({} {} {})
				eulerAngles ({} {} {})
		'''.format(-4.6025, 0.1441, -10.633, 6, -27.75, 0)
	], read=False)
	
	if settings.setup_only == True:
		return
	
	a_y = 0
	dist_y = 5
	loop = 0
	
	while loop < settings.loop_limit:
		common.sendData('"{}" SET Transform eulerAngles (0 {} 0)'.format(obj, a_y), read=False)
		a_y += dist_y
		
		if a_y >= 90 or a_y <= 0:
			dist_y *= -1
		
		helpers.takeSnapshot(mycams, True)
		loop += 1
