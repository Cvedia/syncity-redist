import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
POC Drone single scene
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Orbits around from ground perspective looking at drones
	- Exports segmentation map bounding boxes
	- Exports RGB images
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		helpers.global_camera_setup()
		helpers.add_camera_rgb(width=4096, height=3072, pp='EnviroFX')
		helpers.add_camera_seg(output_type='ClassIds')
		helpers.global_disk_setup()
		
		helpers.add_disk_output(mycams)
		helpers.spawn_drone_objs(drones_limit=[0,0],trees_innerradius=60, trees_radius=100)
		
		# single drone
		'''
		helpers.add_camera_seg_filter(['drone'])
		common.send_data([
			'CREATE drone "{}"'.format(random.choice(helpers.drones_lst)),
			'drone ADD Segmentation.ClassGroup',
			'drone SET Segmentation.ClassGroup itemsClassName Drone'
		], read=False)
		'''
		
		# multiple individually segmented drones stacked
		helpers.add_camera_seg_filter(['drone0','drone1', 'drone2'])
		common.send_data([
			'CREATE drone/drone0 "{}"'.format(random.choice(helpers.drones_lst)),
			'drone/drone0 ADD Segmentation.ClassGroup',
			'drone/drone0 SET Segmentation.ClassGroup itemsClassName drone0',
			'drone/drone0 SET Transform position ({} {} {})'.format(0, 1, 0),
			
			'CREATE drone/drone1 "{}"'.format(random.choice(helpers.drones_lst)),
			'drone/drone1 ADD Segmentation.ClassGroup',
			'drone/drone1 SET Segmentation.ClassGroup itemsClassName drone1',
			'drone/drone1 SET Transform position ({} {} {})'.format(0, 1.5, 0),
			
			'CREATE drone/drone2 "{}"'.format(random.choice(helpers.drones_lst)),
			'drone/drone2 ADD Segmentation.ClassGroup',
			'drone/drone2 SET Segmentation.ClassGroup itemsClassName drone2',
			'drone/drone2 SET Transform position ({} {} {})'.format(0, 2, 0)
		], read=False)
	
	# p_x_r = [-17, 13]
	# p_y_r = [1.5, 17]
	# p_z_r = [24, 42]
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
		'cameras/cameraRGB SET Camera enabled true',
		'cameras SET Transform position ({} {} {})'.format(0, 1, 0),
		'cameras SET Transform eulerAngles ({} {} {})'.format(-20, 0, 0),
		'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1]),
		'EnviroSky SET EnviroSky cloudsMode {}'.format(helpers.clouds_lst[2]),
		'EnviroSky SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
		'drone SET Transform position ({} {} {})'.format(p_x, p_y, p_z),
		'drone SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
		# disable blooming effects
		'cameras/cameraRGB SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false'
	], read=False)
	
	loop = 0
	
	while loop < 100:
		if random.uniform(0,1) > .8:
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
		
		common.send_data([
			'spawner/animals/birds SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
			'spawner/animals/birds SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'spawner/cars SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'spawner/city/nature SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'spawner/city/buildings SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			# 'cameras SET Transform eulerAngles ({} {} {})'.format(-20, y, 0),
			'city SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'EnviroSky SET EnviroSky GameTime.Hours {}'.format(random.randint(8, 18)),
			'drone SET Transform position ({} {} {})'.format(p_x, p_y, p_z),
			'drone SET Transform eulerAngles ({} {} {})'.format(random.randint(0, 359), random.randint(0, 359), random.randint(0, 359)),
			'cameras/cameraRGB SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur),
			'cameras/cameraRGB SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount 1',
			'cameras/cameraRGB SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending 0.004'
		], read=False)
		
		common.flush_buffer()
		helpers.take_snapshot(mycams, True)
		# helpers.take_seg_snapshot([ 'cameras/segmentation' ])
		
		loop = loop + 1
