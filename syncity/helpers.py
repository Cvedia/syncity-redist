"""
A collection of helper functions tailored in a generic fashion for asset, scenario, camera setup

This functions are accessible from scripts / tools via `helpers.<function>`
"""
import sys
import time
import random
import json

from . import common, settings_manager, unity_vars

# some hardcoded values, this depends on the asset packages you've been given,
# this should be used only for the examples
ground_lst = [ 'Intersection', 'Grass', 'Asphalt', 'RoadSection2', 'DirtBrown', 'ForestFloor', 'Concrete', 'RoadSection3', 'RoadSection' ]
cars_lst = [ 'auditts','audi_a2','audi_q7','audi_s3','bentley_arnage','bmw','bmw6_series_650i','bmw_760li','bmw_m3','bmw_m5','bmw_m_limousine','cadillac_escalade_ext','caterpillar_bulldozer_d9','chevrolet_cruze_2011','chevrolet_s10','chevrolet_tornado','fiat500_new','fiat_131','fiat_500','ford_crown_victoria_taxi','ford_fiesta','ford_fire_department','ford_focus','ford_mustang_gt_eleanor','ford_shelby_cobra','ford_transit_jumbo','freightliner_aerodyne','honda_civic_sedan','hummer_h2','international_ambulance_fdny','international_school_bus','kenworth_t600','lamborghini_gallardo','lancia_delta','mack_dumper','mercedes_class_g_500','mercedes_slk','mercedes_vario_brinks','mini_coopers','nissan_elgrand','nissan_murano','peugeot_406','rangerover','renault_420','renault_g210','renault_megane','renault_trm_2000','scania_400_concretemixer','scania_450_dumpster_hauler','truck_v010_008','volvo_th5','vw_caravelle','vw_golf_v','vw_touareg','vw_touran_2007','vw_transporter' ]
weather_lst = [ 'Clear Sky', 'Cloudy 1', 'Cloudy 2', 'Cloudy 3', 'Foggy', 'Heavy Rain', 'Light Rain', 'Storm' ]
clouds_lst = [ 'None', 'Both', 'Volume', 'Flat' ]
drones_lst = [
	'Drones/splinter/splinter',
	'Drones/DJI_Inspire-2/DJI_Inspire_2',
	'Drones/DJI_Mavic_Pro/DJI_Mavic_Pro',
	'Drones/red/red',
	'Drones/DJI Spreading Wings S1000 Professional Octocopter/Spreading_Wings_S1000',
	'Drones/white/white',
	'Drones/DJI_Phantom_4_Pro/DJI_Phantom_4_Pron',
	'Drones/Parrot Disco Drone/Parrot_Disco',
	'Drones/DJI_Phantom_3_Pro/DJI_Phantom_3_Pro',
	'Drones/DJI_Phantom_4_Pro_obsidian/DJI_Phantom_4_Pro_obsidian'
]

# lite asset package
drones_lite_lst = [ 'Drones/buzz/buzz', 'Drones/splinter/splinter', 'Drones/red/red', 'Drones/white/white' ]

settings = settings_manager.Singleton()

def globalCameraSetup(
	labelRoot='cameras', canvasWidth=1024, canvasHeight=768, canvas=None,
	orbit=False, orbitOffset=None, orbitGround=None, orbitSnap=None, position=None,
	rotation=None, flycam=False
):
	"""
	Sets up camera root object
	
	# Arguments
	
	labelRoot (string): Root game object name/path, defaults to `cameras`
	canvas (bool): Canvas switch, defaults to `False`
	canvasWidth (int): Display canvas width, defaults to `1024`
	canvasHeight (int): Display canvas height, defaults to `768`
	orbit (bool): Adds orbiting component, defaults to `True`
	orbitOffset (list): Defines offset x,y,z coordinates from orbiting object target, defaults to `None`
	orbitGround (string): Defines a object to orbit ground position from, defaults to `None`
	orbitSnap (int): Defines a Y snap position from orbited object, defaults to `None`
	position (list): Defines a position, if not set defaults to X,Y,Z compensation values
	rotation (list): Defines a rotation, defaults to `None`
	flycam (bool): Adds a fly cam component that will move any nested cameras among with it
	"""
	if canvas == None:
		if settings.disable_canvas:
			canvas = False
		else:
			canvas = True
	
	if canvas == True:
		canvas = 'true'
	else:
		common.output('Warning: Canvas has been disabled, you will not see output on simulator')
		canvas = 'false'
	
	s = []
	if position == None:
		s.append('position ({} {} {})'.format(settings.X_COMP -6, settings.Y_COMP, settings.Z_COMP -50))
	else:
		s.append('position ({} {} {})'.format(position[0], position[1], position[2]))
	if rotation == None:
		s.append('eulerAngles ({} {} {})'.format(0, 0, 0))
	else:
		s.append('eulerAngles ({} {} {})'.format(rotation[0], rotation[1], rotation[2]))
	
	buf = [
		'CREATE "{}"'.format(labelRoot),
		'"{}" SET active false'.format(labelRoot),
		'"{}" SET Transform {}'.format(labelRoot, ' '.join(s))
	]
	
	if orbit == True:
		buf.append('"{}" ADD Orbit'.format(labelRoot))
	
	s = []
	if orbitGround != None:
		s.append('target "{}"'.format(orbitGround))
	if orbitOffset != None:
		s.append('targetOffset ({} {} {})'.format(orbitOffset[0], orbitOffset[1], orbitOffset[2]))
	if orbitSnap != None:
		s.append('snapOffset (0 {} 0)'.format(orbitSnap))
	if len(s) > 0:
		buf.append('"{}" SET Orbit {}'.format(labelRoot, ' '.join(s)))
	
	buf.extend([
		# resize camera display on app, this is relative to the size of the window
		'"Canvas/Cameras/Viewport/Content" SET UI.GridLayoutGroup cellSize ({} {})'.format(canvasWidth, canvasHeight),
		'"Canvas" SET active {}'.format(canvas)
	])
	
	if flycam:
		buf.extend([
			'"{}" ADD FlyCamera'.format(labelRoot),
			'"{}" SET FlyCamera enabled true'.format(labelRoot)
		])
	
	common.sendData(buf, read=False)
	settings._obj.append(labelRoot)

def addCameraDepth(
	width=2048, height=1536,
	label='cameras/depth',
	fov=60,
	clippingNear=0.3,
	clippingFar=1000,
	depthBuffer='simple',
	transparencyCutout=0
):
	"""
	Creates a depth camera
	
	# Arguments
	
	width (int): Resolution width, defaults to `2048`
	height (int): Resolution height, defaults to `1536`
	label (string|list): Game object path, defaults to `cameras/depth` - This should follow `labelRoot` from `globalCameraSetup`
	fov (int): Field of view, defaults to `60`
	clippingNear (float): Near clipping distance, defaults to `0.3` - Objects closer than this distance won't appear
	clippingFar (float): Far clipping distance, defaults to `1000` - Objects further from this distance won't appear
	depthBuffer (string): Defines a specific depth buffer configuration to use, if not set fallsback to default, default `None`
	transparencyCutout (float): Defines a cutout percentage for transparent objects, defaults to `0` that will show transparent objects at full extent, when set to 1 will hide them completly.
	
	"""
	
	if not isinstance(label, list):
		label = [ label ]
	
	buf = []
	
	for l in label:
		buf.extend([
			'CREATE "{}"'.format(l),
			'"{}" SET active false'.format(l),
			'"{}" ADD Camera Sensors.RenderCamera'.format(l),
			'"{}" SET Camera near {} far {} fieldOfView {} renderingPath "DeferredShading"'.format(l, clippingNear, clippingFar, fov),
			'"{}" SET Sensors.RenderCamera format "RFloat" resolution ({} {})'.format(l, width, height)
		])
		
		if depthBuffer == None:
			buf.append('"{}" ADD Sensors.Lidar_Internal.RenderDepthBufferOld'.format(l) if settings.use_old_depth_buffer else '"{}" ADD CameraDepthOutput'.format(l))
		elif depthBuffer == 'simple':
			buf.extend([
				'"{}" ADD Cameras.RenderDepthBufferSimple'.format(l),
				'"{}" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout {}'.format(l, transparencyCutout)
				#'"{}" Cameras.RenderDepthBufferSimple drawTransparentObjectsDepth false'.format(l)
			])
		else:
			raise 'Unknown depthBuffer: {}'.format(depthBuffer)
		
		buf.append('"{}" SET active true'.format(l))
	
	common.sendData(buf, read=False)
	common.flushBuffer()
	settings._obj.extend(label)

def addCameraRGB(
	width=2048, height=1536, audio=True, envirosky=None, flycam=False,
	labelRoot='cameras', label='cameras/cameraRGB', pp=None,
	renderingPath=4, textureFormat=4,
	
	fov=60,
	clippingNear=0.3,
	clippingFar=1000,
	
	enviroskyCloudTransitionSpeed=100, enviroskyEffectTransitionSpeed=100,
	enviroskyFogTransitionSpeed=100, enviroskyProgressTime='None',
	renderCamera=True
):
	"""
	Creates a RGB camera with optional postprocessing options
	
	# Arguments
	
	width (int): Resolution width, defaults to `2048`
	height (int): Resolution height, defaults to `1536`
	audio (bool): Audio listener, defaults to `True` - You must have at one audio listener on the scene
	envirosky (bool): Enables envirosky stack, defaults to `None`
	flycam (bool): Enables wasd interactive controllable fly cam, defaults to `False`
	labelRoot (string): Root game object name/path, defaults to `cameras`
	label (string|list): Game object path, defaults to `cameras/cameraRGB` - This should follow `labelRoot` from `globalCameraSetup`
	pp (string): Defines a postprocessing stack, defaults to `None`
	renderingPath (int): Defines rendering path, defaults to `4` - This is defined on unity_vars lookup table
	textureFormat (int): Defines texture format, defaults to `4` - This is defined on unity_vars lookup table
	fov (int): Field of view, defaults to `60`
	clippingNear (float): Near clipping distance, defaults to `0.3` - Objects closer than this distance won't appear
	clippingFar (float): Far clipping distance, defaults to `1000` - Objects further from this distance won't appear
	enviroskyCloudTransitionSpeed (int): Defines cloud transition speed, defaults to `100` which is instant
	enviroskyEffectTransitionSpeed (int): Defines weather transition speed, defaults to `100` which is instant
	enviroskyFogTransitionSpeed (int): Defines fog deposition speed, defaults to `100` which is instant
	enviroskyProgressTime (string): Defines time progression, defaults to `None` avoiding time to change
	renderCamera (bool): Binds a renderCamera component allowing for disk exports, defaults to `True`
	
	"""
	if envirosky == None:
		if settings.disable_envirosky:
			envirosky = False
		else:
			envirosky = True
	
	if not isinstance(label, list):
		label = [ label ]
	
	buf = []
	idx = 0
	for l in label:
		addStack = [ 'Camera' ]
		b = []
		
		if renderCamera:
			addStack.append('Sensors.RenderCamera')
			b.extend([
				# '"{}" SET Sensors.RenderCamera sRGB true'.format(l),
				'"{}" SET Sensors.RenderCamera format "{}" resolution ({} {})'.format(l, unity_vars.textureFormat[textureFormat], width, height),
				# 'cameras/cameraRGB SET Camera targetTexture.antiAliasing 8',
				# 'cameras/cameraRGB SET active true',
			])
		
		if idx == 0:
			if audio:
				addStack.append('AudioListener')
			
			if flycam:
				addStack.append('FlyCamera')
				b.append('"{}" SET FlyCamera enabled true'.format(l))
			
			if envirosky:
				b.extend([
					# NOTE: This is a prefab that already contains the EnviroSky default profile
					# NOTE: You can only have one camera bound to envirosky, if you set multiple this script will bind to the first only
					'CREATE "EnviroSky" AS "EnviroSky"',
					'''"EnviroSky" SET EnviroSky
						Player "{}"
						PlayerCamera "{}"
						GameTime.ProgressTime "{}"
						weatherSettings.cloudTransitionSpeed {}
						weatherSettings.effectTransitionSpeed {}
						weatherSettings.fogTransitionSpeed {}
					'''.format(
						labelRoot, l, enviroskyProgressTime, enviroskyCloudTransitionSpeed,
						enviroskyEffectTransitionSpeed, enviroskyFogTransitionSpeed
					),
					'"EnviroSky" EXECUTE EnviroSky AssignAndStart "{}" "{}"'.format(l, l),
					'"EnviroSky" SET active true'
				])
				envirosky = False
		
		idx += 1
		
		buf.extend([
			'CREATE "{}"'.format(l),
			'"{}" SET active false'.format(l),
			'"{}" ADD {}'.format(l, ' '.join(addStack)),
			'"{}" SET Camera near {} far {} fieldOfView {} renderingPath "{}"'.format(l, clippingNear, clippingFar, fov, unity_vars.renderingPath[renderingPath])
		])
		buf.extend(b)
		buf.append('"{}" SET active true'.format(l))
	buf.append('"{}" SET active true'.format(labelRoot))
	
	common.sendData(buf, read=False)
	common.flushBuffer()
	
	if pp != None:
		addCameraRGBPP(profile=pp, label=label)
	
	settings._obj.append(label)

def addCameraThermal(
	width=2048, height=1536, audio=False,
	label='cameras/thermal',
	renderingPath=4, textureFormat=4,
	
	fov=60,
	clippingNear=0.3,
	clippingFar=1000,
	
	ambientTemperature=16, minimumTemperature=10,
	maximumTemperature=30, maxDistanceForProbeUpdate=100,
	useAGC='true',
	
	patchyness=True,
	patchyness_fixDistance=10.6, patchyness_distance=0.06,
	patchyness_size=0.481, patchyness_intensity=0.60,
	
	trees=False,
	treesBase=10, treesBandwidth=3, treesMedian=0.5,
	treesLeafsVariance=4,
	
	blur=True,
	blurNoise=[2, 1],
	
	renderCamera=True
):
	"""
	Creates a Thermal camera with special postprocessing features
	
	# Arguments
	
	width (int): Resolution width, defaults to `2048`
	height (int): Resolution height, defaults to `1536`
	audio (bool): Audio listener, defaults to `False` - You must have at one audio listener on the scene
	label (string|list): Game object path, defaults to `cameras/cameraRGB` - This should follow `labelRoot` from `globalCameraSetup`
	renderingPath (int): Defines rendering path, defaults to `4` - This is defined on unity_vars lookup table
	textureFormat (int): Defines texture format, defaults to `4` - This is defined on unity_vars lookup table
	fov (int): Field of view, defaults to `60`
	clippingNear (float): Near clipping distance, defaults to `0.3` - Objects closer than this distance won't appear
	clippingFar (float): Far clipping distance, defaults to `1000` - Objects further from this distance won't appear
	
	ambientTemperature (float): Defines a global ambient temperature, defaults to `16`
	minimumTemperature (float): Minimum AGC temperature, defaults to `10`
	maximumTemperature (float): Maximum AGC temperature, defaults to `30`
	maxDistanceForProbeUpdate (float): Defines a maximum render distance for reflection probes on shiny surfaces, defaults to `100`
	useAGC (bool): Enables / disables AGC, defaults to `True`
	
	patchyness (bool): Enables / disables patchyness feature, defaults to `True`
	patchyness_fixDistance (float): Defines focal fixed distance for patchyness rendering, defaults to `10.6`
	patchyness_distance (float): Defines distance between patches, defaults to `0.06`
	patchyness_size (float): Defines size of patch brush, defaults to `0.481`
	patchyness_intensity (float): Defines how much detail is preserved from the original when patch is applied in reverse, defaults to `0.6`
	
	trees (bool): Enables / disable trees / bushes heat signature, defaults to `False`
	treesBase (float): Tree base temperature, defaults to `10`
	treesBandwidth (float): Heat pattern bandwidth, defaults to `3`
	treesMedian (float): Heat pattern median, defaults to `0.5`
	treesLeafsVariance (int): Define how much diffuse heat will be applied to tree leafs, defaults to `4`
	
	blur (bool): Enables / disable blur effect, defaults to `True`
	blurNoise (list of min / max): Defines noise blur distance, defaults to `[2, 1]`
	
	renderCamera (bool): Binds a renderCamera component allowing for disk exports, defaults to `True`
	
	# Notes
	
	- patchyness effects mimic thermal cameras averaging feature from mid / long distance focal points
	- blur effects mimics noise around object edges, more visible when close by
	
	"""
	if not isinstance(label, list):
		label = [ label ]
	
	buf = []
	
	for l in label:
		addStack = [ 'Camera', 'Thermal.ThermalCamera', 'UnityEngine.PostProcessing.PostProcessingBehaviour' ]
		b = []
		
		if renderCamera:
			addStack.append('Sensors.RenderCamera')
			b.extend([
				'"{}" SET Sensors.RenderCamera format "{}" resolution ({} {})'.format(l, unity_vars.textureFormat[textureFormat], width, height),
				'"{}" SET Camera renderingPath "{}"'.format(l, unity_vars.renderingPath[renderingPath])
			])
		
		if audio:
			addStack.append('AudioListener')
		
		b.append('"{}" SET Thermal.ThermalCamera enabled false'.format(l))
		
		if patchyness:
			addStack.append('CameraFilterPack_Pixelisation_DeepOilPaintHQ')
			b.extend([
				'"{}" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ enabled false'.format(l),
				'"{}" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ _FixDistance {} _Distance {} _Size {} Intensity {} enabled true'.format(l, patchyness_fixDistance, patchyness_distance, patchyness_size, patchyness_intensity)
			])
		
		if blur:
			addStack.append('CameraFilterPack_Blur_Noise')
			b.append('"{}" SET CameraFilterPack_Blur_Noise Distance ({} {}) enabled true'.format(l, blurNoise[0], blurNoise[1]))
		
		if trees:
			addStack.append('Thermal.GlobalTreeSettings')
			b.append('''"{}" SET Thermal.GlobalTreeSettings
				temperature {}
				temperatureBandwidth {}
				temperatureMedian {}
				treeLeafsHeatVariance {}
				enabled true
			'''.format(l, treesBase, treesBandwidth, treesMedian, treesLeafsVariance))
		
		buf.extend([
			'CREATE "{}"'.format(l),
			'"{}" SET active false'.format(l),
			'"{}" ADD {}'.format(l, ' '.join(addStack)),
			'"{}" SET Camera near {} far {} fieldOfView {}'.format(l, clippingNear, clippingFar, fov),
		])
		
		buf.extend(b)
		
		buf.extend([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "Thermal"'.format(l),
			'''"{}" SET Thermal.ThermalCamera
				ambientTemperature {}
				temperatureRange ({} {})
				maxDistanceForProbeUpdate {}
				useAGC {}
				enabled true
			'''.format(l, ambientTemperature, minimumTemperature, maximumTemperature, maxDistanceForProbeUpdate, useAGC),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled false'.format(l),
			'"{}" SET active true'.format(l)
		])
	
	common.sendData(buf, read=False)
	common.flushBuffer()
	settings._obj.extend(label)

def cameraPPThermal(label='cameras/cameraRGB'):
	"""
	This is a dummy function that demonstrates all possible configurable values on a camera profile, in this case we're showing off all parameters tuned to a thermal profile
	"""
	if not isinstance(label, list):
		label = [ label ]
	
	buf = []
	
	for l in label:
		buf.append([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.enabled false'.format(l),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.enabled false'.format(l),
			
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled true'.format(l),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.intensity {}'.format(l, 2),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.threshold {}'.format(l, 1.1),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.softKnee {}'.format(l, .6),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.radius {}'.format(l, 4.36),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.antiFlicker {}'.format(l, 'true'),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.lensDirt.intensity {}'.format(l, 3),
			
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.enabled false'.format(l),
			
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.enabled false'.format(l),
			
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.enabled false'.format(l),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.dithering.enabled false'.format(l),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled false'.format(l),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.fog.enabled false'.format(l),
			
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled true'.format(l),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.colored 1'.format(l),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.intensity 0.68'.format(l),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.luminanceContribution 1'.format(l),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.size 0.3'.format(l),
			
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false'.format(l),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.enabled false'.format(l),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.enabled false'.format(l),
		])
	
	common.sendData(buf)

# WARNING: It's not recommended to use Scion with Envirosky
def addCameraRGBPP(profile='Profile2', scion=False, label='cameras/cameraRGB'):
	if not isinstance(label, list):
		label = [ label ]
	buf = []
	
	for l in label:
		buf.extend([
			# 'cameras/cameraRGB SET active false',
			'"{}" ADD UnityEngine.PostProcessing.PostProcessingBehaviour'.format(l),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "{}"'.format(l, profile)
		])
		
		if scion:
			if not settings.disable_envirosky:
				common.output('WARNING: Using scion with envirosky is not recommended')
			buf.extend([
				'"{}" ADD ScionEngine.ScionPostProcess'.format(l),
				'"{}" SET ScionEngine.ScionPostProcess bloom true bloomIntensity 0.3 grain false vignette false chromaticAberration false lensFlare false lensDirt false depthOfField false'.format(l),
				# '"{}" SET active true'
			])
		else:
			buf.append('"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false'.format(l))
	
	common.sendData(buf, read=False)
	common.flushBuffer()
	settings._obj.extend(label)

def cameraRGBPPRandom(label='cameras/cameraRGB'):
	""""
	This function randomizes all available parameters for native postprocessing.
	Parameters that contain random statements will randomize between the acceptable
	range of values for the specific property.

	Parameters that don't have a random statement are defaults for EnviroFX profile

	Specific effects will be turned on / off at random as well.

	Note: Not all those values currently work, depending on depth / type they might
	return errors, if you happen to need to change one of those values contact support.

	# Arguments

	label (string|list): Defines a existing camera to apply postprocessing to, defaults to `cameras/cameraRGB`
	"""
	
	if not isinstance(label, list):
		label = [ label ]
	buf = []
	
	for l in label:
		# antialiasing
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.enabled true'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.fxaaSettings.preset 4'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.method 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.taaSettings.jitterSpread 0.75'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.taaSettings.motionBlending 0.85'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.taaSettings.sharpen 0.3'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.taaSettings.stationaryBlending 0.95'.format(l),
			])
		else:
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.enabled false'.format(l)
			])
		
		# ambient occlusion
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.enabled true'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.intensity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.radius 0.3'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.sampleCount 10'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.downsampling 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.forceForwardCompatibility 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.ambientOnly 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.highPrecision 0'.format(l),
			])
		else:
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.enabled false'.format(l),
			])
		
		# blooming effects
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled true'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.intensity {}'.format(l, random.randint(0, 100)),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.threshold {}'.format(l, random.uniform(0, 2)),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.softKnee {}'.format(l, random.uniform(0, 1)),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.radius {}'.format(l, random.uniform(1, 7)),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.antiFlicker {}'.format(l, 'true'),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.lensDirt.intensity {}'.format(l, random.randint(0, 10)),
			])
		else:
			buf.extend(['"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false'.format(l)])
		
		# chromatic aberration
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.enabled true'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.475'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.spectralTexture.fileID 0'.format(l),
			])
		else:
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.enabled false'.format(l),
			])
		
		# color grading
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.enabled true'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.027'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.hueShift 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.postExposure 0.5'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.188'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.temperature 13.8'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.tint 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.blue.x 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.blue.y 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.blue.z 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.currentEditingChannel 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.green.x 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.green.y 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.green.z 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.red.x 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.red.y 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.red.z 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gain.a 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gain.b 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gain.g 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gain.r 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gamma.a 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gamma.b 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gamma.g 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gamma.r 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.lift.a 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.lift.b 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.lift.g 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.lift.r 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.offset.a 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.offset.b 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.offset.g 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.offset.r 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.power.a 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.power.b 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.power.g 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.power.r 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.slope.a 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.slope.b 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.slope.g 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.slope.r 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.mode 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.inSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.outSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.tangentMode 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.time 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.value 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.inSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.outSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.tangentMode 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.time 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.value 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_PostInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_PreInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_RotationOrder 4'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.m_Loop 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.m_Range 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.m_ZeroValue 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurrentEditingCurve 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurveB 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurveG 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurveR 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurveY 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.inSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.outSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.tangentMode 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.time 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.value 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.inSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.outSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.tangentMode 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.time 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.value 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_PostInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_PreInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_RotationOrder 4'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.m_Loop 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.m_Range 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.m_ZeroValue 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.curve.m_PostInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.curve.m_PreInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.curve.m_RotationOrder 4'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.curve.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.m_Loop 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.m_Range 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.m_ZeroValue 0.5'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.curve.m_PostInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.curve.m_PreInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.curve.m_RotationOrder 4'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.curve.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.m_Loop 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.m_Range 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.m_ZeroValue 0.5'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.curve.m_PostInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.curve.m_PreInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.curve.m_RotationOrder 4'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.curve.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.m_Loop 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.m_Range 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.m_ZeroValue 0.5'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.inSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.outSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.tangentMode 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.time 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.value 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.inSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.outSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.tangentMode 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.time 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.value 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_PostInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_PreInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_RotationOrder 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.m_Loop 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.m_Range 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.m_ZeroValue 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.inSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.outSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.tangentMode 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.time 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.value 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.inSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.outSlope 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.tangentMode 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.time 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.value 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_PostInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_PreInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_RotationOrder 4'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.m_Loop 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.m_Range 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.m_ZeroValue 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.curve.m_PostInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.curve.m_PreInfinity 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.curve.m_RotationOrder 4'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.curve.serializedVersion 2'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.m_Loop 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.m_Range 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.m_ZeroValue 0.5'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralBlackIn 0.0073'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralBlackOut 0.0113'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralWhiteClip 10'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralWhiteIn 15'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralWhiteLevel 5.62'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralWhiteOut 15.49'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.tonemapper "2"'.format(l),
			])
		else:
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.enabled false'.format(l),
			])
		
		# depth of field
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.enabled true'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.focusDistance 0.1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.aperture 8.7'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.focalLength 200'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.useCameraFov 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.kernelSize 1'.format(l),
			])
		else:
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.enabled true'.format(l),
			])
		
		# dithering
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.dithering.enabled true'.format(l),
			])
		else:
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.dithering.enabled false'.format(l),
			])
		
		# eye adaptation
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled true'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.adaptationType 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.dynamicKeyValue 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.highPercent 95'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.keyValue 0.25'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.logMax 4'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.logMin -8'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.lowPercent 45'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.maxLuminance 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.minLuminance -5'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.speedDown 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.speedUp 2'.format(l),
			])
		else:
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled false'.format(l),
			])
		
		# fog
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.fog.enabled true'.format(l)
			])
		else:
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.fog.enabled false'.format(l)
			])
		
		# grain
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled true'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.colored 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.intensity 0.281'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.luminanceContribution 0.8'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.size 0.3'.format(l),
			])
		else:
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled false'.format(l),
			])
		
		# motion blur effects
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled true'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.shutterAngle {}'.format(l, random.randint(0, 360)),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount {}'.format(l, random.randint(1, 32)),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending {}'.format(l, random.uniform(0, 1))
			])
		else:
			buf.extend(['"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false'.format(l)])
		
		# screen space reflection
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.enabled true'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.blendType 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.reflectionQuality 3'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.maxDistance 99'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.iterationCount 99'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.stepSize 3'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.widthModifier 0.5'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.reflectionBlur 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.reflectBackfaces 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.intensity.reflectionMultiplier 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.intensity.fadeDistance 100'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.intensity.fresnelFade 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.intensity.fresnelFadePower 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.screenEdgeMask.intensity 0.03'.format(l),
			])
		else:
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.enabled false'.format(l),
			])
		
		# vignette
		if bool(random.getrandbits(1)):
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.enabled true'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.center.x 0.5'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.center.y 0.5'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.color.a 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.color.b 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.color.g 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.color.r 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.intensity 0.692'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.mask.fileID 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.mode 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.opacity 1'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.rounded 0'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.roundness 0.255'.format(l),
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.smoothness 0.439'.format(l),
			])
		else:
			buf.extend([
				'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.enabled false'.format(l),
			])
	
	common.sendData(buf, read=False)
	common.flushBuffer()

def addThermalProfileOverride(
		target,
		temperatureMode='Disabled', temperatureValue=0,
		temperatureMedianMode='Disabled', temperatureMedianValue=0.5,
		temperatureBandwidthMode='Disabled', temperatureBandwidthValue=0,
		heatinessMode='Disabled', heatinessValue=0,
		varianceMode='Disabled', varianceValue=0,
		reflectivityMode='Disabled', reflectivityValue=0,
		ambientOffsetMode='Disabled', ambientOffsetValue=0
	):
	
	if not isinstance(target, list):
		target = [ target ]
	
	for t in target:
		common.sendData([
			'"{}" ADD Thermal.ThermalProfileOverride'.format(t),
			'''"{}" SET Thermal.ThermalProfileOverride
				temperatureMode "{}"
				temperature {}
				temperatureMedianMode "{}"
				temperatureMedian {}
				temperatureBandwidthMode "{}"
				temperatureBandwidth {}
				heatinessMode "{}"
				heatiness {}
				varianceMode "{}"
				variance {}
				reflectivityMode "{}"
				reflectivity {}
				ambientOffsetMode "{}"
				ambientOffset {}
			'''.format(
				t, temperatureMode, temperatureValue,
				temperatureMedianMode, temperatureMedianValue,
				temperatureBandwidthMode, temperatureBandwidthValue,
				heatinessMode, heatinessValue, reflectivityMode, reflectivityValue,
				varianceMode, varianceValue, ambientOffsetMode, ambientOffsetValue
			)
		])

def addThermalTerrain(target, ambientOffset=0, bandwidth=1, median=0, baseMapDistance=10000):
	common.sendData([
		'"{}" ADD Thermal.ThermalTerrain'.format(target),
		'''"{}" SET Thermal.ThermalTerrain
			ambientOffset {}
			bandwidth {}
			median {}
			baseMapDistance {}
		'''.format(target, ambientOffset, bandwidth, median, baseMapDistance)
	])

def addWindzone(target, mode='Directional', radius=0, main=1, turbulence=1, pulse_magnitude=0.5, pulse_frequency=0.01):
	"""
	Creates a wind zone component
	
	This is the same component described on Unity's WindZone:
	https://docs.unity3d.com/ScriptReference/WindZone.html
	
	# Parameters
	
	target (string): Game object to add windzone to
	mode (string): Wind zone type, `Directional` or `Spherical`, defaults to `Directional`
	radius (float): Spherical wind radius, defaults to `0`
	main (float): Primary wind force, defaults to `1`
	turbulence (float): Turbulence wind force, defaults to `1`
	pulse_magnitude (float): Defines how much the wind changes over time, defaults to `0.5`
	pulse_frequency (float): Defines the frequency the wind changes, defaults to `0.01`
	
	"""
	common.sendData([
		'"{}" ADD WindZone'.format(target),
		'''"{}" SET WindZone
			mode "{}"
			radius {}
			windMain {}
			windTurbulence {}
			windPulseMagnitude {}
			windPulseFrequency {}
		'''.format(target, mode, radius, main, turbulence, pulse_magnitude, pulse_frequency)
	])

def cameraRGBPPScionRandom(label='cameras/cameraRGB'):
	"""
	Show case for scion camera postprocessing effects
	
	Different from Envirosky, Scion offers a different type of postprocessing stack
	we do not recommend using this, unless you need something in specific from it
	that Envirosky cannot provide.
	"""
	# grain effect
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET ScionEngine.ScionPostProcess grain true'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess grainIntensity {}'.format(label, random.uniform(0, 0.4))
		], read=False)
	# else:
	# 	common.sendData(['"{}" SET ScionEngine.ScionPostProcess grain false'.format(label)])
	
	# chromatic aberration
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET ScionEngine.ScionPostProcess chromaticAberration true'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess chromaticAberrationDistortion {}'.format(label, random.uniform(0, 1)),
			'"{}" SET ScionEngine.ScionPostProcess chromaticAberrationIntensity {}'.format(label, random.uniform(0, 20))
		], read=False)
	# else:
	# 	common.sendData(['"{}" SET ScionEngine.ScionPostProcess chromaticAberration false'.format(label)])
	
	# blooming effect
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET ScionEngine.ScionPostProcess bloom true'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess bloomThreshold {}'.format(label, random.uniform(0, 50)),
			'"{}" SET ScionEngine.ScionPostProcess bloomIntensity {}'.format(label, random.uniform(0, 1)),
			'"{}" SET ScionEngine.ScionPostProcess bloomBrightness {}'.format(label, random.uniform(0, 8)),
			'"{}" SET ScionEngine.ScionPostProcess bloomDownsamples {}'.format(label, random.randint(1, 8)),
			'"{}" SET ScionEngine.ScionPostProcess bloomDistanceMultiplier {}'.format(label, random.randuniform(0.25, 1.25))
		], read=False)
	# else:
	# 	common.sendData(['"{}" SET ScionEngine.ScionPostProcess bloom false'])
	
	# vignette
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET ScionEngine.ScionPostProcess vignette true'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess vignetteIntensity {}'.format(label, rand.uniform(0, 1)),
			'"{}" SET ScionEngine.ScionPostProcess vignetteScale {}'.format(label, random.uniform(0, 1)),
		], read=False)
	# else:
	#	common.sendData(['"{}" SET ScionEngine.ScionPostProcess vignette false'.format(label)])
	
	# lens flare
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET ScionEngine.ScionPostProcess lensFlare true'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess lensFlareGhostIntensity {}'.format(label, random.uniform(0, 2)),
			'"{}" SET ScionEngine.ScionPostProcess lensFlareGhostDispersal {}'.format(label, random.uniform(0, 2)),
			'"{}" SET ScionEngine.ScionPostProcess lensFlareGhostDistortion {}'.format(label, random.uniform(0, 1)),
			'"{}" SET ScionEngine.ScionPostProcess lensFlareGhostEdgeFade {}'.format(label, random.uniform(0, 1.5)),
			'"{}" SET ScionEngine.ScionPostProcess lensFlareHaloIntensity {}'.format(label, random.uniform(0, 2)),
			'"{}" SET ScionEngine.ScionPostProcess lensFlareHaloWidth {}'.format(label, random.uniform(0, 0.8)),
			'"{}" SET ScionEngine.ScionPostProcess lensFlareHaloDistortion {}'.format(label, random.uniform(0, 1)),
			'"{}" SET ScionEngine.ScionPostProcess lensFlareBlurStrength {}'.format(label, random.uniform(0, 1)),
			'"{}" SET ScionEngine.ScionPostProcess lensFlareDownsamples {}'.format(label, random.randint(1, 3))
		], read=False)
	# else:
	# 	common.sendData(['"{}" SET ScionEngine.ScionPostProcess lensFlare false'.format(label)])
	
	# tonemapping
	common.sendData(['"{}" SET ScionEngine.ScionPostProcess tonemappingMode "{}"'.format(label, random.choice(unity_vars.tonemappings))], read=False)
	common.flushBuffer()

def setDiskTexture(lst, label='disk1'):
	"""
	Links a texture to a disk output
	
	This is essential when writing images to disk, after creating a camera and
	adding RenderCamera component to it, you bind it to the disk component to 
	generate an output.
	
	# Arguments
	
	lst (list): List of cameras containing RenderCamera component to bind to
	label (string): Name of the disk object, defaults to `disk1`
	"""
	if settings.skip_disk:
		return
	
	for l in lst:
		common.sendData([
			'"{}/{}" SET Sensors.RenderCameraLink target "{}"'.format(label, l.capitalize(), l)
		], read=False)

def addCameraSegFilter(segments=['Car'], label='cameras/segmentation', unoccluded=None, ret=False):
	"""
	Creates a filterable bounding boxes with unoccluded option enabled by default.
	This allows you to export json objects containig segmented classes.
	
	# Arguments
	
	segments (list): Defines one or more classes, defaults to `['Car']`
	label (string): Defines a segmentation camera as source, defaults to `cameras/segmentation`
	unoccluded (list): Defines one or more classes to be unoccluded, defaults to `None`
	ret (bool): Return the commands instead of sending them, defaults to `False`
	
	"""
	
	buf = []
	
	for s in segments:
		buf.append('"{}" PUSH Segmentation.Segmentation boundingBoxesFilter "{}"'.format(label, s))
	
	if unoccluded != None:
		for s in segments:
			buf.append('"{}" PUSH Segmentation.Segmentation unoccludedClasses "{}"'.format(label, s))
	
	if ret:
		return buf
	
	common.sendData(buf, read=False)

# output_type options: Auto, ClassIds, InstanceIds, ClassColors, Raw
def addCameraSeg(
	width=1024, height=768, segments=None, output_type='Auto', label='cameras/segmentation',
	fov=60,
	clippingNear=0.3,
	clippingFar=1000,
	boundingBoxesExtensionAmount=0,
	renderingPath=4,
	textureFormat=4,
	minimumVisibility=0,
	renderCamera=True,
	lookupTable=True,
	transparencyCutout=0
):
	"""
	Creates a Segmentation camera
	
	# Arguments
	
	width (int): Resolution width, defaults to `2048`
	height (int): Resolution height, defaults to `1536`
	segments (list|string): Defines one or more classes this camera will see, defaults to `None`
	label (string|list): Game object path, defaults to `cameras/segmentation` - This should follow `labelRoot` from `globalCameraSetup`
	fov (int): Field of view, defaults to `60`
	clippingNear (float): Near clipping distance, defaults to `0.3` - Objects closer than this distance won't appear
	clippingFar (float): Far clipping distance, defaults to `1000` - Objects further from this distance won't appear
	boundingBoxesExtensionAmount (float): Defines the bounding box scale up / down in %, defaults to `0`.
	renderingPath (int): Defines rendering path, defaults to `4` - This is defined on `unity_vars` lookup table
	textureFormat (int): Defines texture format, defaults to `4` - This is defined on `unity_vars` lookup table
	renderCamera (bool): Binds a renderCamera component allowing for disk exports, defaults to `True`
	lookupTable (list): Binds a color to a class, this is essential for outputting pixel dense images, this is an array of arrays like `[ [ Car , red ] , [ Person, blue ] .. ]`; Defaults to `True` which will automatically populate the segmentation lookup table based on the segments sent.
	minimumVisibility (float): Defines minimum visibility of object in % (0 - 1), objects with less than % of it's total size visible won't appear on the segmentation maps neither yeild bounding boxes, defaults to `0`
	transparencyCutout (float): Defines a cutout percentage for transparent objects, defaults to `0` that will show transparent objects at full extent, when set to 1 will hide them completly.
	
	# Notes
	
	- patchyness effects mimic thermal cameras averaging feature from mid / long distance focal points
	- blur effects mimics noise around object edges, more visible when close by
	
	"""
	if not isinstance(label, list):
		label = [ label ]
	
	buf = []
	
	for l in label:
		buf.extend([
			'CREATE "{}"'.format(l),
			'"{}" SET active false'.format(l),
			'"{}" ADD Camera Segmentation.Segmentation Segmentation.LookUpTable {}'.format(l, 'Sensors.RenderCamera' if renderCamera else ''),
			'''"{}" SET Camera
				near {} far {} fieldOfView {}
				renderingPath "{}" targetTexture.filterMode "Point"
			'''.format(l, clippingNear, clippingFar, fov, unity_vars.renderingPath[renderingPath]),
		])
		
		if renderCamera:
			buf.append('"{}" SET Sensors.RenderCamera format "{}" resolution ({} {})'.format(l, unity_vars.textureFormat[textureFormat], width, height))
		
		buf.extend([
			'''"{}" SET Segmentation.Segmentation
				minimumObjectVisibility {}
				outputType "{}"
				boundingBoxesExtensionAmount {}
				transparencyCutout {}
			'''.format(l, minimumVisibility, output_type, boundingBoxesExtensionAmount, transparencyCutout),
			
			'"{}" EXECUTE Segmentation.Segmentation DefineClass "Void"'.format(l)
		])
		
		if segments != None:
			buf.extend(addCameraSegFilter(segments, label=l, ret=True))
		
		classes = []
		colors = []
		
		if lookupTable == True and segments != None:
			idx = 0
			
			for i in segments:
				if idx > len(unity_vars.colors):
					color = '"{}"'.format(getRandomColor())
				else:
					color = unity_vars.colors[idx]
				
				classes.append('"{}"'.format(i))
				colors.append('"{}"'.format(color))
				
				buf.append('"{}" EXECUTE Segmentation.Segmentation DefineClass "{}"'.format(l, i))
				idx += 1
			
		elif isinstance(lookupTable, list):
			for i in lookupTable:
				classes.append('"{}"'.format(i[0]))
				colors.append('"{}"'.format(i[1]))
				
				buf.append('"{}" EXECUTE Segmentation.Segmentation DefineClass "{}"'.format(l, i[0]))
		
		buf.extend([
			'"{}" PUSH Segmentation.LookUpTable classes "Void" {}'.format(l, ' '.join(classes)),
			'"{}" PUSH Segmentation.LookUpTable colors "black" {}'.format(l, ' '.join(colors)),
			
			'"{}" EXECUTE Segmentation.LookUpTable MarkTextureDirty'.format(l),
			'"{}" SET active true'.format(l)
		])
	
	common.sendData(buf, read=False)
	common.flushBuffer()
	settings._obj.append(label)

def addLight(position=[34,-22.53,0], intensity=1.7, label='light', shadows='Soft'):
	"""
	Creates a light object
	
	This is not recommened when you have envirosky enabled, as it will swamp the
	rgb rendering with light, but it depends on the application.
	
	# Arguments
	
	position (list): X,Y,Z position, defaults to `[32,-22.53,0]`
	intensity (float): Light intensity, defaults to `1.7`
	label (string): Game object name, defaults to `light`
	shadows (string): Shadowing type, defaults to `Soft`
	"""
	
	common.sendData([
		'CREATE "{}"'.format(label),
		'"{}" ADD Light'.format(label),
		'''"{}" SET Light
			type "Directional"
			intensity {}
			shadows "{}"
		'''.format(label, intensity, shadows),
		'"{}" SET Transform eulerAngles ({} {} {})'.format(label, position[0], position[1], position[2]),
		'"{}" SET active true'.format(label)
	], read=False)
	
	common.flushBuffer()
	settings._obj.append(label)

def globalDiskSetup(label='disk1', outputPath=None):
	"""
	Setups the disk output module root component
	
	# Arguments
	
	label (string): Game object name, defaults to `disk1`
	outputPath (string): Image output path, when not set, defaults to settings.output_path (set by the syncity inialization script)
	
	"""
	if settings.skip_disk:
		return
	
	if outputPath == None:
		outputPath = settings.output_path
	
	common.sendData([
		'CREATE "{}"'.format(label),
		'"{}" SET active false'.format(label),
		'"{}" ADD Sensors.Disk'.format(label),
		'"{}" SET Sensors.Disk path "{}"'.format(label, outputPath),
		'"{}" SET active true'.format(label)
	], read=False)
	
	common.flushBuffer()
	settings._obj.append(label)

def kickSeg(label='cameras/segmentation'):
	return
	
	common.output('Kicking segmentation camera', 'DEBUG')
	common.flushBuffer()
	common.sendData([
		'"{}" EXECUTE Sensors.RenderCamera RenderFrame'.format(label),
		'"{}" GET Segmentation.Segmentation boundingBoxes'.format(label),
		'NOOP',
		'"{}" EXECUTE Sensors.RenderCamera RenderFrame'.format(label),
		'"{}" GET Segmentation.Segmentation boundingBoxes'.format(label),
		'NOOP'
	], read=True)
	common.flushBuffer()
	time.sleep(3)

def doRender(lst):
	"""
	By default syncity simulator doesn't render anything unless it's necessary, this method allows you to render one frame.
	This funcionality works with renderCamera component and is intended for outputting data.
	When you trigger a RenderFrame the object that contain a renderCamera will render ONE frame and disable the Camera object.
	
	# Arguments
	
	lst (list): List of cameras to call RenderFrame
	
	"""
	for l in lst:
		common.sendData('"{}" EXECUTE Sensors.RenderCamera RenderFrame'.format(l))

def takeSnapshot(lst, autoSegment=False, label='disk1', forceNoop=False):
	"""
	Creates a image snapshot from a set of cameras using a disk component
	
	# Arguments
	
	lst (list): List of cameras
	autoSegment (bool): Automatic guess which cameras are segmentation and export json objects among with the pixel dense image, defaults to `None`
	label (string): Game object name, defaults to `disk1`
	forceNoop (bool): Force a buffer flush before snapshot happens, this ensures that any queued commands are executed before doing the render. Defaults to `False`
	
	"""
	if settings.skip_disk and autoSegment == False:
		if forceNoop:
			common.sendData('NOOP', read=True);
		
		# NOTE: This is not needed, but we will force it
		doRender(lst)
		return
	
	if autoSegment:
		idx = [i for i, s in enumerate(lst) if 'segmentation' in s]
		
		if len(idx) == 0:
			common.output('No camera with segmentation name found, skipping autoSegment', 'WARNING')
		else:
			
			# DEPRECATED: This is no longer needed
			doRender(lst)
			
			common.flushBuffer()
			r = common.sendData([
				'"{}" EXECUTE Sensors.Disk Snapshot'.format(label),
				'"{}" GET Segmentation.Segmentation boundingBoxes'.format(lst[idx[0]]),
				'NOOP'
			], read=True)
			seqSave('bbox', r)
	else:
		if forceNoop:
			common.sendData('NOOP', read=True);
		
		common.sendData('"{}" EXECUTE Sensors.Disk Snapshot'.format(label))
	
	if settings.cooldown > 0:
		common.sendData('SLEEP {}'.format(settings.cooldown), read=True);

def takeSegSnapshot(lst):
	"""
	Creates a segmentation snapshot with json output from a list of cameras
	
	# Attributes
	
	lst (list): List of cameras with segmentation component
	
	"""
	common.flushBuffer()
	
	for l in lst:
		r = common.sendData(['"{}" GET Segmentation.Segmentation boundingBoxes'.format(l), 'NOOP'], read=True)
		seqSave('bbox', r)

def seqSave(pref, rawData):
	"""
	Helper function to mutate raw telnet outputs into json objects
	
	Note: This function is temporary, the simulator daemon itself will save json
	files the same way it exports images in the future.
	
	# Attributes
	
	pref (string): Output file prefix
	rawData (list): Data to write
	
	"""
	if settings.dry_run:
		return
	
	noops = 0
	data = []
	while len(data) == 0:
		f = [False, False]
		rawData = ('\n'.join(rawData)).split('\n')
		
		for r in rawData:
			r = r.strip('\n\r')
			
			if r == '' or r == 'OK' or r[0:2] == 'OK' or r[0:2] == 'ER':
				continue
			
			if r[0:1] == '[':
				f[0] = True
			
			if f[0] == True and f[1] == False:
				data.append(r)
			elif f[0] == True and f[1] == True:
				common.output('More than one object received? {}'.format('\n'.join(rawData)), 'WARN')
			
			if r[-1:] == ']':
				f[1] = True
				
				# if there's data and we have a valid json object, we break, otherwise it's a fake close
				if len(data) > 0:
					try:
						json.loads(''.join(data))
						break
					except:
						f[1] = False
		
		if len(data) == 0:
			common.output('Unable to fetch bounding box #{}, retrying...'.format(settings._seqSave_i), 'WARN')
			time.sleep(.5)
			rawData = common.sendData('NOOP', read=True)
		else:
			# make sure object is valid, otherwise we might need to send another noop to complete it
			try:
				json.loads(''.join(data))
				break
			except:
				common.output('Partially received json object, waiting for more...', 'WARN')
				time.sleep(.5)
				rawData = common.sendData('NOOP', read=True)
		
		noops += 1
		
		if noops > 100:
			common.output('Limit reached while waiting for json object, skipping index!', 'ERROR')
			settings._seqSave_i = settings._seqSave_i + 1
			return
	
	data = ''.join(data)
	
	fn = '{}{}_{}.json'.format(settings.local_path, pref, settings._seqSave_i)
	
	if settings.debug:
		common.output('SEQ Save path: {} prefix: {} data: {}'.format(fn, pref, data), 'DEBUG')
		d = open(fn + '.debug', 'w')
		d.write('\r\n'.join(rawData))
		d.close()
	
	f = open(fn, 'w')
	f.write(data)
	f.close()
	common.output('Wrote: {}{}_{}.json'.format(settings.local_path, pref, settings._seqSave_i))
	settings._seqSave_i = settings._seqSave_i + 1

def addDiskOutput(lst, label='disk1'):
	"""
	Creates a image output from a existing disk component
	
	# Attributes
	
	lst (list): List of cameras
	label (string): Existing disk component game object name
	
	# Note
	
	Any camera with a renderCamera component is able to export images, this method
	creates a link between the texture this camera is rendering and a disk output.
	
	"""
	if settings.skip_disk:
		return
	common.sendData('"{}" SET active false'.format(label))
	
	for l in lst:
		common.sendData([
			'CREATE "{}/{}"'.format(label, l.capitalize()),
			'"{}/{}" ADD Sensors.RenderCameraLink'.format(label, l.capitalize()),
			'"{}/{}" SET Sensors.RenderCameraLink target "{}"'.format(label, l.capitalize(), l),
			
			# TEMPORARY HACK
			'"{}/{}" SET Sensors.RenderCameraLink outputType "DEPTH"'.format(label, l.capitalize()) if "depth" in l else '',
			
			'"{}/{}" SET active true'.format(label, l.capitalize())
		], read=False)
	
	common.sendData('"{}" SET active true'.format(label))

def uglyTagFix(tag):
	x = tag.split('/')[-1]
	
	if x[-1:] == 's':
		x = x[:-1]
	
	return x

def addRandomColor(objs, colors=16, colorsWeights=14, spawner=False, method='FromList', partsNames=None):
	"""
	Adds random color component to a object or spawner
	
	# Arguments
	
	objs (list|string): Object or objects to add random color component
	colors (int): Number of random colors to be assigned, defaults to `16` (ignored if method is `Random`)
	colorsWeights (int): Color changing weight, defaults to `14`
	spawner (bool): Defines if the object(s) is/are spawner or regular objects, defaults to `False`
	method (string): Defines operation mode, `FromList` will use a fixed list of colors, `Random` will pick a random color everytime, `Lerp` will randomize between 2 colors, defaults to `FromList`
	partsNames (string): Defines a list of parts to be colorized
	
	"""
	
	if spawner:
		component = 'RandomProps.SpawnerRandomizers.RandomColor'
	else:
		component = 'RandomProps.RandomColor'
	
	if type(objs) != list:
		objs = [ objs ]
	
	buf = []
	
	for obj in objs:
		buf.append('"{}" ADD {}'.format(obj, component))
		buf.append('"{}" SET {} randomMethod "{}"'.format(obj, component, method))
		
		if method == 'Random':
			buf.append('"{}" PUSH {} availableColors "{}"'.format(obj, component, getRandomColor()))
		elif colors > 0:
			s = ['"{}" PUSH {} availableColors'.format(obj, component)]
			for i in range(0, colors):
				s.append('"{}"'.format(getRandomColor()))
			buf.append(' '.join(s))
		
		if partsNames != None:
			buf.append('"{}" SET {} partsNames "{}"'.format(obj, component, partsNames))
		buf.append('"{}" PUSH {} colorsWeights {}'.format(obj, component, colorsWeights))
	
	common.sendData(buf, read=False)

def sphericalCamera(
	add=True,
	camera='cameras/cameraRGB',
	
	fisheye=None,
	azimuth=None,
	elevation=None
):
	buf = []
	if not isinstance(camera, list):
		camera = [ camera ]
	
	for c in camera:
		if add == True:
			buf.append('"{}" ADD SphericalCamera'.format(c))
		
		s = ['"{}" SET SphericalCamera '.format(c)]
		
		if fisheye != None:
			s.append('fisheye "{}"'.format("true" if fisheye == True else "false"))
		if azimuth != None:
			s.append('azimuth {}'.format(azimuth))
		if elevation != None:
			s.append('elevation {}'.format(elevation))
		
		if len(s) == 1:
			raise 'No parameters sent'
		
		buf.append(' '.join(s))
	
	common.sendData(buf)

def physicalCameraParameters(
	add=True,
	camera='cameras/cameraRGB',
	
	focalLengthMM=None,
	sensorWidthMM=None,
	sensorHeightMM=None,
	sensorAspect=None,
	sensorFormatFactor=None
):
	"""
	Changes camera lens parameters compatible with physical metrics
	
	# Arguments
	
	add (bool): Defines if we should add the `PhysicalCameraParameters` component to the camera, if you already have a `PhysicalCameraParameters` component you should set this to `None` so we simply manipulate settings sent, defaults to `True`
	camera (string|list): Defines camera where `PhysicalCameraParameters` should be added / exists, defaults to `cameras/cameraRGB`,
	
	focalLengthMM (float): Focal Length in milimiters defaults to `None`
	sensorWidthMM (float): Defines physical CMOS sensor width in milimiters defaults to `None`
	sensorHeightMM (float): Defines physical CMOS sensor height in milimiters defaults to `None`
	sensorAspect (float): Defines physical CMOS sensor aspect ratio, this might override `sensorHeightMM` or `sensorWidthMM` defaults to `None`
	sensorFormatFactor (float): Sensoe format factor, defaults to `None`
	
	# Note
	
	Values set to `None` won't be changed, meaning they will default to what's been defined on the camera previously, if those values haven't been yet set, defaults will fallback to the component `PhysicalCameraParameters` defaults, which are:
	
	focalLengthMM: 50
	sensorWidthMM: 36
	sensorHeightMM: 24
	sensorAspect: 1
	sensorFormatFactor: 1
	
	"""
	buf = []
	if not isinstance(camera, list):
		camera = [ camera ]
	
	for c in camera:
		if add == True:
			buf.append('"{}" ADD PhysicalCameraParameters'.format(c))
		
		s = ['"{}" SET PhysicalCameraParameters '.format(c)]
		
		if sensorWidthMM != None:
			s.append('sensorWidthMM {}'.format(sensorWidthMM))
		if sensorHeightMM != None:
			s.append('sensorHeightMM {}'.format(sensorHeightMM))
		if focalLengthMM != None:
			s.append('focalLengthMM {}'.format(focalLengthMM))
		if sensorAspect != None:
			s.append('sensorAspect {}'.format(sensorAspect))
		if sensorFormatFactor != None:
			s.append('sensorFormatFactor {}'.format(sensorFormatFactor))
		
		if len(s) == 1:
			raise 'No parameters sent'
		
		buf.append(' '.join(s))
	
	common.sendData(buf)

def LCP(
	add=True,
	camera='cameras/cameraRGB',
	
	updateValuesMode=None,
	
	focalLength=None,
	sensorFormatFactor=None,
	distortionScale=None,
	isFisheyeDistortion=None,
	
	radialParam1=None,
	radialParam2=None,
	radialParam3=None,
	
	radialParamX=None,
	radialParamY=None,
	
	redParam1=None,
	redParam2=None,
	redParam3=None,
	
	redParamX=None,
	redParamY=None,
	
	greenParam1=None,
	greenParam2=None,
	greenParam3=None,
	
	greenParamX=None,
	greenParamY=None,
	
	blueParam1=None,
	blueParam2=None,
	blueParam3=None,
	
	blueParamX=None,
	blueParamY=None,
	
	vignetteParam1=None,
	vignetteParam2=None,
	vignetteParam3=None,
	vignetteParam4=None,

):
	"""
	Adds LCP
	
	LCP or Lens Correction Profiles is a adobe camera lens standard, read more on:
	http://blogs.adobe.com/jkost/tag/lens-correction-profiles
	
	In the future we will allow direct LCP file loading among with the configurables.
	
	# Arguments
	
	add (bool): Defines if we should add the LCP component to the camera, if you already have a LCP component you should set this to `None` so we simply manipulate settings sent, defaults to `True`
	camera (string|list): Defines camera where LCP should be added / exists, defaults to `cameras/cameraRGB`
	
	updateValuesMode (string): Defines how values should be updated, this depends on how you're using this component. Defaults to `None` which is `OnEnableOnly`, possible options are `OnEnableOnly` and `EveryFrame`.
	focalLength (float): Focal Length compatible with real camera values defaults to `None`
	sensorFormatFactor (float): Sensoe format factor, defaults to `None`
	distortionScale (float): Distortion weight scale, defaults to `None`
	isFisheyeDistortion (bool): enables fish eye distortion defaults to `None`
	
	radialParam1 (float): defaults to `None`
	radialParam2 (float): defaults to `None`
	radialParam3 (float): defaults to `None`
	
	radialParamX (float): defaults to `None`
	radialParamY (float): defaults to `None`
	
	redParam1 (float): defaults to `None`
	redParam2 (float): defaults to `None`
	redParam3 (float): defaults to `None`
	
	redParamX (float): defaults to `None`
	redParamY (float): defaults to `None`
	
	greenParam1 (float): defaults to `None`
	greenParam2 (float): defaults to `None`
	greenParam3 (float): defaults to `None`
	
	greenParamX (float): defaults to `None`
	greenParamY (float): defaults to `None`
	
	blueParam1 (float): defaults to `None`
	blueParam2 (float): defaults to `None`
	blueParam3 (float): defaults to `None`
	
	blueParamX (float): defaults to `None`
	blueParamY (float): defaults to `None`
	
	vignetteParam1 (float): defaults to `None`
	vignetteParam2 (float): defaults to `None`
	vignetteParam3 (float): defaults to `None`
	vignetteParam4 (float): defaults to `None`
	
	# Note
	
	Values set to `None` won't be changed, meaning they will default to what's been defined on the camera previously, if those values haven't been yet set, defaults will fallback to the component `LCP` defaults, which are all zero.
	
	"""
	buf = []
	if not isinstance(camera, list):
		camera = [ camera ]
	
	for c in camera:
		if add == True:
			buf.append('"{}" ADD LCP'.format(c))
		
		s = ['"{}" SET LCP enabled false '.format(c)]
		
		if updateValuesMode != None:
			s.append('updateValuesMode "{}"'.format(updateValuesMode))
		if focalLength != None:
			s.append('focalLength {}'.format(focalLength))
		if sensorFormatFactor != None:
			s.append('sensorFormatFactor {}'.format(sensorFormatFactor))
		if distortionScale != None:
			s.append('distortionScale {}'.format(distortionScale))
		if isFisheyeDistortion != None:
			s.append('isFisheyeDistortion {}'.format('true' if isFisheyeDistortion == True else 'false'))
		
		if radialParam1 != None:
			s.append('radialParam1 {}'.format(radialParam1))
		if radialParam2 != None:
			s.append('radialParam2 {}'.format(radialParam2))
		if radialParam3 != None:
			s.append('radialParam3 {}'.format(radialParam3))
		if radialParamX != None:
			s.append('radialParamX {}'.format(radialParamX))
		if radialParamY != None:
			s.append('radialParamY {}'.format(radialParamY))
		
		if redParam1 != None:
			s.append('redParam1 {}'.format(redParam1))
		if redParam2 != None:
			s.append('redParam2 {}'.format(redParam2))
		if redParam3 != None:
			s.append('redParam3 {}'.format(redParam3))
		
		if redParamX != None:
			s.append('redParamX {}'.format(redParamX))
		if redParamY != None:
			s.append('redParamY {}'.format(redParamY))
		
		if greenParam1 != None:
			s.append('greenParam1 {}'.format(greenParam1))
		if greenParam2 != None:
			s.append('greenParam2 {}'.format(greenParam2))
		if greenParam3 != None:
			s.append('greenParam3 {}'.format(greenParam3))
		
		if greenParamX != None:
			s.append('greenParamX {}'.format(greenParamX))
		if greenParamY != None:
			s.append('greenParamY {}'.format(greenParamY))
		
		if blueParam1 != None:
			s.append('blueParam1 {}'.format(blueParam1))
		if blueParam2 != None:
			s.append('blueParam2 {}'.format(blueParam2))
		if blueParam3 != None:
			s.append('blueParam3 {}'.format(blueParam3))
			
		if blueParamX != None:
			s.append('blueParamX {}'.format(blueParamX))
		if blueParamY != None:
			s.append('blueParamY {}'.format(blueParamY))
		
		if vignetteParam1 != None:
			s.append('vignetteParam1 {}'.format(vignetteParam1))
		if vignetteParam2 != None:
			s.append('vignetteParam2 {}'.format(vignetteParam2))
		if vignetteParam3 != None:
			s.append('vignetteParam3 {}'.format(vignetteParam3))
		if vignetteParam4 != None:
			s.append('vignetteParam4 {}'.format(vignetteParam4))
		
		if len(s) == 1:
			raise 'No parameters sent'
		
		buf.append('{} enabled true'.format(' '.join(s)))
	
	common.sendData(buf)

def addLidar(
	label='Lidar', model='VLP_16',
	minAz=-180, maxAz=180, minEl=-30, maxEl=30, rpm=900,
	timingAccuracy='MEDIUM', accuracy='HIGH', disableUDPBroadcast=False,
	minimumIntensity=0, ipAddressOverride='192.168.1.100',
	position=False, rotation=False,
	localPosition=False, localRotation=False
):
	"""
	Creates a LiDAR Sensors
	
	# Arguments
	
	label (string): Defines an existing game object to bind lidar to, this must contain a camera component, if it doesn't the system will add one, defaults to `Lidar`
	model (string): Defines a model to use, this will depend on what libraries you have on the system, some models: VLP_16, HDL_32E, HDL_64E_S3, M8, defaults to `VLP_16`
	minAz (int): Minimum azimuth, defaults to `-180`
	maxAz (int): Maximum azimuth, defaults to `180`
	minEl (int): Minimum elevation, defaults to `-30`
	maxEl (int): Maximum elevation, defaults to `30`
	rpm (int): Device RPM, defaults to `900`
	timingAccuracy (string): Defines lidar CPU burn timing accuracy resolution, options: LOW, MEDIUM, HIGH, defaults to `MEDIUM`
	accuracy (string): Defines lidar CPU burn accuracy, options: LOW, MEDIUM, HIGH, ULTRA, defaults to `HIGH`
	disableUDPBroadcast (bool): Defines if protocol broadcasting is disabled, defaults to `False`
	minimumIntensity (string): Defines minimum intensity returned by the device; defaults to `0` meaning everything
	ipAddressOverride (string): Defines a ip address where the device will broadcast to, defaults to `192.168.1.100`; This option will be deprecated in the future.
	position (list): Defines X, Y, Z absolute position to spawn component, defaults to `None`
	rotation (list): Defines X, Y, Z absolute angles to spawn component, defaults to `None`
	localPosition (list): Defines X, Y, Z relative position to spawn component, defaults to `None`
	localRotation (list): Defines X, Y, Z relative angles to spawn component, defaults to `None`
	
	"""
	common.sendData([
		'CREATE "{}"'.format(label),
		
		'' if position == False else '"{}" SET Transform position ({} {} {})'.format(label, position[0], position[1], position[2]),
		'' if rotation == False else '"{}" SET Transform eulerAngles ({} {} {})'.format(label, rotation[0], rotation[1], rotation[2]),
		
		'' if localPosition == False else '"{}" SET Transform localPosition ({} {} {})'.format(label, localPosition[0], localPosition[1], localPosition[2]),
		'' if localRotation == False else '"{}" SET Transform localEulerAngles ({} {} {})'.format(label, localRotation[0], localRotation[1], localRotation[2]),
		
		'"{}" ADD Sensors.Lidar'.format(label),
		'''"{}" SET Sensors.Lidar
			model "{}"
			minAz {}
			maxAz {}
			minEl {}
			maxEl {}
			rpm {}
			
			minimumIntensity {}
			timingAccuracy "{}"
			accuracy "{}"
			
			ipAddressOverride "{}"
			disableUDPBroadcast {}
		'''.format(
			label, model, minAz, maxAz, minEl, maxEl, rpm,
			minimumIntensity, timingAccuracy, accuracy, ipAddressOverride,
			'false' if disableUDPBroadcast == False else 'true'
		),
		'"{}" SET active true'.format(label)
	])

def setupROSTopics(labelRoot='ROS2', writeLinks=None, readLinks=None):
	buf = [
		'CREATE "{}"'.format(labelRoot),
		'"{}" SET active false'.format(labelRoot),
		'"{}" ADD Sensors.ROS2'.format(labelRoot)
	]
	
	if writeLinks != None:
		for lnk in writeLinks:
			buf.extend([
				'CREATE "{}/{}"'.format(labelRoot, lnk['label']),
				'"{}/{}" ADD Sensors.WriteFieldLink'.format(labelRoot, lnk['label']),
				'''"{}/{}" SET Sensors.WriteFieldLink
					topicName "{}"
					target "{}"
					componentName "{}"
					fieldName "{}"
					intervalSeconds {}
				'''.format(
					labelRoot, lnk['label'], lnk['topic'], lnk['target'],
					lnk['component'], lnk['field'], lnk['interval']
				),
				'"{}/{}" SET active true'.format(labelRoot, lnk['label'])
			])
	
	if readLinks != None:
		for lnk in readLinks:
			buf.extend([
				'CREATE "{}/{}"'.format(labelRoot, lnk['label']),
				'"{}/{}" ADD Sensors.ReadFieldLink'.format(labelRoot, lnk['label']),
				'''"{}/{}" SET Sensors.ReadFieldLink
					topicName "{}"
					target "{}"
					componentName "{}"
					fieldName "{}"
					intervalSeconds {}
					onChange true
				'''.format(
					labelRoot, lnk['label'], lnk['topic'], lnk['target'],
					lnk['component'], lnk['field'], lnk['interval']
				),
				'"{}/{}" SET active true'.format(labelRoot, lnk['label'])
			])
			
			# workaround for cameras, if we're dealing with a targetTexture, the camera must have
			# a RenderCamera and it must be always on, otherwise it will not broadcast propertly
			if lnk['field'] == "targetTexture":
				buf.append('"{}" SET Sensors.RenderCamera alwaysOn true'.format(lnk['target']))
	
	buf.append('"{}" SET active true'.format(labelRoot))
	common.sendData(buf)

def strToSeg(s):
	return s.replace('+', ' ').replace('_', ' ').split(",")[0].split(" ")[0]

def getRandomColor(alpha='FF'):
	"""
	Generates a random color with configurable alpha channel value
	
	# Arguments
	
	alpha (hex string): Defines a alpha channel value (hex), defaults to `FF` (opaque)
	
	# Returns
	
	string
	"""
	s = '0123456789ABCDEF'
	o = ''
	for i in range(0,6):
		o += str(random.choice(s))
	
	return '#' + o + alpha

def setThermalProps(
	objs,
	
	heatinessMode=None, temperatureMode=None, ambientOffsetMode=None,
	reflectivityMode=None, varianceMode=None,
	
	heatiness=None, temperatureValue=None, temperatureBandwidth=None, temperatureMedian=None,
	ambientOffset=None, reflectivity=None, variance=None
):
	"""
	
	Changes parameters on a existing thermal profile override from a arbitrary object
	
	# Arguments
	
	objs (list|string): Object or list of objects path(s) containing a thermal profile
	
	heatinessMode (string): Override mode, defaults to `Absolute` when any parameter pertaining to it is set, otherwise don't touch the variable; Available modes are `Disabled`, `Relative`, `Absolute` and `Multiply`.
	temperatureMode (string): Override mode, defaults to `Absolute` when any parameter pertaining to it is set, otherwise don't touch the variable; Available modes are `Disabled`, `Relative`, `Absolute` and `Multiply`.
	ambientOffsetMode (string): Override mode, defaults to `Absolute` when any parameter pertaining to it is set, otherwise don't touch the variable; Available modes are `Disabled`, `Relative`, `Absolute` and `Multiply`.
	reflectivityMode (string): Override mode, defaults to `Absolute` when any parameter pertaining to it is set, otherwise don't touch the variable; Available modes are `Disabled`, `Relative`, `Absolute` and `Multiply`.
	varianceMode (string): Override mode, defaults to `Absolute` when any parameter pertaining to it is set, otherwise don't touch the variable; Available modes are `Disabled`, `Relative`, `Absolute` and `Multiply`.
	
	heatiness (float): Controls how much heat emission object is generating
	temperatureValue (float): Object absolute temperature, defaults to 30
	temperatureBandwidth (float): Affects how much the temperature affects the object body overall
	temperatureMedian (float): Affects how wide the temperature spread goes; ranges from 0 - 1
	ambientOffset (float): Temperature offset in relation to ambient (from camera watching); ranges from -25 to 25
	reflectivity (float): How reflective the object is for other infrared emissions; ranges from 0 - 1
	variance (float): Defines the fuzzyness of temperature variance across texturized objects
	
	# Note
	
	`ThermalObjectOverride` component expects a `ThermalObjectBehaviour` on the parent game object,
	you must have this added before adding the `ThermalObjectOverride`; If you have a override without
	profile, the component will not have and effect.
	
	Additionally, when changing the settings you should disable the container and the child (`objs`),
	then change the profile, and finally enable the child and container (in this order) to get maximum
	performance. This method will disable / enable the child but will not touch the container.
	
	"""
	
	# assert
	if not isinstance(objs, list):
		objs = [ objs ]
	if heatinessMode == None and heatiness != None:
		heatinessMode = 'Absolute'
	if temperatureMode == None and (temperatureValue != None or temperatureBandwidth != None or temperatureMedian != None):
		temperatureMode = 'Absolute'
	if ambientOffsetMode == None and ambientOffset != None:
		ambientOffsetMode = 'Absolute'
	if reflectivityMode == None and reflectivity != None:
		reflectivityMode = 'Absolute'
	if varianceMode == None and variance != None:
		varianceMode = 'Absolute'
	
	for obj in objs:
		s = ['"{}" SET Thermal.ThermalObjectOverride'.format(obj)]
		
		# modes
		if heatinessMode != None:
			s.append('heatinessMode "{}"'.format(heatinessMode))
		if temperatureMode != None:
			s.append('temperatureMode "{}"'.format(temperatureMode))
		if ambientOffsetMode != None:
			s.append('ambientOffsetMode "{}"'.format(ambientOffsetMode))
		if reflectivityMode != None:
			s.append('reflectivityMode "{}"'.format(reflectivityMode))
		if varianceMode != None:
			s.append('varianceMode "{}"'.format(varianceMode))
		
		# values
		if heatiness != None:
			s.append('overridedHeatiness.value {}'.format('{}~{}'.format(heatiness[0], heatiness[1]) if isinstance(heatiness, list) else heatiness))
		if reflectivity != None:
			s.append('overridedReflectivity.value {}'.format('{}~{}'.format(reflectivity[0], reflectivity[1]) if isinstance(reflectivity, list) else reflectivity))
		if ambientOffset != None:
			s.append('overridedAmbientOffset.value {}'.format('{}~{}'.format(ambientOffset[0], ambientOffset[1]) if isinstance(ambientOffset, list) else ambientOffset))
		if temperatureValue != None:
			s.append('overridedTemperature.value {}'.format('{}~{}'.format(temperatureValue[0], temperatureValue[1]) if isinstance(temperatureValue, list) else temperatureValue))
		if temperatureBandwidth != None:
			s.append('overridedTemperature.bandwidth {}'.format('{}~{}'.format(temperatureBandwidth[0], temperatureBandwidth[1]) if isinstance(temperatureBandwidth, list) else temperatureBandwidth))
		if temperatureMedian != None:
			s.append('overridedTemperature.median {}'.format('{}~{}'.format(temperatureMedian[0], temperatureMedian[1]) if isinstance(temperatureMedian, list) else temperatureMedian))
		if variance != None:
			s.append('overridedVariance.value {}'.format('{}~{}'.format(variance[0], variance[1]) if isinstance(variance, list) else variance))
		
		if len(s) > 1:
			common.sendData([
				'"{}" SET active false'.format(obj),
				' '.join(s),
				'"{}" SET active true'.format(obj)
			], read=False)
		else:
			raise 'No parameters changed'
	
	common.flushBuffer()

def humanSpawner(
		label='human_walker',
		goals=None,
		spawners=None,
		delay=[0.3, 3],
		speed=[0.5, 3],
		limit=20,
		goalThreshold=5,
		genderRestriction='None',
		container='container',
		prefix='spawner',
		segmentationClass='Human',
		requireThermalClothing=False,
		playRandomAnimations=None
	):
	"""
	Creates a human walker spawner.
	This requires a scene with a NavMesh, otherwise humans will be stuck on their spawning points.
	All human bodies and props are automatically randomized.
	
	# Arguments
	
	label (string): Defines a name for the spawner, defaults to `human_walker`, if you have multiple spawners of this type you should provide unique names.
	goals (list): Defines a list of goal triplets, Example: `[ [ x, y, z ], ... ]`, you must set at least one goal point
	spawners (list): Defines a list of spawners triplets, Example: `[ [ x, y, z ], ... ]`, you must set at least one spawn point
	delay (list): Defines min and max delay for the spawner, defaults to `[0.3, 3]`
	speed (list): Defines min and max walking speed for humans, defaults to `[0.5, 3]`
	limit (int): Defines the maximum active humans, defaults to `20`
	goalThreshold (list): Defines a threshold for goal points, defaults to `5`
	genderRestriction (string): Defines a gender restriction for human spawner, defaults to `None`, where possible options are `Female` and `Male`
	container (string): Defines a game object name / path where spawned humans will reside, those game objects are dynamic and will be cycled after reaching the goal. Defaults to `container`, when set to `None` will spawn on root.
	prefix (string): Defines a game object name / path where the human spawner game object and childs will be created, defaults to `spawner`
	segmentationClass (string): Defines a segmentation class for the spawned objects; Defaults to `Human`, disable this by setting it to `None`. Note that this will be bound to the `container`, if you set `container` to `None` this parameter will be ignored.
	playRandomAnimations (dict): A list of configurables and animations to be added to a playRandomAnimation component, defaults to `None`, example dictionary:
	
	```json
	{
		"animations": [
										'ASSET "Humans/content/common/animations/Waving" FROM "humans"',
										'ASSET "Humans/content/common/animations/Walking" FROM "humans"',
										'ASSET "Humans/content/common/animations/Running" FROM "humans"'
									],
		"minAnimationDuration": 1,
		"maxAnimationDuration": 5,
		"minDelayBetweenAnimations": 1,
		"maxDelayBetweenAnimations": 5,
		"animationFadeDuration": 0.4
	}
	
	```
	
	"""
	
	if goals == None or len(goals) == 0:
		raise Exception('No goals set')
	
	if spawners == None or len(spawners) == 0:
		raise Exception('No spawners set')
	
	buf = []
	
	# little fixy
	if prefix == None:
		prefix = ""
	else:
		prefix += "/"
	
	prefix += label + "/"
	
	buf.extend([
		'CREATE "{}"'.format(prefix[0:-1]),
		'CREATE "{}points"'.format(prefix),
		'CREATE "{}points/goals"'.format(prefix),
		'CREATE "{}points/spawners"'.format(prefix),
		'CREATE "{}humanSpawner"'.format(prefix),
		'CREATE "{}{}"'.format(prefix, container) if container != None else '',
		'"{}humanSpawner" SET active false'.format(prefix),
		'"{}humanSpawner" ADD Humans.Locomotion.WalkerSpawner'.format(prefix),
		'''"{}humanSpawner" SET Humans.Locomotion.WalkerSpawner
			minimumDelayBetweenSpawns {}
			maximumDelayBetweenSpawns {}
			minimumSpeed {}
			maximumSpeed {}
			maximumHumans {}
			arriveDistance {}
			genderRestriction "{}"
			requireThermalClothing {}
		'''.format(prefix, delay[0], delay[1], speed[0], speed[1], limit, goalThreshold, genderRestriction, 'true' if requireThermalClothing == True else 'false'),
		'"{}humanSpawner" SET Humans.Locomotion.WalkerSpawner container "{}{}"'.format(prefix, prefix, container) if container != None else '',
	])
	
	if container != None and segmentationClass != None:
		buf.extend([
			'"{}{}" ADD Segmentation.ClassGroup'.format(prefix, container),
			'"{}{}" SET Segmentation.ClassGroup itemsClassName "{}"'.format(prefix, container, segmentationClass)
		])
	
	i = 0
	for g in goals:
		buf.extend([
			'CREATE "{}points/goals/g_{}"'.format(prefix, i),
			'"{}points/goals/g_{}" SET Transform position ({} {} {})'.format(prefix, i, g[0], g[1], g[2]),
			'"{}points/goals/g_{}" SET active true'.format(prefix, i),
			'"{}humanSpawner" PUSH Humans.Locomotion.WalkerSpawner goalPoints "{}points/goals/g_{}"'.format(prefix, prefix, i)
		])
		i += 1
	
	i = 0
	for s in spawners:
		buf.extend([
			'CREATE "{}points/spawners/s_{}"'.format(prefix, i),
			'"{}points/spawners/s_{}" SET Transform position ({} {} {})'.format(prefix, i, s[0], s[1], s[2]),
			'"{}points/spawners/s_{}" ADD Humans.HumanSpawnPoint'.format(prefix, i),
			'"{}points/spawners/s_{}" SET active true'.format(prefix, i),
			'"{}humanSpawner" PUSH Humans.Locomotion.WalkerSpawner spawnPoints "{}points/spawners/s_{}"'.format(prefix, prefix, i)
		])
		i += 1
	
	if playRandomAnimations != None:
		s = [ '"{}humanSpawner" SET Humans.Animation.PlayRandomAnimations'.format(prefix) ]
		a = []
		
		for k in playRandomAnimations:
			if k == 'animations':
				a.push(playRandomAnimations[k])
			else:
				s.push('{} {}'.format(k, playRandomAnimations[k]))
		
		buf.append('"{}humanSpawner" ADD Humans.Animation.PlayRandomAnimations'.format(prefix))
		
		if len(s) > 1:
			buf.append(' '.join(s))
		if len(a) > 0:
			buf.append('"{}humanSpawner" PUSH Humans.Animation.PlayRandomAnimations {}'.format(prefix, ' '.join(a)))
	
	buf.extend([
		'"{}humanSpawner" SET active true'.format(prefix),
		'"{}points/goals" SET active true'.format(prefix),
		'"{}points/spawners" SET active true'.format(prefix),
		'"{}{}" SET active true'.format(prefix, container) if container != None else '',
		'"{}points" SET active true'.format(prefix),
		'"{}" SET active true'.format(prefix[0:-1])
	])
	
	common.sendData(buf)

def spawner(
	types=[], tags=None, scale=[1,1,1], position=[0,0,0],
	rotation=[0,0,0], limit=50, segmentationClass=None, orbit=False,
	stickToGround=False, collisionCheck=True, suffix="", flush=False, prefix='spawner', container='container',
	names=None, uglyFix=True, seed=None, randomColors=None, randomColorsWeights=14,
	method=None, methodParameters=None, minDistance=None, maxDistance=None,
	partsNames=None, autoSegment=False, thermalObjectBehaviour=None, thermalObjectOverride=False
):
	"""
	Creates a torus shaped object spawner
	
	# Arguments
	
	types (list): List of names for spawned objects
	tags (list): List of object tags to be spawned, this should align with the number of arguments on types
	scale (list): X,Y,Z scale factor, defaults to `[1,1,1]`, if a list of list with size 2 is sent, assumes it's a range for random values, for example: `[[1,5], [1,2], 1]` this can work per dimension.
	position (list): X,Y,Z position of radius spawner, if a list of list with size 2 is sent, assumes it's a range for random values, for example: `[[1,5], [1,2], 1]` this can work per dimension.
	rotation (list): X,Y,Z rotation position of radius spawner, if a list of list with size 2 is sent, assumes it's a range for random values, for example: `[[1,5], [1,2], 1]` this can work per dimension.
	limit (int|list): Number of objects to spawn in each of the `types`, when a `list` type is sent, the api range randomizer will be used
	segmentationClass (list): Defines segmentation classes to be bound to the spawner, this must align with the number of arguments on types, defaults to `None`
	orbit (bool): Adds orbiting component to spawner
	stickToGround (bool): Forces spawned objects to stick to ground, ideal for irregular ground. defaults to `False`
	collisionCheck (bool): Avoids objects from being spawned overlapping eachother and other objects in the scene, defaults to `True`
	suffix (string): Adds a suffix string on types
	flush (bool): Forces a telnet queue flush after spawning, defaults to `False`
	prefix (string): Defines a root game object to nest types into, defaults to `spawner`
	container (string): Defines a container object name nested within `type`, defaults to `container`
	names (list): Overrides type caption, must be aligned with the number of arguments on types, defaults to `None`
	uglyFix (bool): Ugly fix for asset naming, defaults to `True`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None` - WARNING: You shouldn't use this unless you want to seed this specific run, it's better to use the global seed via the command line argument if you want to create reproducible results.
	randomColors (int): Defines a number of random colors to assign to spawner, when set to None disables feature, defaults to `None`, when set to `True` goes full random instead of predefined defined random colors
	randomColorsWeights (int): Defines a weight for color switching, defaults to `14`
	method (string): Defines spawner method, defaults to `None`
	methodParameters (dict): Defines method's parameters, defaults to `None`, when a `list` type is sent on the parameter value, the api range randomizer will be used
	minDistance (int|list): defines a minimum distance within spawned objects, when a `list` type is sent, the api range randomizer will be used
	maxDistance (int|list): defines a maximum distance within spawned objects, when a `list` type is sent, the api range randomizer will be used
	partsNames (string): Defines a list of parts to be colorized, defaults to `None`
	autoSegment (bool): Automatically segment objects based on types or tags given, defaults to `False`
	thermalObjectBehaviour (string|bool): Defines a thermal profile; Note that this will be added to the second level component allowing for a `thermalObjectOverride` to be placed at the `container`; defaults to `None`, when set to `True` will use `DefaultThermalProfile`
	thermalObjectOverride (bool): Adds a thermalObjectOverride component to the `container`. You must have `thermalObjectBehaviour` on the parent object in order for this work; Defaults to `False`
	
	"""
	
	# convert bool to strings
	if collisionCheck == True:
		collisionCheck = 'true'
	else:
		collisionCheck = 'false'
	
	if stickToGround == True:
		stickToGround = 'true'
	else:
		stickToGround = 'false'
	
	if thermalObjectBehaviour != None and isinstance(thermalObjectBehaviour, bool) and thermalObjectBehaviour == True:
		thermalObjectBehaviour = 'DefaultThermalProfile'
	
	# loop each of the types
	i = 0
	for t in types:
		if names == None:
			n = t.replace(' ', '_').replace('+', '_').replace('-', '_').replace(',', '_') + suffix
		else:
			n = names[i]
		
		obj = '{}/{}/{}'.format(prefix, n, container)
		
		common.sendData([
			'CREATE "{}"'.format(obj),
			'"{}" SET active false'.format(obj),
			
			'"{}" ADD RandomProps.{}'.format(obj, method) if method != None else '',
			'"{}" ADD RandomProps.PropArea'.format(obj)
		], read=False)
		
		# NOTE: This is added to the parent object, not container
		if thermalObjectBehaviour != None:
			common.sendData([
			'"{}/{}" ADD Thermal.ThermalObjectBehaviour'.format(prefix, n),
			'"{}/{}" SET Thermal.ThermalObjectBehaviour profile "{}"'.format(prefix, n, thermalObjectBehaviour)
			], read=False)
		
		# NOTE: This is added to the container object and will propagate thuru spawned childs
		if thermalObjectOverride == True:
			common.sendData([
				'"{}" ADD Thermal.ThermalObjectOverride'.format(obj)
			], read=False)
		
		# this will apply a global seed, it's recommended to do this on the startup
		# of the simulation session instead of doing it at random points on the code
		# you can do this by sending --seed_api parameter.
		if seed != None:
			common.sendData(['"RandomProps.Random.instance" SET seed {}'.format(seed)], read=False)
		
		if uglyFix == True:
			try:
				common.sendData(['"{}" SET RandomProps.PropArea tags "{}"'.format(obj, uglyTagFix(tags[i]))], read=False)
			except:
				common.sendData(['"{}" SET RandomProps.PropArea tags "{}"'.format(obj, uglyTagFix(t))], read=False)
		else:
			common.sendData(['"{}" SET RandomProps.PropArea tags "{}"'.format(obj, tags[i])], read=False)
		
		if minDistance != None:
			common.sendData([
				'"{}" SET RandomProps.Frustum minDistance {}'.format(obj, '{}~{}'.format(minDistance[0], minDistance[1]) if isinstance(minDistance, list) else minDistance)
			], read=False)
		
		if maxDistance != None:
			common.sendData([
				'"{}" SET RandomProps.Frustum maxDistance {}'.format(obj, '{}~{}'.format(maxDistance[0], maxDistance[1]) if isinstance(maxDistance, list) else maxDistance)
			], read=False)
		
		common.sendData([
			'''"{}" SET RandomProps.PropArea
				async false
				numberOfProps {}
				collisionCheck {}
				stickToGround {}
			'''.format(
				obj, '{}~{}'.format(limit[0], limit[1]) if isinstance(limit, list) else limit,
				collisionCheck, stickToGround
			)
		], read=False)
		
		if method != None and methodParameters != None:
			for key in methodParameters:
				common.sendData('"{}" SET RandomProps.{} {} {}'.format(
					obj, method, key,
					'{}~{}'.format(methodParameters[key][0], methodParameters[key][1]) if isinstance(methodParameters[key], list) else methodParameters[key]
				), read=False)
		
		if position != None or scale != None or rotation != None:
			common.sendData([
				'"{}" SET Transform {} {} {}'.format(
					obj,
					'position ({} {} {})'.format(
						'{}~{}'.format(position[0][0], position[0][1]) if isinstance(position[0], list) else position[0],
						'{}~{}'.format(position[1][0], position[1][1]) if isinstance(position[1], list) else position[1],
						'{}~{}'.format(position[2][0], position[2][1]) if isinstance(position[2], list) else position[2]
					) if position != None else '',
					'eulerAngles ({} {} {})'.format(
						'{}~{}'.format(rotation[0][0], rotation[0][1]) if isinstance(rotation[0], list) else rotation[0],
						'{}~{}'.format(rotation[1][0], rotation[1][1]) if isinstance(rotation[1], list) else rotation[1],
						'{}~{}'.format(rotation[2][0], rotation[2][1]) if isinstance(rotation[2], list) else rotation[2]
					) if rotation != None else '',
					'localScale ({} {} {})'.format(
						'{}~{}'.format(scale[0][0], scale[0][1]) if isinstance(scale[0], list) else scale[0],
						'{}~{}'.format(scale[1][0], scale[1][1]) if isinstance(scale[1], list) else scale[1],
						'{}~{}'.format(scale[2][0], scale[2][1]) if isinstance(scale[2], list) else scale[2]
					) if scale != None else ''
				)
			], read=False)
		
		if segmentationClass == None and autoSegment == True:
			segmentationClass = strToSeg(tags[0]) if tags != None else strToSeg(t)
		
		if segmentationClass != None:
			if isinstance(segmentationClass, list):
				common.sendData([
					'"{}" ADD Segmentation.ClassGroup'.format(obj),
					'"{}" SET Segmentation.ClassGroup itemsClassName "{}"'.format(obj, segmentationClass[i])
				], read=False)
			else:
				common.sendData([
					'"{}" ADD Segmentation.ClassGroup'.format(obj),
					'"{}" SET Segmentation.ClassGroup itemsClassName "{}"'.format(obj, segmentationClass)
				], read=False)
		
		if orbit == True:
			common.sendData('"cameras" SET Orbit target "{}"'.format(obj), read=False)
		
		if randomColors != None:
			if randomColors == True:
				addRandomColor(
					objs='{}'.format(obj), colors=0, colorsWeights=randomColorsWeights,
					spawner=True, method='Random', partsNames=partsNames
				)
			else:
				addRandomColor(
					objs='{}'.format(obj), colors=randomColors, colorsWeights=randomColorsWeights,
					spawner=True, partsNames=partsNames
				)
		
		common.sendData('"{}" SET active true'.format(obj))
		common.sendData('"{}/{}" SET active true'.format(prefix, n))
		
		settings._obj.append('{}'.format(obj))
		i = i + 1
	
	if flush:
		common.flushBuffer()

def spawnRadiusGeneric(
	types=[], tags=None, scale=[1,1,1], innerradius=0, radius=500, position=[0,0,0],
	rotation=[0,0,0], limit=50, segmentationClass=None, orbit=False,
	stickToGround=False, collisionCheck=True, suffix="", flush=False, prefix='spawner', container='container',
	names=None, uglyFix=True, seed=None, randomColors=None, randomColorsWeights=14,
	partsNames=None, autoSegment=False, thermalObjectBehaviour=None, thermalObjectOverride=False
):
	"""
	Creates a torus shaped object spawner
	
	# Arguments
	
	types (list): List of names for spawned objects
	tags (list): List of object tags to be spawned, this should align with the number of arguments on types
	scale (list): X,Y,Z scale factor, defaults to `[1,1,1]`, if a list of list with size 2 is sent, assumes it's a range for random values, for example: `[[1,5], [1,2], 1]` this can work per dimension.
	innerradius (float|list): Defines a innerradius exclusion area, defaults to `0`, when a `list` type is sent, the api range randomizer will be used
	radius (float|list): Defines torus radius, defaults to `500`, when a `list` type is sent, the api range randomizer will be used
	position (list): X,Y,Z position of radius spawner, if a list of list with size 2 is sent, assumes it's a range for random values, for example: `[[1,5], [1,2], 1]` this can work per dimension.
	rotation (list): X,Y,Z rotation position of radius spawner, if a list of list with size 2 is sent, assumes it's a range for random values, for example: `[[1,5], [1,2], 1]` this can work per dimension.
	limit (int|list): Number of objects to spawn in each of the `types`, when a `list` type is sent, the api range randomizer will be used
	segmentationClass (list): Defines segmentation classes to be bound to the spawner, this must align with the number of arguments on types, defaults to `None`
	orbit (bool): Adds orbiting component to spawner
	stickToGround (bool): Forces spawned objects to stick to ground, ideal for irregular ground. defaults to `False`
	collisionCheck (bool): Avoids objects from being spawned overlapping eachother and other objects in the scene, defaults to `True`
	suffix (string): Adds a suffix string on types
	flush (bool): Forces a telnet queue flush after spawning, defaults to `False`
	prefix (string): Defines a root game object to nest types into, defaults to `spawner`
	container (string): Defines a container object name nested within `type`, defaults to `container`
	names (list): Overrides type caption, must be aligned with the number of arguments on types, defaults to `None`
	uglyFix (bool): Ugly fix for asset naming, defaults to `True`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None` - WARNING: You shouldn't use this unless you want to seed this specific run, it's better to use the global seed via the command line argument if you want to create reproducible results.
	randomColors (int): Defines a number of random colors to assign to spawner, when set to None disables feature, defaults to `None`
	randomColorsWeights (int): Defines a weight for color switching, defaults to `14`
	partsNames (string): Defines a list of parts to be colorized, defaults to `None`
	autoSegment (bool): Automatically segment objects based on types or tags given, defaults to `False`
	thermalObjectBehaviour (string|bool): Defines a thermal profile; Note that this will be added to the second level component allowing for a `thermalObjectOverride` to be placed at the `container`; defaults to `None`, when set to `True` will use `DefaultThermalProfile`
	thermalObjectOverride (bool): Adds a thermalObjectOverride component to the `container`. You must have `thermalObjectBehaviour` on the parent object in order for this work; Defaults to `False`
	
	"""
	return spawner(
		types=types, tags=tags, scale=scale, position=position,
		rotation=rotation, limit=limit, segmentationClass=segmentationClass, orbit=orbit,
		stickToGround=stickToGround, collisionCheck=collisionCheck, suffix=suffix, flush=flush, prefix=prefix, container=container,
		names=names, uglyFix=uglyFix, seed=seed, randomColors=randomColors, randomColorsWeights=randomColorsWeights,
		method='Torus', methodParameters={'innerRadius': innerradius, 'radius': radius},
		partsNames=partsNames, thermalObjectBehaviour=thermalObjectBehaviour, thermalObjectOverride=thermalObjectOverride
	)

def spawnRectangleGeneric(
	types=[], tags=None, scale=[1,1,1], a=1, b=500, position=[0,0,0],
	rotation=[0,0,0], limit=50, segmentationClass=None, orbit=False,
	stickToGround=False, collisionCheck=True, suffix="", flush=False, prefix='spawner', container='container',
	names=None, uglyFix=True, seed=None, randomColors=None, randomColorsWeights=14,
	partsNames=None, autoSegment=False, thermalObjectBehaviour=None, thermalObjectOverride=False
):
	"""
	Creates a rectangle shaped object spawner
	
	# Arguments
	
	types (list): List of names for spawned objects
	tags (list): List of object tags to be spawned, this should align with the number of arguments on types
	scale (list): X,Y,Z scale factor, defaults to `[1,1,1]`, if a list of list with size 2 is sent, assumes it's a range for random values, for example: `[[1,5], [1,2], 1]` this can work per dimension.
	a (float|list): Side A size, defaults to `1`, when a `list` type is sent, the api range randomizer will be used
	b (float|list): Side B size, defaults to `500`, when a `list` type is sent, the api range randomizer will be used
	position (list): X,Y,Z position of radius spawner, if a list of list with size 2 is sent, assumes it's a range for random values, for example: `[[1,5], [1,2], 1]` this can work per dimension.
	rotation (list): X,Y,Z rotation position of radius spawner, if a list of list with size 2 is sent, assumes it's a range for random values, for example: `[[1,5], [1,2], 1]` this can work per dimension.
	limit (int|list): Number of objects to spawn in each of the `types`, when a `list` type is sent, the api range randomizer will be used
	segmentationClass (list): Defines segmentation classes to be bound to the spawner, this must align with the number of arguments on types, defaults to `None`
	orbit (bool): Adds orbiting component to spawner
	stickToGround (bool): Forces spawned objects to stick to ground, ideal for irregular ground. defaults to `False`
	collisionCheck (bool): Avoids objects from being spawned overlapping eachother and other objects in the scene, defaults to `True`
	suffix (string): Adds a suffix string on types
	flush (bool): Forces a telnet queue flush after spawning, defaults to `False`
	prefix (string): Defines a root game object to nest types into, defaults to `spawner`
	container (string): Defines a container object name nested within `type`, defaults to `container`
	names (list): Overrides type caption, must be aligned with the number of arguments on types, defaults to `None`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None` - WARNING: You shouldn't use this unless you want to seed this specific run, it's better to use the global seed via the command line argument if you want to create reproducible results.
	randomColors (int): Defines a number of random colors to assign to spawner, when set to None disables feature, defaults to `None`
	randomColorsWeights (int): Defines a weight for color switching, defaults to `14`
	partsNames (string): Defines a list of parts to be colorized, defaults to `None`
	autoSegment (bool): Automatically segment objects based on types or tags given, defaults to `False`
	thermalObjectBehaviour (string|bool): Defines a thermal profile; Note that this will be added to the second level component allowing for a `thermalObjectOverride` to be placed at the `container`; defaults to `None`, when set to `True` will use `DefaultThermalProfile`
	thermalObjectOverride (bool): Adds a thermalObjectOverride component to the `container`. You must have `thermalObjectBehaviour` on the parent object in order for this work; Defaults to `False`
	
	"""
	
	if a <= 0 or b <= 0:
		raise 'Invalid rectangle size'
	
	return spawner(
		types=types, tags=tags, scale=scale, position=position,
		rotation=rotation, limit=limit, segmentationClass=segmentationClass, orbit=orbit,
		stickToGround=stickToGround, collisionCheck=collisionCheck, suffix=suffix, flush=flush, prefix=prefix, container=container,
		names=names, uglyFix=uglyFix, seed=seed, randomColors=randomColors, randomColorsWeights=randomColorsWeights,
		method='Rectangle', methodParameters={'size': '({} {})'.format(a,b)}, partsNames=partsNames,
		thermalObjectBehaviour=thermalObjectBehaviour, thermalObjectOverride=thermalObjectOverride
	)

def spawnFlatGrid(types=[], size=[1000,1000], position=[0,0,0], scale=[1,1,1], prefix='spawner'):
	"""
	Creates a flat grid shaped object spawner
	
	# Arguments
	
	types (list): List of names for spawned objects
	size (list): X,Y size of grid, defaults to `[1000, 1000]`
	scale (list): X,Y,Z scale factor, defaults to `[1,1,1]`
	position (list): X,Y,Z position of rectangle spawner
	rotation (list): X,Y,Z rotation position of rectangle spawner
	prefix (string): Defines a root game object to nest types into, defaults to `spawner`
	
	# Note
	
	This function is not a part of the api spawning system, it's a simple grid object
	creator based on positional arguments.
	
	"""
	
	for t in types:
		n = t.replace(' ', '_')
		
		common.sendData([
			'CREATE "{}/{}"'.format(prefix, n),
			'"{}/{}" SET active false'.format(prefix, n),
			'"{}/{}" ADD RandomProps.FillGrid'.format(prefix, n),
			'"{}/{}" SET Transform position ({} {} {})'.format(prefix, n, position[0], position[1], position[2]),
			'"{}/{}" SET RandomProps.FillGrid tags "{}"'.format(prefix, n, uglyTagFix(n)),
			'"{}/{}" SET RandomProps.FillGrid size ({} {})'.format(prefix, n, size[0], size[1]),
			'"{}/{}" SET active true'.format(prefix, n),
			'"{}/{}" SET Transform localScale ({} {} {})'.format(prefix, n, scale[0], scale[1], scale[2])
		], read=False)
		
		settings._obj.append('{}/{}'.format(prefix, t))
	
	common.flushBuffer()

def spawnParkingLot(
	limit, fixed=False, distH=8, distV=3, distLimit=30,
	pX=-15, pZ=-30, pY=-5, prefix='cars', segment='Car'
):
	"""
	Creates a parking lot using a list of cars
	
	# Arguments
	
	limit (int): Number of objects to spawn in each of the `types`
	fixed (bool): Sets if script should follow cars_lst instead of picking a random car from the available assets, defaults to `False`
	distH (int): Horizontal distance, defaults to `8`
	distV (int): Vertical distance, defaults to `3`
	distLimit (int): Distance limit, defaults to `30`
	
	pX (float): Starting X coordintate, defaults to `-15`
	pY (float): Starting Y coordintate, defaults to `-5`
	pZ (float): Starting Z coordintate, defaults to `-30`
	
	prefix (string): Defines a root game object to nest types into, defaults to `cars`
	segment (string): Defines a segmentation class, defaults to `Car`
	
	# Note
	
	This function is not a part of the api spawning system, it's a simple grid object
	creator based on positional arguments.
	
	"""
	k = 0
	idx = 0
	j = len(cars_lst)
	
	while k < limit:
		if fixed:
			if idx >= j:
				idx = 0
			
			carID = '{}/{}'.format(cars_lst[idx],cars_lst[idx])
			idx = idx + 1
		else:
			carID = '?'
		
		common.sendData([
			'CREATE "Cars/{}" FROM "cars" AS "{}/car_{}"'.format(carID, prefix, k),
			'"{}/car_{}" ADD Segmentation.ClassGroup'.format(prefix, k),
			'"{}/car_{}" SET Segmentation.ClassGroup itemsClassName "{}"'.format(prefix, k, segment),
			'"{}/car_{}" SET Transform position ({} {} {})'.format(prefix, k, pX + settings.X_COMP, pY, pZ + settings.Z_COMP),
			'"{}/car_{}" SET active true'.format(prefix, k)
		], read=False)
		
		settings._obj.append('{}/car_{}'.format(prefix, k))
		k += 1
		pZ += distH
		
		if pZ > distLimit:
			pZ = -distLimit
			pX += distV
	
	common.flushBuffer()

def spawnMiscObjs(destroy=False, prefix='spawner', container='container', seed=None):
	"""
	Spawns city / animals / cars objects
	
	# Attributes
	
	destroy (bool): Destroy objects before creating them, defaults to `False`
	prefix (string): Spawner root object where spawned objects will be nested within, defaults to `spawner`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None` - WARNING: You shouldn't use this unless you want to seed this specific run, it's better to use the global seed via the command line argument if you want to create reproducible results.
	
	"""
	if destroy == True:
		common.sendData([
			'DELETE "{}/city"'.format(prefix),
			'DELETE "{}/animals"'.format(prefix),
			'DELETE "{}/cars"'.format(prefix)
		], read=False)
		
		common.flushBuffer()
	
	spawnRadiusGeneric(['city/nature/trees'], tags=['tree'], container=container, collisionCheck=False, limit=[100, 350], radius=80, innerradius=[30, 50], position=[0,10,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['city/signs'], tags=['sign'], container=container, limit=[80, 250], radius=[15, 40], innerradius=0, position=[0,10,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['animals'], tags=['animals'], container=container, limit=[150, 250], radius=[40, 80], innerradius=0, position=[0,10,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['city/buildings'], tags=['building'], container=container, limit=[50, 150], radius=335, innerradius=[80, 100], position=[0,10,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['cars'], tags=['car'], limit=[50, 150], container=container, radius=50, innerradius=0, segmentationClass="Car", orbit=True, position=[0,10,0], prefix=prefix, seed=seed)

	spawnRadiusGeneric(['city/ground'], tags=['ground'], container=container, suffix='_0', limit=3, radius=75, innerradius=0, scale=[1,1,1], position=[0,0,0], collisionCheck=False, prefix=prefix, seed=seed)

def spawnDroneObjs(
	destroy=False, ground_position=[84,0,0], groundLimit=0,
	distH=25, distV=25, distLimit=150, pX=-150, pZ=-350, pY=0,
	birdsRadius=120, birdsInnerRadius=0, carsRadius=50, carsInnerRadius=5,
	treesLimit=[150,200], buildingsRadius=120, buildingsInnerRadius=60, treesRadius=80, treesInnerRadius=10,
	buildingsLimit=[150,150], birdsLimit=[25,100], carsLimit=[75,75], dronesLimit=[80,200], prefix='spawner', container='container',
	treesTags=['tree'], buildingsTags=['building'], birdsTags=['bird'], carsTags=['car'], dronesTags=['drones'],
	trees_colors=None, buildings_colors=None, birds_colors=None, cars_colors=None, dronesColors=None,
	treesPartsNames=None, buildingsPartsNames=None, birdsPartsNames=None, carsPartsNames=None, dronesPartsNames=None,
	groundSegment=None, treesSegment=None, buildingsSegment=None, birdsSegment=None, carsSegment=None, dronesSegment='DRONE',
	birdsThermalObjectBehaviour=None, treesThermalObjectBehaviour=None, buildingsThermalObjectBehaviour=None, carsThermalObjectBehaviour=None, groundThermalObjectBehaviour=None, dronesThermalObjectBehaviour=None,
	humansThermalObjectBehaviour=None, signsThermalObjectBehaviour=None, cityThermalObjectBehaviour=None,
	seed=None
):
	"""
	Spawns trees / buildings / birds / donres and cars objects
	
	# Attributes
	
	destroy (bool): Destroy objects before creating them, defaults to `False`
	prefix (string): Spawner root object where spawned objects will be nested within, defaults to `spawner`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None` - WARNING: You shouldn't use this unless you want to seed this specific run, it's better to use the global seed via the command line argument if you want to create reproducible results.
	"""
	if destroy == True:
		common.sendData([
			'DELETE "{}/city/nature/trees"'.format(prefix),
			'DELETE "{}/city/buildings"'.format(prefix),
			'DELETE "{}/animals/birds"'.format(prefix),
			'DELETE "{}/drones"'.format(prefix),
			'DELETE "{}/cars"'.format(prefix)
		], read=False)
	elif groundLimit > 0:
		k = 0
		idx = 0
		
		common.sendData([
			'CREATE "city"',
			'"city" SET Transform position ({} {} {})'.format(ground_position[0], ground_position[1], ground_position[2]),
			'"city" SET active false'
		], read=False)
		
		while k < groundLimit:
			common.sendData([
				'CREATE city/ground_{}" city/ground/{}'.format(k, random.choice(ground_lst)),
				'"city/ground_{}" SET Transform position ({} {} {})'.format(k, pX + settings.X_COMP, pY, pZ + settings.Z_COMP),
				'"city/ground_{}" SET Transform localScale ({} {} {})'.format(k, 3, 3, 3),
				'"city/ground_{}" SET active true'.format(k)
			], read=False)
			settings._obj.append('city/ground_{}'.format(k))
			k += 1
			pZ += distH
			
			if pZ > distLimit:
				pZ = -distLimit
				pX += distV
	
	if groundSegment != None:
		common.sendData([
			'"{}" ADD Segmentation.ClassGroup'.format('city'),
			'"{}" SET Segmentation.ClassGroup itemsClassName "{}"'.format('city', groundSegment)
		])
	
	spawnRadiusGeneric(['city/ground'], tags=['ground'], limit=300, radius=150, innerradius=0, scale=[3,3,3], position=[0,0,0], collisionCheck=False, prefix=prefix, seed=seed, thermalObjectBehaviour=groundThermalObjectBehaviour, thermalObjectOverride=True if groundThermalObjectBehaviour != None else False)
	spawnRadiusGeneric(['humans'], tags=['human, +random'], suffix='_0', limit=40, radius=30, innerradius=2, position=[0,0,0], collisionCheck=False, prefix=prefix, seed=seed, thermalObjectBehaviour=humansThermalObjectBehaviour, thermalObjectOverride=True if humansThermalObjectBehaviour != None else False)
	spawnRadiusGeneric(['city/nature/trees'], partsNames=treesPartsNames, segmentationClass=treesSegment, randomColors=trees_colors, tags=treesTags, collisionCheck=False, limit=random.randint(treesLimit[0], treesLimit[1]), radius=treesRadius, innerradius=treesInnerRadius, position=[0,0,0], prefix=prefix, seed=seed, thermalObjectBehaviour=treesThermalObjectBehaviour, thermalObjectOverride=True if treesThermalObjectBehaviour != None else False)
	spawnRadiusGeneric(['city/buildings'], partsNames=buildingsPartsNames, segmentationClass=buildingsSegment, randomColors=buildings_colors, tags=buildingsTags, stickToGround=False, collisionCheck=False, limit=random.randint(buildingsLimit[0], buildingsLimit[1]), radius=buildingsRadius, innerradius=buildingsInnerRadius, position=[0,0,0], prefix=prefix, seed=seed, thermalObjectBehaviour=buildingsThermalObjectBehaviour, thermalObjectOverride=True if buildingsThermalObjectBehaviour != None else False)

#	spawnRadiusGeneric(['buildings_001'], partsNames=buildingsPartsNames, segmentationClass=buildingsSegment, randomColors=buildings_colors, tags=buildingsTags, stickToGround=False, collisionCheck=False, limit=random.randint(buildingsLimit[0], buildingsLimit[1]), radius=buildingsRadius, innerradius=buildingsInnerRadius, position=[0,0,0], prefix=prefix, seed=seed)
#	spawnRadiusGeneric(['buildings_002'], partsNames=buildingsPartsNames, segmentationClass=buildingsSegment, randomColors=buildings_colors, tags=buildingsTags, stickToGround=False, collisionCheck=False, limit=random.randint(buildingsLimit[0], buildingsLimit[1]), radius=buildingsRadius, innerradius=buildingsInnerRadius, position=[0,0,0], prefix=prefix, seed=seed)
#	spawnRadiusGeneric(['buildings_003'], partsNames=buildingsPartsNames, segmentationClass=buildingsSegment, randomColors=buildings_colors, tags=buildingsTags, stickToGround=False, collisionCheck=False, limit=random.randint(buildingsLimit[0], buildingsLimit[1]), radius=buildingsRadius, innerradius=buildingsInnerRadius, position=[0,0,0], prefix=prefix, seed=seed)

	spawnRadiusGeneric(['animals/birds'], partsNames=birdsPartsNames, container=container, segmentationClass=birdsSegment, randomColors=birds_colors, tags=birdsTags, limit=random.randint(birdsLimit[0], birdsLimit[1]), radius=birdsRadius, innerradius=birdsInnerRadius, position=[0,random.randint(15,95),0], prefix=prefix, seed=seed, thermalObjectBehaviour=birdsThermalObjectBehaviour, thermalObjectOverride=True if birdsThermalObjectBehaviour != None and not any('thermal' in s for s in birdsTags) and birdsLimit[1] > 0else False)
	spawnRadiusGeneric(['cars'], partsNames=carsPartsNames, container=container, segmentationClass=carsSegment, randomColors=cars_colors, tags=carsTags, collisionCheck=False, limit=random.randint(carsLimit[0], carsLimit[1]), radius=carsRadius, innerradius=carsInnerRadius, position=[0,0,0], prefix=prefix, seed=seed, thermalObjectBehaviour=carsThermalObjectBehaviour, thermalObjectOverride=True if carsThermalObjectBehaviour != None and not any('thermal' in s for s in carsTags) and carsLimit[1] > 0 else False)
	spawnRadiusGeneric(['roadsigns'], tags=['roadsign'], container=container, limit=250, radius=80, collisionCheck=False, innerradius=15, position=[0,0,0], prefix=prefix, seed=seed, thermalObjectBehaviour=signsThermalObjectBehaviour, thermalObjectOverride=True if signsThermalObjectBehaviour != None else False)
	
	if dronesLimit[1] > 0:
		# spawnRadiusGeneric(['drones'], segmentationClass=dronesSegment, randomColors=dronesColors, tags=dronesTags, uglyFix=False, limit=random.randint(dronesLimit[0], dronesLimit[1]), radius=random.randint(30,50), innerradius=0, position=[0,0,0], prefix=prefix, seed=seed)
		spawner(
			['drones'], segmentationClass=dronesSegment, partsNames=dronesPartsNames, randomColors=dronesColors, tags=dronesTags, uglyFix=False, limit=random.randint(dronesLimit[0], dronesLimit[1]),
			# prefix=prefix,
			# position=[0,0,0],
			position=None,
			prefix='cameras/spawner',
			seed=seed,
			container=container,
			method='Frustum',
			methodParameters={'cam': '"cameras/cameraRGB"', 'scaleBack': 0.25, 'allowEdge': 'false'},
			minDistance=2,
			maxDistance=6,
			thermalObjectBehaviour=dronesThermalObjectBehaviour,
			thermalObjectOverride=True if groundThermalObjectBehaviour != None and not any('thermal' in s for s in dronesTags) and dronesLimit[1] > 0 else False
		)
	
	if groundLimit > 0:
		if cityThermalObjectBehaviour != None:
			common.sendData([
				'"city" ADD Thermal.ThermalObjectBehaviour',
				'"city" SET Thermal.ThermalObjectBehaviour profile "{}"'.format(cityThermalObjectBehaviour)
			], read=False)
		
		common.sendData([
			'"city" SET active true'
		], read=True)

def spawnDroneObjs_alt(
	destroy=False, groundLimit=204,
	distH=120, distV=120, distLimit=1000,
	pX=-20, pZ=-1000, pY=0, prefix='spawner', container='container',
	seed=None
):
	if destroy == True:
		common.sendData([
			'DELETE "{}/city/nature/trees"'.format(prefix),
			'DELETE "{}/city/buildings"'.format(prefix),
			'DELETE "{}/animals/birds"'.format(prefix),
			'DELETE "{}/drones"'.format(prefix),
			'DELETE "{}/cars"'.format(prefix)
		], read=False)
	else:
		k = 0
		idx = 0
		
		while k < groundLimit:
			common.sendData([
				'CREATE "city/ground_{}" city/ground/{}'.format(k, random.choice(ground_lst)),
				'"city/ground_{}" SET Transform position ({} {} {})'.format(k, pX + settings.X_COMP, pY, pZ + settings.Z_COMP),
				'"city/ground_{}" SET Transform localScale ({} {} {})'.format(k, 12, 12, 12),
				'"city/ground_{}" SET active true'.format(k)
			], read=False)
			settings._obj.append('city/ground_{}'.format(k))
			k += 1
			pZ += distH
			
			if pZ > distLimit:
				pZ = -distLimit
				pX += distV
	
	spawnRadiusGeneric(
		['city/nature/trees'],
		tags=['tree'],
		limit=[600,600],
		radius=80,
		innerradius=30,
		position=[0,0,0],
		collisionCheck=False,
		prefix=prefix,
		container=container,
		seed=seed
	)
	
	spawnRadiusGeneric(
		['city/buildings'],
		tags=['building'],
		limit=10,
		radius=335,
		innerradius=100,
		position=[0,0,0],
		collisionCheck=False,
		prefix=prefix,
		container=container,
		seed=seed
	)
	
	spawnRadiusGeneric(
		['animals/birds'],
		tags=['bird'],
		limit=10,
		radius=[80, 110],
		innerradius=0,
		position=[0, [15, 95], 0],
		prefix=prefix,
		container=container,
		seed=seed
	)
	
	spawnRadiusGeneric(
		['cars'],
		tags=['car'],
		limit=[5, 10],
		radius=50,
		innerradius=5,
		position=[0,0,0],
		prefix=prefix,
		container=container,
		seed=seed
	)
	
	spawnRadiusGeneric(
		['drones/white'],
		limit=[80,80],
		radius=[80, 110],
		innerradius=0,
		position=[0, [15, 65], 0],
		segmentationClass="Car",
		prefix=prefix,
		container=container,
		seed=seed
	)
	
	common.flushBuffer()

def spawnAnimalsObjs(destroy=False, prefix='spawner', container='container', seed=None):
	"""
	Spawns trees and animals
	
	# Attributes
	
	destroy (bool): Destroy objects before creating them, defaults to `False`
	prefix (string): Spawner root object where spawned objects will be nested within, defaults to `spawner`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None` - WARNING: You shouldn't use this unless you want to seed this specific run, it's better to use the global seed via the command line argument if you want to create reproducible results.
	"""
	if destroy == True:
		common.sendData([
			'DELETE "{}/city"'.format(prefix),
			'DELETE "{}/animals"'.format(prefix)
		], read=False)
	
	spawnRadiusGeneric(
		['city/nature/trees'],
		tags=['tree'],
		collisionCheck=True,
		stickToGround=True,
		limit=[150, 400],
		radius=80,
		innerradius=[30, 50],
		position=[0,5,0],
		prefix=prefix,
		container=container,
		seed=seed
	)
	
	spawnRadiusGeneric(
		['animals'],
		tags=['animal'],
		collisionCheck=True,
		stickToGround=True,
		limit=[200, 350],
		radius=[40, 80],
		innerradius=0,
		position=[0,5,0],
		orbit=True,
		prefix=prefix,
		container=container,
		seed=seed
	)
	
	common.flushBuffer()
