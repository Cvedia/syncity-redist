import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

# use lite drone packages
# helpers.drones_lst = helpers.drones_lite_lst

def help():
	return '''\
POC Drone single scene
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Orbits around from ground perspective looking at drones
	- Exports segmentation map bounding boxes
	- Exports RGB images
	- Exits leaving all objects exposed
'''

def spawnDroneObjs_ces(destroy=False, ground_position=[0,0,0], groundLimit=204, distH=120, distV=120, dist_lim=1000, pX=-20, pZ=-1000, pY=0, birdsRadius=90, birdsInnerRadius=0, carsRadius=50, carsInnerRadius=5, treesLimit=[50,200], buildingsRadius=335, buildingsInnerRadius=100, treesRadius=80, treesInnerRadius=20, buildingsLimit=[50,150], birdsLimit=[25,100], carsLimit=[5,25], dronesLimit=[80,200], prefix='spawner'):
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
		
		# initial
		ipos = [ 600, 577, -345 ]
		# final position
		fpos = [ 50, 45, -39 ]
		
		iterations = groundLimit + 5
		
		pdisp = [
			-(abs(max(ipos[0], fpos[0])) - abs(min(ipos[0], fpos[0]))) / iterations,
			-(abs(max(ipos[1], fpos[1])) - abs(min(ipos[1], fpos[1]))) / iterations,
			-(abs(max(ipos[2], fpos[2])) - abs(min(ipos[2], fpos[2]))) / iterations
		]
		
		common.sendData([
			'CREATE "city"',
			'"city" SET Transform position ({} {} {})'.format(ground_position[0], ground_position[1], ground_position[2])
		], read=False)
		
		while k < groundLimit:
			ipos[0] += pdisp[0]
			ipos[1] += pdisp[1]
			ipos[2] += pdisp[2]
			
			common.sendData([
				'CREATE "city/ground_{}" "city/ground/{}"'.format(k, random.choice(helpers.ground_lst)),
				'"city/ground_{}" SET Transform position ({} {} {})'.format(k, pX + settings.X_COMP, pY, pZ + settings.Z_COMP),
				'"city/ground_{}" SET Transform localScale ({} {} {})'.format(k, 12, 12, 12),
				'"cameras" SET Transform position ({} {} {})'.format(ipos[0], ipos[1], ipos[2])
			], read=False)
			settings._obj.append('city/ground_{}'.format(k))
			k += 1
			pZ += distH
			
			if pZ > dist_lim:
				pZ = -dist_lim
				pX += distV
		
		# for i in range(0,2):
		# 	helpers.spawnRadiusGeneric(['city/ground'], suffix='_{}'.format(i), limit=5, radius=100, innerradius=0, scale=[2,2,2], position=[0,i,0], collisionCheck=False)
	
	helpers.spawnRadiusGeneric(['city/nature/trees'], tags=['tree'], collisionCheck=False, limit=random.randint(treesLimit[0], treesLimit[1]), radius=treesRadius, innerradius=treesInnerRadius, position=[0,0,0], prefix=prefix)
	ipos[0] += pdisp[0]
	ipos[1] += pdisp[1]
	ipos[2] += pdisp[2]
	common.sendData(['"cameras" SET Transform position ({} {} {})'.format(ipos[0], ipos[1], ipos[2])], read=True)
	helpers.spawnRadiusGeneric(['city/buildings'], tags=['building'], collisionCheck=False, stickToGround=False, limit=random.randint(buildingsLimit[0], buildingsLimit[1]), radius=buildingsRadius, innerradius=buildingsInnerRadius, position=[0,0,0], prefix=prefix)
	ipos[0] += pdisp[0]
	ipos[1] += pdisp[1]
	ipos[2] += pdisp[2]
	common.sendData(['"cameras" SET Transform position ({} {} {})'.format(ipos[0], ipos[1], ipos[2])], read=True)
	helpers.spawnRadiusGeneric(['animals/birds'], tags=['bird'], limit=random.randint(birdsLimit[0], birdsLimit[1]), radius=birdsRadius, innerradius=birdsInnerRadius, position=[0,random.randint(15,95),0], prefix=prefix)
	ipos[0] += pdisp[0]
	ipos[1] += pdisp[1]
	ipos[2] += pdisp[2]
	common.sendData(['"cameras" SET Transform position ({} {} {})'.format(ipos[0], ipos[1], ipos[2])], read=True)
	helpers.spawnRadiusGeneric(['cars'], tags=['car'], limit=random.randint(carsLimit[0], carsLimit[1]), radius=carsRadius, innerradius=carsInnerRadius, position=[0,0,0], prefix=prefix)
	ipos[0] += pdisp[0]
	ipos[1] += pdisp[1]
	ipos[2] += pdisp[2]
	common.sendData(['"cameras" SET Transform position ({} {} {})'.format(ipos[0], ipos[1], ipos[2])], read=True)
	
	if dronesLimit[1] > 0:
		ipos[0] += pdisp[0]
		ipos[1] += pdisp[1]
		ipos[2] += pdisp[2]
		common.sendData(['"cameras" SET Transform position ({} {} {})'.format(ipos[0], ipos[1], ipos[2])], read=True)
		helpers.spawnRadiusGeneric(['drones'], limit=random.randint(dronesLimit[0], dronesLimit[1]), radius=random.randint(30,50), innerradius=0, position=[0,0,0], segmentationClass="Drone", prefix=prefix)
	# helpers.spawnRadiusGeneric(['drones/white'], limit=random.randint(10,50), radius=random.randint(30,50), innerradius=0, position=[0,0,0], segmentationClass="Car")
	
	common.waitQueue()

def run():
	settings.keep = True
	# mycams = ['cameras/cameraRGB', 'cameras/segmentation']
	mycams = ['cameras/cameraRGB']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		# helpers.addCameraRGB(pp='EnviroFX', textureFormat=14)
		helpers.addCameraRGB(pp='EnviroFX')
		# helpers.addCameraSeg(output_type='InstanceIds')
		# helpers.addCameraSeg()
		helpers.globalDiskSetup()
		
		helpers.addDiskOutput(mycams)
		
	common.sendData([
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(40.2, -60, 0),
		'"cameras/cameraRGB" SET Camera nearClipPlane 1',
		'"cameras/cameraRGB" SET Camera farClipPlane 10000',
		'"cameras/cameraRGB" SET Camera enabled true'
	], read=True)
	spawnDroneObjs_ces(ground_position=[-800,0,0], buildingsInnerRadius=300, treesInnerRadius=60, treesRadius=100, buildingsLimit=[50,80])
