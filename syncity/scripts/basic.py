import random
import json
import sys
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Basic simple scene
	- Creates random cars simulating a parking lot pattern
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Spawns various objects
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		helpers.global_camera_setup()
		helpers.add_camera_rgb(flycam=settings.flycam, pp='EnviroFX')
		helpers.add_camera_seg(segments=['Car'])
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
		
		helpers.spawn_parking_lot(settings.cars_limit)
	
	# get position of the car in the center
	x = common.send_data('cars/car_{} GET Transform position'.format(int(settings.cars_limit / 2)))
	
	# this will return OK and a LIST, which we will parse as JSON to use as center of our spawning point
	try:
		pos = json.loads(x[1])
	except IndexError:
		common.output("Unable to fetch JSON from API, aborting")
		sys.exit(1)
	
	# spawn some random props around cars
	helpers.spawn_radius_generic(types=['city/buildings', 'city/props', 'city/signs'], position=pos, limit=100, radius=100, innerradius=50)
	
	# center camera an point down 20 degrees
	common.send_data([
		'cameras SET Transform position (-10 10 -100)',
		'cameras SET Transform eulerAngles (20 0 0)'
	])
	
	# force a render to visualize on the ui
	helpers.do_render(mycams)
