import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Autodrive
	- Spawns autodrive track
	- Setups envirosky postprocessing filters
	- Creates a RGB camera on bumper
	- Creates a Segmentation map camera following RGB output
	- Creates a Depth map camera following RGB output
	- Setup segmentation classes
	- Setup lidar device
	- Setup multiple ROS2 ios for driving car
	- Setup ROS2 image output for each of the cameras
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
		'{}/Depth'.format(camera_mount),
		'{}/Segment'.format(camera_mount),
		'{}/Back'.format(camera_mount),
	]
	
	if settings.skip_setup == False:
		common.sendData([
			'"Config.instance" SET physicsEnabled true',
			'CREATE "autodrive/autodrive_tile" FROM "autodrive" AS "autodrive"',
			'CREATE "autodrive/SyncityJPickup" FROM "autodrive" AS "{}"'.format(car_obj)
		])
		
		helpers.addWindzone(target='autodrive')
		"""
		helpers.addCameraRGB(width=640, height=480, pp='EnviroFX', label=mycams[3], labelRoot=camera_mount, audio=False, renderCamera=True)
		
		helpers.LCP(
			camera=mycams[3],
			radialParam1=5,
			radialParam2=5,
			isFisheyeDistortion=True
		)
		"""
		helpers.globalCameraSetup(labelRoot=camera_mount)
		helpers.addCameraRGB(width=640, height=480, pp='EnviroFX', label=mycams[0], labelRoot=camera_mount, audio=False, renderCamera=True)
		helpers.addCameraDepth(width=640, height=480, label=mycams[1], renderCamera=True)
		helpers.addCameraSeg(
			width=640, height=480,
			label=mycams[2],
			segments=['LINES', 'DIRT', 'ROAD', 'PROPS', 'SIGNS'],
			lookupTable=[
				['LINES', 'white'],
				['DIRT', 'blue'],
				['ROAD', '#838383'],
				['PROPS', '#09FF00'],
				['SIGNS', 'red']
			],
			renderCamera=True
		)
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		common.sendData([
			# flycam
			# '"{}" ADD FlyCamera'.format(mycams[0]),
			# '"{}" SET FlyCamera enabled true'.format(mycams[0]),
			
			# segment setup
			'"autodrive/Road/Lines" ADD Segmentation.Entity Segmentation.Class',
			'"autodrive/Road/Lines" SET Segmentation.Class className "LINES"',
			'"autodrive/Road/Dirt" ADD Segmentation.Entity Segmentation.Class',
			'"autodrive/Road/Dirt" SET Segmentation.Class className "DIRT"',
			'"autodrive/Road/Props" ADD Segmentation.Entity Segmentation.Class',
			'"autodrive/Road/Props" SET Segmentation.Class className "PROPS"',
			'"autodrive/Road/Signs" ADD Segmentation.Entity Segmentation.Class',
			'"autodrive/Road/Signs" SET Segmentation.Class className "SIGNS"',
			'"autodrive/Road/Road floor Signs" ADD Segmentation.Entity Segmentation.Class',
			'"autodrive/Road/Road floor Signs" SET Segmentation.Class className "SIGNS"',
			
			'"autodrive/Terrain New" ADD Segmentation.Class',
			'"autodrive/Terrain New" SET Segmentation.Class className "DIRT"',
			'"autodrive/Road/Autodrive Road" ADD Segmentation.Class',
			'"autodrive/Road/Autodrive Road" SET Segmentation.Class className "ROAD"',
			
			# reset cameras
			'"{}" SET Transform localPosition (0 0.872 2.318) localEulerAngles (0 0 0)'.format(camera_mount),
			
			# reset car position
			'"{}" SET Transform position (-100.76 2.25 -415.57) eulerAngles (0.274 37.499 0)'.format(car_obj),
			
			# add custom inputs for ros bridge
			# WARNING: When VPCustomInput is enabled, you won't be able to drive using the keys
			# '"{}" ADD VPCustomInput'.format(car_obj),
			'"{}" SET VPCustomInput enabled false'.format(car_obj),
			
			# '"{}" ADD UnityEngine.PostProcessing.PostProcessingBehaviour'.format(mycams[0]),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"'.format(mycams[0]),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled true'.format(mycams[0]),
			
			# '"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.enabled true'.format(mycams[0]),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.tonemapper "1"'.format(mycams[0]),
			
			# antialiasing
			'''"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour
				profile.antialiasing.enabled true
				profile.antialiasing.settings.method 1
				profile.antialiasing.settings.taaSettings.jitterSpread 1.0
				profile.antialiasing.settings.taaSettings.sharpen 0.8
				profile.antialiasing.settings.taaSettings.stationaryBlending 0.99
				profile.antialiasing.settings.taaSettings.motionBlending 0.8
			'''.format(mycams[0]),
			
			# ambient occlusion
			'''"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour
				profile.ambientOcclusion.enabled true
				profile.ambientOcclusion.settings.intensity 1.3
				profile.ambientOcclusion.settings.radius 0.3
				profile.ambientOcclusion.settings.sampleCount 10
				profile.ambientOcclusion.settings.downsampling 1
				profile.ambientOcclusion.settings.forceForwardCompatibility 0
				profile.ambientOcclusion.settings.ambientOnly 0
				profile.ambientOcclusion.settings.highPrecision 0
			'''.format(mycams[0]),
			
			# motion blur
			'''"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour
				profile.motionBlur.enabled true
				profile.motionBlur.settings.shutterAngle 180
				profile.motionBlur.settings.sampleCount 4
				profile.motionBlur.settings.frameBlending 0.5
			'''.format(mycams[0]),
			
			'"autodrive" SET active true'
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
			'"{}" SET Sensors.RenderCamera alwaysOn true'.format(mycams[2]),
			'"{}" SET Camera enabled true'.format(mycams[0]),
			'"{}" SET Camera enabled true'.format(mycams[1]),
			'"{}" SET Camera enabled true'.format(mycams[2]),
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
				{
					"label": "segmentation_camera",
					"topic": "syncity/segmentation_camera",
					"target": mycams[2],
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
	
	common.waitQueue()
