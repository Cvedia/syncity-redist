import random
from .. import common, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Strawberry field runner
	Note: This depends on the strawberry scene
	- Runs harvester around the strawberry fields
'''

def run():
	if settings.setup_only: # this scene has no setup!
		return
	
	obj = 'Harvester'
	s_x = x = -35.65
	s_z = z = 33.56
	displ_z = -8.44
	displ_x = 45.789
	
	common.sendData([
		'"{}" SET Transform eulerAngles ({} {} {})'.format(obj, 0, 0, 0),
		'"{}" SET Transform position ({} {} {})'.format(obj, x, 0, z)
	])
	
	force_sync = True
	loop = 0
	
	stepping = {
		"x": 1,
		"z": 1,
		"a_y": 5
	}
	
	loop = 0
	
	while loop < 4:
		c_x = 0
		c_z = 0
		a_y = 0
		
		# move forward
		while c_x < displ_x:
			c_x += stepping['x']
			common.sendData([
				'"{}" SET Transform position ({} {} {})'.format(obj, x + c_x, 0, z + c_z)
			])
		
		# turn 90 degrees
		while a_y < 90:
			a_y += stepping['a_y']
			common.sendData([
				'"{}" SET Transform eulerAngles ({} {} {})'.format(obj, 0, a_y, 0),
			])
		
		# move to the next step field
		while c_z > displ_z:
			c_z -= stepping['z']
			common.sendData([
				'"{}" SET Transform position ({} {} {})'.format(obj, x + c_x, 0, z + c_z)
			])
		
		# turn 90 degrees
		while a_y < 180:
			a_y += stepping['a_y']
			common.sendData([
				'"{}" SET Transform eulerAngles ({} {} {})'.format(obj, 0, a_y, 0),
			])
		
		# move back
		while c_x > 0:
			c_x -= stepping['x']
			common.sendData([
				'"{}" SET Transform position ({} {} {})'.format(obj, x + c_x, 0, z + c_z)
			])
		
		# turn back 90 degrees
		while a_y > 90:
			a_y -= stepping['a_y']
			common.sendData([
				'"{}" SET Transform eulerAngles ({} {} {})'.format(obj, 0, a_y, 0),
			])
		
		# move to the next step field
		while c_z > displ_z*2:
			c_z -= stepping['z']
			common.sendData([
				'"{}" SET Transform position ({} {} {})'.format(obj, x + c_x, 0, z + c_z)
			])
		
		# turn back 90 degrees
		while a_y > 0:
			a_y -= stepping['a_y']
			common.sendData([
				'"{}" SET Transform eulerAngles ({} {} {})'.format(obj, 0, a_y, 0),
			])
		
		# move forward
		while c_x < displ_x:
			c_x += stepping['x']
			common.sendData([
				'"{}" SET Transform position ({} {} {})'.format(obj, x + c_x, 0, z + c_z)
			])
		
		# turn 90 degrees
		while a_y < 90:
			a_y += stepping['a_y']
			common.sendData([
				'"{}" SET Transform eulerAngles ({} {} {})'.format(obj, 0, a_y, 0),
			])
		
		# move to the next step field
		while c_z > displ_z*3:
			c_z -= stepping['z']
			common.sendData([
				'"{}" SET Transform position ({} {} {})'.format(obj, x + c_x, 0, z + c_z)
			])
		
		# turn 90 degrees
		while a_y < 180:
			a_y += stepping['a_y']
			common.sendData([
				'"{}" SET Transform eulerAngles ({} {} {})'.format(obj, 0, a_y, 0),
			])
		
		# move back
		while c_x > 0:
			c_x -= stepping['x']
			common.sendData([
				'"{}" SET Transform position ({} {} {})'.format(obj, x + c_x, 0, z + c_z)
			])
		
		if loop == 0:
			x = s_x + displ_x
			z = s_z
		elif loop == 1:
			x = s_x
			z = s_z + (displ_z * 5)
		elif loop == 2:
			x = s_x + displ_x
			z = s_z + (displ_z * 5)
		
		loop += 1
