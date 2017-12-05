import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

# if you want to show a description on --help section
def help():
	return '''\
My script description
	- blah
	- blah
	- blah
'''

# this is called when everything is ready to start
def run():
	# keeps created objects on scene after exit
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		# basic camera setup
		helpers.global_camera_setup()
		# creates a camera with envirofx postprocessing
		helpers.add_camera_rgb(flycam=flycam, pp='EnviroFX')
		# creates a segmentation camera
		helpers.add_camera_seg()
		# disk output setup
		helpers.global_disk_setup()
		# binds cameras to disk output
		helpers.add_disk_output(mycams)
		
		# spawn something, ideally you'd have this methods within this script instead of placing them on helpers
		helpers.spawn_parking_lot(settings.cars_limit)
	
	# get position of the car in the center
	x = common.send_data('cars/car_{} GET Transform position'.format(int(settings.cars_limit / 2)))
	
	# this will return OK and a LIST, which we will parse as JSON to use as center of our spawning point
	pos = json.loads(x[1])
	
	# spawn some random props around cars
	helpers.spawn_radius_generic(types=['city/buildings', 'city/props', 'city/signs'], position=pos, limit=100, radius=100, innerradius=50)
	
	# center camera an point down 20 degrees
	common.send_data([
		'cameras SET Transform position (-10 10 -100)',
		'cameras SET Transform eulerAngles (20 0 0)'
	])
	
	# force a render to visualize on the ui
	helpers.do_render(mycams)
