import time
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Spawner frustum
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Creates a Depth camera
	- Creates a spawner inside camera frustum
	- Shuffle spawned objects
	- Exports RGB images
	- Exports segmentation maps
	- Exports depth maps
	- Exits leaving all objects exposed
'''

def args(parser):
	try:
		parser.add_argument('--loop_limit', type=int, default=100, help='Defines a limit of iterations for exporting')
	except:
		pass

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/depth']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup(orbit=False, flycam=True)
		helpers.addCameraRGB(width=1024, height=768, pp='EnviroFX')
		helpers.addCameraSeg(segments=['Drone'], lookupTable=[['Drone', 'red']])
		helpers.addCameraDepth(width=1024, height=768, depthBuffer='simple')
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		helpers.spawner(
			['drones'], tags=['drone'], uglyFix=False, limit=10,
			segmentationClass="Drone",
			position=None,
			prefix='cameras/spawner',
			method='Frustum',
			methodParameters={'cam': '"cameras/cameraRGB"', 'scaleBack': 0.5},
			minDistance=2,
			maxDistance=5
		)
	
	# reset camera
	common.sendData([
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras/segmentation" SET Camera enabled true',
		
		'"cameras" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 1, -16, 0, -40, 0),
		'"EnviroSky" SET EnviroSky cloudsMode "{}" cloudsSettings.globalCloudCoverage {}'.format('Volume', -0.04),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1])
	], read=False)
	
	if settings.setup_only == True:
		return
	
	common.flushBuffer()
	loop = 0
	
	while loop < settings.loop_limit:
		common.sendData('"cameras/spawner/drones/container" EXECUTE RandomProps.PropArea Shuffle')
		helpers.takeSnapshot(mycams, True)
		loop += 1
