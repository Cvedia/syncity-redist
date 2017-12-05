import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Strawberry field runner
	- Runs henkock tractor around the strawberry fields
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		helpers.global_camera_setup()
		# helpers.add_camera_rgb(width=4096, height=3072, audio=True, envirosky=True)
		# helpers.add_camera_rgb_pp('EnviroFX', scion=False)
		helpers.add_camera_rgb(width=4096, height=3072, envirosky=False)
		
		common.send_data([
			'cameras/cameraRGB SET Camera enabled true',
			'cameras SET Transform position ({} {} {})'.format(6, 33, -50),
			'cameras SET Transform eulerAngles ({} {} {})'.format(40, 8, 0)
			# 'cameras/cameraRGB ADD EnviroCamera',
			# 'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[0]),
			# 'EnviroSky SET EnviroSky cloudsMode {}'.format(random.choice(helpers.clouds_lst)),
		], read=False)
	
	x = -50
	z = -7
	a_y = 90
	
	common.send_data([
		'HENCOCK SET Transform eulerAngles ({} {} {})'.format(0, a_y, 0)
	])
	
	force_sync = True
	loop = 0
	stepping = 16
	
	while loop < 5:
		while x < 10:
			x = x + stepping
			common.send_data([
				'HENCOCK SET Transform position ({} {} {})'.format(x, 0 , z)
			])
		
		while a_y < 180:
			a_y = a_y + stepping
			common.send_data([
				'HENCOCK SET Transform eulerAngles ({} {} {})'.format(0, a_y, 0)
			])
		
		i = 0
		while i < 12:
			z = z - stepping
			i = i + stepping
			common.send_data([
				'HENCOCK SET Transform position ({} {} {})'.format(x, 0 , z)
			])
		
		while a_y < 270:
			a_y = a_y + stepping
			common.send_data([
				'HENCOCK SET Transform eulerAngles ({} {} {})'.format(0, a_y, 0)
			])
		
		while x > -50:
			x = x - stepping
			common.send_data([
				'HENCOCK SET Transform position ({} {} {})'.format(x, 0 , z)
			])
		
		while a_y > 180:
			a_y = a_y - stepping
			common.send_data([
				'HENCOCK SET Transform eulerAngles ({} {} {})'.format(0, a_y, 0)
			])
		
		i = 0
		while i < 12:
			z = z - stepping
			i = i + stepping
			common.send_data([
				'HENCOCK SET Transform position ({} {} {})'.format(x, 0 , z)
			])
		
		while a_y > 90:
			a_y = a_y - stepping
			common.send_data([
				'HENCOCK SET Transform eulerAngles ({} {} {})'.format(0, a_y, 0)
			])
		
		loop = loop + 1
