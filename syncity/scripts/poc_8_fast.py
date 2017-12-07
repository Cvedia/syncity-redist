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
		helpers.global_camera_setup()
		helpers.add_camera_rgb(width=1024, height=768, flycam=settings.flycam, pp='EnviroFX')
		helpers.add_camera_seg(segments=['Car'])
		helpers.global_disk_setup()
		
		helpers.add_disk_output(mycams)
		helpers.spawn_radius_generic(['city/nature/trees'], collision_check=False, limit=50, radius=80, innerradius=30, position=[0,10,0])
		helpers.spawn_radius_generic(['city/signs'], limit=10, radius=35, innerradius=0, position=[0,10,0])
		# spawn_radius_generic(['animals'], limit=300, radius=50, innerradius=0, position=[0,10,0])
		helpers.spawn_radius_generic(['city/buildings'], limit=10, radius=335, innerradius=80, position=[0,10,0])
		helpers.spawn_radius_generic(['cars'], limit=10, radius=50, innerradius=0, segmentation_class="Car", orbit=True, position=[0,10,0])
		
		for i in range(0,9):
			helpers.spawn_radius_generic(['city/ground'], suffix='_{}'.format(i), limit=3, radius=50, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False)
	
	dist = -60
	dist_e = 5 # elevation increment
	dist_a = 10 # azimuth increment
	elevation = 60
	loops = 0
	reroll = 10
	
	while elevation < 120:
		azimuth = 0
		
		while azimuth < 360:
			common.send_data([
				'cameras SET Orbit distance {}'.format(dist),
				'cameras SET Orbit elevation {}'.format(elevation),
				'cameras SET Orbit azimuth {}'.format(azimuth),
				'EnviroSky SET EnviroSky GameTime.Hours {}'.format(random.randint(6, 18))
			])
			
			helpers.take_snapshot(mycams)
			helpers.take_seg_snapshot([ 'cameras/segmentation' ])
			loops += 1
			
			if loops == reroll:
				loops = 0
				helpers.spawn_misc_objs(True)
			
			azimuth += dist_a
		
		elevation += dist_e
