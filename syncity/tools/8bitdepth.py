"""
Converts 16-bit depth export images to 8-bit, this will loose information, but 
will make depth images human friendly.

## Usage

`python syncity.py -t 8bitdepth -l path/to/exported/images`

"""

import json
import sys
import os
import time
import re
import numpy as np
import cv2

from .. import common, helpers, settings_manager
from tqdm import tqdm

settings = settings_manager.Singleton()

def help():
	return '''\
	Converts 16-bit depth export images to 8-bit, this will loose information, but will make depth images human friendly.
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
		if not 'depth' in fn.lower():
			continue
		
		x = fn.split('.')
		x[-1] = '-8bit.{}'.format(x[-1])
		nfn = '.'.join(fn)
		cv2.imwrite(nfn, cv2.imread(fn).astype('uint8'))
		common.output('Wrote: {}'.format(nfn), 'DEBUG')
		converted += 1
	
	common.output('Completed, converted {} files.'.format(converted))
