import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Simple random experimentation with segmentation and fixed assets
	- Creates random named cars in random positions
	- Creates a RGB camera
	- Creates a segmentation map camera
	- Rotates cars and cameras at random
	- Changes camera parameters at random
	- Exports segmentation map bounding boxes
	- Exports RGB images
'''

def run():
	mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(flycam=settings.flycam, pp='EnviroFX')
		helpers.addCameraSeg(segments=['Car'])
		
		if settings.envirosky == False:
			helpers.addLight()
		
		helpers.globalDiskSetup()
		helpers.addDiskOutput(mycams)
	
	# load all cars carsLimit times on scene
	k = 0
	
	pX = -15
	pZ = -30
	distH = 7 # car front
	distV = 4 # car side
	dist_lim = 30 # z distance limit
	
	while k < settings.carsLimit:
		common.sendData([
			'CREATE "Cars/?" FROM "cars" AS "mycar_{}"'.format(k),
			'"mycar_{}" ADD Segmentation.ClassGroup'.format(k),
			'"mycar_{}" SET Segmentation.ClassGroup itemsClassName "Car"'.format(k),
			'"mycar_{}" SET Transform position ({} {} {})'.format(k, pX + settings.X_COMP, 5 + settings.Y_COMP, pZ + settings.Z_COMP),
			'"mycar_{}" SET active true'.format(k)
		])
		
		settings._obj.append('mycar_{}'.format(k))
		pZ += distH
		k += 1
		
		if pZ > dist_lim:
			pZ = -dist_lim
			pX += distV
	
	a = 0
	while a < 360:
		# one dimension camera sweep in 10 degrees steps
		common.sendData('"camera" SET Transform eulerAngles (0 {} 0)'.format(a))
		k = 0
		
		while k < settings.carsLimit:
			# make sure car is on camera's fov
			# common.sendData('mycar_{} FRUSTUM mycamera RIGHT {} DOWN {} DEPTH {}'.format(k, random.uniform(0, 1), random.uniform(0, 1), random.randint(5, 120)))
			# rotate car at random
			common.sendData('"mycar_{}" SET Transform eulerAngles ({} {} {})'.format(k, random.randint(0, 359), random.randint(0, 359), random.randint(0, 359)))
			k += 1
		
		# all possible properties - https://docs.unity3d.com/ScriptReference/Camera.html
		# common.sendData('camera/cameraRGB SET fieldOfView {}'.format(random.randint(60, 90)))
		# common.sendData('camera/cameraRGB SET aspect {}'.format(random.uniform(0, 1)))
		
		helpers.takeSnapshot(mycams)
		helpers.takeSegSnapshot([ 'cameras/segmentation' ])
		
		a += 10
