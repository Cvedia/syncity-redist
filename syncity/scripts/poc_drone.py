import random
import time
import math
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

# use lite drone packages
# helpers.drones_lst = helpers.drones_lite_lst

def help():
	return '''\
POC Drone
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
		parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')
	except:
		pass

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/depth', 'cameras/thermal']
	# set to `embedded` for rotors that are blurred textures
	# set to `motion` for rotors that will be blurred by render camera's motion blur
	blurring_method = 'embedded'
	limits = {
		'trees': [20,50],
		'buildings': [20,50],
		'birds': [25,100],
		'cars': [5,15],
		'drones': [2,2],
		'animals': [10,50],
		'ground': [200,300],
		'humans': [20,50],
		'signs': [50,250]
	}
	
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
		
		# WARNING: Deprecated in favor to data export module
		if common.versionCompare(settings._simulator_version, '18.07.26.0000', '<'):
			helpers.globalDiskSetup()
			helpers.addDiskOutput(mycams)
			
			# if you want to return BLOBs instead of DEPTH maps use this:
			# common.sendData([ '"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "BLOB"' ])
			common.sendData([ '"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"' ])
			
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
		
		# chromatic aberration on red channel
		helpers.LCP(
			camera=mycams[0],
			redParam1=0.05,
			redParam2=0.05
		)
		
		helpers.spawnDroneObjs(
			dronesColors=True,
			dronesTags=['blurred' if blurring_method == 'embedded' else 'phantom'],
			dronesPartsNames='chassis,legs,motors,battery,bolts,sensors_caps,sensors,camera,blades',
			
			groundLimit=limits['ground'],
			humansLimit=limits['humans'],
			signsLimit=limits['signs'],
			treesLimit=limits['trees'],
			buildingsLimit=limits['buildings'],
			birdsLimit=limits['birds'],
			carsLimit=limits['cars'],
			dronesLimit=limits['drones'],
			animalsLimit=limits['animals'],
			
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
			treesInnerRadius=15, treesRadius=60,
			
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
		
		common.sendData([
			# disable car reflection probes
			'REGEX "^spawner/cars/container$/.*/Reflection Probe" SET ReflectionProbe enabled false'
		])
		
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
		# helpers.addThermalProfileOverride(target='cameras/spawner/drones/container', heatinessMode='Absolute', heatinessValue=250, temperatureMode='Absolute', temperatureValue=300)
		helpers.setThermalProps(objs='cameras/spawner/drones/container', heatiness=250, temperatureValue=300)
		
		if common.versionCompare(settings._simulator_version, '18.07.26.0000', '>='):
			helpers.addDataExport(
				imageLinks=helpers.cameraExportParametrize(mycams, "image"),
				fieldLinks=[
					{
						"target": "cameras",
						"label": "cameraPosition",
						"componentName": "Transform",
						"fieldName": "position",
						"onChange": True
					}
				]
			)
	
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
	
	common.sendData([
		'"AssetBundles.GameobjectCache" SET AssetBundles.GameobjectCache cachedObjectsLimit {}'.format(settings.cache_limit),
		# global reflection probe
		'"cameras/thermal" ADD ReflectionProbe',
		'"cameras/thermal" SET ReflectionProbe mode 1 refreshMode 1 shadowDistance 0 boxProjection true farClipPlane 350 size (250 250 250) resolution 1024 hdr true enabled true',
		
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras/thermal" SET Camera enabled true',
		
		'"cameras" SET Transform position ({} {} {}) eulerAngles ({}~{} {} {})'.format(0, 5, 0, -20, 0, 0, 0),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[2]),
		'"EnviroSky" SET EnviroSky cloudsMode "{}" fogSettings.heightFog false fogSettings.distanceFog false cloudsSettings.globalCloudCoverage {}'.format(helpers.clouds_lst[2], -0.04),
		'"{}" SET Sensors.RenderCamera alwaysOn false'.format(mycams[0]) if common.versionCompare(settings._simulator_version, '18.07.26.0000', '<') else '',
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
		
		if loop > 0:
			if loop % 100 == 0:
				common.sendData([
					'"spawner" SET active false',
					'"spawner/city/ground/container" SET RandomProps.PropArea numberOfProps {}~{}'.format(limits['ground'][0], limits['ground'][1]),
					'"spawner/cars/container" SET RandomProps.PropArea numberOfProps {}~{}'.format(limits['cars'][0], limits['cars'][1]),
					'"spawner/city/nature/trees/container" SET RandomProps.PropArea numberOfProps {}~{}'.format(limits['trees'][0], limits['trees'][1]),
					'"spawner/city/buildings/container" SET RandomProps.PropArea numberOfProps {}~{}'.format(limits['buildings'][0], limits['buildings'][1]),
					'"spawner/city/buildings/container" SET RandomProps.Torus innerRadius {}~{}'.format(30, 100),
					'"spawner/roadsigns/container" SET RandomProps.PropArea numberOfProps {}~{}'.format(limits['signs'][0], limits['signs'][1]),
					'"spawner/humans_0/container" SET RandomProps.PropArea numberOfProps {}~{}'.format(limits['humans'][0], limits['humans'][1]),
					'"spawner" SET active true',
					'REGEX "^spawner/cars/container$/.*/Reflection Probe" SET ReflectionProbe enabled false'
				])
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
			
		
		common.sendData([
			# randomize drone positions
			'"cameras/spawner/drones/container" EXECUTE RandomProps.PropArea Shuffle',
			# move drone container a bit further away
			'"cameras/spawner" SET Transform localPosition (0 0 {}~{})'.format(.5, 1.5),
			# randomize prop rotations on all axis
			'"cameras/spawner/drones/container" EXECUTE RandomProps.PropArea RandomizeRotations (0 360) (0 360) (0 360)',
			# enable rendering for motion blur
			# '"{}" SET Camera enabled true'.format(mycams[0]) if blurring_method != 'embedded' else ''
		])
		
		if blurring_method != 'embedded':
			common.sendData('SLEEP 1', read=True)
		
		# intentionally last as this will trigger data export
		common.sendData([
			'"cameras" SET Transform position ({} {}~{} {}) eulerAngles ({}~{} {} {})'.format(0, 5, 20, 0, -20, 70, 0, 0)
		], read=False)
		
		# WARNING: Deprecated in favor to data export module
		if common.versionCompare(settings._simulator_version, '18.07.26.0000', '<'):
			helpers.takeSnapshot(mycams, autoSegment=True)
		
		loop = loop + 1
		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
