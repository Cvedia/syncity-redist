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

def global_camera_setup(
	label_root='cameras', canvas_width=1024, canvas_height=768, canvas=None,
	orbit=True, orbitOffset=None, orbitGround=None, orbitSnap=None, position=None
):
	"""
	Sets up camera root object
	
	# Arguments
	
	label_root (string): Root game object name/path, defaults to `cameras`
	canvas (bool): Canvas switch, defaults to `False`
	canvas_width (int): Display canvas width, defaults to `1024`
	canvas_height (int): Display canvas height, defaults to `768`
	orbit (bool): Adds orbiting component, defaults to `True`
	orbitOffset (list): Defines offset x,y,z coordinates from orbiting object target, defaults to `None`
	orbitGround (string): Defines a object to orbit ground position from, defaults to `None`
	orbitSnap (int): Defines a Y snap position from orbited object, defaults to `None`
	position (list): Defines a position, if not set defaults to X,Y,Z compensation values
	
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
	
	common.send_data([
		'CREATE {}'.format(label_root),
		'{} SET active false'.format(label_root),
		'{} SET Transform position ({} {} {})'.format(label_root, settings.X_COMP -6, settings.Y_COMP, settings.Z_COMP -50) if position == None else '{} SET Transform position ({} {} {})'.format(label_root, position[0], position[1], position[2]),
		'{} SET Transform eulerAngles ({} {} {})'.format(label_root, 0, 0, 0),
		
		# orbit
		'{} ADD Orbit'.format(label_root) if orbit == True else '',
		'{} SET Orbit groundObj "{}"'.format(label_root, orbitGround) if orbitGround != None else '',
		'{} SET Orbit targetOffset ({} {} {})'.format(label_root, orbitOffset[0], orbitOffset[1], orbitOffset[2]) if orbitOffset != None else '',
		'{} SET Orbit snapOffset {}'.format(label_root, orbitSnap) if orbitSnap != None else '',
		
		# resize camera display on app, this is relative to the size of the window
		'Canvas/Cameras/Viewport/Content SET UI.GridLayoutGroup cellSize ({} {})'.format(canvas_width, canvas_height),
		'Canvas SET active {}'.format(canvas)
	], read=False)
	
	settings.obj.append(label_root)

def add_camera_depth(
	width=2048, height=1536,
	label='cameras/depth',
	fov=60,
	clipping_near=0.3,
	clipping_far=1000
):
	"""
	Creates a depth camera
	
	# Arguments
	
	width (int): Resolution width, defaults to `2048`
	height (int): Resolution height, defaults to `1536`
	label (string): Game object path, defaults to `cameras/depth` - This should follow `label_root` from `global_camera_setup`
	fov (int): Field of view, defaults to `60`
	clipping_near (float): Near clipping distance, defaults to `0.3` - Objects closer than this distance won't appear
	clipping_far (float): Far clipping distance, defaults to `1000` - Objects further from this distance won't appear
	
	"""
	common.send_data([
		'CREATE {}'.format(label),
		'{} SET active false'.format(label),
		'{} ADD Camera'.format(label),
		'{} SET Camera near {}'.format(label, clipping_near),
		'{} SET Camera far {}'.format(label, clipping_far),
		'{} SET Camera fov {}'.format(label, fov),
		'{} ADD Sensors.RenderCamera'.format(label),
		'{} SET Sensors.RenderCamera format RFloat'.format(label),
		'{} SET Sensors.RenderCamera resolution ({} {})'.format(label, width, height),
		'{} SET Camera renderingPath DeferredShading'.format(label),
		# '{} ADD AudioListener'.format(label),
		'{} ADD Sensors.Lidar_Internal.RenderDepthBufferOld'.format(label) if settings.use_old_depth_buffer else '{} ADD CameraDepthOutput'.format(label),
		# '{} ADD Cameras.RenderDepthBuffer'.format(label),
		'{} SET active true'.format(label)
	], read=False)
	
	common.flush_buffer()
	settings.obj.append(label)

def add_camera_rgb(
	width=2048, height=1536, audio=True, envirosky=None, flycam=False,
	label_root='cameras', label='cameras/cameraRGB', pp=None,
	renderingPath=4, textureFormat=4,
	
	fov=60,
	clipping_near=0.3,
	clipping_far=1000,
	
	envirosky_cloudTransitionSpeed=100, envirosky_effectTransitionSpeed=100,
	envirosky_fogTransitionSpeed=100, envirosky_progressTime='None',
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
	label_root (string): Root game object name/path, defaults to `cameras`
	label (string): Game object path, defaults to `cameras/cameraRGB` - This should follow `label_root` from `global_camera_setup`
	pp (string): Defines a postprocessing stack, defaults to `None`
	renderingPath (int): Defines rendering path, defaults to `4` - This is defined on unity_vars lookup table
	textureFormat (int): Defines texture format, defaults to `4` - This is defined on unity_vars lookup table
	fov (int): Field of view, defaults to `60`
	clipping_near (float): Near clipping distance, defaults to `0.3` - Objects closer than this distance won't appear
	clipping_far (float): Far clipping distance, defaults to `1000` - Objects further from this distance won't appear
	envirosky_cloudTransitionSpeed (int): Defines cloud transition speed, defaults to `100` which is instant
	envirosky_effectTransitionSpeed (int): Defines weather transition speed, defaults to `100` which is instant
	envirosky_fogTransitionSpeed (int): Defines fog deposition speed, defaults to `100` which is instant
	envirosky_progressTime (string): Defines time progression, defaults to `None` avoiding time to change
	renderCamera (bool): Binds a renderCamera component allowing for disk exports, defaults to `True`
	
	
	"""
	if envirosky == None:
		if settings.disable_envirosky:
			envirosky = False
		else:
			envirosky = True
	
	common.send_data([
		'CREATE {}'.format(label),
		'{} SET active false'.format(label),
		'{} ADD Camera'.format(label),
		'{} SET Camera near {}'.format(label, clipping_near),
		'{} SET Camera far {}'.format(label, clipping_far),
		'{} SET Camera fov {}'.format(label, fov)
	], read=False)
	
	if renderCamera:
		common.send_data([
			'{} ADD Sensors.RenderCamera'.format(label),
			
			# '{} SET Sensors.RenderCamera sRGB true'.format(label),
			'{} SET Sensors.RenderCamera format {}'.format(label, unity_vars.textureFormat[textureFormat]),
			'{} SET Sensors.RenderCamera resolution ({} {})'.format(label, width, height),
			'{} SET Camera renderingPath {}'.format(label, unity_vars.renderingPath[renderingPath]),
			
			# 'cameras/cameraRGB SET Camera targetTexture.antiAliasing 8',
			# 'cameras/cameraRGB SET active true',
		], read=False)
	
	if audio:
		common.send_data(['{} ADD AudioListener'.format(label)], read=False)
	if flycam:
		common.send_data([
			'{} ADD FlyCamera'.format(label),
			'{} SET FlyCamera enabled true'.format(label)
		], read=False)
	if envirosky:
		common.send_data([
			'CREATE EnviroSky EnviroSky',
			'EnviroSky SET EnviroSky Player {}'.format(label_root),
			'EnviroSky SET EnviroSky PlayerCamera {}'.format(label),
			
			# time progression
			'EnviroSky SET EnviroSky GameTime.ProgressTime {}'.format(envirosky_progressTime),
			
			# skip weather transitions
			'EnviroSky SET EnviroSky weatherSettings.cloudTransitionSpeed {}'.format(envirosky_cloudTransitionSpeed),
			'EnviroSky SET EnviroSky weatherSettings.effectTransitionSpeed {}'.format(envirosky_effectTransitionSpeed),
			'EnviroSky SET EnviroSky weatherSettings.fogTransitionSpeed {}'.format(envirosky_fogTransitionSpeed),
			
			'{} ADD EnviroCamera'.format(label),
			'EnviroSky SET active true'.format(label)
		], read=False)
	
	common.send_data([
		'{} SET active true'.format(label_root),
		'{} SET active true'.format(label)
	], read=False)
	
	common.flush_buffer()
	
	if pp != None:
		add_camera_rgb_pp(profile=pp, label=label)
	
	settings.obj.append(label)

def add_camera_thermal(
	width=2048, height=1536, audio=False,
	label='cameras/thermal',
	renderingPath=4, textureFormat=4,
	
	fov=60,
	clipping_near=0.3,
	clipping_far=1000,
	
	ambientTemperature=16, minimumTemperature=10,
	maximumTemperature=30, maxDistanceForProbeUpdate=100,
	useAGC='true',
	
	patchyness=True,
	patchyness_fixDistance=10.6, patchyness_distance=0.06,
	patchyness_size=0.481, patchyness_intensity=0.60,
	
	trees=False,
	trees_base=10, trees_bandwidth=3, trees_median=0.5,
	trees_leafs_variance=4,
	
	blur=True,
	blur_noise=[2, 1],
	
	renderCamera=True
):
	"""
	Creates a Thermal camera with special postprocessing features
	
	# Arguments
	
	width (int): Resolution width, defaults to `2048`
	height (int): Resolution height, defaults to `1536`
	audio (bool): Audio listener, defaults to `False` - You must have at one audio listener on the scene
	label (string): Game object path, defaults to `cameras/cameraRGB` - This should follow `label_root` from `global_camera_setup`
	renderingPath (int): Defines rendering path, defaults to `4` - This is defined on unity_vars lookup table
	textureFormat (int): Defines texture format, defaults to `4` - This is defined on unity_vars lookup table
	fov (int): Field of view, defaults to `60`
	clipping_near (float): Near clipping distance, defaults to `0.3` - Objects closer than this distance won't appear
	clipping_far (float): Far clipping distance, defaults to `1000` - Objects further from this distance won't appear
	
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
	trees_base (float): Tree base temperature, defaults to `10`
	trees_bandwidth (float): Heat pattern bandwidth, defaults to `3`
	trees_median (float): Heat pattern median, defaults to `0.5`
	trees_leafs_variance (int): Define how much diffuse heat will be applied to tree leafs, defaults to `4`
	
	blur (bool): Enables / disable blur effect, defaults to `True`
	blur_noise (list of min / max): Defines noise blur distance, defaults to `[2, 1]`
	
	renderCamera (bool): Binds a renderCamera component allowing for disk exports, defaults to `True`
	
	# Notes
	
	- patchyness effects mimic thermal cameras averaging feature from mid / long distance focal points
	- blur effects mimics noise around object edges, more visible when close by
	
	"""
	common.send_data([
		'CREATE {}'.format(label),
		'{} SET active false'.format(label),
		'{} ADD Camera'.format(label),
		'{} SET Camera near {}'.format(label, clipping_near),
		'{} SET Camera far {}'.format(label, clipping_far),
		'{} SET Camera fov {}'.format(label, fov)
	], read=False)
	
	if renderCamera:
		common.send_data([
			'{} ADD Sensors.RenderCamera'.format(label),
			
			'{} SET Sensors.RenderCamera format {}'.format(label, unity_vars.textureFormat[textureFormat]),
			'{} SET Sensors.RenderCamera resolution ({} {})'.format(label, width, height),
			'{} SET Camera renderingPath {}'.format(label, unity_vars.renderingPath[renderingPath])
		], read=False)
	
	if audio:
		common.send_data(['{} ADD AudioListener'.format(label)], read=False)
	
	common.send_data([
		'{} ADD Thermal.ThermalCamera'.format(label),
		'{} SET Thermal.ThermalCamera enabled false'.format(label)
	], read=False)
	
	if patchyness:
		common.send_data([
			'{} ADD CameraFilterPack_Pixelisation_DeepOilPaintHQ'.format(label),
			'{} SET CameraFilterPack_Pixelisation_DeepOilPaintHQ enabled false'.format(label),
			'{} SET CameraFilterPack_Pixelisation_DeepOilPaintHQ _FixDistance {}'.format(label, patchyness_fixDistance),
			'{} SET CameraFilterPack_Pixelisation_DeepOilPaintHQ _Distance {}'.format(label, patchyness_distance),
			'{} SET CameraFilterPack_Pixelisation_DeepOilPaintHQ _Size {}'.format(label, patchyness_size),
			'{} SET CameraFilterPack_Pixelisation_DeepOilPaintHQ Intensity {}'.format(label, patchyness_intensity),
			'{} SET CameraFilterPack_Pixelisation_DeepOilPaintHQ enabled true'.format(label)
		], read=False)
	
	if blur:
		common.send_data([
			'{} ADD CameraFilterPack_Blur_Noise'.format(label),
			'{} SET CameraFilterPack_Blur_Noise enabled false'.format(label),
			'{} SET CameraFilterPack_Blur_Noise Distance ({} {})'.format(label, blur_noise[0], blur_noise[1]),
			'{} SET CameraFilterPack_Blur_Noise enabled true'.format(label)
		], read=False)
	
	if trees:
		common.send_data([
			'{} ADD Thermal.GlobalTreeSettings'.format(label),
			'{} SET Thermal.GlobalTreeSettings enabled false'.format(label),
			'{} SET Thermal.GlobalTreeSettings temperature {}'.format(label, trees_base),
			'{} SET Thermal.GlobalTreeSettings temperatureBandwidth {}'.format(label, trees_bandwidth),
			'{} SET Thermal.GlobalTreeSettings temperatureMedian {}'.format(label, trees_median),
			'{} SET Thermal.GlobalTreeSettings treeLeafsHeatVariance {}'.format(label, trees_leafs_variance),
			'{} SET Thermal.GlobalTreeSettings enabled true'.format(label)
		], read=False);

	common.send_data([
		'{} ADD UnityEngine.PostProcessing.PostProcessingBehaviour'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile Thermal'.format(label),
		
		'{} SET Thermal.ThermalCamera ambientTemperature {}'.format(label, ambientTemperature),
		'{} SET Thermal.ThermalCamera temperatureRange ({} {})'.format(label, minimumTemperature, maximumTemperature),
		
		'{} SET Thermal.ThermalCamera maxDistanceForProbeUpdate {}'.format(label, maxDistanceForProbeUpdate),
		'{} SET Thermal.ThermalCamera useAGC {}'.format(label, useAGC),
		'{} SET Thermal.ThermalCamera enabled true'.format(label)
	], read=False)
		
	common.send_data([
		'{} SET active true'.format(label)
	], read=False)
	
	common.flush_buffer()
	
	settings.obj.append(label)

def camera_pp_thermal(label='cameras/cameraRGB'):
	"""
	This is a dummy function that demonstrates all possible configurable values on a camera profile, in this case we're showing off all parameters tuned to a thermal profile
	"""
	common.send_data([
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.enabled false'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.enabled false'.format(label),
		
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled true'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.intensity {}'.format(label, 2),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.threshold {}'.format(label, 1.1),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.softKnee {}'.format(label, .6),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.radius {}'.format(label, 4.36),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.antiFlicker {}'.format(label, 'true'),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.lensDirt.intensity {}'.format(label, 3),
		
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.enabled false'.format(label),
		
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.enabled false'.format(label),
		
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.enabled false'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.dithering.enabled false'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled false'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.fog.enabled false'.format(label),
		
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled true'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.colored 1'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.intensity 0.68'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.luminanceContribution 1'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.size 0.3'.format(label),
		
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.enabled false'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.enabled false'.format(label),
	], read=False)

# WARNING: It's not recommended to use Scion with Envirosky
def add_camera_rgb_pp(profile='Profile2', scion=False, label='cameras/cameraRGB'):
	common.send_data([
		# 'cameras/cameraRGB SET active false',
		'{} ADD UnityEngine.PostProcessing.PostProcessingBehaviour'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile {}'.format(label, profile)
	], read=False)
	
	if scion:
		if not settings.disable_envirosky:
			common.output('WARNING: Using scion with envirosky is not recommended')
		common.send_data([
			'{} ADD ScionEngine.ScionPostProcess'.format(label),
			'{} SET ScionEngine.ScionPostProcess bloom true'.format(label),
			'{} SET ScionEngine.ScionPostProcess bloomIntensity 0.3'.format(label),
			'{} SET ScionEngine.ScionPostProcess grain false'.format(label),
			'{} SET ScionEngine.ScionPostProcess vignette false'.format(label),
			'{} SET ScionEngine.ScionPostProcess chromaticAberration false'.format(label),
			'{} SET ScionEngine.ScionPostProcess lensFlare false'.format(label),
			'{} SET ScionEngine.ScionPostProcess lensDirt false'.format(label),
			'{} SET ScionEngine.ScionPostProcess depthOfField false'.format(label),
			# '{} SET active true'
		], read=False)
	else:
		common.send_data('{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false'.format(label))
	
	common.flush_buffer()
	settings.obj.append(label)

def camera_rgb_pp_random(label='cameras/cameraRGB'):
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
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.enabled true'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.fxaaSettings.preset 4'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.method 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.taaSettings.jitterSpread 0.75'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.taaSettings.motionBlending 0.85'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.taaSettings.sharpen 0.3'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.settings.taaSettings.stationaryBlending 0.95'.format(label),
		], read=False)
	else:
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.enabled false'.format(label)
		], read=False)
	
	# ambient occlusion
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.enabled true'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.intensity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.radius 0.3'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.sampleCount 10'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.downsampling 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.forceForwardCompatibility 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.ambientOnly 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.settings.highPrecision 0'.format(label),
		], read=False)
	else:
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.enabled false'.format(label),
		], read=False)
	
	# blooming effects
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled true'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.intensity {}'.format(label, random.randint(0, 100)),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.threshold {}'.format(label, random.uniform(0, 2)),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.softKnee {}'.format(label, random.uniform(0, 1)),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.radius {}'.format(label, random.uniform(1, 7)),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.antiFlicker {}'.format(label, 'true'),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.lensDirt.intensity {}'.format(label, random.randint(0, 10)),
		], read=False)
	else:
		common.send_data(['{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false'.format(label)], read=False)
	
	# chromatic aberration
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.enabled true'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.475'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.spectralTexture.fileID 0'.format(label),
		], read=False)
	else:
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.enabled false'.format(label),
		], read=False)
	
	# color grading
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.enabled true'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.027'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.hueShift 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.postExposure 0.5'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.188'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.temperature 13.8'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.tint 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.blue.x 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.blue.y 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.blue.z 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.currentEditingChannel 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.green.x 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.green.y 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.green.z 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.red.x 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.red.y 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.channelMixer.red.z 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gain.a 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gain.b 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gain.g 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gain.r 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gamma.a 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gamma.b 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gamma.g 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.gamma.r 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.lift.a 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.lift.b 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.lift.g 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.linear.lift.r 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.offset.a 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.offset.b 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.offset.g 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.offset.r 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.power.a 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.power.b 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.power.g 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.power.r 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.slope.a 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.slope.b 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.slope.g 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.log.slope.r 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.colorWheels.mode 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.inSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.outSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.tangentMode 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.time 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.0.value 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.inSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.outSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.tangentMode 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.time 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_Curve.1.value 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_PostInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_PreInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.m_RotationOrder 4'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.curve.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.m_Loop 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.m_Range 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.blue.m_ZeroValue 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurrentEditingCurve 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurveB 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurveG 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurveR 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.e_CurveY 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.inSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.outSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.tangentMode 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.time 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.0.value 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.inSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.outSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.tangentMode 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.time 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_Curve.1.value 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_PostInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_PreInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.m_RotationOrder 4'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.curve.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.m_Loop 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.m_Range 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.green.m_ZeroValue 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.curve.m_PostInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.curve.m_PreInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.curve.m_RotationOrder 4'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.curve.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.m_Loop 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.m_Range 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVShue.m_ZeroValue 0.5'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.curve.m_PostInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.curve.m_PreInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.curve.m_RotationOrder 4'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.curve.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.m_Loop 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.m_Range 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.hueVSsat.m_ZeroValue 0.5'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.curve.m_PostInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.curve.m_PreInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.curve.m_RotationOrder 4'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.curve.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.m_Loop 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.m_Range 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.lumVSsat.m_ZeroValue 0.5'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.inSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.outSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.tangentMode 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.time 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.0.value 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.inSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.outSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.tangentMode 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.time 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_Curve.1.value 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_PostInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_PreInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.m_RotationOrder 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.curve.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.m_Loop 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.m_Range 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.master.m_ZeroValue 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.inSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.outSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.tangentMode 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.time 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.0.value 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.inSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.outSlope 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.tangentMode 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.time 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_Curve.1.value 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_PostInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_PreInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.m_RotationOrder 4'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.curve.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.m_Loop 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.m_Range 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.red.m_ZeroValue 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.curve.m_PostInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.curve.m_PreInfinity 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.curve.m_RotationOrder 4'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.curve.serializedVersion 2'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.m_Loop 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.m_Range 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.curves.satVSsat.m_ZeroValue 0.5'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralBlackIn 0.0073'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralBlackOut 0.0113'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralWhiteClip 10'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralWhiteIn 15'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralWhiteLevel 5.62'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.neutralWhiteOut 15.49'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.tonemapper "2"'.format(label),
		], read=False)
	else:
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.enabled false'.format(label),
		], read=False)
	
	# depth of field
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.enabled true'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.focusDistance 0.1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.aperture 8.7'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.focalLength 200'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.useCameraFov 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.settings.kernelSize 1'.format(label),
		], read=False)
	else:
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.depthOfField.enabled true'.format(label),
		], read=False)
	
	# dithering
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.dithering.enabled true'.format(label),
		], read=False)
	else:
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.dithering.enabled false'.format(label),
		], read=False)
	
	# eye adaptation
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled true'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.adaptationType 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.dynamicKeyValue 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.highPercent 95'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.keyValue 0.25'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.logMax 4'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.logMin -8'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.lowPercent 45'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.maxLuminance 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.minLuminance -5'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.speedDown 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.settings.speedUp 2'.format(label),
		], read=False)
	else:
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled false'.format(label),
		], read=False)
	
	# fog
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.fog.enabled true'.format(label)
		], read=False)
	else:
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.fog.enabled false'.format(label)
		], read=False)
	
	# grain
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled true'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.colored 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.intensity 0.281'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.luminanceContribution 0.8'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.settings.size 0.3'.format(label),
		], read=False)
	else:
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled false'.format(label),
		], read=False)
	
	# motion blur effects
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled true'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.shutterAngle {}'.format(label, random.randint(0, 360)),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount {}'.format(label, random.randint(1, 32)),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending {}'.format(label, random.uniform(0, 1))
		], read=False)
	else:
		common.send_data(['{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false'.format(label)], read=False)
	
	# screen space reflection
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.enabled true'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.blendType 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.reflectionQuality 3'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.maxDistance 99'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.iterationCount 99'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.stepSize 3'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.widthModifier 0.5'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.reflectionBlur 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.reflection.reflectBackfaces 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.intensity.reflectionMultiplier 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.intensity.fadeDistance 100'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.intensity.fresnelFade 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.intensity.fresnelFadePower 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.settings.screenEdgeMask.intensity 0.03'.format(label),
		], read=False)
	else:
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.screenSpaceReflection.enabled false'.format(label),
		], read=False)
	
	# vignette
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.enabled true'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.center.x 0.5'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.center.y 0.5'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.color.a 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.color.b 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.color.g 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.color.r 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.intensity 0.692'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.mask.fileID 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.mode 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.opacity 1'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.rounded 0'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.roundness 0.255'.format(label),
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.settings.smoothness 0.439'.format(label),
		], read=False)
	else:
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.vignette.enabled false'.format(label),
		], read=False)
	
	common.flush_buffer()

def camera_rgb_pp_scion_random(label='cameras/cameraRGB'):
	"""
	Show case for scion camera postprocessing effects
	
	Different from Envirosky, Scion offers a different type of postprocessing stack
	we do not recommend using this, unless you need something in specific from it
	that Envirosky cannot provide.
	"""
	# grain effect
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET ScionEngine.ScionPostProcess grain true'.format(label),
			'{} SET ScionEngine.ScionPostProcess grainIntensity {}'.format(label, random.uniform(0, 0.4))
		], read=False)
	# else:
	# 	common.send_data(['{} SET ScionEngine.ScionPostProcess grain false'.format(label)])
	
	# chromatic aberration
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET ScionEngine.ScionPostProcess chromaticAberration true'.format(label),
			'{} SET ScionEngine.ScionPostProcess chromaticAberrationDistortion {}'.format(label, random.uniform(0, 1)),
			'{} SET ScionEngine.ScionPostProcess chromaticAberrationIntensity {}'.format(label, random.uniform(0, 20))
		], read=False)
	# else:
	# 	common.send_data(['{} SET ScionEngine.ScionPostProcess chromaticAberration false'.format(label)])
	
	# blooming effect
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET ScionEngine.ScionPostProcess bloom true'.format(label),
			'{} SET ScionEngine.ScionPostProcess bloomThreshold {}'.format(label, random.uniform(0, 50)),
			'{} SET ScionEngine.ScionPostProcess bloomIntensity {}'.format(label, random.uniform(0, 1)),
			'{} SET ScionEngine.ScionPostProcess bloomBrightness {}'.format(label, random.uniform(0, 8)),
			'{} SET ScionEngine.ScionPostProcess bloomDownsamples {}'.format(label, random.randint(1, 8)),
			'{} SET ScionEngine.ScionPostProcess bloomDistanceMultiplier {}'.format(label, random.randuniform(0.25, 1.25))
		], read=False)
	# else:
	# 	common.send_data(['{} SET ScionEngine.ScionPostProcess bloom false'])
	
	# vignette
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET ScionEngine.ScionPostProcess vignette true'.format(label),
			'{} SET ScionEngine.ScionPostProcess vignetteIntensity {}'.format(label, rand.uniform(0, 1)),
			'{} SET ScionEngine.ScionPostProcess vignetteScale {}'.format(label, random.uniform(0, 1)),
		], read=False)
	# else:
	#	common.send_data(['{} SET ScionEngine.ScionPostProcess vignette false'.format(label)])
	
	# lens flare
	if bool(random.getrandbits(1)):
		common.send_data([
			'{} SET ScionEngine.ScionPostProcess lensFlare true'.format(label),
			'{} SET ScionEngine.ScionPostProcess lensFlareGhostIntensity {}'.format(label, random.uniform(0, 2)),
			'{} SET ScionEngine.ScionPostProcess lensFlareGhostDispersal {}'.format(label, random.uniform(0, 2)),
			'{} SET ScionEngine.ScionPostProcess lensFlareGhostDistortion {}'.format(label, random.uniform(0, 1)),
			'{} SET ScionEngine.ScionPostProcess lensFlareGhostEdgeFade {}'.format(label, random.uniform(0, 1.5)),
			'{} SET ScionEngine.ScionPostProcess lensFlareHaloIntensity {}'.format(label, random.uniform(0, 2)),
			'{} SET ScionEngine.ScionPostProcess lensFlareHaloWidth {}'.format(label, random.uniform(0, 0.8)),
			'{} SET ScionEngine.ScionPostProcess lensFlareHaloDistortion {}'.format(label, random.uniform(0, 1)),
			'{} SET ScionEngine.ScionPostProcess lensFlareBlurStrength {}'.format(label, random.uniform(0, 1)),
			'{} SET ScionEngine.ScionPostProcess lensFlareDownsamples {}'.format(label, random.randint(1, 3))
		], read=False)
	# else:
	# 	common.send_data(['{} SET ScionEngine.ScionPostProcess lensFlare false'.format(label)])
	
	# tonemapping
	common.send_data(['{} SET ScionEngine.ScionPostProcess tonemappingMode {}'.format(label, random.choice(unity_vars.tonemappings))], read=False)
	common.flush_buffer()

def set_disk_texture(lst, label='disk1'):
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
		common.send_data([
			'{}/{} SET Sensors.RenderCameraLink target {}'.format(label, l.capitalize(), l)
		], read=False)

def add_camera_seg_filter(segments=['Car'], label='cameras/segmentation', unoccluded=None):
	"""
	Creates a filterable bounding boxes with unoccluded option enabled by default.
	This allows you to export json objects containig segmented classes.
	
	# Arguments
	
	segments (list): Defines one or more classes, defaults to `['Car']`
	label (string): Defines a segmentation camera as source, defaults to `cameras/segmentation`
	unoccluded (list): Defines one or more classes to be unoccluded, defaults to `None`
	"""
	
	for s in segments:
		common.send_data([
			'{} PUSH Segmentation.Segmentation boundingBoxesFilter {}'.format(label, s)
		], read=False)
	
	if unoccluded != None:
		for s in segments:
			common.send_data([
				'{} PUSH Segmentation.Segmentation unoccludedClasses {}'.format(label, s)
			], read=False)

# output_type options: Auto, ClassIds, InstanceIds, ClassColors, Raw
def add_camera_seg(
	width=1024, height=768, segments=None, output_type='Auto', label='cameras/segmentation',
	fov=60,
	clipping_near=0.3,
	clipping_far=1000,
	boundingBoxesExtensionAmount=0,
	renderingPath=4, textureFormat=4,
	minimum_visibility=0,
	renderCamera=True,
	lookupTable=True
):
	"""
	Creates a Segmentation camera
	
	# Arguments
	
	width (int): Resolution width, defaults to `2048`
	height (int): Resolution height, defaults to `1536`
	segments (list|string): Defines one or more classes this camera will see, defaults to `None`
	label (string): Game object path, defaults to `cameras/segmentation` - This should follow `label_root` from `global_camera_setup`
	renderingPath (int): Defines rendering path, defaults to `4` - This is defined on unity_vars lookup table
	textureFormat (int): Defines texture format, defaults to `4` - This is defined on unity_vars lookup table
	fov (int): Field of view, defaults to `60`
	clipping_near (float): Near clipping distance, defaults to `0.3` - Objects closer than this distance won't appear
	clipping_far (float): Far clipping distance, defaults to `1000` - Objects further from this distance won't appear
	renderCamera (bool): Binds a renderCamera component allowing for disk exports, defaults to `True`
	lookupTable (list): Binds a color to a class, this is essential for outputting pixel dense images, this is an array of arrays like `[ [ Car , red ] , [ Person, blue ] .. ]`; Defaults to `True` which will automatically populate the segmentation lookup table based on the segments sent.
	minimum_visibility (float): Defines minimum visibility of object in % (0 - 1), objects with less than % of it's total size visible won't appear on the segmentation maps neither yeild bounding boxes, defaults to `0`
	
	# Notes
	
	- patchyness effects mimic thermal cameras averaging feature from mid / long distance focal points
	- blur effects mimics noise around object edges, more visible when close by
	
	"""
	common.send_data([
		'CREATE {}'.format(label),
		'{} SET active false'.format(label),
		'{} ADD Camera'.format(label),
		'{} SET Camera near {}'.format(label, clipping_near),
		'{} SET Camera far {}'.format(label, clipping_far),
		'{} SET Camera fov {}'.format(label, fov),
	], read=False)
	
	if renderCamera:
		common.send_data([
			'{} ADD Sensors.RenderCamera'.format(label),
			'{} SET Sensors.RenderCamera format {}'.format(label, unity_vars.textureFormat[textureFormat]),
			'{} SET Sensors.RenderCamera resolution ({} {})'.format(label, width, height),
		], read=False)
	
	common.send_data([
		'{} SET Camera renderingPath {}'.format(label, unity_vars.renderingPath[renderingPath]),
		'{} SET Camera targetTexture.filterMode Point'.format(label),
		'{} ADD Segmentation.Segmentation'.format(label),
		'{} SET Segmentation.Segmentation minimumObjectVisibility {}'.format(label, minimum_visibility),
		'{} SET Segmentation.Segmentation outputType {}'.format(label, output_type),
		'{} SET Segmentation.Segmentation boundingBoxesExtensionAmount {}'.format(label, boundingBoxesExtensionAmount),
		'{} EXECUTE Segmentation.Segmentation DefineClass Void'.format(label)
	], read=False)
	
	if segments != None:
		add_camera_seg_filter(segments, label=label)
	
	# add default class
	common.send_data([
		'{} ADD Segmentation.LookUpTable'.format(label),
		'{} PUSH Segmentation.LookUpTable classes Void'.format(label),
		'{} PUSH Segmentation.LookUpTable colors black'.format(label)
	], read=False)
	
	if lookupTable == True and segments != None:
		idx = 0
		for i in segments:
			if idx > len(unity_vars.colors):
				color = '"{}"'.format(get_random_color())
			else:
				color = unity_vars.colors[idx]
			common.send_data([
				'{} EXECUTE Segmentation.Segmentation DefineClass "{}"'.format(label, i),
				'{} PUSH Segmentation.LookUpTable classes "{}"'.format(label, i),
				'{} PUSH Segmentation.LookUpTable colors "{}"'.format(label, color)
			], read=False)
			idx += 1
	elif isinstance(lookupTable, list):
		for i in lookupTable:
			common.send_data([
				'{} EXECUTE Segmentation.Segmentation DefineClass "{}"'.format(label, i[0]),
				'{} PUSH Segmentation.LookUpTable classes "{}"'.format(label, i[0]),
				'{} PUSH Segmentation.LookUpTable colors "{}"'.format(label, i[1])
			], read=False)
	
	common.send_data([
		'{} EXECUTE Segmentation.LookUpTable MarkTextureDirty'.format(label),
		'{} SET active true'.format(label)
	], read=False)
	common.flush_buffer()
	settings.obj.append(label)

def add_light(position=[34,-22.53,0], intensity=1.7, label='light'):
	"""
	Creates a light object
	
	This is not recommened when you have envirosky enabled, as it will swamp the
	rgb rendering with light, but it depends on the application.
	
	# Arguments
	
	position (list): X,Y,Z position, defaults to `[32,-22.53,0]`
	intensity (float): Light intensity, defaults to `1.7`
	label (string): Game object name, defaults to `light`
	
	"""
	common.send_data([
		'CREATE {}'.format(label),
		'{} ADD Light'.format(label),
		'{} SET Light type Directional'.format(label),
		'{} SET Transform eulerAngles ({} {} {})'.format(label, position[0], position[1], position[2]),
		'{} SET Light intensity {}'.format(label, intensity),
		# '{} SET Light color #'.format(label),
		'{} SET Light shadows Soft'.format(label),
		'{} SET active true'.format(label)
	], read=False)
	
	common.flush_buffer()
	settings.obj.append(label)

def global_disk_setup(label='disk1', output_path=None):
	"""
	Setups the disk output module root component
	
	# Arguments
	
	label (string): Game object name, defaults to `disk1`
	output_path (string): Image output path, when not set, defaults to settings.output_path (set by the syncity inialization script)
	
	"""
	if settings.skip_disk:
		return
	if output_path == None:
		output_path = settings.output_path
	common.send_data([
		'CREATE {}'.format(label),
		'{} SET active false'.format(label),
		'{} ADD Sensors.Disk'.format(label),
		'{} SET Sensors.Disk path "{}"'.format(label, output_path),
		'{} SET active true'.format(label)
	], read=False)
	
	common.flush_buffer()
	settings.obj.append(label)

def do_render(lst):
	"""
	By default syncity simulator doesn't render anything unless it's necessary, this method allows you to render one frame.
	This funcionality works with renderCamera component and is intended for outputting data.
	When you trigger a RenderFrame the object that contain a renderCamera will render ONE frame and disable the Camera object.
	
	# Arguments
	
	lst (list): List of cameras to call RenderFrame
	
	"""
	for l in lst:
		common.send_data('{} EXECUTE Sensors.RenderCamera RenderFrame'.format(l))

def take_snapshot(lst, auto_segment=False, label='disk1', force_noop=False):
	"""
	Creates a image snapshot from a set of cameras using a disk component
	
	# Arguments
	
	lst (list): List of cameras
	auto_segment (bool): Automatic guess which cameras are segmentation and export json objects among with the pixel dense image, defaults to `None`
	label (string): Game object name, defaults to `disk1`
	force_noop (bool): Force a buffer flush before snapshot happens, this ensures that any queued commands are executed before doing the render. Defaults to `False`
	
	"""
	if settings.skip_disk and auto_segment == False:
		if force_noop:
			common.send_data('NOOP', read=True);
		do_render(lst)
		return
	
	if auto_segment:
		idx = [i for i, s in enumerate(lst) if 'segmentation' in s]
		
		if len(idx) == 0:
			common.output('WARNING: No camera with segmentation name found, skipping auto_segment')
		else:
			do_render(lst)
			common.flush_buffer()
			r = common.send_data([
				'{} EXECUTE Sensors.Disk Snapshot'.format(label),
				'{} GET Segmentation.Segmentation boundingBoxes'.format(lst[idx[0]]),
				'NOOP'
			], read=True)
			seq_save('bbox', r)
	else:
		if force_noop:
			common.send_data('NOOP', read=True);
		
		common.send_data('{} EXECUTE Sensors.Disk Snapshot'.format(label))
	
	time.sleep(settings.cooldown)

def take_seg_snapshot(lst):
	"""
	Creates a segmentation snapshot with json output from a list of cameras
	
	# Attributes
	
	lst (list): List of cameras with segmentation component
	
	"""
	common.flush_buffer()
	
	for l in lst:
		r = common.send_data(['{} GET Segmentation.Segmentation boundingBoxes'.format(l), 'NOOP'], read=True)
		seq_save('bbox', r)

def seq_save(pref, raw_data):
	"""
	Helper function to mutate raw telnet outputs into json objects
	
	Note: This function is temporary, the simulator daemon itself will save json
	files the same way it exports images in the future.
	
	# Attributes
	
	pref (string): Output file prefix
	raw_data (list): Data to write
	
	"""
	noops = 0
	data = []
	while len(data) == 0:
		
		f = [False, False]
		raw_data = ('\n'.join(raw_data)).split('\n')
		
		for r in raw_data:
			r = r.strip('\n\r')
			
			if r == '' or r == 'OK' or r[0:2] == 'OK' or r[0:2] == 'ER':
				continue
			
			if r[0:1] == '[':
				f[0] = True
			
			if f[0] == True and f[1] == False:
				data.append(r)
			elif f[0] == True and f[1] == True:
				common.output('More than one object received? {}'.format('\n'.join(raw_data)), 'WARN')
			
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
			raw_data = common.send_data('NOOP', read=True)
		else:
			# make sure object is valid, otherwise we might need to send another noop to complete it
			try:
				json.loads(''.join(data))
				break
			except:
				common.output('Partially received json object, waiting for more...', 'DEBUG')
				time.sleep(.5)
				raw_data = common.send_data('NOOP', read=True)
		
		noops += 1
		
		if noops > 100:
			common.output('Limit reached while waiting for json object, skipping index!', 'ERROR')
			settings.seq_save_i = settings.seq_save_i + 1
			return
	
	data = ''.join(data)
	
	fn = '{}{}_{}.json'.format(settings.local_path, pref, settings.seq_save_i)
	
	if settings.debug:
		common.output('SEQ Save path: {} prefix: {} data: {}'.format(fn, pref, data), 'DEBUG')
		d = open(fn + '.debug', 'w')
		d.write('\r\n'.join(raw_data))
		d.close()
	
	f = open(fn, 'w')
	f.write(data)
	f.close()
	common.output('Wrote: {}{}_{}.json'.format(settings.local_path, pref, settings.seq_save_i))
	settings.seq_save_i = settings.seq_save_i + 1

def add_disk_output(lst, label='disk1'):
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
	common.send_data('{} SET active false'.format(label))
	
	for l in lst:
		common.send_data([
			'CREATE {}/{}'.format(label, l.capitalize()),
			'{}/{} ADD Sensors.RenderCameraLink'.format(label, l.capitalize()),
			'{}/{} SET Sensors.RenderCameraLink target {}'.format(label, l.capitalize(), l),
			
			# TEMPORARY HACK
			'{}/{} SET Sensors.RenderCameraLink outputType DEPTH'.format(label, l.capitalize()) if "depth" in l else '',
			
			'{}/{} SET active true'.format(label, l.capitalize())
		], read=False)
	
	common.send_data('{} SET active true'.format(label))

def ugly_tag_fix(tag):
	x = tag.split('/')[-1]
	
	if x[-1:] == 's':
		x = x[:-1]
	
	return x

def add_random_color(objs, colors=16, colors_weights=14, spawner=False, method='FromList', parts_names=None):
	"""
	Adds random color component to a object or spawner
	
	# Arguments
	
	objs (list|string): Object or objects to add random color component
	colors (int): Number of random colors to be assigned, defaults to `16` (ignored if method is `Random`)
	colors_weights (int): Color changing weight, defaults to `14`
	spawner (bool): Defines if the object(s) is/are spawner or regular objects, defaults to `False`
	method (string): Defines operation mode, `FromList` will use a fixed list of colors, `Random` will pick a random color everytime, `Lerp` will randomize between 2 colors, defaults to `FromList`
	parts_names (string): Defines a list of parts to be colorized
	
	"""
	
	if spawner:
		component = 'RandomProps.SpawnerRandomizers.RandomColor'
	else:
		component = 'RandomProps.RandomColor'
	
	if type(objs) != list:
		objs = [ objs ]
	
	buf = []
	
	for obj in objs:
		buf.append('{} ADD {}'.format(obj, component))
		buf.append('{} SET {} randomMethod {}'.format(obj, component, method))
		
		if method == 'Random':
			buf.append('{} PUSH {} availableColors "{}"'.format(obj, component, get_random_color()))
		elif colors > 0:
			for i in range(0, colors):
				buf.append('{} PUSH {} availableColors "{}"'.format(obj, component, get_random_color()))
		
		if parts_names != None:
			buf.append('{} SET {} partsNames "{}"'.format(obj, component, parts_names))
		buf.append('{} PUSH {} colorsWeights {}'.format(obj, component, colors_weights))
	
	common.send_data(buf, read=False)

def add_lidar(
	label='Lidar', virtualCamera=None, model='VLP_16',
	minAz=-180, maxAz=180, minEl=-30, maxEl=30, rpm=900, targetFps=50, pclRenderFps=30,
	dataType=None, colorLUT=None, colorTo='Red', colorFrom='Blue',
	timingAccuracy='MEDIUM', accuracy='HIGH', disableUDPBroadcast=False,
	enableVisualizer=False, fullScreenOutputTexture=False,
	minimumIntensity=0, ipAddressOverride=None,
	position=[0, 0, 0], rotation=[0, 0, 0]
):
	"""
	Creates a LiDAR Sensors
	
	# Arguments
	
	target (string): Defines an existing game object to bind lidar to, this must contain a camera component, if it doesn't the system will add one.
	model (string): Defines a model to use, this will depend on what libraries you have on the system, some models: VLP_16, HDL_32E, HDL_64E_S3, M8
	accuracy (string): Defines lidar CPU burn accuracy, options: LOW, MEDIUM, HIGH, ULTRA
	minAz (int): Minimum azimuth, defaults to -180
	maxAz (int): Maximum azimuth, defaults to 180
	minEl (int): Minimum elevation, defaults to -30
	maxEl (int): Maximum elevation, defaults to 30
	rpm (int): Device RPM, defaults to 900
	
	"""
	common.send_data([
		'CREATE {}'.format(label),
		
		'{} SET Transform position ({} {} {})'.format(label, position[0], position[1], position[2]),
		'{} SET Transform eulerAngles ({} {} {})'.format(label, rotation[0], rotation[1], rotation[2]),
		
		'{} ADD Lidar'.format(label),
		'{} SET Lidar model "{}"'.format(label, model),
		
		'{} SET Lidar minAz {}'.format(label, minAz),
		'{} SET Lidar maxAz {}'.format(label, maxAz),
		'{} SET Lidar minEl {}'.format(label, minEl),
		'{} SET Lidar maxEl {}'.format(label, maxEl),
		
		'{} SET Lidar rpm {}'.format(label, rpm),
		
		'{} SET Lidar targetFps {}'.format(label, targetFps),
		'{} SET Lidar pclRenderFps {}'.format(label, pclRenderFps),
		'{} SET Lidar dataType {}'.format(label, dataType) if dataType != None else '',
		'{} SET Lidar colorLUT {}'.format(label, colorLUT) if colorLUT != None else '',
		'{} SET Lidar colorTo {}'.format(label, colorTo) if colorTo != None else '',
		'{} SET Lidar colorFrom {}'.format(label, colorFrom) if colorFrom != None else '',
		
		'{} SET Lidar MinimumIntensity {}'.format(label, minimumIntensity),
		'{} SET Lidar ipAddressOverride "{}"'.format(label, ipAddressOverride) if ipAddressOverride != None else '',
		
		'{} SET active true'.format(label),
		
		'{} SET Lidar accuracy {}'.format(label, accuracy),
		'{} SET Lidar virtualCamera {}'.format(label, virtualCamera) if virtualCamera != None else '',
		'{} SET Lidar disableUDPBroadcast {}'.format(label, 'True' if disableUDPBroadcast == True else 'False'),
		'{} SET Lidar enableVisualizer {}'.format(label, 'True' if enableVisualizer == True else 'False'),
		'{} SET Lidar FullScreenOutputTexture {}'.format(label, 'True' if fullScreenOutputTexture == True else 'False'),
		
		'{} SET Lidar timingAccuracy {}'.format(label, timingAccuracy),
		
		'{} ADD LidarNoLights'
	])

def setup_ros_topics(label_root='ROS2', writeLinks=None, readLinks=None):
	common.send_data([
		'CREATE {}'.format(label_root),
		'{} SET active false'.format(label_root),
		'{} ADD Sensors.ROS2'.format(label_root)
	], read=False)
	
	if writeLinks != None:
		for lnk in writeLinks:
			common.send_data([
					'CREATE {}/{}'.format(label_root, lnk['label']),
					'{}/{} ADD Sensors.WriteFieldLink'.format(label_root, lnk['label']),
					'{}/{} SET Sensors.WriteFieldLink topicName {}'.format(label_root, lnk['label'], lnk['topic']),
					'{}/{} SET Sensors.WriteFieldLink target {}'.format(label_root, lnk['label'], lnk['target']),
					'{}/{} SET Sensors.WriteFieldLink componentName {}'.format(label_root, lnk['label'], lnk['component']),
					'{}/{} SET Sensors.WriteFieldLink fieldName {}'.format(label_root, lnk['label'], lnk['field']),
					'{}/{} SET Sensors.WriteFieldLink intervalSeconds {}'.format(label_root, lnk['label'], lnk['interval']),
					'{}/{} SET active true'.format(label_root, lnk['label'])
				], read=False)
	
	if readLinks != None:
		for lnk in readLinks:
			common.send_data([
					'CREATE {}/{}'.format(label_root, lnk['label']),
					'{}/{} ADD Sensors.ReadFieldLink'.format(label_root, lnk['label']),
					'{}/{} SET Sensors.ReadFieldLink topicName {}'.format(label_root, lnk['label'], lnk['topic']),
					'{}/{} SET Sensors.ReadFieldLink target {}'.format(label_root, lnk['label'], lnk['target']),
					'{}/{} SET Sensors.ReadFieldLink componentName {}'.format(label_root, lnk['label'], lnk['component']),
					'{}/{} SET Sensors.ReadFieldLink fieldName {}'.format(label_root, lnk['label'], lnk['field']),
					'{}/{} SET Sensors.ReadFieldLink onChange true'.format(label_root, lnk['label']),
					'{}/{} SET Sensors.ReadFieldLink intervalSeconds {}'.format(label_root, lnk['label'], lnk['interval']),
					'{}/{} SET active true'.format(label_root, lnk['label'])
				], read=False)
			
			# workaround for cameras, if we're dealing with a targetTexture, the camera must have
			# a RenderCamera and it must be always on, otherwise it will not broadcast propertly
			if lnk['field'] == "targetTexture":
				common.send_data('{} SET Sensors.RenderCamera alwaysOn true'.format(lnk['target']), read=False)
	
	common.send_data([
		'{} SET active true'.format(label_root)
	], read=True)
	
def get_random_color(alpha='FF'):
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

def set_thermal_props(
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
		common.send_data(['{} SET active false'.format(obj)], read=False)
		
		if heatiness != None:
			common.send_data([
				'{} SET Thermal.ThermalObjectOverride overrideHeatiness true'.format(obj),
				'{} SET Thermal.ThermalObjectOverride heatiness.value {}'.format(obj, heatiness)
			], read=False)
		else:
			common.send_data([
				'{} SET Thermal.ThermalObjectOverride overrideHeatiness false'.format(obj)
			], read=False)
		
		if reflectivity != None:
			common.send_data([
				'{} SET Thermal.ThermalObjectOverride overrideReflectivity true'.format(obj),
				'{} SET Thermal.ThermalObjectOverride reflectivity.value {}'.format(obj, reflectivity)
			], read=False)
		else:
			common.send_data([
				'{} SET Thermal.ThermalObjectOverride overrideReflectivity false'.format(obj)
			], read=False)
		
		if ambientOffset != None:
			common.send_data([
				'{} SET Thermal.ThermalObjectOverride overrideAmbientOffset true'.format(obj),
				'{} SET Thermal.ThermalObjectOverride ambientOffset.value {}'.format(obj, ambientOffset)
			], read=False)
		else:
			common.send_data([
				'{} SET Thermal.ThermalObjectOverride overrideAmbientOffset false'.format(obj)
			], read=False)
		
		if temperatureValue != None or temperatureBandwidth != None or temperatureMedian != None:
			common.send_data(['{} SET Thermal.ThermalObjectOverride overrideTemperature true'.format(obj)], read=False)
			
			if temperatureValue != None:
				common.send_data(['{} SET Thermal.ThermalObjectOverride temperature.value {}'.format(obj, temperatureValue)], read=False)
			if temperatureBandwidth != None:
				common.send_data(['{} SET Thermal.ThermalObjectOverride temperature.bandwidth {}'.format(obj, temperatureBandwidth)], read=False)
			if temperatureMedian != None:
				common.send_data(['{} SET Thermal.ThermalObjectOverride temperature.median {}'.format(obj, temperatureMedian)], read=False)
		else:
			common.send_data(['{} SET Thermal.ThermalObjectOverride overrideTemperature false'.format(obj)], read=False)
		
		if variance != None:
			common.send_data([
				'{} SET Thermal.ThermalObjectOverride overrideVariance true'.format(obj),
				'{} SET Thermal.ThermalObjectOverride variance.value {}'.format(obj, variance)
			], read=False)
		else:
			common.send_data([
				'{} SET Thermal.ThermalObjectOverride overrideVariance false'.format(obj)
			], read=False)
		
		common.send_data(['{} SET active true'.format(obj)], read=False)
	
	common.flush_buffer()


def spawner(
	types=[], tags=None, scale=[1,1,1], position=[0,0,0],
	rotation=[0,0,0], limit=50, segmentation_class=None, orbit=False,
	stick_to_ground=False, collision_check=True, suffix="", flush=False, prefix='spawner',
	names=None, ugly_fix=True, seed=None, random_colors=None, random_colors_weights=14,
	method=None, method_parameters=None, min_distance=None, max_distance=None,
	parts_names=None
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
	segmentation_class (list): Defines segmentation classes to be bound to the spawner, this must align with the number of arguments on types, defaults to `None`
	orbit (bool): Adds orbiting component to spawner
	stick_to_ground (bool): Forces spawned objects to stick to ground, ideal for irregular ground. defaults to `False`
	collision_check (bool): Avoids objects from being spawned overlapping eachother and other objects in the scene, defaults to `True`
	suffix (string): Adds a suffix string on types
	flush (bool): Forces a telnet queue flush after spawning, defaults to `False`
	prefix (string): Defines a root game object to nest types into, defaults to `spawner`
	names (list): Overrides type caption, must be aligned with the number of arguments on types, defaults to `None`
	ugly_fix (bool): Ugly fix for asset naming, defaults to `True`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None`
	random_colors (int): Defines a number of random colors to assign to spawner, when set to None disables feature, defaults to `None`, when set to `True` goes full random instead of predefined defined random colors
	random_colors_weights (int): Defines a weight for color switching, defaults to `14`
	method (string): Defines spawner method, defaults to `None`
	method_parameters (dict): Defines method's parameters, defaults to `None`
	parts_names (string): Defines a list of parts to be colorized, defaults to `None`
	
	"""
	# convert bool to strings
	if collision_check == True:
		collision_check = 'true'
	else:
		collision_check = 'false'
	
	if stick_to_ground == True:
		stick_to_ground = 'true'
	else:
		stick_to_ground = 'false'
	
	# loop each of the types
	i = 0
	for t in types:
		if names == None:
			n = t.replace(' ', '_').replace('+', '_').replace('-', '_').replace(',', '_') + suffix
		else:
			n = names[i]
		
		common.send_data([
			'CREATE {}/{}'.format(prefix, n),
			'{}/{} SET active false'.format(prefix, n),
			
			'{}/{} ADD RandomProps.{}'.format(prefix, n, method) if method != None else '',
			'{}/{} ADD RandomProps.PropArea'.format(prefix, n)
		], read=False)
		
		if seed != None:
			# common.send_data(['{}/{} SET RandomProps.PropArea seed {}'.format(prefix, n, seed)], read=False)
			common.send_data(['RandomProps.Random.instance SET seed {}'.format(seed)], read=False)
		
		if ugly_fix == True:
			try:
				common.send_data(['{}/{} SET RandomProps.PropArea tags "{}"'.format(prefix, n, ugly_tag_fix(tags[i]))], read=False)
			except:
				common.send_data(['{}/{} SET RandomProps.PropArea tags "{}"'.format(prefix, n, ugly_tag_fix(t))], read=False)
		else:
			common.send_data(['{}/{} SET RandomProps.PropArea tags "{}"'.format(prefix, n, tags[i])], read=False)
		
		if min_distance != None:
			common.send_data([
				'{}/{} ADD RandomProps.MinDistance'.format(prefix, n),
				'{}/{} SET RandomProps.MinDistance value {}'.format(prefix, n, min_distance)
			], read=False)
		
		if max_distance != None:
			common.send_data([
				'{}/{} ADD RandomProps.MaxDistance'.format(prefix, n),
				'{}/{} SET RandomProps.MaxDistance value {}'.format(prefix, n, max_distance)
			], read=False)
		
		common.send_data([
			'{}/{} SET RandomProps.PropArea async false'.format(prefix, n),
			'{}/{} SET RandomProps.PropArea numberOfProps {}'.format(prefix, n, limit),
			
			'{}/{} SET RandomProps.PropArea collisionCheck {}'.format(prefix, n, collision_check),
			'{}/{} SET RandomProps.PropArea stickToGround {}'.format(prefix, n, stick_to_ground),
		], read=False)
		
		if method != None and method_parameters != None:
			for key in method_parameters:
				common.send_data('{}/{} SET RandomProps.{} {} {}'.format(prefix, n, method, key, method_parameters[key]), read=False)
		
		common.send_data([
			'{}/{} SET Transform position ({} {} {})'.format(prefix, n, position[0], position[1], position[2]),
			'{}/{} SET Transform eulerAngles ({} {} {})'.format(prefix, n, rotation[0], rotation[1], rotation[2]),
			
			'{}/{} SET Transform localScale ({} {} {})'.format(prefix, n, scale[0], scale[1], scale[2])
		], read=False)
		
		if segmentation_class != None:
			if isinstance(segmentation_class, list):
				common.send_data([
					'{}/{} ADD Segmentation.ClassGroup'.format(prefix, n),
					'{}/{} SET Segmentation.ClassGroup itemsClassName "{}"'.format(prefix, n, segmentation_class[i])
				], read=False)
			else:
				common.send_data([
					'{}/{} ADD Segmentation.ClassGroup'.format(prefix, n),
					'{}/{} SET Segmentation.ClassGroup itemsClassName "{}"'.format(prefix, n, segmentation_class)
				], read=False)
		
		if orbit == True:
			common.send_data('cameras SET Orbit target {}/{}'.format(prefix, n), read=False)
		
		if random_colors != None:
			if random_colors == True:
				add_random_color(objs='{}/{}'.format(prefix, n), colors=0, colors_weights=random_colors_weights, spawner=True, method='Random', parts_names=parts_names)
			else:
				add_random_color(objs='{}/{}'.format(prefix, n), colors=random_colors, colors_weights=random_colors_weights, spawner=True, parts_names=parts_names)
		
		common.send_data('{}/{} SET active true'.format(prefix, n))
		settings.obj.append('{}/{}'.format(prefix, t))
		i = i + 1
	
	if flush:
		common.flush_buffer()


def spawn_radius_generic(
	types=[], tags=None, scale=[1,1,1], innerradius=0, radius=500, position=[0,0,0],
	rotation=[0,0,0], limit=50, segmentation_class=None, orbit=False,
	stick_to_ground=False, collision_check=True, suffix="", flush=False, prefix='spawner',
	names=None, ugly_fix=True, seed=None, random_colors=None, random_colors_weights=14,
	parts_names=None
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
	segmentation_class (list): Defines segmentation classes to be bound to the spawner, this must align with the number of arguments on types, defaults to `None`
	orbit (bool): Adds orbiting component to spawner
	stick_to_ground (bool): Forces spawned objects to stick to ground, ideal for irregular ground. defaults to `False`
	collision_check (bool): Avoids objects from being spawned overlapping eachother and other objects in the scene, defaults to `True`
	suffix (string): Adds a suffix string on types
	flush (bool): Forces a telnet queue flush after spawning, defaults to `False`
	prefix (string): Defines a root game object to nest types into, defaults to `spawner`
	names (list): Overrides type caption, must be aligned with the number of arguments on types, defaults to `None`
	ugly_fix (bool): Ugly fix for asset naming, defaults to `True`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None`
	random_colors (int): Defines a number of random colors to assign to spawner, when set to None disables feature, defaults to `None`
	random_colors_weights (int): Defines a weight for color switching, defaults to `14`
	parts_names (string): Defines a list of parts to be colorized, defaults to `None`
	
	"""
	return spawner(
		types=types, tags=tags, scale=scale, position=position,
		rotation=rotation, limit=limit, segmentation_class=segmentation_class, orbit=orbit,
		stick_to_ground=stick_to_ground, collision_check=collision_check, suffix=suffix, flush=flush, prefix=prefix,
		names=names, ugly_fix=ugly_fix, seed=seed, random_colors=random_colors, random_colors_weights=random_colors_weights,
		method='Torus', method_parameters={'innerRadius': innerradius, 'radius': radius},
		parts_names=parts_names
	)

def spawn_rectangle_generic(
	types=[], tags=None, scale=[1,1,1], a=1, b=500, position=[0,0,0],
	rotation=[0,0,0], limit=50, segmentation_class=None, orbit=False,
	stick_to_ground=False, collision_check=True, suffix="", flush=False, prefix='spawner',
	names=None, seed=None, random_colors=None, random_colors_weights=14, parts_names=None
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
	segmentation_class (list): Defines segmentation classes to be bound to the spawner, this must align with the number of arguments on types, defaults to `None`
	orbit (bool): Adds orbiting component to spawner
	stick_to_ground (bool): Forces spawned objects to stick to ground, ideal for irregular ground. defaults to `False`
	collision_check (bool): Avoids objects from being spawned overlapping eachother and other objects in the scene, defaults to `True`
	suffix (string): Adds a suffix string on types
	flush (bool): Forces a telnet queue flush after spawning, defaults to `False`
	prefix (string): Defines a root game object to nest types into, defaults to `spawner`
	names (list): Overrides type caption, must be aligned with the number of arguments on types, defaults to `None`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None`
	random_colors (int): Defines a number of random colors to assign to spawner, when set to None disables feature, defaults to `None`
	random_colors_weights (int): Defines a weight for color switching, defaults to `14`
	parts_names (string): Defines a list of parts to be colorized, defaults to `None`
	
	"""
	return spawner(
		types=types, tags=tags, scale=scale, position=position,
		rotation=rotation, limit=limit, segmentation_class=segmentation_class, orbit=orbit,
		stick_to_ground=stick_to_ground, collision_check=collision_check, suffix=suffix, flush=flush, prefix=prefix,
		names=names, ugly_fix=ugly_fix, seed=seed, random_colors=random_colors, random_colors_weights=random_colors_weights,
		method='Rectangle', method_parameters={'a': a, 'b': b}, parts_names=parts_names
	)

def spawn_flat_grid(types=[], size=[1000,1000], position=[0,0,0], scale=[1,1,1], prefix='spawner'):
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
		
		common.send_data([
			'CREATE {}/{}'.format(prefix, n),
			'{}/{} SET active false'.format(prefix, n),
			'{}/{} ADD RandomProps.FillGrid'.format(prefix, n),
			'{}/{} SET Transform position ({} {} {})'.format(prefix, n, position[0], position[1], position[2]),
			'{}/{} SET RandomProps.FillGrid tags "{}"'.format(prefix, n, ugly_tag_fix(n)),
			'{}/{} SET RandomProps.FillGrid size ({} {})'.format(prefix, n, size[0], size[1]),
			'{}/{} SET active true'.format(prefix, n),
			'{}/{} SET Transform localScale ({} {} {})'.format(prefix, n, scale[0], scale[1], scale[2])
		], read=False)
		
		settings.obj.append('{}/{}'.format(prefix, t))
	
	common.flush_buffer()

def spawn_parking_lot(
	limit, fixed=True, dist_h=8, dist_v=3, dist_lim=30,
	p_x=-15, p_z=-30, p_y=-5, prefix='cars', segment='Car'
):
	"""
	Creates a parking lot using a list of cars
	
	# Arguments
	
	limit (int): Number of objects to spawn in each of the `types`
	fixed
	dist_h (int): Horizontal distance, defaults to `8`
	dist_v (int): Vertical distance, defaults to `3`
	dist_lim (int): Distance limit, defaults to `30`
	
	p_x (float): Starting X coordintate, defaults to `-15`
	p_y (float): Starting Y coordintate, defaults to `-5`
	p_z (float): Starting Z coordintate, defaults to `-30`
	
	prefix (string): Defines a root game object to nest types into, defaults to `cars`
	segment (string): Defines a segmentation class, defaults to `Car`
	
	"""
	k = 0
	idx = 0
	j = len(cars_lst)
	
	# cars common parent
	# common.send_data('CREATE cars')
	# settings.obj.append('cars')
	
	while k < limit:
		if fixed:
			if idx >= j:
				idx = 0
			
			carID = '{}/{}'.format(cars_lst[idx],cars_lst[idx])
			idx = idx + 1
		else:
			carID = '?'
		
		common.send_data([
			'CREATE {}/car_{} Cars/{}'.format(prefix, k, carID),
			'{}/car_{} ADD Segmentation.ClassGroup'.format(prefix, k),
			'{}/car_{} SET Segmentation.ClassGroup itemsClassName "{}"'.format(prefix, k, segment),
			'{}/car_{} SET Transform position ({} {} {})'.format(prefix, k, p_x + settings.X_COMP, p_y, p_z + settings.Z_COMP),
			'{}/car_{} SET active true'.format(prefix, k)
		], read=False)
		
		settings.obj.append('{}/car_{}'.format(prefix, k))
		k += 1
		p_z += dist_h
		
		if p_z > dist_lim:
			p_z = -dist_lim
			p_x += dist_v
	
	common.flush_buffer()

def spawn_misc_objs(destroy=False, prefix='spawner', seed=None):
	"""
	Spawns city / animals / cars objects
	
	# Attributes
	
	destroy (bool): Destroy objects before creating them, defaults to `False`
	prefix (string): Spawner root object where spawned objects will be nested within, defaults to `spawner`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None`
	
	"""
	if destroy == True:
		common.send_data([
			'DELETE {}/city'.format(prefix),
			'DELETE {}/animals'.format(prefix),
			'DELETE {}/cars'.format(prefix)
		], read=False)
		
		common.flush_buffer()
	
	spawn_radius_generic(['city/nature/trees'], tags=['tree'], collision_check=False, limit=random.randint(100, 350), radius=80, innerradius=random.randint(30, 50), position=[0,10,0], prefix=prefix, seed=seed)
	spawn_radius_generic(['city/signs'], tags=['sign'], limit=random.randint(80, 250), radius=random.randint(15, 40), innerradius=0, position=[0,10,0], prefix=prefix, seed=seed)
	spawn_radius_generic(['animals'], tags=['animals'], limit=random.randint(150, 250), radius=random.randint(40, 80), innerradius=0, position=[0,10,0], prefix=prefix, seed=seed)
	spawn_radius_generic(['city/buildings'], tags=['building'], limit=random.randint(50, 150), radius=335, innerradius=random.randint(80, 100), position=[0,10,0], prefix=prefix, seed=seed)
	spawn_radius_generic(['cars'], tags=['car'], limit=random.randint(50, 150), radius=50, innerradius=0, segmentation_class="Car", orbit=True, position=[0,10,0], prefix=prefix, seed=seed)

	spawn_radius_generic(['city/ground'], tags=['ground'], suffix='_0', limit=3, radius=75, innerradius=0, scale=[1,1,1], position=[0,0,0], collision_check=False, prefix=prefix, seed=seed)

def spawn_drone_objs(
	destroy=False, ground_position=[84,0,0], ground_limit=0,
	dist_h=25, dist_v=25, dist_lim=150, p_x=-150, p_z=-350, p_y=0,
	birds_radius=120, birds_innerradius=0, cars_radius=50, cars_innerradius=5,
	trees_limit=[150,200], buildings_radius=120, buildings_innerradius=60, trees_radius=80, trees_innerradius=10,
	buildings_limit=[150,150], birds_limit=[25,100], cars_limit=[75,75], drones_limit=[80,200], prefix='spawner',
	trees_tags=['tree'], buildings_tags=['building'], birds_tags=['bird'], cars_tags=['car'], drones_tags=['drones'],
	trees_colors=None, buildings_colors=None, birds_colors=None, cars_colors=None, drones_colors=None,
	trees_parts_names=None, buildings_parts_names=None, birds_parts_names=None, cars_parts_names=None, drones_parts_names=None,
	# ground_segment='VOID', trees_segment='VOID', buildings_segment='VOID', birds_segment='VOID', cars_segment='VOID', drones_segment='DRONE',
	ground_segment=None, trees_segment=None, buildings_segment=None, birds_segment=None, cars_segment=None, drones_segment='DRONE',
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
		common.send_data([
			'DELETE {}/city/nature/trees'.format(prefix),
			'DELETE {}/city/buildings'.format(prefix),
			'DELETE {}/animals/birds'.format(prefix),
			'DELETE {}/drones'.format(prefix),
			'DELETE {}/cars'.format(prefix)
		], read=False)
	else:
		k = 0
		idx = 0
		
		common.send_data([
			'CREATE city',
			'city SET Transform position ({} {} {})'.format(ground_position[0], ground_position[1], ground_position[2]),
			'city SET active false'
		], read=False)
		
		while k < ground_limit:
			common.send_data([
				'CREATE city/ground_{} city/ground/{}'.format(k, random.choice(ground_lst)),
				'city/ground_{} SET Transform position ({} {} {})'.format(k, p_x + settings.X_COMP, p_y, p_z + settings.Z_COMP),
				'city/ground_{} SET Transform localScale ({} {} {})'.format(k, 3, 3, 3),
				'city/ground_{} SET active true'.format(k)
			], read=False)
			settings.obj.append('city/ground_{}'.format(k))
			k += 1
			p_z += dist_h
			
			if p_z > dist_lim:
				p_z = -dist_lim
				p_x += dist_v
	
	if ground_segment != None:
		common.send_data([
			'{} ADD Segmentation.ClassGroup'.format('city'),
			'{} SET Segmentation.ClassGroup itemsClassName "{}"'.format('city', ground_segment)
		])
	
	spawn_radius_generic(['city/ground'], tags=['ground'], limit=300, radius=150, innerradius=0, scale=[3,3,3], position=[0,0,0], collision_check=False, prefix=prefix, seed=seed)
	spawn_radius_generic(['humans'], tags=['human, +random'], suffix='_0', limit=40, radius=30, innerradius=2, position=[0,0,0], collision_check=False, prefix=prefix, seed=seed)
	spawn_radius_generic(['city/nature/trees'], parts_names=trees_parts_names, segmentation_class=trees_segment, random_colors=trees_colors, tags=trees_tags, collision_check=False, limit=random.randint(trees_limit[0], trees_limit[1]), radius=trees_radius, innerradius=trees_innerradius, position=[0,0,0], prefix=prefix, seed=seed)
	spawn_radius_generic(['city/buildings'], parts_names=buildings_parts_names, segmentation_class=buildings_segment, random_colors=buildings_colors, tags=buildings_tags, stick_to_ground=False, collision_check=False, limit=random.randint(buildings_limit[0], buildings_limit[1]), radius=buildings_radius, innerradius=buildings_innerradius, position=[0,0,0], prefix=prefix, seed=seed)
#	spawn_radius_generic(['buildings_001'], parts_names=buildings_parts_names, segmentation_class=buildings_segment, random_colors=buildings_colors, tags=buildings_tags, stick_to_ground=False, collision_check=False, limit=random.randint(buildings_limit[0], buildings_limit[1]), radius=buildings_radius, innerradius=buildings_innerradius, position=[0,0,0], prefix=prefix, seed=seed)
#	spawn_radius_generic(['buildings_002'], parts_names=buildings_parts_names, segmentation_class=buildings_segment, random_colors=buildings_colors, tags=buildings_tags, stick_to_ground=False, collision_check=False, limit=random.randint(buildings_limit[0], buildings_limit[1]), radius=buildings_radius, innerradius=buildings_innerradius, position=[0,0,0], prefix=prefix, seed=seed)
#	spawn_radius_generic(['buildings_003'], parts_names=buildings_parts_names, segmentation_class=buildings_segment, random_colors=buildings_colors, tags=buildings_tags, stick_to_ground=False, collision_check=False, limit=random.randint(buildings_limit[0], buildings_limit[1]), radius=buildings_radius, innerradius=buildings_innerradius, position=[0,0,0], prefix=prefix, seed=seed)
	spawn_radius_generic(['animals/birds'], parts_names=birds_parts_names, segmentation_class=birds_segment, random_colors=birds_colors, tags=birds_tags, limit=random.randint(birds_limit[0], birds_limit[1]), radius=birds_radius, innerradius=birds_innerradius, position=[0,random.randint(15,95),0], prefix=prefix, seed=seed)
	spawn_radius_generic(['cars'], parts_names=cars_parts_names, segmentation_class=cars_segment, random_colors=cars_colors, tags=cars_tags, collision_check=False, limit=random.randint(cars_limit[0], cars_limit[1]), radius=cars_radius, innerradius=cars_innerradius, position=[0,0,0], prefix=prefix, seed=seed)
	spawn_radius_generic(['roadsigns'], tags=['roadsign'], limit=250, radius=80, collision_check=False, innerradius=15, position=[0,0,0], prefix=prefix, seed=seed)
	
	
	if drones_limit[1] > 0:
		# spawn_radius_generic(['drones'], segmentation_class=drones_segment, random_colors=drones_colors, tags=drones_tags, ugly_fix=False, limit=random.randint(drones_limit[0], drones_limit[1]), radius=random.randint(30,50), innerradius=0, position=[0,0,0], prefix=prefix, seed=seed)
		spawner(
			['drones'], segmentation_class=drones_segment, parts_names=drones_parts_names, random_colors=drones_colors, tags=drones_tags, ugly_fix=False, limit=random.randint(drones_limit[0], drones_limit[1]), position=[0,0,0],
			# prefix=prefix,
			prefix='cameras/spawner',
			seed=seed,
			method='Frustum',
			method_parameters={'cam': 'cameras/cameraRGB'},
			min_distance=2,
			max_distance=5
		)
	
	if thermal != None:
		common.send_data([
			'city ADD Thermal.ThermalObjectOverride',
			'city ADD Thermal.ThermalObjectBehaviour',
			'city SET Thermal.ThermalObjectBehaviour profile {}'.format(thermal)
		])
		
		if not any('thermal' in s for s in birds_tags) and birds_limit[1] > 0:
			common.send_data([
				'{}/animals ADD Thermal.ThermalObjectOverride'.format(prefix),
				'{}/animals ADD Thermal.ThermalObjectBehaviour'.format(prefix),
				'{}/animals SET Thermal.ThermalObjectBehaviour profile {}'.format(prefix, thermal)
			], read=False)
		
		if not any('thermal' in s for s in cars_tags) and cars_limit[1] > 0:
			common.send_data([
				'{}/cars ADD Thermal.ThermalObjectOverride'.format(prefix),
				'{}/cars ADD Thermal.ThermalObjectBehaviour'.format(prefix),
				'{}/cars SET Thermal.ThermalObjectBehaviour profile {}'.format(prefix, thermal)
			], read=False)
		
		if not any('thermal' in s for s in drones_tags) and drones_limit[1] > 0:
			common.send_data([
				'{}/drones ADD Thermal.ThermalObjectOverride'.format(prefix),
				'{}/drones ADD Thermal.ThermalObjectBehaviour'.format(prefix),
				'{}/drones SET Thermal.ThermalObjectBehaviour profile {}'.format(prefix, thermal)
			], read=False)
	
	common.send_data([
		'city SET active true'
	], read=True)

def spawn_drone_objs_alt(
	destroy=False, ground_limit=204,
	dist_h=120, dist_v=120, dist_lim=1000,
	p_x=-20, p_z=-1000, p_y=0, prefix='spawner',
	seed=None
):
	if destroy == True:
		common.send_data([
			'DELETE {}/city/nature/trees'.format(prefix),
			'DELETE {}/city/buildings'.format(prefix),
			'DELETE {}/animals/birds'.format(prefix),
			'DELETE {}/drones'.format(prefix),
			'DELETE {}/cars'.format(prefix)
		], read=False)
	else:
		k = 0
		idx = 0
		
		while k < ground_limit:
			common.send_data([
				'CREATE city/ground_{} city/ground/{}'.format(k, random.choice(ground_lst)),
				'city/ground_{} SET Transform position ({} {} {})'.format(k, p_x + settings.X_COMP, p_y, p_z + settings.Z_COMP),
				'city/ground_{} SET Transform localScale ({} {} {})'.format(k, 12, 12, 12),
				'city/ground_{} SET active true'.format(k)
			], read=False)
			settings.obj.append('city/ground_{}'.format(k))
			k += 1
			p_z += dist_h
			
			if p_z > dist_lim:
				p_z = -dist_lim
				p_x += dist_v
	
	spawn_radius_generic(['city/nature/trees'], tags=['tree'], limit=random.randint(600,600), radius=80, innerradius=30, position=[0,0,0], collision_check=False, prefix=prefix, seed=seed)
	spawn_radius_generic(['city/buildings'], tags=['building'], limit=random.randint(10,10), radius=335, innerradius=100, position=[0,0,0], collision_check=False, prefix=prefix, seed=seed)
	spawn_radius_generic(['animals/birds'], tags=['bird'], limit=random.randint(10,10), radius=random.randint(80,110), innerradius=0, position=[0,random.randint(15,95),0], prefix=prefix, seed=seed)
	spawn_radius_generic(['cars'], tags=['car'], limit=random.randint(5, 10), radius=50, innerradius=5, position=[0,0,0], prefix=prefix, seed=seed)
	spawn_radius_generic(['drones/white'], limit=random.randint(80,80), radius=random.randint(80,110), innerradius=0, position=[0,random.randint(15,65),0], segmentation_class="Car", prefix=prefix, seed=seed)
	
	common.flush_buffer()

def spawn_animals_objs(destroy=False, prefix='spawner', seed=None):
	"""
	Spawns trees and animals
	
	# Attributes
	
	destroy (bool): Destroy objects before creating them, defaults to `False`
	prefix (string): Spawner root object where spawned objects will be nested within, defaults to `spawner`
	seed (int): Defines a seed number, this forces random values to be equal on different instances, defaults to `None`
	"""
	if destroy == True:
		common.send_data([
			'DELETE {}/city'.format(prefix),
			'DELETE {}/animals'.format(prefix)
		], read=False)
	
	spawn_radius_generic(['city/nature/trees'], tags=['tree'], collision_check=True, stick_to_ground=True, limit=random.randint(150, 400), radius=80, innerradius=random.randint(30, 50), position=[0,5,0], prefix=prefix, seed=seed)
	spawn_radius_generic(['animals'], tags=['animal'], collision_check=True, stick_to_ground=True, limit=random.randint(200, 350), radius=random.randint(40, 80), innerradius=0, position=[0,5,0], orbit=True, prefix=prefix, seed=seed)
	
	common.flush_buffer()
