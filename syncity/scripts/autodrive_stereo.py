import random
import time
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Autodrive - Stero camera setup
	- Spawns autodrive track
	- Setups envirosky postprocessing filters
	- Setup depth and RGB cameras in stereo
	- Exits leaving all objects exposed
'''

def run():
	settings.keep = True
	
	car_obj = 'SyncityJPickup'
	mycams = ['{}/Front'.format(car_obj)]
	snap_cams = [
		'{}/rgb1'.format(car_obj),
		'{}/rgb2'.format(car_obj),
		
		'{}/depth1'.format(car_obj),
		'{}/depth2'.format(car_obj),
		
		'{}/bumper'.format(car_obj),
		'{}/bumper_depth'.format(car_obj)
	]
	
	if settings.skip_setup == False:
		camera_size = [ 1024, 768 ]
		
		common.sendData([
			'CREATE "autodrive/autodrive_tile" FROM "autodrive" AS "autodrive"',
			'CREATE "autodrive/SyncityJPickup" FROM "autodrive" AS "{}"'.format(car_obj)
		])
		
		helpers.addWindzone(target='autodrive')
		
		helpers.addCameraRGB(width=camera_size[0], height=camera_size[1], labelRoot=car_obj, label=snap_cams[0], audio=False, pp='EnviroFX')
		helpers.addCameraRGB(width=camera_size[0], height=camera_size[1], labelRoot=car_obj, label=snap_cams[1], audio=False, pp='EnviroFX')
		helpers.addCameraRGB(width=camera_size[0], height=camera_size[1], labelRoot=car_obj, label=snap_cams[4], audio=False, pp='EnviroFX')
		
		helpers.addCameraDepth(width=camera_size[0], height=camera_size[1], label=snap_cams[2], clippingFar=300)
		helpers.addCameraDepth(width=camera_size[0], height=camera_size[1], label=snap_cams[3], clippingFar=300)
		helpers.addCameraDepth(width=camera_size[0], height=camera_size[1], label=snap_cams[5], clippingFar=300)
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(snap_cams)
		
		common.sendData([
			# reset car position
			'"{}" SET Transform position (-100.76 2.25 -415.57)'.format(car_obj),
			'"{}" SET Transform eulerAngles (0.274 37.499 0)'.format(car_obj),
			
			'"{}" SET VPCustomInput enabled false'.format(car_obj),
			
			'"autodrive/Road/Autodrive Road" SET UnityEngine.MeshCollider enabled true',
			
			'"{}" ADD UnityEngine.PostProcessing.PostProcessingBehaviour'.format(mycams[0]),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile EnviroFX'.format(mycams[0]),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled true'.format(mycams[0]),
			'"{}" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.tonemapper "1"'.format(mycams[0]),
			
			'"autodrive" SET active true',
			
			# all set, enable objects
			'"{}" SET active true'.format(car_obj),
			'"{}" SET Transform localPosition (-0.3 1 -8)'.format(snap_cams[0]),
			'"{}" SET Transform localPosition (0.3 1 -8)'.format(snap_cams[1]),
			
			'"{}" SET Transform localPosition (-0.3 1 -8)'.format(snap_cams[2]),
			'"{}" SET Transform localPosition (0.3 1 -8)'.format(snap_cams[3]),
			
			# '"{}" SET Transform localPosition (0 1 -8)'.format(snap_cams[2]),
			
			'"{}" SET Transform localPosition (0 1 2.2)'.format(snap_cams[4]),
			'"{}" SET Transform localPosition (0 1 2.2)'.format(snap_cams[5]),
			
			'"{}" SET Sensors.RenderCamera alwaysOn true'.format(mycams[0]),
			
			'"{}" SET Sensors.RenderCamera alwaysOn true'.format(snap_cams[0]),
			'"{}" SET Sensors.RenderCamera alwaysOn true'.format(snap_cams[1]),
			'"{}" SET Sensors.RenderCamera alwaysOn true'.format(snap_cams[2]),
			'"{}" SET Sensors.RenderCamera alwaysOn true'.format(snap_cams[3]),
			'"{}" SET Sensors.RenderCamera alwaysOn true'.format(snap_cams[4]),
			'"{}" SET Sensors.RenderCamera alwaysOn true'.format(snap_cams[5]),
			
			'"{}" SET Camera enabled true'.format(mycams[0]),
			'"{}" SET Camera enabled true'.format(snap_cams[0]),
			'"{}" SET Camera enabled true'.format(snap_cams[1]),
			'"{}" SET Camera enabled true'.format(snap_cams[2]),
			'"{}" SET Camera enabled true'.format(snap_cams[3]),
			'"{}" SET Camera enabled true'.format(snap_cams[4]),
			'"{}" SET Camera enabled true'.format(snap_cams[5]),
			'"{}" SET active true'.format(car_obj),
			
			'"EnviroSky" EXECUTE EnviroSky ChangeWeather "Cloudy 1"'
		], read=False)
	
	common.flushBuffer()
