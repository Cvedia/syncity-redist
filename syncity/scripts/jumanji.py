import subprocess
import os
import pathlib
import time
from .. import common, helpers, settings_manager
from random import randint

settings = settings_manager.Singleton()

def help():
	return '''\
Jumanji exporter

You should run this script after the scene built by cl/jumanji.cl is ready. This
will setup the image exporter and start producing data.
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
	mycams = ['Camera/Thermal', 'Camera/Segmentation']
	randomTextures = [ "Trees", "Cars", "Buildings", "Grounds" ]
	
	# add compnents for randomization and execute the first texture random roll
	if settings.random_texture_source != None:
		for r in randomTextures:
			common.sendData([
				'"{}" ADD ObjectTagging.Spawners.RandomizeMainTexture Thermal.Spawners.RandomizeThermalTexture'.format(r),
				'"{}" EXECUTE ObjectTagging.Spawners.RandomizeMainTexture GetImagesFromDisk "{}"'.format(r, settings.random_texture_source),
				'"{}" EXECUTE Thermal.Spawners.RandomizeThermalTexture GetImagesFromDisk "{}"'.format(r, settings.random_texture_source)
			])
	
	if settings.skip_setup == False:
		common.sendData('"AssetBundles.GameobjectCache" SET AssetBundles.GameobjectCache cachedObjectsLimit {}'.format(settings.cache_limit))
		
		helpers.addDataExport(
			imageLinks=helpers.cameraExportParametrize(mycams, "image"),
			fieldLinks=[
				{
					"target": "Camera",
					"label": "cameraPosition",
					"componentName": "Transform",
					"fieldName": "localPosition",
					"onChange": True
				}
			]
		)
	
	# loop changing camera positions with random agc bounduaries
	while loop < settings.loop_limit:
		common.sendData([
			'"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)',
			'"Humans" SET RandomProps.Frustum minDistance 5~7',
			'"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 17~40',
			'"Bicyclists/Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 17~40',
			'"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~20',
			'"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100',
			'"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50',
			'"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8',
			'"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 8~30)',
			'[RandomProps.Spawner] ShuffleAll "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans"'
			])
		
		if loop > 0 and loop % 25 == 0:
			common.sendData([
				'"Trees" SET active false',
				'"Cars" SET active false',
				'"Humans" SET active false',
				
				'"Trees" SET active true',
				'"Cars" SET active true',
				'"Humans" SET active true',
				
				'"Bicyclists" SET active false',
				'"Bicyclists" SET active true',
				
				# disable reflection probes in new spawned cars
				'REGEX "^Cars$/.*/Reflection Probe" SET ReflectionProbe enabled false'
				
				# ...or update them to be less heavy
				# 'REGEX "^Cars$/.*/Reflection Probe" SET ReflectionProbe boxProjection false farClipPlane 70 size (50 50 50) resolution 128 hdr false enabled true',
			])
		
		# reroll random textures every 100 loops
		if loop > 0 and loop % 100 == 0 and settings.random_texture_source != None:
			for r in randomTextures:
				common.sendData([
					'"{}" EXECUTE ObjectTagging.Spawners.RandomizeMainTexture GetImagesFromDisk "{}"'.format(r, settings.random_texture_source),
					'"{}" EXECUTE Thermal.Spawners.RandomizeThermalTexture GetImagesFromDisk "{}"'.format(r, settings.random_texture_source)
				])
		
		"""
		# workaround until #260941684 is solved
		common.sendData([
			'"{}" SET active false'.format(mycams[1]),
			'"{}" SET active true'.format(mycams[1])
		])
		"""
		
		# common.sendData("SLEEP 1")
		
		# intentionally last as this will trigger data export
		common.sendData('"Camera" SET Transform localPosition (-3~3 0.5~2 -30~-15)')
		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
		
		loop += 1
