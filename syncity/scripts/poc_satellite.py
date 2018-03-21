import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

# use lite drone packages
# helpers.drones_lst = helpers.drones_lite_lst

def help():
	return '''\
POC Satellite
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
		helpers.global_camera_setup(mycams[1])
		helpers.add_camera_rgb(pp='EnviroFX')
		helpers.add_camera_seg()
		helpers.global_disk_setup()
		
		helpers.add_disk_output(mycams)
	
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
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {})'.format(262, 840, 243),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(90, 0, 0),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1]),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format(helpers.clouds_lst[2]),
		'"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
		# HACK: change output type to get multiple segmentation classIds working
		'cameras/segmentation SET Segmentation.Segmentation OutputType "InstanceIds"'
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
			# 'cameras SET Transform eulerAngles ({} {} {})'.format(-20, y, 0),
			'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(random.randint(8, 12)),
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur),
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount 1',
			'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending 0.004'
		], read=False)
		
		common.flush_buffer()
		helpers.take_snapshot(mycams, True)
		
		loop = loop + 1
