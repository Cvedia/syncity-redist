"""
This script generates a static gallery in html, that work locally straight from
disk without any server. This allows visualization of exported data, from several
cameras at the same time overlaying bounding boxes and other meta data.
"""
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
		lnm = os.path.basename(fn).lower()
		fty = None
		fts = os.path.getmtime(fn)
		
		if settings.log:
			common.output('Processing: {}'.format(lnm))
		
		if "camerargb" in lnm:
			fty = "rgb"
		elif "segmentation" in lnm:
			fty = "seg"
		elif "depth" in lnm:
			fty = "depth"
		elif "thermal" in lnm:
			fty = "thermal"
		elif ".json" in lnm:
			while has_attribute(fm, fts):
				fts += .000001
			fm[fts] = json.loads(common.read_all(fn))
		
		if fty == None:
			continue
		if fty not in features:
			features.append(fty)
		if not has_attribute(fc, fty):
			fc[fty] = {}
		while has_attribute(fc[fty], fts):
			fts += .000001
		
		fc[fty][os.path.getmtime(fn)] = os.path.basename(fn)
	
	if len(fm) > 0:
		features.append('bbox')
	
	total_images = 0
	for i in fc:
		if total_images > 0:
			total_images = min(total_images, len(fc[i]))
		else:
			total_images = len(fc[i])
	
	common.output('Generating html...')
	html = Template(common.read_all('{}index.tpl'.format(tpl_path)))
	
	js_static = ''
	for i in static_assets['js']:
		js_static += common.read_all('{}js/{}'.format(tpl_path, i))
	
	css_static = ''
	for i in static_assets['css']:
		css_static += common.read_all('{}css/{}'.format(tpl_path, i))
	
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
