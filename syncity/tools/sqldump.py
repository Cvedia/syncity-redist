"""
Creates a SQL dump of a existing sqlite3 database from assets folder
"""
import sys
import os
import time
import sqlite3

from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def run():
	conn = sqlite3.connect(settings.assets + 'main.db')
	cur = conn.cursor()
	cur.execute('SELECT prefabPath FROM objects')
	rfn = '{}sqldump_{}.txt'.format(settings.local_path, settings._start)
	fh = open(rfn, 'wb+')
	for row in cur.fetchall():
		print('row: {}'.format(row[0]))
		common.tsWrite(fh, 'Database entry `{}` contains no asset.'.format(row[0]))
