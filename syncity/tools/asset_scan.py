"""
Transverses unity asset files and save their flattened properties, this is not
always accurate but most of the time will allow one to directly use those
properties on api, as long a prefix is provided.
"""
import sys
import os
import time
import yaml
import json
import re

from .. import common, helpers, settings_manager
from datetime import datetime

settings = settings_manager.Singleton()

def help():
	return '''\
	Transverses unity asset files and save their flattened properties, this is not
	always accurate but most of the time will allow one to directly use those
	properties on api, as long a prefix is provided.
'''

def args(parser):
	parser.add_argument('--asset_file', help='Defines a filename to transverse')

def flatten_json(y, delim='.'):
	out = {}
	
	def flatten(x, name='', delim='.'):
		if type(x) is dict:
			for a in x:
				flatten(x[a], name + a + delim)
		elif type(x) is list:
			i = 0
			for a in x:
				flatten(a, name + str(i) + delim)
				i += 1
		else:
			out[name[:-1]] = x
	
	flatten(y, delim=delim)
	return out

def run():
	if not settings.asset_file:
		common.output('You must set --asset_file to run this tool')
		sys.exit(1)
		return
	
	data = []
	with open(settings.asset_file, 'r') as fr:
		data.append(fr.read().replace('\r', ''))
	data = ''.join(data)
	
	data = re.sub(r'---.*?\n', '', data)
	data = re.sub(r'%.*?\n', '', data)
	
	y = yaml.load(data)
	# print (json.dumps(y))
	
	if not y['MonoBehaviour']:
		common.output('Unknown asset type aborting')
		sys.exit(1)
		return
	
	fo = flatten_json(y['MonoBehaviour'])
	rfn = '{}asset_dump_{}.txt'.format(settings.local_path, settings._start)
	fh = open(rfn, 'wb+')
	dump = []
	for k in fo:
		dump.append('{} {}'.format(k, fo[k]))
	dump.sort()
	fh.write('\n'.join(dump).replace('m_Settings', 'settings').replace('m_Enabled', 'enabled').encode())
	fh.close()
	common.output('Completed dump, saved as {}'.format(rfn))
