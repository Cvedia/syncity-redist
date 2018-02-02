import random
import time
import subprocess

from .. import common, helpers, settings_manager
from subprocess import call

settings = settings_manager.Singleton()

# use lite drone packages
# helpers.drones_lst = helpers.drones_lite_lst

def help():
	return '''\
POC Satellite
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Orbits around from ground perspective looking at drones
	- Exports segmentation map bounding boxes
	- Exports RGB images
	- Exits leaving all objects exposed
'''

def run():
	elevation = 120
	dist = 50 # 125
	dist_e = 2.5
	dist_a = 10 # azimuth increment
	elevation = 120
	loop = 0
	
	while elevation < 167:
		azimuth = 0
		
		while azimuth < 360:
			common.send_data([
				'cameraRGB SET Orbit distance {}'.format(dist),
				'cameraRGB SET Orbit elevation {}'.format(elevation),
				'cameraRGB SET Orbit azimuth {}'.format(azimuth)
			])
			
			azimuth += dist_a
			common.output('Sleep')
			time.sleep(2)
			common.output('SS')
			call(['nircmd.exe', 'savescreenshot', 'angle_{}_rgb.png'.format(loop)])
			loop = loop + 1
		
		elevation += dist_e
	
	common.send_data([
		'cameraRGB/cameraSeg SET active true'
	]);
	
	
	
	
	elevation = 120
	dist = 50 # 125
	dist_e = 2.5
	dist_a = 10 # azimuth increment
	elevation = 120
	loop = 0
	
	while elevation < 167:
		azimuth = 0
		
		while azimuth < 360:
			common.send_data([
				'cameraRGB SET Orbit distance {}'.format(dist),
				'cameraRGB SET Orbit elevation {}'.format(elevation),
				'cameraRGB SET Orbit azimuth {}'.format(azimuth)
			])
			
			azimuth += dist_a
			common.output('Sleep')
			time.sleep(2)
			common.output('SS')
			call(['nircmd.exe', 'savescreenshot', 'angle_{}_segmentation.png'.format(loop)])
			loop = loop + 1
		
		elevation += dist_e
	
	
	common.send_data([
		'cameraRGB/cameraSeg SET active false'
	]);
	
	x = 268
	a_x = 90
	a_x_d = 1
	a_x_r = [75, 95]
	hour = 9
	hour_d = 1
	minute = 0
	loop = 0
	common.send_data([
		'EnviroSky SET EnviroSky weatherSettings.cloudTransitionSpeed {}'.format(100),
		'EnviroSky SET EnviroSky weatherSettings.effectTransitionSpeed {}'.format(100),
		'EnviroSky SET EnviroSky weatherSettings.fogTransitionSpeed {}'.format(100)
	], read=True)
	
	while x > -18:
		if random.uniform(0,1) > .9:
			motionblur = 'true'
		else:
			motionblur = 'false'
		
		'''
		p_x = p_x + (random.uniform(.05, .75) * p_x_d)
		p_y = p_y + (random.uniform(.01, .95) * p_y_d)
		p_z = p_z + (random.uniform(.25, .75) * p_z_d)
		'''
		x = x - random.uniform(1.05, 1.75)
		a_x = a_x + (random.uniform(.05, .75) * a_x_d)
		
		if a_x > a_x_r[1]:
			a_x_d = -1
		elif a_x < a_x_r[1]:
			a_x_d = 1
		
		minute = minute + 5
		if minute >= 60:
			minute = 0
			hour = hour + hour_d
		
		if hour > 16:
			hour_d = -1
		elif hour < 9:
			hour_d = 1
		
		common.send_data([
			'EnviroSky SET EnviroSky GameTime.Hours {}'.format(hour),
			'EnviroSky SET EnviroSky GameTime.Minutes {}'.format(minute),
			'cameraRGB SET Transform position ({} {} {})'.format(x, 777, 317),
			# 'seg SET Transform position ({} {} {})'.format(x, 777, 317),
			# 'cameraRGB SET Transform eulerAngles ({} {} {})'.format(a_x, 212.5, 0)
		], read=True)
		
		common.flush_buffer()
		
		time.sleep(2)
		call(['nircmd.exe', 'savescreenshot', 'top_{}_rgb.png'.format(loop)])
		loop = loop + 1
	
	
	common.send_data([
		'cameraRGB/cameraSeg SET active true'
	]);
	
	x = 268
	a_x = 90
	a_x_d = 1
	a_x_r = [75, 95]
	hour = 9
	hour_d = 1
	minute = 0
	loop = 0
	common.send_data([
		'EnviroSky SET EnviroSky weatherSettings.cloudTransitionSpeed {}'.format(100),
		'EnviroSky SET EnviroSky weatherSettings.effectTransitionSpeed {}'.format(100),
		'EnviroSky SET EnviroSky weatherSettings.fogTransitionSpeed {}'.format(100)
	], read=True)
	
	while x > -18:
		if random.uniform(0,1) > .9:
			motionblur = 'true'
		else:
			motionblur = 'false'
		
		'''
		p_x = p_x + (random.uniform(.05, .75) * p_x_d)
		p_y = p_y + (random.uniform(.01, .95) * p_y_d)
		p_z = p_z + (random.uniform(.25, .75) * p_z_d)
		'''
		x = x - random.uniform(1.05, 1.75)
		a_x = a_x + (random.uniform(.05, .75) * a_x_d)
		
		if a_x > a_x_r[1]:
			a_x_d = -1
		elif a_x < a_x_r[1]:
			a_x_d = 1
		
		minute = minute + 5
		if minute >= 60:
			minute = 0
			hour = hour + hour_d
		
		if hour > 16:
			hour_d = -1
		elif hour < 9:
			hour_d = 1
		
		common.send_data([
			'EnviroSky SET EnviroSky GameTime.Hours {}'.format(hour),
			'EnviroSky SET EnviroSky GameTime.Minutes {}'.format(minute),
			'cameraRGB SET Transform position ({} {} {})'.format(x, 777, 317),
			# 'seg SET Transform position ({} {} {})'.format(x, 777, 317),
			# 'cameraRGB SET Transform eulerAngles ({} {} {})'.format(a_x, 212.5, 0)
		], read=True)
		
		common.flush_buffer()
		
		time.sleep(2)
		call(['nircmd.exe', 'savescreenshot', 'top_{}_rgb.png'.format(loop)])
		loop = loop + 1
