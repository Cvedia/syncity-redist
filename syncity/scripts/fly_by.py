import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Fly by test
	- Spawns a complex scenario
	- Flys over with camera pointing down
	- Exports RGB images
	- Exports Segmented images
'''

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(flycam=settings.flycam, pp='EnviroFX')
		helpers.addCameraSeg(segments=['Car'])
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
		
		helpers.spawnParkingLot(limit=200, fixed=True, pY=5, distH=20, distV=20, pX=-60, pZ=-90)
		
		helpers.spawnRadiusGeneric(['city/nature/trees'], collisionCheck=False, limit=250, radius=80, innerradius=30, position=[0,10,0])
		helpers.spawnRadiusGeneric(['city/signs'], limit=100, radius=35, innerradius=0, position=[0,10,0])
		helpers.spawnRadiusGeneric(['animals'], limit=300, radius=50, innerradius=0, position=[0,10,0])
		helpers.spawnRadiusGeneric(['city/buildings'], limit=100, radius=335, innerradius=80, position=[0,10,0])
		
		for i in range(0,9):
			helpers.spawnRadiusGeneric(['city/ground'], suffix='_{}'.format(i), limit=50, radius=50, innerradius=0, scale=[2,2,2], position=[0,i,0], collisionCheck=False)
	
	# force a render to visualize on the ui
	helpers.doRender(mycams)
	
	common.sendData([
		'"cameras/cameraRGB" SET Transform eulerAngles (90 0 0)',
		'"cameras/segmentation" SET Transform eulerAngles (90 0 0)'
	])
	
	if settings.setup_only:
		return
	
	for x in range(-40, 40):
		for z in range(-40, 40):
			common.sendData([
				'"cameras/cameraRGB" SET Transform position ({} 50 {})'.format(x, z),
				'"cameras/segmentation" SET Transform position ({} 50 {})'.format(x, z)
			])
			
			# for i in range(0,200):
			#	sendData('cars/car_{} SET Transform eulerAngles ({} {} {})'.format(i, random.randint(0, 359), random.randint(0, 359), random.randint(0, 359)))
			
			helpers.takeSnapshot(mycams)
			helpers.takeSegSnapshot([ 'cameras/segmentation' ])
