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

def minVersion():
	return '18.07.26.0000'

def run():
	loop = 0
	mycams = ['Camera/cameraRGB', 'Camera/Segmentation']

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

		# advance traffic simulation every 15 frames

		if loop == 0 or loop % 15 == 0:
			common.sendData([
				'"Traffic" SET SUMOController enabled true',
				'NOOP',
				'"Traffic" SET SUMOController enabled false',
				'REGEX "Traffic/.*/Reflection Probe" SET active true',
				'REGEX "Traffic/.*/Reflection Probe" SET ReflectionProbe enabled true',
				])

		common.sendData('"Camera" EXECUTE JumpBetweenObjects Jump')

		common.sendData(['NOOP','NOOP'])
		# intentionally last as this will trigger data export
		common.sendData('"dummy" SET Transform position (0~100 0~100 0~100)"')
		common.sendData(['NOOP', 'NOOP'])

		elapsedMillis = int(round(time.time() * 1000)) - startMillis
		elapsedMinutes = elapsedMillis / 60000.0
		imagesPerMinute = loop/elapsedMinutes

		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
		common.output('Images per minute {} '.format(imagesPerMinute))

		loop += 1
