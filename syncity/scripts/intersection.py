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
		parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')
	except: pass
	try:
		parser.add_argument('--random_thermal_signatures', default=None,
							help='Set this to activate random thermal signatures for pedestrians and cars')
	except: pass

def minVersion():
	return '18.07.26.0000'

def run():
	loop = 0
	mycams = ['Camera/Thermal', 'Camera/Segmentation']

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

	if settings.random_thermal_signatures:
		common.sendData('"Traffic" ADD Thermal.ThermalProfileOverride')
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

		if settings.random_thermal_signatures:
			common.sendData('"Traffic" SET Thermal.ThermalProfileOverride temperatureMode "Absolute" temperature -20~50 temperatureMedianMode "Absolute" temperatureMedian -0.25~1 temperatureBandwidthMode "Absolute" temperatureBandwidth -2.5~15 heatinessMode "Absolute" heatiness 0~100 varianceMode "Absolute" variance 0~50 reflectivityMode "Absolute" reflectivity 0~0.8')
			common.sendData('"Pedestrians" SET Thermal.ThermalProfileOverride temperatureMode "Absolute" temperature -20~50 temperatureMedianMode "Absolute" temperatureMedian -0.25~1 temperatureBandwidthMode "Absolute" temperatureBandwidth -2.5~15 heatinessMode "Absolute" heatiness 0~100 varianceMode "Absolute" variance 0~50 reflectivityMode "Absolute" reflectivity 0~0.8')

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

		elapsedMillis = int(round(time.time() * 1000)) - startMillis
		elapsedMinutes = elapsedMillis / 60000.0
		imagesPerMinute = loop/elapsedMinutes

		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
		common.output('Images per minute {} '.format(imagesPerMinute))

		loop += 1
