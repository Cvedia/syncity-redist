"""
This tool will scan and remove missing assetBundles and prefabs from an arbitrary `main.db` ruled by `--assets` parameter.
You can run this script on test mode by sending `--dry_run`, this will just check and show status but will not perform any changes.

When changes are performed this script will automatically create a `main-<timestamp>.db.bak` file.

This script might fail if there's something else holding the database with an exclusive lock.

## Usage example

`python syncity.py -t dbcheck --assets C:\\assetbundles --dry_run`

"""
import time
import os

from shutil import copyfile
from .. import common, helpers, settings_manager, db

settings = settings_manager.Singleton()

def help():
	return '''\
	Transverses `main.db` comparing with what is available on assets, deleting
	missing assets from the database.
'''

def doBackup():
	if settings._backup == True:
		return
	
	common.output('Creating backup...')
	
	settings._backup = True
	
	copyfile(
		os.path.join(settings.assets, 'main.db'),
		os.path.join(settings.assets, 'main-{}.db.bak'.format(time.time()))
	)

def run():
	if settings.assets == None:
		common.output('You must set an --assets path', 'ERROR')
		return
	
	if settings.dry_run == False:
		common.output('Changes will be performed on the database, if you want to test changes use --dry_run', 'WARN')
		time.sleep(1)
	
	stats = { 'bundles': { 'total': 0, 'missing': 0, 'removed': 0}, 'objects': { 'valid': 0, 'missing': 0, 'removed': 0 } }
	
	db.init(os.path.join(settings.assets, 'main.db'))
	settings._backup = False
	
	for b in db.bundles():
		stats['bundles']['total'] += 1
		mfn = os.path.join(settings.assets, '{}.manifest'.format(b))
		
		if os.path.isfile(mfn):
			common.output('Checking {}...'.format(b))
			
			data = []
			with open(mfn, 'r') as fp:
				data.append(fp.read().replace('\r', ''))
			
			data = ' '.join(data).lower()
			
			for obj in db.bundleObjects(bundle=b, selection='guid, prefabPath', fields=[0, 1]):
				if not obj[1].lower() in data:
					common.output('Object: `{}` GUID: {}, not found in bundle: {}'.format(obj[1], obj[0], b), 'WARN')
					stats['objects']['missing'] += 1
					
					if settings.dry_run == False:
						doBackup()
						common.output('Removing GUID: {}'.format(obj[0]))
						db.remove(obj[0])
						stats['objects']['removed'] += 1
				else:
					stats['objects']['valid'] += 1
		else:
			common.output('Bundle not found: {}'.format(b), 'WARN')
			stats['bundles']['missing'] += 1
			
			if settings.dry_run == False:
				doBackup()
				common.output('Removing assetBundle reference...')
				db.remove(db.bundleObjects(bundle=b, selection="guid"))
				stats['bundles']['removed'] += 1
	
	common.output('DBCheck stats: {}'.format(stats))
	
	if settings.dry_run == True:
		common.output('Dry run was enabled, no changes were performed', 'WARN')
