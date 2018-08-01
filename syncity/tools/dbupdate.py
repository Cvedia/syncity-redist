import time
import os
import urllib.request

from shutil import copyfile
from .. import common, helpers, settings_manager, db

settings = settings_manager.Singleton()

def args(parser):
	try:
		parser.add_argument('--dburl', default=None, help='Defines the URL from source database')
	except:
		pass

def help():
	return '''\
	Fetches a remote main.db, replacing current main.db under assets folder, then 
performs a simple cleanup. Note that this will destroy and customizations you may
have on main.db. A backup is automatically generated.
'''

def doBackup():
	common.output('Creating backup...')
	copyfile(
		os.path.join(settings.assets, 'main.db'),
		os.path.join(settings.assets, 'main-{}.db.bak'.format(time.time()))
	)

def run():
	if settings.dburl == None:
		common.output('You must define a URL with --dburl to fetch a database from', 'ERROR')
		return
	
	doBackup()
	common.output('Fetching: {}...'.format(settings.dburl))
	try:
		urllib.request.urlretrieve(settings.dburl, os.path.join(settings.assets, 'main.db'))
	except:
		common.output('Error fetching url, aborting', 'ERROR')
		return
	
	common.output('Running database check...')
	common.addStack("dbcheck", "tool")
