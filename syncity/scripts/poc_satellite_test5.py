import sys
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
	
	r = 0
	prefix = 'top_60_'
	ss = True
	
	while r != 2:
		if r == 0:
			mode = 'rgb'
			common.sendData([
				'"cameraRGB/cameraSeg" SET active false'
			]);
		elif r == 1:
			mode = 'segmentation'
			common.sendData([
				'"cameraRGB/cameraSeg" SET active true'
			]);
			
		
		r = r + 1
	
		# x range 448.87 -> 51.9
		# z range 430.7 -> 67.9
		
		# x_range = [ 448, 51 ]
		# z_range = [ 428, 67 ]
		x_range = [ -99.2, -319.9 ]
		z_range = [ 324, 174 ]
		
		x = x_range[0]
		z = z_range[0]
		hour_range = [ 9, 15 ]
		x_d = -1
		z_d = -1
		
		a_x = 90
		a_x_d = 1
		a_x_r = [75, 95]
		
		hour = hour_range[0]
		hour_d = 1
		minute = 0
		loop = 0
		
		x_increment = .5
		z_increment = 5
		
		common.sendData([
			'"EnviroSky" SET EnviroSky weatherSettings.cloudTransitionSpeed {}'.format(100),
			'"EnviroSky" SET EnviroSky weatherSettings.effectTransitionSpeed {}'.format(100),
			'"EnviroSky" SET EnviroSky weatherSettings.fogTransitionSpeed {}'.format(100),
			'"cameraRGB" SET Transform eulerAngles ({} {} {})'.format(60, 90, 0)
		], read=True)
		
		while x > x_range[1]:
			'''
			pX = pX + (random.uniform(.05, .75) * pX_d)
			pY = pY + (random.uniform(.01, .95) * pY_d)
			pZ = pZ + (random.uniform(.25, .75) * pZ_d)
			'''
			x = x + (x_increment * x_d)
			z = z + (z_increment * z_d)
			
			if z > z_range[0]:
				z_d = -1
			elif z < z_range[1]:
				z_d = 1
			
			minute = minute + 5
			if minute >= 60:
				minute = 0
				hour = hour + hour_d
			
			if hour > hour_range[1]:
				hour_d = -1
			elif hour < 9:
				hour_d = 1
			
			buf = [
				'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(hour),
				'"EnviroSky" SET EnviroSky GameTime.Minutes {}'.format(minute),
				'"cameraRGB" SET Transform position ({} {} {})'.format(x, 777, z)
			]
			
			if loop % 25 == 0:
				buf.append('"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(random.choice(helpers.weather_lst)))
			
			common.sendData(buf)
			common.flushBuffer()
			
			if ss:
				common.output('Sleeping')
				time.sleep(2)
				common.output('SS')
				call(['nircmd.exe', 'savescreenshot', '__output/{}_{}_{}.png'.format(prefix, loop, mode)])
			loop = loop + 1
