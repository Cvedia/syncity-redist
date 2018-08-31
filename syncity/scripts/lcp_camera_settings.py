from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
LCP Camera settings
	- Creates several RGB cameras
	- Spawns a circle of objects and focus camera on it
	- Setups a camera LCP profile with extreme settings showcasing distortions
	- Exports RGB images
	- Exits leaving all objects exposed
'''

def args(parser):
	try:
		parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')
	except: pass

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB0', 'cameras/cameraRGB1', 'cameras/cameraRGB2', 'cameras/cameraRGB3', 'cameras/cameraRGB4', 'cameras/cameraRGB5']
	obj = 'spawner'
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup(orbit=False, flycam=True)
		
		helpers.addCameraRGB(label=mycams, pp='EnviroFX')
		
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
		
		# simple fisheye
		helpers.LCP(
			camera=mycams[0],
			radialParam1=5,
			radialParam2=5
		)
		
		# horizontal perspective distortion
		helpers.LCP(
			camera=mycams[1],
			radialParamX=0.5
		)
		
		# linear chromatic aberration
		# NOTE: if we set all color parameters equal this would cause the same
		# distortion as radianParams would, without color displacement
		helpers.LCP(
			camera=mycams[2],
			redParam1=5,
			redParam2=5,
			
			greenParam1=3,
			greenParam2=3,
			
			blueParam1=1,
			blueParam2=1
		)
		
		# linear chromatic aberration with radial displacement
		helpers.LCP(
			camera=mycams[3],
			redParam1=5,
			redParam2=5,
			redParamX=1,
			redParamY=1,
			
			greenParam1=3,
			greenParam2=3,
			greenParamX=3,
			greenParamY=3,
			
			blueParam1=1,
			blueParam2=1,
			blueParamX=5,
			blueParamY=5
		)
		
		# linear chromatic aberration with radial displacement and fish eye
		helpers.LCP(
			camera=mycams[4],
			redParam1=5,
			redParam2=5,
			redParamX=1,
			redParamY=1,
			
			greenParam1=3,
			greenParam2=3,
			greenParamX=3,
			greenParamY=3,
			
			blueParam1=1,
			blueParam2=1,
			blueParamX=5,
			blueParamY=5,
			
			isFisheyeDistortion=True,
			radialParam1=4,
			radialParam2=2,
			distortionScale=1.2
		)
		
		# random parameters
		helpers.LCP(
			camera=mycams[5],
			redParam1='-25~25',
			redParam2='-25~25',
			redParamX='-15~15',
			redParamY='-15~15',
			
			greenParam1='-25~25',
			greenParam2='-25~25',
			greenParamX='-15~15',
			greenParamY='-15~15',
			
			blueParam1='-25~25',
			blueParam2='-25~25',
			blueParamX='-15~15',
			blueParamY='-15~15',
			
			isFisheyeDistortion=True,
			radialParam1='-25~25',
			radialParam2='-25~25',
			distortionScale=1
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
	
	common.waitQueue()
	a_y = 0
	dist_y = 5
	loop = 0
	
	while loop < settings.loop_limit:
		common.sendData('"{}" SET Transform eulerAngles (0 {} 0)'.format(obj, a_y), read=False)
		a_y += dist_y
		
		if a_y >= 90 or a_y <= 0:
			dist_y *= -1
		
		# random parameters
		helpers.LCP(
			add=False,
			camera=mycams[5],
			redParam1='-25~25',
			redParam2='-25~25',
			redParamX='-15~15',
			redParamY='-15~15',
			
			greenParam1='-25~25',
			greenParam2='-25~25',
			greenParamX='-15~15',
			greenParamY='-15~15',
			
			blueParam1='-25~25',
			blueParam2='-25~25',
			blueParamX='-15~15',
			blueParamY='-15~15',
			
			radialParam1='-25~25',
			radialParam2='-25~25',
			
			vignetteParam1='-0.5~0.5',
			vignetteParam2='-0.5~0.5',
			vignetteParam3='-0.5~0.5',
			vignetteParam4='-0.5~0.5'
		)
		
		helpers.takeSnapshot(mycams)
		loop += 1
