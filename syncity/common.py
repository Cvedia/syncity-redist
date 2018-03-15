"""
Common static function repository for several internal functions to manage, connect and output data from the low level telnet procotol syncity api works on.

This functions are accessible from scripts / tools via `common.<function>`
"""

import sys
import os
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
import errno
import telnetlib
import socket
import colorama
import code

from . import settings_manager
from datetime import datetime
from subprocess import PIPE, Popen, STDOUT

_telnet = False
settings = False
counters = { 'send': 0, 'recv': 0, 'flush': 0 }

def init_telnet(ip, port, retries=3, wait=.5, timeout=30, ka_interval=3, ka_fail=10, ka_idle=1):
	"""
	Telnet initalizator
	
	# Arguments
	ip (string): Ip address of target machine
	port (int): Port of target machine, usually 10200
	retries (int): Retry connection if failed, defaults to 3
	wait (float): Time in seconds to wait between retries
	
	# Globals
	
	tn: Telnet instance
	_telnet (bool): Connection flag
	
	"""
	global tn, _telnet
	
	if _telnet == True:
		if settings.shutdown == True:
			return
		output('Connection is already active, trying to reconnect...')
		
		try:
			tn.close()
		except:
			pass
	
	retry = 0
	
	while retry < retries:
		output('Connecting to {}:{}...'.format(ip, port))
		
		try:
			tn = telnetlib.Telnet(ip, port, timeout)
			
			# set keep alive
			sock = tn.get_socket()
			
			if platform.system() == 'Windows':
				sock.ioctl(socket.SIO_KEEPALIVE_VALS, (1, ka_interval*1000, ka_fail*1000))
			elif platform.system() == 'Darwin':
				TCP_KEEPALIVE = 0x10
				sock.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)
				sock.setsockopt(socket.IPPROTO_TCP, TCP_KEEPALIVE, ka_interval)
			else:
				sock.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)
				sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPIDLE, ka_idle)
				sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPINTVL, ka_interval)
				sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPCNT, ka_fail)
			
			if settings.debug:
				tn.set_debuglevel(9)
			
			_telnet = True
			
			send_data(['VERSION', 'NOOP'], read=True)
			
			if settings.assets:
				send_data('API SET API.Manager assetsFolder "{}"'.format(settings.assets))
			if settings.disable_physics == False:
				send_data('API.Manager.instance SET physicsEnabled true')
			break
		except Exception as e:
			output('Error connecting: {}'.format(e), 'ERROR')
			retry += 1
			
			if retry >= retries:
				output('Ran out of retries, unable to connect. Aborting!')
				sys.exit(1)
			else:
				output('Waiting for retry #{} ...'.format(retry))
				time.sleep(wait)
	
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
	
	if settings.local_path:
		mkdir_p(settings.local_path)
	colorama.init()

def output(s, level='INFO'):
	"""
	Prints data to terminal with fancy formatting and ascii assurance.
	
	# Arguments
	s (string): output string
	level (string): log level
	"""
	
	if settings.no_color == True:
		x = '[{}] {}{}'.format(datetime.now().strftime("%H:%M:%S.%f"), '[{}] '.format(level), s)
	else:
		if level == 'INFO':
			level_color = colorama.Fore.GREEN
		elif level == 'ERROR':
			level_color = colorama.Fore.RED
		elif level == 'DEBUG':
			level_color = colorama.Fore.CYAN
		elif level == 'WARN' or level == 'WARNING':
			level_color = colorama.Fore.YELLOW
		else:
			level_color = colorama.Fore.MAGENTA
		
		x = '{}[{}] {} {}{}{}{}'.format(colorama.Style.RESET_ALL + colorama.Style.BRIGHT, datetime.now().strftime("%H:%M:%S.%f"), os.getpid(), level_color, '[{}] '.format(level), s, colorama.Style.RESET_ALL)
	
	print(x)
	
	if settings.log:
		try:
			if settings.no_color == False:
				settings.lfh.write(('[{}] {} {}{}'.format(datetime.now().strftime("%H:%M:%S.%f"), os.getpid(), '[{}] '.format(level), s)).encode('ascii') + b"\n")
			else:
				settings.lfh.write(x.encode('ascii') + b"\n")
		except:
			pass
	
	if settings.abort_on_error == True and (level == 'ERROR' or level == 'WARN' or level == 'WARNING'):
		output('Aborting on error!')
		sys.exit(1)
	
def send_data(v, read=None, flush=None, timeout=3):
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
	
	if settings.debug:
		counters['send'] += 1
		output('[{}] Telnet send_data v: {} read: {} flush: {}'.format(counters['send'], v, 'True' if read == True else 'False', 'True' if flush != None else 'False'))
	
	r = []
	
	for s in v:
		if len(s) == 0 or len(s.strip('\n\r ')) == 0:
			continue
		if settings.quiet == False:
			output('>> {}'.format(s))
		
		s = s.encode('ascii') + b"\r\n"
		
		if settings.record:
			settings.fh.write(s)
		
		if settings.debug:
			output('Telnet Writing: `{}` {} bytes'.format(s, len(s)), 'DEBUG')
		
		tn.write(s)
		
		abort = False
		
		if read:
			if settings.debug:
				counters['recv'] += 1
				output('[{}] Telnet Reading...'.format(counters['recv']), 'DEBUG')
			
			l = tn.read_until(b"\r\n", timeout)
			l = shape_data(l)
			
			if settings.abort_on_error == True and abort == False and 'ERROR' in l:
				abort = True
			
			r.append(l)
			
			# multi return hack, ideally first response would have a line count attached to it
			while True:
				if settings.debug:
					output('Telnet Read Loop... buffer: {}'.format(r), 'DEBUG')
				
				try:
					l = shape_data(tn.read_eager())
				except EOFError:
					output('Error reading data from socket, reconnecting...', 'ERROR')
					init_telnet(settings.ip, settings.port)
					break
				
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
	
	if settings.debug:
		output('Telnet Read Completed: {}'.format(r), 'DEBUG')
	if abort == True:
		output('Error received via telnet, aborting', 'ERROR')
	
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
		output('Error {} decoding: {}'.format(e, l), 'ERROR')
	
	if settings.quiet == False and l != '':
		output('<< {}'.format(l), 'WARN' if 'ERROR:' in l else 'INFO')
	
	return l

def gracefull_shutdown(a=None, b=None):
	"""
	Gracefully shutdown script execution:
		- Deletes all created objects (if enabled)
		- Waits for command buffer to flush
		- Gracefully closes telnet connection with server
		- Close any file pointers
		- Exits
	"""
	
	if settings.interactive:
		if settings._interactive == True:
			return
		settings._interactive = True
		code.interact(local=locals())
		return
	
	if settings.shutdown == True:
		output('Abort!')
		sys.exit(0)
		return
	
	settings.shutdown = True
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
		
		""""
		try:
			output('queueCount: {}'.format(send_data('API GET API.Manager queueCount', read=True)))
		except:
			pass
		"""
		
		try:
			tn.close()
		except:
			pass
	
	if settings.debug:
		output('Telnet sent: {} recv: {} flush: {}'.format(counters['send'], counters['recv'], counters['flush']), 'DEBUG')
	
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
	if settings.debug:
		counters['flush'] += 1
	
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

def find_arg_order(aargs, argv=sys.argv):
	order = []
	
	for i in argv:
		if i[0:1] != '-':
			continue
		for j in aargs:
			if i in j['args']:
				order.append(j['id'])
	
	return order

def mkdir_p(path):
	try:
		os.makedirs(path)
	except OSError as exc:
		if exc.errno == errno.EEXIST and os.path.isdir(path):
			pass
		else:
			raise

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
