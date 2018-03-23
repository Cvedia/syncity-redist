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
	'Drones/DJI_Phantom_4_Pro/DJI_Phantom_4_Pro',
	'Drones/Parrot Disco Drone/Parrot_Disco'
]

# lite asset package
drones_lite_lst = [ 'Drones/buzz/buzz', 'Drones/splinter/splinter', 'Drones/red/red', 'Drones/white/white' ]

settings = settings_manager.Singleton()

def globalCameraSetup(
	labelRoot='cameras', canvasWidth=1024, canvasHeight=768, canvas=None,
	orbit=True, orbitOffset=None, orbitGround=None, orbitSnap=None, position=None,
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
	
	common.sendData([
		'CREATE "{}"'.format(labelRoot),
		'"{}" SET active false'.format(labelRoot),
		'"{}" SET Transform position ({} {} {})'.format(labelRoot, settings.X_COMP -6, settings.Y_COMP, settings.Z_COMP -50) if position == None else '"{}" SET Transform position ({} {} {})'.format(labelRoot, position[0], position[1], position[2]),
		'"{}" SET Transform eulerAngles ({} {} {})'.format(labelRoot, 0, 0, 0) if rotation == None else '"{}" SET Transform eulerAngles ({} {} {})'.format(labelRoot, rotation[0], rotation[1], rotation[2]),
		
		# orbit
		'"{}" ADD Orbit'.format(labelRoot) if orbit == True else '',
		'"{}" SET Orbit groundObj "{}"'.format(labelRoot, orbitGround) if orbitGround != None else '',
		'"{}" SET Orbit targetOffset ({} {} {})'.format(labelRoot, orbitOffset[0], orbitOffset[1], orbitOffset[2]) if orbitOffset != None else '',
		'"{}" SET Orbit snapOffset {}'.format(labelRoot, orbitSnap) if orbitSnap != None else '',
		
		# resize camera display on app, this is relative to the size of the window
		'"Canvas/Cameras/Viewport/Content" SET UI.GridLayoutGroup cellSize ({} {})'.format(canvasWidth, canvasHeight),
		'"Canvas" SET active {}'.format(canvas)
	], read=False)
	
	if flycam:
		common.sendData([
			'"{}" ADD FlyCamera'.format(labelRoot),
			'"{}" SET FlyCamera enabled true'.format(labelRoot)
		], read=False)
	
	settings.obj.append(labelRoot)

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
	label (string): Game object path, defaults to `cameras/depth` - This should follow `labelRoot` from `globalCameraSetup`
	fov (int): Field of view, defaults to `60`
	clippingNear (float): Near clipping distance, defaults to `0.3` - Objects closer than this distance won't appear
	clippingFar (float): Far clipping distance, defaults to `1000` - Objects further from this distance won't appear
	depthBuffer (string): Defines a specific depth buffer configuration to use, if not set fallsback to default, default `None`
	transparencyCutout (float): Defines a cutout percentage for transparent objects, defaults to `0` that will show transparent objects at full extent, when set to 1 will hide them completly.
	
	"""
	
	buf = [
		'CREATE "{}"'.format(label),
		'"{}" SET active false'.format(label),
		'"{}" ADD Camera'.format(label),
		'"{}" SET Camera near {} far {} fieldOfView {} renderingPath "DeferredShading"'.format(label, clippingNear, clippingFar, fov),
		'"{}" ADD Sensors.RenderCamera'.format(label),
		'"{}" SET Sensors.RenderCamera format "RFloat" resolution ({} {})'.format(label, width, height)
	]
	
	if depthBuffer == None:
		buf.append('"{}" ADD Sensors.Lidar_Internal.RenderDepthBufferOld'.format(label) if settings.use_old_depth_buffer else '"{}" ADD CameraDepthOutput'.format(label))
	elif depthBuffer == 'simple':
		buf.extend([
			'"{}" ADD Cameras.RenderDepthBufferSimple'.format(label),
			'"{}" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout {}'.format(label, transparencyCutout)
			#'"{}" Cameras.RenderDepthBufferSimple drawTransparentObjectsDepth false'.format(label)
		])
	else:
		common.output('Unknown depthBuffer: {}'.format(depthBuffer), 'ERROR')
	
	buf.append('"{}" SET active true'.format(label))
	common.sendData(buf, read=False)
	
	common.flushBuffer()
	settings.obj.append(label)

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
	label (string): Game object path, defaults to `cameras/cameraRGB` - This should follow `labelRoot` from `globalCameraSetup`
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
	
	common.sendData([
		'CREATE "{}"'.format(label),
		'"{}" SET active false'.format(label),
		'"{}" ADD Camera'.format(label),
		'"{}" SET Camera near {} far {} fieldOfView {}'.format(label, clippingNear, clippingFar, fov),
	], read=False)
	
	if renderCamera:
		common.sendData([
			'"{}" ADD Sensors.RenderCamera'.format(label),
			
			# '"{}" SET Sensors.RenderCamera sRGB true'.format(label),
			'"{}" SET Sensors.RenderCamera format "{}" resolution ({} {})'.format(label, unity_vars.textureFormat[textureFormat], width, height),
			'"{}" SET Camera renderingPath "{}"'.format(label, unity_vars.renderingPath[renderingPath]),
			
			# 'cameras/cameraRGB SET Camera targetTexture.antiAliasing 8',
			# 'cameras/cameraRGB SET active true',
		], read=False)
	
	if audio:
		common.sendData(['"{}" ADD AudioListener'.format(label)], read=False)
	if flycam:
		common.sendData([
			'"{}" ADD FlyCamera'.format(label),
			'"{}" SET FlyCamera enabled true'.format(label)
		], read=False)
	if envirosky:
		common.sendData([
			# NOTE: This is a prefab that already contains the EnviroSky default profile
			'CREATE "EnviroSky" AS "EnviroSky"',
			'"EnviroSky" SET EnviroSky Player "{}" PlayerCamera "{}" GameTime.ProgressTime "{}" weatherSettings.cloudTransitionSpeed {} weatherSettings.effectTransitionSpeed {} weatherSettings.fogTransitionSpeed {}'.format(labelRoot, label, enviroskyProgressTime, enviroskyCloudTransitionSpeed, enviroskyEffectTransitionSpeed, enviroskyFogTransitionSpeed),
			'"EnviroSky" EXECUTE EnviroSky AssignAndStart "{}" "{}"'.format(label, label),
			'"EnviroSky" SET active true'.format(label)
		], read=False)
	
	common.sendData([
		'"{}" SET active true'.format(labelRoot),
		'"{}" SET active true'.format(label)
	], read=False)
	
	common.flushBuffer()
	
	if pp != None:
		addCameraRGBPP(profile=pp, label=label)
	
	settings.obj.append(label)

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
	label (string): Game object path, defaults to `cameras/cameraRGB` - This should follow `labelRoot` from `globalCameraSetup`
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
	common.sendData([
		'CREATE "{}"'.format(label),
		'"{}" SET active false'.format(label),
		'"{}" ADD Camera'.format(label),
		'"{}" SET Camera near {} far {} fieldOfView {}'.format(label, clippingNear, clippingFar, fov),
	], read=False)
	
	if renderCamera:
		common.sendData([
			'"{}" ADD Sensors.RenderCamera'.format(label),
			
			'"{}" SET Sensors.RenderCamera format "{}" resolution ({} {})'.format(label, unity_vars.textureFormat[textureFormat], width, height),
			'"{}" SET Camera renderingPath "{}"'.format(label, unity_vars.renderingPath[renderingPath])
		], read=False)
	
	if audio:
		common.sendData(['"{}" ADD AudioListener'.format(label)], read=False)
	
	common.sendData([
		'"{}" ADD Thermal.ThermalCamera'.format(label),
		'"{}" SET Thermal.ThermalCamera enabled false'.format(label)
	], read=False)
	
	if patchyness:
		common.sendData([
			'"{}" ADD CameraFilterPack_Pixelisation_DeepOilPaintHQ'.format(label),
			'"{}" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ enabled false'.format(label),
			'"{}" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ _FixDistance {} _Distance {} _Size {} Intensity {} enabled true'.format(label, patchyness_fixDistance, patchyness_distance, patchyness_size, patchyness_intensity)
		], read=False)
	
	if blur:
		common.sendData([
			'"{}" ADD CameraFilterPack_Blur_Noise'.format(label),
			'"{}" SET CameraFilterPack_Blur_Noise Distance ({} {}) enabled true'.format(label, blurNoise[0], blurNoise[1])
		], read=False)
	
	if trees:
		common.sendData([
			'"{}" ADD Thermal.GlobalTreeSettings'.format(label),
			'"{}" SET Thermal.GlobalTreeSettings temperature {} temperatureBandwidth {} temperatureMedian {} treeLeafsHeatVariance {} enabled true'.format(label, treesBase, treesBandwidth, treesMedian, treesLeafsVariance)
		], read=False);

	common.sendData([
		'"{}" ADD UnityEngine.PostProcessing.PostProcessingBehaviour'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "Thermal"'.format(label),
		'"{}" SET Thermal.ThermalCamera ambientTemperature {} temperatureRange ({} {}) maxDistanceForProbeUpdate {} useAGC {} enabled true'.format(label, ambientTemperature, minimumTemperature, maximumTemperature, maxDistanceForProbeUpdate, useAGC)
	], read=False)
		
	common.sendData([
		'"{}" SET active true'.format(label)
	], read=False)
	
	common.flushBuffer()
	
	settings.obj.append(label)

def cameraPPThermal(label='cameras/cameraRGB'):
	"""
	This is a dummy function that demonstrates all possible configurable values on a camera profile, in this case we're showing off all parameters tuned to a thermal profile
	"""
	common.sendData([
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.enabled false'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.enabled false'.format(label),
		
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled true'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.intensity {}'.format(label, 2),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.threshold {}'.format(label, 1.1),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.softKnee {}'.format(label, .6),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.radius {}'.format(label, 4.36),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.antiFlicker {}'.format(label, 'true'),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.lensDirt.intensity {}'.format(label, 3),
		
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.enabled false'.format(label),
		
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.enabled false'.format(label),
		
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.enabled false'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.dithering.enabled false'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled false'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.fog.enabled false'.format(label),
		
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled true'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.colored 1'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.intensity 0.68'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.luminanceContribution 1'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.size 0.3'.format(label),
		
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.enabled false'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.enabled false'.format(label),
	], read=False)

# WARNING: It's not recommended to use Scion with Envirosky
def addCameraRGBPP(profile='Profile2', scion=False, label='cameras/cameraRGB'):
	common.sendData([
		# 'cameras/cameraRGB SET active false',
		'"{}" ADD UnityEngine.PostProcessing.PostProcessingBehaviour'.format(label),
		'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "{}"'.format(label, profile)
	], read=False)
	
	if scion:
		if not settings.disable_envirosky:
			common.output('WARNING: Using scion with envirosky is not recommended')
		common.sendData([
			'"{}" ADD ScionEngine.ScionPostProcess'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess bloom true'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess bloomIntensity 0.3'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess grain false'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess vignette false'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess chromaticAberration false'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess lensFlare false'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess lensDirt false'.format(label),
			'"{}" SET ScionEngine.ScionPostProcess depthOfField false'.format(label),
			# '"{}" SET active true'
		], read=False)
	else:
		common.sendData('"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false'.format(label))
	
	common.flushBuffer()
	settings.obj.append(label)

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

	label (string): Defines a existing camera to apply postprocessing to, defaults to `cameras/cameraRGB`
	"""
	# antialiasing
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.enabled true'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.fxaaSettings.preset 4'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.method 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.taaSettings.jitterSpread 0.75'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.taaSettings.motionBlending 0.85'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.taaSettings.sharpen 0.3'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.taaSettings.stationaryBlending 0.95'.format(label),
		], read=False)
	else:
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.enabled false'.format(label)
		], read=False)
	
	# ambient occlusion
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.enabled true'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.intensity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.radius 0.3'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.sampleCount 10'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.downsampling 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.forceForwardCompatibility 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.ambientOnly 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.highPrecision 0'.format(label),
		], read=False)
	else:
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.enabled false'.format(label),
		], read=False)
	
	# blooming effects
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled true'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.intensity {}'.format(label, random.randint(0, 100)),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.threshold {}'.format(label, random.uniform(0, 2)),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.softKnee {}'.format(label, random.uniform(0, 1)),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.radius {}'.format(label, random.uniform(1, 7)),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.antiFlicker {}'.format(label, 'true'),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.lensDirt.intensity {}'.format(label, random.randint(0, 10)),
		], read=False)
	else:
		common.sendData(['"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false'.format(label)], read=False)
	
	# chromatic aberration
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.enabled true'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.475'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.spectralTexture.fileID 0'.format(label),
		], read=False)
	else:
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.enabled false'.format(label),
		], read=False)
	
	# color grading
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.enabled true'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.027'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.hueShift 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.postExposure 0.5'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.188'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.temperature 13.8'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.tint 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.blue.x 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.blue.y 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.blue.z 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.currentEditingChannel 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.green.x 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.green.y 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.green.z 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.red.x 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.red.y 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.red.z 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gain.a 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gain.b 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gain.g 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gain.r 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gamma.a 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gamma.b 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gamma.g 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gamma.r 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.lift.a 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.lift.b 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.lift.g 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.lift.r 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.offset.a 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.offset.b 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.offset.g 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.offset.r 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.power.a 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.power.b 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.power.g 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.power.r 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.slope.a 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.slope.b 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.slope.g 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.slope.r 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.mode 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.inSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.outSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.tangentMode 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.time 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.value 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.inSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.outSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.tangentMode 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.time 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.value 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_PostInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_PreInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_RotationOrder 4'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.m_Loop 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.m_Range 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.m_ZeroValue 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurrentEditingCurve 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurveB 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurveG 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurveR 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurveY 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.inSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.outSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.tangentMode 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.time 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.value 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.inSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.outSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.tangentMode 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.time 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.value 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_PostInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_PreInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_RotationOrder 4'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.m_Loop 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.m_Range 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.m_ZeroValue 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.curve.m_PostInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.curve.m_PreInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.curve.m_RotationOrder 4'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.curve.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.m_Loop 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.m_Range 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.m_ZeroValue 0.5'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.curve.m_PostInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.curve.m_PreInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.curve.m_RotationOrder 4'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.curve.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.m_Loop 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.m_Range 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.m_ZeroValue 0.5'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.curve.m_PostInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.curve.m_PreInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.curve.m_RotationOrder 4'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.curve.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.m_Loop 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.m_Range 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.m_ZeroValue 0.5'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.inSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.outSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.tangentMode 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.time 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.value 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.inSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.outSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.tangentMode 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.time 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.value 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_PostInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_PreInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_RotationOrder 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.m_Loop 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.m_Range 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.m_ZeroValue 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.inSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.outSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.tangentMode 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.time 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.value 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.inSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.outSlope 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.tangentMode 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.time 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.value 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_PostInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_PreInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_RotationOrder 4'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.m_Loop 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.m_Range 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.m_ZeroValue 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.curve.m_PostInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.curve.m_PreInfinity 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.curve.m_RotationOrder 4'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.curve.serializedVersion 2'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.m_Loop 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.m_Range 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.m_ZeroValue 0.5'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralBlackIn 0.0073'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralBlackOut 0.0113'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralWhiteClip 10'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralWhiteIn 15'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralWhiteLevel 5.62'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralWhiteOut 15.49'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.tonemapper "2"'.format(label),
		], read=False)
	else:
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.enabled false'.format(label),
		], read=False)
	
	# depth of field
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.enabled true'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.focusDistance 0.1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.aperture 8.7'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.focalLength 200'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.useCameraFov 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.kernelSize 1'.format(label),
		], read=False)
	else:
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.enabled true'.format(label),
		], read=False)
	
	# dithering
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.dithering.enabled true'.format(label),
		], read=False)
	else:
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.dithering.enabled false'.format(label),
		], read=False)
	
	# eye adaptation
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled true'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.adaptationType 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.dynamicKeyValue 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.highPercent 95'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.keyValue 0.25'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.logMax 4'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.logMin -8'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.lowPercent 45'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.maxLuminance 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.minLuminance -5'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.speedDown 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.speedUp 2'.format(label),
		], read=False)
	else:
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled false'.format(label),
		], read=False)
	
	# fog
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.fog.enabled true'.format(label)
		], read=False)
	else:
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.fog.enabled false'.format(label)
		], read=False)
	
	# grain
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled true'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.colored 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.intensity 0.281'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.luminanceContribution 0.8'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.size 0.3'.format(label),
		], read=False)
	else:
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled false'.format(label),
		], read=False)
	
	# motion blur effects
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled true'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.shutterAngle {}'.format(label, random.randint(0, 360)),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount {}'.format(label, random.randint(1, 32)),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending {}'.format(label, random.uniform(0, 1))
		], read=False)
	else:
		common.sendData(['"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false'.format(label)], read=False)
	
	# screen space reflection
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.enabled true'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.blendType 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.reflectionQuality 3'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.maxDistance 99'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.iterationCount 99'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.stepSize 3'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.widthModifier 0.5'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.reflectionBlur 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.reflectBackfaces 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.intensity.reflectionMultiplier 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.intensity.fadeDistance 100'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.intensity.fresnelFade 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.intensity.fresnelFadePower 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.screenEdgeMask.intensity 0.03'.format(label),
		], read=False)
	else:
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.enabled false'.format(label),
		], read=False)
	
	# vignette
	if bool(random.getrandbits(1)):
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.enabled true'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.center.x 0.5'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.center.y 0.5'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.color.a 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.color.b 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.color.g 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.color.r 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.intensity 0.692'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.mask.fileID 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.mode 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.opacity 1'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.rounded 0'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.roundness 0.255'.format(label),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.smoothness 0.439'.format(label),
		], read=False)
	else:
		common.sendData([
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.enabled false'.format(label),
		], read=False)
	
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
	common.sendData([
		'"{}" ADD Thermal.ThermalProfileOverride'.format(target),
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
			target, temperatureMode, temperatureValue,
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

def addCameraSegFilter(segments=['Car'], label='cameras/segmentation', unoccluded=None):
	"""
	Creates a filterable bounding boxes with unoccluded option enabled by default.
	This allows you to export json objects containig segmented classes.
	
	# Arguments
	
	segments (list): Defines one or more classes, defaults to `['Car']`
	label (string): Defines a segmentation camera as source, defaults to `cameras/segmentation`
	unoccluded (list): Defines one or more classes to be unoccluded, defaults to `None`
	"""
	
	for s in segments:
		common.sendData([
			'"{}" PUSH Segmentation.Segmentation boundingBoxesFilter "{}"'.format(label, s)
		], read=False)
	
	if unoccluded != None:
		for s in segments:
			common.sendData([
				'"{}" PUSH Segmentation.Segmentation unoccludedClasses "{}"'.format(label, s)
			], read=False)

# output_type options: Auto, ClassIds, InstanceIds, ClassColors, Raw
def addCameraSeg(
	width=1024, height=768, segments=None, output_type='Auto', label='cameras/segmentation',
	fov=60,
	clippingNear=0.3,
	clippingFar=1000,
	boundingBoxesExtensionAmount=0,
	renderingPath=4, textureFormat=4,
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
	label (string): Game object path, defaults to `cameras/segmentation` - This should follow `labelRoot` from `globalCameraSetup`
	renderingPath (int): Defines rendering path, defaults to `4` - This is defined on unity_vars lookup table
	textureFormat (int): Defines texture format, defaults to `4` - This is defined on unity_vars lookup table
	fov (int): Field of view, defaults to `60`
	clippingNear (float): Near clipping distance, defaults to `0.3` - Objects closer than this distance won't appear
	clippingFar (float): Far clipping distance, defaults to `1000` - Objects further from this distance won't appear
	renderCamera (bool): Binds a renderCamera component allowing for disk exports, defaults to `True`
	lookupTable (list): Binds a color to a class, this is essential for outputting pixel dense images, this is an array of arrays like `[ [ Car , red ] , [ Person, blue ] .. ]`; Defaults to `True` which will automatically populate the segmentation lookup table based on the segments sent.
	minimumVisibility (float): Defines minimum visibility of object in % (0 - 1), objects with less than % of it's total size visible won't appear on the segmentation maps neither yeild bounding boxes, defaults to `0`
	transparencyCutout (float): Defines a cutout percentage for transparent objects, defaults to `0` that will show transparent objects at full extent, when set to 1 will hide them completly.
	
	# Notes
	
	- patchyness effects mimic thermal cameras averaging feature from mid / long distance focal points
	- blur effects mimics noise around object edges, more visible when close by
	
	"""
	common.sendData([
		'CREATE "{}"'.format(label),
		'"{}" SET active false'.format(label),
		'"{}" ADD Camera'.format(label),
		'"{}" SET Camera near {} far {} fieldOfView {}'.format(label, clippingNear, clippingFar, fov),
	], read=False)
	
	if renderCamera:
		common.sendData([
			'"{}" ADD Sensors.RenderCamera'.format(label),
			'"{}" SET Sensors.RenderCamera format "{}" resolution ({} {})'.format(label, unity_vars.textureFormat[textureFormat], width, height),
		], read=False)
	
	common.sendData([
		'"{}" SET Camera renderingPath "{}" targetTexture.filterMode "Point"'.format(label, unity_vars.renderingPath[renderingPath]),
		'"{}" ADD Segmentation.Segmentation'.format(label),
		'"{}" SET Segmentation.Segmentation minimumObjectVisibility {} outputType "{}" boundingBoxesExtensionAmount {} transparencyCutout {}'.format(label, minimumVisibility, output_type, boundingBoxesExtensionAmount, transparencyCutout),
		'"{}" EXECUTE Segmentation.Segmentation DefineClass "Void"'.format(label)
	], read=False)
	
	if segments != None:
		addCameraSegFilter(segments, label=label)
	
	# add default class
	common.sendData([
		'"{}" ADD Segmentation.LookUpTable'.format(label),
		'"{}" PUSH Segmentation.LookUpTable classes "Void"'.format(label),
		'"{}" PUSH Segmentation.LookUpTable colors "black"'.format(label)
	], read=False)
	
	if lookupTable == True and segments != None:
		idx = 0
		for i in segments:
			if idx > len(unity_vars.colors):
				color = '"{}"'.format(getRandomColor())
			else:
				color = unity_vars.colors[idx]
			common.sendData([
				'"{}" EXECUTE Segmentation.Segmentation DefineClass "{}"'.format(label, i),
				'"{}" PUSH Segmentation.LookUpTable classes "{}"'.format(label, i),
				'"{}" PUSH Segmentation.LookUpTable colors "{}"'.format(label, color)
			], read=False)
			idx += 1
	elif isinstance(lookupTable, list):
		for i in lookupTable:
			common.sendData([
				'"{}" EXECUTE Segmentation.Segmentation DefineClass "{}"'.format(label, i[0]),
				'"{}" PUSH Segmentation.LookUpTable classes "{}"'.format(label, i[0]),
				'"{}" PUSH Segmentation.LookUpTable colors "{}"'.format(label, i[1])
			], read=False)
	
	common.sendData([
		'"{}" EXECUTE Segmentation.LookUpTable MarkTextureDirty'.format(label),
		'"{}" SET active true'.format(label)
	], read=False)
	common.flushBuffer()
	settings.obj.append(label)

def addLight(position=[34,-22.53,0], intensity=1.7, label='light'):
	"""
	Creates a light object
	
	This is not recommened when you have envirosky enabled, as it will swamp the
	rgb rendering with light, but it depends on the application.
	
	# Arguments
	
	position (list): X,Y,Z position, defaults to `[32,-22.53,0]`
	intensity (float): Light intensity, defaults to `1.7`
	label (string): Game object name, defaults to `light`
	
	"""
	common.sendData([
		'CREATE "{}"'.format(label),
		'"{}" ADD Light'.format(label),
		'"{}" SET Light type "Directional"'.format(label),
		'"{}" SET Transform eulerAngles ({} {} {})'.format(label, position[0], position[1], position[2]),
		'"{}" SET Light intensity {}'.format(label, intensity),
		# '"{}" SET Light color #'.format(label),
		'"{}" SET Light shadows "Soft"'.format(label),
		'"{}" SET active true'.format(label)
	], read=False)
	
	common.flushBuffer()
	settings.obj.append(label)

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
	settings.obj.append(label)

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
		doRender(lst)
		return
	
	if autoSegment:
		idx = [i for i, s in enumerate(lst) if 'segmentation' in s]
		
		if len(idx) == 0:
			common.output('WARNING: No camera with segmentation name found, skipping autoSegment')
		else:
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
	
	time.sleep(settings.cooldown)

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
						pass
		
		if len(data) == 0:
			common.output('Unable to fetch bounding box, retrying...', 'DEBUG')
			time.sleep(.5)
			rawData = common.sendData('NOOP', read=True)
		else:
			# make sure object is valid, otherwise we might need to send another noop to complete it
			try:
				json.loads(''.join(data))
				break
			except:
				common.output('Partially received json object, waiting for more...', 'DEBUG')
				time.sleep(.5)
				rawData = common.sendData('NOOP', read=True)
		
		noops += 1
		
		if noops > 100:
			common.output('Limit reached while waiting for json object, skipping index!', 'ERROR')
			settings.seqSave_i = settings.seqSave_i + 1
			return
	
	data = ''.join(data)
	
	fn = '{}{}_{}.json'.format(settings.local_path, pref, settings.seqSave_i)
	
	if settings.debug:
		common.output('SEQ Save path: {} prefix: {} data: {}'.format(fn, pref, data), 'DEBUG')
		d = open(fn + '.debug', 'w')
		d.write('\r\n'.join(rawData))
		d.close()
	
	f = open(fn, 'w')
	f.write(data)
	f.close()
	common.output('Wrote: {}{}_{}.json'.format(settings.local_path, pref, settings.seqSave_i))
	settings.seqSave_i = settings.seqSave_i + 1

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
			for i in range(0, colors):
				buf.append('"{}" PUSH {} availableColors "{}"'.format(obj, component, getRandomColor()))
		
		if partsNames != None:
			buf.append('"{}" SET {} partsNames "{}"'.format(obj, component, partsNames))
		buf.append('"{}" PUSH {} colorsWeights {}'.format(obj, component, colorsWeights))
	
	common.sendData(buf, read=False)

def lcp(
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
	camera (string): Defines camera where LCP should be added / exists, defaults to `cameras/cameraRGB`,
	
	updateValuesMode (string): Defines how values should be updated, this depends on how you're using this component. Defaults to `None` which is `OnEnableOnly`, possible options are `OnEnableOnly` and `EveryFrame`.
	focalLength (float): Focal Length compatible with real camera values defaults to `None`,
	sensorFormatFactor (float): Sensoe format factor, defaults to `None`,
	distortionScale (float): Distortion weight scale, defaults to `None`,
	isFisheyeDistortion (bool): enables fish eye distortion defaults to `None`,
	
	radialParam1 (float): defaults to `None`,
	radialParam2 (float): defaults to `None`,
	radialParam3 (float): defaults to `None`,
	
	radialParamX (float): defaults to `None`,
	radialParamY (float): defaults to `None`,
	
	redParam1 (float): defaults to `None`,
	redParam2 (float): defaults to `None`,
	redParam3 (float): defaults to `None`,
	
	redParamX (float): defaults to `None`,
	redParamY (float): defaults to `None`,
	
	greenParam1 (float): defaults to `None`,
	greenParam2 (float): defaults to `None`,
	greenParam3 (float): defaults to `None`,
	
	greenParamX (float): defaults to `None`,
	greenParamY (float): defaults to `None`,
	
	blueParam1 (float): defaults to `None`,
	blueParam2 (float): defaults to `None`,
	blueParam3 (float): defaults to `None`,
	
	blueParamX (float): defaults to `None`,
	blueParamY (float): defaults to `None`,
	
	vignetteParam1 (float): defaults to `None`,
	vignetteParam2 (float): defaults to `None`,
	vignetteParam3 (float): defaults to `None`,
	vignetteParam4 (float): defaults to `None`,
	
	"""
	buf = []
	
	if add == True:
		buf.append('"{}" ADD LCP'.format(camera))
	
	buf.extend([
	'"{}" SET LCP updateValuesMode "{}"'.format(camera, updateValuesMode) if updateValuesMode != None else '',
	'"{}" SET LCP focalLength {}'.format(camera, focalLength) if focalLength != None else '',
	'"{}" SET LCP sensorFormatFactor {}'.format(camera, sensorFormatFactor) if sensorFormatFactor != None else '',
	'"{}" SET LCP distortionScale {}'.format(camera, distortionScale) if distortionScale != None else '',
	'"{}" SET LCP isFisheyeDistortion {}'.format(camera, isFisheyeDistortion) if isFisheyeDistortion != None else '',
	
	'"{}" SET LCP radialParam1 {}'.format(camera, radialParam1) if radialParam1 != None else '',
	'"{}" SET LCP radialParam2 {}'.format(camera, radialParam2) if radialParam2 != None else '',
	'"{}" SET LCP radialParam3 {}'.format(camera, radialParam3) if radialParam3 != None else '',
	
	'"{}" SET LCP radialParamX {}'.format(camera, radialParamX) if radialParamX != None else '',
	'"{}" SET LCP radialParamY {}'.format(camera, radialParamY) if radialParamY != None else '',
	
	'"{}" SET LCP redParam1 {}'.format(camera, redParam1) if redParam1 != None else '',
	'"{}" SET LCP redParam2 {}'.format(camera, redParam2) if redParam2 != None else '',
	'"{}" SET LCP redParam3 {}'.format(camera, redParam3) if redParam3 != None else '',
	
	'"{}" SET LCP redParamX {}'.format(camera, redParamX) if redParamX != None else '',
	'"{}" SET LCP redParamY {}'.format(camera, redParamY) if redParamY != None else '',
	
	'"{}" SET LCP greenParam1 {}'.format(camera, greenParam1) if greenParam1 != None else '',
	'"{}" SET LCP greenParam2 {}'.format(camera, greenParam2) if greenParam2 != None else '',
	'"{}" SET LCP greenParam3 {}'.format(camera, greenParam3) if greenParam3 != None else '',
	
	'"{}" SET LCP greenParamX {}'.format(camera, greenParamX) if greenParamX != None else '',
	'"{}" SET LCP greenParamY {}'.format(camera, greenParamY) if greenParamY != None else '',
	
	'"{}" SET LCP blueParam1 {}'.format(camera, blueParam1) if blueParam1 != None else '',
	'"{}" SET LCP blueParam2 {}'.format(camera, blueParam2) if blueParam2 != None else '',
	'"{}" SET LCP blueParam3 {}'.format(camera, blueParam3) if blueParam3 != None else '',
	
	'"{}" SET LCP blueParamX {}'.format(camera, blueParamX) if blueParamX != None else '',
	'"{}" SET LCP blueParamY {}'.format(camera, blueParamY) if blueParamY != None else '',
	
	'"{}" SET LCP vignetteParam1 {}'.format(camera, vignetteParam1) if vignetteParam1 != None else '',
	'"{}" SET LCP vignetteParam2 {}'.format(camera, vignetteParam2) if vignetteParam2 != None else '',
	'"{}" SET LCP vignetteParam3 {}'.format(camera, vignetteParam3) if vignetteParam3 != None else '',
	'"{}" SET LCP vignetteParam4 {}'.format(camera, vignetteParam4) if vignetteParam4 != None else ''
	])
	
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
	heatiness=None, reflectivity=None, ambientOffset=None,
	temperatureValue=None, temperatureBandwidth=None, temperatureMedian=None,
	variance=None
):
	"""
	
	Changes parameters on a existing thermal profile override from a arbitrary object
	
	# Arguments
	
	objs (list|string): Object or list of objects path(s) containing a thermal profile
	heatiness (float): Controls how much heat emission object is generating
	reflectivity (float): How reflective the object is for other infrared emissions; ranges from 0 - 1
	ambientOffset (float): Temperature offset in relation to ambient (from camera watching); ranges from -25 to 25
	temperatureValue (float): Object absolute temperature, defaults to 30
	temperatureBandwidth (float): Affects how much the temperature affects the object body overall
	temperatureMedian (float): Affects how wide the temperature spread goes; ranges from 0 - 1
	variance (float): Defines the fuzzyness of temperature variance across texturized objects
	
	"""
	if type(objs) != list:
		objs = [ objs ]
	
	for obj in objs:
		common.sendData(['"{}" SET active false'.format(obj)], read=False)
		
		if heatiness != None:
			common.sendData([
				'"{}" SET Thermal.ThermalObjectOverride overrideHeatiness true'.format(obj),
				'"{}" SET Thermal.ThermalObjectOverride heatiness.value {}'.format(obj, heatiness)
			], read=False)
		else:
			common.sendData([
				'"{}" SET Thermal.ThermalObjectOverride overrideHeatiness false'.format(obj)
			], read=False)
		
		if reflectivity != None:
			common.sendData([
				'"{}" SET Thermal.ThermalObjectOverride overrideReflectivity true'.format(obj),
				'"{}" SET Thermal.ThermalObjectOverride reflectivity.value {}'.format(obj, reflectivity)
			], read=False)
		else:
			common.sendData([
				'"{}" SET Thermal.ThermalObjectOverride overrideReflectivity false'.format(obj)
			], read=False)
		
		if ambientOffset != None:
			common.sendData([
				'"{}" SET Thermal.ThermalObjectOverride overrideAmbientOffset true'.format(obj),
				'"{}" SET Thermal.ThermalObjectOverride ambientOffset.value {}'.format(obj, ambientOffset)
			], read=False)
		else:
			common.sendData([
				'"{}" SET Thermal.ThermalObjectOverride overrideAmbientOffset false'.format(obj)
			], read=False)
		
		if temperatureValue != None or temperatureBandwidth != None or temperatureMedian != None:
			common.sendData(['"{}" SET Thermal.ThermalObjectOverride overrideTemperature true'.format(obj)], read=False)
			
			if temperatureValue != None:
				common.sendData(['"{}" SET Thermal.ThermalObjectOverride temperature.value {}'.format(obj, temperatureValue)], read=False)
			if temperatureBandwidth != None:
				common.sendData(['"{}" SET Thermal.ThermalObjectOverride temperature.bandwidth {}'.format(obj, temperatureBandwidth)], read=False)
			if temperatureMedian != None:
				common.sendData(['"{}" SET Thermal.ThermalObjectOverride temperature.median {}'.format(obj, temperatureMedian)], read=False)
		else:
			common.sendData(['"{}" SET Thermal.ThermalObjectOverride overrideTemperature false'.format(obj)], read=False)
		
		if variance != None:
			common.sendData([
				'"{}" SET Thermal.ThermalObjectOverride overrideVariance true'.format(obj),
				'"{}" SET Thermal.ThermalObjectOverride variance.value {}'.format(obj, variance)
			], read=False)
		else:
			common.sendData([
				'"{}" SET Thermal.ThermalObjectOverride overrideVariance false'.format(obj)
			], read=False)
		
		common.sendData(['"{}" SET active true'.format(obj)], read=False)
	
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
		requireThermalClothing=False
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
	"""
	
	if goals == None or len(goals) == 0:
		raise Exception('No goals set')
		return False
	
	if spawners == None or len(spawners) == 0:
		raise Exception('No spawners set')
		return False
	
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
	stickToGround=False, collisionCheck=True, suffix="", flush=False, prefix='spawner',
	names=None, uglyFix=True, seed=None, randomColors=None, randomColorsWeights=14,
	method=None, methodParameters=None, minDistance=None, maxDistance=None,
	partsNames=None, autoSegment=False
):
	"""
	Creates a torus shaped object spawner
	
	# Arguments
	
	types (list): List of names for spawned objects
	tags (list): List of object tags to be spawned, this should align with the number of arguments on types
	scale (list): X,Y,Z scale factor, defaults to `[1,1,1]`
	position (list): X,Y,Z position of radius spawner
	rotation (list): X,Y,Z rotation position of radius spawner
	limit (int): Number of objects to spawn in each of the `types`
	segmentationClass (list): Defines segmentation classes to be bound to the spawner, this must align with the number of arguments on types, defaults to `None`
	orbit (bool): Adds orbiting component to spawner
	stickToGround (bool): Forces spawned objects to stick to ground, ideal for irregular ground. defaults to `False`
	collisionCheck (bool): Avoids objects from being spawned overlapping eachother and other objects in the scene, defaults to `True`
	suffix (string): Adds a suffix string on types
	flush (bool): Forces a telnet queue flush after spawning, defaults to `False`
	prefix (string): Defines a root game object to nest types into, defaults to `spawner`
	names (list): Overrides type caption, must be aligned with the number of arguments on types, defaults to `None`
	uglyFix (bool): Ugly fix for asset naming, defaults to `True`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None`
	randomColors (int): Defines a number of random colors to assign to spawner, when set to None disables feature, defaults to `None`, when set to `True` goes full random instead of predefined defined random colors
	randomColorsWeights (int): Defines a weight for color switching, defaults to `14`
	method (string): Defines spawner method, defaults to `None`
	methodParameters (dict): Defines method's parameters, defaults to `None`
	partsNames (string): Defines a list of parts to be colorized, defaults to `None`
	autoSegment (bool): Automatically segment objects based on types or tags given, defaults to `False`
	
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
	
	# loop each of the types
	i = 0
	for t in types:
		if names == None:
			n = t.replace(' ', '_').replace('+', '_').replace('-', '_').replace(',', '_') + suffix
		else:
			n = names[i]
		
		common.sendData([
			'CREATE "{}/{}"'.format(prefix, n),
			'"{}/{}" SET active false'.format(prefix, n),
			
			'"{}/{}" ADD RandomProps.{}'.format(prefix, n, method) if method != None else '',
			'"{}/{}" ADD RandomProps.PropArea'.format(prefix, n)
		], read=False)
		
		if seed != None:
			common.sendData(['"RandomProps.Random.instance" SET seed {}'.format(seed)], read=False)
		
		if uglyFix == True:
			try:
				common.sendData(['"{}/{}" SET RandomProps.PropArea tags "{}"'.format(prefix, n, uglyTagFix(tags[i]))], read=False)
			except:
				common.sendData(['"{}/{}" SET RandomProps.PropArea tags "{}"'.format(prefix, n, uglyTagFix(t))], read=False)
		else:
			common.sendData(['"{}/{}" SET RandomProps.PropArea tags "{}"'.format(prefix, n, tags[i])], read=False)
		
		if minDistance != None:
			common.sendData([
				'"{}/{}" SET RandomProps.Frustum minDistance {}'.format(prefix, n, minDistance)
			], read=False)
		
		if maxDistance != None:
			common.sendData([
				'"{}/{}" SET RandomProps.Frustum maxDistance {}'.format(prefix, n, maxDistance)
			], read=False)
		
		common.sendData([
			'"{}/{}" SET RandomProps.PropArea async false'.format(prefix, n),
			'"{}/{}" SET RandomProps.PropArea numberOfProps {}'.format(prefix, n, limit),
			
			'"{}/{}" SET RandomProps.PropArea collisionCheck {}'.format(prefix, n, collisionCheck),
			'"{}/{}" SET RandomProps.PropArea stickToGround {}'.format(prefix, n, stickToGround),
		], read=False)
		
		if method != None and methodParameters != None:
			for key in methodParameters:
				common.sendData('"{}/{}" SET RandomProps.{} {} {}'.format(prefix, n, method, key, methodParameters[key]), read=False)
		
		common.sendData([
			'"{}/{}" SET Transform position ({} {} {})'.format(prefix, n, position[0], position[1], position[2]) if position != None else '',
			'"{}/{}" SET Transform eulerAngles ({} {} {})'.format(prefix, n, rotation[0], rotation[1], rotation[2]) if rotation != None else '',
			'"{}/{}" SET Transform localScale ({} {} {})'.format(prefix, n, scale[0], scale[1], scale[2]) if scale != None else ''
		], read=False)
		
		if segmentationClass == None and autoSegment == True:
			segmentationClass = strToSeg(tags[0]) if tags != None else strToSeg(t)
		
		if segmentationClass != None:
			if isinstance(segmentationClass, list):
				common.sendData([
					'"{}/{}" ADD Segmentation.ClassGroup'.format(prefix, n),
					'"{}/{}" SET Segmentation.ClassGroup itemsClassName "{}"'.format(prefix, n, segmentationClass[i])
				], read=False)
			else:
				common.sendData([
					'"{}/{}" ADD Segmentation.ClassGroup'.format(prefix, n),
					'"{}/{}" SET Segmentation.ClassGroup itemsClassName "{}"'.format(prefix, n, segmentationClass)
				], read=False)
		
		if orbit == True:
			common.sendData('cameras SET Orbit target {}/{}'.format(prefix, n), read=False)
		
		if randomColors != None:
			if randomColors == True:
				addRandomColor(objs='{}/{}'.format(prefix, n), colors=0, colorsWeights=randomColorsWeights, spawner=True, method='Random', partsNames=partsNames)
			else:
				addRandomColor(objs='{}/{}'.format(prefix, n), colors=randomColors, colorsWeights=randomColorsWeights, spawner=True, partsNames=partsNames)
		
		common.sendData('"{}/{}" SET active true'.format(prefix, n))
		settings.obj.append('{}/{}'.format(prefix, t))
		i = i + 1
	
	if flush:
		common.flushBuffer()


def spawnRadiusGeneric(
	types=[], tags=None, scale=[1,1,1], innerradius=0, radius=500, position=[0,0,0],
	rotation=[0,0,0], limit=50, segmentationClass=None, orbit=False,
	stickToGround=False, collisionCheck=True, suffix="", flush=False, prefix='spawner',
	names=None, uglyFix=True, seed=None, randomColors=None, randomColorsWeights=14,
	partsNames=None, autoSegment=False
):
	"""
	Creates a torus shaped object spawner
	
	# Arguments
	
	types (list): List of names for spawned objects
	tags (list): List of object tags to be spawned, this should align with the number of arguments on types
	scale (list): X,Y,Z scale factor, defaults to `[1,1,1]`
	innerradius (float): Defines a innerradius exclusion area, defaults to `0`
	radius (float): Defines torus radius, defaults to `500`
	position (list): X,Y,Z position of radius spawner
	rotation (list): X,Y,Z rotation position of radius spawner
	limit (int): Number of objects to spawn in each of the `types`
	segmentationClass (list): Defines segmentation classes to be bound to the spawner, this must align with the number of arguments on types, defaults to `None`
	orbit (bool): Adds orbiting component to spawner
	stickToGround (bool): Forces spawned objects to stick to ground, ideal for irregular ground. defaults to `False`
	collisionCheck (bool): Avoids objects from being spawned overlapping eachother and other objects in the scene, defaults to `True`
	suffix (string): Adds a suffix string on types
	flush (bool): Forces a telnet queue flush after spawning, defaults to `False`
	prefix (string): Defines a root game object to nest types into, defaults to `spawner`
	names (list): Overrides type caption, must be aligned with the number of arguments on types, defaults to `None`
	uglyFix (bool): Ugly fix for asset naming, defaults to `True`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None`
	randomColors (int): Defines a number of random colors to assign to spawner, when set to None disables feature, defaults to `None`
	randomColorsWeights (int): Defines a weight for color switching, defaults to `14`
	partsNames (string): Defines a list of parts to be colorized, defaults to `None`
	autoSegment (bool): Automatically segment objects based on types or tags given, defaults to `False`
	
	"""
	return spawner(
		types=types, tags=tags, scale=scale, position=position,
		rotation=rotation, limit=limit, segmentationClass=segmentationClass, orbit=orbit,
		stickToGround=stickToGround, collisionCheck=collisionCheck, suffix=suffix, flush=flush, prefix=prefix,
		names=names, uglyFix=uglyFix, seed=seed, randomColors=randomColors, randomColorsWeights=randomColorsWeights,
		method='Torus', methodParameters={'innerRadius': innerradius, 'radius': radius},
		partsNames=partsNames
	)

def spawnRectangleGeneric(
	types=[], tags=None, scale=[1,1,1], a=1, b=500, position=[0,0,0],
	rotation=[0,0,0], limit=50, segmentationClass=None, orbit=False,
	stickToGround=False, collisionCheck=True, suffix="", flush=False, prefix='spawner',
	names=None, seed=None, randomColors=None, randomColorsWeights=14, partsNames=None, autoSegment=False
):
	"""
	Creates a rectangle shaped object spawner
	
	# Arguments
	
	types (list): List of names for spawned objects
	tags (list): List of object tags to be spawned, this should align with the number of arguments on types
	scale (list): X,Y,Z scale factor, defaults to `[1,1,1]`
	a (float): Side A size, defaults to `1`
	b (float): Side B size, defaults to `500`
	position (list): X,Y,Z position of rectangle spawner
	rotation (list): X,Y,Z rotation position of rectangle spawner
	limit (int): Number of objects to spawn in each of the `types`
	segmentationClass (list): Defines segmentation classes to be bound to the spawner, this must align with the number of arguments on types, defaults to `None`
	orbit (bool): Adds orbiting component to spawner
	stickToGround (bool): Forces spawned objects to stick to ground, ideal for irregular ground. defaults to `False`
	collisionCheck (bool): Avoids objects from being spawned overlapping eachother and other objects in the scene, defaults to `True`
	suffix (string): Adds a suffix string on types
	flush (bool): Forces a telnet queue flush after spawning, defaults to `False`
	prefix (string): Defines a root game object to nest types into, defaults to `spawner`
	names (list): Overrides type caption, must be aligned with the number of arguments on types, defaults to `None`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None`
	randomColors (int): Defines a number of random colors to assign to spawner, when set to None disables feature, defaults to `None`
	randomColorsWeights (int): Defines a weight for color switching, defaults to `14`
	partsNames (string): Defines a list of parts to be colorized, defaults to `None`
	autoSegment (bool): Automatically segment objects based on types or tags given, defaults to `False`
	
	"""
	return spawner(
		types=types, tags=tags, scale=scale, position=position,
		rotation=rotation, limit=limit, segmentationClass=segmentationClass, orbit=orbit,
		stickToGround=stickToGround, collisionCheck=collisionCheck, suffix=suffix, flush=flush, prefix=prefix,
		names=names, uglyFix=uglyFix, seed=seed, randomColors=randomColors, randomColorsWeights=randomColorsWeights,
		method='Rectangle', methodParameters={'a': a, 'b': b}, partsNames=partsNames
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
		
		settings.obj.append('{}/{}'.format(prefix, t))
	
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
	
	"""
	k = 0
	idx = 0
	j = len(cars_lst)
	
	# cars common parent
	# common.sendData('CREATE cars')
	# settings.obj.append('cars')
	
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
		
		settings.obj.append('{}/car_{}'.format(prefix, k))
		k += 1
		pZ += distH
		
		if pZ > distLimit:
			pZ = -distLimit
			pX += distV
	
	common.flushBuffer()

def spawnMiscObjs(destroy=False, prefix='spawner', seed=None):
	"""
	Spawns city / animals / cars objects
	
	# Attributes
	
	destroy (bool): Destroy objects before creating them, defaults to `False`
	prefix (string): Spawner root object where spawned objects will be nested within, defaults to `spawner`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None`
	
	"""
	if destroy == True:
		common.sendData([
			'DELETE "{}/city"'.format(prefix),
			'DELETE "{}/animals"'.format(prefix),
			'DELETE "{}/cars"'.format(prefix)
		], read=False)
		
		common.flushBuffer()
	
	spawnRadiusGeneric(['city/nature/trees'], tags=['tree'], collisionCheck=False, limit=random.randint(100, 350), radius=80, innerradius=random.randint(30, 50), position=[0,10,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['city/signs'], tags=['sign'], limit=random.randint(80, 250), radius=random.randint(15, 40), innerradius=0, position=[0,10,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['animals'], tags=['animals'], limit=random.randint(150, 250), radius=random.randint(40, 80), innerradius=0, position=[0,10,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['city/buildings'], tags=['building'], limit=random.randint(50, 150), radius=335, innerradius=random.randint(80, 100), position=[0,10,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['cars'], tags=['car'], limit=random.randint(50, 150), radius=50, innerradius=0, segmentationClass="Car", orbit=True, position=[0,10,0], prefix=prefix, seed=seed)

	spawnRadiusGeneric(['city/ground'], tags=['ground'], suffix='_0', limit=3, radius=75, innerradius=0, scale=[1,1,1], position=[0,0,0], collisionCheck=False, prefix=prefix, seed=seed)

def spawnDroneObjs(
	destroy=False, ground_position=[84,0,0], groundLimit=0,
	distH=25, distV=25, distLimit=150, pX=-150, pZ=-350, pY=0,
	birdsRadius=120, birdsInnerRadius=0, carsRadius=50, carsInnerRadius=5,
	treesLimit=[150,200], buildingsRadius=120, buildingsInnerRadius=60, treesRadius=80, treesInnerRadius=10,
	buildingsLimit=[150,150], birdsLimit=[25,100], carsLimit=[75,75], dronesLimit=[80,200], prefix='spawner',
	treesTags=['tree'], buildingsTags=['building'], birdsTags=['bird'], carsTags=['car'], dronesTags=['drones'],
	trees_colors=None, buildings_colors=None, birds_colors=None, cars_colors=None, dronesColors=None,
	treesPartsNames=None, buildingsPartsNames=None, birdsPartsNames=None, carsPartsNames=None, dronesPartsNames=None,
	# groundSegment='VOID', treesSegment='VOID', buildingsSegment='VOID', birdsSegment='VOID', carsSegment='VOID', dronesSegment='DRONE',
	# groundSegment='GROUND', treesSegment='TREE', buildingsSegment='BUILDING', birdsSegment='BIRD', carsSegment='CAR', dronesSegment='DRONE',
	groundSegment=None, treesSegment=None, buildingsSegment=None, birdsSegment=None, carsSegment=None, dronesSegment='DRONE',
	thermal=None, seed=None
):
	"""
	Spawns trees / buildings / birds / donres and cars objects
	
	# Attributes
	
	destroy (bool): Destroy objects before creating them, defaults to `False`
	prefix (string): Spawner root object where spawned objects will be nested within, defaults to `spawner`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None`
	"""
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
			settings.obj.append('city/ground_{}'.format(k))
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
	
	spawnRadiusGeneric(['city/ground'], tags=['ground'], limit=300, radius=150, innerradius=0, scale=[3,3,3], position=[0,0,0], collisionCheck=False, prefix=prefix, seed=seed)
	spawnRadiusGeneric(['humans'], tags=['human, +random'], suffix='_0', limit=40, radius=30, innerradius=2, position=[0,0,0], collisionCheck=False, prefix=prefix, seed=seed)
	spawnRadiusGeneric(['city/nature/trees'], partsNames=treesPartsNames, segmentationClass=treesSegment, randomColors=trees_colors, tags=treesTags, collisionCheck=False, limit=random.randint(treesLimit[0], treesLimit[1]), radius=treesRadius, innerradius=treesInnerRadius, position=[0,0,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['city/buildings'], partsNames=buildingsPartsNames, segmentationClass=buildingsSegment, randomColors=buildings_colors, tags=buildingsTags, stickToGround=False, collisionCheck=False, limit=random.randint(buildingsLimit[0], buildingsLimit[1]), radius=buildingsRadius, innerradius=buildingsInnerRadius, position=[0,0,0], prefix=prefix, seed=seed)
#	spawnRadiusGeneric(['buildings_001'], partsNames=buildingsPartsNames, segmentationClass=buildingsSegment, randomColors=buildings_colors, tags=buildingsTags, stickToGround=False, collisionCheck=False, limit=random.randint(buildingsLimit[0], buildingsLimit[1]), radius=buildingsRadius, innerradius=buildingsInnerRadius, position=[0,0,0], prefix=prefix, seed=seed)
#	spawnRadiusGeneric(['buildings_002'], partsNames=buildingsPartsNames, segmentationClass=buildingsSegment, randomColors=buildings_colors, tags=buildingsTags, stickToGround=False, collisionCheck=False, limit=random.randint(buildingsLimit[0], buildingsLimit[1]), radius=buildingsRadius, innerradius=buildingsInnerRadius, position=[0,0,0], prefix=prefix, seed=seed)
#	spawnRadiusGeneric(['buildings_003'], partsNames=buildingsPartsNames, segmentationClass=buildingsSegment, randomColors=buildings_colors, tags=buildingsTags, stickToGround=False, collisionCheck=False, limit=random.randint(buildingsLimit[0], buildingsLimit[1]), radius=buildingsRadius, innerradius=buildingsInnerRadius, position=[0,0,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['animals/birds'], partsNames=birdsPartsNames, segmentationClass=birdsSegment, randomColors=birds_colors, tags=birdsTags, limit=random.randint(birdsLimit[0], birdsLimit[1]), radius=birdsRadius, innerradius=birdsInnerRadius, position=[0,random.randint(15,95),0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['cars'], partsNames=carsPartsNames, segmentationClass=carsSegment, randomColors=cars_colors, tags=carsTags, collisionCheck=False, limit=random.randint(carsLimit[0], carsLimit[1]), radius=carsRadius, innerradius=carsInnerRadius, position=[0,0,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['roadsigns'], tags=['roadsign'], limit=250, radius=80, collisionCheck=False, innerradius=15, position=[0,0,0], prefix=prefix, seed=seed)
	
	
	if dronesLimit[1] > 0:
		# spawnRadiusGeneric(['drones'], segmentationClass=dronesSegment, randomColors=dronesColors, tags=dronesTags, uglyFix=False, limit=random.randint(dronesLimit[0], dronesLimit[1]), radius=random.randint(30,50), innerradius=0, position=[0,0,0], prefix=prefix, seed=seed)
		spawner(
			['drones'], segmentationClass=dronesSegment, partsNames=dronesPartsNames, randomColors=dronesColors, tags=dronesTags, uglyFix=False, limit=random.randint(dronesLimit[0], dronesLimit[1]),
			# prefix=prefix,
			# position=[0,0,0],
			position=None,
			prefix='cameras/spawner',
			seed=seed,
			method='Frustum',
			methodParameters={'cam': '"cameras/cameraRGB"'},
			minDistance=2,
			maxDistance=5,
			
		)
	
	if thermal != None:
		common.sendData([
			'"city" ADD Thermal.ThermalObjectOverride',
			'"city" ADD Thermal.ThermalObjectBehaviour',
			'"city" SET Thermal.ThermalObjectBehaviour profile "{}"'.format(thermal)
		])
		
		if not any('thermal' in s for s in birdsTags) and birdsLimit[1] > 0:
			common.sendData([
				'"{}/animals" ADD Thermal.ThermalObjectOverride'.format(prefix),
				'"{}/animals" ADD Thermal.ThermalObjectBehaviour'.format(prefix),
				'"{}/animals" SET Thermal.ThermalObjectBehaviour profile "{}"'.format(prefix, thermal)
			], read=False)
		
		if not any('thermal' in s for s in carsTags) and carsLimit[1] > 0:
			common.sendData([
				'"{}/cars" ADD Thermal.ThermalObjectOverride'.format(prefix),
				'"{}/cars" ADD Thermal.ThermalObjectBehaviour'.format(prefix),
				'"{}/cars" SET Thermal.ThermalObjectBehaviour profile "{}"'.format(prefix, thermal)
			], read=False)
		
		if not any('thermal' in s for s in dronesTags) and dronesLimit[1] > 0:
			common.sendData([
				'"{}/drones" ADD Thermal.ThermalObjectOverride'.format(prefix),
				'"{}/drones" ADD Thermal.ThermalObjectBehaviour'.format(prefix),
				'"{}/drones" SET Thermal.ThermalObjectBehaviour profile "{}"'.format(prefix, thermal)
			], read=False)
	
	common.sendData([
		'"city" SET active true'
	], read=True)

def spawnDroneObjs_alt(
	destroy=False, groundLimit=204,
	distH=120, distV=120, distLimit=1000,
	pX=-20, pZ=-1000, pY=0, prefix='spawner',
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
			settings.obj.append('city/ground_{}'.format(k))
			k += 1
			pZ += distH
			
			if pZ > distLimit:
				pZ = -distLimit
				pX += distV
	
	spawnRadiusGeneric(['city/nature/trees'], tags=['tree'], limit=random.randint(600,600), radius=80, innerradius=30, position=[0,0,0], collisionCheck=False, prefix=prefix, seed=seed)
	spawnRadiusGeneric(['city/buildings'], tags=['building'], limit=random.randint(10,10), radius=335, innerradius=100, position=[0,0,0], collisionCheck=False, prefix=prefix, seed=seed)
	spawnRadiusGeneric(['animals/birds'], tags=['bird'], limit=random.randint(10,10), radius=random.randint(80,110), innerradius=0, position=[0,random.randint(15,95),0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['cars'], tags=['car'], limit=random.randint(5, 10), radius=50, innerradius=5, position=[0,0,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['drones/white'], limit=random.randint(80,80), radius=random.randint(80,110), innerradius=0, position=[0,random.randint(15,65),0], segmentationClass="Car", prefix=prefix, seed=seed)
	
	common.flushBuffer()

def spawnAnimalsObjs(destroy=False, prefix='spawner', seed=None):
	"""
	Spawns trees and animals
	
	# Attributes
	
	destroy (bool): Destroy objects before creating them, defaults to `False`
	prefix (string): Spawner root object where spawned objects will be nested within, defaults to `spawner`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None`
	"""
	if destroy == True:
		common.sendData([
			'DELETE "{}/city"'.format(prefix),
			'DELETE "{}/animals"'.format(prefix)
		], read=False)
	
	spawnRadiusGeneric(['city/nature/trees'], tags=['tree'], collisionCheck=True, stickToGround=True, limit=random.randint(150, 400), radius=80, innerradius=random.randint(30, 50), position=[0,5,0], prefix=prefix, seed=seed)
	spawnRadiusGeneric(['animals'], tags=['animal'], collisionCheck=True, stickToGround=True, limit=random.randint(200, 350), radius=random.randint(40, 80), innerradius=0, position=[0,5,0], orbit=True, prefix=prefix, seed=seed)
	
	common.flushBuffer()
