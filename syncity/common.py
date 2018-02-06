"""
Common static function repository for several internal functions to manage, connect and output data from the low level telnet procotol syncity api works on.

This functions are accessible from scripts / tools via `common.<function>`
"""
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
import re
import hashlib

from . import settings_manager
from datetime import datetime
from subprocess import PIPE, Popen, STDOUT

_telnet = False
settings = False

def init_telnet(ip, port):
	"""
	Telnet initalizator
	
	# Arguments
	ip (string): Ip address of target machine
	port (int): Port of target machine, usually 10200
	
	# Globals
	
	tn: Telnet instance
	_telnet (bool): Connection flag
	
	"""
	global tn, _telnet
	
	output('Connecting to {}:{}...'.format(ip, port))
	
	try:
		tn = telnetlib.Telnet(ip, port)
		_telnet = True
		
		send_data('NOOP', read=True)
		
		if settings.assets:
			send_data('API SET API.Manager assetsFolder "{}"'.format(settings.assets))
	except Exception as e:
		output('Error connecting: {}'.format(e))
		sys.exit(1)
	
	output('Connected')

def init():
	"""
	Initialize settings manager and gracefull shutdown functions
	
	# Globals
	
	settings: Instance of settings_manager singleton
	"""
	global settings
	
	settings = settings_manager.Singleton()
	signal.signal(signal.SIGINT, gracefull_shutdown)
	atexit.register(gracefull_shutdown)

def output (s):
	"""
	Prints data to terminal with fancy formatting and ascii assurance.
	
	# Arguments
	s (string): output string
	"""
	
	x = '[{}] {}'.format(datetime.now().strftime("%H:%M:%S.%f"), s)
	print (x)
	
	if settings.log:
		settings.lfh.write(x.encode('ascii') + b"\n")

def send_data(v, read=None, flush=None):
	"""
	Sends data via telnet to the server
	
	# Arguments
	
	v (list|string): Command or multiple commands to be sent to the server
	read (bool): Waits for a confirmation from server for each command been executed/queued (this greatly slows down execution)
	
	# Returns
	
	string: Reply from server or raw data
	"""
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

def md5(fname):
	"""
	Creates a md5 hash from a file name
	
	# Attributes
	
	fname (string): Path to file
	
	# Returns
	
	string: md5 hash
	"""
	
	hash_md5 = hashlib.md5()
	with open(fname, "rb") as f:
		for chunk in iter(lambda: f.read(4096), b""):
			hash_md5.update(chunk)
	return hash_md5.hexdigest()

def ts_write(fh, x):
	"""
	Prepends timestamp a string and appends it to a file pointer
	
	# Attributes
	
	fh (file handle): File handle of a previously open file to write to
	x (string): Data to be written
	
	"""
	fh.write('[{}] {}'.format(datetime.now().strftime("%H:%M:%S.%f"), x).encode('utf-8') + b"\n")

def shape_data(l):
	"""
	Properly shapes raw data returned from low level telnet protocol into strings or json objects
	
	# Attributes
	
	l (string|buffer): Raw data
	
	# Raises
	
	TypeError: If invalid data type sent
	
	# Returns
	
	string: UTF-8 Data
	"""
	try:
		# l = str(l).rstrip()
		l = str(l.decode('utf-8')).rstrip()
	except TypeError as e:
		output('Error {} decoding: {}'.format(e, l))
	
	if settings.quiet == False and l != '':
		output('<< {}'.format(l))
	
	return l

def gracefull_shutdown():
	"""
	Gracefully shutdown script execution:
		- Deletes all created objects (if enabled)
		- Waits for command buffer to flush
		- Gracefully closes telnet connection with server
		- Close any file pointers
		- Exits
	"""
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
	
	output('Completed, wasted {}s ... BYE'.format(time.time() - settings._start))
	
	try:
		if settings.record:
			settings.fh.close()
	except:
		pass
	
	try:
		if settings.log:
			settings.lfh.close()
	except:
		pass

def flush_buffer():
	"""
	Forces a telnet command read by sending NOOP
	"""
	send_data('NOOP', read=True, flush=True)

def modules_help(module):
	"""
	Transverses existing modules searching for help sections
	
	# Attributes
	
	module (string): Module name (must match the filename from module path)
	
	# Returns
	
	string: Shaped string with help method outpus from module
	"""
	scripts = os.listdir('syncity/{}/'.format(module))
	output = []
	
	for s in scripts:
		if s[:2] != '__' and s != 'template.py' and s[-3:] != 'pyc':
			output.append('\t{}:'.format(s[:-3]))
			
			try:
				import_script = __import__('syncity.{}.{}'.format(module,s[:-3]), fromlist=['syncity.{}'.format(module)])
				hl = import_script.help()
				hl = re.sub(r'^', '\t\t', hl).replace('\n', '\n\t')
				output.append(hl)
			except:
				output.append('\tNo description')
	
	return '\n'.join(output)

def modules_args(module, parser):
	"""
	Transverses existing modules searching for command line arguments
	
	# Attributes
	
	module (string): Module name (must match the filename from module path)
	
	# Returns
	
	string: Shaped string with help method outpus from module
	"""
	scripts = os.listdir('syncity/{}/'.format(module))
	
	for s in scripts:
		if s[:2] != '__' and s != 'template.py' and s[-3:] != 'pyc':
			try:
				import_script = __import__('syncity.{}.{}'.format(module,s[:-3]), fromlist=['syncity.{}'.format(module)])
				import_script.args(parser)
			except:
				pass

def local_time_offset(t=None):
	"""
	Figures out local timezone
	"""
	if t is None:
		t = time.time()
	
	if time.localtime(t).tm_isdst and time.daylight:
		return -time.altzone
	else:
		return -time.timezone

def read_all(fn):
	with open(fn, "r") as fh:
		data = fh.read()
	return data

def get_all_files(base, ignore_path=['.git', '__pycache__'], ignore_ext=['.md', 'pyc'], recursive=True):
	"""
	Recursively lists all files from a folder
	
	# Arguments
	
	base (string): Base path
	ignore_path (list): Paths to ignore
	ignore_ext (list): Extensions to ignore
	recursive (bool): Disables / enables recursion for subfolders, defaults to `True`
	
	# Returns
	
	list: All files found filtered by specified criteria
	
	"""
	if type(base) != list:
		base = [ base ]
	fns = []
	
	for path in base:
		if os.path.isfile(path):
			if path not in fns:
				fns.append(path)
		else:
			for folder, subdirs, files in os.walk(path):
				if os.path.basename(folder) in ignore_path:
					break
				if recursive == False and folder != path:
					continue
				
				for fn in files:
					if fn[-3:] not in ignore_ext:
						jp = os.path.join(folder, fn)
						if recursive == True and jp not in fns:
							fns.append(jp)
						elif os.path.isfile(jp) and jp not in fns:
							fns.append(jp)
				
				if recursive == True:
					for subdir in subdirs:
						jp = os.path.join(folder, subdir)
						if jp not in base:
							base.append(jp)
	
	return fns

class readable_dir(argparse.Action):
	def __call__(self, parser, namespace, values, option_string=None):
		prospective_dir=values
		if not os.path.isdir(prospective_dir):
			raise argparse.ArgumentTypeError("readable_dir:{0} is not a valid path".format(prospective_dir))
		if os.access(prospective_dir, os.R_OK):
			setattr(namespace,self.dest,prospective_dir)
		else:
			raise argparse.ArgumentTypeError("readable_dir:{0} is not a readable dir".format(prospective_dir))
