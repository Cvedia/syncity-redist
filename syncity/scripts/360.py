import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
360 object
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Creates a Depth camera
	- Spawns a single object and rotates around it
	- Exports RGB images
	- Exports Segmentation images
	- Exports Depth map images
	- Exits leaving all objects exposed
'''

def minVersion():
	return '18.07.26.0000'

def run():
	settings.keep = True
	mycams = [
		'cameras/cameraRGB',
		'cameras/segmentation',
		'cameras/depth',
		'cameras/segmentationIID',
	]
	
	obj = 'Cars/VW_Golf_V/VW_Golf_V'
	bundle = 'cars'
	# obj = 'Drones/DJI_Phantom_4_Pro/DJI_Phantom_4_Pro'
	
	obj = 'cars/isuzu_giga_(mk2)_tractor_truck_with_trailer_semi_utility_4000_dx/isuzu_giga_(mk2)_tractor_truck/isuzu_giga_(mk2)_tractor_truck'
	bundle = 'thermal-cars'
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.addCameraSeg(segments=['Car'], lookupTable=[['Car', 'red']])
		
		# NOTE: This could be optimized by adding the same camera target on
		# multiple RenderCameraLink components.
		
		helpers.addCameraDepth(label=mycams[2])
		
		# setup segmentation instance id exporter
		common.sendData([
			'CREATE "{}"'.format(mycams[3]),
			'"{}" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.InstanceIds'.format(mycams[3]),
			'CREATE RenderTexture 1024 768 24 "ARGBFloat" "Default" AS "segmentationIIDs"',
			'"{}" SET Camera targetTexture "segmentationIIDs"'.format(mycams[3]),
			'"{}" SET active true'.format(mycams[3]),
			'[UI.Window] ShowFromRenderTexture "segmentationIIDs" AS "segmentationIIDs"'
		])
		
		"""
		common.sendData([
			'CREATE "{}"'.format(mycams[3]),
			'"{}" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.InstanceIds'.format(mycams[3]),
			'"{}" SET active true'.format(mycams[3]),
			'[UI.Window] ShowFromCamera "{}" AS "segmentationIIDs" WITH {} {} 24 "ARGBFloat" "Default"'.format(mycams[3], 1024, 768)
		])
		"""
		
		common.sendData([
			# 'CREATE "{}" FROM "drones" AS "obj/subject"'.format(obj),
			'CREATE "{}" FROM "{}" AS "obj/subject"'.format(obj, bundle),
			'"obj" SET active false',
			'"obj/subject" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 0, 0, 0, 0, 0),
			
			'"obj" ADD Segmentation.Entity Segmentation.Class',
			'"obj" SET Segmentation.Class className "Car"',
			'"obj" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(-6, 0, -9, 0, 0, 0),
			
			# 'CREATE "city/ground_0" "city/ground/Grass"',
			# '"city/ground_0" SET Transform position (0 0 0)',
			# '"city/ground_0" SET Transform localScale (5 5 5)'
		], read=False)
	
	# reset camera
	common.sendData([
		'"obj" SET active true',
		'"obj/subject" SET active true',
		
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras/segmentation" SET Camera enabled true',
		
		'"cameras" SET Transform position ({} {} {}) eulerAngles ({} {} {})'.format(0, 1, -16, 0, -40, 0),
		'"EnviroSky" SET EnviroSky cloudsMode "{}" cloudsSettings.globalCloudCoverage {}'.format('Volume', -0.04),
		'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[1])
	], read=False)
	
	if settings.skip_setup == False:
		"""
		helpers.addDataExport(
			videoLinks=helpers.cameraExportParametrize(mycams, "video"),
			fieldLinks=[
				{
					"target": "obj",
					"label": "subject",
					"componentName": "Transform",
					"fieldName": "eulerAngles",
					"onChange": True
				}
			]
		)
		
		"""
		
		_params = helpers.cameraExportParametrize(mycams, "image")
		_params[2]['options']['format'] = 'raw'
		_params[3]['options']['format'] = 'raw'
		
		helpers.addDataExport(
			imageLinks=_params,
			fieldLinks=[
				{
					"target": "obj",
					"label": "subject",
					"componentName": "Transform",
					"fieldName": "eulerAngles",
					"onChange": True
				}
			]
		)
		
	
	if settings.setup_only == True:
		return
	
	common.waitQueue()
	
	displ_x = 5
	displ_y = 2
	a_x = 0
	exp = 1
	
	while a_x < 360:
		a_y = 0
		
		# do a 360 around object
		while a_y < 360:
			common.sendData([
				'"obj" SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, 0)
			])
			a_y = a_y + displ_y
		
		# next
		a_x = a_x + displ_x
