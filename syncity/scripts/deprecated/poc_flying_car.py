import sys
import random
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
POC Drone time lapse scene, drone flying and landing randomness
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Goes up and down with a fixed camera X angle going from -20 to 60 depending on the Y position
	- Exports RGB images
	- Exits leaving all objects exposed
'''

cbuildings = [ 'Buildings_001/AM_131_building_obj_49 1', 'Buildings_001/AM_131_building_obj_05 2','Buildings_001/AM_131_building_obj_30 1','Buildings_001/AM_131_building_obj_29 1','Buildings_001/AM_131_building_obj_71 1','Buildings_001/AM_131_building_obj_41 1','Buildings_001/AM_131_building_obj_13 1','Buildings_001/AM_131_building_obj_62 1','Buildings_001/AM_131_building_obj_37 1','Buildings_001/AM_131_building_obj_15 1','Buildings_001/AM_131_building_obj_57 1','Buildings_001/AM_131_building_obj_43 1','Buildings_001/AM_131_building_obj_23 1','Buildings_001/AM_131_building_obj_16 1','Buildings_001/AM_131_building_obj_78 1','Buildings_001/AM_131_building_obj_07 1','Buildings_001/AM_131_building_obj_18 1','Buildings_001/AM_131_building_obj_79 1','Buildings_001/AM_131_building_obj_31 1','Buildings_001/AM_131_building_obj_28 1','Buildings_001/AM_131_building_obj_02 1','Buildings_001/AM_131_building_obj_138 1','Buildings_001/AM_131_building_obj_24 1','Buildings_001/AM_131_building_obj_11 1','Buildings_001/AM_131_building_obj_21 1','Buildings_001/AM_131_building_obj_67 1','Buildings_001/AM_131_building_obj_39 1','Buildings_001/AM_131_building_obj_20 1','Buildings_001/AM_131_building_obj_33 1','Buildings_001/AM_131_building_obj_101','Buildings_001/AM_131_building_obj_08 1','Buildings_001/AM_131_building_obj_17 1','Buildings_001/AM_131_building_obj_110 1','Buildings_001/AM_131_building_obj_22 1','Buildings_001/AM_131_building_obj_117 1','Buildings_001/AM_131_building_obj_104 1','Buildings_001/AM_131_building_obj_12 1','Buildings_001/AM_131_building_obj_130 1','Buildings_001/AM_131_building_obj_56 1','Buildings_001/AM_131_building_obj_58 1','Buildings_001/AM_131_building_obj_19 1','Buildings_001/AM_131_building_obj_50 1','Buildings_001/AM_131_building_obj_05 1','Buildings_001/AM_131_building_obj_26 1','Buildings_001/AM_131_building_obj_32 1','Buildings_001/AM_131_building_obj_114 1','Buildings_001/AM_131_building_obj_54 1','Buildings_001/AM_131_building_obj_80 1','Buildings_001/AM_131_building_obj_27 1','Buildings_001/AM_131_building_obj_01 1','Buildings_001/AM_131_building_obj_55 1','Buildings_001/AM_131_building_obj_68 1','Buildings_001/AM_131_building_obj_59 1','Buildings_001/AM_131_building_obj_14 1','Buildings_001/AM_131_building_obj_10 1','Buildings_001/AM_131_building_obj_04 1','Buildings_001/AM_131_building_obj_74 1','Buildings_001/AM_131_building_obj_03 1','Buildings_001/AM_131_building_obj_09 1', 'Buildings_002/AM_131_002_set_004_obj_0022','Buildings_002/AM_131_002_set_001_obj_0028','Buildings_002/AM_131_002_set_003_obj_0023','Buildings_002/AM_131_002_set_002_obj_0017','Buildings_002/AM_131_002_set_005_obj_000','Buildings_002/AM_131_002_set_001_obj_0014 1','Buildings_002/AM_131_002_set_001_obj_0047','Buildings_002/AM_131_002_set_004_obj_0033','Buildings_002/AM_131_002_set_001_obj_0043','Buildings_002/AM_131_002_set_001_obj_0045','Buildings_002/AM_131_002_set_004_obj_0026','Buildings_002/AM_131_002_set_002_obj_0069','Buildings_002/AM_131_002_set_002_obj_0027','Buildings_002/AM_131_002_set_001_obj_0044','Buildings_002/AM_131_002_set_003_obj_0026','Buildings_002/AM_131_002_set_001_obj_0041','Buildings_002/AM_131_002_set_002_obj_0030','Buildings_002/AM_131_002_set_001_obj_0034','Buildings_002/AM_131_002_set_001_obj_0036','Buildings_002/AM_131_002_set_004_obj_0032','Buildings_002/AM_131_002_set_004_obj_0016','Buildings_002/AM_131_002_set_001_obj_0030','Buildings_002/AM_131_002_set_001_obj_0015','Buildings_002/AM_131_002_set_001_obj_0021','Buildings_002/AM_131_002_set_004_obj_0011','Buildings_003/Building_008_high','Buildings_003/Building_045_high','Buildings_003/Building_076_high','Buildings_003/Building_044_high','Buildings_003/Building_062_high','Buildings_003/Building_002_high','Buildings_003/Building_019_high','Buildings_003/Building_028_high','Buildings_003/Building_031_high','Buildings_003/Building_012_high','Buildings_003/Building_064_high','Buildings_003/Building_046_high','Buildings_003/Building_075_high','Buildings_003/Building_043_high','Buildings_003/Building_048_high','Buildings_003/Building_022_high','Buildings_003/Building_074_high','Buildings_003/Building_068_high','Buildings_003/Building_069_high','Buildings_003/Building_011_high','Buildings_003/Building_040_high','Buildings_003/Building_013_high','Buildings_003/Building_015_high','Buildings_003/Building_060_high','Buildings_003/Building_057_high','Buildings_003/Building_055_high','Buildings_003/Building_066_high','Buildings_003/Building_042_high','Buildings_003/Building_016_high','Buildings_003/Building_025_high','Buildings_003/Building_056_high','Buildings_003/Building_041_high','Buildings_003/Building_026_high','Buildings_003/Building_063_high','Buildings_003/Building_035_high','Buildings_003/Building_038_high','Buildings_003/Building_003_high','Buildings_003/Building_078_high','Buildings_003/Building_030_high','Buildings_003/Building_021_high','Buildings_003/Building_052_high','Buildings_003/Building_007_high','Buildings_003/Building_032_high','Buildings_003/building_001_high','Buildings_003/Building_070_high','Buildings_003/Building_059_high','Buildings_003/Building_058_high','Buildings_003/Building_010_high','Buildings_003/Building_014_high','Buildings_003/Building_049_high','Buildings_003/Building_082_high','Buildings_003/Building_054_high','Buildings_003/Building_034_high','Buildings_003/Building_005_high','Buildings_003/Building_065_high','Buildings_003/Building_017_high','Buildings_003/Building_029_high','Buildings_003/Building_039_high','Buildings_003/Building_061_high','Buildings_003/Building_027_high','Buildings_003/Building_006_high','Buildings_003/Building_018_high','Buildings_003/Building_051_high','Buildings_003/Building_020_high','Buildings_003/Building_004_high','Buildings_003/Building_071_high','Buildings_003/Building_073_high','Buildings_003/Building_050_high','Buildings_003/Building_033_high' ]

def run():
	settings.keep = True
	mycams = ['cameras/cameraRGB']
	
	if settings.skip_setup == False:
		helpers.globalCameraSetup()
		helpers.addCameraRGB(pp='EnviroFX')
		helpers.globalDiskSetup()
		
		helpers.addDiskOutput(mycams)
		k = 0
		pX = -15
		pZ = -30
		pY = -5
		distV = 40
		distH = 40
		col_lim = 10
		col = 0
		
		buf = []
		for i in cbuildings:
			buf.append('CREATE "buildings/buildings_{}" "{}"'.format(k, i))
			buf.append('"buildings/buildings_{}" ADD Segmentation.Entity Segmentation.Class'.format(k))
			buf.append('"buildings/buildings_{}" SET Segmentation.Class className "Car"'.format(k))
			buf.append('"buildings/buildings_{}" SET Transform position ({} {} {})'.format(k, pX, pY, pZ))
			k = k + 1
			col = col + 1
			pZ += distH
			
			if col > col_lim:
				pZ = -30
				pX += distV
				col = 0
		
		helpers.spawnRadiusGeneric(['Buildings_001/'], limit=350, radius=350, innerradius=0)
		helpers.spawnRadiusGeneric(['Buildings_002/'], limit=350, radius=350, innerradius=0)
		helpers.spawnRadiusGeneric(['Buildings_003/'], limit=350, radius=350, innerradius=0)
		common.sendData(buf, read=True)
	
	pY = 1
	pY_direction = True
	pZ = -16
	pZ_direction = True
	
	a_y = -45
	a_y_direction = True
	a_x = -20
	
	y_slow = 0
	loop = 0
	hour = 8
	minute = 0
	second = 0
	c = 0
	
	# reset camera
	common.sendData([
		'"cameras/cameraRGB" SET Camera enabled true',
		'"cameras" SET Transform position ({} {} {})'.format(0, pY, pZ),
		'"cameras" SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, 0),
		'"EnviroSky" SET EnviroSky cloudsMode "{}"'.format('Volume')
	])
	
	if settings.setup_only:
		return
	
	common.waitQueue()
	
	while hour < 19:
		common.sendData([
			'"spawner/drones" SET Transform position ({} {} {})'.format(0, random.randint(2, 25), 0),
			'"spawner/drones" SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, 15), random.randint(0, 359), random.randint(-2, 2)),
			'"spawner/animals/birds" SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
			'"spawner/animals/birds" SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
			'"spawner/cars" SET Transform eulerAngles ({} {} {})'.format(0, -y_slow * 8, 0),
			'"spawner/city/nature" SET Transform eulerAngles ({} {} {})'.format(0, y_slow, 0),
			'"cameras" SET Transform position ({} {} {})'.format(0, pY, pZ),
			'"cameras" SET Transform eulerAngles ({} {} {})'.format(a_x, a_y, 0),
			'"EnviroSky" SET EnviroSky GameTime.Hours {}'.format(hour),
			'"EnviroSky" SET EnviroSky GameTime.Minutes {}'.format(minute),
			'"EnviroSky" SET EnviroSky GameTime.Seconds {}'.format(second)
		], read=False)
		
		helpers.takeSnapshot(mycams)
		
		y_slow = y_slow + .1
		
		# angles
		if a_y_direction == True:
			a_y = a_y + random.uniform(.5, 1.75)
		else:
			a_y = a_y - random.uniform(.5, 1.75)
		
		if a_y >= 160:
			a_y_direction = False
		elif a_y <= -45:
			a_y_direction = True
		
		if pY_direction == True:
			pY = pY + random.uniform(.1, .75)
		else:
			pY = pY - random.uniform(.1, .75)
		
		if pY >= 30:
			pY_direction = False
		elif pY <= 1:
			pY_direction = True
		
		if pZ_direction == True:
			pZ = pZ + random.uniform(.1, .75)
		else:
			pZ = pZ - random.uniform(.1, .75)
		
		if pZ >= 16:
			pZ_direction = False
		elif pZ <= -16:
			pZ_direction = True
		
		a_x = (pY * 2.667) -20 # -20 -> 60 depending on Y
		
		# time
		second = second + 30
		
		if second >= 60:
			minute = minute + 1
			second = 0
		if minute >= 60:
			minute = 0
			hour = hour + 1
		
		loop = loop + 1
		
		if loop % 30 == 0:
			common.sendData([
				'"EnviroSky" EXECUTE EnviroSky ChangeWeather "{}"'.format(helpers.weather_lst[c])
			], read=False)
			c = c + 1
			if c > 7:
				c = 0
