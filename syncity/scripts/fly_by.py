import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Fly by test
	- Spawns a complex scenario
	- Flys over with camera pointing down
	- Exports RGB images
	- Exports Segmented images
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		helpers.global_camera_setup()
		helpers.add_camera_rgb(width=4096, height=3072, flycam=settings.flycam, pp='EnviroFX')
		helpers.add_camera_seg()
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
		
		helpers.spawn_parking_lot(limit=200, fixed=True, p_y=5, dist_h=20, dist_v=20, p_x=-60, p_z=-90)
		
		helpers.spawn_radius_generic(['city/nature/trees'], collision_check=False, limit=250, radius=80, innerradius=30, position=[0,10,0])
		helpers.spawn_radius_generic(['city/signs'], limit=100, radius=35, innerradius=0, position=[0,10,0])
		helpers.spawn_radius_generic(['animals'], limit=300, radius=50, innerradius=0, position=[0,10,0])
		helpers.spawn_radius_generic(['city/buildings'], limit=100, radius=335, innerradius=80, position=[0,10,0])
		
		for i in range(0,9):
			helpers.spawn_radius_generic(['city/ground'], suffix='_{}'.format(i), limit=50, radius=50, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False)
	
	# force a render to visualize on the ui
	helpers.do_render(mycams)
	
	common.send_data(['cameras/cameraRGB SET Transform eulerAngles (90 0 0)'])
	common.send_data(['cameras/segmentation SET Transform eulerAngles (90 0 0)'])
	
	for x in range(-40, 40):
		for z in range(-40, 40):
			common.send_data([
				'cameras/cameraRGB SET Transform position ({} 50 {})'.format(x, z),
				'cameras/segmentation SET Transform position ({} 50 {})'.format(x, z)
			])
			
			# for i in range(0,200):
			#	send_data('cars/car_{} SET Transform eulerAngles ({} {} {})'.format(i, random.randint(0, 359), random.randint(0, 359), random.randint(0, 359)))
			
			helpers.take_snapshot(mycams)
			helpers.take_seg_snapshot([ 'cameras/segmentation' ])
