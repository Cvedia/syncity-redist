"""
Copies a assetBundle package database information into a another database
"""
import time
import os

from shutil import copyfile
from .. import common, helpers, settings_manager, db

settings = settings_manager.Singleton()

def help():
	return '''\
	Copies a assetBundle package database information into a another database
'''

def args(parser):
	try:
		parser.add_argument('--source_db', default=None, help='Source database path')
	except: pass
	try:
		parser.add_argument('--assetBundle', default=None, help='Asset bundle name to be copied')
	except: pass

def doBackup():
	if settings._backup == True:
		return
	
	common.output('Creating backup...')
	
	settings._backup = True
	
	copyfile(
		os.path.join(settings.assets, 'main.db'),
		os.path.join(settings.assets, 'main-{}.db.bak'.format(time.time()))
	)

def shapeObject(flat, fields):
	r = {}
	i = 0
	
	for f in flat:
		if f != None:
			r[fields[i]] = f
		i += 1
	
	return r

def run():
	if settings.assets == None:
		common.output('You must set an --assets path', 'ERROR')
		return
	if settings.assetBundle == None:
		common.output('You must set an --assetBundle name', 'ERROR')
		return
	if settings.source_db == None:
		common.output('You must set an --source_db file', 'ERROR')
		return
	
	if settings.dry_run == False:
		common.output('Changes will be performed on the database, if you want to test changes use --dry_run', 'WARN')
		time.sleep(1)
	
	common.output('Loading: {}'.format(settings.source_db))
	
	db.init(settings.source_db)
	guids = []
	rels = {}
	pNum = {}
	pText = {}
	added = 0
	
	objs = db.bundleObjects(settings.assetBundle, selection=', '.join(settings._sFields), fields=True)
	k = len(objs)
	if k == 0:
		common.output('No objects found from assetBundle: {}'.format(assetBundle), 'WARN')
		return
	
	common.output('Found {} objects from assetBundle: {}'.format(k, settings.assetBundle))
	
	for obj in objs:
		rels[obj[0]] = []
		pNum[obj[0]] = []
		pText[obj[0]] = []
		
		for rel in db.getRelations(obj[0]):
			rels[obj[0]].append(rel)
		for p in db.getProperties(obj[0], 'numeric'):
			pNum[obj[0]].append(p)
		for p in db.getProperties(obj[0], 'text'):
			pText[obj[0]].append(p)
	
	common.output('Copying data...')
	db.init(os.path.join(settings.assets, 'main.db'), force=True)
	
	for obj in objs:
		if db.guidExist(obj[0]) == True:
			common.output('Skipping existing guid: {}'.format(obj[0]), 'DEBUG')
			continue
		
		common.output('Adding guid: {}'.format(obj[0]), 'DEBUG')
		
		if settings.dry_run == True:
			common.output('Skipping due --dry_run flag', 'DEBUG')
		else:
			db.add(shapeObject(obj, settings._sFields), table='objects')
			
			if len(rels[obj[0]]) > 0:
				for r in rels[obj[0]]:
					db.add(shapeObject(r, settings._rFields), table='rel_objects')
			if len(pNum[obj[0]]) > 0:
				for p in pNum[obj[0]]:
					db.add(shapeObject(p, settings._pFields), table='object_properties_numeric')
			if len(pText[obj[0]]) > 0:
				for p in pText[obj[0]]:
					db.add(shapeObject(p, settings._pFields), table='object_properties_text')
		
		added += 1
	
	common.output('Added {} entries'.format(added))
	
	if settings.dry_run == True:
		common.output('Dry run was enabled, no changes were performed', 'WARN')
