import subprocess
import os
import pathlib
import time
from .. import common, helpers, settings_manager
from random import randint

settings = settings_manager.Singleton()

def help():
	return '''\
Jumanji
'''

def args(parser):
	try:
		parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')
	except: pass

def run():
	loop = 0
	mycams = ['Camera/rgb', 'Camera/Thermal', 'Camera/Segmentation']
	
	common.sendData([
		'"disk1" SET Sensors.Disk counter 1'
	])

	# loop changing camera positions with random agc bounduaries
	while loop < settings.loop_limit:
		# "disk1" EXECUTE Sensors.Disk Snapshot
		# "Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
		
		helpers.takeSnapshot(mycams, autoSegment=True)
		
		common.sendData([
			'"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)',
			'"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)',
			'"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90',
			'"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90',
			'"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10',
			'"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100',
			'"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50',
			'"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8',
			'"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)',
			'[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"'
		])
		loop += 1

#			'[RandomProps.Spawner] ShuffleAll "Parked Cars W" "Parked Cars E" "Trees W" "Trees E" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"'
		if loop % 5 == 0:
			common.sendData([
#				'"Parked Cars W" SET active false',
#				'"Parked Cars E" SET active false',
				'"Buildings" SET active false',
				'"Trees" SET active false',
#				'"Cars" SET active false',
				'"Humans" SET active false',
#				'"Bicycles" SET active false',
#				'"Parked Cars W" SET active true',
#				'"Parked Cars E" SET active true',
				'"Buildings" SET active true',
				'"Trees" SET active true',
#				'"Cars" SET active true',
				'"Humans" SET active true',
#				'"Bicycles" SET active true',
			])
		
		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
