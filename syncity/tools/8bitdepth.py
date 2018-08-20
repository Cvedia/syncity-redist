"""
Converts 16-bit depth export images to 8-bit, this will loose information, but 
will make depth images human friendly.

## Usage

`python syncity.py -t 8bitdepth -l path/to/exported/images`

## Notes:

WARNING: This function will override existing images matching `depth`

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
		cv2.imwrite(fn, cv2.imread(fn).astype('uint8'))
		converted += 1
	
	common.output('Completed, converted {} files.'.format(converted))
