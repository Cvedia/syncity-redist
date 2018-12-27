"""
Dumps a database objects to a CSV file
"""

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
		parser.add_argument('--assetBundle', default=None, help='Asset bundle name (optional); When not set will export all bundles')
	except: pass

def run():
	if settings.source_db == None:
		common.output('You must set an --source_db file', 'ERROR')
		return
	
	common.output('Loading: {}'.format(settings.source_db))
	
	db.init(settings.source_db)
	guids = []
	rels = {}
	properties = db.getPropertyDefinitions()
	roots = db.getRootDefinitions()
	pNum = {}
	pText = {}
	added = 0
	
	objs = db.bundleObjects(settings.assetBundle, fields=True)
	k = len(objs)
	
	if k == 0:
		common.output('No objects found from assetBundle: {}'.format(assetBundle), 'WARN')
		return
	
	# get fields from sanitized tables
	fields = {}
	for t in settings._sTables:
		fields[t] = db.getTableFields(t)
	
	common.output('Found {} objects, loading relations...'.format(k))
	
	for obj in objs:
		rels[obj[0]] = []
		
		# TODO: Add support to export properties, once they're completed
		
		"""
		pNum[obj[0]] = []
		pText[obj[0]] = []
		"""
		for rel in db.getRelations(obj[0]):
			rels[obj[0]].append(rel)
		
		"""
		for p in db.getProperties(obj[0], 'numeric'):
			pNum[obj[0]].append(p)
		for p in db.getProperties(obj[0], 'text'):
			pText[obj[0]].append(p)
		"""
	
	common.output('Building output CSV...')
	ofn = '{}.csv'.format(settings.source_db)
	ofh = open(ofn, 'wb+')
	
	header = []
	header.extend(fields['objects'])
	header.append('roots')
	
	ofh.write(common.shapeString(','.join(header)))
	
	for obj in objs:
		l = []
		
		for o in obj:
			if o == None:
				o = ''
			try:
				l.append(str(o))
			except:
				l.append('')
		
		try:
			rl = []
			for r in rels[obj[0]]:
				rl.append(roots[r[1]][1])
			
			l.append('|'.join(rl))
		except:
			pass
		
		ofh.write(common.shapeString(','.join(l)))
	
	ofh.close()
	common.output('Completed, wrote {}'.format(ofn))
