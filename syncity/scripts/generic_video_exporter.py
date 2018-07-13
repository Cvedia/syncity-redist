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
		parser.add_argument('--stream_profile', default="high", help='Defines encoding profile')
	except: pass
	try:
		parser.add_argument('--stream_length', type=int, default=300, help='Defines the size of each video in seconds')
	except: pass
	try:
		parser.add_argument('--camera', action='append', nargs='+', default=None, help='Defines a list of one of more cameras to be exported, those will be syncronized by default, bounding box support is automatic')
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
	helpers.addVideoExport(mycams, params={"streamLength": settings.stream_length, "streamProfile": settings.stream_profile, "exportBBoxes": autoSegment})
	common.output('Done')
