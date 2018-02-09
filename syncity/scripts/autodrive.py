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

def run():
	settings.keep = True
	
	car_obj = 'SyncityJPickup'
	mycams = ['SyncityJPickup/Front']
	
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
			'SyncityJPickup SET Transform position (-100.76 2.25 -415.57)',
			'SyncityJPickup SET Transform eulerAngles (0.274 37.499 0)',
			
			# add custom inputs for ros bridge
			# WARNING: When VPCustomInput is enabled, you won't be able to drive using the keys
			'SyncityJPickup ADD VPCustomInput',
			'SyncityJPickup SET VPCustomInput enabled true',
			
			'"autodrive/Road/Autodrive Road" SET UnityEngine.MeshCollider enabled true',
			
			'CREATE EnviroSky EnviroSky',
			'EnviroSky SET EnviroSky Player SyncityJPickup',
			'EnviroSky SET EnviroSky PlayerCamera SyncityJPickup/Front',
			'EnviroSky SET EnviroSky GameTime.ProgressTime None',
			'EnviroSky SET EnviroSky GameTime.Hours 17',
			'EnviroSky SET EnviroSky weatherSettings.cloudTransitionSpeed 100',
			'EnviroSky SET EnviroSky weatherSettings.effectTransitionSpeed 100',
			'EnviroSky SET EnviroSky weatherSettings.fogTransitionSpeed 100',
			'SyncityJPickup/Front ADD EnviroCamera',
			'EnviroSky SET active true',
			
			'SyncityJPickup/Front ADD UnityEngine.PostProcessing.PostProcessingBehaviour',
			'SyncityJPickup/Front SET UnityEngine.PostProcessing.PostProcessingBehaviour profile EnviroFX',
			'SyncityJPickup/Front SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled true',
			'SyncityJPickup/Front SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.tonemapper "1"',
			
			# lidar position / angle setup
			'SyncityJPickup/Lidar SET Transform localPosition (0 2 0)',
			'SyncityJPickup/Lidar SET Transform localEulerAngles (0 0 0)',
			
			# lidar specs
			'SyncityJPickup/Lidar SET Lidar model "VLP_16"',
			
			'SyncityJPickup/Lidar SET Lidar minAz -180',
			'SyncityJPickup/Lidar SET Lidar maxAz 180',
			'SyncityJPickup/Lidar SET Lidar minEl -30',
			'SyncityJPickup/Lidar SET Lidar maxEl 30',
			
			'SyncityJPickup/Lidar SET Lidar rpm 900',
			
			'SyncityJPickup/Lidar SET Lidar MinimumIntensity 0',
			# 'SyncityJPickup/Lidar SET Lidar ipAddressOverride "127.0.0.1"',
			
			'SyncityJPickup/Lidar SET Lidar accuracy HIGH',
			'SyncityJPickup/Lidar SET Lidar timingAccuracy ULTRA',
			# 'SyncityJPickup/Lidar SET Lidar disableUDPBroadcast True',
			
			# all set, enable objects
			'SyncityJPickup/Lidar SET active true',
			'SyncityJPickup SET active true',
			
			'EnviroSky EXECUTE EnviroSky ChangeWeather "Cloudy 1"'
		], read=False)
	
	# setup ros ios
	if settings.disable_ros == False:
		helpers.setup_ros_topics(
			writeLinks=[
				{
					"label": "throttle",
					"topic": "syncity/throttle",
					"target": car_obj,
					"component": "VPCustomInput",
					"field": "externalThrottle",
					"interval": .5
				},
				{
					"label": "brake",
					"topic": "syncity/brake",
					"target": car_obj,
					"component": "VPCustomInput",
					"field": "externalBrake",
					"interval": .5
				},
				{
					"label": "handbrake",
					"topic": "syncity/handbrake",
					"target": car_obj,
					"component": "VPCustomInput",
					"field": "externalHandbrake",
					"interval": .5
				},
				{
					"label": "steer",
					"topic": "syncity/steer",
					"target": car_obj,
					"component": "VPCustomInput",
					"field": "externalSteer",
					"interval": .5
				}
			],
			readLinks=[
				{
					"label": "velocity",
					"topic": "syncity/velocity",
					"target": car_obj,
					"component": "Rigidbody",
					"field": "velocity",
					"interval": .5
				},
				{
					"label": "angularVelocity",
					"topic": "syncity/angularVelocity",
					"target": car_obj,
					"component": "Rigidbody",
					"field": "angularVelocity",
					"interval": .5
				},
				{
					"label": "angularDrag",
					"topic": "syncity/angularDrag",
					"target": car_obj,
					"component": "Rigidbody",
					"field": "angularDrag",
					"interval": .5
				},
				{
					"label": "position",
					"topic": "syncity/position",
					"target": car_obj,
					"component": "Transform",
					"field": "position",
					"interval": .5
				},
				{
					"label": "rotation",
					"topic": "syncity/rotation",
					"target": car_obj,
					"component": "Transform",
					"field": "eulerAngles",
					"interval": .5
				}
			]
		)
	
	common.flush_buffer()
