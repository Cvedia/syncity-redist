"""
Creates a md5 hash of exported json objects ignoring their timestamps

## Usage

`python syncity.py -t json_hash -l path/to/exported/images`

"""

import json
import sys
import os
import time

from .. import common, helpers, settings_manager
from tqdm import tqdm

settings = settings_manager.Singleton()

def help():
	return '''\
	Creates a md5 hash of json objects ignoring their timestamps
'''

def run():
	common.output('Scanning {}...'.format(settings.local_path))
	fns = common.getAllFiles(settings.local_path, recursive=False)
	fi = len(fns)
	
	if fi == 0:
		common.output('No files found in {}'.format(settings.local_path))
		return
	
	count = 0
	common.output('Processing {} files...'.format(fi))
	hashes = []
	for fn in tqdm(fns):
		if not '.json' in fn.lower():
			continue
		
		o = common.loadJSON(fn)
		
		try:
			del o['timestamp']
		except:
			pass
		
		hashes.append(common.md5(json.dumps(o)))
		count += 1
	hashes.sort()
	ofn = os.path.join(settings.local_path, 'hashes_{}.md5'.format(settings._start))
	f = open(ofn, 'wb+')
	f.write(common.shapeString('\n'.join(hashes)))
	f.close()
	
	common.output('Completed, {} files, wrote {}'.format(count, ofn))
