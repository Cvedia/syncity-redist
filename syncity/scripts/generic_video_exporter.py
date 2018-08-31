import random
import time
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Generic image exporter
	Creates a video exporter object bound to one or more cameras.
	If you specify a segmentation camera that produces bounding boxes, the system
	will automatically export them as .json files.
	
	This exporter works in batches, the --stream_length parameter defines how many
	images to collect before closing a batch, while the --stream_fps enforces a
	stable playback frame rate. You can calculate the length of a video in seconds
	by stream_length / stream_fps. It's recommended to keep videos short to avoid
	long enconding times in the background, although there's no real limit on how
	long a video could be. Keep in mind that a video will only be playable once
	it's closed.
	
	The exporter will export data as fast as the simulator produces it, a synchronizer
	in the middle takes are of aligning the data so you have neat timestamped outputs.
	
	Note: While the exporter is collecting buffered data you might see zero byte
	files on your export path,
'''

def minVersion():
	return '18.07.10.0000'
def maxVersion():
	return '18.07.25.0000'

def args(parser):
	try:
		parser.add_argument('--stream_profile', default="high", help='Defines encoding profile')
	except: pass
	try:
		parser.add_argument('--stream_length', type=int, default=300, help='Defines the size of each video in seconds')
	except: pass
	try:
		parser.add_argument('--stream_fps', type=int, default=30, help='Defines the FPS of the exported video')
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
	
	helpers.addVideoExport(mycams, params={
		"streamLength": settings.stream_length,
		"streamProfile": settings.stream_profile,
		"streamFPS": settings.stream_fps,
		"exportBBoxes": autoSegment
	})
	
	common.output('Done')
