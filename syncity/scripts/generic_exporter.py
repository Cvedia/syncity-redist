import random
import time
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return '''\
Generic image exporter
	Creates a image exporter object bound to one or more cameras.
	If you specify a segmentation camera that produces bounding boxes, the system
	will automatically export them as .json files.
	
	You can also specify a --stream_format to define the output image encoding,
	for example, if you want lossless images, use --stream_format png
	
	The exporter will export data as fast as the simulator produces it, a synchronizer
	in the middle takes are of aligning the data so you have neat timestamped outputs.
'''

def args(parser):
	try:
		parser.add_argument('--mode', choices=["image", "video"], default="image", help='Defines export mode')
	except: pass
	try:
		parser.add_argument('--camera', action='append', nargs='+', default=None, help='Defines a list of one of more cameras to be exported, those will be syncronized by default, bounding box support is automatic')
	except: pass
	try:
		parser.add_argument('--wait', type=float, default=0, help='Wait, in seconds, before starting the loop')
	except: pass

def minVersion():
	return '18.07.26.0000'

def run():
	mycams = []
	
	if settings.camera != None:
		for c in settings.camera:
			if isinstance(c, list):
				mycams.extend(c)
			else:
				mycams.append(c)
		
	if settings.wait > 0:
		common.output('Waiting {}s to start'.format(settings.wait))
		time.sleep(settings.wait)
	
	common.waitQueue()
	
	if settings.mode == "image":
		helpers.addDataExport(
			imageLinks=helpers.cameraExportParametrize(mycams, "image")
		)
	elif settings.mode == "video":
		helpers.addDataExport(
			videoLinks=helpers.cameraExportParametrize(mycams, "video")
		)
	
	common.output('Done')
