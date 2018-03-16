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
	parser.add_argument('--loop_limit', type=int, default=100, help='Defines a limit of iterations for exporting')
	parser.add_argument('--segment_all', action='store_true', default=False, help='Defines a segmentation class for all spawned objects')

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/depth', 'cameras/thermal']
	
	if settings.skip_setup == False:
		helpers.global_camera_setup()
		helpers.add_camera_rgb(width=4096, height=3072, pp='EnviroFX')
		helpers.add_camera_depth(width=1024, height=768)
		
		# Note on bbox output:
		# classId aligns with the order you define the segments, for example:
		# segments=['drone0', 'drone1', 'drone2']
		# classId:     1         2         3       ....
		
		if settings.segment_all:
			helpers.add_camera_seg(
				width=4096, height=3072,
				segments=['drone0', 'drone1', 'drone2'],
				lookupTable=[['drone0', 'red'], ['drone1','blue'], ['drone2', 'green'], ['ground', '#C0CBE6FF'], ['tree', '#CFD83AFF'], ['building', '#7E0E62FF'], ['bird', '#33D45EFF'], ['car', '#00FD26FF']]
			)
		else:
			helpers.add_camera_seg(
				width=4096, height=3072,
				segments=['drone0', 'drone1', 'drone2'],
				lookupTable=[['drone0', 'red'], ['drone1','blue'], ['drone2', 'green']]
			)
		
		helpers.add_camera_thermal(
			trees=True,
			ambientTemperature=15, minimumTemperature=9, maximumTemperature=35,
			trees_base=8, trees_bandwidth=50, trees_median=0, trees_leafs_variance=10
		)
		
		helpers.global_disk_setup()
		
		helpers.add_disk_output(mycams)
		#
		# NOTE for cars_tags:
		#
		# use only 'car' to spawn cars without thermal signature, that will be then
		# linked to a default profile, note that this will not show full detail, but
		# it's pretty much the same from a distance.
		#
		# use 'car, +thermal' to spawn only cars with thermal profiles
		#
		
		if settings.segment_all:
			helpers.spawn_drone_objs(
				drones_limit=[0,0], buildings_innerradius=300,
				trees_limit=[300,600], trees_innerradius=30, trees_radius=50, buildings_limit=[50,80],
				thermal='DefaultThermalProfile',
				cars_colors=16,
				cars_tags=['car, +thermal'],
				seed=666,
				ground_segment='ground', trees_segment='tree', buildings_segment='building', birds_segment='bird', cars_segment='car'
			)
		else:
			helpers.spawn_drone_objs(
				drones_limit=[0,0], buildings_innerradius=300,
				trees_limit=[300,600], trees_innerradius=30, trees_radius=50, buildings_limit=[50,80],
				thermal='DefaultThermalProfile',
				cars_colors=16,
				cars_tags=['car, +thermal'],
				seed=666
			)
		
		common.send_data([
			'CREATE "drone/drone0/drone0" "{}"'.format(helpers.drones_lst[6]), # Drones/DJI Phantom 4 Pro/DJI_Phantom_4_Pro
			'"drone/drone0" ADD Segmentation.ClassGroup',
			'"drone/drone0" SET active false',
			
			'"drone/drone0/drone0/bottom" ADD Thermal.ThermalObjectOverride',
			'"drone/drone0/drone0/bottom" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone0/drone0/bottom" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			'"drone/drone0/drone0/motors" ADD Thermal.ThermalObjectOverride',
			'"drone/drone0/drone0/motors" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone0/drone0/motors" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone0/drone0" ADD Thermal.ThermalObjectOverride',
			'"drone/drone0/drone0" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone0/drone0" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone0" SET Segmentation.ClassGroup itemsClassName drone0',
			'"drone/drone0/drone0" SET Transform position ({} {} {})'.format(0, 1, 0),
			
			'CREATE "drone/drone1/drone1" "{}"'.format(helpers.drones_lst[4]), # Drones/DJI S1000/DJI S1000
			'"drone/drone1" ADD Segmentation.ClassGroup',
			'"drone/drone1" SET active false',
			
			'"drone/drone1/drone1/Motor_01" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_01" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone1/drone1/Motor_01" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone1/drone1/Motor_02" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_02" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone1/drone1/Motor_02" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone1/drone1/Motor_03" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_03" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone1/drone1/Motor_03" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone1/drone1/Motor_04" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_04" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone1/drone1/Motor_04" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone1/drone1/Motor_05" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_05" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone1/drone1/Motor_05" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone1/drone1/Motor_06" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_06" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone1/drone1/Motor_06" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone1/drone1/Motor_07" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_07" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone1/drone1/Motor_07" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone1/drone1/Motor_08" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1/Motor_08" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone1/drone1/Motor_08" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone1/drone1" ADD Thermal.ThermalObjectOverride',
			'"drone/drone1/drone1" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone1/drone1" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone1" SET Segmentation.ClassGroup itemsClassName drone1',
			'"drone/drone1/drone1" SET Transform position ({} {} {})'.format(0, 2, 0),
			
			'CREATE "drone/drone2/drone2" "{}"'.format(helpers.drones_lst[7]), # Drones/Parrot Disco/Parrot Disco
			'"drone/drone2" ADD Segmentation.ClassGroup',
			'"drone/drone2" SET active false',
			
			'"drone/drone2/drone2/Engine" ADD Thermal.ThermalObjectOverride',
			'"drone/drone2/drone2/Engine" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone2/drone2/Engine" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone2/drone2/Engine_Element" ADD Thermal.ThermalObjectOverride',
			'"drone/drone2/drone2/Engine_Element" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone2/drone2/Engine_Element" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone2/drone2" ADD Thermal.ThermalObjectOverride',
			'"drone/drone2/drone2" ADD Thermal.ThermalObjectBehaviour',
			'"drone/drone2/drone2" SET Thermal.ThermalObjectBehaviour profile DefaultThermalProfile',
			
			'"drone/drone2" SET Segmentation.ClassGroup itemsClassName drone2',
			'"drone/drone2/drone2" SET Transform position ({} {} {})'.format(0, 3, 0),
		], read=False)
		
		# randomize colors of drones
		helpers.add_random_color(['drone/drone0/drone0', 'drone/drone1/drone1', 'drone/drone2/drone2'])
		
		common.send_data([
			'"drone/drone0" SET active true',
			'"drone/drone0/drone0" SET active true',
			'"drone/drone1" SET active true',
			'"drone/drone1/drone1" SET active true',
			'"drone/drone2" SET active true',
			'"drone/drone2/drone2" SET active true',
		], read=False)
	
	p_x_r = [-3, 3]
	p_y_r = [1.5, 8]
	p_z_r = [3, 9]
	
	p_x = p_x_r[0]
	p_y = p_y_r[0]
	p_z = p_z_r[0]
	
	p_x_d = 1
	p_y_d = 1
	p_z_d = 1
	
	# reset camera
	common.send_data([
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {})'.format(0, 1, 0),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(-20, 0, 0),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1]),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format(helpers.clouds_lst[2]),
		'"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
		'"drone" SET Transform position ({} {} {})'.format(p_x, p_y, p_z),
		'"drone" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
		
		'"spawner/cars" SET active False',
		
		# if not using cars, +thermal
		'"spawner/cars" ADD Thermal.ThermalObjectOverride',
		'"spawner/cars" SET active True',
		
		# disable blooming effects
		'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false',
	], read=False)
	
	helpers.set_thermal_props('city', temperatureValue=0, temperatureBandwidth=0, temperatureMedian=0, variance=0, reflectivity=0, heatiness=0, ambientOffset=0)
	
	# helpers.set_thermal_props('spawner/city', temperatureValue=18, temperatureBandwidth=20, temperatureMedian=1, variance=5)
	
	helpers.set_thermal_props('spawner/animals', temperatureValue=22, temperatureBandwidth=20, temperatureMedian=1, variance=15, heatiness=1)
	helpers.set_thermal_props('spawner/cars', temperatureValue=25, temperatureBandwidth=10, temperatureMedian=0, variance=15, heatiness=0)
	helpers.set_thermal_props(['drone/drone0/drone0', 'drone/drone1/drone1', 'drone/drone2/drone2'], temperatureValue=0, temperatureBandwidth=0, temperatureMedian=0, variance=0, reflectivity=0, heatiness=-5)
	
	common.flush_buffer()
	loop = 0
	
	while loop < settings.loop_limit:
		if random.uniform(0,1) > .9:
			motionblur = 'true'
		else:
			motionblur = 'false'
		
		p_x = p_x + (random.uniform(.05, .75) * p_x_d)
		p_y = p_y + (random.uniform(.01, .95) * p_y_d)
		p_z = p_z + (random.uniform(.25, .75) * p_z_d)
		
		if p_x_d == 1 and p_x > p_x_r[1]:
			p_x_d = -1
		elif p_x_d == -1 and p_x < p_x_r[0]:
			p_x_d = 1
			
		if p_y_d == 1 and p_y > p_y_r[1]:
			p_y_d = -1
		elif p_y_d == -1 and p_y < p_y_r[0]:
			p_y_d = 1
		
		if p_z_d == 1 and p_z > p_z_r[1]:
			p_z_d = -1
		elif p_z_d == -1 and p_z < p_z_r[0]:
			p_z_d = 1
		
		"""
		# set drone body thermal
		helpers.set_thermal_props(
			random.choice(['drone/drone0/drone0', 'drone/drone1/drone1', 'drone/drone2/drone2']),
			temperatureValue=random.randint(-10, 10), heatiness=random.randint(0, 2)
		)
		"""
		
		# set drone "hot" parts
		helpers.set_thermal_props(
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
			temperatureValue=random.randint(10, 50), heatiness=random.randint(1, 10)
		)
		
		common.send_data([
			'"spawner/animals/birds" SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
			'"spawner/animals/birds" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/cars" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/city/nature" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/city/buildings" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			
			'"city" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(random.randint(8, 12)),
			
			'"drone" SET Transform position ({} {} {})'.format(p_x, p_y, p_z),
			'"drone" SET Transform eulerAngles ({} {} {})'.format(random.randint(0, 359), random.randint(0, 359), random.randint(0, 359)),
			
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur),
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount 1',
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending 0.004'
		], read=False)
		
		common.flush_buffer()
		helpers.take_snapshot(mycams, True)
		
		loop = loop + 1
