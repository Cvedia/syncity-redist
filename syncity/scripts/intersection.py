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
		parser.add_argument('--random_tree_thermal_profiles', default=None,
							help='Set this to activate random thermal signatures for trees')
	except: pass
	try:
		parser.add_argument('--random_building_thermal_profiles', default=None,
							help='Set this to activate random thermal signatures for buildings')
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
	try:
		parser.add_argument('--random_rotation_frames_frequency', type=int, default=40,
							help='Defines a number of frames after which the thermal settings will be randomized')
	except:
		pass
	try:
		parser.add_argument('--random_rotation', default=None,
							help='Set this to activate random rotation of the objects')
	except:
		pass

def minVersion():
	return '18.07.26.0000'

def run():
	loop = 0
	mycams = ['Camera/cameraRGB', 'Camera/Thermal', 'Camera/Segmentation']

	if settings.random_tree_thermal_profiles:
		common.sendData('REGEX "World Root/.*/Trees" ADD Thermal.ThermalProfileOverride')


	if settings.random_building_thermal_profiles:
		common.sendData('REGEX "World Root/.*/Buildings" ADD Thermal.ThermalProfileOverride')


	if settings.random_car_thermal_profiles:
		common.sendData('"Traffic" ADD Thermal.ThermalProfileOverride')


	if settings.random_human_thermal_profiles:
		common.sendData('"Pedestrians" ADD Thermal.ThermalProfileOverride')


	if settings.random_rotation:
		common.sendData('REGEX "World Root/tile_.+/(Trees|Signs|Buildings|Props)" ADD RandomProps.RandomRotationContainer')
		common.sendData('REGEX "World Root/tile_.+/(Trees|Signs|Buildings|Props)" SET RandomProps.RandomRotationContainer objectsLevelInContainerHierarchy 2')
		common.sendData('REGEX "World Root/tile_.+/(Trees|Signs)" SET RandomProps.RandomRotationContainer mode "Absolute" minY 0 maxY 360')
		common.sendData('REGEX "World Root/tile_.+/(Buildings|Props)" SET RandomProps.RandomRotationContainer mode "Relative"')
		common.sendData('REGEX "World Root/tile_.+/(Buildings|Props)" PUSH RandomProps.RandomRotationContainer fixedY 0 180')


	common.sendData('"World Root" SET active true')

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

	if settings.skip_setup == False:
		common.sendData('"GameobjectCache.instance" SET cachedObjectsLimit {}'.format(settings.cache_limit))

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
				common.sendData('"Traffic" SET Thermal.ThermalProfileOverride temperatureMode "Absolute" temperature -23~-17 temperatureMedianMode "Absolute" temperatureMedian 0.43~0.58 temperatureBandwidthMode "Absolute" temperatureBandwidth 4.25~5.75 heatinessMode "Absolute" heatiness 25~35 varianceMode "Absolute" variance 17~23 reflectivityMode "Absolute" reflectivity 0.26~0.35')
			if settings.random_human_thermal_profiles:
				common.sendData('"Pedestrians" SET Thermal.ThermalProfileOverride temperatureMode "Absolute" temperature -23~-17 temperatureMedianMode "Absolute" temperatureMedian 0~0.01 temperatureBandwidthMode "Absolute" temperatureBandwidth 1.7~2.3 heatinessMode "Absolute" heatiness 25~35 varianceMode "Absolute" variance 1.7~2.3 reflectivityMode "Absolute" reflectivity 0~0.01')
			if settings.random_tree_thermal_profiles:
				temperatureValue = random.uniform(-8, 6)
				temperatureBandwidth = random.uniform(5, 7)
				temperatureMedian = random.uniform(0.3, 0.5)
				heatinessValue = random.uniform(0, 0.01)
				reflectivityValue = random.uniform(0.05, 0.07)
				varianceValue = random.uniform(0, 0.01)
				common.sendData('REGEX "World Root/.*/Trees" SET Thermal.ThermalProfileOverride temperatureMode "Absolute" temperature {} temperatureMedianMode "Absolute" temperatureMedian {} temperatureBandwidthMode "Absolute" temperatureBandwidth {} heatinessMode "Absolute" heatiness {} varianceMode "Absolute" variance {} reflectivityMode "Absolute" reflectivity {}'.
								format(temperatureValue, temperatureMedian, temperatureBandwidth, heatinessValue, varianceValue, reflectivityValue))
			if settings.random_building_thermal_profiles:
				temperatureValue = random.uniform(-7, -5)
				temperatureBandwidth = random.uniform(5.5, 7.5)
				temperatureMedian = random.uniform(0, 0.01)
				heatinessValue = random.uniform(0, 0.01)
				reflectivityValue = random.uniform(0.1, 0.14)
				varianceValue = random.uniform(0, 0.01)
				common.sendData('REGEX "World Root/.*/Buildings" SET Thermal.ThermalProfileOverride temperatureMode "Absolute" temperature {} temperatureMedianMode "Absolute" temperatureMedian {} temperatureBandwidthMode "Absolute" temperatureBandwidth {} heatinessMode "Absolute" heatiness {} varianceMode "Absolute" variance {} reflectivityMode "Absolute" reflectivity {}'.
								format(temperatureValue, temperatureMedian, temperatureBandwidth, heatinessValue, varianceValue, reflectivityValue))
			if settings.random_road_thermal_profiles:
				temperatureValue = random.uniform(-23, -17)
				temperatureBandwidth = random.uniform(0, 0.01)
				temperatureMedian = random.uniform(0.45, 0.6)
				heatinessValue = random.uniform(37, 50)
				reflectivityValue = random.uniform(0.03, 0.03)
				varianceValue = random.uniform(22, 30)
				common.sendData('REGEX "World Root/.*/Road Network/Road Objects/.*" SET Thermal.ThermalObjectBehaviour profile.temperature.value {} profile.temperature.median {} profile.temperature.bandwidth {} profile.heatiness.value {} profile.variance.value {} profile.reflectivity.value {}'.
								format(temperatureValue, temperatureMedian, temperatureBandwidth, heatinessValue, varianceValue, reflectivityValue))
			if settings.random_camera_thermal_range:
				common.sendData('"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-10~0 8~30)')
			if settings.random_sky_thermal_temperature:
				common.sendData('"Camera/Thermal" SET Thermal.ThermalCamera skyboxBackgroundTemperature -50~50')
			if settings.random_thermal_light:
				common.sendData('"Thermal light" SET Transform localEulerAngles (0~360 0~360 0~360)')
				common.sendData('"Thermal light" SET Thermal.ThermalLight temperature 5~12')


		if settings.random_rotation and loop % settings.random_rotation_frames_frequency == 0:
			common.sendData('REGEX "World Root/tile_.+/(Trees|Signs|Buildings|Props)" EXECUTE RandomProps.RandomRotationContainer Randomize')


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
