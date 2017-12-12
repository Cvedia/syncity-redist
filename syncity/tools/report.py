import sys
import os
import time

from .. import common, helpers, settings_manager
from datetime import datetime

settings = settings_manager.Singleton()
SIZE_THRESH = 104857600

def help():
	return '''\
	Does a generic report on existing assets, database and so on.
'''

def args(parser):
	parser.add_argument('--binary', action=common.readable_dir, help='Defines binary folder name')
	parser.add_argument('--assets', action=common.readable_dir, help='Defines assets folder name')

def run():
	if not settings.binary:
		common.output('You must set --binary to run this tool')
		sys.exit(1)
		return
	
	rfn = '{}report_{}.txt'.format(settings.local_path, settings._start)
	fh = open(rfn, 'wb+')
	
	common.output('Scanning toolbox...')
	common.ts_write(fh, 'Syncity toolbox v.{}'.format(settings._version))
	common.ts_write(fh, 'Python: {} API: {}'.format(sys.version.replace('\n', ''), sys.api_version))
	common.ts_write(fh, 'System platform: {}'.format(sys.platform))
	common.ts_write(fh, 'System time offset: {}'.format(common.local_time_offset()))
	common.ts_write(fh, '-- Toolbox scan --')
	
	fns = common.get_all_files(settings._root)
	i = 0
	size = 0
	for fn in fns:
		i = i + 1
		
		st = os.stat(fn)
		size = size + st.st_size
		
		if st.st_size > SIZE_THRESH:
			common.output('Scanning: {}'.format(fn))
		
		md5 = common.md5(fn)
		common.ts_write(fh, '{} {} {} {}'.format(md5, int(st.st_mtime), st.st_size, fn))
	
	common.ts_write(fh, '-- Toolbox scan completed, {} files, {} bytes --'.format(i, size))
	
	common.output('Scanning binary...')
	common.ts_write(fh, '-- Binary scan --')
	
	fns = common.get_all_files(settings.binary)
	i = 0
	size = 0
	init_cl = False
	logs = []
	log_ext = [ 'txt', 'log' ]
	
	for fn in fns:
		i = i + 1
		
		st = os.stat(fn)
		size = size + st.st_size
		
		if st.st_size > SIZE_THRESH:
			common.output('Scanning: {}'.format(fn))
		
		md5 = common.md5(fn)
		common.ts_write(fh, '{} {} {} {}'.format(md5, int(st.st_mtime), st.st_size, fn))
		
		if os.path.basename(fn) == 'init.cl':
			init_cl = fn
		elif fn[-3:] in log_ext:
			logs.append(fn)
	
	common.ts_write(fh, '-- Binary scan completed, {} files, {} bytes --'.format(i, size))
	
	if settings.assets:
		common.output('Scanning assets...')
		common.ts_write(fh, '-- Assets scan --')
		
		fns = common.get_all_files(settings.assets)
		i = 0
		size = 0
		manifests = []
		
		for fn in fns:
			i = i + 1
			
			st = os.stat(fn)
			size = size + st.st_size
			
			if st.st_size > SIZE_THRESH:
				common.output('Scanning: {}'.format(fn))
			
			md5 = common.md5(fn)
			common.ts_write(fh, '{} {} {} {}'.format(md5, int(st.st_mtime), st.st_size, fn))
			
			if fn[-8:] == 'manifest':
				manifests.append(fn)
		
		common.ts_write(fh, '-- Assets scan completed, {} files, {} bytes --'.format(i, size))
		
		for manifest in manifests:
			common.ts_write(fh, '-- manifest dump @ {} begins --'.format(manifest))
			
			f = open(manifest)
			for line in f.readlines():
				fh.write(line.encode())
			f.close()
			
			common.ts_write(fh, '-- manifest dump @ {} ends --'.format(manifest))
	
	common.output('Collecting logs and config...')
	
	if init_cl != False:
		common.ts_write(fh, '-- init.cl dump @ {} begins --'.format(init_cl))
		
		f = open(init_cl)
		for line in f.readlines():
			fh.write(line.encode())
		f.close()
		
		common.ts_write(fh, '-- init.cl dump @ {} ends --'.format(init_cl))
	
	for log in logs:
		common.ts_write(fh, '-- log dump @ {} begins --'.format(log))
		
		f = open(log)
		for line in f.readlines():
			fh.write(line.encode())
		f.close()
		
		common.ts_write(fh, '-- log dump @ {} ends --'.format(log))
	
	common.ts_write(fh, '-- Report completed in {}s --'.format(time.time() - settings._start))
	fh.close()
	common.output('Completed report, saved as {}'.format(rfn))
