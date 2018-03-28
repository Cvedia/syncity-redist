import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

# use lite drone packages
# helpers.drones_lst = helpers.drones_lite_lst

def help():
	return '''\
POC Drone single scene
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Creates a Depth camera
	- Creates a Thermal camera
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Creates 3 specific drones, adding heat properties to motors / engines
	- Binds default thermal profile to objects that don't contain a full thermal profile
	- Creates a thermal override to create a random thermal signature
	- Orbits around from ground perspective looking at drones, rotating different torus randomizing drone heat patterns
	- Exports segmentation map bounding boxes
	- Exports RGB images
	- Exports Segmentation images
	- Exports Depth images
	- Exports Thermal images
	- Exits leaving all objects exposed
'''

def args(parser):
	parser.add_argument('--loopLimit', type=int, default=100, help='Defines a limit of iterations for exporting')
	parser.add_argument('--segment_all', action='store_true', default=False, help='Defines a segmentation class for all spawned objects')

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/depth', 'cameras/thermal']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup(orbit=False)
		helpers.addCameraRGB(width=1024, height=768, pp='EnviroFX')
		helpers.addCameraDepth(width=1024, height=768)
		
		# Note on bbox output:
		# classId aligns with the order you define the segments, for example:
		# segments=['drone0', 'drone1', 'drone2']
		# classId:     1         2         3       ....
		
		if settings.segment_all:
			helpers.addCameraSeg(
				width=4096, height=3072,
				segments=['drone0', 'drone1', 'drone2'],
				lookupTable=[['drone0', 'red'], ['drone1','blue'], ['drone2', 'green'], ['ground', '#C0CBE6FF'], ['tree', '#CFD83AFF'], ['building', '#7E0E62FF'], ['bird', '#33D45EFF'], ['car', '#00FD26FF']]
			)
		else:
			helpers.addCameraSeg(
				width=4096, height=3072,
				segments=['drone0', 'drone1', 'drone2'],
				lookupTable=[['drone0', 'red'], ['drone1','blue'], ['drone2', 'green']]
			)
		
		helpers.addCameraThermal(
			trees=True,
			ambientTemperature=15, minimumTemperature=9, maximumTemperature=35,
			treesBase=8, treesBandwidth=50, treesMedian=0, treesLeafsVariance=10
		)
		
		helpers.globalDiskSetup()
		
		helpers.addDiskOutput(mycams)
		#
		# NOTE for carsTags:
		#
		# use only 'car' to spawn cars without thermal signature, that will be then
		# linked to a default profile, note that this will not show full detail, but
		# it's pretty much the same from a distance.
		#
		# use 'car, +thermal' to spawn only cars with thermal profiles
		#
		
		if settings.segment_all:
			helpers.spawnDroneObjs(
				dronesLimit=[0,0], buildingsInnerRadius=300,
				treesLimit=[300,600], treesInnerRadius=30, treesRadius=50, buildingsLimit=[50,80],
				thermal='DefaultThermalProfile',
				carsColors=16,
				carsTags=['car, +thermal'],
				seed=666,
				groundSegment='ground', treesSegment='tree', buildingsSegment='building', birdsSegment='bird', carsSegment='car'
			)
		else:
			helpers.spawnDroneObjs(
				dronesLimit=[0,0], buildingsInnerRadius=300,
				treesLimit=[300,600], treesInnerRadius=30, treesRadius=50, buildingsLimit=[50,80],
				thermal='DefaultThermalProfile',
				cars_colors=16,
				carsTags=['car, +thermal'],
				seed=666
			)
		
		common.sendData([
			'CREATE "{}" FROM "drones" AS "drone/drone0/drone0"'.format(helpers.drones_lst[6]), # Drones/DJI Phantom 4 Pro/DJI_Phantom_4_Pro
			'"drone/drone0" ADD Segmentation.ClassGroup',
			'"drone/drone0" SET active false',
			
			'"drone/drone0" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone0" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"',
			
			'"drone/drone0/drone0/bottom" ADD Thermal.ThermalObjectOverride',
			'"drone/drone0/drone0/motors" ADD Thermal.ThermalObjectOverride',
			'"drone/drone0/drone0" ADD Thermal.ThermalObjectOverride',
			
			'"drone/drone0" SET Segmentation.ClassGroup itemsClassName "drone0"',
			'"drone/drone0/drone0" SET Transform position ({} {} {})'.format(0, 1, 0),
			
			'CREATE "{}" FROM "drones" AS "drone/drone1/drone1"'.format(helpers.drones_lst[4]), # Drones/DJI S1000/DJI S1000
			'"drone/drone1" ADD Segmentation.ClassGroup',
			'"drone/drone1" SET active false',
			
			'"drone/drone1" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone1" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"',
			
			'"drone/drone1/drone1/Motor_01" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_02" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_03" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_04" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_05" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_06" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_07" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_08" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1" ADD Thermal.ThermalObjectOverride',
			
			'"drone/drone1" SET Segmentation.ClassGroup itemsClassName "drone1"',
			'"drone/drone1/drone1" SET Transform position ({} {} {})'.format(0, 2, 0),
			
			'CREATE "{}" FROM "drones" AS "drone/drone2/drone2"'.format(helpers.drones_lst[7]), # Drones/Parrot Disco/Parrot Disco
			'"drone/drone2" ADD Segmentation.ClassGroup',
			'"drone/drone2" SET active false',
			
			'"drone/drone2/drone2" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone2/drone2" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"',
			
			'"drone/drone2/drone2/Engine" ADD Thermal.ThermalObjectOverride',
			'"drone/drone2/drone2/Engine_Element" ADD Thermal.ThermalObjectOverride',
			'"drone/drone2/drone2" ADD Thermal.ThermalObjectOverride',
			
			'"drone/drone2" SET Segmentation.ClassGroup itemsClassName "drone2"',
			'"drone/drone2/drone2" SET Transform position ({} {} {})'.format(0, 3, 0),
		], read=False)
		
		# randomize colors of drones
		helpers.addRandomColor(['drone/drone0/drone0', 'drone/drone1/drone1', 'drone/drone2/drone2'])
		
		common.sendData([
			'"drone/drone0" SET active true',
			'"drone/drone0/drone0" SET active true',
			'"drone/drone1" SET active true',
			'"drone/drone1/drone1" SET active true',
			'"drone/drone2" SET active true',
			'"drone/drone2/drone2" SET active true',
		], read=False)
	
	pX_r = [-3, 3]
	pY_r = [1.5, 8]
	pZ_r = [3, 9]
	
	pX = pX_r[0]
	pY = pY_r[0]
	pZ = pZ_r[0]
	
	pX_d = 1
	pY_d = 1
	pZ_d = 1
	
	# reset camera
	common.sendData([
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {})'.format(0, 1, 0),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(-20, 0, 0),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1]),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format(helpers.clouds_lst[2]),
		'"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
		'"drone" SET Transform position ({} {} {})'.format(pX, pY, pZ),
		'"drone" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
		
		'"spawner/cars" SET active False',
		
		# if not using cars, +thermal
		'"spawner/cars" ADD Thermal.ThermalObjectOverride',
		'"spawner/cars" SET active True',
		
		# disable blooming effects
		'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false',
	], read=False)
	
	helpers.setThermalProps('city', temperatureValue=0, temperatureBandwidth=0, temperatureMedian=0, variance=0, reflectivity=0, heatiness=0, ambientOffset=0)
	# helpers.setThermalProps('spawner/city', temperatureValue=18, temperatureBandwidth=20, temperatureMedian=1, variance=5)
	helpers.setThermalProps('spawner/animals', temperatureValue=22, temperatureBandwidth=20, temperatureMedian=1, variance=15, heatiness=1)
	helpers.setThermalProps('spawner/cars', temperatureValue=25, temperatureBandwidth=10, temperatureMedian=0, variance=15, heatiness=0)
	helpers.setThermalProps(['drone/drone0/drone0', 'drone/drone1/drone1', 'drone/drone2/drone2'], temperatureValue=0, temperatureBandwidth=0, temperatureMedian=0, variance=0, reflectivity=0, heatiness=-5)
	
	common.flushBuffer()
	loop = 0
	
	while loop < settings.loopLimit:
		if random.uniform(0,1) > .9:
			motionblur = 'true'
		else:
			motionblur = 'false'
		
		pX = pX + (random.uniform(.05, .75) * pX_d)
		pY = pY + (random.uniform(.01, .95) * pY_d)
		pZ = pZ + (random.uniform(.25, .75) * pZ_d)
		
		if pX_d == 1 and pX > pX_r[1]:
			pX_d = -1
		elif pX_d == -1 and pX < pX_r[0]:
			pX_d = 1
			
		if pY_d == 1 and pY > pY_r[1]:
			pY_d = -1
		elif pY_d == -1 and pY < pY_r[0]:
			pY_d = 1
		
		if pZ_d == 1 and pZ > pZ_r[1]:
			pZ_d = -1
		elif pZ_d == -1 and pZ < pZ_r[0]:
			pZ_d = 1
		
		"""
		# set drone body thermal
		helpers.setThermalProps(
			random.choice(['drone/drone0/drone0', 'drone/drone1/drone1', 'drone/drone2/drone2']),
			temperatureValue=random.randint(-10, 10), heatiness=random.randint(0, 2)
		)
		"""
		
		# set drone "hot" parts
		"""
		helpers.setThermalProps(
			random.choice([
				[
					'drone/drone0/drone0/bottom',
					'drone/drone0/drone0/motors'
				], [
					'drone/drone1/drone1/Motor_01',
					'drone/drone1/drone1/Motor_02',
					'drone/drone1/drone1/Motor_03',
					'drone/drone1/drone1/Motor_04',
					'drone/drone1/drone1/Motor_05',
					'drone/drone1/drone1/Motor_06',
					'drone/drone1/drone1/Motor_07',
					'drone/drone1/drone1/Motor_08'
				], [
					'drone/drone2/drone2/Engine',
					'drone/drone2/drone2/Engine_Element'
				]
			]),
			thermalObjectBehaviour={
				'temperature.value': '{}~{}'.format(10, 50),
				'heatiness.value': '{}~{}'.format(1, 10)
			},
			addComponent=False
		)
		"""
		
		helpers.setThermalProps(
			random.choice([
				[
					'drone/drone0/drone0/bottom',
					'drone/drone0/drone0/motors'
				], [
					'drone/drone1/drone1/Motor_01',
					'drone/drone1/drone1/Motor_02',
					'drone/drone1/drone1/Motor_03',
					'drone/drone1/drone1/Motor_04',
					'drone/drone1/drone1/Motor_05',
					'drone/drone1/drone1/Motor_06',
					'drone/drone1/drone1/Motor_07',
					'drone/drone1/drone1/Motor_08'
				], [
					'drone/drone2/drone2/Engine',
					'drone/drone2/drone2/Engine_Element'
				]
			]),
			temperatureValue='{}~{}'.format(10, 50), heatiness='{}~{}'.format(1, 10)
		)
		
		common.sendData([
			'"spawner/animals/birds" SET Transform position ({} {}~{} {}) eulerAngles ({} {}~{} {})'.format(0, 5, 75, 0, 0, 0, 359, 0),
			'"spawner/cars" SET Transform eulerAngles ({} {}~{} {})'.format(0, 0, 359, 0),
			'"spawner/city/nature" SET Transform eulerAngles ({} {}~{} {})'.format(0, 0, 359, 0),
			'"spawner/city/buildings" SET Transform eulerAngles ({} {}~{} {})'.format(0, 0, 359, 0),
			
			'"city" SET Transform eulerAngles ({} {}~{} {})'.format(0, 0, 359, 0),
			'"EnviroSky" SET EnviroSky GameTime.Hours {}~{}'.format(8, 12),
			
			'"drone" SET Transform position ({} {} {}) eulerAngles ({}~{} {}~{} {}~{})'.format(pX, pY, pZ, 0, 359, 0, 359, 0, 359),
			
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur),
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount 1',
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending 0.004'
		], read=False)
		
		common.flushBuffer()
		helpers.takeSnapshot(mycams, True)
		
		loop = loop + 1
