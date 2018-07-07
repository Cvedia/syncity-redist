import os

from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Endless Runner
	This is a highly configurable scene allowing for tile cycling, stereo cameras,
	vehicle spawner, surrondings randomization, day / night cycle, weather,
	different predefined camera setups, etc.
'''

def args(parser):
	try:
		parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')
	except: pass

def run():
	if settings.dry_run:
		return
	
	if settings.isset('options') == None:
		common.output('No --options sent!', 'ERROR')
		return
	
	if settings.layout == None:
		common.findLayoutFromOptions(os.path.basename(__file__).split('.')[0], suffix='_stereo')
	
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
		
		# find, preload and initalize tiles
		tiles = []
		i = 0

		common.sendData('"Config.instance" SET physicsEnabled true')

		for k, v in options['tiles'].items():
			tile = 'tile{}'.format(i)
			common.sendData('CREATE "{}" FROM "{}" as "{}"'.format(k, v['bundle'], tile))
			
			if 'init' in v:
				for c in v['init']:
					common.sendData(c.replace('{}', tile))
			
			tiles.append(tile)
			i += 1
		
		common.sendData([
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
		
		if 'SEGMENTATION' in options['flags']:
			common.sendData([
				'"Segmentation.Profile.instance" PUSH classes "Void" "Pedestrian" "Building" "Car" "Road" "Tree" "Prop" "Sign"',
				'CREATE Segmentation.LookUpTable AS "lookUpTable"',
				'"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Pedestrian->Yellow" "Building->Green" "Car->Red"  "Road->Blue" "Tree->Grey" "Prop->Cyan" "Sign->White"',
			])
			
			for tile in tiles:
				common.sendData([
					'"{}/Humans" ADD Segmentation.Class'.format(tile),
					'"{}/Humans" SET Segmentation.Class className "Pedestrian"'.format(tile),
					'"{}/Buildings" ADD Segmentation.Class'.format(tile),
					'"{}/Buildings" SET Segmentation.Class className "Building"'.format(tile),
					'"{}/Cars" ADD Segmentation.Class'.format(tile),
					'"{}/Cars" SET Segmentation.Class className "Car"'.format(tile),
					'"{}/Road system/Road0/MainMeshes" ADD Segmentation.Class'.format(tile),
					'"{}/Road system/Road0/MainMeshes" SET Segmentation.Class className "Road"'.format(tile),
					'"{}/Props" ADD Segmentation.Class'.format(tile),
					'"{}/Props" SET Segmentation.Class className "Prop"'.format(tile),
					'"{}/Powerlines" ADD Segmentation.Class'.format(tile),
					'"{}/Powerlines" SET Segmentation.Class className "Prop"'.format(tile),
					'"{}/Trees" ADD Segmentation.Class'.format(tile),
					'"{}/Trees" SET Segmentation.Class className "Tree"'.format(tile),
					'"{}/Signs" ADD Segmentation.Class'.format(tile),
					'"{}/Signs" SET Segmentation.Class className "Sign"'.format(tile),
				])
		
		if 'THERMAL' in options['flags']:
			common.sendData([
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Trees"',
				'"ThermalBehaviour/Trees" SET temperature.value -9 temperature.bandwidth 3.67 temperature.median 0 ambientOffset.value -25 heatiness.value 0 reflectivity.value 0.5 variance.value 0',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Buildings"',
				'"ThermalBehaviour/Buildings" SET temperature.value 14 temperature.bandwidth 20 temperature.median 0 ambientOffset.value -15.7 heatiness.value 0 reflectivity.value 0.5 variance.value 0',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Humans"',
				'"ThermalBehaviour/Humans" SET temperature.value 10 temperature.bandwidth 1 temperature.median 0.5 ambientOffset.value 0 heatiness.value 50 reflectivity.value 0.5 variance.value 0',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Props"',
				'"ThermalBehaviour/Props" SET temperature.value -20 temperature.bandwidth 2.27 temperature.median 0.214 ambientOffset.value -17.8 heatiness.value 0 reflectivity.value 0.5 variance.value 0',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Roads"',
				'"ThermalBehaviour/Roads" SET temperature.value -20 temperature.bandwidth 7.07 temperature.median 0 ambientOffset.value -16.4 heatiness.value 0 reflectivity.value 0 variance.value 0',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Others"',
				'"ThermalBehaviour/Others" SET temperature.value -20 temperature.bandwidth 0 temperature.median 0 ambientOffset.value -25 heatiness.value 0 reflectivity.value 0 variance.value 0',
				'CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Cars"',
				'"ThermalBehaviour/Cars" SET temperature.value -20 temperature.bandwidth 8.09 temperature.median 0.5 ambientOffset.value 11 heatiness.value 69 reflectivity.value 0.111 variance.value 16.6'
			])

			for tile in tiles:
				common.sendData([
					'"{}/Terrain" ADD Thermal.ThermalTerrain'.format(tile),
					'"{}/Terrain" SET Thermal.ThermalTerrain ambientOffset -18'.format(tile),
					'"{}/Humans" ADD Thermal.ThermalObjectBehaviour'.format(tile),
					'"{}/Humans" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Humans"'.format(tile),
					'"{}/Buildings" ADD Thermal.ThermalObjectBehaviour'.format(tile),
					'"{}/Buildings" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Buildings"'.format(tile),
					'"{}/Props" ADD Thermal.ThermalObjectBehaviour'.format(tile),
					'"{}/Props" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"'.format(tile),
					'"{}/Trees" ADD Thermal.ThermalObjectBehaviour'.format(tile),
					'"{}/Trees" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Trees"'.format(tile),
					'"{}/Powerlines" ADD Thermal.ThermalObjectBehaviour'.format(tile),
					'"{}/Powerlines" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"'.format(tile),
					'"{}/Signs" ADD Thermal.ThermalObjectBehaviour'.format(tile),
					'"{}/Signs" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"'.format(tile),
					'"{}/Road system/Road0/MainMeshes" ADD Thermal.ThermalObjectBehaviour'.format(tile),
					'"{}/Road system/Road0/MainMeshes" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Roads"'.format(tile),
					'"{}/Road system/Road0" ADD Thermal.ThermalObjectBehaviour'.format(tile),
					'"{}/Road system/Road0" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"'.format(tile),
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
			'"{}" ADD ToggleBetweenAutoDriveAndUserControl VPCustomInput'.format(options['mainCar']),
			'"{}" SET VPCustomInput enabled false'.format(options['mainCar']),
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
			loadCarsAsynchronously=True,
			
			segmentationClass=options['vehicleSpawner']['class']
		)

		if 'THERMAL' in options['flags']:
			common.sendData([
				'"{}" ADD Thermal.ThermalObjectBehaviour'.format(options['vehicleSpawner']['label']),
				'"{}" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Cars"'.format(options['vehicleSpawner']['label']),
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
			i = 0
			for idx in options['cam_mask']['RGB']:
				cam = options['cams'][idx]
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
			for idx in options['cam_mask']['DEPTH']:
				cam = options['cams'][idx]
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
			for idx in options['cam_mask']['SEGMENTATION']:
				cam = options['cams'][idx]
				cam_s = idx.split('/')[-1]
				mycams.append(idx)
				
				common.sendData([
					'[Segmentation.Camera] CreateWithClassColors "{}" WITH lookUpTable ASSET "Tiles/Segmentation/Segmentation.LookUpTable" FROM "tiles"'.format(idx),
					'[Cameras.RenderTexture] CreateNew "{}" {} {}'.format(cam_s, cam['cameraWidth'], cam['cameraHeight']),
					'"{}" SET Transform localPosition ({} {} {}) localEulerAngles ({} {} {})'.format(
						idx,
						cam['cameraPosition'][0], cam['cameraPosition'][1], cam['cameraPosition'][2],
						cam['cameraRotation'][0], cam['cameraRotation'][1], cam['cameraRotation'][2]
					),
					
					# Temporary HACK
					# '"{}" ADD Sensors.RenderCamera'.format(idx),
					# '"{}" SET Sensors.RenderCamera alwaysOn true'.format(idx),
					
					'"{}" SET Camera targetTexture "{}" far {}'.format(idx, cam_s, cam['clippingFar']),
					'"{}" SET active true'.format(idx),
					'[UI.Window] ShowFromRenderTexture "{}" AS "{}"'.format(cam_s, cam_s),
				])
		
		if 'THERMAL' in options['flags']:

			common.sendData([
				'"Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler disableProbesRendering true',
				'"{}" SET OSNetworkSpawner removeProbes {}'.format(options['vehicleSpawner']['label'], 'false' if options['vehicleSpawner']['reflectionProbes'] == True else 'true')
			])
			
			for idx in options['cam_mask']['THERMAL']:
				cam = options['cams'][idx]
				cam_s = idx.split('/')[-1]
				mycams.append(idx)
				
				common.sendData([
					'[Thermal.Camera] CreateCamera "{}"'.format(idx),
					'"{}" SET Transform localPosition ({} {} {}) localEulerAngles ({} {} {})'.format(
						idx,
						cam['cameraPosition'][0], cam['cameraPosition'][1], cam['cameraPosition'][2],
						cam['cameraRotation'][0], cam['cameraRotation'][1], cam['cameraRotation'][2]
					),
					'"{}" ADD UnityStandardAssets.ImageEffects.BloomOptimized'.format(idx),
					'"{}" SET Thermal.ThermalCamera temperatureRange ({} {})'.format(idx, cam['thermal']['temperatureRange'][0], cam['thermal']['temperatureRange'][1]),
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
					
					'CREATE RenderTexture {} {} 24 "ARGB32" "Default" AS "{}"'.format(cam['cameraWidth'], cam['cameraHeight'], cam_s),
					'"{}" SET Camera targetTexture "{}"'.format(idx, cam_s),
					'"{}" SET active true'.format(idx),
					
					# Temporary HACK
					# '"{}" ADD Sensors.RenderCamera'.format(idx),
					# '"{}" SET Sensors.RenderCamera alwaysOn true'.format(idx),
					
					'[UI.Window] ShowFromRenderTexture "{}" AS "{}"'.format(cam_s, cam_s),
					
					# '"EnviroSky" EXECUTE EnviroSky AssignAndStart "{}" "{}"'.format(cam, cam),
					
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
					)
				])
		
		if not options['videoExport']:
			helpers.globalDiskSetup()
			helpers.addDiskOutput(mycams)
		
		helpers.setTrafficEvents(label=options['trafficEventsLabel'], network=options['roadNetworkLabel'], create=True)
		
		common.sendData([
			# enable components
			'"{}" SET active true'.format(options['vehicleSpawner']['label']),
			'"{}" SET active true'.format(options['labelRoot']),
			'"{}" SET active true'.format(options['mainCar']),
		])

		# update hierarchy window
		common.sendData('"UI.WindowController.instance" EXECUTE RefreshBrowser')

		# disable envirosky fog (WIP: this will be moved to helpers)
		if 'RGB' in options['flags']:
			common.sendData([
				'"EnviroSky" SET EnviroSky fogSettings.distanceFog 0 fogSettings.heightFog 0',
				# '"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(options['weatherProfile'])
			])
		
		# ros - must run after cameras are rendering
		if settings.disable_ros == False and options['ros']:
			helpers.setupROSTopics(
				writeLinks=options['ros']['writeLinks'],
				readLinks=options['ros']['readLinks']
			)
		
		if options['videoExport']:
			idx = [i for i, s in enumerate(mycams) if 'segment' in s.lower()]
			autoSegment = False if len(idx) == 0 else True
			
			common.waitQueue()
			
			helpers.addVideoExport(
				mycams,
				params={
					"streamLength": options['videoExport']['streamLength'],
					"streamProfile": options['videoExport']['streamProfile'],
					"exportBBoxes": False # autoSegment
				}
			)
	
	# misc
	if not options['videoExport']:
		common.sendData([
			'"disk1" SET Sensors.Disk path "{}"'.format(settings.output_path),
			'"disk1" SET active true',
			# '"disk1" SET Sensors.Disk counter 1',
		])
	
	if settings.setup_only == True:
		return
	
	'''
	loop = options['loop']
	while loop < settings.loop_limit:
		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
		loop += 1
	'''
