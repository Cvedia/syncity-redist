import os
import re
import sys
import stat

from shutil import copyfile
from .. import common, helpers, settings_manager
settings = settings_manager.Singleton()

def help():
	return '''\
	Renames files
'''

def run():
	common.output('Loading files from {} ...'.format(settings.local_path), 'DEBUG')
	fns = common.getAllFiles(settings.local_path, recursive=False)
	displacement = 653
	
	for fn in fns:
		lnm = os.path.basename(fn).lower()
		ext = lnm.split('.')[-1:]
		common.output('lnm: {} ext: {}'.format(lnm, ext), 'DEBUG')
		if not 'jpg' in ext:
			continue
		num = int(re.findall(r'\d+', lnm)[0])
		nnum = num - displacement
		rnm = re.sub(r'\d+', str(nnum), lnm)
		common.output('Original: {} Replaced: {}'.format(rnm, lnm))
		rfn = os.path.join(settings.local_path, '_renamed', rnm)
		fst = os.stat(fn)
		copyfile(fn, rfn)
		os.utime(rfn, (fst.st_atime, fst.st_mtime))
