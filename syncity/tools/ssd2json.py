import json
import sys
import os
import time
import math

from .. import common, helpers, settings_manager

def args(parser):
	try:
		parser.add_argument('--image_list', help='Sets a path for the image list to be processed.')
	except:
		pass

settings = settings_manager.Singleton()

def help():
	return '''\
	Converts a SSD detection output to json format the gallery understands
'''

def run():
	common.output("Reading image list: {}".format(settings.image_list))
	
	# build a dictionary of images
	with open(settings.image_list, encoding="utf-8") as file:
		lines = [l.strip() for l in file]
	images = {}
	
	for l in lines:
		images[l] = []
	
	common.output("Reading detection output: {}".format(settings.output_path))
	with open(settings.output_path, encoding="utf-8") as file:
		lines = [l.strip() for l in file]
	
	common.output("Converting...")
	i = 0
	for l in lines:
		# 0 = filename
		# 1 = classid
		# 2 = confidence
		# 3 = bbox x1
		# 4 = bbox y1
		# 5 = bbox x2
		# 6 = bbox y2
		# 7 = ?
		# 8 = ?
		# filename 3 0.416026 141 233 178 267 85294 107734
		l = l.split(' ')
		try:
			images[l[0]].append('{{"id": {}, "classId": {}, "boxMin": [{}, {}], "boxMax": [{}, {}], "confidence": {}, "numpoints": {}}}'.format(
				i,
				int(l[1]),
				l[3], l[4], # bbox min, x1, y1
				l[5], l[6],
				l[2], math.abs(l[4]-l[3]) * math.abs(l[6]-l[5])
			))
		except:
			common.output('Error converting image: {}'.format(l[0]), 'WARNING')
			pass
		
		i += 1
	
	common.output("Generating files...")
	for key, value in images.items():
		bbox = '[{}]'.format(','.join(value))
		
		jfn = key.split('.')
		jfn[-1] = 'json'
		jfn = '.'.join(jfn)
		
		# common.output('Writing: {} to {}'.format(bbox, jfn), 'DEBUG')
		
		with open(jfn, 'w') as fp:
			fp.write(bbox)
	
	common.output("Generated {} files".format(i))
	
