import os
import syncity
import string
import random

from PIL import Image
from syncity import common, settings_manager

settings = settings_manager.Singleton()
settings.config = os.path.abspath('./config.json')
settings.skip_shutdown = True
settings._root = os.path.dirname(os.path.realpath(__file__))
settings._shutdown = False
settings._interactive = False
settings.loglevel = "NONE" # for quiet startup
settings.test = True

common.init()
common.loadConfig()
settings.force_sync = True

def telnet():
	return common.initTelnet(settings.ip, settings.port, return_fail=True)

def getRandStr(size=16, chars=string.ascii_uppercase + string.ascii_lowercase + string.digits + "()<>{}-_+ `~;.,!@#$%^='"):
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
