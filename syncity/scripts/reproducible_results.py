import time
import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Reproducible results
	- Creates a RGB camera
	- Spawns objects using a random seed
	- Exports RGB images
	- Exits leaving all objects exposed
'''

def args(parser):
	try:
		parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')
	except: pass

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB']
	obj = 'spawner'
	
	# NOTE: This could be set via --seed_api <value>
	common.setAPISeed('1234')
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		helpers.spawnRadiusGeneric(['drone'], tags=['drone'], limit=25, radius=10, innerradius=0, position=[0,0,0], collisionCheck=False)
	
	# reset camera
	common.sendData([
		'"{}" SET Sensors.RenderCamera alwaysOn true'.format(mycams[0]),
		'"cameras/cameraRGB" SET Camera enabled true',
		
		'"cameras" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0.0027, 3.03291, -9.6, 32, 3.5, 0),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format('Volume'),
		'"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1])
	], read=False)
	
	if settings.setup_only == True:
		return
	
	common.flushBuffer()
	
	loop = 0
	
	while loop < settings.loop_limit:
		common.sendData(['"{}" SET Transform eulerAngles ({}~{} {}~{} {})'.format(obj, 0, 360, 0, 360, 0)])
		loop = loop + 1
		helpers.takeSnapshot(mycams)
