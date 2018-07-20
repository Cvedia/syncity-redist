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

def run():
	loop = 0
	mycams = ['Camera/Thermal', 'Camera/Segmentation']
	
	if settings.skip_setup == False:
		helpers.addImageExport(mycams, params={
			"streamFormat": ["jpg", "png"],
			"exportBBoxes": True
		})
	
	# loop changing camera positions with random agc bounduaries
	while loop < settings.loop_limit:
		common.sendData([
			'"Camera" SET Transform localPosition (-3~3 0.5~2 -30~-15)',
			'"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)',
			'"Humans" SET RandomProps.Frustum minDistance 5~7',
			'"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 17~40',
			'"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 17~40',
			'"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~20',
			'"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100',
			'"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50',
			'"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8',
			'"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 8~30)',
			'[RandomProps.Spawner] ShuffleAll "Parked Cars W" "Parked Cars E" "Trees W" "Trees E" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"'
		])
		loop += 1

#			'[RandomProps.Spawner] ShuffleAll "Parked Cars W" "Parked Cars E" "Trees W" "Trees E" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"'
		if loop % 25 == 0:
			common.sendData([
#				'"Parked Cars W" SET active false',
#				'"Parked Cars E" SET active false',
				'"Buildings W" SET active false',
				'"Buildings E" SET active false',
				'"Buildings N" SET active false',
				'"Trees W" SET active false',
				'"Trees E" SET active false',
#				'"Cars" SET active false',
				'"Humans" SET active false',
#				'"Bicycles" SET active false',
#				'"Parked Cars W" SET active true',
#				'"Parked Cars E" SET active true',
				'"Buildings W" SET active true',
				'"Buildings E" SET active true',
				'"Buildings N" SET active true',
				'"Trees W" SET active true',
				'"Trees E" SET active true',
#				'"Cars" SET active true',
				'"Humans" SET active true',
#				'"Bicycles" SET active true',
			])
		
		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
