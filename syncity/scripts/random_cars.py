import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Simple random experimentation with segmentation and fixed assets
	- Creates random named cars in random positions
	- Creates a RGB camera
	- Creates a segmentation map camera
	- Rotates cars and cameras at random
	- Changes camera parameters at random
	- Exports segmentation map bounding boxes
	- Exports RGB images
'''

def run():
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		helpers.global_camera_setup()
		helpers.add_camera_rgb(flycam=settings.flycam, pp='EnviroFX')
		helpers.add_camera_seg(segments=['Car'])
		
		if settings.envirosky == False:
			helpers.add_light()
		
		helpers.global_disk_setup()
		
		helpers.add_disk_output(mycams)
		
		# list all childs
		common.send_data('"cameras" GET children')
		# list all properties
		common.send_data('"cameras" GET properties')
		# list all properties from transform
		common.send_data('"cameras" GET properties transform')
	
	# load all cars cars_limit times on scene
	k = 0
	
	p_x = -15
	p_z = -30
	dist_h = 7 # car front
	dist_v = 4 # car side
	dist_lim = 30 # z distance limit
	
	while k < settings.cars_limit:
		common.send_data([
			'CREATE "Cars/?" FROM "cars" AS "mycar_{}"'.format(k),
			'"mycar_{}" ADD Segmentation.ClassGroup'.format(k),
			'"mycar_{}" SET Segmentation.ClassGroup itemsClassName "Car"'.format(k),
			'"mycar_{}" SET Transform position ({} {} {})'.format(k, p_x + settings.X_COMP, 5 + settings.Y_COMP, p_z + settings.Z_COMP),
			'"mycar_{}" SET active true'.format(k)
		])
		
		settings.obj.append('mycar_{}'.format(k))
		p_z += dist_h
		k += 1
		
		if p_z > dist_lim:
			p_z = -dist_lim
			p_x += dist_v
	
	a = 0
	while a < 360:
		# one dimension camera sweep in 10 degrees steps
		common.send_data('"camera" SET Transform eulerAngles (0 {} 0)'.format(a))
		k = 0
		
		while k < cars_limit:
			# make sure car is on camera's fov
			# common.send_data('mycar_{} FRUSTUM mycamera RIGHT {} DOWN {} DEPTH {}'.format(k, random.uniform(0, 1), random.uniform(0, 1), random.randint(5, 120)))
			# rotate car at random
			common.send_data('"mycar_{}" SET Transform eulerAngles ({} {} {})'.format(k, random.randint(0, 359), random.randint(0, 359), random.randint(0, 359)))
			k += 1
		
		# all possible properties - https://docs.unity3d.com/ScriptReference/Camera.html
		# common.send_data('camera/cameraRGB SET fieldOfView {}'.format(random.randint(60, 90)))
		# common.send_data('camera/cameraRGB SET aspect {}'.format(random.uniform(0, 1)))
		
		helpers.take_snapshot(mycams)
		helpers.take_seg_snapshot([ 'cameras/segmentation' ])
		
		a += 10
