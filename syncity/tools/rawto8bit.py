"""
Converts 32-bit raw export images to 8-bit, this will loose information, but 
will make raw images human friendly.

## Usage

`python syncity.py -t rawto8bit -l path/to/exported/images`

## Notes:

WARNING: This function will override existing images matching `depth`

"""

import numpy as np
import cv2

from .. import common, helpers, settings_manager
from tqdm import tqdm

settings = settings_manager.Singleton()

def args(parser):
	try:
		parser.add_argument('--channels', type=int, default=3, help='Number of channels from the exported images, default to 3')
	except: pass
	try:
		parser.add_argument('--channel', type=int, default=2, help='Channel to be exported from the raw image, defaults to 2')
	except: pass
	try:
		parser.add_argument('--height', type=int, default=None, help='Exported image height')
	except: pass
	try:
		parser.add_argument('--width', type=int, default=None, help='Exported image width')
	except: pass

def help():
	return '''\
	Converts 32-bit depth raw export images to 8-bit, this will loose information, but will make raw images human friendly.
'''

def run():
	common.output('Scanning {}...'.format(settings.local_path))
	fns = common.getAllFiles(settings.local_path, recursive=False)
	fi = len(fns)
	
	if fi == 0:
		common.output('No files found in {}'.format(settings.local_path))
		return
	
	converted = 0
	common.output('Processing {} files...'.format(fi))
	for fn in tqdm(fns):
		if not '.raw' in fn.lower():
			continue
		
		ofn = '{}.png'.format(fn.replace('.raw', '-converted'))
		fd = open(fn, 'rb')
		f = np.fromfile(fd, dtype=np.float32, count=-1)
		im = f.reshape((settings.height, settings.width, settings.channels))
		cv2.imwrite(ofn, (256/im[:,:,settings.channel]).astype('uint8'))
		fd.close()
		converted += 1
	
	common.output('Completed, converted {} files.'.format(converted))
