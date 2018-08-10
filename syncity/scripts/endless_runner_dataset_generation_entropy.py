import subprocess
import os
import pathlib
import time
from .. import common, helpers, settings_manager
from random import randint

settings = settings_manager.Singleton()

def help():
	return '''\
Endless runner dataset generation exporter

Run this after running dataset_generation_entropy to export data.
This will randomize the camera position, angle and thermal signature.
This also supports texture randomization.

'''

def args(parser):
	try:
		parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')
	except: pass
	try:
		parser.add_argument('--random_texture_source', default=None, help='Defines a random texture source, if not set will not randomize textures')
	except: pass

def minVersion():
	return '18.07.26.0000'

def run():
	loop = 0
	mycams = ['mainCar/cameras/cameraThermal1', 'mainCar/cameras/cameraSegmentation1']
	randomTextures = [ "VechicleSpawner" ]
	
	# add compnents for randomization and execute the first texture random roll
	if settings.random_texture_source != None:
		for r in randomTextures:
			common.sendData([
				'REGEX "{}" ADD ObjectTagging.Spawners.RandomizeMainTexture Thermal.Spawners.RandomizeThermalTexture'.format(r),
				'REGEX "{}" EXECUTE ObjectTagging.Spawners.RandomizeMainTexture GetImagesFromDisk "{}"'.format(r, settings.random_texture_source),
				'REGEX "{}" EXECUTE Thermal.Spawners.RandomizeThermalTexture GetImagesFromDisk "{}"'.format(r, settings.random_texture_source)
			])
	
	# setup the export
	if settings.skip_setup == False:
		common.sendData([
			'CREATE "dummy"',
			'"dummy" SET active true'
		])
		
		helpers.addDataExport(
			imageLinks=helpers.cameraExportParametrize(mycams, "image"),
			fieldLinks=[
				{
					"target": "dummy",
					"label": "dummyPosition",
					"componentName": "Transform",
					"fieldName": "localPosition",
					"onChange": True
				}
			]
		)
	
	# loop changing camera positions with random agc bounduaries
	while loop < settings.loop_limit:
		# randomize thermal properties
		common.sendData([
			'"VehicleSpawner" SET Thermal.ThermalProfileOverride temperatureMode "Absolute" temperature -20~50 temperatureMedianMode "Absolute" temperatureMedian -0.25~1 temperatureBandwidthMode "Absolute" temperatureBandwidth -2.5~15 heatinessMode "Absolute" heatiness 0~100 varianceMode "Absolute" variance 0~50 reflectivityMode "Absolute" reflectivity 0~0.8',
		])
		
		# destroy all cars so we don't get stuck
		if loop > 0 and loop % 75 == 0:
			common.sendData([
				'"VehicleSpawner" SET OSNetworkSpawner despawnRadius 0',
				'SLEEP 1',
				'"VehicleSpawner" SET OSNetworkSpawner despawnRadius 275'
			])
		
		# reroll random textures every 100 loops
		if loop > 0 and loop % 100 == 0 and settings.random_texture_source != None:
			for r in randomTextures:
				common.sendData([
					'REGEX "{}" EXECUTE ObjectTagging.Spawners.RandomizeMainTexture GetImagesFromDisk "{}"'.format(r, settings.random_texture_source),
					'REGEX "{}" EXECUTE Thermal.Spawners.RandomizeThermalTexture GetImagesFromDisk "{}"'.format(r, settings.random_texture_source)
				])
		
		common.sendData([
			# random angles and position for camera container
			'"mainCar/cameras" SET Transform localEulerAngles (-20~20 -25~25 -20~20) localPosition (-6.16~2.37 1.2~3.5 0.3)',
			'SLEEP 0.5',
			# intentionally last as this will trigger data export
			'"dummy" SET Transform localPosition (0~10 0~10 0~10)'
		])
		
		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
		
		loop += 1
