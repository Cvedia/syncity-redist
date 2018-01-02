import random
import subprocess
import os
import pathlib
import time
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
360 object 2 Yolo
	- Creates a RGB camera
	- Spawns a single object and rotates around it
	- Exports RGB images
	- Runs a batch of 360 against yolo
	- Saves detections
	- Exits leaving all objects exposed

WARNING: In order to run this you need to have syncity custom yolo version, you
can find this on a specific branch under our repository, for both windows and
linux.

'''

def dump_data(path, data):
	fh = open('{}input.txt'.format(path), 'w+')
	fh.write('\n'.join(data))
	fh.close()

def write_filtered(line):
	fh = open('__filtered.txt', 'a+')
	fh.write(line)
	fh.close()

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB']
	obj = 'Cars/Cars_Thermal/BMW6_Series_650i/BMW6_Series_650i'
	
	if settings.skip_setup == False:
		helpers.global_camera_setup()
		helpers.add_camera_rgb(width=4096, height=3072, pp='EnviroFX', thermal=True, thermal_ambientTemperature=3)
		# helpers.add_camera_seg(segments=['Car'])
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
		common.send_data([
			'CREATE obj {}'.format(obj),
			# 'obj ADD Segmentation.ClassGroup',
			# 'obj SET Segmentation.ClassGroup itemsClassName Car',
			'obj SET Transform position ({} {} {})'.format(-6, 0, -9),
			'obj SET Transform eulerAngles ({} {} {})'.format(0, 0, 0)
		], read=False)
	
	# reset camera
	common.send_data([
		'cameras/cameraRGB SET Camera enabled true',
		'cameras SET Transform position ({} {} {})'.format(0, 1, -16),
		'cameras SET Transform eulerAngles ({} {} {})'.format(0, -40, 0),
		'EnviroSky SET EnviroSky cloudsMode {}'.format('Volume'),
		'EnviroSky SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
		'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1])
		
		# 'CREATE city/ground_0 city/ground/Grass',
		# 'city/ground_0 SET Transform position (0 0 0)',
		# 'city/ground_0 SET Transform localScale (5 5 5)'
	], read=False)
	
	displ_x = 5
	displ_y = 2
	a_x = 0
	exp = 1
	
	while a_x < 360:
		a_y = 0
		output_fn = []
		
		# do a 360 around object
		while a_y < 360:
			common.send_data([
				'obj SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, 0)
			])
			a_y = a_y + displ_y
			helpers.take_snapshot(mycams, False)
			output_fn.append('{}{}_Cameras_camerargb.jpg'.format(settings.output_path, exp))
			exp = exp + 1
		
		# next
		a_x = a_x + displ_x
