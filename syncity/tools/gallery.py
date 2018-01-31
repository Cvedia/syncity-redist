import json
import sys
import os
import time

from .. import common, helpers, settings_manager
from datetime import datetime
from jinja2 import Template

settings = settings_manager.Singleton()

tpl_path = 'syncity/tools/gallery/'
static_assets = {
	"css": [ "reset.css", "styles.css" ],
	"js": [ "jquery-3.1.1.min.js", "gallery.js" ]
}

def help():
	return '''\
	Creates a HTML gallery of the exported data
'''

def has_attribute(data, attribute):
	return attribute in data and data[attribute] is not None

def run():
	common.output('Generating gallery from {}...'.format(settings.local_path))
	
	rfn = '{}___gallery_{}.html'.format(settings.local_path, settings._start)
	fh = open(rfn, 'wb+')
	fns = common.get_all_files(settings.local_path, recursive=False)
	features = [] # feature list
	fc = {} # categorized filenames
	fm = {} # meta filenames
	fi = len(fns)
	
	if fi == 0:
		common.output('No files found in {}'.format(settings.local_path))
		return
	
	common.output('Processing {} files...'.format(fi))
	
	os.stat_float_times(True)
	for fn in fns:
		lnm = fn.lower()
		fty = None
		
		if "camerargb" in lnm:
			fty = "rgb"
		elif "segmentation" in lnm:
			fty = "seg"
		elif "depth" in lnm:
			fty = "depth"
		elif "thermal" in lnm:
			fty = "thermal"
		elif ".json" in lnm:
			fm[os.path.getmtime(fn)] = json.loads(common.read_all(fn))
		
		if fty == None:
			continue
		if fty not in features:
			features.append(fty)
		if not has_attribute(fc, fty):
			fc[fty] = {}
		
		fc[fty][os.path.getmtime(fn)] = os.path.basename(fn)
	
	if len(fm) > 0:
		features.append('bbox')
	for i in fc:
		total_images = len(fc[i])
		break
	
	common.output('Generating html...')
	html = Template(common.read_all('{}index.tpl'.format(tpl_path)))
	
	js_static = ''
	for i in static_assets['js']:
		js_static += common.read_all('{}js/{}'.format(tpl_path, i))
	
	css_static = ''
	for i in static_assets['css']:
		css_static += common.read_all('{}css/{}'.format(tpl_path, i))
	
	# html = html.replace('#fc#', json.dumps(fc, sort_keys=True)).replace('#fm#', json.dumps(fm, sort_keys=True))
	
	fh.write(
		html.render(
			title='Gallery',
			js_static=js_static, css_static=css_static, features=features,
			fc=json.dumps(fc, sort_keys=True),
			fm=json.dumps(fm, sort_keys=True),
			total_images=total_images
		).encode('utf-8') + b""
	)
	fh.close()
	
	common.output('Wrote {}'.format(rfn))
