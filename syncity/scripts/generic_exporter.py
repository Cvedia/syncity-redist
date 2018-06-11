import random
import time
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Generic exporter
	Loops in a configurable frequency a export loop containing configurable cameras.
	This script will precisely keep the frequency set, taking in consideration the
	time for replies from the simulator.
'''

def args(parser):
	try:
		parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')
	except: pass
	try:
		parser.add_argument('--loop_frequency', type=float, default=1.0, help='Defines a export frequency, in seconds, when set to zero will export as fast as possible.')
	except: pass
	try:
		parser.add_argument('--camera', action='append', nargs='+', default=None, help='Defines a list of one of more cameras relevant to the scene')
	except: pass
	try:
		parser.add_argument('--wait', type=float, default=0, help='Wait, in seconds, before starting the loop')
	except: pass

def run():
	loop = 0
	mycams = []
	
	if settings.camera != None:
		for c in settings.camera:
			if isinstance(c, list):
				mycams.extend(c)
			else:
				mycams.append(c)
	
	idx = [i for i, s in enumerate(mycams) if 'segment' in s.lower()]
	autoSegment = False if len(idx) == 0 else True
	
	if settings.wait > 0:
		common.output('Waiting {}s to start'.format(settings.wait))
		time.sleep(settings.wait)
	
	common.waitQueue()
	
	while loop < settings.loop_limit:
		if settings.loop_frequency > 0:
			_start = time.time()
		
		helpers.takeSnapshot(mycams, autoSegment=autoSegment)
		
		_sleep = 0
		
		if settings.loop_frequency > 0:
			_sleep = time.time() - _start
			
			# check if it took longer than the expected wait time
			if _sleep < settings.loop_frequency:
				_sleep = settings.loop_frequency - _sleep
			else:
				_sleep = 0
		
		loop += 1
		common.output('Loop {} ({}%), wait: {}s'.format(loop, round(100 * (loop / settings.loop_limit),2), _sleep))
		
		if _sleep > 0:
			time.sleep(_sleep)
