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
	parser.add_argument('--loopLimit', type=int, default=100, help='Defines a limit of iterations for exporting')

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
#	mycams = ['cameras/cameraRGB', 'cameras/segmentation', 'cameras/depth']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		# helpers.addCameraSeg(width=1024, height=1024, segments=['drone0'], lookupTable=[['drone0', 'red']])
		helpers.addCameraSeg(width=1024, height=1024, segments=['DRONE'], lookupTable=[['DRONE', 'red']])
#		helpers.addCameraDepth(width=1024, height=768)
		helpers.addCameraRGB(width=1024, height=1024, pp='EnviroFX')
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		# HACK: if you want to return BLOBs instead of DEPTH maps use this:
		common.sendData([ '"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "BLOB"' ])
		
		helpers.spawnDroneObjs(
			# prefix='cameras/spawner',
			# dronesLimit=[0,0],
			dronesLimit=[2,2],
			dronesColors=True,
			dronesTags=['phantom'],
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
		'"cameras" SET Transform position ({} {} {})'.format(0, 5, 0),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(random.uniform(-20, 0), 0, 0),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[2]),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format(helpers.clouds_lst[2]),
		'"EnviroSky" SET EnviroSky fogSettings.heightFog false',
		'"EnviroSky" SET EnviroSky fogSettings.distanceFog false',
		'"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage {}'.format(-0.04),
#		'cameras/drone" SET Transform localPosition (0 0 0)',
#		'cameras/drone" SET Transform eulerAngles ({} {} {})'.format(0, 0, 0),
#		'cameras/drone" SET Transform localEulerAngles ({} {} {})'.format(10, 0, 0),
		'"{}" SET Sensors.RenderCamera alwaysOn false'.format(mycams[0]),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false'.format(mycams[0]),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.shutterAngle {}'.format(mycams[0], 270),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount {}'.format(mycams[0], 32),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending {}'.format(mycams[0], 1),
		'"disk1" SET Sensors.Disk counter {}'.format(loop+1),
		
		#'"spawner/cars" SET active False',
		
		# if not using cars, +thermal
		#'"spawner/cars" ADD Thermal.ThermalObjectOverride',
		#'"spawner/cars" SET active True',
		
		# disable blooming effects
		'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false',
	], read=False)
	
	#helpers.setThermalProps('city', temperatureValue=0, temperatureBandwidth=0, temperatureMedian=0, variance=0, reflectivity=0, heatiness=0, ambientOffset=0)
	
	# helpers.setThermalProps('spawner/city', temperatureValue=18, temperatureBandwidth=20, temperatureMedian=1, variance=5)
	
	# helpers.setThermalProps('spawner/animals', temperatureValue=22, temperatureBandwidth=20, temperatureMedian=1, variance=15, heatiness=1)
	#helpers.setThermalProps('spawner/cars', temperatureValue=25, temperatureBandwidth=10, temperatureMedian=0, variance=15, heatiness=0)
	#helpers.setThermalProps(['drone/drone0/drone0'], temperatureValue=0, temperatureBandwidth=0, temperatureMedian=0, variance=0, reflectivity=0, heatiness=-5)

	common.flushBuffer()
	
	while loop < settings.loopLimit:
		if random.uniform(0,1) > 1:
			motionblur = 'true'
		else:
			motionblur = 'false'
		
		motionblur = 'false'
		
#		pX = random.uniform(-1, 1)
#		pY = random.uniform(5, 6)
#		pZ = random.uniform(1.5, 5)

		"""
		# set drone body thermal
		helpers.setThermalProps(
			random.choice(['drone/drone0/drone0', 'drone/drone1/drone1', 'drone/drone2/drone2']),
			temperatureValue=random.randint(-10, 10), heatiness=random.randint(0, 2)
		)
		"""
		
		render_width = random.uniform(768, 1600)
		render_height = random.uniform(768, 1600)
		render_width = math.floor(render_width / 64) * 64
		render_height = math.floor(render_height / 64) * 64
		
#		common.sendData([ 'cameras/cameraRGB" SET Sensors.RenderCamera resolution ({} {})'.format(render_width, render_height) ])
#		common.sendData([ 'cameras/segmentation" SET Sensors.RenderCamera resolution ({} {})'.format(render_width, render_height) ])
		
		if loop % 100 == 0 and loop > 0:
			common.sendData([
				'"spawner/city/ground" SET active false',
				'"spawner/city/ground" SET RandomProps.PropArea numberOfProps {}'.format(random.randint(999, 1000)),
				'"spawner/city/ground" SET active true',
				
				'"spawner/cars" SET active false',
				'"spawner/cars" SET RandomProps.PropArea numberOfProps {}'.format(random.randint(35, 75)),
				'"spawner/cars" SET active true',

				'"spawner/city/nature/trees" SET active false',
				'"spawner/city/nature/trees" SET RandomProps.PropArea numberOfProps {}'.format(random.randint(70, 200)),
				'"spawner/city/nature/trees" SET active true',

				'"spawner/city/buildings" SET active false',
				'"spawner/city/buildings" SET RandomProps.PropArea numberOfProps {}'.format(random.randint(100, 150)),
				'"spawner/city/buildings" SET RandomProps.Torus innerRadius {}'.format(random.randint(30, 100)),
				'"spawner/city/buildings" SET active true',

				'"spawner/roadsigns" SET active false',
				'"spawner/roadsigns" SET RandomProps.PropArea numberOfProps {}'.format(random.randint(160, 250)),
				'"spawner/roadsigns" SET active true',

				'"spawner/humans_0" SET active false',
				'"spawner/humans_0" SET RandomProps.PropArea numberOfProps {}'.format(random.randint(50, 70)),
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
				'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(random.randint(10, 17)),
				
				'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation {}'.format(random.uniform(0.4, 1.3)),
				'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.postExposure {}'.format(random.uniform(-0.5, 0.2)),
				'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast {}'.format(random.uniform(0.9, 1.3)),
				'"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity {}'.format(random.uniform(0.0, 0.3))
			], read=False)
			
		common.sendData([
			'"cameras" SET Transform position ({} {} {})'.format(0, random.uniform(5, 20), 0),
			'"cameras" SET Transform eulerAngles ({} {} {})'.format(random.uniform(-20, 70), 0, 0)
		], read=False)

		pZ = 2.3
		
		"""
		common.sendData([
			'"cameras/drone/drone0" SET Transform localPosition ({} {} {})'.format(random.uniform(-1.0, 1.0), random.uniform(-0.3, 0.70), pZ),
			'"cameras/drone/drone1" SET Transform localPosition ({} {} {})'.format(random.uniform(-1.0, 1.0), random.uniform(0.80, 1.3), pZ),
#			'"cameras/drone/drone0" SET Transform localPosition ({} {} {})'.format(random.uniform(-1.2, 1.2), random.uniform(-0.3, 0.70), pZ),
#			'"cameras/drone/drone1" SET Transform localPosition ({} {} {})'.format(random.uniform(-1.2, 1.2), random.uniform(0.80, 1.3), pZ),
			
#			'"cameras/drone/drone0" SET Transform localPosition ({} {} {})'.format(random.uniform(-1.2, -0.5), random.uniform(-0.3, 0.70), pZ),
#			'"cameras/drone/drone1" SET Transform localPosition ({} {} {})'.format(random.uniform(-0.6, 0), random.uniform(-0.3, 0.70), pZ),
#			'"cameras/drone/drone2" SET Transform localPosition ({} {} {})'.format(random.uniform(0.05, 0.55), random.uniform(-0.3, 0.70), pZ),
#			'"cameras/drone/drone3" SET Transform localPosition ({} {} {})'.format(random.uniform(0.65, 1.2), random.uniform(-0.3, 0.70), pZ),
#			'"cameras/drone/drone4" SET Transform localPosition ({} {} {})'.format(random.uniform(-1.2, -0.5), random.uniform(0.80, 1.3), pZ),
#			'"cameras/drone/drone5" SET Transform localPosition ({} {} {})'.format(random.uniform(-0.6, 0), random.uniform(0.80, 1.3), pZ),
#			'"cameras/drone/drone6" SET Transform localPosition ({} {} {})'.format(random.uniform(0.05, 0.55), random.uniform(0.80, 1.3), pZ),
#			'"cameras/drone/drone7" SET Transform localPosition ({} {} {})'.format(random.uniform(0.65, 1.2), random.uniform(0.80, 1.3), pZ),
		], read=False)
		"""

		if loop % 10 == 0:
			pX = random.uniform(-1.2, -0.55)
			pX = random.uniform(-0.6, 0)
			pX = random.uniform(0.05, 0.6)
			pX = random.uniform(0.65, 1.2)
			pY = random.uniform(0.1, 0.4)
			pY = random.uniform(0.45, 0.9)
			
#			pX = random.uniform(-2, 2)
#			pY = random.uniform(3, 5)
#			pZ = 2
			
			scale_f = random.uniform(0.6,1.5)
			
			common.sendData([
				'"cameras/spawner/drones" SET active false',
				# '"cameras/spawner/drones" SET Transform localEulerAngles ({} {} {})'.format(random.randint(-20, 20), random.randint(-20, 20), random.randint(-20, 20)),
				# '"cameras/spawner/drones" SET Transform localScale ({} {} {})'.format(scale_f, scale_f, scale_f),
				'"cameras/spawner/drones" SET RandomProps.PropArea rotationStep {}'.format(random.randint(0, 180)),
				'"cameras/spawner/drones" SET RandomProps.PropArea propScale ({} {} {})'.format(scale_f, scale_f, scale_f),
				'"cameras/spawner/drones" SET active true'
			], read=False)
			
			"""
			for x in range(0, 2):
				pX = random.uniform(-1.2, -0.55)
				pX = random.uniform(-0.6, 0)
				pX = random.uniform(0.05, 0.6)
				pX = random.uniform(0.65, 1.2)
				pY = random.uniform(0.1, 0.4)
				pY = random.uniform(0.45, 0.9)
				
	#			pX = random.uniform(-2, 2)
	#			pY = random.uniform(3, 5)
	#			pZ = 2
				
				scale_f = random.uniform(0.6,1.5)
				
				common.sendData([
					'"cameras/drone/drone{}" SET Transform localEulerAngles ({} {} {})'.format(x, random.randint(-20, 20), random.randint(-20, 20), random.randint(-20, 20)),
					'"cameras/drone/drone{}" SET Transform localScale ({} {} {})'.format(x, scale_f, scale_f, scale_f),
					'"cameras/drone/drone{}/drone{}" SET active false'.format(x,x),
					'"cameras/drone/drone{}/drone{}" SET active true'.format(x,x),
				], read=False)
			"""
		
		# wait for scene's motion blur to fade
#		time.sleep(0.5)
#		common.flushBuffer()
		helpers.takeSnapshot(mycams, True)
		
		loop = loop + 1
