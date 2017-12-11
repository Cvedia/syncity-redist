import sys
import os
import telnetlib
import time
import atexit
import argparse
import platform
import random
import signal
import textwrap
import types
import json

from . import settings_manager
from datetime import datetime
from subprocess import PIPE, Popen, STDOUT

_start = False
_telnet = False
settings = False

def init_telnet(ip, port):
	global tn, _telnet
	
	output('Connecting to {}:{}...'.format(ip, port))
	
	try:
		tn = telnetlib.Telnet(ip, port)
		_telnet = True
	except Exception as e:
		output('Error connecting: {}'.format(e))
		sys.exit(1)
	
	output('Connected')

def init():
	global settings, _start
	
	_start = time.time()
	settings = settings_manager.Singleton()
	signal.signal(signal.SIGINT, gracefull_shutdown)
	atexit.register(gracefull_shutdown)

def output (s):
	print ('[{}] {}'.format(datetime.now().strftime("%H:%M:%S.%f"), s))

def send_data(v, read=None, flush=None):
	if settings.force_sync:
		read = True
	else:
		if read == None:
			if settings.async == True:
				read = False
			else:
				read = True
	
	if type(v) != list:
		v = [ v ]
	
	r = []
	
	for s in v:
		if settings.quiet == False:
			output('>> {}'.format(s))
		
		s = s.encode('ascii') + b"\n"
		
		if settings.record:
			settings.fh.write(s)
		
		tn.write(s)
		
		if read:
			l = tn.read_until(b"\r\n", 600)
			l = shape_data(l)
			r.append(l)
			
			# multi return hack, ideally first response would have a line count attached to it
			while True:
				l = shape_data(tn.read_eager())
				
				if l is '' or not l:
					break
				
				r.append(l)
			
			"""
			if flush:
				time.sleep(.5)
				l = tn.read_until(b"\r\n", 1)
				l = shape_data(l)
				
				if l != '':
					send_data('NOOP', read=True, flush=True)
			"""
	
	return r

def shape_data(l):
	try:
		# l = str(l).rstrip()
		l = str(l.decode('utf-8')).rstrip()
	except TypeError as e:
		output('Error {} decoding: {}'.format(e, l))
	
	if settings.quiet == False and l != '':
		output('<< {}'.format(l))
	
	return l

def gracefull_shutdown():
	output('Shutdown sequence...')
	
	if _telnet == True:
		if settings.keep == False:
			time.sleep(1)
			for o in settings.obj:
				send_data('DELETE {}'.format(o), read=False)
			
			flush_buffer()
			time.sleep(5)
		else:
			output('Keeping objects in scene')
		
		tn.close()
	
	output('Completed, wasted {}s ... BYE'.format(time.time() - _start))
	# sys.exit(0)

def flush_buffer():
	send_data('NOOP', read=True, flush=True)

def scripts_help():
	scripts = os.listdir('syncity/scripts/')
	output = []
	
	for s in scripts:
		if s != '__init__.py' and s != 'template.py' and s[-3:] != 'pyc':
			output.append('{}:'.format(s[:-3]))
			
			try:
				import_script = __import__('syncity.scripts.{}'.format(s[:-3]), fromlist=['syncity.scripts'])
				output.append(import_script.help())
			except:
				output.append('\tNo description')
	
	return '\nTo create a new script simply place it under syncity/scripts, follow the template.py for reference.\n\nScripts available:\n\n{}'.format('\n'.join(output))

class readable_dir(argparse.Action):
	def __call__(self, parser, namespace, values, option_string=None):
		prospective_dir=values
		if not os.path.isdir(prospective_dir):
			raise argparse.ArgumentTypeError("readable_dir:{0} is not a valid path".format(prospective_dir))
		if os.access(prospective_dir, os.R_OK):
			setattr(namespace,self.dest,prospective_dir)
		else:
			raise argparse.ArgumentTypeError("readable_dir:{0} is not a readable dir".format(prospective_dir))
