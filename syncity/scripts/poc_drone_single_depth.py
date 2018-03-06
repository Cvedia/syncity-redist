import time
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
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Orbits around from ground perspective looking at drones
	- Exports segmentation map bounding boxes
	- Exports Depth images
	- Exports RGB images
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/depth']
	
	if settings.skip_setup == False:
		helpers.global_camera_setup()
		helpers.add_camera_rgb(width=1024, height=768, pp='EnviroFX')
		helpers.add_camera_depth(width=1024, height=768)
		helpers.add_camera_seg(width=1024, height=768, segments=['drone0', 'drone1', 'drone2'], lookupTable=[['drone0', 'red'], ['drone1','blue'], ['drone2', 'green']])
		helpers.global_disk_setup()
		
		helpers.add_disk_output(mycams)
		helpers.spawn_drone_objs(drones_limit=[0,0], buildings_innerradius=300, trees_innerradius=60, trees_radius=100, buildings_limit=[50,80])
		
		# single drone
		'''
		helpers.add_camera_seg_filter(['drone'])
		common.send_data([
			'CREATE drone/drone0/drone0 "{}"'.format(random.choice(helpers.drones_lst)),
			'drone/drone0 ADD Segmentation.ClassGroup',
			'drone/drone0 SET Segmentation.ClassGroup itemsClassName Drone'
		], read=False)
		'''
		
		common.send_data([
			'CREATE drone/drone0/drone0 "{}"'.format(helpers.drones_lst[6]), # Drones/DJI Phantom 4 Pro/DJI_Phantom_4_Pro
			'drone/drone0 SET active false',
			'drone/drone0 ADD Segmentation.ClassGroup',
			'drone/drone0 SET Segmentation.ClassGroup itemsClassName drone0',
			'drone/drone0/drone0 SET Transform position ({} {} {})'.format(0, 1, 0),
			'drone/drone0/drone0 SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
			'drone/drone0 SET active true',
			'drone/drone0/drone0 SET active true',
			
			'CREATE drone/drone1/drone1 "{}"'.format(helpers.drones_lst[4]), # Drones/DJI S1000/DJI S1000
			'drone/drone1 SET active false',
			'drone/drone1 ADD Segmentation.ClassGroup',
			'drone/drone1 SET Segmentation.ClassGroup itemsClassName drone1',
			'drone/drone1/drone1 SET Transform position ({} {} {})'.format(0, 2, 0),
			'drone/drone1/drone1 SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
			'drone/drone1 SET active true',
			'drone/drone1/drone1 SET active true',
			
			'CREATE drone/drone2/drone2 "{}"'.format(helpers.drones_lst[7]), # Drones/Parrot Disco/Parrot Disco
			'drone/drone2 SET active false',
			'drone/drone2 ADD Segmentation.ClassGroup',
			'drone/drone2 SET Segmentation.ClassGroup itemsClassName drone2',
			'drone/drone2/drone2 SET Transform position ({} {} {})'.format(0, 3, 0),
			'drone/drone2/drone2 SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
			'drone/drone2 SET active true',
			'drone/drone2/drone2 SET active true',
			
			# magic for depth maps
			
			# 'cameras/depth SET Sensors.Lidar_Internal.RenderDepthBufferOld outputMode RawDepth',
			# 'disk1/Cameras/depth SET Sensors.RenderCameraLink outputType DEPTH'
			# 'disk1/Cameras/depth SET Sensors.RenderCameraLink outputType BLOB'
			
			# 'cameras/depth SET Sensors.Lidar_Internal.RenderDepthBufferOld outputMode NormalizedDistance',
			# 'disk1/Cameras/depth SET Sensors.RenderCameraLink outputType DEPTH'
			# 'disk1/Cameras/depth SET Sensors.RenderCameraLink outputType BLOB'
			
			# 'cameras/depth SET Sensors.Lidar_Internal.RenderDepthBufferOld enabled false',
			# 'cameras/depth ADD CameraDepthOutput',
			
			'disk1/Cameras/depth SET Sensors.RenderCameraLink outputType DEPTH',
			
			'{} SET Sensors.RenderCamera alwaysOn true'.format(mycams[0]),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled true'.format(mycams[0]),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.shutterAngle {}'.format(mycams[0], 270),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount {}'.format(mycams[0], 32),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending {}'.format(mycams[0], 1)
		], read=False)
	
	if settings.setup_only == True:
		return
	
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
		'cameras/cameraRGB SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false',
		
		# remove propellers
		'DELETE drone/drone0/drone0/propeller_BL',
		'DELETE drone/drone0/drone0/propeller_BR',
		'DELETE drone/drone0/drone0/propeller_FL',
		'DELETE drone/drone0/drone0/propeller_FR',
		
		'DELETE drone/drone1/drone1/Motor_01',
		'DELETE drone/drone1/drone1/Motor_02',
		'DELETE drone/drone1/drone1/Motor_03',
		'DELETE drone/drone1/drone1/Motor_04',
		'DELETE drone/drone1/drone1/Motor_05',
		'DELETE drone/drone1/drone1/Motor_06',
		'DELETE drone/drone1/drone1/Motor_07',
		'DELETE drone/drone1/drone1/Motor_08',
		
		'DELETE drone/drone2/drone2/Propeller'
	], read=False)
	
	common.flush_buffer()
	loop = 0
	
	while loop < 100:
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
		
		common.send_data([
			'cameras/cameraRGB SET Camera enabled false',
			'spawner/animals/birds SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
			'spawner/animals/birds SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'spawner/cars SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'spawner/city/nature SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'spawner/city/buildings SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'city SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'EnviroSky SET EnviroSky GameTime.Hours {}'.format(random.randint(8, 12)),
			'drone SET Transform position ({} {} {})'.format(p_x, p_y, p_z),
			'drone SET Transform eulerAngles ({} {} {})'.format(random.randint(0, 359), random.randint(0, 359), random.randint(0, 359)),
			'cameras/cameraRGB SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur)
		], read=False)
		
		common.flush_buffer()
		
		# this is a workaround for the propellers to blur, in order to have the 
		# motion blur correctly made, we need to allow the system to render a few
		# frames, before taking the screenshot
		if motionblur == 'true':
			common.send_data('cameras/cameraRGB SET Camera enabled true', read=True)
			time.sleep(0.5)
		
		helpers.take_snapshot(mycams, True)
		
		loop = loop + 1
