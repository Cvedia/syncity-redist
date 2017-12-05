#!/usr/bin/python

import sys
import telnetlib
import time
import atexit
import argparse
import random
import signal
import textwrap

from datetime import datetime

def output (s):
	print '[{}] {}'.format(datetime.now().strftime("%H:%M:%S.%f"), s)

def gracefull_shutdown():
	output('Shutdown sequence...')
	
	if transverse == True:
		for o in obj:
			output(send_data('OBJECT TRANSVERSE {}'.format(o)))
	
	if keep == False:
		time.sleep(1)
		for o in obj:
			send_data('DELETE {}'.format(o))
		time.sleep(5)
	
	tn.close()
	
	output('Completed ... BYE')
	sys.exit(0)

def send_data(s):
	if verbose:
		output('>> {}'.format(s))
	
	s = s.encode('ascii') + b"\n"
	
	if record:
		fh.write(s)
	
	tn.write(s)
	l = tn.read_until(b"\r\n", 600)
	
	if 'SNAPSHOT' in s:
		output('Cooling down for export')
		time.sleep(cooldown)
	# time.sleep(1)
	
	return l.strip("\r").strip("\n")

def list_all_assets():
	output(send_data('ASSETS all'))

print 'Syncity Telnet Tester / Demo tool - v1.0\nCopyright (c) 2017 CVEDIA B.V.\n'

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

1: Pattern placement with fixed assets
	- Creates random named cars simulating a parking lot pattern
	- Creates a RGB camera
	- Orbits around the car on the center
	- Exports RGB images

2: Pattern placement with fixed assets and rotation
	- Creates random named cars simulating a parking lot pattern
	- Creates a RGB camera
	- Rotates cars and cameras at random
	- Orbits around the car on the center
	- Exports RGB images

3: Postprocessing experimentation and comparison between camera outputs
	- Creates a RGB camera
	- Creates a Postprocessing camera
	- Orbits around a car while changing camera postprocessing parameters
	- Exports RGB images
	- Exports Postprocessed images

4: Simple segmentation map with internal system asset manager
	- Creates random cars using internal system
	- Creates a RGB camera
	- Creates a segmentation map camera
	- Rotates cars at random
	- Exports segmentation map bounding boxes
	- Exports RGB images

5: Massive faceted asset spawning using radius helper with orbiting
	- Creates random cars, trees, props, signs and backdrop using internal
	  system api to handle creation
	- Moves all objects in distinct radius rings one within another with a
	  innerradius exclusion area in the middle, where cars are in the core
	- Orbits around the center changing distance
	- Exports RGB images

Notes:

- If you enable --record all demo outputs will be saved, allowing reproduction
  using --run.
- This script can run anywhere, as long it can reach the IP:PORT of the machine
  running the simulator.
- Multiple scripts can interact with the same simulation at the same time

'''))
parser.add_argument('-p', '--port', type=int, default=10200, help='Port to connect, defaults to 10200')
parser.add_argument('-i', '--ip', required=True, help='IP of syncity simulator')
parser.add_argument('--demo', type=int, default=0, help='When a --run is not set, defines a demo loop to play, defaults to 0')
parser.add_argument('--cooldown', type=int, default=5, help='Cooldown after snapshot')
parser.add_argument('-r', '--run', type=file, help='Run script')
parser.add_argument('-o', '--output', default='E:\\tmp\\', help='Defines output path for snapshots, defaults to E:\\tmp\\', dest='output_path')
parser.add_argument('-v', '--verbose', action='store_true', help='Verbose mode')
parser.add_argument('--keep', action='store_true', help='Keep created assets on scene')
parser.add_argument('--record', action='store_true', help='Record commands sent to API')
parser.add_argument('--transverse', action='store_true', help='Transverse all objects in the end of demo')
parser.add_argument('--cars_limit', type=int, default=100, help='Spawn cars into scene, defaults to 100')
parser.add_argument('--props_limit', type=int, default=250, help='Spawn props into scene, defaults to 250')
parser.add_argument('--signs_limit', type=int, default=250, help='Spawn signs into scene, defaults to 250')
parser.add_argument('--trees_limit', type=int, default=250, help='Spawn trees into scene, defaults to 250')
parser.add_argument('--backdrops_limit', type=int, default=50, help='Spawn backdrops into scene, defaults to 50')
parser.add_argument('--X_COMP', type=float, default=165.5, help='Spawner X Compensation')
parser.add_argument('--Y_COMP', type=float, default=0.86, help='Spawner Y Compensation')
parser.add_argument('--Z_COMP', type=float, default=269.463, help='Spawner Z Compensation')
args = parser.parse_args()

for k in args.__dict__:
	globals()[k] = args.__dict__[k]

output('Connecting to {}:{}...'.format(ip, port))

try:
	tn = telnetlib.Telnet(ip, port)
except Exception, e:
	output('Error connecting: {}'.format(e))
	sys.exit(1)

output('Connected')

if record == True:
	fh = open('record_{}.txt'.format(time.time()), 'w+')

output(send_data('NOOP'))

# asset lists - those are fixed lists, but you could also load random assets by defining ?
# WARNING: This is relative to the Resources folder, if you don't have them, it will fail to load
cars = ['Audi_A2','Audi_Q7','Audi_S3','BMW_760Li','BMW_M5','BMW_M_Limousine','Cadillac_Escalade_EXT','Caterpillar_Bulldozer_D9','Chevrolet_Cruze_2011','Chevrolet_S10','Chevrolet_Tornado','Fiat_131','Ford_Crown_Victoria_Taxi','Ford_Fiesta_Zetec_2009','Ford_Shelby_Cobra','Ford_Transit_Jumbo','Freightliner_Aerodyne','Honda_Civic_Sedan','Hummer_H2','International_Ambulance_FDNY','Kenworth_T600','Mack_Dumper','Mercedes_Class_G_500','Mercedes_SLK','Mercedes_Vario_Brinks','Nissan_Elgrand','Nissan_Murano','Opel_Vivaro_TNT','PAZ_3205','Peugeot_107','Peugeot_406','Renault_420','Renault_G210','Scania_400_Concretemixer','Scania_450_Dumpster_Hauler','Smart_Roadster_Coupe','Trailer_Container','Volkwagen_Caravelle','VW_Golf_V']
trees = [ 'birch 1','birch 2','birch 3','birch 4','bush 1','bush 2','bush 3','bush 4','bush 5','c pine 1','c pine 2','c pine 3','c pine 4','maple 1','maple 2','maple 3','maple 4','oak 1','oak 2','oak 3','oak 4','oak 5','oak 6','oak 7','oak 8','Palm','pine 1','pine 2','pine 3','spruce 1','spruce 2','spruce 3','spruce 4','spruce 5','Tree1A','Tree1B','Tree2','tree2B','Tree3','Tree4','Tree5','Tree6A','Tree6B','Tree7','Tree8','treeF','treeG','treeH1','treeH2','Tree_1_a','Tree_1_b','Tree_1_c','Tree_1_d','Tree_1_e','Tree_1_f','Tree_2_a','Tree_2_b','Tree_2_c','Tree_2_d','Tree_2_e','Tree_2_f','Tree_3_a','Tree_3_b','Tree_3_c','Tree_3_d','Tree_3_e','Tree_4_a','Tree_4_b','Tree_4_c','Tree_4_d','Tree_4_e','Tree_4_f','Tree_5_a','Tree_5_b','Tree_5_c','Tree_5_d','Tree_5_e','Tree_5_f','Tree_6_a','Tree_6_c','Tree_6_d','Tree_6_e','Tree_7_a','Tree_7_b','Tree_7_c','Tree_7_d','Tree_7_e','Tree_8_a','Tree_8_b','Tree_8_c','Tree_8_d','Tree_8_e' ]

# try:
# except NameError:
if run:
	output('Running script {} ...'.format(run))
	with open(run) as fp:
		for line in fp:
			output(send_data(line))
else:
	output('Using demo #{}'.format(demo))
	output('Press CTRL+C to abort')
	
	# track objects created by script to remove them from scene later on
	obj = []
	signal.signal(signal.SIGINT, gracefull_shutdown)
	atexit.register(gracefull_shutdown)
	
	# random cars in random positions with camera sweep and segmentation output
	if demo == 0:
		# create cameras
		output(send_data('DEVICE CREATE mycamera Cameras/TestCamera POSITION ({} {} {})'.format(10 + X_COMP, 10 + Y_COMP, 10 + Z_COMP)))
		output(send_data('DEVICE CREATE mysegmentation Segmentation POSITION ({} {} {})'.format(10 + X_COMP, 10 + Y_COMP, 10 + Z_COMP)))
		
		obj.append('mycamera')
		obj.append('mysegmentation')
		obj.append('disk1')
		
		output(send_data('DEVICE mycamera TURN ON'))
		output(send_data('DEVICE mysegmentation TURN ON'))
		
		# load all cars cars_limit times on scene
		k = 0
		while k < cars_limit:
			for v in cars:
				output(send_data('OBJECT CREATE mycar_{} Cars/{}'.format(k, v)))
				obj.append('mycar_{}'.format(k))
				k += 1
		
		# define output path
		output(send_data('DISK CREATE disk1 PATH {}'.format(output_path)))
		
		a	= 0
		while a < 360:
			# one dimension camera sweep in 10 degrees steps
			output(send_data('DEVICE mycamera ROTATE (0 {} 0)'.format(a)))
			k = 0
			
			while k < cars_limit:
				# make sure car is on camera's fov
				output(send_data('OBJECT mycar_{} FRUSTUM mycamera RIGHT {} DOWN {} DEPTH {}'.format(k, random.uniform(0, 1), random.uniform(0, 1), random.randint(5, 120))))
				# rotate car at random
				output(send_data('SET mycar_{} ROTATION ({} {} {})'.format(k, random.randint(0, 359), random.randint(0, 359), random.randint(0, 359))))
				k += 1
			
			# all possible properties - https://docs.unity3d.com/ScriptReference/Camera.html
			output(send_data('SET mycamera camera.fieldOfView {}'.format(random.randint(60, 90))))
			output(send_data('SET mycamera camera.aspect {}'.format(random.uniform(0, 1))))
			
			# all objects are placed, trigger render
			output(send_data('DEVICE mycamera RENDER'))
			output(send_data('DEVICE mysegmentation RENDER'))
			
			# prepare snapshot
			output(send_data('DISK disk1 PUSH mycamera NAME demo_{}'.format(demo)))
			output(send_data('DISK disk1 PUSH mysegmentation VALUE mysegmentation filteredboundingboxes NAME bounding_boxes'))
			
			# save to disk
			output(send_data('DISK disk1 SNAPSHOT'))
			a += 10
	
	# create a parking lot and orbit around the center
	elif demo == 1:
		# create cameras
		output(send_data('DEVICE CREATE mycamera Cameras/TestCamera POSITION ({} {} {})'.format(0 + X_COMP, 10 + Y_COMP, -40 + Z_COMP)))
		output(send_data('DEVICE mycamera ROTATE (20 0 0)'))
		
		obj.append('mycamera')
		obj.append('disk1')
		
		output(send_data('DEVICE mycamera TURN ON'))
		
		k = 0
		
		p_x = -15
		p_z = -30
		dist_h = 7 # car front
		dist_v = 4 # car side
		dist_lim = 30 # z distance limit
		
		while k < cars_limit:
			for v in cars:
				output(send_data('OBJECT CREATE mycar_{} Cars/{}'.format(k, v)))
				output(send_data('SET mycar_{} POSITION ({} {} {})'.format(k, p_x + X_COMP, 5 + Y_COMP, p_z + Z_COMP)))
				obj.append('mycar_{}'.format(k))
				k += 1
				p_z += dist_h
				
				if p_z > dist_lim:
					p_z = -dist_lim
					p_x += dist_v
		
		# define output path
		output(send_data('DISK CREATE disk1 PATH {}'.format(output_path)))
		
		elevation = 15
		k = int(k / 2) # get a car roughtly on the center
		dist_e = 5 # elevation increment
		dist_a = 10 # azimuth increment
		
		# orbit car in the center
		while elevation < 90:
			azimuth = 0
			
			while azimuth < 360:
				output(send_data('DEVICE mycamera ORBIT mycar_{} DISTANCE {} ELEVATION {} AZIMUTH {}'.format(k, 14, elevation, azimuth)))
				
				# all objects are placed, trigger render
				output(send_data('DEVICE mycamera RENDER'))
				
				# prepare snapshot
				output(send_data('DISK disk1 PUSH mycamera NAME demo_{}'.format(demo)))
				
				# save to disk
				output(send_data('DISK disk1 SNAPSHOT'))
				azimuth += dist_a
			
			elevation += dist_e
	
	# create a parking lot and rotate all cars at random while orbiting it
	elif demo == 2:
		# create cameras
		output(send_data('DEVICE CREATE mycamera Cameras/TestCamera POSITION ({} {} {})'.format(0 + X_COMP, 10 + Y_COMP, -40 + Z_COMP)))
		output(send_data('DEVICE mycamera ROTATE (20 0 0)'))
		
		obj.append('mycamera')
		obj.append('disk1')
		
		output(send_data('DEVICE mycamera TURN ON'))
		
		k = 0
		
		p_x = -15
		p_z = -30
		dist_h = 7 # car front
		dist_v = 4 # car side
		dist_lim = 30 # z distance limit
		
		while k < cars_limit:
			for v in cars:
				output(send_data('OBJECT CREATE mycar_{} Cars/{}'.format(k, v)))
				output(send_data('SET mycar_{} POSITION ({} {} {})'.format(k, p_x + X_COMP, 5 + Y_COMP, p_z + Z_COMP)))
				obj.append('mycar_{}'.format(k))
				k += 1
				p_z += dist_h
				
				if p_z > dist_lim:
					p_z = -dist_lim
					p_x += dist_v
		
		# define output path
		output(send_data('DISK CREATE disk1 PATH {}'.format(output_path)))
		
		n_cars = k
		
		elevation = 15
		k = int(k / 2) # get a car roughtly on the center
		dist_e = 5 # elevation increment
		dist_a = 10 # azimuth increment
		
		# orbit car in the center
		while elevation < 90:
			azimuth = 0
			
			while azimuth < 360:
				output(send_data('DEVICE mycamera ORBIT mycar_{} DISTANCE {} ELEVATION {} AZIMUTH {}'.format(k, 14, elevation, azimuth)))
				
				i = 0
				while i < n_cars:
					output(send_data('SET mycar_{} ROTATION ({} {} {})'.format(i, random.randint(0, 359), random.randint(0, 359), random.randint(0, 359))))
					i += 1
				
				# all objects are placed, trigger render
				output(send_data('DEVICE mycamera RENDER'))
				
				# prepare snapshot
				output(send_data('DISK disk1 PUSH mycamera NAME demo_{}'.format(demo)))
				
				# save to disk
				output(send_data('DISK disk1 SNAPSHOT'))
				azimuth += dist_a
			
			elevation += dist_e
	
	# camera postprocessing control
	elif demo == 3:
		# create cameras
		output(send_data('DEVICE CREATE mycamera Cameras/TestCamera POSITION ({} {} {})'.format(0 + X_COMP, 10 + Y_COMP, -40 + Z_COMP)))
		output(send_data('DEVICE CREATE mycamerapp RGBPostProStack POSITION ({} {} {})'.format(0 + X_COMP, 10 + Y_COMP, -40 + Z_COMP)))
		
		output(send_data('DEVICE mycamera ROTATE (20 0 0)'))
		output(send_data('DEVICE mycamerapp ROTATE (20 0 0)'))
		
		output(send_data('DEVICE mycamera TURN ON'))
		output(send_data('DEVICE mycamerapp TURN ON'))
		
		obj.append('mycamera')
		obj.append('mycamerapp')
		obj.append('disk1')
		
		k = 0
		
		p_x = -15
		p_z = -30
		dist_h = 7 # car front
		dist_v = 4 # car side
		dist_lim = 30 # z distance limit
		
		output(send_data('OBJECT CREATE mycar_{} Cars/{}'.format(k, cars[0])))
		output(send_data('SET mycar_{} POSITION ({} {} {})'.format(k, p_x + X_COMP, 5 + Y_COMP, p_z + Z_COMP)))
		# SET RGBPostProStack postprocessingbehaviour.profile SCRIPTABLEOBJECT testprofile
		# SET RGBPostProStack postprocessingbehaviour.profile.ambientocclusion.settings.radius 0.3
		
		obj.append('mycar_{}'.format(k))
		
		# define output path
		output(send_data('DISK CREATE disk1 PATH {}'.format(output_path)))
		
		elevation = 15
		dist_e = 5 # elevation increment
		dist_a = 10 # azimuth increment
		
		# orbit car in the center
		while elevation < 90:
			azimuth = 0
			
			while azimuth < 360:
				output(send_data('SET mycamerapp vignette.intensity {}'.format(random.uniform(0, 1))))
				output(send_data('SET mycamerapp vignette.scale {}'.format(random.uniform(0, 1))))
				
				output(send_data('SET mycamerapp bloom.intensity {}'.format(random.uniform(0, 1))))
				output(send_data('SET mycamerapp bloom.brightness {}'.format(random.uniform(1, 8))))
				output(send_data('SET mycamerapp bloom.range {}'.format(random.uniform(0.25, 1.25))))
				output(send_data('SET mycamerapp bloom.downsamples {}'.format(random.uniform(0, 1))))
				output(send_data('SET mycamerapp bloom.brightness {}'.format(random.randint(3, 9))))
				
				output(send_data('DEVICE mycamera ORBIT mycar_{} DISTANCE {} ELEVATION {} AZIMUTH {}'.format(k, 14, elevation, azimuth)))
				output(send_data('DEVICE mycamerapp ORBIT mycar_{} DISTANCE {} ELEVATION {} AZIMUTH {}'.format(k, 14, elevation, azimuth)))
				
				# all objects are placed, trigger render
				output(send_data('DEVICE mycamera RENDER'))
				output(send_data('DEVICE mycamerapp RENDER'))
				
				# prepare snapshot
				# output(send_data('DISK disk1 PUSH mycamera NAME demo_{}'.format(demo)))
				output(send_data('DISK disk1 PUSH mycamerapp NAME demopp_{}'.format(demo)))
				
				# save to disk
				output(send_data('DISK disk1 SNAPSHOT'))
				azimuth += dist_a
			
			elevation += dist_e
	
	# segmentation camera test
	elif demo == 4:
		# create cameras
		output(send_data('DEVICE CREATE mycamera Cameras/TestCamera POSITION ({} {} {})'.format(0 + X_COMP, 10 + Y_COMP, -40 + Z_COMP)))
		output(send_data('DEVICE CREATE mysegmentation Segmentation POSITION ({} {} {})'.format(0 + X_COMP, 10 + Y_COMP, -40 + Z_COMP)))
		
		output(send_data('DEVICE mycamera ROTATE (20 0 0)'))
		output(send_data('DEVICE mysegmentation ROTATE (20 0 0)'))
		
		output(send_data('DEVICE mycamera TURN ON'))
		output(send_data('DEVICE mysegmentation TURN ON'))
		
		# minimum number of pixels visible
		output(send_data('SET mysegmentation segmentation.minimumpixelscount 1'))
		
		obj.append('mycamera')
		obj.append('mysegmentation')
		obj.append('disk1')
		
		k = 0
		
		p_x = -15
		p_z = -30
		dist_h = 7 # car front
		dist_v = 4 # car side
		dist_lim = 30 # z distance limit
		
		while k < 10:
			output(send_data('OBJECT CREATE mycar_{} Cars/?'.format(k)))
			output(send_data('SET mycar_{} POSITION ({} {} {})'.format(k, p_x + X_COMP, 5 + Y_COMP, p_z + Z_COMP)))
			obj.append('mycar_{}'.format(k))
			k += 1
			p_z += dist_h
		
		k = 5
		
		# define output path
		output(send_data('DISK CREATE disk1 PATH {}'.format(output_path)))
		
		elevation = 15
		dist_e = 5 # elevation increment
		dist_a = 10 # azimuth increment
		
		# orbit car in the center
		while elevation < 90:
			azimuth = 0
			
			while azimuth < 360:
				output(send_data('DEVICE mycamera ORBIT mycar_{} DISTANCE {} ELEVATION {} AZIMUTH {}'.format(k, 14, elevation, azimuth)))
				output(send_data('DEVICE mysegmentation ORBIT mycar_{} DISTANCE {} ELEVATION {} AZIMUTH {}'.format(k, 14, elevation, azimuth)))
				
				# all objects are placed, trigger render
				output(send_data('DEVICE mycamera RENDER'))
				output(send_data('DEVICE mysegmentation RENDER'))
				
				# prepare snapshot
				output(send_data('DISK disk1 PUSH mycamera NAME demo_{}'.format(demo)))
				# output(send_data('DISK disk1 PUSH VALUE mysegmentation filteredboundingboxes NAME demosg_{}'.format(demo)))
				output(send_data('DISK disk1 PUSH VALUE mysegmentation filteredboundingboxes NAME bounding_boxes'))
				
				# save to disk
				output(send_data('DISK disk1 SNAPSHOT'))
				azimuth += dist_a
			
			elevation += dist_e
	
	# radius area spawner
	elif demo == 5:
		
		k = 0
		while k < backdrops_limit:
			output(send_data('OBJECT CREATE mybackdrop_{} Backdrop/?'.format(k)))
			output(send_data('OBJECT mybackdrop_{} AREA ({} {}) YPOS {} RADIUS 50 INNERRADIUS 40'.format(k, X_COMP -15, Z_COMP -30, random.randint(0,5) + Y_COMP)))
			obj.append('mybackdrop_{}'.format(k))
			k += 1
		
		k = 0
		while k < trees_limit:
			output(send_data('OBJECT CREATE mytree_{} Trees/?'.format(k)))
			output(send_data('OBJECT mytree_{} AREA ({} {}) YPOS {} RADIUS 35 INNERRADIUS 20'.format(k, X_COMP -15, Z_COMP -30, random.randint(0,5) + Y_COMP)))
			obj.append('mytree_{}'.format(k))
			k += 1
		
		k = 0
		while k < props_limit:
			output(send_data('OBJECT CREATE myprop_{} Props/?'.format(k)))
			output(send_data('OBJECT myprop_{} AREA ({} {}) YPOS {} RADIUS 30 INNERRADIUS 25'.format(k, X_COMP -15, Z_COMP -30, random.randint(0,5) + Y_COMP)))
			obj.append('myprop_{}'.format(k))
			k += 1
		
		k = 0
		while k < signs_limit:
			output(send_data('OBJECT CREATE mysign_{} Signs/?'.format(k)))
			output(send_data('OBJECT mysign_{} AREA ({} {}) YPOS {} RADIUS 25 INNERRADIUS 20'.format(k, X_COMP -15, Z_COMP -30, random.randint(0,5) + Y_COMP)))
			obj.append('mysign_{}'.format(k))
			k += 1
		
		output("Waiting 1/2...")
		time.sleep(15)
		
		k = 0
		while k < cars_limit:
			output(send_data('OBJECT CREATE mycar_{} Cars/?'.format(k)))
			output(send_data('OBJECT mycar_{} AREA ({} {}) YPOS {} RADIUS 20 INNERRADIUS 0'.format(k, X_COMP -15, Z_COMP -30, random.randint(0,5) + Y_COMP)))
			obj.append('mycar_{}'.format(k))
			k += 1
		
		k = 99
		
		# adding camera as the last entry may boost performance while building scene
		
		output(send_data('DEVICE CREATE mycamera Cameras/TestCamera POSITION ({} {} {})'.format(0 + X_COMP, 10 + Y_COMP, -40 + Z_COMP)))
		output(send_data('DEVICE mycamera ROTATE (20 0 0)'))
		
		output(send_data('DEVICE mycamera TURN ON'))
		
		obj.append('mycamera')
		obj.append('disk1')
		
		# define output path
		output(send_data('DISK CREATE disk1 PATH {}'.format(output_path)))
		
		output("Waiting 2/2...")
		time.sleep(15)
		
		dist = 125
		
		# orbit car in the center
		while dist > 10:
			elevation = 15
			dist_e = 5 # elevation increment
			dist_a = 10 # azimuth increment
			
			while elevation < 90:
				azimuth = 0
				
				while azimuth < 360:
					output(send_data('DEVICE mycamera ORBIT mycar_{} DISTANCE {} ELEVATION {} AZIMUTH {}'.format(k, dist, elevation, azimuth)))
					
					# all objects are placed, trigger render
					output(send_data('DEVICE mycamera RENDER'))
					
					# prepare snapshot
					output(send_data('DISK disk1 PUSH mycamera NAME demo_{}'.format(demo)))
					
					# save to disk
					output(send_data('DISK disk1 SNAPSHOT'))
					azimuth += dist_a
				
				elevation += dist_e
			dist -= 10
			output('Waiting, dist: {}'.format(dist))
			time.sleep(180)
		
	else:
		output('Invalid demo option')

output('Done')
