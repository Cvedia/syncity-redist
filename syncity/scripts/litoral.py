import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Litoral demo for SparkCognition
'''

def args(parser):
	try:
		parser.add_argument('--boats', type=int, default=50, help='Number of boats, defaults to 50')
	except:
		pass
	try:
		parser.add_argument('--loop_limit', type=int, default=100, help='Number of iterations, defaults to 100')
	except:
		pass

def run():
	
	mycams = [ 'Camera', 'Camera/Segmentation' ]
	
	if settings.skip_setup == False:
		common.sendData([
			'LOAD "Litoral" from "litoral_scene"',

			'[Cameras.RenderTexture] CreateNew "RGB Texture" 1920 1080',
			'"Camera" SET Camera targetTexture "RGB Texture"',
			'"Camera" SET FlyCamera enabled false',
			
			'"Segmentation.Profile.instance" PUSH classes "Void" "Boats"',
			'CREATE Segmentation.LookUpTable AS "lookUpTable"',
			'"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Boats->red"',

			'[Segmentation.Camera] CreateWithClassColors "Camera/Segmentation" WITH lookUpTable "lookUpTable"',
			'"Camera/Segmentation" ADD Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes Segmentation.Output.BoundingBoxesOnTexture',
			'"Camera/Segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Boats"',
			'"Camera/Segmentation" SET Segmentation.Output.BoundingBoxesOnTexture boxesColor "Yellow"',
			'[Cameras.RenderTexture] CreateNew "Segmentation Texture" 1920 1080',
			'"Camera/Segmentation" SET Camera targetTexture "Segmentation Texture" farClipPlane 52904 fieldOfView 25',
			'"Camera/Segmentation" SET active true',

			'[UI.Window] ShowFromRenderTexture "Segmentation Texture" AS "Segmentation Texture"',
			'[UI.Window] ShowFromRenderTexture "RGB Texture" AS "RGB"',

			'[Sensors.Disk] CreateDisk "disk1" "{}"'.format(settings.output_path),
			'[Sensors.Disk] AddTextureOutput IN "disk1" "RGB Texture" AS "Cameras/rgb" outputType "rgb"',
			'[Sensors.Disk] AddTextureOutput IN "disk1" "Segmentation Texture" AS "Cameras/segmentation" outputType "rgb"',
			'"disk1" SET active true',
			
			'CREATE "ships"',
			'"ships" SET active true',
			
			'"Camera" ADD Orbit',
			'"Camera" SET Orbit distance 10000~20000 elevation 45~89.999 azimuth -120~120 targetOffset (-10000~10000 -2000~10000 -1000~10000)',
		], read=False)
		
		nbOfBoats = 0
		while nbOfBoats < settings.boats:
			nbOfBoats = nbOfBoats + 1
			common.sendData([
				'CREATE "Ships/?" from "litoral" as "ships/{}"'.format(nbOfBoats),
				'"ships/{}" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)'.format(nbOfBoats),
				'"ships/{}" ADD Segmentation.Class Segmentation.Entity'.format(nbOfBoats),
				'"ships/{}" SET Segmentation.Class className "Boats"'.format(nbOfBoats),
				'"ships/{}" SET active true'.format(nbOfBoats),
			], read=False)
	
	if settings.setup_only == True:
		return
	
	loop = 0
	common.waitQueue()
	common.sendData('"{}" SET Sensors.Disk counter 1'.format('disk1'))
	
	while loop < settings.loop_limit:
		common.sendData([
			# '"Camera" SET Orbit distance 10000~20000 elevation 45~89.999 azimuth -120~120 targetOffset (-10000~10000 -2000~10000 -1000~10000)',
			'"Camera" SET Orbit distance 1000~2500 elevation 4~45 azimuth -120~120 targetOffset (100~1000 1000~2500 1000~10000)'
		], read=False)

		nbOfBoats = 0
		while nbOfBoats < settings.boats:
			nbOfBoats = nbOfBoats + 1
			common.sendData([
				'"ships/{}" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)'.format(nbOfBoats),
			], read=False)
		
		helpers.takeSnapshot(mycams, autoSegment=True, forceNoop=True)
		"""
		r = common.sendData([
			'"disk1" EXECUTE Sensors.Disk Snapshot',
			'"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes',
			'NOOP',
			], read=True)
		helpers.seq_save('bbox', r)
		"""
		
		loop += 1
