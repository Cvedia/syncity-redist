import os
import copy
import sys

from .. import common, helpers, settings_manager, db

settings = settings_manager.Singleton()

def help():
	return '''\
Endless Runner
	This is a highly configurable scene allowing for tile cycling, stereo cameras,
	vehicle spawner, surrondings randomization, day / night cycle, weather,
	different predefined camera setups, etc.
'''

def minVersion():
	return '18.07.00.0000'

def placeObstacle(_params, destroy=False):
	params = copy.deepcopy(_params)
	
	try:
		timeToLive = params['timeToLive']
	except KeyError:
		timeToLive = -1
	
	try:
		obstacleName = params['label']
	except KeyError:
		obstacleName = 'obstacle_obj'
	
	if params['assetPath'] == False:
		common.output('Trying to find an asset to spawn...', 'DEBUG')
		params['assetPath'] = db.getRandomBundlePrefab(params['assetBundle'], 1)[0]
	
	if 'delay' in params and params['delay'] > 0:
		common.sendData('SLEEP {}'.format(params['delay']))
	
	common.sendData([
		'DELETE "{}"'.format(obstacleName) if destroy == True else '',
		'CREATE "{}" FROM "{}" AS "{}"'.format(params['assetPath'], params['assetBundle'], obstacleName),
		'"TrafficEvents" EXECUTE TrafficEvents PlaceObjectAheadOf "{}" "{}" {} {} {}'.format(params['target'], obstacleName, params['distance'], params['angle'], timeToLive),
		'"{}/Reflection Probe" SET active false'.format(obstacleName)
	])

def run():
	if settings.isset('options') == None:
		common.output('No --options sent!', 'ERROR')
		return
	
	if settings.layout == None:
		common.findLayoutFromOptions(os.path.basename(__file__).split('.')[0], suffix='_stereo', prefix="endless_runner/")
	
	options = settings.options
	helpers.setQualitySettings(options['quality'])
	
	if settings.skip_setup == False:
		mycams = []
		# populate camera mask and flags
		options['flags'] = []
		options['cam_mask'] = {}
		
		for k, v in options['cams'].items():
			if v['type'] not in options['flags']:
				options['flags'].append(v['type'])
				options['cam_mask'][v['type']] = []
			
			options['cam_mask'][v['type']].append(k)
		
		if not 'SEGMENTATION' in options['flags'] and 'SEGMENTATION_IID' in options['flags']:
			common.output('You must have a segmentation camera in order to produce proper segmentation instance ids outputs', 'FATAL')
			sys.exit(1)
		if 'SEGMENTATION_IID' in options['flags'] and options['dataExport']['mode'] == 'video':
			common.output('You cannot export segmentation instance ids as videos, please change dataExport.mode to image.', 'FATAL')
			sys.exit(1)
		
		# find, preload and initalize tiles
		tiles = []
		i = 0
		
		common.sendData([
			'"Config.instance" SET physicsEnabled true',
			'"Time" SET captureFramerate {}'.format(options['fps'])
		])
		
		# time stepping for synchronization regardless of FPS
		try:
			if options['dataExport']['mode'] == 'video':
				options['dataExport']['video']['fps'] = options['fps']
		except:
			pass
		
		for k, v in options['tiles'].items():
			tile = 'tile{}'.format(i)
			common.sendData('CREATE "{}" FROM "{}" as "{}"'.format(k, v['bundle'], tile))
			
			if 'init' in v:
				for c in v['init']:
					common.sendData(c.replace('{}', tile))
			
			tiles.append(tile)
			i += 1
		
		common.sendData([
			# tile regex setup
			'REGEX "tile*/Terrain" SET active false',
			'REGEX "tile*/Terrain_Mesh" SET active true',
			
			# --- TILE PEDESTRIAN SETUP BEGIN ---
			
			'REGEX "tile*/Humans/NavMesh" ADD RandomProps.Spawners.Area.Navigation RandomProps.Spawners.PropArea Humans.Spawners.RandomHumans Humans.Spawners.HumanWanderers',
			'REGEX "tile*/Humans/NavMesh" SET Humans.Spawners.RandomHumans settings.context "{}"'.format(options["pedestrians"]["context"]),
			
			# deprecated
			# '"tile0/Humans/NavMesh" PUSH Humans.Spawners.HumanWanderers pointsOfInterest REGEX "tile0/Humans/Walking points/.*"',
			# '"tile1/Humans/NavMesh" PUSH Humans.Spawners.HumanWanderers pointsOfInterest REGEX "tile1/Humans/Walking points/.*"',
			# '"tile2/Humans/NavMesh" PUSH Humans.Spawners.HumanWanderers pointsOfInterest REGEX "tile2/Humans/Walking points/.*"',
			# '"tile3/Humans/NavMesh" PUSH Humans.Spawners.HumanWanderers pointsOfInterest REGEX "tile3/Humans/Walking points/.*"',
			
			'REGEX "tile*/Humans/NavMesh" SET Humans.Spawners.HumanWanderers minSpeed {} maxSpeed {} stoppingDistance 2'.format(options["pedestrians"]["minSpeed"],options["pedestrians"]["maxSpeed"]),
			'REGEX "tile*/Humans/NavMesh" SET RandomProps.Spawners.Area.Navigation size (500 750) areaMask -1',
			'REGEX "tile*/Humans/NavMesh" SET RandomProps.Spawners.PropArea tags "human" numberOfProps {} collisionCheck false'.format(options["pedestrians"]["amountPerTile"]),
			
			# create mainCar
			'CREATE "Pickup" FROM "highway" AS "{}"'.format(options['mainCar']),
			'"{}" SET Rigidbody isKinematic true'.format(options['mainCar']),
			'"{}" SET transform position ({} {} {})'.format(options['mainCar'], options['carPosition'][0], options['carPosition'][1], options['carPosition'][2]),
			'"{}" SET VPVehicleController enabled false'.format(options['mainCar']),
			
			# disable headlights
			'"{}/Lights" SET active false'.format(options['mainCar'])
		])
		
		# automaticLights require EnviroSky
		addAutomaticLights = 'RGB' in options['flags']
		
		# shadow optimization for thermal-only setup
		if 'THERMAL' in options['flags'] and not 'RGB' in options['flags']:
			common.sendData('"QualitySettings" SET shadowDistance 0 shadowCascades 0 shadows 0 realtimeReflectionProbes true')
		if 'THERMAL' in options['flags'] and 'RGB' in options['flags']:
			common.sendData('"QualitySettings" SET shadowDistance 100 shadowCascades 2 shadows 0 realtimeReflectionProbes true')
		
		if 'SEGMENTATION' in options['flags']:
			common.sendData([
				'"Segmentation.Profile.instance" PUSH classes "Void" "Pedestrian" "Building" "Car" "Road" "Tree" "Prop" "Sign"',
				'CREATE Segmentation.LookUpTable AS "lookUpTable"',
				'"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Pedestrian->Yellow" "Building->Green" "Car->Red"  "Road->Blue" "Tree->Grey" "Prop->Cyan" "Sign->White"',
				
				'REGEX "tile*/Humans" ADD Segmentation.Class',
				'REGEX "tile*/Humans" SET Segmentation.Class className "Pedestrian"',
				'REGEX "tile*/Buildings" ADD Segmentation.Class',
				'REGEX "tile*/Buildings" SET Segmentation.Class className "Building"',
				'REGEX "tile*/Cars" ADD Segmentation.Class',
				'REGEX "tile*/Cars" SET Segmentation.Class className "Car"',
				'REGEX "tile*/Road system/Road0/MainMeshes" ADD Segmentation.Class',
				'REGEX "tile*/Road system/Road0/MainMeshes" SET Segmentation.Class className "Road"',
				'REGEX "tile*/Road system/Intersections" ADD Segmentation.Class',
				'REGEX "tile*/Road system/Intersections" SET Segmentation.Class className "Road"',
				'REGEX "tile*/Props" ADD Segmentation.Class',
				'REGEX "tile*/Props" SET Segmentation.Class className "Prop"',
				'REGEX "tile*/Powerlines" ADD Segmentation.Class',
				'REGEX "tile*/Powerlines" SET Segmentation.Class className "Prop"',
				'REGEX "tile*/Trees" ADD Segmentation.Class',
				'REGEX "tile*/Trees" SET Segmentation.Class className "Tree"',
				'REGEX "tile*/Signs" ADD Segmentation.Class',
				'REGEX "tile*/Signs" SET Segmentation.Class className "Sign"',
			])
		
		if 'THERMAL' in options['flags']:
			common.sendData([
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Trees"',
				'"ThermalBehaviour/Trees" SET temperature.value 3 temperature.bandwidth 3 temperature.median 0.95 ambientOffset.value -25 heatiness.value 0 reflectivity.value 0 variance.value 2.4',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Buildings"',
				'"ThermalBehaviour/Buildings" SET temperature.value 14 temperature.bandwidth 7 temperature.median 0.3 ambientOffset.value 4 heatiness.value 0 reflectivity.value 0 variance.value 1.5',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Humans"',
				'"ThermalBehaviour/Humans" SET temperature.value 10 temperature.bandwidth 1 temperature.median 0.5 ambientOffset.value 0 heatiness.value 50 reflectivity.value 0 variance.value 0',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Props"',
				'"ThermalBehaviour/Props" SET temperature.value -20 temperature.bandwidth 7 temperature.median 0.23 ambientOffset.value 4.8 heatiness.value 0 reflectivity.value 0 variance.value 0',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Roads"',
				'"ThermalBehaviour/Roads" SET temperature.value -20 temperature.bandwidth 14 temperature.median 0 ambientOffset.value 6.7 heatiness.value 0 reflectivity.value 0 variance.value 0',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/RoadsProps"',
				'"ThermalBehaviour/RoadsProps" SET temperature.value -20 temperature.bandwidth 5 temperature.median 0.25 ambientOffset.value 4.4 heatiness.value 0 reflectivity.value 0.0 variance.value 0',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Others"',
				'"ThermalBehaviour/Others" SET temperature.value -20 temperature.bandwidth 0 temperature.median 0 ambientOffset.value -25 heatiness.value 0 reflectivity.value 0 variance.value 0',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Terrain"',
				'"ThermalBehaviour/Terrain" SET temperature.value 10 temperature.bandwidth 1 temperature.median 0.574 ambientOffset.value 3.6 heatiness.value 0 reflectivity.value 0 variance.value 0'
			])
		
			common.sendData([
				'REGEX "tile*" ADD Thermal.ThermalProfileOverride',
				'REGEX "tile*" SET Thermal.ThermalProfileOverride ambientOffsetMode "Relative" ambientOffset -5 temperatureMode "Relative" temperature -4',
				'REGEX "tile*/Terrain_Mesh" ADD Thermal.ThermalObjectBehaviour',
				'REGEX "tile*/Terrain_Mesh" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Terrain"',
				'REGEX "tile*/Humans" ADD Thermal.ThermalObjectBehaviour',
				'REGEX "tile*/Humans" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Humans"',
				'REGEX "tile*/Buildings" ADD Thermal.ThermalObjectBehaviour',
				'REGEX "tile*/Buildings" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Buildings"',
				'REGEX "tile*/Props" ADD Thermal.ThermalObjectBehaviour',
				'REGEX "tile*/Props" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"',
				'REGEX "tile*/Trees" ADD Thermal.ThermalObjectBehaviour',
				'REGEX "tile*/Trees" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Trees"',
				'REGEX "tile*/Powerlines" ADD Thermal.ThermalObjectBehaviour',
				'REGEX "tile*/Powerlines" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"',
				'REGEX "tile*/Signs" ADD Thermal.ThermalObjectBehaviour',
				'REGEX "tile*/Signs" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"',
				'REGEX "tile*/Road system/Road*/MainMeshes" ADD Thermal.ThermalObjectBehaviour',
				'REGEX "tile*/Road system/Road*/MainMeshes" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Roads"',
				'REGEX "tile*/Road system/Intersections" ADD Thermal.ThermalObjectBehaviour',
				'REGEX "tile*/Road system/Intersections" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/RoadsProps"',
				'REGEX "tile*/Road system/Road*" ADD Thermal.ThermalObjectBehaviour',
				'REGEX "tile*/Road system/Road*" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/RoadsProps"',
			])
		
		helpers.setOSNetwork(
			target=options['roadNetworkLabel'],
			create=True
		)
		
		# setup car
		helpers.setOSVehicle(
			target=options['mainCar'],
			create=True,
			
			selfDriving=options['selfDriving'],
			maxSpeed=options['maxSpeed'],
			startSpeed=options['startSpeed'],
			
			setDriver=True,
			createDriver=True,
			
			smoothAdjust=options['smoothAdjust']
		)
		
		#car manual driving toggle
		common.sendData([
			'"{}" ADD ToggleBetweenAutoDriveAndUserControl'.format(options['mainCar']),
		])
		
		if options['carInput']:
			if options['carInput']['mode'] == "steeringWheel":
				common.sendData([
					'"{}" SET OSVehicle externControl TRUE'.format(options['mainCar']),
					'"{}" SET VPVehicleController enabled true'.format(options['mainCar']),
					'"{}" SET Rigidbody isKinematic false'.format(options['mainCar']),
					'"{}" ADD VPDeviceInput'.format(options['mainCar']),
					'"{}"SET VPDeviceInput deviceModel "{}" ignitionKeyPosition "Drive"'.format(options['mainCar'],options['carInput']['steeringWheelModel']),
				])
		
		# set spawners
		helpers.setVehicleSpawner(
			create=True,
			addAutomaticLights=addAutomaticLights,
			target=options['vehicleSpawner']['label'],
			
			position=options['spawnerPosition'],
			maxObjects=options['maxObjects'],
			
			spawnRadius=options['spawnRadius'],
			spawnSize=options['spawnSize'],
			spawnClearance=options['spawnClearance'],
			spawnFocus=options['spawnFocus'],
			despawnRadius=options['despawnRadius'],
			
			speedVariance=options['speedVariance'],
			brakeLightPower=options['brakeLightPower'],
			
			hidePosition=True,
			
			removeProbes=not options['vehicleSpawner']['reflectionProbes'],
			removeBoxColliders=not options['vehicleSpawner']['boxColliders'],
			removeRigidBodies=not options['vehicleSpawner']['rigidBodies'],
			network=True,
			
			assetBundle=options['vehicleSpawner']['assetBundle'],
			
			databaseFilter=options['vehicleSpawner']['databaseFilter'],
			loadCarsAsynchronously=False,
			
			segmentationClass=options['vehicleSpawner']['class'],
			maxSpeed=options['vehicleSpawner']['maxSpeed']
		)
		
		if 'THERMAL' in options['flags']:
			common.sendData([
				'"{}" ADD Thermal.ThermalProfileOverride'.format(options['vehicleSpawner']['label']),
				'"{}" SET Thermal.ThermalProfileOverride heatinessMode "Relative" heatiness -24'.format(options['vehicleSpawner']['label']),
			])
		
		# create tiler
		helpers.setTilerPool(
			create=True,
			addPool=True,
			createTiler=True,
			createContainer=True,
			createTilerOSP=True,
			addAutomaticLights=addAutomaticLights,
			
			position=options['tilerPosition'],
			pool=tiles,
			roadNetwork=options['roadNetworkLabel'],
			targetReference=options['mainCar']
		)
		
		# camera holder setup
		helpers.globalCameraSetup(
			labelRoot=options['labelRoot'],
			position=options['globalCameraPosition'],
			rotation=options['globalCameraRotation'],
			isLocal=True
		)
		
		if 'RGB' in options['flags']:
			common.output('Setting up RGB Cameras...', 'DEBUG')
			i = 0
			for idx in options['cam_mask']['RGB']:
				cam = copy.deepcopy(options['cams'][idx])
				cam_s = idx.split('/')[-1]
				mycams.append(idx)
				
				helpers.addCameraRGB(
					labelRoot=options['labelRoot'],
					label=idx,
					width=cam['cameraWidth'],
					height=cam['cameraHeight'],
					fov=cam['fov'],
					clippingNear=cam['clippingNear'],
					clippingFar=cam['clippingFar'],
					pp='EnviroFX',
					pp2=cam['profile'] if 'profile' in cam else 'ColdAces',
					position=cam['cameraPosition'],
					rotation=cam['cameraRotation'],
					audio=i == 0,
					enviroskyCloudTransitionSpeed=options['envirosky']['cloudTransitionSpeed'],
					enviroskyEffectTransitionSpeed=options['envirosky']['effectTransitionSpeed'],
					enviroskyFogTransitionSpeed=options['envirosky']['fogTransitionSpeed'],
					enviroskyProgressTime=options['envirosky']['progressTime'],
					enviroskyWeatherProfile=options['envirosky']['weatherProfile'],
					enviroskyGameTime=options['envirosky']['gameTime'],
					
					isLocal=True,
					renderCamera=True,
					renderCameraAlwaysOn=True,
					registerCamera=True,
					
					antialiasingMode=cam['antialiasingMode'] if 'antialiasingMode' in cam else 'None',
					antialiasingOptions=cam['antialiasingOptions'] if 'antialiasingOptions' in cam else None
				)
				
				i += 1
		
		if 'DEPTH' in options['flags']:
			common.output('Setting up DEPTH Cameras...', 'DEBUG')
			
			for idx in options['cam_mask']['DEPTH']:
				cam = copy.deepcopy(options['cams'][idx])
				cam_s = idx.split('/')[-1]
				mycams.append(idx)
				
				helpers.addCameraDepth(
					label=idx,
					width=cam['cameraWidth'],
					height=cam['cameraHeight'],
					fov=cam['fov'],
					clippingNear=cam['clippingNear'],
					clippingFar=cam['clippingFar'],
					position=cam['cameraPosition'],
					rotation=cam['cameraRotation'],
					isLocal=True,
					renderCamera=True,
					renderCameraAlwaysOn=True,
					registerCamera=True
				)
		
		if 'SEGMENTATION' in options['flags']:
			common.output('Setting up SEGMENTATION Cameras...', 'DEBUG')
			
			for idx in options['cam_mask']['SEGMENTATION']:
				cam = copy.deepcopy(options['cams'][idx])
				cam_s = idx.split('/')[-1]
				mycams.append(idx)
				
				helpers.validateResolution(cam['cameraWidth'], cam['cameraHeight'])
				
				common.sendData([
					'[Segmentation.Camera] CreateWithClassColors "{}" WITH lookUpTable "lookUpTable"'.format(idx),
					'"{}" ADD Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes'.format(idx),
					# '"{}" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Person" "Car" "Bicycle"'.format(idx),
					'"{}" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Person" "Car"'.format(idx),
					'[Cameras.RenderTexture] CreateNew "{}" {} {}'.format(cam_s, cam['cameraWidth'], cam['cameraHeight']),
					'"{}" SET Transform localPosition ({} {} {}) localEulerAngles ({} {} {})'.format(
						idx,
						cam['cameraPosition'][0], cam['cameraPosition'][1], cam['cameraPosition'][2],
						cam['cameraRotation'][0], cam['cameraRotation'][1], cam['cameraRotation'][2]
					),
					
					'"{}" SET Camera targetTexture "{}" far {}'.format(idx, cam_s, cam['clippingFar']),
					'"{}" SET active true'.format(idx),
					'[UI.Window] ShowFromRenderTexture "{}" AS "{}"'.format(cam_s, cam_s),
				])
		
		if 'SEGMENTATION_IID' in options['flags']:
			common.output('Setting up SEGMENTATION_IID Cameras...', 'DEBUG')
			
			for idx in options['cam_mask']['SEGMENTATION_IID']:
				cam = copy.deepcopy(options['cams'][idx])
				cam_s = idx.split('/')[-1]
				mycams.append(idx)
				
				helpers.validateResolution(cam['cameraWidth'], cam['cameraHeight'])
				common.sendData([
					'CREATE "{}"'.format(idx),
					'"{}" ADD Camera SegmentationCamera Segmentation.Output.InstanceIds'.format(idx),
					'"{}" SET active true'.format(idx),
					'[UI.Window] ShowFromCamera "{}" AS "{}" WITH {} {} 24 "ARGBFloat" "Default"'.format(idx, cam_s , cam['cameraWidth'], cam['cameraHeight'])
				])
		
		if 'THERMAL' in options['flags']:
			common.output('Setting up THERMAL Cameras...', 'DEBUG')
			
			for idx in options['cam_mask']['THERMAL']:
				cam = copy.deepcopy(options['cams'][idx])
				cam_s = idx.split('/')[-1]
				mycams.append(idx)
				
				helpers.addCameraThermal(
					label=idx,
					width=cam['cameraWidth'],
					height=cam['cameraHeight'],
					fov=cam['fov'],
					clippingNear=cam['clippingNear'],
					clippingFar=cam['clippingFar'],
					position=cam['cameraPosition'],
					rotation=cam['cameraRotation'],
					
					patchyness=False,
					isLocal=True,
					renderCamera=True,
					registerCamera=True
				)
				
				common.sendData([
					# '[Thermal.Camera] CreateCamera "{}"'.format(idx),
					# '"{}" SET Transform localPosition ({} {} {}) localEulerAngles ({} {} {})'.format(
					#	idx,
					#	cam['cameraPosition'][0], cam['cameraPosition'][1], cam['cameraPosition'][2],
					#	cam['cameraRotation'][0], cam['cameraRotation'][1], cam['cameraRotation'][2]
					# ),
					
					'"{}" ADD Thermal.ThermalNoise'.format(idx),
					'''"{}" SET Thermal.ThermalNoise
								spotsContrast {}
								linesMaskIntensity {}
								noiseIntensity {}
								noiseContrast {}
								noiseSize {}
								noiseBlur {}
								blendAmount {}
								filterMode {}
						'''.format(
						idx,
						cam['thermal']['noise']['spotsContrast'],
						cam['thermal']['noise']['linesMaskIntensity'],
						cam['thermal']['noise']['noiseIntensity'],
						cam['thermal']['noise']['noiseContrast'],
						cam['thermal']['noise']['noiseSize'],
						cam['thermal']['noise']['noiseBlur'],
						cam['thermal']['noise']['blendAmount'],
						cam['thermal']['noise']['filterMode']
					),
					'"{}" ADD UnityStandardAssets.ImageEffects.BloomOptimized'.format(idx),
					'"{}" SET Thermal.ThermalCamera temperatureRange ({} {})'.format(idx, cam['thermal']['temperatureRange'][0], cam['thermal']['temperatureRange'][1]),
					'"{}" SET Thermal.ThermalCamera ambientTemperature {}'.format(idx, cam['thermal']['ambientTemperature']),
					'"{}" SET Camera far {}'.format(idx, cam['clippingFar']),
					
					'''"{}" SET UnityStandardAssets.ImageEffects.BloomOptimized fastBloomShader "Hidden/FastBloom"
						threshold {}
						intensity {}
						blurSize {}
						blurIterations {}
					'''.format(
						idx,
						cam['thermal']['bloom']['threshold'],
						cam['thermal']['bloom']['intensity'],
						cam['thermal']['bloom']['blurSize'],
						cam['thermal']['bloom']['blurIterations'],
					),
					
					# 'CREATE RenderTexture {} {} 24 "ARGB32" "Default" AS "{}"'.format(cam['cameraWidth'], cam['cameraHeight'], cam_s),
					# '"{}" SET Camera targetTexture "{}"'.format(idx, cam_s),
					'"{}" SET active true'.format(idx),
					
					# Temporary HACK
					# '"{}" ADD Sensors.RenderCamera'.format(idx),
					# '"{}" SET Sensors.RenderCamera alwaysOn true'.format(idx),
					
					# '[UI.Window] ShowFromRenderTexture "{}" AS "{}"'.format(cam_s, cam_s),
					
					#'"EnviroSky" EXECUTE EnviroSky AssignAndStart "{}" "{}"'.format(cam, cam),
				])
				
				if "blur" in cam['thermal']:
					common.sendData([
						'"{}" ADD CameraFilterPack_Blur_Noise'.format(idx),
						'''"{}" SET CameraFilterPack_Blur_Noise
						Level {}
						Distance ({} {})
					'''.format(
						idx,
						cam['thermal']['blur']['level'],
						cam['thermal']['blur']['distance'][0],
						cam['thermal']['blur']['distance'][1]
						),
					])
				
				if "oilPaint" in cam['thermal']:
					common.sendData([
						'"{}" ADD CameraFilterPack_Pixelisation_DeepOilPaintHQ'.format(idx),
						'''"{}" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ
						_FixDistance {}
						_Distance {}
						_Size {}
						Intensity {}
					'''.format(
						idx,
						cam['thermal']['oilPaint']['fixDistance'],
						cam['thermal']['oilPaint']['distance'],
						cam['thermal']['oilPaint']['size'],
						cam['thermal']['oilPaint']['intensity'],
						)
					])
		try:
			if common.versionCompare(settings._simulator_version, '18.07.26.0000', '<') and not options['videoExport']:
				helpers.globalDiskSetup()
				helpers.addDiskOutput(mycams)
		except KeyError:
			pass
		
		helpers.setTrafficEvents(label=options['trafficEventsLabel'], network=options['roadNetworkLabel'], create=True)
		
		common.sendData([
			# enable components
			'"{}" SET active true'.format(options['vehicleSpawner']['label']),
			'"{}" SET active true'.format(options['labelRoot']),
			'"{}" SET active true'.format(options['mainCar']),
			
			# setup global reflection probes, if enabled
			'"{}/Reflection Probe" SET active true'.format(options['mainCar']) if options['globalReflectionProbe']['enabled'] == True else '',
			'"{}/Reflection Probe" SET ReflectionProbe boxProjection true farClipPlane {} size ({} {} {}) center ({} {} {}) resolution {} hdr true enabled true'.format(options['mainCar'], options['globalReflectionProbe']['farClipPlane'], options['globalReflectionProbe']['size'][0], options['globalReflectionProbe']['size'][1], options['globalReflectionProbe']['size'][2], options['globalReflectionProbe']['offset'][0], options['globalReflectionProbe']['offset'][1], options['globalReflectionProbe']['offset'][2], options['globalReflectionProbe']['resolution']) if options['globalReflectionProbe']['enabled'] == True else ''
		])

		# update hierarchy window
		common.sendData('"UI.WindowController.instance" EXECUTE RefreshBrowser')

		# disable envirosky fog (WIP: this will be moved to helpers)
		if 'RGB' in options['flags']:
			common.sendData([
				'"EnviroSky" SET EnviroSky fogSettings.distanceFog 0 fogSettings.heightFog 0',
				# '"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(options['weatherProfile'])
			])
		
		# enable thermal cameras after everything is setup
		if 'THERMAL' in options['flags']:
			for idx in options['cam_mask']['THERMAL']:
				common.sendData('"{}" SET Camera enabled true'.format(idx))
		
		try:
			# ros - must run after cameras are rendering
			if settings.disable_ros == False and options['ros']:
				helpers.setupROSTopics(
					writeLinks=options['ros']['writeLinks'],
					readLinks=options['ros']['readLinks']
				)
		except KeyError:
			common.output('No ROS configuration found', 'DEBUG')
		
		try:
			# deprecated as of 18.07.26
			if options['videoExport']:
				idx = [i for i, s in enumerate(mycams) if 'segment' in s.lower()]
				autoSegment = False if len(idx) == 0 else True
				
				common.waitQueue()
				
				_params = {
					"exportBBoxes": False # autoSegment
				}
				
				common.deep_merge_dicts(_params, options['videoExport'])
				
				helpers.addVideoExport(
					mycams,
					params=_params
				)
		except KeyError:
			pass
		
		try:
			# replacement for disk and videoExport
			if common.versionCompare(settings._simulator_version, '18.07.26.0000', '>') and options['dataExport']['enabled'] == True:
				_fields = options['dataExport']['fields'].copy()
				
				# copy `options['dataExport'][mode]` options to `options['dataExport']['fields'][]['options']`
				try:
					for p in _fields:
						try:
							if p['options']:
								continue
						except KeyError:
							p['options'] = options['dataExport'][options['dataExport']['mode']].copy()
				except KeyError:
					pass
				
				if options['dataExport']['mode'] == "image":
					_params = helpers.cameraExportParametrize(mycams, "image", options['dataExport'][options['dataExport']['mode']])
					
					if 'SEGMENTATION_IID' in options['flags']:
						for idx in options['cam_mask']['SEGMENTATION_IID']:
							_params[mycams.index(idx)]['options']['format'] = 'raw'
							_params[mycams.index(idx)]['exportBBoxes'] = 'false'
					
					helpers.addDataExport(
						imageLinks=_params,
						fieldLinks=_fields
					)
				else:
					helpers.addDataExport(
						videoLinks=helpers.cameraExportParametrize(mycams, "video", options['dataExport'][options['dataExport']['mode']]),
						fieldLinks=_fields
					)
		except KeyError:
			common.output('No dataExport configuration found', 'DEBUG')
	
	# misc
	try:
		if common.versionCompare(settings._simulator_version, '18.07.26.0000', '<') and not options['videoExport']:
			common.sendData([
				'"disk1" SET Sensors.Disk path "{}"'.format(settings.output_path),
				'"disk1" SET active true',
				# '"disk1" SET Sensors.Disk counter 1',
			])
	except KeyError:
		pass
	
	# common.sendData('"UI.WindowController.instance" EXECUTE UpdateHierarchy')
	
	# optimize thermal proble scheduler
	if 'RGB' in options['flags'] and 'THERMAL' in options['flags']:
		common.sendData('"Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler probesPerFrameLimit 1 drawThermalOnly false disableProbesRendering false')
	elif 'THERMAL' in options['flags']:
		common.sendData('"Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler probesPerFrameLimit 1 drawThermalOnly true disableProbesRendering false')
	
	# place and loop obstacles
	if 'obstacle' in options:
		options['obstacle']['target'] = options['mainCar']
		placeObstacle(options['obstacle'])
		
		if 'loopTimeout' in options['obstacle'] and options['obstacle']['loopTimeout'] > 0:
			common.output('Looping obstacle placement with timeout of {}s...'.format(options['obstacle']['loopTimeout']))
			loop = 0
			
			try:
				loop_limit = options['obstacle']['loopLimit']
			except KeyError:
				loop_limit = 100
			
			if settings.dry_run and loop_limit < 0:
				common.output('Dry run is set with unlimited loop_limit, capping to 100', 'WARN')
				loop_limit = 100
			
			while loop_limit < 0 or (loop_limit > 0 and loop < loop_limit):
				common.output('Sleeping for {}s...'.format(options['obstacle']['loopTimeout']), 'DEBUG')
				common.sendData('SLEEP {}'.format(options['obstacle']['loopTimeout']))
				placeObstacle(options['obstacle'], True)
				loop += 1
				common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / loop_limit),2)) if loop_limit > 0 else 'Loop {} (running with no limit)'.format(loop))
				
				# reset car to avoid getting stuck
				if 'selfDrivingReset' in options['obstacle'] and options['obstacle']['selfDrivingReset'] > 0 and loop % options['obstacle']['selfDrivingReset'] == 0:
					common.sendData([
						'"{}" SET OSVehicle selfDriving false'.format(options['mainCar']),
						'SLEEP 2',
						'"{}" SET OSVehicle selfDriving true'.format(options['mainCar'])
					])
