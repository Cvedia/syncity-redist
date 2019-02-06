"""
This script generates a static gallery in html, that work locally straight from disk without any server. This allows visualization of exported data, from several cameras at the same time overlaying bounding boxes and other meta data.

## Running gallery generator

`python syncity.py -t gallery -l E:\syncity\exported_images`

## Options

- `--flat_gallery`: Creates a gallery ignoring filename prefixes, this disables the funcionality that aggregates several cameras from the same POV into a single bounding box output.
- `--no_invert_bboxx`: Exports from the simulator have the X axis inverted, this forces bounding box alignment to `top` instead of `bottom`.
- `--align`: Controls how the gallery aligns the images with bounding boxes in the file level, the possible options are:
	- `time`: Based on the timestamp of the image gallery will try to find the nearest timestamp match json file
	- `linear`: Assumes a simple relationship between the images and boundingbox json files: `image_abc.jpg` expects a `image_abc.json` with bounding box information.
	- `sequential`: (default) Assumes that the boundingbox filename counter will always match the image or images, this works with the aggregation system. For example: `123_rgb_camera.jpg`, `123_thermal_camera.jpg`, `123_segmentation_camera.png`, `123_depth_camera.tif` will all be aggregate to a `bbox_123.json` , since they match the same number, `123`.

## Notes:

- The `local_path` (`-l`) is where all your images and `.json` objects are, this script will combine both to generate a `.html` gallery that you can open in any browser.
- If the bounding box object dimensions contains  numbers greater than 1, the rendering layer will assume it's absolute and not relative position.
- Gallery will generate a standalone .html file that will includes the json objects embedded into the html, meaning that modifying or deleting the .json files will not affect the built gallery.
- This gallery works with both old and new ice based exports

## Notes in the new format:

This script expects filenames to follow `<object name><divider><timestamp>.<ext>` where divider can be null or a non a-Z0-9 string. Although it will try to resolve a full timestamp using different techniques, it will succeed as long there's a single floating point number in the filename string.

## Notes on graphs

As of 181120 this script will also generate generic graphs based in json files available in the folder. If parsable, and known data structure, gallery will generate a graph across <timestamp> of how this data behaves; if the data is linear it will give you a clear idea how vectors move across time, allowing a first look on how data is organized.

"""
import commentjson as json
import sys
import os
import time
import re
import copy

from .. import common, helpers, settings_manager
from datetime import datetime
from jinja2 import Template
from tqdm import tqdm

settings = settings_manager.Singleton()

tpl_path = 'syncity/tools/gallery/'
static_assets = {
	"css": [ "reset.css", "dygraph.css", "styles.css" ],
	"js": [ "jquery-3.1.1.min.js", "dygraph.min.js", "dygraph.synchronizer.js", "randomColor.js", "gallery.js" ]
}

def args(parser):
	try:
		parser.add_argument('--flat_gallery', action='store_true', default=False, help='Skips prefix guessing treating all images as an output from a single output.')
	except:
		pass
	try:
		parser.add_argument('--align', action='store', choices=['sequential', 'time', 'linear'], default='sequential', help='Defines alignment method, defaults to `sequential`.')
	except:
		pass
	try:
		parser.add_argument('--no_invert_bboxx', action='store_true', default=False, help='Skips prefix guessing treating all images as an output from a single output.')
	except:
		pass

def help():
	return '''\
	Creates a HTML gallery of the exported data
'''

def has_attribute(data, attribute):
	return attribute in data and data[attribute] is not None

def run():
	common.output('Generating gallery from {}...'.format(settings.local_path))
	iext = [ "jpg", "png", "tif", "tiff", "gif", "bmp" ]
	rfn = '{}___gallery_{}.html'.format(settings.local_path, settings._start)
	match_ts = r'(_|\s|\-)(\d+\.\d+|\d+)'
	fh = open(rfn, 'wb+')
	
	common.output('Collecting files...')
	fns = common.getAllFiles(settings.local_path, recursive=False)
	
	iFeatures = [] # image feature list
	jFeatures = [] # json feature list
	pFeatures = [] # points feature list
	fc = {} # categorized image filenames
	fm = {} # image meta data
	jm = {} # json/other meta data
	fmfn = {} # meta filenames
	spoints = {} # screenpoints meta data
	metadataCol = {} # metadata collection bags
	fi = len(fns)
	
	if fi == 0:
		common.output('No files found in {}'.format(settings.local_path))
		return
	
	common.output('Processing {} files...'.format(fi))
	
	try:
		os.stat_float_times(True)
	except:
		pass
	
	for fn in tqdm(fns):
		lnm = os.path.basename(fn).lower()
		fty = None # image feature type, eg: thermal, rgb, depth, etc
		
		ext = lnm.split(".")[-1:][0]
		isJSON = True if ext == 'json' else False
		isImage = True if ext in iext else False
		
		if not isJSON and not isImage:
			continue
		
		if settings.align == 'time':
			fts = os.path.getmtime(fn)
		elif settings.align == 'linear':
			fts = '.'.join(os.path.basename(fn).split('.')[:-1])
		elif settings.align == 'sequential':
			try:
				fts = re.findall(match_ts, lnm)[-1][-1:][0]
			except IndexError:
				common.output('Unable to find number on {}, skipping'.format(fn), 'WARNING')
				continue
		
		if settings.debug:
			common.output('Processing: {}'.format(lnm))
		
		fty = "default" if settings.flat_gallery == True else re.sub(match_ts, '', " ".join(lnm.split(".")[0:-1]))
		
		if isJSON:
			if 'lookup' in lnm:
				# skip lookups
				continue
			elif 'metadata' in lnm:
				# this is a collection of objects following a lookup key and misc data
				try:
					obj = common.loadJSON(fn)
				except:
					common.output('Invalid JSON data in {}'.format(fn), 'ERROR')
					continue
				
				metadataCol[fts] = copy.deepcopy(obj)
			elif "seg" in lnm or "bbox" in lnm:
				if settings.align == 'time':
					# HACK
					while has_attribute(fm, fts):
						fts += .000001
				
				try:
					jsonContents = common.loadJSON(fn)
					if isinstance(jsonContents, list):
						fm[fts] = jsonContents
					else:
						fm[fts] = jsonContents["boundingBoxes"]
					fmfn[fts] = fn
				except:
					common.output('Invalid JSON data in {}'.format(fn), 'ERROR')
			
			elif 'screenpoints' in lnm:
				try:
					point = common.loadJSON(fn)
				except:
					common.output('Invalid JSON data in {}'.format(fn), 'ERROR')
					continue
				
				if fty not in pFeatures:
					pFeatures.append(fty)
					spoints[fty] = {}
				
				val = json.loads(point.get('value'))
				spoints[fty][fts] = copy.deepcopy(val)
			
			else:
				try:
					obj = common.loadJSON(fn)
				except:
					common.output('Invalid JSON data in {}'.format(fn), 'ERROR')
					continue
				
				# HACK: Skip multi value objects, they cannot be graphed
				try:
					if obj.get('value') != None and isinstance(obj.get('value'), str) and (obj.get('value')[0] == '[' or obj.get('value')[0] == '{'):
						continue
						# test = common.loadJSONS(obj['value'])
						# obj['value'] = test
				except:
					pass
				
				if fty not in jFeatures:
					jFeatures.append(fty)
					jm[fty] = {}
				
				jm[fty][fts] = copy.deepcopy(obj)
				
				if settings.debug:
					common.output('Found JSON object in {} that\'s not linked to cameras, skipping'.format(fn), 'WARN')
			continue
		
		if fty not in iFeatures:
			iFeatures.append(fty)
		if not has_attribute(fc, fty):
			fc[fty] = {}
		if settings.align == 'time':
			while has_attribute(fc[fty], fts):
				fts += .000001
			
			fc[fty][os.path.getmtime(fn)] = os.path.basename(fn)
		else:
			fc[fty][fts] = os.path.basename(fn)
	
	if len(fm) > 0:
		iFeatures.append('bbox')
	
	total_images = 0
	
	for i in fc:
		if total_images > 0:
			total_images = min(total_images, len(fc[i]))
		else:
			total_images = len(fc[i])
	
	common.output('Generating html...')
	html = Template(common.readAll('{}index.tpl'.format(tpl_path)))
	
	js_static = ''
	for i in static_assets['js']:
		js_static += '// {}\n\n{}\n'.format(i, common.readAll('{}js/{}'.format(tpl_path, i)))
	
	css_static = ''
	for i in static_assets['css']:
		css_static += '// {}\n\n{}\n'.format(i, common.readAll('{}css/{}'.format(tpl_path, i)))
	
	fh.write(
		html.render(
			title='Gallery [{}]'.format(settings._start),
			js_static=js_static, css_static=css_static,
			iFeatures=iFeatures,
			jFeatures=jFeatures,
			pFeatures=pFeatures,
			metadataCol=metadataCol,
			fc=json.dumps(fc, sort_keys=True),
			fm=json.dumps(fm, sort_keys=True),
			jm=json.dumps(jm),
			fmfn=json.dumps(fmfn, sort_keys=True),
			total_images=total_images,
			invert_bboxx='false' if settings.no_invert_bboxx == True else 'true',
			spoints = json.dumps(spoints)
		).encode('utf-8') + b""
	)
	
	fh.close()
	
	common.output('Wrote {}'.format(rfn))
