import random

from .. import common, helpers, settings_manager

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
	mycams = ['Camera/Thermal']

	#deactivate traffic entities

	common.sendData([  # work around for preventing the export of an "old" frame
		'"Traffic" SET active false',
		'"Bikes" SET active false',
		'"Pedestrians" SET active false',
	])


	common.sendData([  # work around for preventing the export of an "old" frame
		'CREATE "dummy"',
		'"dummy" SET active true'
	])

	if settings.skip_setup == False:

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


	while loop < settings.loop_limit:

		y_rotation_max = 90
		y_rotation_min = -90

		z_pos_max = 150
		z_pos_min = -150

		x_pos_max = 150
		x_pos_min = -150

		pick_x_or_z = random.choice([True, False])

		if pick_x_or_z:
			common.sendData('"Camera" SET transform position ({}~{} 2 1)'.format(x_pos_min,x_pos_max))
		else:
			common.sendData('"Camera" SET transform position (-1 2 {}~{})'.format(z_pos_min, z_pos_max))

		common.sendData('"Camera" SET transform localEulerAngles (0 {}~{} 0)'.format(y_rotation_min, y_rotation_max))

		# intentionally last as this will trigger data export
		common.sendData('"dummy" SET Transform position (0~100 0~100 0~100)"')

		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
		
		loop += 1
