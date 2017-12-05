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
		helpers.add_camera_seg(segment='Car')
		helpers.global_disk_setup()
		
		helpers.add_disk_output(mycams)
		helpers.spawn_drone_objs(drones_limit=[0,0])
		
		common.send_data([
			'CREATE drone drones/?'
		])
	
	p_x_r = [-17, 13]
	p_y_r = [0.5, 17]
	p_z_r = [24, 42]
	
	p_x = p_x_r[0]
	p_y = p_y_r[0]
	p_z = p_z_r[0]
	
	p_x_d = 1
	p_y_d = 1
	p_z_d = 1
	
	a_x = 0
	a_y = 0
	a_z = 0
	
	# reset camera
	common.send_data([
		'cameras/cameraRGB SET Camera enabled true',
		'cameras SET Transform position ({} {} {})'.format(0, 1, 0),
		# 'cameras SET Transform eulerAngles ({} {} {})'.format(-20, -45, 0),
		'cameras SET Transform eulerAngles ({} {} {})'.format(-20, 0, 0),
		'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1]),
		'EnviroSky SET EnviroSky cloudsMode {}'.format(helpers.clouds_lst[2]),
		'EnviroSky SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
		'drone SET Transform position ({} {} {})'.format(p_x, p_y, p_z),
		'drone SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, a_z)
	])
	
	loop = 0
	
	while loop < 100:
		if random.uniform(0,1) > .8:
			motionblur = 'true'
		else:
			motionblur = 'false'
		
		p_x = p_x + (random.uniform(.5, 2.5) * p_x_d)
		p_y = p_y + (random.uniform(.1, 1.5) * p_y_d)
		p_z = p_z + (random.uniform(.1, 1.5) * p_z_d)
		
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
			'drone SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, a_z),
			'cameras/cameraRGB SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur),
			'cameras/cameraRGB SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount 1',
			'cameras/cameraRGB SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending 0.004'
		], read=False)
		
		helpers.take_snapshot(mycams, True)
		# helpers.take_seg_snapshot([ 'cameras/segmentation' ])
		
		loop = loop + 1
