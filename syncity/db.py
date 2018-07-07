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

from . import common, settings_manager

settings = settings_manager.Singleton()
settings._conn = None

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
Lists all bundles on the database

return (list)
"""
def bundles():
	cur = settings._conn.cursor()
	r = []
	
	for row in cur.execute("SELECT assetBundle FROM objects GROUP BY assetBundle"):
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
	cur = settings._conn.cursor()
	r = []
	
	for row in cur.execute('SELECT {} FROM objects WHERE assetBundle="{}"'.format(selection, bundle)):
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
Removes objects from the database by GUID

## Arguments

guids (list|string): Object or list of objects to be removed

"""
def remove(guids):
	if not isinstance(guids, list):
		guids = [ guids ]
	
	cur = settings._conn.cursor()
	for guid in guids:
		cur.execute('DELETE FROM object_properties_numeric WHERE guid="{}"'.format(guid))
		cur.execute('DELETE FROM object_properties_text WHERE guid="{}"'.format(guid))
		cur.execute('DELETE FROM rel_objects WHERE guid="{}"'.format(guid))
		cur.execute('DELETE FROM objects WHERE guid="{}"'.format(guid))
	
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
	cur = settings._conn.cursor()
	vals = fixStrings(list(props.values()))
	
	sql = 'INSERT INTO {} ({}) VALUES ({})'.format(table, ', '.join(list(props.keys())), ', '.join(vals))
	
	common.output('add: {}'.format(sql), 'DEBUG')
	cur.execute(sql)
	cur.close()
	settings._conn.commit()

def getRelations(guid):
	cur = settings._conn.cursor()
	
	r = []
	
	for row in cur.execute('SELECT {} FROM rel_objects WHERE guid="{}"'.format(', '.join(settings._rFields), guid)):
		r.append(list(row))
	
	cur.close()
	return r

def getProperties(guid, type="numeric"):
	cur = settings._conn.cursor()
	
	r = []
	
	for row in cur.execute('SELECT {} FROM object_properties_{} WHERE guid="{}"'.format(', '.join(settings._pFields), type, guid)):
		r.append(list(row))
	
	cur.close()
	return r

def guidExist(guid):
	cur = settings._conn.cursor()
	exist = False
	
	for row in cur.execute('SELECT guid FROM objects where guid="{}"'.format(guid)):
		exist = True
		break
	
	cur.close()
	
	return exist
