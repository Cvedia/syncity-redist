import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Autodrive
	- Spawns autodrive track
	- Setups envirosky postprocessing filters
	- Setup lidar device
	- Setup multiple ROS2 ios for driving car
	- Exits leaving all objects exposed
'''

def args(parser):
	parser.add_argument('--disable_ros', action='store_true', default=False, help='Disables ROS')
	parser.add_argument('--lidar_ip', default="192.168.1.100", help='Defines a IP for lidar devices')

def run():
	settings.keep = True
	
	car_obj = 'SyncityJPickup'
	mycams = ['{}/Front'.format(car_obj)]
	
	if settings.skip_setup == False:
		common.send_data([
			'CREATE autodrive autodrive autodrive/autodrive_tile',
			'autodrive ADD WindZone',
			'autodrive SET active true'
		])
		
		helpers.global_disk_setup()
		helpers.add_disk_output(mycams)
		
		common.send_data([
			# reset car position
			'{} SET Transform position (-100.76 2.25 -415.57)'.format(car_obj),
			'{} SET Transform eulerAngles (0.274 37.499 0)'.format(car_obj),
			
			# add custom inputs for ros bridge
			# WARNING: When VPCustomInput is enabled, you won't be able to drive using the keys
			'{} ADD VPCustomInput'.format(car_obj),
			'{} SET VPCustomInput enabled true'.format(car_obj),
			# '{} SET VPCustomInput enabled false'.format(car_obj),
			
			'"autodrive/Road/Autodrive Road" SET UnityEngine.MeshCollider enabled true',
			
			'CREATE EnviroSky EnviroSky',
			'EnviroSky SET EnviroSky Player {}'.format(car_obj),
			'EnviroSky SET EnviroSky PlayerCamera {}'.format(mycams[0]),
			'EnviroSky SET EnviroSky GameTime.ProgressTime None',
			'EnviroSky SET EnviroSky GameTime.Hours 17',
			'EnviroSky SET EnviroSky weatherSettings.cloudTransitionSpeed 100',
			'EnviroSky SET EnviroSky weatherSettings.effectTransitionSpeed 100',
			'EnviroSky SET EnviroSky weatherSettings.fogTransitionSpeed 100',
			'{} ADD EnviroCamera'.format(car_obj),
			'EnviroSky SET active true',
			
			'{} ADD UnityEngine.PostProcessing.PostProcessingBehaviour'.format(mycams[0]),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile EnviroFX'.format(mycams[0]),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled true'.format(mycams[0]),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.tonemapper "1"'.format(mycams[0]),
			
			# lidar position / angle setup
			'{}/Lidar SET Transform localPosition (0 2 0)'.format(car_obj),
			'{}/Lidar SET Transform localEulerAngles (0 0 0)'.format(car_obj),
			
			# flycam
			# '{} ADD FlyCamera'.format(mycams[0]),
			# '{} SET FlyCamera enabled true'.format(mycams[0]),
			
			# lidar specs
			'{}/Lidar SET Lidar model "VLP_16"'.format(car_obj),
			
			'{}/Lidar SET Lidar minAz -180'.format(car_obj),
			'{}/Lidar SET Lidar maxAz 180'.format(car_obj),
			'{}/Lidar SET Lidar minEl -30'.format(car_obj),
			'{}/Lidar SET Lidar maxEl 30'.format(car_obj),
			
			'{}/Lidar SET Lidar rpm 900'.format(car_obj),
			
			'{}/Lidar SET Lidar MinimumIntensity 0'.format(car_obj),
			'{}/Lidar SET Lidar ipAddressOverride "{}"'.format(car_obj, settings.lidar_ip),
			
			'{}/Lidar SET Lidar accuracy HIGH'.format(car_obj),
			'{}/Lidar SET Lidar timingAccuracy ULTRA'.format(car_obj),
			# '{}/Lidar SET Lidar disableUDPBroadcast True'.format(car_obj),
			
			# all set, enable objects
			'{}/Lidar SET active true'.format(car_obj),
			'{} SET active true'.format(car_obj),
			
			'EnviroSky EXECUTE EnviroSky ChangeWeather "Cloudy 1"'
		], read=False)
	
	# setup ros ios
	if settings.disable_ros == False:
		helpers.setup_ros_topics(
			readLinks=[
				{
					"label": "front_camera",
					"topic": "syncity/front_camera",
					"target": mycams[0],
					"component": "Camera",
					"field": "targetTexture",
					"interval": 1
				}
			]
		)
	
	common.flush_buffer()
