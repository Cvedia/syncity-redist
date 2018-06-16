import subprocess
import os
import pathlib
import time
from .. import common, helpers, settings_manager
from random import randint

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
	
	try:
		helpers.findLayout('endless_runner/{}'.format(os.path.basename(settings._options).split('.')[0]))
	except:
		common.output('No options set, aborting!', 'ERROR')
		return
	
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
		
		common.sendData([
			# preload tiles
			'CREATE "Tiles/Tile 1 Random" FROM "tiles" as "tile1"',
			
			# create mainCar
			'CREATE "Pickup" FROM "highway" AS "{}"'.format(options['mainCar']),
			'"{}" SET Rigidbody isKinematic true'.format(options['mainCar']),
			'"{}" SET transform position ({} {} {})'.format(options['mainCar'], options['carPosition'][0], options['carPosition'][1], options['carPosition'][2]),
			'"{}" SET VPVehicleController enabled false'.format(options['mainCar']),
			'"{}" ADD ToggleBetweenAutoDriveAndUserControl VPCustomInput'.format(options['mainCar']),
			'"{}" SET VPCustomInput enabled false'.format(options['mainCar']),
			
			# disable headlights
			'"{}/Lights" SET active false'.format(options['mainCar']),
			
			# set terrain temperature
			'"tile1/Terrain" SET Thermal.ThermalTerrain ambientOffset -18'
		])
		
		if 'SEGMENTATION' in options['flags']:
			common.sendData([
				'[Segmentation.Camera] UseProfile ASSET "Resources/Segmentation.Profile" FROM "tiles"',
				'"tile1/Road system" ADD Segmentation.Class',
				'"tile1/Road system" SET Segmentation.Class className "Road"'
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
		
		# set spawners
		helpers.setVehicleSpawner(
			create=True,
			addTiler=True,
			target=options['vehicleSpawnerLabel'],
			
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
			
			removeProbes=True,
			removeBoxColliders=True,
			removeRigidBodies=True,
			network=True,
			
			databaseFilter=options['databaseFilter'],
			loadCarsAsynchronously=True,
			
			segmentationClass=options['vehicleSpawnerClass']
		)
		
		# create tiler
		helpers.setTilerPool(
			create=True,
			addPool=True,
			createTiler=True,
			createContainer=True,
			createTilerOSP=True,
			
			position=options['tilerPosition'],
			pool=['tile1'],
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
					pp2='ColdACES',
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
					registerCamera=True
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
					'"{}" ADD Sensors.RenderCamera'.format(idx),
					'"{}" SET Sensors.RenderCamera alwaysOn true'.format(idx),
					
					'"{}" SET Camera targetTexture "{}" far {}'.format(idx, cam_s, cam['clippingFar']),
					'"{}" SET active true'.format(idx),
					'[UI.Window] ShowFromRenderTexture "{}" AS "{}"'.format(cam_s, cam_s),
				])
		
		if 'THERMAL' in options['flags']:
			common.sendData([
				'"Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler disableProbesRendering true',
				'"{}" SET OSNetworkSpawner removeProbes false'.format(options['vehicleSpawnerLabel'])
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
					'"{}" SET Camera far 400'.format(idx, cam['clippingFar']),
					
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
					
					'CREATE RenderTexture 640 512 24 "ARGB32" "Default" AS "{}"'.format(cam_s),
					'"{}" SET Camera targetTexture "{}"'.format(idx, cam_s),
					'"{}" SET active true'.format(idx),
					
					# Temporary HACK
					'"{}" ADD Sensors.RenderCamera'.format(idx),
					'"{}" SET Sensors.RenderCamera alwaysOn true'.format(idx),
					
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
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		# enable components
		common.sendData([
			'"{}" SET active true'.format(options['vehicleSpawnerLabel']),
			'"{}" SET active true'.format(options['labelRoot']),
			'"{}" SET active true'.format(options['mainCar']),
		])
		
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
	
	# misc
	common.sendData([
		'"disk1" SET Sensors.Disk path "{}"'.format(settings.output_path),
		'"disk1" SET active true',
		# '"disk1" SET Sensors.Disk counter 1',
		'"UI(Clone)/UICamera" SET Camera enabled false'
	])
	
	if settings.setup_only == True:
		return
	
	'''
	loop = options['loop']
	while loop < settings.loop_limit:
		common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit),2)))
		loop += 1
	'''
