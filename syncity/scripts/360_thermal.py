import random
import subprocess
import os
import pathlib
import time
from .. import common, helpers, settings_manager


settings = settings_manager.Singleton()

def help():
	return '''\
360 thermal
	- Creates a RGB camera
	- Creates a Thermal camera
	- Creates a Segmentation camera
	- Spawns a single object and rotates around it
	- Randomize thermal parameters
	- Exports RGB images
	- Exports segmentation maps
	- Exports Thermal images
	- Exports bounding boxes
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
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/thermal']
	# obj = 'Cars/BMW6_Series_650i/BMW6_Series_650i'
	obj = 'Cars/VW_Golf_V/VW_Golf_V'
	# obj = 'humans Human/Runfast'
	
	if settings.skip_setup == False:
		helpers.global_camera_setup()
		
		helpers.add_camera_rgb(pp='EnviroFX')
		helpers.add_camera_seg(segments=['Car'], lookupTable=[['Car', 'red']])
		helpers.add_camera_thermal(ambientTemperature=3)
		
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
		common.send_data([
			# bind object to segmentation Car
			'CREATE "obj"',
			'"obj" ADD Segmentation.ClassGroup',
			'"obj" SET Segmentation.ClassGroup itemsClassName "Car"',
			
			'CREATE "obj/subject" "{}"'.format(obj),
			'"obj/subject" SET Transform position ({} {} {})'.format(0, 0, 0),
			'"obj/subject" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
			
			'"obj/subject" ADD Thermal.ThermalObjectOverride',
			
			'"obj/subject" ADD Thermal.ThermalObjectBehaviour',
			'"obj/subject" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"',
			
			'"obj" SET Transform position ({} {} {})'.format(-6, 0, -9),
			'"obj" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0)
			
	], read=False)
	
	# reset camera
	common.send_data([
		'"obj" SET active true',
		'"obj/subject" SET active true',
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {})'.format(0, 1, -16),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(0, -40, 0)
	], read=False)
	
	if settings.setup_only == True:
		return
	
	displ_x = 45
	displ_y = 2
	a_x = 0
	exp = 1
	
	while a_x < 360:
		a_y = 0
		output_fn = []
		
		# do a 360 around object
		while a_y < 360:
			# random agc values
			min_agc = random.randint(-10, 5)
			max_agc = random.randint(30, 150)
			
			helpers.set_thermal_props(
				'obj/subject',
				heatiness=random.uniform(0, 50), reflectivity=random.uniform(0, 1), ambientOffset=random.uniform(-25, 25),
				temperatureValue=random.uniform(-20, 50), temperatureBandwidth=random.uniform(0, 20), temperatureMedian=random.uniform(0, 1),
				variance=random.uniform(0, 50)
			)
			
			common.send_data([
				'"cameras/thermal" SET Thermal.ThermalCamera temperatureRange ({} {})'.format(min_agc, max_agc),
				'"obj" SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, 0),
				'"obj" SET Transform position ({} {} {})'.format(random.randint(-23, -3) , 0, 0)
			])
			
			a_y = a_y + displ_y
			helpers.take_snapshot(mycams, True)
			output_fn.append('{}{}_Cameras_camerargb.jpg'.format(settings.output_path, exp))
			exp = exp + 1
		
		# next
		a_x = a_x + displ_x
