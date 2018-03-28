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
	obj = helpers.drones_lst[7]
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup(orbit=False, flycam=True)
		
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.addCameraSeg(segments=['Car'], lookupTable=[['Car', 'red']])
		helpers.addCameraThermal(ambientTemperature=3)
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		common.sendData([
			# bind object to segmentation Car
			'CREATE "obj"',
			'"obj" ADD Segmentation.ClassGroup',
			'"obj" SET Segmentation.ClassGroup itemsClassName "Car"',
			
			# 'CREATE "{}" FROM "cars" AS "obj/subject"'.format(obj),
			'CREATE "{}" FROM "drones" AS "obj/subject"'.format(obj),
			
			'"obj" ADD Thermal.ThermalObjectBehaviour',
			'"obj" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"',
			
			'"obj/subject" ADD Thermal.ThermalObjectOverride',
			
			# '"obj/subject" ADD Thermal.ThermalObjectBehaviour',
			# '"obj/subject" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"',
			
			'"obj/subject" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 0, 0, 0, 0, 0),
			'"obj" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(-6, 0, -9, 0, 0, 0)
			
	], read=False)
	
	# reset camera
	common.sendData([
		'"obj" SET active true',
		'"obj/subject" SET active true',
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 1, -16, 0, -40, 0)
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
			common.sendData('"obj" SET active false', read=False)
			
			helpers.setThermalProps(
				'obj/subject',
				heatiness=[0, 50], reflectivity=[0, 1], ambientOffset=[-25, 25],
				temperatureValue=[-20, 50], temperatureBandwidth=[0, 20], temperatureMedian=[0, 1],
				variance=[0, 50]
			)
			
			common.sendData('"obj" SET active true', read=False)
			
			common.sendData([
				'"cameras/thermal" SET Thermal.ThermalCamera temperatureRange ({}~{} {}~{})'.format(-10, 5, 30, 150),
				'"obj" SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, 0),
				'"obj" SET Transform position ({}~{} {} {})'.format(-23, -3, 0, 0)
			])
			
			a_y = a_y + displ_y
			helpers.takeSnapshot(mycams, True)
			output_fn.append('{}{}_Cameras_camerargb.jpg'.format(settings.output_path, exp))
			exp = exp + 1
		
		# next
		a_x = a_x + displ_x
