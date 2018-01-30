import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Parking lot orbiting
	- Creates random cars simulating a parking lot pattern
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Orbits around the car on the center
	- Exports RGB images
	- Exports Segmented images
'''

def run():
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		helpers.global_camera_setup()
		helpers.add_camera_rgb(pp='EnviroFX')
		helpers.add_camera_seg(segments=['Car'])
		
		# if settings.envirosky == False:
		# 	helpers.add_light()
		
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
		
		helpers.spawn_parking_lot(settings.cars_limit)
	
	# force a render to visualize on the ui
	helpers.do_render(mycams)
	
	dist = -50
	dist_e = 5 # elevation increment
	dist_a = 10 # azimuth increment
	elevation = 15
	common.send_data('cameras SET Orbit target cars/car_{}'.format(int(settings.cars_limit / 2))) # get a car roughtly on the center
	
	# orbit car in the center
	while elevation < 90:
		azimuth = 0
		
		while azimuth < 360:
			common.send_data([
				'cameras SET Orbit distance {}'.format(dist),
				'cameras SET Orbit elevation {}'.format(elevation),
				'cameras SET Orbit azimuth {}'.format(azimuth)
			])
			
			helpers.take_snapshot(mycams)
			helpers.take_seg_snapshot([ 'cameras/segmentation' ])
			
			azimuth += dist_a
		
		elevation += dist_e
