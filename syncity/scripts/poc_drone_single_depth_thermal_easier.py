import random
import time
import math
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

# use lite drone packages
# helpers.drones_lst = helpers.drones_lite_lst

def help():
	return '''\
POC Drone single scene
	- Creates a RGB camera with video compression artifacts
	- Creates a Segmentation camera
	- Creates a Depth camera
	- Creates a Thermal camera
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Creates 3 specific drones, adding heat properties to motors / engines
	- Binds default thermal profile to objects that don't contain a full thermal profile
	- Creates a thermal override to create a random thermal signature
	- Orbits around from ground perspective looking at drones, rotating different torus randomizing drone heat patterns
	- Exports segmentation map bounding boxes
	- Exports RGB images
	- Exports Segmentation images
	- Exports Depth images
	- Exports Thermal images
	- Exits leaving all objects exposed
'''

def args(parser):
	try:
		parser.add_argument('--loop_limit', type=int, default=100, help='Defines a limit of iterations for exporting')
	except:
		pass

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/depth', 'cameras/thermal']
	# set to `embedded` for rotors that are blurred textures
	# set to `motion` for rotors that will be blurred by render camera's motion blur
	blurring_method = 'embedded'
	
	if settings.skip_setup == False:
		camera_size = [ 1024, 1024 ]
		
		helpers.globalCameraSetup(orbit=False)
		helpers.addCameraSeg(width=camera_size[0], height=camera_size[1], segments=['DRONE'], lookupTable=[['DRONE', 'red']])
		helpers.addCameraDepth(width=camera_size[0], height=camera_size[1])
		helpers.addCameraRGB(width=camera_size[0], height=camera_size[1], pp='EnviroFX')
		helpers.addCameraThermal(
			trees=True,
			ambientTemperature=15, minimumTemperature=9, maximumTemperature=35,
			treesBase=8, treesBandwidth=50, treesMedian=0, treesLeafsVariance=10
		)
		
		"""
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		# if you want to return BLOBs instead of DEPTH maps use this:
		# common.sendData([ '"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "BLOB"' ])
		common.sendData([ '"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"' ])
		"""
		
		# chromatic aberration on red channel
		helpers.LCP(
			camera=mycams[0],
			redParam1=0.05,
			redParam2=0.05
		)
		
		"""
		# video compression artifacts
		common.sendData([
			# Add video compression artifacts to rgb output
			# WARNING: This is a hack, might be deprecated on the next versions of the simulator
			'"disk1/Cameras/camerargb" SET active false',
			'"disk1/Cameras/camerargb" SET Sensors.RenderCameraLink videoFilter true',
			'"disk1/Cameras/camerargb" ADD Sensors.Augmentations',
			'"disk1/Cameras/camerargb" SET active true'
		], read=False)
		"""
		
		helpers.spawnDroneObjs(
			dronesLimit=[2,2],
			dronesColors=True,
			dronesTags=['blurred' if blurring_method == 'embedded' else 'phantom'],
			dronesPartsNames='chassis,legs,motors,battery,bolts,sensors_caps,sensors,camera,blades',
			
			animalsThermalObjectBehaviour=True,
			birdsThermalObjectBehaviour=True,
			treesThermalObjectBehaviour=True,
			buildingsThermalObjectBehaviour=True,
			carsThermalObjectBehaviour=True,
			groundThermalObjectBehaviour=True,
			dronesThermalObjectBehaviour=True,
			humansThermalObjectBehaviour=True,
			signsThermalObjectBehaviour=True,
			cityThermalObjectBehaviour=True,
			buildingsInnerRadius=80,
			treesLimit=[20,50], treesInnerRadius=15, treesRadius=60, buildingsLimit=[20,50],
			#
			# NOTE:
			#
			# use only 'car' to spawn cars without thermal signature, that will be then
			# linked to a default profile, note that this will not show full detail, but
			# it's pretty much the same from a distance.
			#
			# use 'car, +thermal' to spawn only cars with thermal profiles
			#
			carsTags=['+car, +thermal'],
			animalsTags=['+animal, +thermal']
		)
		
		"""
		for x in range(0,2):
			common.sendData([
				'CREATE "cameras/drone/drone{}/drone{}" "{}"'.format(x,x,helpers.drones_lst[6]), # Drones/DJI Phantom 4 Pro/DJI_Phantom_4_Pro
				'"cameras/drone/drone{}" ADD Segmentation.Entity Segmentation.Class'.format(x),
				'"cameras/drone/drone{}" SET active false'.format(x),
				
				'"cameras/drone/drone{}" SET Segmentation.Class className "drone0"'.format(x),
				'"cameras/drone/drone{}/drone{}" SET Transform position ({} {} {})'.format(x, x, 0, 1, 0),
			], read=False)
			
			common.sendData([
				'"cameras/drone/drone{}" SET active true'.format(x),
				'"cameras/drone/drone{}/drone{}" SET active true'.format(x, x),
				'"cameras/drone/drone{}/drone{}" SET Transform localPosition (0 0 0)'.format(x,x),
			], read=False)
			
			# randomize colors of drones
			helpers.addRandomColor(['cameras/drone/drone{}/drone{}'.format(x, x)], method="Random")
			
			common.sendData([
				'"cameras/drone/drone{}/drone{}" SET RandomProps.RandomColor partsNames "chassis,legs,motors,battery,bolts,sensors_caps,sensors,camera,blades"'.format(x,x),
#				'"cameras/drone/drone{}/drone{} PUSH RandomProps.RandomColor availableColors "#FF0000"'.format(x,x),
#				'"cameras/drone/drone{}/drone{} PUSH RandomProps.RandomColor availableColors "#FFFFFF"'.format(x,x),
#				'"cameras/drone/drone{}/drone{} PUSH RandomProps.RandomColor availableColors "#00FF00"'.format(x,x),
#				'"cameras/drone/drone{}/drone{} PUSH RandomProps.RandomColor availableColors "#0000FF"'.format(x,x),
#				'"cameras/drone/drone{}/drone{} PUSH RandomProps.RandomColor availableColors "#101010"'.format(x,x),
			], read=False)
		"""
		# common.sendData('"cameras/spawner/drones" SET active false')
		# helpers.addThermalProfileOverride(target='cameras/spawner/drones/container', heatinessMode='Absolute', heatinessValue=250, temperatureMode='Absolute', temperatureValue=300)
		helpers.setThermalProps(objs='cameras/spawner/drones/container', heatiness=250, temperatureValue=300)
		# common.sendData('"cameras/spawner/drones" SET active true')
		
		helpers.addImageExport(mycams, params={
			"streamFormat": ["jpg", "png", "tif", "jpg"],
			"exportBBoxes": True
		})
	
	pX_r = [-5, 5]
	pY_r = [1.5, 8]
	pZ_r = [3, 9]
	
	pX = 0
	pY = 8
	pZ = 3
	
	pX_d = 1
	pY_d = 1
	pZ_d = 1
	
	loop = 0
	
	# reset camera
	common.sendData([
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras/thermal" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {}) eulerAngles ({}~{} {} {})'.format(0, 5, 0, -20, 0, 0, 0),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[2]),
		'"EnviroSky" SET EnviroSky cloudsMode "{}" fogSettings.heightFog false fogSettings.distanceFog false cloudsSettings.globalCloudCoverage {}'.format(helpers.clouds_lst[2], -0.04),
		'"{}" SET Sensors.RenderCamera alwaysOn false'.format(mycams[0]),
		'''"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour
				profile.motionBlur.enabled true
				profile.motionBlur.settings.shutterAngle {}
				profile.motionBlur.settings.sampleCount {}
				profile.motionBlur.settings.frameBlending {}
		'''.format(mycams[0], 360, 4, .064) if blurring_method != 'embedded' else '"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false'.format(mycams[0]),
		# '"disk1" SET Sensors.Disk counter {}'.format(loop+1),
		
		# if not using cars, +thermal
		#'"spawner/cars" ADD Thermal.ThermalObjectOverride',
		#'"spawner/cars" SET active True',
		
		# disable blooming effects
		'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false',
		
		# shrink spawn area to make it fit on camera frustrum
		'"cameras/spawner" SET Transform localScale (0.75 0.75 0.75)'
		
	], read=False)
	
	common.flushBuffer()
	
	if settings.setup_only == True:
		return
	
	helpers.kickSeg(mycams[1])
	kick = False
	
	while loop < settings.loop_limit:
		"""
		# set drone body thermal
		helpers.setThermalProps(
			random.choice(['drone/drone0/drone0', 'drone/drone1/drone1', 'drone/drone2/drone2']),
			temperatureValue=random.randint(-10, 10), heatiness=random.randint(0, 2)
		)
		"""
		
		"""
		# randomize camera resolution
		common.sendData([ 'cameras/cameraRGB" SET Sensors.RenderCamera resolution ({}~{} {}~{})'.format(768, 1600, 768, 1600) ])
		common.sendData([ 'cameras/segmentation" SET Sensors.RenderCamera resolution ({}~{} {}~{})'.format(768, 1600, 768, 1600) ])
		"""
		
		if loop % 100 == 0 and loop > 0:
		# if loop == 0:
			common.sendData([
				'"spawner/city/ground/container" SET active false',
				'"spawner/city/ground/container" SET RandomProps.PropArea numberOfProps {}~{}'.format(500, 1000),
				'"spawner/city/ground/container" SET active true',
				
				'"spawner/cars/container" SET active false',
				'"spawner/cars/container" SET RandomProps.PropArea numberOfProps {}~{}'.format(35, 75),
				'"spawner/cars/container" SET active true',

				'"spawner/city/nature/trees/container" SET active false',
				'"spawner/city/nature/trees/container" SET RandomProps.PropArea numberOfProps {}~{}'.format(70, 200),
				'"spawner/city/nature/trees/container" SET active true',

				'"spawner/city/buildings/container" SET active false',
				'"spawner/city/buildings/container" SET RandomProps.PropArea numberOfProps {}~{}'.format(100, 150),
				'"spawner/city/buildings/container" SET RandomProps.Torus innerRadius {}~{}'.format(30, 100),
				'"spawner/city/buildings/container" SET active true',

				'"spawner/roadsigns/container" SET active false',
				'"spawner/roadsigns/container" SET RandomProps.PropArea numberOfProps {}~{}'.format(160, 250),
				'"spawner/roadsigns/container" SET active true',

				'"spawner/humans_0/container" SET active false',
				'"spawner/humans_0/container" SET RandomProps.PropArea numberOfProps {}~{}'.format(50, 70),
				'"spawner/humans_0/container" SET active true',
			], read=False)
			
			kick = True
		elif loop % 10 == 0:
			common.sendData([
				'"spawner/city/ground/container" EXECUTE RandomProps.PropArea Shuffle',
				'"spawner/cars/container" EXECUTE RandomProps.PropArea Shuffle',
				'"spawner/city/nature/trees/container" EXECUTE RandomProps.PropArea Shuffle',
				'"spawner/animals/birds/container" EXECUTE RandomProps.PropArea Shuffle',
				'"spawner/city/buildings/container" EXECUTE RandomProps.PropArea Shuffle',
				'"spawner/roadsigns/container" EXECUTE RandomProps.PropArea Shuffle',
				'"spawner/humans_0/container" EXECUTE RandomProps.PropArea Shuffle',
			], read=False)
			
			common.sendData([
				'"EnviroSky" SET EnviroSky GameTime.Hours {}~{}'.format(10, 17),
				
				'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation {}~{}'.format(0.4, 1.3),
				'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.postExposure {}~{}'.format(-0.5, 0.2),
				'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast {}~{}'.format(0.9, 1.3),
				'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity {}~{}'.format(0.0, 0.3)
			], read=False)
			
			kick = True
			
		common.sendData([
			'"cameras" SET Transform position ({} {}~{} {}) eulerAngles ({}~{} {} {})'.format(0, 5, 20, 0, -20, 70, 0, 0)
		], read=False)
		
		if loop % 10 == 0:
			common.sendData([
				'"cameras/spawner/drones/container" SET active false',
				'"cameras/spawner/drones/container" SET RandomProps.PropArea rotationStep {}~{}'.format(0, 180),
				# '"cameras/spawner/drones/container" SET RandomProps.PropArea propScale ({}~{} {}~{} {}~{})'.format(0.6, 1.5, 0.6, 1.5, 0.6, 1.5),
				'"cameras/spawner/drones/container" SET active true'
			], read=False)
			kick = True
		
		common.sendData([
			# randomize drone positions
			'"cameras/spawner/drones/container" EXECUTE RandomProps.PropArea Shuffle',
			# move drone container a bit further away
			'"cameras/spawner" SET Transform localPosition (0 0 {}~{})'.format(.5, 1.5),
			# randomize prop rotations on all axis
			'"cameras/spawner/drones/container" EXECUTE RandomProps.PropArea RandomizeRotations (0 360) (0 360) (0 360)',
			# enable rendering for motion blur
			'"{}" SET Camera enabled true'.format(mycams[0]) if blurring_method != 'embedded' else ''
		])
		
		if blurring_method != 'embedded':
			common.sendData('SLEEP 1', read=True)
		
		if kick == True:
			helpers.kickSeg(mycams[1])
			kick = False
		
		# helpers.takeSnapshot(mycams, autoSegment=True)
		
		loop = loop + 1
		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
