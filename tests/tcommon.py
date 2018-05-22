import os
import syncity
import string
import random
import time
import hashlib

from PIL import Image
from syncity import common, settings_manager, unity_vars, helpers

settings = settings_manager.Singleton()
settings.config = os.path.abspath('./config.json')
settings.skip_shutdown = True
settings._root = os.path.dirname(os.path.realpath(__file__))
settings._shutdown = False
settings._interactive = False
settings.test = True

common.init()
common.loadConfig()
settings.force_sync = True

def telnet():
	# close files if already open
	common.close_logging()
	common.close_recording()
	
	# reset timestamp
	settings._start = time.time()
	
	common.init2()
	
	return common.initTelnet(settings.ip, settings.port, return_fail=True)

def getRandStr(size=16, chars=string.ascii_uppercase + string.ascii_lowercase + string.digits + "()<>{}-_+ `~;.,!@#$%^='", fsSafe=False):
	if fsSafe == True:
		chars = string.ascii_uppercase + string.ascii_lowercase + string.digits + "()-_+,^="
	
	return ''.join(random.choice(chars) for _ in range(size))

def cleanup(objs, fns=[]):
	objs.sort(key=lambda x:len(x), reverse=True)
	
	for obj in objs:
		common.output('Removing object `{}`'.format(obj), 'DEBUG')
		if common.sendData('DELETE "{}"'.format(obj)) != ["OK"]:
			return False
	
	for fn in fns:
		if os.path.exists(fn):
			common.output('Removing file `{}`'.format(fn), 'DEBUG')
			try:
				os.remove(fn)
			except:
				pass
	
	return True

def imageSize(fn):
	im = Image.open(fn)
	return im.size

def imageColors(fn):
	try:
		common.output('Counting image `{}` colors'.format(fn), 'DEBUG')
		return Image.open(fn).getcolors()
	except:
		return False

def parametrizeInstances(name, params):
	def vstr(val):
		if isinstance(val, (list, tuple)):
			return "-".join([str(v) for v in val])
		else:
			return str(val)
	if not isinstance(name, list):
		name = [ name ]
	
	r = []
	
	for n in name:
		for p in ["%s[%s]" % (n, vstr(v)) for v in params]:
			r.append(p)
	
	return r

def setConfig(path=None, databasePath=None, physics=False):
	common.sendData([
		'"Config.instance" SET assetBundlesCache "{}"'.format(settings.assets if path == None else path),
		'"Config.instance" SET databaseFolderPath "{}"'.format(settings.assets if databasePath == None else databasePath),
		'"Config.instance" SET physicsEnabled {}'.format('false' if physics == False else 'true')
	])

def subject2segments(subjects):
	segments = []
	for subject in subjects:
		try:
			if subject['class']:
				segments.append(subject['class'])
		except:
			pass
	return segments

def subject2lookupTable(subjects):
	lookup = []
	i = 0
	for subject in subjects:
		try:
			if subject['class']:
				lookup.append([subject['class'], getSeqColor(i)])
				i += 1
		except:
			pass
	return lookup

def getSeqColor(i=0):
	if len(unity_vars.colors) < i:
		return helpers.getRandomColor()
	else:
		return unity_vars.colors[i]

def md5(x):
	return hashlib.md5(x.encode('utf-8')).hexdigest()

def assertApprox(a, b, template):
	fail = False
	
	for t in template:
		va = None
		vb = None
		
		if 'field' in t:
			try:
				va = eval('a{}'.format(t['field']))
			except:
				fail = True
				break
			
			try:
				vb = eval('b{}'.format(t['field']))
			except:
				fail = True
				break
		
		common.output('AssertApprox va: {} vb: {}'.format(va, vb), 'DEBUG')
		
		if 'equals' in t:
			if va == None or vb == None or vb != va:
				fail = True
				break
		
		if 'threshold' in t:
			if va == None or vb == None:
				fail = True
				break
			
			x = t['threshold'] / 100
			vac = va + (va * x)
			vaf = va - (va * x)
			vbc = vb + (vb * x)
			vbf = vb - (vb * x)
			
			common.output('AssertApprox thresh: {} va: {}~{} vb: {}~{}'.format(t['threshold'], vaf, vac, vbf, vbc), 'DEBUG')
			
			if va == vb or vaf <= vb <= vac or vbf <= va <= vbc:
				fail = False
			else:
				fail = True
				break
	
	common.output('AssertApprox result: {}'.format('True'if fail == True else 'False'), 'DEBUG')
	
	return fail

def setupSubjects(subjects, gprefix, rootObj={'position':[-6, 0, -9], 'rotation': [0, 0, 0]}):
	objRoot = '{}/obj'.format(gprefix)
	i = 0
	buf = []
	
	for o in subjects:
		subject = '{}/subject{}'.format(objRoot, i)
		
		buf.extend([
			'CREATE "{}" FROM "{}" AS "{}"'.format(o['object'], o['object'].split('/')[0].lower(),subject),
			'"{}" SET active false'.format(objRoot)
		])
		
		try:
			if o['class']:
				buf.extend([
					'"{}" ADD Segmentation.Entity Segmentation.Class'.format(subject),
					'"{}" SET Segmentation.Class className "{}"'.format(subject, o['class']),
				])
		except:
			pass
		
		try:
			if o['position']:
				buf.append('"{}" SET Transform position ({} {} {})'.format(subject, o['position'][0], o['position'][1], o['position'][2]))
		except:
			pass
		try:
			if o['rotation']:
				buf.append('"{}" SET Transform eulerAngles ({} {} {})'.format(subject, o['rotation'][0], o['rotation'][1], o['rotation'][2]))
		except:
			pass
		
		buf.append('"{}" SET active true'.format(subject))
		i += 1
	
	try:
		if rootObj['position']:
			buf.append('"{}" SET Transform position ({} {} {})'.format(objRoot, rootObj['position'][0], rootObj['position'][1], rootObj['position'][2]))
	except:
		pass
	try:
		if rootObj['rotation']:
			buf.append('"{}" SET Transform eulerAngles ({} {} {})'.format(objRoot, rootObj['rotation'][0], rootObj['rotation'][1], rootObj['rotation'][2]))
	except:
		pass
	
	buf.append('"{}" SET active true'.format(objRoot))
	
	common.sendData(buf, read=True)
