import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(width=1024, height=768, pp='Savannah')
		helpers.addCameraSeg(segments=['Drone'])
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)

		common.sendData([
			'"cameras" SET Transform position ({} {} {})'.format(0, random.randint(2, 10), -30),
			'CREATE "test" "Terrains/Savannah/Savannah"',
			'"test" SET Transform position ({} {} {})'.format(-5000,-180,-5000),
			'"test" SET Terrain basemapDistance 2000',
			'"test" SET TerrainCollider enabled true',
			'"test" SET active true',
			# 'cameras" SET Orbit target test'
		])
		
	
	helpers.spawnAnimalsObjs()
	helpers.spawnRadiusGeneric(['drones/Parrot Disco/'], limit=random.randint(30,50), radius=random.randint(20,35), innerradius=5, position=[0,0,0], segmentationClass="Drone")
	
	for c in range(2):
		for w in range(8):
			for fov in range(100, 9, -20):
			#fov = 30
				#print('FOV: {}.'.format(fov))
				# reset camera
				common.sendData([
					'"cameras/cameraRGB" SET Camera enabled true',
					'"cameras/cameraRGB" SET Camera fieldOfView ' + str(fov),
					'"cameras/segmentation" SET Camera fieldOfView ' + str(fov),
					'"cameras" SET Transform position ({} {} {})'.format(0, random.randint(5, 15), -30),
					#'"cameras" SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, 20), random.randint(-15, 15), 0),
					#'"cameras/cameraRGB" ADD EnviroCamera',
					'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[0]),
					'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format('None'),
					#'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format(random.choice(helpers.clouds_lst))
					'"cameras" ADD OrbitAroundRandomChild',
					'"cameras" SET OrbitAroundRandomChild parentTarget "spawner/drones"',
					'"cameras" EXECUTE OrbitAroundRandomChild SelectRandomChild',
					'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.enabled false'
				])
			
				#for h_dr in range(4, 36, 2):
				y = 15
				loop = 0
				reroll = 100
				
				while y < 160:
					if random.uniform(0,1) > .95:
						motionblur = 'true'
					else:
						motionblur = 'false'
					
					common.sendData([
						'"spawner/drones" SET Transform position ({} {} {})'.format(0, random.randint(15, 25), 0),
						#'"spawner/drones" SET Transform position ({} {} {})'.format(0, h_dr, 0),
						'"spawner/drones" SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, -15), random.randint(0, 359), random.randint(-10, 10)),
						#'"spawner/animals/birds" SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
						#'"spawner/animals/birds" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
						#'"spawner/cars" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
						#'"spawner/city/nature" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
						#'"spawner/city/buildings" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
						'"cameras" SET Transform position ({} {} {})'.format(0, random.randint(10, 15), -30),
						#'"cameras" SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, 20), y, 0),
						'"cameras" EXECUTE OrbitAroundRandomChild SelectRandomChild',
						'"city" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
						'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(random.randint(8, 18)),
						'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur)
					])
					
					# for i in range(3):
					# 	spawnRadiusGeneric(['drones/white'], limit=random.randint(50,100), radius=random.randint(50,100), innerradius=0, position=[0,0,0], segmentationClass="Car")
					# 	sendData([
					# 		'spawner/drones" SET Transform position ({} {} {})'.format(0, random.randint(5, 30), 0)
					# 	])
					
					helpers.setDiskTexture(mycams)
					helpers.takeSnapshot(mycams, True)
					# takeSegSnapshot([ 'cameras/segmentation' ])
					
					y = y + 1
					loop = loop + 1
					
					if loop % 10 == 0:
						common.sendData([
							'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[w]),
							'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format(helpers.clouds_lst[c])
							#'EnviroSky" SET EnviroSky cloudsMode "{}"'.format(random.choice(helpers.clouds_lst))
						])
					
					if loop == reroll:
						helpers.spawnAnimalsObjs(True)
						common.sendData([
							'DELETE "spawner/drones"'
						])
						helpers.spawnRadiusGeneric(['drones/Parrot Disco/'], limit=random.randint(30,50), radius=random.randint(20,35), innerradius=5, position=[0,0,0], segmentationClass="Drone")
						loop = 0
