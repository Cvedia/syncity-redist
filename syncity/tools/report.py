import sys
import os
import time
import sqlite3

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
	main_db = False
	logs = []
	existing_assets = []
	log_ext = [ 'txt', 'log' ]
	
	for fn in fns:
		i = i + 1
		
		st = os.stat(fn)
		size = size + st.st_size
		
		if st.st_size > SIZE_THRESH:
			common.output('Scanning: {}'.format(fn))
		
		md5 = common.md5(fn)
		common.ts_write(fh, '{} {} {} {}'.format(md5, int(st.st_mtime), st.st_size, fn))
		
		if os.path.basename(fn) == 'main.db':
			main_db = fn
		elif os.path.basename(fn) == 'init.cl':
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
			
			if main_db == False and os.path.basename(fn) == 'main.db':
				main_db = fn
			
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
				if main_db != False and '- Assets/' in line and '.prefab' in line:
					existing_assets.append(line.replace('.prefab', '').replace('- Assets/', '').replace('\n', '').replace('\r', '').lower())
				fh.write(line.encode())
			f.close()
			
			common.ts_write(fh, '-- manifest dump @ {} ends --'.format(manifest))
	
	if main_db != False:
		common.ts_write(fh, '-- Database check direction: assets -> database --')
		common.output('Matching assets with database...')
		
		conn = sqlite3.connect(main_db)
		i = 0
		m = 0
		
		for asset in existing_assets:
			cur = conn.cursor()
			cur.execute('SELECT * FROM objects where prefabPath = ?', (asset,))
			
			if len(cur.fetchall()) == 0:
				common.ts_write(fh, 'Asset `{}` has no object entry on database'.format(asset))
				m = m + 1
			
			i = i + 1
		
		common.ts_write(fh, '-- Completed database check direction: assets -> database, {} assets, {} missing. --'.format(i, m))
		
		i = 0
		m = 0
		common.ts_write(fh, '-- Database check direction: database -> assets --')
		cur = conn.cursor()
		cur.execute('SELECT prefabPath FROM objects')
		for row in cur.fetchall():
			if row[0] not in existing_assets:
				common.ts_write(fh, 'Database entry `{}` contains no asset.'.format(row[0]))
				m = m + 1
			
			i = i + 1
		
		common.ts_write(fh, '-- Completed database check direction: database -> assets, {} assets, {} missing. --'.format(i, m))
		conn.close()
	
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
