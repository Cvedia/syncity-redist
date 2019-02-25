import random

from .. import common, helpers, settings_manager
import time

settings = settings_manager.Singleton()

def help():
	return '''\
Intersection exporter

You should run this script after the scene built by cl/intersection.cl is ready. This
will setup the image exporter and start producing data.
'''

def args(parser):
	try:
		parser.add_argument('--loop_limit', type=int, default=500,
							help='Defines a limit of iterations for exporting')
	except: pass
	try:
		parser.add_argument('--random_thermal_frames_frequency', type=int, default=1,
							help='Defines a number of frames after which the thermal settings will be randomized')
	except: pass
	try:
		parser.add_argument('--random_car_thermal_profiles', default=None,
							help='Set this to activate random thermal signatures for cars')
	except: pass
	try:
		parser.add_argument('--random_human_thermal_profiles', default=None,
							help='Set this to activate random thermal signatures for humans')
	except: pass
	try:
		parser.add_argument('--random_road_thermal_profiles', default=None,
							help='Set this to activate random thermal signatures for roads')
	except: pass
	try:
		parser.add_argument('--random_thermal_light', default=None,
							help='Set this to activate random intensities and rotations for thermal light')
	except: pass
	try:
		parser.add_argument('--random_sky_thermal_temperature', default=None,
							help='Set this to activate random temperature for the sky')
	except: pass
	try:
		parser.add_argument('--random_camera_thermal_range', default=None,
							help='Set this to activate random temperature range for the thermal camera')
	except: pass


def minVersion():
	return '18.07.26.0000'

def run():
	loop = 0
	mycams = ['Camera/cameraRGB', 'Camera/Thermal', 'Camera/Segmentation']

	#activate traffic
	common.sendData([
		'"Traffic" SET SUMOController enabled true',
		'SLEEP 1',
		'"Traffic" SET SUMOController enabled false',
	])

	common.sendData('"Camera" EXECUTE JumpBetweenObjects Jump')

	common.sendData([  # work around for preventing the export of an "old" frame
		'CREATE "dummy"',
		'"dummy" SET active true'
	])

	if settings.random_car_thermal_profiles:
		common.sendData('"Traffic" ADD Thermal.ThermalProfileOverride')
	if settings.random_human_thermal_profiles:
		common.sendData('"Pedestrians" ADD Thermal.ThermalProfileOverride')


	if settings.skip_setup == False:
		common.sendData('"AssetBundles.GameobjectCache" SET AssetBundles.GameobjectCache cachedObjectsLimit {}'.format(settings.cache_limit))

		helpers.addDataExport(
			imageLinks=helpers.cameraExportParametrize(mycams, "image"),
			fieldLinks=[
				{
					"target": "dummy",
					"label": "dummy",
					"componentName": "Transform",
					"fieldName": "position",
					"onChange": True
				}]
		)


	startMillis = int(round(time.time() * 1000))

	# loop changing camera positions with random agc bounduaries
	while loop < settings.loop_limit:
		if loop % settings.random_thermal_frames_frequency == 0:
			if settings.random_car_thermal_profiles:
				common.sendData('"Traffic" SET Thermal.ThermalProfileOverride temperatureMode "Absolute" temperature -20~50 temperatureMedianMode "Absolute" temperatureMedian -0.25~1 temperatureBandwidthMode "Absolute" temperatureBandwidth -2.5~15 heatinessMode "Absolute" heatiness 0~100 varianceMode "Absolute" variance 0~50 reflectivityMode "Absolute" reflectivity 0~0.8')
			if settings.random_human_thermal_profiles:
				common.sendData('"Pedestrians" SET Thermal.ThermalProfileOverride temperatureMode "Absolute" temperature -20~50 temperatureMedianMode "Absolute" temperatureMedian -0.25~1 temperatureBandwidthMode "Absolute" temperatureBandwidth -2.5~15 heatinessMode "Absolute" heatiness 0~100 varianceMode "Absolute" variance 0~50 reflectivityMode "Absolute" reflectivity 0~0.8')
			if settings.random_road_thermal_profiles:
				common.sendData('REGEX "World Root/.*/Road Network/Road Objects/.*" SET Thermal.ThermalObjectBehaviour profile.temperature.value -20~50 profile.temperature.median -0.25~1 profile.temperature.bandwidth -2.5~15 profile.heatiness.value 0~100 profile.variance.value 0~50 profile.reflectivity.value 0~0.8')
			if settings.random_camera_thermal_range:
				common.sendData('"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-10~0 8~30)')
			if settings.random_sky_thermal_temperature:
				common.sendData('"Camera/Thermal" SET Thermal.ThermalCamera skyboxBackgroundTemperature -50~50')
			if settings.random_thermal_light:
				common.sendData('"Thermal light" SET Transform localEulerAngles (0~360 0~360 0~360)')
				common.sendData('"Thermal light" SET Thermal.ThermalLight temperature 5~12')


		# advance traffic simulation every 15 frames

		if loop == 0 or loop % 15 == 0:
			common.sendData([
				'"Traffic" SET SUMOController enabled true',
				'NOOP',
				'"Traffic" SET SUMOController enabled false',
				'REGEX "Traffic/.*/Reflection Probe" SET active true',
				'REGEX "Traffic/.*/Reflection Probe" SET ReflectionProbe enabled true',
				'REGEX "Traffic/.*/Reflection Probe" SET transform localEulerAngles (0 0~180 0) localPosition (0 0 0)'
				])

		common.sendData('"Camera" EXECUTE JumpBetweenObjects Jump')

		common.sendData(['NOOP','NOOP'])
		# intentionally last as this will trigger data export
		common.sendData('"dummy" SET Transform position (0~100 0~100 0~100)"')
		common.sendData('NOOP')

		elapsedMillis = int(round(time.time() * 1000)) - startMillis
		elapsedMinutes = elapsedMillis / 60000.0
		imagesPerMinute = loop/elapsedMinutes

		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
		common.output('Images per minute {} '.format(imagesPerMinute))

		loop += 1
