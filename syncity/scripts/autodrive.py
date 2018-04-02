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
	- Setup ROS2 image output
	- Exits leaving all objects exposed
'''

def args(parser):
	try:
		parser.add_argument('--disable_ros', action='store_true', default=False, help='Disables ROS')
	except: pass
	
	try:
		parser.add_argument('--disable_lidar', action='store_true', default=False, help='Disables LiDAR')
	except: pass
	
	try:
		parser.add_argument('--lidar_ip', default="192.168.1.100", help='Defines a IP for lidar devices')
	except: pass
	
	try:
		parser.add_argument('--enable_cube', action='store_true', default=False, help='Adds a 1x1x1 cube 1 meter away from the front camera')
	except: pass

def run():
	settings.keep = True
	
	car_obj = 'SyncityJPickup'
	camera_mount = '{}/cameras'.format(car_obj)
	mycams = [
		'{}/Front'.format(camera_mount),
		'{}/Depth'.format(camera_mount)
	]
	
	if settings.skip_setup == False:
		common.sendData([
			'CREATE "autodrive/autodrive_tile" FROM "autodrive" AS "autodrive"',
			'CREATE "autodrive/SyncityJPickup" FROM "autodrive" AS "{}"'.format(car_obj),
			'"autodrive" SET active true'
		])
		
		helpers.addWindzone(target='autodrive')
		
		helpers.globalCameraSetup(labelRoot=camera_mount)
		helpers.addCameraRGB(width=640, height=480, pp='EnviroFX', label=mycams[0], labelRoot=camera_mount, audio=False)
		helpers.addCameraDepth(width=640, height=480, label=mycams[1])
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		common.sendData([
			# flycam
			# '"{}" ADD FlyCamera'.format(mycams[0]),
			# '"{}" SET FlyCamera enabled true'.format(mycams[0]),
			
			# reset cameras
			'"{}" SET Transform localPosition (0 0.872 2.318) localEulerAngles (0 0 0)'.format(camera_mount),
			
			# reset car position
			'"{}" SET Transform position (-100.76 2.25 -415.57) eulerAngles (0.274 37.499 0)'.format(car_obj),
			
			# add custom inputs for ros bridge
			# WARNING: When VPCustomInput is enabled, you won't be able to drive using the keys
			'"{}" SET VPCustomInput enabled true'.format(car_obj),
			
			'"{}" ADD UnityEngine.PostProcessing.PostProcessingBehaviour'.format(mycams[0]),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"'.format(mycams[0]),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled true'.format(mycams[0]),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.tonemapper "1"'.format(mycams[0])
		], read=False)
		
		# add 1x1x1 meter cube 1 meter away from front camera mount
		# if you place the cube at 0 1 1 it will also show on lidar
		if settings.enable_cube:
			common.sendData([
				'CREATE "_subsystems/splinetool/prefabs/cube" FROM "drones" AS "{}/cube"'.format(camera_mount),
				'"{}/cube" SET active true'.format(camera_mount),
				'"{}/cube" SET Transform localEulerAngles (0 0 0) localPosition (0 0 1)'.format(camera_mount)
			], read=False)
		
		if settings.disable_lidar == False:
			helpers.addLidar(
				label='{}/Lidar'.format(car_obj),
				localPosition=[0, 2, 0],
				localRotation=[0, 0, 0],
				timingAccuracy='ULTRA',
				ipAddressOverride=settings.lidar_ip
			)
		
		common.sendData([
			'"{}" SET Sensors.RenderCamera alwaysOn true'.format(mycams[0]),
			'"{}" SET Sensors.RenderCamera alwaysOn true'.format(mycams[1]),
			'"{}" SET Camera enabled true'.format(mycams[0]),
			'"{}" SET Camera enabled true'.format(mycams[1]),
			'"{}" SET active true'.format(car_obj),
			'"EnviroSky" EXECUTE EnviroSky ChangeWeather "Cloudy 1"'
		], read=False)
	
	# setup ros ios
	if settings.disable_ros == False:
		helpers.setupROSTopics(
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
				},
				{
					"label": "front_camera",
					"topic": "syncity/front_camera",
					"target": mycams[0],
					"component": "Camera",
					"field": "targetTexture",
					"interval": 1
				},
				# WARNING: This camera will be exported as 32-bit depth single channel
				{
					"label": "depth_camera",
					"topic": "syncity/depth_camera",
					"target": mycams[1],
					"component": "Camera",
					"field": "targetTexture",
					"interval": 1
				}
			]
		)
	
	common.flushBuffer()
