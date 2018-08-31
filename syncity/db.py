"""
A simple sqlite3 manager / helper function repository

This is intended to manage asset's `main.db`

settings manager is used as singleton to store database connections, the following is used:

`settings._conn`: Database object, defaults to `None`
`settings._dbfile`: Currently loaded database path

WARNING: By default database is not on autocommit mode
"""

import os
import sqlite3
import random

from . import common, settings_manager

settings = settings_manager.Singleton()
settings._conn = None
settings._qCount = 0
settings._sFields = [ 'guid', 'parentGUID', 'timestamp', 'assetbundle', 'prefabPath', 'sizeX', 'sizeY', 'colliderSizeX', 'colliderSizeY' ]
settings._rFields = [ 'guid', 'rootID', 'parentID', 'timestamp' ]
settings._pFields = [ 'guid', 'propertyID', 'value' ]

"""
Initializes a database connections

This will bind the connection to the singleton `settings._conn`

## Arguments

path (string): Path to database file
force (bool): Forces a new connection even if one exists

"""
def init(path, force=False):
	if settings._conn != None and force == False:
		return
	elif settings._conn != None:
		settings._conn.close()
		settings._conn = None
	
	if not os.path.isfile(path):
		common.output('Can\'t read: {}'.format(path), 'ERROR')
		return false
	
	settings._dbfile = path
	settings._conn = sqlite3.connect(path)

"""
Automatically initializes a database using settings.assets path for main.db

If the database is already instantiated, will skip initialization process.
"""
def autoInit():
	if settings._conn != None:
		return
	
	fn = os.path.join(settings.assets, 'main.db')
	common.output('Auto initializing db @ {}'.format(fn), 'DEBUG')
	
	init(fn)

"""
Lists all bundles on the database

return (list)
"""
def bundles():
	autoInit()
	cur = settings._conn.cursor()
	r = []
	sql = "SELECT assetBundle FROM objects GROUP BY assetBundle"
	logQuery(sql)
	
	for row in cur.execute(sql):
		r.append(row[0])
	
	cur.close()
	return r

"""
Queries objects based on a bundle name

## Arguments

bundle (string): Assetbundle name
selection (string): What fields should be returned, defaults to `*`
fields (list): What order of fields should be returned, defaults to `[0]`

return (list)
"""
def bundleObjects(bundle, selection="*", fields=[0]):
	autoInit()
	cur = settings._conn.cursor()
	r = []
	sql = 'SELECT {} FROM objects WHERE assetBundle="{}"'.format(selection, bundle)
	logQuery(sql)
	
	for row in cur.execute(sql):
		if fields == True:
			r.append(list(row))
		else:
			f = []
			for i in fields:
				f.append(row[i])
			r.append(f[0] if len(f) == 1 else f)
	
	cur.close()
	return r

"""
Gets one or more random prefabs from a asset bundle

## Arguments

bundle (string): Assetbundle name
size (int): Number of random assets

return (list) Prefabs

## Note

This function works in a deterministic fashion when `pyseed` flag is set.


"""
def getRandomBundlePrefab(bundle, size=1):
	return random.choices(bundleObjects(bundle, selection='prefabPath'), k=size)

"""
Removes objects from the database by GUID

## Arguments

guids (list|string): Object or list of objects to be removed

"""
def remove(guids):
	autoInit()
	if not isinstance(guids, list):
		guids = [ guids ]
	
	cur = settings._conn.cursor()
	for guid in guids:
		sql = [
			'DELETE FROM object_properties_numeric WHERE guid="{}"'.format(guid),
			'DELETE FROM object_properties_text WHERE guid="{}"'.format(guid),
			'DELETE FROM rel_objects WHERE guid="{}"'.format(guid),
			'DELETE FROM objects WHERE guid="{}"'.format(guid)
		]
		
		for s in sql:
			logQuery(s)
			cur.execute(s)
	
	cur.close()
	settings._conn.commit()

def fixStrings(vals):
	r = []
	for val in vals:
		try:
			x = int(val)
			r.append(str(val))
		except:
			common.output('Except: {}'.format(val))
			r.append(str('"{}"'.format(val.replace('"', '""'))))
	return r

def add(props, table='objects'):
	autoInit()
	cur = settings._conn.cursor()
	vals = fixStrings(list(props.values()))
	
	sql = 'INSERT INTO {} ({}) VALUES ({})'.format(table, ', '.join(list(props.keys())), ', '.join(vals))
	logQuery(sql)
	cur.execute(sql)
	cur.close()
	settings._conn.commit()

def getRelations(guid):
	autoInit()
	cur = settings._conn.cursor()
	
	r = []
	sql = 'SELECT {} FROM rel_objects WHERE guid="{}"'.format(', '.join(settings._rFields), guid)
	logQuery(sql)
	
	for row in cur.execute(sql):
		r.append(list(row))
	
	cur.close()
	return r

def getProperties(guid, type="numeric"):
	autoInit()
	cur = settings._conn.cursor()
	
	r = []
	sql = 'SELECT {} FROM object_properties_{} WHERE guid="{}"'.format(', '.join(settings._pFields), type, guid)
	logQuery(sql)
	
	for row in cur.execute(sql):
		r.append(list(row))
	
	cur.close()
	return r

def guidExist(guid):
	autoInit()
	cur = settings._conn.cursor()
	exist = False
	sql = 'SELECT guid FROM objects where guid="{}"'.format(guid)
	logQuery(sql)
	for row in cur.execute(sql):
		exist = True
		break
	
	cur.close()
	return exist

def logQuery(sql):
	common.output('[{}] {}'.format(settings._qCount, sql), 'SQL')
	settings._qCount += 1
