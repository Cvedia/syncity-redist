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
	- Creates a RGB camera
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
	parser.add_argument('--loop_limit', type=int, default=100, help='Defines a limit of iterations for exporting')

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/depth']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup(orbit=False)
		helpers.addCameraSeg(width=1024, height=1024, segments=['DRONE'], lookupTable=[['DRONE', 'red']])
		helpers.addCameraDepth(width=1024, height=768)
		helpers.addCameraRGB(width=1024, height=1024, pp='EnviroFX')
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		# HACK: if you want to return BLOBs instead of DEPTH maps use this:
		common.sendData([ '"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "BLOB"' ])
		
		helpers.spawnDroneObjs(
			dronesLimit=[2,2],
			dronesColors=True,
			# dronesTags=['phantom'],
			dronesTags=['blurred'],
			dronesPartsNames='chassis,legs,motors,battery,bolts,sensors_caps,sensors,camera,blades',
			
			buildingsInnerRadius=80,
			treesLimit=[150,200], treesInnerRadius=15, treesRadius=60, buildingsLimit=[100,100],
			#
			# NOTE:
			#
			# use only 'car' to spawn cars without thermal signature, that will be then
			# linked to a default profile, note that this will not show full detail, but
			# it's pretty much the same from a distance.
			#
			# use 'car, +thermal' to spawn only cars with thermal profiles
			#
			carsTags=['car'],
			seed=-1
		)
		
		"""
		for x in range(0,2):
			common.sendData([
				'CREATE "cameras/drone/drone{}/drone{}" "{}"'.format(x,x,helpers.drones_lst[6]), # Drones/DJI Phantom 4 Pro/DJI_Phantom_4_Pro
				'"cameras/drone/drone{}" ADD Segmentation.ClassGroup'.format(x),
				'"cameras/drone/drone{}" SET active false'.format(x),
				
				'"cameras/drone/drone{}" SET Segmentation.ClassGroup itemsClassName "drone0"'.format(x),
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
	settings.seqSave_i = loop;
	
	# reset camera
	common.sendData([
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {}) eulerAngles ({}~{} {} {})'.format(0, 5, 0, -20, 0, 0, 0),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[2]),
		'"EnviroSky" SET EnviroSky cloudsMode "{}" fogSettings.heightFog false fogSettings.distanceFog false cloudsSettings.globalCloudCoverage {}'.format(helpers.clouds_lst[2], -0.04),
		'"{}" SET Sensors.RenderCamera alwaysOn false'.format(mycams[0]),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled true'.format(mycams[0]),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.shutterAngle {}'.format(mycams[0], 360),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount {}'.format(mycams[0], 4),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending {}'.format(mycams[0], .064),
		'"disk1" SET Sensors.Disk counter {}'.format(loop+1),
		
		# if not using cars, +thermal
		#'"spawner/cars" ADD Thermal.ThermalObjectOverride',
		#'"spawner/cars" SET active True',
		
		# disable blooming effects
		'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false',
		
		# shrink spawn area to make it fit on camera frustrum
		'"cameras/spawner" SET Transform localScale (0.75 0.75 0.75)'
		
	], read=False)
	
	common.flushBuffer()
	
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
			common.sendData([
				'"spawner/city/ground" SET active false',
				'"spawner/city/ground" SET RandomProps.PropArea numberOfProps {}~{}'.format(500, 1000),
				'"spawner/city/ground" SET active true',
				
				'"spawner/cars" SET active false',
				'"spawner/cars" SET RandomProps.PropArea numberOfProps {}~{}'.format(35, 75),
				'"spawner/cars" SET active true',

				'"spawner/city/nature/trees" SET active false',
				'"spawner/city/nature/trees" SET RandomProps.PropArea numberOfProps {}~{}'.format(70, 200),
				'"spawner/city/nature/trees" SET active true',

				'"spawner/city/buildings" SET active false',
				'"spawner/city/buildings" SET RandomProps.PropArea numberOfProps {}~{}'.format(100, 150),
				'"spawner/city/buildings" SET RandomProps.Torus innerRadius {}~{}'.format(30, 100),
				'"spawner/city/buildings" SET active true',

				'"spawner/roadsigns" SET active false',
				'"spawner/roadsigns" SET RandomProps.PropArea numberOfProps {}~{}'.format(160, 250),
				'"spawner/roadsigns" SET active true',

				'"spawner/humans_0" SET active false',
				'"spawner/humans_0" SET RandomProps.PropArea numberOfProps {}~{}'.format(50, 70),
				'"spawner/humans_0" SET active true',
			], read=False)
		elif loop % 10 == 0:
			common.sendData([
				'"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle',
				'"spawner/cars" EXECUTE RandomProps.PropArea Shuffle',
				'"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle',
				'"spawner/animals/birds" EXECUTE RandomProps.PropArea Shuffle',
				'"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle',
				'"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle',
				'"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle',
			], read=False)
			
			common.sendData([
				'"EnviroSky" SET EnviroSky GameTime.Hours {}~{}'.format(10, 17),
				
				'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation {}~{}'.format(0.4, 1.3),
				'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.postExposure {}~{}'.format(-0.5, 0.2),
				'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast {}~{}'.format(0.9, 1.3),
				'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity {}~{}'.format(0.0, 0.3)
			], read=False)
			
		common.sendData([
			'"cameras" SET Transform position ({} {}~{} {}) eulerAngles ({}~{} {} {})'.format(0, 5, 20, 0, -20, 70, 0, 0)
		], read=False)
		
		if loop % 10 == 0:
			common.sendData([
				'"cameras/spawner/drones" SET active false',
				'"cameras/spawner/drones" SET RandomProps.PropArea rotationStep {}~{}'.format(0, 180),
				'"cameras/spawner/drones" SET RandomProps.PropArea propScale ({}~{} {}~{} {}~{})'.format(0.6, 1.5, 0.6, 1.5, 0.6, 1.5),
				'"cameras/spawner/drones" SET active true'
			], read=False)
		
		common.sendData([
			# randomize drone positions
			'"cameras/spawner/drones" EXECUTE RandomProps.PropArea Shuffle',
			# move drone container a bit further away
			'"cameras/spawner" SET Transform localPosition (0 0 {}~{})'.format(.5, 1.5),
			# enable rendering for motion blur
			'"{}" SET Camera enabled true'.format(mycams[0])
		])
		time.sleep(.5)
		helpers.takeSnapshot(mycams, True)
		
		loop = loop + 1
