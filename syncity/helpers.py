import sys
import time
import random
import json
from . import common, settings_manager, unity_vars

# some hardcoded values, this depends on the asset packages you've been given
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
	'Drones/Parrot Disco/Parrot Disco'
]

# lite asset package
drones_lite_lst = [ 'Drones/buzz/buzz', 'Drones/splinter/splinter', 'Drones/red/red', 'Drones/white/white' ]

settings = settings_manager.Singleton()

def global_camera_setup(label_root='cameras', canvas_width=1024, canvas_height=768, canvas=None, orbit=True):
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
		'{} SET Transform position ({} {} {})'.format(label_root, settings.X_COMP -6, settings.Y_COMP, settings.Z_COMP -50),
		'{} SET Transform eulerAngles ({} {} {})'.format(label_root, 0, 0, 0),
	], read=False)
	
	if orbit:
		common.send_data(['{} ADD Orbit'.format(label_root)], read=False)
	
	common.send_data([
		# resize camera display on app, this is relative to the size of the window
		'Canvas/Cameras/Viewport/Content SET UI.GridLayoutGroup cellSize ({} {})'.format(canvas_width, canvas_height),
		'Canvas SET active {}'.format(canvas)
	], read=False)
	
	settings.obj.append(label_root)

def add_camera_rgb(
	width=2048, height=1536, audio=True, envirosky=None, flycam=False,
	label_root='cameras', label='cameras/cameraRGB', pp=None,
	renderingPath=4, textureFormat=4,
	
	envirosky_cloudTransitionSpeed=100, envirosky_effectTransitionSpeed=100,
	envirosky_fogTransitionSpeed=100, envirosky_progressTime='None',
	
	thermal=False, thermal_ambientTemperature = 10, thermal_minimumTemperature = 10,
	thermal_maximumTemperature = 30, thermal_maxDistanceForProbeUpdate = 500,
	thermal_maxFramesPerFaceForProbeUpdate = 60
):
	if envirosky == None:
		if settings.disable_envirosky:
			envirosky = False
		else:
			envirosky = True
	
	common.send_data([
		'CREATE {}'.format(label),
		# 'cameras/cameraRGB SET active false',
		'{} ADD Camera'.format(label),
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
		common.send_data(['{} ADD FlyCamera'.format(label)], read=False)
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
			
			'{} ADD EnviroCamera'.format(label)
		], read=False)
	if thermal:
		common.send_data([
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile Thermal'.format(label),
			'{} ADD Thermal.Thermal'.format(label),
			'{} SET Thermal.Thermal AmbientTemperature {}'.format(label, thermal_ambientTemperature),
			'{} SET Thermal.Thermal MinimumTemperature {}'.format(label, thermal_minimumTemperature),
			'{} SET Thermal.Thermal MaximumTemperature {}'.format(label, thermal_maximumTemperature),
			'{} SET Thermal.Thermal MaxDistanceForProbeUpdate {}'.format(label, thermal_maxDistanceForProbeUpdate),
			'{} SET Thermal.Thermal MaxFramesPerFaceForProbeUpdate {}'.format(label, thermal_maxFramesPerFaceForProbeUpdate)
		], read=False)
	
	common.flush_buffer()
	
	if pp != None:
		add_camera_rgb_pp(profile=pp, label=label)
	
	settings.obj.append(label)

def camera_pp_thermal(label='cameras/cameraRGB'):
	common.send_data([
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.enabled false'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.enabled false'.format(label),
		
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled true'.format(label),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.intensity {}'.format(label, random.randint(0, 100)),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.threshold {}'.format(label, random.uniform(0, 2)),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.softKnee {}'.format(label, random.uniform(0, 1)),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.radius {}'.format(label, random.uniform(1, 7)),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.bloom.antiFlicker {}'.format(label, 'true'),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.settings.lensDirt.intensity {}'.format(label, random.randint(0, 10)),
		
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
	
	common.flush_buffer()
	settings.obj.append(label)

'''
This function randomizes all available paramters for native postprocessing.
Parameters that contain random statements will randomize between the acceptable
range of values for the specific property.

Parameters that don't have a random statement are defaults for EnviroFX profile

Specific effects will be turned on / off at random as well.

Note: Not all those values currently work, depending on depth / type they might
return errors, if you happen to need to change one of those values contact support.
'''
def camera_rgb_pp_random(label='cameras/cameraRGB'):
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
			'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.tonemapper 2'.format(label),
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

# scion camera postprocessing effects
def camera_rgb_pp_scion_random(label='cameras/cameraRGB'):
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
	if settings.skip_disk:
		return
	
	for l in lst:
		common.send_data([
			'{}/{} SET Sensors.RenderCameraLink target {}'.format(label, l.capitalize(), l)
		], read=False)

def add_camera_seg_filter(segments=['Car'], label='cameras/segmentation'):
	for s in segments:
		common.send_data([
			'{} PUSH Segmentation.Segmentation boundingBoxesFilter {}'.format(label, s),
			'{} PUSH Segmentation.Segmentation unoccludedClasses {}'.format(label, s)
		], read=False)

# output_type options: Auto, ClassIds, InstanceIds, ClassColors, Raw
def add_camera_seg(
	width=1024, height=768, segments=None, output_type='Auto', label='cameras/segmentation',
	boundingBoxesExtensionAmount=0,
	renderingPath=4, textureFormat=4
):
	common.send_data([
		'CREATE {}'.format(label),
		'{} SET active false'.format(label),
		'{} ADD Camera'.format(label),
		'{} ADD Sensors.RenderCamera'.format(label),
		# '{} SET Sensors.RenderCamera sRGB false'.format(label),
		'{} SET Sensors.RenderCamera format {}'.format(label, unity_vars.textureFormat[textureFormat]),
		'{} SET Sensors.RenderCamera resolution ({} {})'.format(label, width, height),
		'{} SET Camera renderingPath {}'.format(label, unity_vars.renderingPath[renderingPath]),
		'{} SET Camera targetTexture.filterMode Point'.format(label),
		'{} ADD Segmentation.Segmentation'.format(label),
		'{} SET Segmentation.Segmentation OutputType {}'.format(label, output_type),
		'{} SET Segmentation.Segmentation BoundingBoxesExtensionAmount {}'.format(label, boundingBoxesExtensionAmount),
		# '{} SET Camera targetTexture.antiAliasing 8'.format(label),
		'{} SET active true'.format(label)
	], read=False)
	
	if segments != None:
		add_camera_seg_filter(segments, label=label)
	common.flush_buffer()
	settings.obj.append(label)

# not recommended when using envirosky
def add_light(position=[34,-22.53,0], intensity=1.7, label='light'):
	common.send_data([
		'CREATE {}'.format(label),
		'{} ADD Light'.format(label),
		'{} SET Light type Directional'.format(label),
		'{} SET Transform eulerAngles ({} {} {})'.format(label, position[0], position[1], position[2]),
		'{} SET Light intensity {}'.format(label, intensity),
		# '{} SET Light color #'.format(label),
		'{} SET Light shadows Soft'.format(label)
	], read=False)
	
	common.flush_buffer()
	settings.obj.append(label)

def global_disk_setup(label='disk1'):
	if settings.skip_disk:
		return
	
	common.send_data([
		'CREATE {}'.format(label),
		'{} SET active false'.format(label),
		'{} ADD Sensors.Disk'.format(label),
		'{} SET Sensors.Disk path "{}"'.format(label, settings.output_path),
		'{} SET active true'.format(label)
	], read=False)
	
	common.flush_buffer()
	settings.obj.append(label)

def do_render(lst):
	for l in lst:
		common.send_data('{} EXECUTE Sensors.RenderCamera RenderFrame'.format(l))

def take_snapshot(lst, auto_segment=False, label='disk1'):
	if settings.skip_disk and auto_segment == False:
		do_render(lst)
		return
	
	if auto_segment:
		do_render(lst)
		r = common.send_data('{} GET Segmentation.Segmentation boundingBoxes'.format(lst[1]), read=True)
		
		if (len(r) > 1):
			common.send_data('{} EXECUTE Sensors.Disk Snapshot'.format(label), read=True)
			r = common.send_data('{} GET Segmentation.Segmentation boundingBoxes'.format(lst[1]), read=True)
			seq_save('bbox', ''.join(r[1:]))
	else:
		common.send_data('{} EXECUTE Sensors.Disk Snapshot'.format(label))
	
	time.sleep(settings.cooldown)

def take_seg_snapshot(lst):
	for l in lst:
		r = common.send_data('{} GET Segmentation.Segmentation boundingBoxes'.format(l), read=True)
		if (len(r) > 1):
			seq_save('bbox', ''.join(r[1:]))
		
		# r = common.send_data('{} GET Segmentation.Segmentation boundingBoxesFiltered'.format(l))
		# if (len(r) > 1):
		#	seq_save('bbox_filtered', ''.join(r[1:]))

def seq_save(pref, data):
	f = open('{}{}_{}.json'.format(settings.local_path, pref, settings.seq_save_i), 'w')
	f.write(data)
	f.close()
	common.output('Wrote: {}{}_{}.json'.format(settings.local_path, pref, settings.seq_save_i))
	settings.seq_save_i = settings.seq_save_i + 1

def add_disk_output(lst, label='disk1'):
	if settings.skip_disk:
		return
	common.send_data('{} SET active false'.format(label))
	
	for l in lst:
		common.send_data([
			'CREATE {}/{}'.format(label, l.capitalize()),
			'{}/{} ADD Sensors.RenderCameraLink'.format(label, l.capitalize()),
			'{}/{} SET Sensors.RenderCameraLink target {}'.format(label, l.capitalize(), l)
		], read=False)
	
	common.send_data('{} SET active true'.format(label))

def ugly_tag_fix(tag):
	x = tag.split('/')[-1]
	
	if x[-1:] == 's':
		x = x[:-1]
	
	return x

def spawn_radius_generic(types=[], tags=None, scale=[1,1,1], innerradius=0, radius=500, position=[0,0,0], rotation=[0,0,0], limit=50, segmentation_class=None, orbit=False, stick_to_ground=False, collision_check=True, suffix="", flush=False, prefix='spawner'):
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
		n = t.replace(' ', '_').replace('+', '_').replace('-', '_').replace(',', '_') + suffix
		
		common.send_data([
			'CREATE {}/{}'.format(prefix, n),
			'{}/{} SET active false'.format(prefix, n),
			
			'{}/{} ADD RandomProps.Torus'.format(prefix, n),
			'{}/{} ADD RandomProps.PropArea'.format(prefix, n),
		], read=False)
		
		try:
			common.send_data(['{}/{} SET RandomProps.PropArea tags "{}"'.format(prefix, n, ugly_tag_fix(tags[i]))], read=False)
		except:
			common.send_data(['{}/{} SET RandomProps.PropArea tags "{}"'.format(prefix, n, ugly_tag_fix(t))], read=False)
		
		common.send_data([
			'{}/{} SET RandomProps.PropArea async false'.format(prefix, n),
			# '{}/{} SET RandomProps.PropArea tags "{}"'.format(prefix, n, t),
			'{}/{} SET RandomProps.PropArea numberOfProps {}'.format(prefix, n, limit),
			
			'{}/{} SET RandomProps.PropArea collisioncheck {}'.format(prefix, n, collision_check),
			'{}/{} SET RandomProps.PropArea stickToGround {}'.format(prefix, n, stick_to_ground),
			
			'{}/{} SET RandomProps.Torus radius {}'.format(prefix, n, radius),
			'{}/{} SET RandomProps.Torus innerRadius {}'.format(prefix, n, innerradius),
			
			'{}/{} SET Transform position ({} {} {})'.format(prefix, n, position[0], position[1], position[2]),
			'{}/{} SET Transform eulerAngles ({} {} {})'.format(prefix, n, rotation[0], rotation[1], rotation[2]),
			
			'{}/{} SET active true'.format(prefix, n),
			'{}/{} SET Transform localScale ({} {} {})'.format(prefix, n, scale[0], scale[1], scale[2])
		], read=False)
		
		if segmentation_class != None:
			common.send_data([
				'{}/{} ADD Segmentation.ClassGroup'.format(prefix, n),
				'{}/{} SET Segmentation.ClassGroup itemsClassName {}'.format(prefix, n, segmentation_class)
			], read=False)
		
		if orbit == True:
			common.send_data('cameras SET Orbit target {}/{}'.format(prefix, n), read=False)
		
		settings.obj.append('{}/{}'.format(prefix, t))
		i = i + 1
	
	if flush:
		common.flush_buffer()

def spawn_flat_grid(types=[], size=[1000,1000], position=[0,0,0], scale=[1,1,1], prefix='spawner'):
	for t in types:
		n = t.replace(' ', '_')
		
		common.send_data([
			'CREATE {}/{}'.format(prefix, n),
			'{}/{} SET active false'.format(prefix, n),
			'{}/{} ADD RandomProps.FillGrid'.format(prefix, n),
			'{}/{} SET Transform position ({} {} {})'.format(prefix, n, position[0], position[1], position[2]),
			# '{}/{} SET RandomProps.FillGrid folder {}'.format(prefix, n, n),
			'{}/{} SET RandomProps.FillGrid tags "{}"'.format(prefix, n, ugly_tag_fix(n)),
			'{}/{} SET RandomProps.FillGrid size ({} {})'.format(prefix, n, size[0], size[1]),
			'{}/{} SET active true'.format(prefix, n),
			'{}/{} SET Transform localScale ({} {} {})'.format(prefix, n, scale[0], scale[1], scale[2])
		], read=False)
		
		settings.obj.append('{}/{}'.format(prefix, t))
	
	common.flush_buffer()

def spawn_parking_lot(limit, fixed=False, dist_h=8, dist_v=3, dist_lim=30, p_x=-15, p_z=-30, p_y=-5, prefix='cars', segment='Car'):
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
			'{}/car_{} SET Segmentation.ClassGroup itemsClassName {}'.format(prefix, k, segment),
			'{}/car_{} SET Transform position ({} {} {})'.format(prefix, k, p_x + settings.X_COMP, p_y, p_z + settings.Z_COMP)
		], read=False)
		
		settings.obj.append('{}/car_{}'.format(prefix, k))
		k += 1
		p_z += dist_h
		
		if p_z > dist_lim:
			p_z = -dist_lim
			p_x += dist_v
	
	common.flush_buffer()

def spawn_misc_objs(destroy=False, prefix='spawner'):
	if destroy == True:
		common.send_data([
			'DELETE {}/city'.format(prefix),
			'DELETE {}/animals'.format(prefix),
			'DELETE {}/cars'.format(prefix)
		], read=False)
		
		common.flush_buffer()
	
	# spawn_flat_grid(['city/ground'], scale=[3,3,3], position=[0,0,-.5])
	# spawn_radius_generic(['city/decals'], limit=350, radius=50, innerradius=0, collision_check=False, position=[0,10,0])
	# spawn_radius_generic(['city/trafficlight'], limit=100, radius=50, innerradius=30)
	
	spawn_radius_generic(['city/nature/trees'], tags=['tree'], collision_check=False, limit=random.randint(100, 350), radius=80, innerradius=random.randint(30, 50), position=[0,10,0], prefix=prefix)
	spawn_radius_generic(['city/signs'], tags=['sign'], limit=random.randint(80, 250), radius=random.randint(15, 40), innerradius=0, position=[0,10,0], prefix=prefix)
	spawn_radius_generic(['animals'], tags=['animals'], limit=random.randint(150, 250), radius=random.randint(40, 80), innerradius=0, position=[0,10,0], prefix=prefix)
	spawn_radius_generic(['city/buildings'], tags=['building'], limit=random.randint(50, 150), radius=335, innerradius=random.randint(80, 100), position=[0,10,0], prefix=prefix)
	spawn_radius_generic(['cars'], tags=['car'], limit=random.randint(50, 150), radius=50, innerradius=0, segmentation_class="Car", orbit=True, position=[0,10,0], prefix=prefix)

	# for i in range(0,9):
	# 	spawn_radius_generic(['city/ground'], suffix='_{}'.format(i), limit=random.randint(50, 100), radius=75, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False, prefix=prefix)
	# spawn_radius_generic(['city/ground'], suffix='_0', limit=random.randint(3, 10), radius=75, innerradius=0, scale=[2,2,2], position=[0,0,0], collision_check=False, prefix=prefix)
	spawn_radius_generic(['city/ground'], tags=['ground'], suffix='_0', limit=3, radius=75, innerradius=0, scale=[1,1,1], position=[0,0,0], collision_check=False, prefix=prefix)

def spawn_drone_objs(destroy=False, ground_limit=204, dist_h=120, dist_v=120, dist_lim=1000, p_x=-20, p_z=-1000, p_y=0, birds_radius=90, birds_innerradius=0, cars_radius=50, cars_innerradius=5, trees_limit=[50,200], buildings_radius=335, buildings_innerradius=100, trees_radius=80, trees_innerradius=20, buildings_limit=[50,150], birds_limit=[25,100], cars_limit=[5,25], drones_limit=[80,200], prefix='spawner'):
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
				'city/ground_{} SET Transform localScale ({} {} {})'.format(k, 12, 12, 12)
			], read=False)
			settings.obj.append('city/ground_{}'.format(k))
			k += 1
			p_z += dist_h
			
			if p_z > dist_lim:
				p_z = -dist_lim
				p_x += dist_v
		
		# for i in range(0,2):
		# 	spawn_radius_generic(['city/ground'], suffix='_{}'.format(i), limit=5, radius=100, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False)
	
	spawn_radius_generic(['city/nature/trees'], tags=['tree'], collision_check=False, limit=random.randint(trees_limit[0], trees_limit[1]), radius=trees_radius, innerradius=trees_innerradius, position=[0,0,0], prefix=prefix)
	spawn_radius_generic(['city/buildings'], tags=['building'], collision_check=False, stick_to_ground=False, limit=random.randint(buildings_limit[0], buildings_limit[1]), radius=buildings_radius, innerradius=buildings_innerradius, position=[0,0,0], prefix=prefix)
	spawn_radius_generic(['animals/birds'], tags=['bird'], limit=random.randint(birds_limit[0], birds_limit[1]), radius=birds_radius, innerradius=birds_innerradius, position=[0,random.randint(15,95),0], prefix=prefix)
	spawn_radius_generic(['cars'], tags=['car'], limit=random.randint(cars_limit[0], cars_limit[1]), radius=cars_radius, innerradius=cars_innerradius, position=[0,0,0], prefix=prefix)
	
	if drones_limit[1] > 0:
		spawn_radius_generic(['drones'], limit=random.randint(drones_limit[0], drones_limit[1]), radius=random.randint(30,50), innerradius=0, position=[0,0,0], segmentation_class="Drone", prefix=prefix)
	# spawn_radius_generic(['drones/white'], limit=random.randint(10,50), radius=random.randint(30,50), innerradius=0, position=[0,0,0], segmentation_class="Car")
	
	common.flush_buffer()

def spawn_drone_objs_alt(destroy=False, ground_limit=204, dist_h=120, dist_v=120, dist_lim=1000, p_x=-20, p_z=-1000, p_y=0, prefix='spawner'):
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
				'city/ground_{} SET Transform localScale ({} {} {})'.format(k, 12, 12, 12)
			], read=False)
			settings.obj.append('city/ground_{}'.format(k))
			k += 1
			p_z += dist_h
			
			if p_z > dist_lim:
				p_z = -dist_lim
				p_x += dist_v
		
		# for i in range(0,2):
		# 	spawn_radius_generic(['city/ground'], suffix='_{}'.format(i), limit=5, radius=100, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False)
	
	spawn_radius_generic(['city/nature/trees'], tags=['tree'], limit=random.randint(600,600), radius=80, innerradius=30, position=[0,0,0], collision_check=False, prefix=prefix)
	spawn_radius_generic(['city/buildings'], tags=['building'], limit=random.randint(10,10), radius=335, innerradius=100, position=[0,0,0], collision_check=False, prefix=prefix)
	spawn_radius_generic(['animals/birds'], tags=['bird'], limit=random.randint(10,10), radius=random.randint(80,110), innerradius=0, position=[0,random.randint(15,95),0], prefix=prefix)
	spawn_radius_generic(['cars'], tags=['car'], limit=random.randint(5, 10), radius=50, innerradius=5, position=[0,0,0], prefix=prefix)
	spawn_radius_generic(['drones/white'], limit=random.randint(80,80), radius=random.randint(80,110), innerradius=0, position=[0,random.randint(15,65),0], segmentation_class="Car", prefix=prefix)
	
	common.flush_buffer()

def spawn_animals_objs(destroy=False, prefix='spawner'):
	if destroy == True:
		common.send_data([
			'DELETE {}/city'.format(prefix),
			'DELETE {}/animals'.format(prefix)
		], read=False)
	
	spawn_radius_generic(['city/nature/trees'], tags=['tree'], collision_check=True, stick_to_ground=True, limit=random.randint(150, 400), radius=80, innerradius=random.randint(30, 50), position=[0,5,0], prefix=prefix)
	spawn_radius_generic(['animals'], tags=['animal'], collision_check=True, stick_to_ground=True, limit=random.randint(200, 350), radius=random.randint(40, 80), innerradius=0, position=[0,5,0], orbit=True, prefix=prefix)
	
	common.flush_buffer()
