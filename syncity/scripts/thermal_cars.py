import random
import json
import sys
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Simple car thermal show off
	- Creates a RGB camera with thermal
	- Creates some cars
	- Rotate cars around changing the ambient temperature and car thermal properties
	- Exports RGB images
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/thermal']

	if settings.skip_setup == False:
		helpers.global_camera_setup()
		helpers.add_camera_rgb(width=4096, height=3072, pp='EnviroFX')
		helpers.add_camera_thermal(
			clipping_far=10000,
			
			trees=True,
			ambientTemperature=15, minimumTemperature=9, maximumTemperature=35,
			trees_base=8, trees_bandwidth=50, trees_median=0, trees_leafs_variance=10,
		)
		
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
		
		helpers.spawn_radius_generic(
			['car, +thermal'], limit=15, radius=25, innerradius=0,
			collision_check=False, segmentation_class="Car", orbit=True, position=[0,10,0]
		)
		
		helpers.camera_pp_thermal()
		
		# for i in range(0,9):
		#	helpers.spawn_radius_generic(['ground'], suffix='_{}'.format(i), limit=5, radius=50, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False)
	
	dist = -18
	azimuth = 30
	elevation = 2.5
	
	common.send_data([
		'"cameras" SET Orbit distance {}'.format(dist),
		'"cameras" SET Orbit elevation {}'.format(elevation),
		'"cameras" SET Orbit azimuth {}'.format(azimuth)
	])
	
	# get spanwed objects - this returns an array
	spawned_cars = json.loads(''.join(common.send_data('"{}" GET CHILDREN'.format('spawner/car___thermal'))[1:]))
	
	if len(spawned_cars) == 0:
		common.output('No thermal cars spawned, maybe your asset package doesn\'t include any. Aborting!');
		sys.exit(0)
	
	r_y = 0
	r_y_displacement = 5
	
	while r_y < 360:
		robj = 'spawner/car___thermal/{}'.format(random.choice(spawned_cars))
		
		common.send_data([
			'"spawner/car___thermal" SET Transform eulerAngles ({} {} {})'.format(0, r_y, 0),
			# set a random ambient temperature
			'"{}" SET Thermal.Thermal AmbientTemperature {}'.format('cameras/cameraRGB', random.randint(0, 20)), # -50 - 50 float
			
			# change thermal properties of a random spawned object
			'"{}" SET Thermal.TemperatureInfo temperature {}'.format(robj, random.randint(20, 50)), # 0 - 500
			'"{}" SET Thermal.TemperatureInfo bandwidth {}'.format(robj, random.uniform(0, 20)), # 0 - 20 float
			'"{}" SET Thermal.TemperatureInfo median {}'.format(robj, random.uniform(0, 1)), # 0 - 1 float
			
			'"{}" SET Thermal.HeatinessInfo value {}'.format(robj, random.randint(0, 100)), # 0 - 250
			'"{}" SET Thermal.VarianceInfo value {}'.format(robj, random.uniform(10, 50)), # 0 - 50 float
			'"{}" SET Thermal.ReflectivityInfo value {}'.format(robj, random.uniform(0.1, 0.6)) # 0 - 1 float
		])
		
		helpers.take_snapshot(mycams)
		r_y += r_y_displacement
