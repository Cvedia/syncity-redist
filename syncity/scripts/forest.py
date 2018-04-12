import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Forest scene
	- Loads a full scene
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
	mycams = ['cameras/cameraRGB']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(flycam=settings.flycam, pp='EnviroFX')
		helpers.globalDiskSetup()
		
		helpers.addDiskOutput(mycams)
		common.sendData([
			'CREATE "test" "Terrains/Forest/Forest"',
			'"test" SET Transform position ({} {} {})'.format(-5000,-180,-5000),
			'"test" SET Terrain basemapDistance 2000',
			'"test" SET TerrainCollider enabled true',
			'"test" SET active true',
			# 'cameras SET Orbit target test'
		])
		
		# helpers.spawnRadiusGeneric(['cars'], limit=10, radius=50, innerradius=0, segmentationClass="Car", orbit=True, position=[0,10,0])
		# helpers.spawnRadiusGeneric(['prefabs/terrains/desert'], orbit=True, limit=1, radius=65, innerradius=0, position=[0,0,0], collisionCheck=False)
		
		helpers.spawnMiscObjs()
	
	dist = -60
	dist_e = 5 # elevation increment
	dist_a = 10 # azimuth increment
	elevation = 15
	loops = 0
	reroll = 50
	
	if settings.setup_only:
		return
	
	while elevation < 60:
		azimuth = 0
		
		while azimuth < 360:
			common.sendData([
				'"cameras" SET Orbit distance {}'.format(dist),
				'"cameras" SET Orbit elevation {}'.format(elevation),
				'"cameras" SET Orbit azimuth {}'.format(azimuth),
				'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(random.randint(6, 18))
			])
			
			helpers.takeSnapshot(mycams)
			loops += 1
			
			if loops == reroll:
				loops = 0
				helpers.spawnMiscObjs(True)
			
			azimuth += dist_a
		
		elevation += dist_e
