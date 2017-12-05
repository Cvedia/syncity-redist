#!/usr/bin/python

import os
import sys
import telnetlib
import time
import atexit
import argparse
import platform
import random
import signal
import textwrap
import types
import json

from datetime import datetime
from subprocess import PIPE, Popen, STDOUT

class readable_dir(argparse.Action):
	def __call__(self, parser, namespace, values, option_string=None):
		prospective_dir=values
		if not os.path.isdir(prospective_dir):
			raise argparse.ArgumentTypeError("readable_dir:{0} is not a valid path".format(prospective_dir))
		if os.access(prospective_dir, os.R_OK):
			setattr(namespace,self.dest,prospective_dir)
		else:
			raise argparse.ArgumentTypeError("readable_dir:{0} is not a readable dir".format(prospective_dir))

def output (s):
	print ('[{}] {}'.format(datetime.now().strftime("%H:%M:%S.%f"), s))

# HELPER FUNCTIONS #############################################################

def global_camera_setup(player='cameras'):
	send_data([
		'CREATE {}'.format(player),
		'{} SET Transform position ({} {} {})'.format(player, X_COMP -6, Y_COMP, Z_COMP -50),
		'{} SET Transform eulerAngles ({} {} {})'.format(player, 0, 0, 0),
		'{} ADD Orbit'.format(player),
		# resize camera display on app, this is relative to the size of the window
		'Canvas/Cameras/Viewport/Content SET UI.GridLayoutGroup cellSize (1024 768)'
	])
	obj.append(player)

def add_camera_rgb(width=2048, height=1536, audio=True, envirosky=False, flycam=False, player='cameras', playerCamera='cameras/cameraRGB'):
	send_data([
		'CREATE {}'.format(playerCamera),
		# 'cameras/cameraRGB SET active false',
		'{} ADD Camera'.format(playerCamera),
		'{} ADD Sensors.RenderCamera'.format(playerCamera),
		
		'{} SET Sensors.RenderCamera sRGB true'.format(playerCamera),
		
		# set camera resolution
		'{} SET Sensors.RenderCamera resolution ({} {})'.format(playerCamera, width, height),
		
		# 'cameras/cameraRGB SET Camera targetTexture.antiAliasing 8',
		# 'cameras/cameraRGB SET active true',
	], read=False)
	
	if audio:
		send_data(['{} ADD AudioListener'.format(playerCamera)], read=False)
	if flycam:
		send_data(['{} ADD FlyCamera'.format(playerCamera)], read=False)
	if envirosky:
		send_data([
			'CREATE EnviroSky EnviroSky',
			'EnviroSky SET EnviroSky Player {}'.format(player),
			'EnviroSky SET EnviroSky PlayerCamera {}'.format(playerCamera),
			
			# disable time progression
			'EnviroSky SET EnviroSky GameTime.ProgressTime None',
			
			# skip weather transitions
			'EnviroSky SET EnviroSky weatherSettings.cloudTransitionSpeed 100',
			'EnviroSky SET EnviroSky weatherSettings.effectTransitionSpeed 100',
			'EnviroSky SET EnviroSky weatherSettings.fogTransitionSpeed 100'
		], read=False)
	
	flush_buffer()
	obj.append(playerCamera)

def add_camera_rgb_pp(profile='Profile2', scion=True, playerCamera='cameras/cameraRGB'):
	send_data([
		# 'cameras/cameraRGB SET active false',
		'{} ADD UnityEngine.PostProcessing.PostProcessingBehaviour'.format(playerCamera),
		'{} SET UnityEngine.PostProcessing.PostProcessingBehaviour profile {}'.format(playerCamera, profile)
	], read=False)
	
	if scion:
		send_data([
			'{} ADD ScionEngine.ScionPostProcess'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess bloom true'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess bloomIntensity 0.3'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess grain false'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess vignette false'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess chromaticAberration false'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess lensFlare false'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess lensDirt false'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess depthOfField false'.format(playerCamera),
			# '{} SET active true'
		], read=False)
	
	flush_buffer()
	obj.append(playerCamera)

# scion camera postprocessing effects
def camera_rgb_pp_random(playerCamera='cameras/cameraRGB'):
	# grain effect
	if bool(random.getrandbits(1)):
		send_data([
			'{} SET ScionEngine.ScionPostProcess grain true'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess grainIntensity {}'.format(playerCamera, random.uniform(0, 0.4))
		], read=False)
	# else:
	# 	send_data(['{} SET ScionEngine.ScionPostProcess grain false'.format(playerCamera)])
	
	# chromatic aberration
	if bool(random.getrandbits(1)):
		send_data([
			'{} SET ScionEngine.ScionPostProcess chromaticAberration true'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess chromaticAberrationDistortion {}'.format(playerCamera, random.uniform(0, 1)),
			'{} SET ScionEngine.ScionPostProcess chromaticAberrationIntensity {}'.format(playerCamera, random.uniform(0, 20))
		], read=False)
	# else:
	# 	send_data(['{} SET ScionEngine.ScionPostProcess chromaticAberration false'.format(playerCamera)])
	
	# blooming effect
	if bool(random.getrandbits(1)):
		send_data([
			'{} SET ScionEngine.ScionPostProcess bloom true'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess bloomThreshold {}'.format(playerCamera, random.uniform(0, 50)),
			'{} SET ScionEngine.ScionPostProcess bloomIntensity {}'.format(playerCamera, random.uniform(0, 1)),
			'{} SET ScionEngine.ScionPostProcess bloomBrightness {}'.format(playerCamera, random.uniform(0, 8)),
			'{} SET ScionEngine.ScionPostProcess bloomDownsamples {}'.format(playerCamera, random.randint(1, 8)),
			'{} SET ScionEngine.ScionPostProcess bloomDistanceMultiplier {}'.format(playerCamera, random.randuniform(0.25, 1.25))
		], read=False)
	# else:
	# 	send_data(['{} SET ScionEngine.ScionPostProcess bloom false'])
	
	# vignette
	if bool(random.getrandbits(1)):
		send_data([
			'{} SET ScionEngine.ScionPostProcess vignette true'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess vignetteIntensity {}'.format(playerCamera, rand.uniform(0, 1)),
			'{} SET ScionEngine.ScionPostProcess vignetteScale {}'.format(playerCamera, random.uniform(0, 1)),
		], read=False)
	# else:
	#	send_data(['{} SET ScionEngine.ScionPostProcess vignette false'.format(playerCamera)])
	
	# lens flare
	if bool(random.getrandbits(1)):
		send_data([
			'{} SET ScionEngine.ScionPostProcess lensFlare true'.format(playerCamera),
			'{} SET ScionEngine.ScionPostProcess lensFlareGhostIntensity {}'.format(playerCamera, random.uniform(0, 2)),
			'{} SET ScionEngine.ScionPostProcess lensFlareGhostDispersal {}'.format(playerCamera, random.uniform(0, 2)),
			'{} SET ScionEngine.ScionPostProcess lensFlareGhostDistortion {}'.format(playerCamera, random.uniform(0, 1)),
			'{} SET ScionEngine.ScionPostProcess lensFlareGhostEdgeFade {}'.format(playerCamera, random.uniform(0, 1.5)),
			'{} SET ScionEngine.ScionPostProcess lensFlareHaloIntensity {}'.format(playerCamera, random.uniform(0, 2)),
			'{} SET ScionEngine.ScionPostProcess lensFlareHaloWidth {}'.format(playerCamera, random.uniform(0, 0.8)),
			'{} SET ScionEngine.ScionPostProcess lensFlareHaloDistortion {}'.format(playerCamera, random.uniform(0, 1)),
			'{} SET ScionEngine.ScionPostProcess lensFlareBlurStrength {}'.format(playerCamera, random.uniform(0, 1)),
			'{} SET ScionEngine.ScionPostProcess lensFlareDownsamples {}'.format(playerCamera, random.randint(1, 3))
		], read=False)
	# else:
	# 	send_data(['{} SET ScionEngine.ScionPostProcess lensFlare false'.format(playerCamera)])
	
	# tonemapping
	send_data(['{} SET ScionEngine.ScionPostProcess tonemappingMode {}'.format(playerCamera, random.choice(tonemappings))], read=False)
	flush_buffer()

def set_disk_texture( lst ):
	if skip_disk:
		return
	
	for l in lst:
		send_data([
			'disk1/{} SET Sensors.RenderCameraLink target {}'.format(l.capitalize(),l)
		], read=False)

def add_camera_seg(width=1024, height=768, segment="Car"):
	send_data([
		'CREATE cameras/segmentation',
		# 'cameras/segmentation SET active false',
		'cameras/segmentation ADD Camera',
		'cameras/segmentation ADD Sensors.RenderCamera',
		'cameras/segmentation SET Sensors.RenderCamera sRGB false',
		'cameras/segmentation SET Sensors.RenderCamera resolution ({} {})'.format(width, height),
		'cameras/segmentation SET Camera targetTexture.filterMode Point',
		'cameras/segmentation ADD Segmentation.Segmentation',
		'cameras/segmentation PUSH Segmentation.Segmentation boundingBoxesFilter {}'.format(segment),
		'cameras/segmentation PUSH Segmentation.Segmentation unoccludedClasses {}'.format(segment),
		
		# 'cameras/segmentation SET Camera targetTexture.antiAliasing 8',
		# 'cameras/segmentation SET active true'
	], read=False)
	
	flush_buffer()
	obj.append('cameras/segmentation')

def flush_buffer():
	if force_sync:
		return
	send_data('NOOP', read=True)

def add_light(position=[34,-22.53,0], intensity=1.7):
	send_data([
		'CREATE light',
		'light ADD Light',
		'light SET Light type Directional',
		'light SET Transform eulerAngles ({} {} {})'.format(position[0], position[1], position[2]),
		'light SET Light intensity {}'.format(intensity),
		# 'light SET Light color #',
		'light SET Light shadows Soft'
	], read=False)
	flush_buffer()
	obj.append('light')

def global_disk_setup():
	if skip_disk:
		return
	
	send_data([
		'CREATE disk1',
		'disk1 SET active false',
		'disk1 ADD Sensors.Disk',
		'disk1 SET Sensors.Disk path "{}"'.format(output_path),
		'disk1 SET active true'
	], read=False)
	flush_buffer()
	obj.append('disk1')

def do_render( lst ):
	for l in lst:
		send_data('{} EXECUTE Sensors.RenderCamera RenderFrame'.format(l))

def scene_filter(pref, n_min, n_max):
	data = json.load(open('{}{}_{}.json'.format(local_path, pref, globals()['seq_save_i'] - 1), 'r'))
	if n_min <= len(data) <= n_max:
		send_data('disk1 EXECUTE Sensors.Disk Snapshot', read=True)
	else:
		globals()['seq_save_i'] = globals()['seq_save_i'] - 1
		os.remove('{}{}_{}.json'.format(local_path, 'bbox', globals()['seq_save_i']))

def take_snapshot( lst, auto_segment=False ):
	if skip_disk and auto_segment == False:
		do_render(lst)
		return
	
	if auto_segment:
		do_render(lst)
		r = send_data('{} GET Segmentation.Segmentation boundingBoxes'.format(lst[1]), read=True)
		
		if (len(r) > 1):
			send_data('disk1 EXECUTE Sensors.Disk Snapshot', read=True)
			r = send_data('{} GET Segmentation.Segmentation boundingBoxes'.format(lst[1]), read=True)
			seq_save('bbox', ''.join(r[1:]))
			print 'data:', ''.join(r[1:])
			#scene_filter('bbox', 3, 100)
 	else:
		send_data('disk1 EXECUTE Sensors.Disk Snapshot')
	time.sleep(cooldown)

def take_seg_snapshot( lst ):
	for l in lst:
		r = send_data('{} GET Segmentation.Segmentation boundingBoxes'.format(l), read=True)
		if (len(r) > 1):
			seq_save('bbox', ''.join(r[1:]))
		
		# r = send_data('{} GET Segmentation.Segmentation boundingBoxesFiltered'.format(l))
		# if (len(r) > 1):
		#	seq_save('bbox_filtered', ''.join(r[1:]))

def seq_save(pref, data):
	f = open('{}{}_{}.json'.format(local_path, pref, globals()['seq_save_i']), 'w')
	f.write(data)
	f.close()
	output('Wrote: {}{}_{}.json'.format(local_path, pref, globals()['seq_save_i']))
	globals()['seq_save_i'] = globals()['seq_save_i'] + 1

def add_disk_output( lst ):
	if skip_disk:
		return
	send_data('disk1 SET active false')
	
	for l in lst:
		send_data([
			'CREATE disk1/{}'.format(l.capitalize()),
			'disk1/{} ADD Sensors.RenderCameraLink'.format(l.capitalize()),
			'disk1/{} SET Sensors.RenderCameraLink target {}'.format(l.capitalize(),l)
		], read=False)
	
	send_data('disk1 SET active true')

def spawn_radius_generic(types=[], scale=[1,1,1], innerradius=0, radius=500, position=[0,0,0], rotation=[0,0,0], limit=50, segmentation_class="None", orbit=False, stick_to_ground=False, collision_check=True, suffix="", flush=False):
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
	for t in types:
		n = t.replace(' ', '_') + suffix
		
		send_data([
			'CREATE spawner/{}'.format(n),
			'spawner/{} SET active false'.format(n),
			
			'spawner/{} ADD RandomProps.Torus'.format(n),
			'spawner/{} ADD RandomProps.PropArea'.format(n),
			
			'spawner/{} SET RandomProps.PropArea async false'.format(n),
			'spawner/{} SET RandomProps.PropArea folder "{}"'.format(n, t),
			'spawner/{} SET RandomProps.PropArea numberOfProps {}'.format(n, limit),
			
			'spawner/{} SET RandomProps.PropArea collisioncheck {}'.format(n, collision_check),
			'spawner/{} SET RandomProps.PropArea stickToGround {}'.format(n, stick_to_ground),
			
			'spawner/{} SET RandomProps.Torus radius {}'.format(n, radius),
			'spawner/{} SET RandomProps.Torus innerRadius {}'.format(n, innerradius),
			
			'spawner/{} SET Transform position ({} {} {})'.format(n, position[0], position[1], position[2]),
			'spawner/{} SET Transform eulerAngles ({} {} {})'.format(n, rotation[0], rotation[1], rotation[2]),
			
			'spawner/{} SET active true'.format(n),
			'spawner/{} SET Transform localScale ({} {} {})'.format(n, scale[0], scale[1], scale[2])
		], read=False)
		
		if segmentation_class != "None":
			send_data([
				'spawner/{} ADD Segmentation.ClassGroup'.format(n),
				'spawner/{} SET Segmentation.ClassGroup itemsClasses {}'.format(n, segmentation_class)
			], read=False)
		
		if orbit == True:
			send_data('cameras SET Orbit target spawner/{}'.format(n), read=False)
		
		obj.append('spawner/{}'.format(t))
	
	if flush:
		flush_buffer()

def spawn_flat_grid(types=[], size=[1000,1000], position=[0,0,0], scale=[1,1,1]):
	for t in types:
		n = t.replace(' ', '_')
		
		send_data([
			'CREATE spawner/{}'.format(n),
			'spawner/{} SET active false'.format(n),
			'spawner/{} ADD RandomProps.FillGrid'.format(n),
			'spawner/{} SET Transform position ({} {} {})'.format(n, position[0], position[1], position[2]),
			'spawner/{} SET RandomProps.FillGrid folder {}'.format(n, n),
			'spawner/{} SET RandomProps.FillGrid size ({} {})'.format(n, size[0], size[1]),
			'spawner/{} SET active true'.format(n),
			'spawner/{} SET Transform localScale ({} {} {})'.format(n, scale[0], scale[1], scale[2])
		], read=False)
		
		obj.append('spawner/{}'.format(t))
	
	flush_buffer()

def spawn_parking_lot( limit, fixed=False, dist_h=8, dist_v=3, dist_lim=30, p_x=-15, p_z=-30, p_y=-5 ):
	k = 0
	idx = 0
	j = len(cars_lst)
	
	# cars common parent
	# send_data('CREATE cars')
	# obj.append('cars')
	
	while k < limit:
		if fixed:
			if idx >= j:
				idx = 0
			
			carID = '{}/{}'.format(cars_lst[idx],cars_lst[idx])
			idx = idx + 1
		else:
			carID = '?'
		
		send_data([
			'CREATE cars/car_{} Cars/{}'.format(k, carID),
			'cars/car_{} ADD Segmentation.ClassGroup'.format(k),
			'cars/car_{} SET Segmentation.ClassGroup itemsClasses Car'.format(k),
			'cars/car_{} SET Transform position ({} {} {})'.format(k, p_x + X_COMP, p_y, p_z + Z_COMP)
		], read=False)
		obj.append('cars/mycar_{}'.format(k))
		k += 1
		p_z += dist_h
		
		if p_z > dist_lim:
			p_z = -dist_lim
			p_x += dist_v
	
	flush_buffer()

def gracefull_shutdown():
	output('Shutdown sequence...')
	
	if keep == False:
		time.sleep(1)
		for o in obj:
			send_data('DELETE {}'.format(o), read=False)
		
		flush_buffer()
		time.sleep(5)
	
	tn.close()
	
	output('Completed, wasted {}s ... BYE'.format(time.time() - _start))
	# sys.exit(0)

def send_data(v, read=True):
	if force_sync:
		read = True
	if type(v) != list:
		v = [ v ]
	
	r = []
	
	for s in v:
		if verbose:
			output('>> {}'.format(s))
		
		s = s.encode('ascii') + b"\n"
		
		if record:
			fh.write(s)
		
		tn.write(s)
		
		if read:
			l = tn.read_until(b"\r\n", 600)
			l = shape_data(l)
			r.append(l)
			
			# multi return hack, ideally first response would have a line count attached to it
			while True:
				l = shape_data(tn.read_eager())
				
				if l == '':
					break
				
				r.append(l)
	
	return r

def shape_data(l):
	try:
		l = str(l).rstrip()
	except TypeError as e:
		output('Error {} decoding: {}'.format(e, l))
	
	if verbose and l != '':
		output('<< {}'.format(l))
	
	return l

def spawn_misc_objs(destroy=False):
	if destroy == True:
		send_data([
			'DELETE spawner/city',
			'DELETE spawner/animals',
			'DELETE spawner/cars'
		], read=False)
		
		flush_buffer()
	
	# spawn_flat_grid(['city/ground'], scale=[3,3,3], position=[0,0,-.5])
	# spawn_radius_generic(['city/decals'], limit=350, radius=50, innerradius=0, collision_check=False, position=[0,10,0])
	# spawn_radius_generic(['city/trafficlight'], limit=100, radius=50, innerradius=30)
	
	spawn_radius_generic(['city/nature/trees'], collision_check=False, limit=random.randint(100, 350), radius=80, innerradius=random.randint(30, 50), position=[0,10,0])
	spawn_radius_generic(['city/signs'], limit=random.randint(80, 250), radius=random.randint(15, 40), innerradius=0, position=[0,10,0])
	spawn_radius_generic(['animals'], limit=random.randint(150, 250), radius=random.randint(40, 80), innerradius=0, position=[0,10,0])
	spawn_radius_generic(['city/buildings'], limit=random.randint(50, 150), radius=335, innerradius=random.randint(80, 100), position=[0,10,0])
	spawn_radius_generic(['cars'], limit=random.randint(50, 150), radius=50, innerradius=0, segmentation_class="Car", orbit=True, position=[0,10,0])

	# for i in range(0,9):
	# 	spawn_radius_generic(['city/ground'], suffix='_{}'.format(i), limit=random.randint(50, 100), radius=75, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False)
	# spawn_radius_generic(['city/ground'], suffix='_0', limit=random.randint(3, 10), radius=75, innerradius=0, scale=[2,2,2], position=[0,0,0], collision_check=False)
	spawn_radius_generic(['city/ground'], suffix='_0', limit=3, radius=75, innerradius=0, scale=[1,1,1], position=[0,0,0], collision_check=False)

def spawn_drone_objs(destroy=False, ground_limit=204, dist_h=120, dist_v=120, dist_lim=1000, p_x=-20, p_z=-1000, p_y=0):
	if destroy == True:
		send_data([
			'DELETE spawner/city/nature/trees',
			'DELETE spawner/city/buildings',
			'DELETE spawner/animals/birds',
			'DELETE spawner/drones',
			'DELETE spawner/cars'
		], read=False)
	else:
		k = 0
		idx = 0
		
		while k < ground_limit:
			send_data([
				'CREATE city/ground_{} city/ground/{}'.format(k, random.choice(ground_lst)),
				'city/ground_{} SET Transform position ({} {} {})'.format(k, p_x + X_COMP, p_y, p_z + Z_COMP),
				'city/ground_{} SET Transform localScale ({} {} {})'.format(k, 12, 12, 12)
			], read=False)
			obj.append('city/ground_{}'.format(k))
			k += 1
			p_z += dist_h
			
			if p_z > dist_lim:
				p_z = -dist_lim
				p_x += dist_v
		
		# for i in range(0,2):
		# 	spawn_radius_generic(['city/ground'], suffix='_{}'.format(i), limit=5, radius=100, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False)
	
	spawn_radius_generic(['city/nature/trees'], collision_check=False, limit=random.randint(100,200), radius=80, innerradius=40, position=[0,0,0])
	spawn_radius_generic(['city/buildings'], limit=random.randint(50,150), radius=335, innerradius=100, position=[0,0,0])
	spawn_radius_generic(['animals/birds'], limit=random.randint(25,100), radius=random.randint(80,110), innerradius=0, position=[0,random.randint(15,95),0])
	spawn_radius_generic(['cars'], limit=random.randint(5, 25), radius=50, innerradius=5, position=[0,0,0])
	spawn_radius_generic(['drones/white'], limit=random.randint(1000,2000), radius=random.randint(30,70), innerradius=0, position=[0,0,0], segmentation_class="Drone")
	# spawn_radius_generic(['drones/white'], limit=random.randint(10,50), radius=random.randint(30,50), innerradius=0, position=[0,0,0], segmentation_class="Car")
	
	flush_buffer()

def spawn_drone_objs_alt(destroy=False, ground_limit=204, dist_h=120, dist_v=120, dist_lim=1000, p_x=-20, p_z=-1000, p_y=0):
	if destroy == True:
		send_data([
			'DELETE spawner/city/nature/trees',
			'DELETE spawner/city/buildings',
			'DELETE spawner/animals/birds',
			'DELETE spawner/drones',
			'DELETE spawner/cars'
		], read=False)
	else:
		k = 0
		idx = 0
		
		while k < ground_limit:
			send_data([
				'CREATE city/ground_{} city/ground/{}'.format(k, random.choice(ground_lst)),
				'city/ground_{} SET Transform position ({} {} {})'.format(k, p_x + X_COMP, p_y, p_z + Z_COMP),
				'city/ground_{} SET Transform localScale ({} {} {})'.format(k, 12, 12, 12)
			], read=False)
			obj.append('city/ground_{}'.format(k))
			k += 1
			p_z += dist_h
			
			if p_z > dist_lim:
				p_z = -dist_lim
				p_x += dist_v
		
		# for i in range(0,2):
		# 	spawn_radius_generic(['city/ground'], suffix='_{}'.format(i), limit=5, radius=100, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False)
	
	spawn_radius_generic(['city/nature/trees'], limit=random.randint(600,600), radius=80, innerradius=30, position=[0,0,0], collision_check=False)
	spawn_radius_generic(['city/buildings'], limit=random.randint(10,10), radius=335, innerradius=100, position=[0,0,0], collision_check=False)
	spawn_radius_generic(['animals/birds'], limit=random.randint(10,10), radius=random.randint(80,110), innerradius=0, position=[0,random.randint(15,95),0])
	spawn_radius_generic(['cars'], limit=random.randint(5, 10), radius=50, innerradius=5, position=[0,0,0])
	spawn_radius_generic(['drones/white'], limit=random.randint(80,80), radius=random.randint(80,110), innerradius=0, position=[0,random.randint(15,65),0], segmentation_class="Car")
	
	flush_buffer()

def spawn_animals_objs(destroy=False):
	if destroy == True:
		send_data([
			'DELETE spawner/city',
			'DELETE spawner/animals',
		], read=False)
	
	spawn_radius_generic(['city/nature/trees'], collision_check=False, stick_to_ground=False, limit=random.randint(150, 400), radius=80, innerradius=random.randint(30, 50), position=[0,5,0])
	spawn_radius_generic(['animals'], stick_to_ground=False, limit=random.randint(200, 350), radius=random.randint(40, 80), innerradius=0, position=[0,5,0], orbit=True)
	
	flush_buffer()

# MAIN #########################################################################

_start = time.time()

# hardcoded values
tonemappings = [ 'Filmic', 'Reinhard', 'LumaReinhard', 'Photographic' ]
ground_lst = [ 'Intersection', 'Grass', 'Asphalt', 'RoadSection2', 'DirtBrown', 'ForestFloor', 'Concrete', 'RoadSection3', 'RoadSection' ]
cars_lst = [ 'auditts','audi_a2','audi_q7','audi_s3','bentley_arnage','bmw','bmw6_series_650i','bmw_760li','bmw_m3','bmw_m5','bmw_m_limousine','cadillac_escalade_ext','caterpillar_bulldozer_d9','chevrolet_cruze_2011','chevrolet_s10','chevrolet_tornado','fiat500_new','fiat_131','fiat_500','ford_crown_victoria_taxi','ford_fiesta','ford_fire_department','ford_focus','ford_mustang_gt_eleanor','ford_shelby_cobra','ford_transit_jumbo','freightliner_aerodyne','honda_civic_sedan','hummer_h2','international_ambulance_fdny','international_school_bus','kenworth_t600','lamborghini_gallardo','lancia_delta','mack_dumper','mercedes_class_g_500','mercedes_slk','mercedes_vario_brinks','mini_coopers','nissan_elgrand','nissan_murano','peugeot_406','rangerover','renault_420','renault_g210','renault_megane','renault_trm_2000','scania_400_concretemixer','scania_450_dumpster_hauler','truck_v010_008','volvo_th5','vw_caravelle','vw_golf_v','vw_touareg','vw_touran_2007','vw_transporter' ]
weather_lst = [ 'Clear Sky', 'Cloudy 1', 'Cloudy 2', 'Cloudy 3', 'Foggy', 'Heavy Rain', 'Light Rain', 'Storm' ]
clouds_lst = [ 'None', 'Both', 'Volume', 'Flat' ]

print ('Syncity Telnet Tester / Demo tool - v2.1.7\nCopyright (c) 2017 CVEDIA B.V.\n')

parser = argparse.ArgumentParser(
	formatter_class=argparse.RawDescriptionHelpFormatter,
	description=textwrap.dedent('''\
This script allows experimentation, recording and playback of scripted events
using syncity simulator telnet api. We also added some demos that show case
different specific features of the api.
'''),
	epilog=textwrap.dedent('''\

Demos descriptions by number:

0: Simple random experimentation with segmentation and fixed assets
	- Creates random named cars in random positions
	- Creates a RGB camera
	- Creates a segmentation map camera
	- Rotates cars and cameras at random
	- Changes camera parameters at random
	- Exports segmentation map bounding boxes
	- Exports RGB images

1: Parking lot orbiting
	- Creates random cars simulating a parking lot pattern
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Orbits around the car on the center
	- Exports RGB images
	- Exports Segmented images

6: Fly by test
	- Spawns a complex scenario
	- Flys over with camera pointing down
	- Exports RGB images
	- Exports Segmented images

7: Forest scene
	- Loads a full scene
	- Perform same actions as POC scene but with a lower angle

71: Savannah scene
	- Loads a full scene
	- Perform same actions as POC scene but with a lower angle and only animals

711: Savannah scene with camera effects
	- Loads a full scene
	- Perform same actions as POC scene but with a lower angle and only animals
	- Changes camera postprocessing effects on every screenshot

8: POC scene
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Custom RGB postprocessing effects
	- Creates a random flat tile ground
	- Spawns signs, buildings and cars using torus system
	- Orbits around
	- Exports segmentation map bounding boxes
	- Exports RGB images
	- Exits leaving all objects exposed

81: POC scene lite
	- Same as 8 but with only city / cars assets and less ammounts of them

811: POC scene lite 2
	- Time of day / weather condition test

82: POC Drones
	- Spawns a city background with drones and birds
	- Randomize object positions, weather conditions, time of the day as camera rotates
	- Exports RGB images
	- Exports segmentation maps and bounding boxes for drones

9: Basic scene
	- Creates random cars simulating a parking lot pattern
	- Creates a RGB camera
	- Creates a Segmentation camera
	- Spawns various objects
	- Exits leaving all objects exposed

Notes:

If you enable --record all demo outputs will be saved, allowing reproduction using --run, the recording file will be placed on the machine running this script, the path can be defined by --local_path

This script can run anywhere, as long it can reach the IP:PORT of the machine running the simulator.

Multiple scripts can interact with the same simulation at the same time

By default the simulator runs on port 10200 listening on all ips, if you can't connect, check your firewall access.

'''))
parser.add_argument('-p', '--port', type=int, default=10200, help='Port to connect, defaults to 10200')
parser.add_argument('-i', '--ip', required=True, help='IP of syncity simulator')
parser.add_argument('--demo', type=int, help='When a --run is not set, defines a demo loop to play, defaults to 0')
parser.add_argument('--cooldown', type=int, default=0, help='Cooldown after snapshot')
parser.add_argument('-r', '--run', type=argparse.FileType('r'), help='Run script')

if platform.system() == 'Windows':
	parser.add_argument('-o', '--output', default='C:\\tmp\\', help='Defines output path for snapshots, note that this path is relative to the machine running the simulator, defaults to E:\\tmp\\', dest='output_path')
	parser.add_argument('-l', '--local_output', default='C:\\tmp\\', action=readable_dir, help='Defines local output path for recordings, json exports, etc; This path is relative to the machine running this script, defaults to E:\\tmp\\', dest='local_path')
else:
	parser.add_argument('-o', '--output', default='/tmp/', help='Defines output path for snapshots, note that this path is relative to the machine running the simulator, defaults to /tmp/', dest='output_path')
	parser.add_argument('-l', '--local_path', default='/tmp/', action=readable_dir, help='Defines local output path for recordings, json exports, etc; This path is relative to the machine running this script, defaults to /tmp/', dest='local_path')

parser.add_argument('-v', '--verbose', action='store_true', help='Verbose mode')
parser.add_argument('--keep', action='store_true', help='Keep created assets on scene')
# parser.add_argument('-t', '--term', action='store_true', help='Execute demos, if any, then drops to telnet terminal')
parser.add_argument('--record', action='store_true', help='Record commands sent to API')
parser.add_argument('--force_sync', action='store_true', help='Forces read on every command sent')
parser.add_argument('--skip_disk', action='store_true', help='Disables disk export completly')
parser.add_argument('--skip_setup', action='store_true', help='Skip demo setup and go straight to data extraction')
parser.add_argument('--envirosky', action='store_true', help='Enables Envirosky')
parser.add_argument('--flycam', action='store_true', help='Spawns fly cam, controllable via simulator')
parser.add_argument('--cars_limit', type=int, default=50, help='Spawn cars into scene, defaults to 100')
parser.add_argument('--props_limit', type=int, default=250, help='Spawn props into scene, defaults to 250')
parser.add_argument('--signs_limit', type=int, default=250, help='Spawn signs into scene, defaults to 250')
parser.add_argument('--trees_limit', type=int, default=250, help='Spawn trees into scene, defaults to 250')
parser.add_argument('--backdrops_limit', type=int, default=50, help='Spawn backdrops into scene, defaults to 50')
parser.add_argument('--X_COMP', type=float, default=0, help='Spawner X Compensation, defaults to 0')
parser.add_argument('--Y_COMP', type=float, default=1, help='Spawner Y Compensation, defaults to 1')
parser.add_argument('--Z_COMP', type=float, default=0, help='Spawner Z Compensation, defaults to 0')

args = parser.parse_args()

for k in args.__dict__:
	globals()[k] = args.__dict__[k]

if platform.system() == 'Windows':
	if output_path[-1:] != '\\':
		output_path = output_path + '\\'
	if local_path[-1:] != '\\':
		local_path = local_path + '\\'
else:
	if output_path[-1:] != '/':
		output_path = output_path + '/'
	if local_path[-1:] != '/':
		local_path = local_path + '/'

output('Connecting to {}:{}...'.format(ip, port))

try:
	tn = telnetlib.Telnet(ip, port)
except Exception as e:
	output('Error connecting: {}'.format(e))
	sys.exit(1)

output('Connected')

if record == True:
	fh = open('{}record_{}.txt'.format(local_path, time.time()), 'w+')

flush_buffer()

if run:
	output('Running script {} ...'.format(run))
	with open(run) as fp:
		for line in fp:
			send_data(line)
else:
	output('Using demo #{}'.format(demo))
	output('Press CTRL+C to abort')
	
	# track objects created by script to remove them from scene later on
	obj = []
	signal.signal(signal.SIGINT, gracefull_shutdown)
	atexit.register(gracefull_shutdown)
	globals()['seq_save_i'] = 0
	
	# random cars in random positions with camera sweep and segmentation output
	if demo == 0:
		
		mycams = ['cameras/cameraRGB', 'cameras/segmentation']
		
		if skip_setup == False:
			global_camera_setup()
			add_camera_rgb(envirosky=envirosky, flycam=flycam)
			add_camera_seg()
			if envirosky == False:
				add_light()
			global_disk_setup()
			
			add_disk_output(mycams)
			
			# list all childs
			send_data('cameras get children')
			# list all properties
			send_data('cameras get properties')
			# list all properties from transform
			send_data('cameras get properties transform')
		
		# load all cars cars_limit times on scene
		k = 0
		
		p_x = -15
		p_z = -30
		dist_h = 7 # car front
		dist_v = 4 # car side
		dist_lim = 30 # z distance limit
		
		while k < cars_limit:
			send_data([
				'CREATE mycar_{} Cars/?'.format(k),
				'mycar_{} ADD Segmentation.ClassGroup'.format(k),
				'mycar_{} SET Segmentation.ClassGroup itemsClasses Car'.format(k),
				'mycar_{} SET Transform position ({} {} {})'.format(k, p_x + X_COMP, 5 + Y_COMP, p_z + Z_COMP)
			])
			
			obj.append('mycar_{}'.format(k))
			p_z += dist_h
			k += 1
			
			if p_z > dist_lim:
				p_z = -dist_lim
				p_x += dist_v
		
		a = 0
		while a < 360:
			# one dimension camera sweep in 10 degrees steps
			send_data('camera SET Transform eulerAngles (0 {} 0)'.format(a))
			k = 0
			
			while k < cars_limit:
				# make sure car is on camera's fov
				# send_data('mycar_{} FRUSTUM mycamera RIGHT {} DOWN {} DEPTH {}'.format(k, random.uniform(0, 1), random.uniform(0, 1), random.randint(5, 120)))
				# rotate car at random
				send_data('mycar_{} SET Transform eulerAngles ({} {} {})'.format(k, random.randint(0, 359), random.randint(0, 359), random.randint(0, 359)))
				k += 1
			
			# all possible properties - https://docs.unity3d.com/ScriptReference/Camera.html
			# send_data('camera/cameraRGB SET fieldOfView {}'.format(random.randint(60, 90)))
			# send_data('camera/cameraRGB SET aspect {}'.format(random.uniform(0, 1)))
			
			take_snapshot(mycams)
			take_seg_snapshot([ 'cameras/segmentation' ])
			
			a += 10
	
	# parking lot orbiting
	elif demo == 1:
		
		mycams = ['cameras/cameraRGB', 'cameras/segmentation']
		
		if skip_setup == False:
			global_camera_setup()
			add_camera_rgb(envirosky=envirosky, flycam=flycam)
			add_camera_seg()
			if envirosky == False:
				add_light()
			global_disk_setup()
			add_disk_output(mycams)
		
			spawn_parking_lot(cars_limit)
		
		# force a render to visualize on the ui
		do_render(mycams)
		
		dist = -50
		dist_e = 5 # elevation increment
		dist_a = 10 # azimuth increment
		elevation = 15
		send_data('cameras SET Orbit target cars/car_{}'.format(int(cars_limit / 2))) # get a car roughtly on the center
		
		# orbit car in the center
		while elevation < 90:
			azimuth = 0
			
			while azimuth < 360:
				send_data([
					'cameras SET Orbit distance {}'.format(dist),
					'cameras SET Orbit elevation {}'.format(elevation),
					'cameras SET Orbit azimuth {}'.format(azimuth)
				])
				
				take_snapshot(mycams)
				take_seg_snapshot([ 'cameras/segmentation' ])
				
				azimuth += dist_a
			
			elevation += dist_e
	
	# create a parking lot with all props and take images on helicopter perspective
	elif demo == 6:
		keep = True
		mycams = ['cameras/cameraRGB', 'cameras/segmentation']
		
		if skip_setup == False:
			global_camera_setup()
			add_camera_rgb(width=4096, height=3072, envirosky=envirosky, flycam=flycam)
			add_camera_rgb_pp()
			add_camera_seg()
			if envirosky == False:
				add_light()
			global_disk_setup()
			add_disk_output(mycams)
			
			spawn_parking_lot(limit=200, fixed=True, p_y=5, dist_h=20, dist_v=20, p_x=-60, p_z=-90)
			
			spawn_radius_generic(['city/nature/trees'], collision_check=False, limit=250, radius=80, innerradius=30, position=[0,10,0])
			spawn_radius_generic(['city/signs'], limit=100, radius=35, innerradius=0, position=[0,10,0])
			spawn_radius_generic(['animals'], limit=300, radius=50, innerradius=0, position=[0,10,0])
			spawn_radius_generic(['city/buildings'], limit=100, radius=335, innerradius=80, position=[0,10,0])
			
			for i in range(0,9):
				spawn_radius_generic(['city/ground'], suffix='_{}'.format(i), limit=50, radius=50, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False)
		
		# force a render to visualize on the ui
		do_render(mycams)
		
		send_data(['cameras/cameraRGB SET Transform eulerAngles (90 0 0)'])
		send_data(['cameras/segmentation SET Transform eulerAngles (90 0 0)'])
		
		for x in range(-40, 40):
			for z in range(-40, 40):
				send_data([
					'cameras/cameraRGB SET Transform position ({} 50 {})'.format(x, z),
					'cameras/segmentation SET Transform position ({} 50 {})'.format(x, z)
				])
				
				# for i in range(0,200):
				#	send_data('cars/car_{} SET Transform eulerAngles ({} {} {})'.format(i, random.randint(0, 359), random.randint(0, 359), random.randint(0, 359)))
				
				take_snapshot(mycams)
				take_seg_snapshot([ 'cameras/segmentation' ])
	
	# forest scene test
	elif demo == 7:
		keep = True
		mycams = ['cameras/cameraRGB']
		
		if skip_setup == False:
			global_camera_setup()
			add_camera_rgb(envirosky=True, flycam=flycam)
			add_camera_rgb_pp()
			# add_light(position=[-684.8,532.5,262.466])
			global_disk_setup()
			
			add_disk_output(mycams)
			send_data([
				'CREATE test Terrains/Forest/Forest',
				'test SET Transform position ({} {} {})'.format(-5000,-180,-5000),
				'test SET Terrain basemapDistance 2000',
				'test SET TerrainCollider enabled true',
				'test SET active true',
				# 'cameras SET Orbit target test'
			])
			
			# spawn_radius_generic(['cars'], limit=10, radius=50, innerradius=0, segmentation_class="Car", orbit=True, position=[0,10,0])
			# spawn_radius_generic(['prefabs/terrains/desert'], orbit=True, limit=1, radius=65, innerradius=0, position=[0,0,0], collision_check=False)
			
			spawn_misc_objs()
		
		dist = -60
		dist_e = 5 # elevation increment
		dist_a = 10 # azimuth increment
		elevation = 15
		loops = 0
		reroll = 50
		
		while elevation < 60:
			azimuth = 0
			
			while azimuth < 360:
				send_data([
					'cameras SET Orbit distance {}'.format(dist),
					'cameras SET Orbit elevation {}'.format(elevation),
					'cameras SET Orbit azimuth {}'.format(azimuth),
					'EnviroSky SET EnviroSky GameTime.Hours {}'.format(random.randint(6, 18))
				])
				
				take_snapshot(mycams)
				loops += 1
				
				if loops == reroll:
					loops = 0
					spawn_misc_objs(True)
				
				azimuth += dist_a
			
			elevation += dist_e
	
	elif demo == 71:
		keep = True
		mycams = ['cameras/cameraRGB']
		
		if skip_setup == False:
			global_camera_setup()
			add_camera_rgb(envirosky=True, flycam=flycam)
			add_camera_rgb_pp()
			# add_light(position=[-684.8,532.5,262.466])
			global_disk_setup()
			
			add_disk_output(mycams)
			send_data([
				'cameras/cameraRGB SET Transform position ({} {} {})'.format(0, -10, 0),
				'CREATE test Terrains/Savannah/Savannah',
				'test SET Transform position ({} {} {})'.format(-5000,-180,-5000),
				'test SET Terrain basemapDistance 2000',
				'test SET TerrainCollider enabled true',
				'test SET active true',
				# 'cameras SET Orbit target test'
			])
			
			# spawn_radius_generic(['cars'], limit=10, radius=50, innerradius=0, segmentation_class="Car", orbit=True, position=[0,10,0])
			# spawn_radius_generic(['prefabs/terrains/desert'], orbit=True, limit=1, radius=65, innerradius=0, position=[0,0,0], collision_check=False)
			
			spawn_animals_objs()
		
		dist = 100
		dist_e = 5 # elevation increment
		dist_a = 10 # azimuth increment
		elevation = 35
		loops = 0
		reroll = 50
		
		while elevation < 60:
			azimuth = 0
			
			while azimuth < 360:
				send_data([
					'cameras SET Orbit distance {}'.format(dist),
					'cameras SET Orbit elevation {}'.format(elevation),
					'cameras SET Orbit azimuth {}'.format(azimuth),
					'spawner/animals SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
					'cameras/cameraRGB SET Camera fieldOfView {}'.format(random.randint(50, 120)),
					'EnviroSky SET EnviroSky GameTime.Hours {}'.format(random.randint(6, 18))
				])
				
				take_snapshot(mycams)
				loops += 1
				
				if loops == reroll:
					loops = 0
					spawn_animals_objs(True)
				
				azimuth += dist_a
			
			elevation += dist_e
	
	elif demo == 711:
		keep = True
		mycams = ['cameras/cameraRGB']
		
		if skip_setup == False:
			global_camera_setup()
			add_camera_rgb(envirosky=True, flycam=flycam)
			add_camera_rgb_pp()
			# add_light(position=[-684.8,532.5,262.466])
			global_disk_setup()
			
			add_disk_output(mycams)
			send_data([
				'cameras/cameraRGB SET Transform position ({} {} {})'.format(0, -10, 0),
				'CREATE test Terrains/Savannah/Savannah',
				'test SET Transform position ({} {} {})'.format(-5000,-180,-5000),
				'test SET Terrain basemapDistance 2000',
				'test SET TerrainCollider enabled true',
				'test SET active true',
				# 'cameras SET Orbit target test'
			])
			
			# spawn_radius_generic(['cars'], limit=10, radius=50, innerradius=0, segmentation_class="Car", orbit=True, position=[0,10,0])
			# spawn_radius_generic(['prefabs/terrains/desert'], orbit=True, limit=1, radius=65, innerradius=0, position=[0,0,0], collision_check=False)
			
			spawn_animals_objs()
		
		dist = 100
		dist_e = 5 # elevation increment
		dist_a = 10 # azimuth increment
		elevation = 35
		loops = 0
		reroll = 50
		
		while elevation < 60:
			azimuth = 0
			
			while azimuth < 360:
				send_data([
					'cameras SET Orbit distance {}'.format(dist),
					'cameras SET Orbit elevation {}'.format(elevation),
					'cameras SET Orbit azimuth {}'.format(azimuth),
					'spawner/animals SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
					'cameras/cameraRGB SET Camera fieldOfView {}'.format(random.randint(50, 120)),
					'EnviroSky SET EnviroSky GameTime.Hours {}'.format(random.randint(6, 18))
				])
				
				camera_rgb_pp_random()
				take_snapshot(mycams)
				loops += 1
				
				if loops == reroll:
					loops = 0
					spawn_animals_objs(True)
				
				azimuth += dist_a
			
			elevation += dist_e
	
	# POC scene
	elif demo == 8:
		keep = True
		mycams = ['cameras/cameraRGB', 'cameras/segmentation']
		
		if skip_setup == False:
			global_camera_setup()
			add_camera_rgb(width=4096, height=3072, envirosky=envirosky, flycam=flycam)
			add_camera_rgb_pp()
			add_camera_seg()
			if envirosky == False:
				add_light()
			global_disk_setup()
			
			add_disk_output(mycams)
			
			spawn_misc_objs()
		
		dist = -60
		dist_e = 5 # elevation increment
		dist_a = 10 # azimuth increment
		elevation = 60
		loops = 0
		reroll = 10
		
		while elevation < 120:
			azimuth = 0
			
			while azimuth < 360:
				send_data([
					'cameras SET Orbit distance {}'.format(dist),
					'cameras SET Orbit elevation {}'.format(elevation),
					'cameras SET Orbit azimuth {}'.format(azimuth)
				])
				
				if envirosky:
					send_data(['EnviroSky SET EnviroSky GameTime.Hours {}'.format(random.randint(6, 18))])
				
				take_snapshot(mycams)
				take_seg_snapshot([ 'cameras/segmentation' ])
				loops += 1
				
				if loops == reroll:
					loops = 0
					spawn_misc_objs(True)
				
				azimuth += dist_a
			
			elevation += dist_e
		
	
	# POC alternate scene - without segmentation and animals
	elif demo == 81:
		keep = True
		mycams = ['cameras/cameraRGB']
		
		if skip_setup == False:
			global_camera_setup()
			add_camera_rgb(width=4096, height=3072, envirosky=envirosky, flycam=flycam)
			# add_camera_rgb_pp()
			# add_camera_seg()
			if envirosky == False:
				add_light()
			global_disk_setup()
			
			add_disk_output(mycams)
			
			# spawn_flat_grid(['city/ground'], scale=[3,3,3], position=[0,0,-.5])
			
			# spawn_radius_generic(['city/decals'], limit=350, radius=50, innerradius=0, collision_check=False, position=[0,10,0])
			# spawn_radius_generic(['city/trafficlight'], limit=100, radius=50, innerradius=30)
			
			spawn_radius_generic(['city/nature/trees'], collision_check=False, limit=50, radius=80, innerradius=30, position=[0,10,0])
			spawn_radius_generic(['city/signs'], limit=10, radius=35, innerradius=0, position=[0,10,0])
			# spawn_radius_generic(['animals'], limit=300, radius=50, innerradius=0, position=[0,10,0])
			spawn_radius_generic(['city/buildings'], limit=10, radius=335, innerradius=80, position=[0,10,0])
			spawn_radius_generic(['cars'], limit=10, radius=50, innerradius=0, segmentation_class="Car", orbit=True, position=[0,10,0])
			
			for i in range(0,9):
				spawn_radius_generic(['city/ground'], suffix='_{}'.format(i), limit=3, radius=50, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False)
			# spawn_radius_generic(['city/ground'], suffix='_{}'.format(i), limit=1, radius=50, innerradius=0, scale=[2,2,2], position=[0,0,0], collision_check=False)
		
		dist = -60
		dist_e = 5 # elevation increment
		dist_a = 10 # azimuth increment
		elevation = 60
		
		while elevation < 120:
			azimuth = 0
			
			while azimuth < 360:
				send_data([
					'cameras SET Orbit distance {}'.format(dist),
					'cameras SET Orbit elevation {}'.format(elevation),
					'cameras SET Orbit azimuth {}'.format(azimuth)
				])
				
				take_snapshot(mycams)
				
				azimuth += dist_a
			
			elevation += dist_e
	
	elif demo == 82:
		keep = True
		mycams = ['cameras/cameraRGB', 'cameras/segmentation']
		
		if skip_setup == False:
			global_camera_setup()
			add_camera_rgb(width=4096, height=3072, audio=True, envirosky=True)
			add_camera_rgb_pp('EnviroFX', scion=False)
			add_camera_seg(segment='Car')
			# add_light()
			global_disk_setup()
			
			add_disk_output(mycams)
			spawn_drone_objs()
		
		# reset camera
		send_data([
			'cameras/cameraRGB SET Camera enabled true',
			'cameras SET Transform position ({} {} {})'.format(0, 1, 0),
			'cameras SET Transform eulerAngles ({} {} {})'.format(-20, -45, 0),
			'cameras/cameraRGB ADD EnviroCamera',
			'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(random.choice(weather_lst)),
			'EnviroSky SET EnviroSky cloudsMode {}'.format(random.choice(clouds_lst))
		])
		
		y = 24
		loop = 0
		reroll = 100
		
		while y < 160:
			if random.uniform(0,1) > .8:
				motionblur = 'true'
			else:
				motionblur = 'false'
			
			send_data([
				'spawner/drones SET Transform position ({} {} {})'.format(0, random.randint(2, 25), 0),
				'spawner/drones SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, 15), random.randint(0, 359), random.randint(-2, 2)),
				# 'spawner/drones/white SET Transform position ({} {} {})'.format(0, random.randint(2, 25), 0),
				# 'spawner/drones/white SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, 15), random.randint(0, 359), random.randint(-2, 2)),
				'spawner/animals/birds SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
				'spawner/animals/birds SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
				'spawner/cars SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
				'spawner/city/nature SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
				'spawner/city/buildings SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
				'cameras SET Transform eulerAngles ({} {} {})'.format(-20, y, 0),
				'city SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
				'EnviroSky SET EnviroSky GameTime.Hours {}'.format(random.randint(8, 18)),
				'cameras/cameraRGB SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur)
			])
			
			take_snapshot(mycams, True)
			# take_seg_snapshot([ 'cameras/segmentation' ])
			
			y = y + 1
			loop = loop + 1
			
			if loop % 10 == 0:
				send_data([
					'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(random.choice(weather_lst)),
					'EnviroSky SET EnviroSky cloudsMode {}'.format(random.choice(clouds_lst))
				])
			
			if loop == reroll:
				spawn_drone_objs(True)
				loop = 0
	
	elif demo == 83:
		keep = True
		mycams = ['cameras/cameraRGB', 'cameras/segmentation']
		
		if skip_setup == False:
			global_camera_setup()
			# add_camera_rgb(width=4096, height=3072, audio=True, envirosky=True)
			add_camera_rgb(width=1024, height=768, audio=True, envirosky=True)
			add_camera_rgb_pp('EnviroFX', scion=False)
			add_camera_seg(segment='Drone')
			# add_light()
			global_disk_setup()
			
			# add_disk_output(mycams)
			add_disk_output([mycams[0]])
			spawn_drone_objs(p_x=-500, dist_lim=500, p_z=-500)
		
		send_data(['Canvas SET active false'])
		
		for c in range(4):
			for w in range(8):
				
				flush_buffer()
				
				for fov in range(100, 9, -20):
				#fov = 30
					#print('FOV: {}.'.format(fov))
					# reset camera
					send_data([
						'cameras/cameraRGB SET Camera enabled true',
						'cameras/cameraRGB SET Camera fieldOfView ' + str(fov),
						'cameras/segmentation SET Camera fieldOfView ' + str(fov),
						'cameras SET Transform position ({} {} {})'.format(10, random.randint(2, 10), -30),
						'cameras SET Transform eulerAngles ({} {} {})'.format(random.randint(-20, 15), random.randint(-15, 15), 0),
						'cameras/cameraRGB ADD EnviroCamera',
						'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(weather_lst[0]),
						'EnviroSky SET EnviroSky cloudsMode {}'.format('None')
						#'EnviroSky SET EnviroSky cloudsMode {}'.format(random.choice(clouds_lst))
					], read=False)
					
					#for h_dr in range(4, 36, 2):
					y = 15
					loop = 0
					reroll = 100
					
					while y < 160:
						if random.uniform(0,1) > .9:
							motionblur = 'true'
						else:
							motionblur = 'false'
						
						send_data([
							'spawner/drones SET Transform position ({} {} {})'.format(0, random.randint(10, 25), 0),
							#'spawner/drones SET Transform position ({} {} {})'.format(0, h_dr, 0),
							'spawner/drones SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, -15), random.randint(0, 359), random.randint(-10, 10)),
							'spawner/animals/birds SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
							'spawner/animals/birds SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
							'spawner/cars SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
							'spawner/city/nature SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
							'spawner/city/buildings SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
							'cameras SET Transform position ({} {} {})'.format(10, random.randint(2, 10), -30),
							'cameras SET Transform eulerAngles ({} {} {})'.format(random.randint(-20, 15), y, 0),
							'city SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
							'EnviroSky SET EnviroSky GameTime.Hours {}'.format(random.randint(8, 18)),
							'cameras/cameraRGB SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled {}'.format(motionblur)
						], read=False)
						
						# for i in range(3):
						# 	spawn_radius_generic(['drones/white'], limit=random.randint(50,100), radius=random.randint(50,100), innerradius=0, position=[0,0,0], segmentation_class="Car")
						# 	send_data([
						# 		'spawner/drones SET Transform position ({} {} {})'.format(0, random.randint(5, 30), 0)
						# 	])
						
						set_disk_texture([mycams[0]])
						take_snapshot(mycams, True)
						# take_seg_snapshot([ 'cameras/segmentation' ])
						
						y = y + 1
						loop = loop + 1
						
						if loop % 10 == 0:
							send_data([
								'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(weather_lst[w]),
								'EnviroSky SET EnviroSky cloudsMode {}'.format(clouds_lst[c])
								#'EnviroSky SET EnviroSky cloudsMode {}'.format(random.choice(clouds_lst))
							])
						
						if loop == reroll:
							spawn_drone_objs(destroy=True, p_x=-500, dist_lim=500, p_z=-500)
							loop = 0
	
	elif demo == 84:
		keep = True
		mycams = ['cameras/cameraRGB', 'cameras/segmentation']
		
		if skip_setup == False:
			global_camera_setup()
			add_camera_rgb(width=4096, height=3072, audio=True, envirosky=True)
			add_camera_rgb_pp('EnviroFX', scion=False)
			add_camera_seg(segment='Car')
			# add_light()
			global_disk_setup()
			
			add_disk_output(mycams)
			spawn_drone_objs_alt(p_x=-500, dist_lim=500, p_z=-500)
		
		# reset camera
		send_data([
			'cameras/cameraRGB SET Camera enabled true',
			'cameras SET Transform position ({} {} {})'.format(0, 30, -30),
			'cameras SET Transform eulerAngles ({} {} {})'.format(15, 15, 0),
			'cameras/cameraRGB ADD EnviroCamera',
			'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(random.choice(weather_lst)),
			'EnviroSky SET EnviroSky cloudsMode {}'.format(random.choice(clouds_lst))
		])
		
		y = 15
		loop = 0
		reroll = 100
		
		while y < 160:
			send_data([
				'spawner/drones SET Transform position ({} {} {})'.format(0, random.randint(2, 30), 0),
				'spawner/drones SET Transform eulerAngles ({} {} {})'.format(random.randint(-15, 15), random.randint(0, 359), random.randint(-10, 10)),
				'spawner/animals/birds SET Transform position ({} {} {})'.format(0, random.randint(5, 75), 0),
				'spawner/animals/birds SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
				'spawner/cars SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
				'spawner/city/nature SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
				'spawner/city/buildings SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
				'cameras SET Transform eulerAngles ({} {} {})'.format(15, y, 0),
				'city SET Transform eulerAngles ({} {} {})'.format(0, random.randint(0, 359), 0),
				'EnviroSky SET EnviroSky GameTime.Hours {}'.format(random.randint(8, 18))
			])
			
			take_snapshot(mycams)
			take_seg_snapshot([ 'cameras/segmentation' ])
			
			y = y + 1
			loop = loop + 1
			
			if loop % 10 == 0:
				send_data([
					'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(random.choice(weather_lst)),
					'EnviroSky SET EnviroSky cloudsMode {}'.format(random.choice(clouds_lst))
				])
			
			if loop == reroll:
				spawn_drone_objs_alt(destroy=True, p_x=-500, dist_lim=500, p_z=-500)
				loop = 0
	
	elif demo == 811:
		keep = True
		
		if skip_setup == False:
			global_camera_setup()
			add_camera_rgb(width=4096, height=3072, audio=True, envirosky=True)
			add_camera_rgb_pp('EnviroFX', False)
			global_disk_setup()
			
			mycams = ['cameras/cameraRGB']
			
			add_disk_output(mycams)
			
			# spawn_flat_grid(['city/ground'], scale=[3,3,3], position=[0,0,-.5])
			
			# spawn_radius_generic(['city/decals'], limit=350, radius=50, innerradius=0, collision_check=False, position=[0,10,0])
			# spawn_radius_generic(['city/trafficlight'], limit=100, radius=50, innerradius=30)
			
			spawn_radius_generic(['city/nature/trees'], collision_check=False, limit=50, radius=80, innerradius=30, position=[0,10,0])
			spawn_radius_generic(['city/signs'], limit=10, radius=35, innerradius=0, position=[0,10,0])
			# spawn_radius_generic(['animals'], limit=300, radius=50, innerradius=0, position=[0,10,0])
			spawn_radius_generic(['city/buildings'], limit=10, radius=335, innerradius=80, position=[0,10,0])
			spawn_radius_generic(['cars'], limit=10, radius=50, innerradius=0, segmentation_class="Car", orbit=True, position=[0,10,0])
			
			for i in range(0,9):
				spawn_radius_generic(['city/ground'], suffix='_{}'.format(i), limit=5, radius=50, innerradius=0, scale=[2,2,2], position=[0,i,0], collision_check=False)
		
		dist = -55
		azimuth = 30
		elevation = 75
		
		send_data([
			'cameras SET Orbit distance {}'.format(dist),
			'cameras SET Orbit elevation {}'.format(elevation),
			'cameras SET Orbit azimuth {}'.format(azimuth)
		])
			
		for weather in weather_lst:
			send_data('EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(weather))
			for hour in range(0, 23):
				send_data('EnviroSky SET EnviroSky GameTime.Hours {}'.format(hour))
				for minute in range(0, 5):
					send_data('EnviroSky SET EnviroSky GameTime.Minutes {}'.format(minute * 10))
					take_snapshot(mycams)
	
	# scene basic setup
	elif demo == 9:
		keep = True
		mycams = ['cameras/cameraRGB', 'cameras/segmentation']
		
		if skip_setup == False:
			global_camera_setup()
			add_camera_rgb(envirosky=envirosky, flycam=flycam)
			add_camera_seg()
			add_light()
			global_disk_setup()
			
			add_disk_output(mycams)
			
			spawn_parking_lot(cars_limit)
		
		# get position of the car in the center
		x = send_data('cars/car_{} GET Transform position'.format(int(cars_limit / 2)))
		
		# this will return OK and a LIST, which we will parse as JSON to use as center of our spawning point
		pos = json.loads(x[1])
		
		# spawn some random props around cars
		spawn_radius_generic(types=['city/buildings', 'city/props', 'city/signs'], position=pos, limit=100, radius=100, innerradius=50)
		
		# center camera an point down 20 degrees
		send_data([
			'cameras SET Transform position (-10 10 -100)',
			'cameras SET Transform eulerAngles (20 0 0)'
		])
		
		# force a render to visualize on the ui
		do_render(mycams)
		
		print ("Ready!")
	
	elif demo == 10:
		keep = True
		mycams = ['cameras/cameraRGB', 'cameras/segmentation']
		
		if skip_setup == False:
			global_camera_setup()
			# add_camera_rgb(width=4096, height=3072, audio=True, envirosky=True)
			# add_camera_rgb_pp('EnviroFX', scion=False)
			add_camera_rgb(width=4096, height=3072, audio=True, envirosky=False)
			
			send_data([
				'cameras/cameraRGB SET Camera enabled true',
				'cameras SET Transform position ({} {} {})'.format(6, 33, -50),
				'cameras SET Transform eulerAngles ({} {} {})'.format(40, 8, 0)
				# 'cameras/cameraRGB ADD EnviroCamera',
				# 'EnviroSky EXECUTE EnviroSky ChangeWeather "{}"'.format(weather_lst[0]),
				# 'EnviroSky SET EnviroSky cloudsMode {}'.format(random.choice(clouds_lst)),
			], read=False)
		
		x = -50
		z = -7
		a_y = 90
		
		send_data([
			'HENCOCK SET Transform eulerAngles ({} {} {})'.format(0, a_y, 0)
		])
		
		force_sync = True
		loop = 0
		stepping = 16
		
		while loop < 5:
			while x < 10:
				x = x + stepping
				send_data([
					'HENCOCK SET Transform position ({} {} {})'.format(x, 0 , z)
				])
			
			while a_y < 180:
				a_y = a_y + stepping
				send_data([
					'HENCOCK SET Transform eulerAngles ({} {} {})'.format(0, a_y, 0)
				])
			
			i = 0
			while i < 12:
				z = z - stepping
				i = i + stepping
				send_data([
					'HENCOCK SET Transform position ({} {} {})'.format(x, 0 , z)
				])
			
			while a_y < 270:
				a_y = a_y + stepping
				send_data([
					'HENCOCK SET Transform eulerAngles ({} {} {})'.format(0, a_y, 0)
				])
			
			while x > -50:
				x = x - stepping
				send_data([
					'HENCOCK SET Transform position ({} {} {})'.format(x, 0 , z)
				])
			
			while a_y > 180:
				a_y = a_y - stepping
				send_data([
					'HENCOCK SET Transform eulerAngles ({} {} {})'.format(0, a_y, 0)
				])
			
			i = 0
			while i < 12:
				z = z - stepping
				i = i + stepping
				send_data([
					'HENCOCK SET Transform position ({} {} {})'.format(x, 0 , z)
				])
			
			while a_y > 90:
				a_y = a_y - stepping
				send_data([
					'HENCOCK SET Transform eulerAngles ({} {} {})'.format(0, a_y, 0)
				])
			
			loop = loop + 1
			
	else:
		output('Invalid demo option')

output('Done')
