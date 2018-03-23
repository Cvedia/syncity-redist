import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
POC scene
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Custom RGB postprocessing effects
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Orbits around
	- Exports segmentation map bounding boxes
	- Exports RGB images
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(width=4096, height=3072, flycam=settings.flycam, pp='EnviroFX')
		helpers.addCameraSeg(segments=['Car'])
		helpers.globalDiskSetup()
		
		helpers.addDiskOutput(mycams)
		helpers.spawnMiscObjs()
	
	dist = -60
	dist_e = 5 # elevation increment
	dist_a = 10 # azimuth increment
	elevation = 60
	loops = 0
	reroll = 10
	
	while elevation < 120:
		azimuth = 0
		
		while azimuth < 360:
			common.sendData([
				'"cameras" SET Orbit distance {}'.format(dist),
				'"cameras" SET Orbit elevation {}'.format(elevation),
				'"cameras" SET Orbit azimuth {}'.format(azimuth),
				'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(random.randint(6, 18))
			])
			
			helpers.takeSnapshot(mycams)
			helpers.takeSegSnapshot([ 'cameras/segmentation' ])
			loops += 1
			
			if loops == reroll:
				loops = 0
				helpers.spawnMiscObjs(True)
			
			azimuth += dist_a
		
		elevation += dist_e
