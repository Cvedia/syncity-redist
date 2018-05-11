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
import json
import types
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

settings = False

def initTelnet(ip, port, retries=3, wait=.5, timeout=30, ka_interval=3, ka_fail=10, ka_idle=1, return_fail=False):
	"""
	Telnet initalizator
	
	# Arguments
	ip (string): Ip address of target machine
	port (int): Port of target machine, usually `10200`
	retries (int): Retry connection if failed, defaults to `3`
	wait (float): Time in seconds to wait between retries, defaults to `.5`
	timeout(float): Timeout in seconds for socket connection, defaults to `30`
	ka_interval (float): Keep alive interval in seconds, defaults to `3`
	ka_fail (int): Max number of failed keep alive packages to consider a fail, defaults to `10`
	ka_idle (int): Send keep alives when idle to keep connection alive, defaults to `1`
	return_fail (bool): Return bool instead of sys.exit when critical errors happens, defaults to `False`
	
	"""
	if settings.dry_run:
		return False
	
	if settings._telnet == True:
		if settings._shutdown == True:
			return False
		elif settings._tn != None and settings._telnet == True and settings.test == True:
			return True
		
		output('Connection is already active, trying to reconnect...')
		
		try:
			settings._tn.close()
		except:
			pass
		
		settings._tn = None
	
	retry = 0
	
	while retry < retries:
		output('Connecting to {}:{}...'.format(ip, port))
		
		try:
			settings._tn = telnetlib.Telnet(ip, port, timeout)
			
			# set keep alive
			sock = settings._tn.get_socket()
			
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
				settings._tn.set_debuglevel(9)
			
			settings._telnet = True
			output('Connected')
			settings._simulator_version = sendData(['VERSION', 'NOOP'], read=True)[0].replace('"', '')
			output('Simulator Version: {}'.format(settings._simulator_version))
			
			if settings.test == False:
				if settings.version == True:
					output('SDK Version: {}'.format(settings._version))
					sys.exit(0)
				
				if int(settings._simulator_version.replace('.', '')[0:10]) < int(settings._simulator_min_version.replace('.', '')[0:10]):
					output('The version of the simulator you\'re connecting with is deprecated and most likely not compatible with the version of this SDK.', 'ERROR', permissive=True)
					output('You should use a old branch of the SDK or update the simulator.', 'ERROR', permissive=True)
					output('SDK minimum supported simulator version: {}'.format(settings._simulator_min_version), 'ERROR', permissive=True)
					output('Simulator version: {}'.format(settings._simulator_version), 'ERROR', permissive=True)
			
			if settings.skip_init == True:
				ouptut('Skipping init sequence')
			else:
				output('Init sequence...')
				
				if settings.assets:
					sendData('"Config.instance" SET assetBundlesCache "{}"'.format(settings.assets))
				
				if settings.db:
					sendData('"Config.instance" SET databaseFolderPath "{}"'.format(settings.db))
				elif settings.assets:
					sendData('"Config.instance" SET databaseFolderPath "{}"'.format(settings.assets))
				
				"""
				sendData([
					'"Config.instance" SET physicsEnabled {}'.format('false' if settings.enable_physics == False else 'true'),
					'"Canvas/ConsolePanel" SET active {}'.format('false' if settings.enable_console_log == False else 'true'),
					'{}'.format('DELETE "Canvas"' if settings.enable_canvas == False else '')
				])
				"""
				
				sendData('"Config.instance" SET physicsEnabled {}'.format('false' if settings.enable_physics == False else 'true'))
				
				if settings.seed_api:
					setAPISeed(settings.seed_api)
			break
		except Exception as e:
			output('Error connecting: {}'.format(e), 'ERROR', permissive=True)
			retry += 1
			
			if retry >= retries:
				output('Ran out of retries, unable to connect. Aborting!', 'ERROR')
				
				if return_fail:
					return False
				
				sys.exit(1)
			else:
				output('Waiting for retry #{} ...'.format(retry))
				time.sleep(wait)
	
	flushBuffer()
	return True

def setAPISeed(seed):
	sendData('"RandomProps.Random.instance" SET seed {}'.format(seed))

def resetSimulator():
	"""
	Resets simulator and reconnects to telnet
	
	"""
	if settings._telnet == True:
		output('Resetting simulator...')
		settings.obj = []
		sendData('RESET', read=True, flush=True)
		
		try:
			settings._tn.close()
		except:
			pass
		
		settings._tn = None
		settings._telnet = False
		time.sleep(5)
		
		output('Reconnecting...')
		initTelnet(settings.ip, settings.port, retries=10)
	else:
		raise 'No active telnet connection!'

def init():
	"""
	Initialize settings manager and gracefull shutdown functions
	
	# Globals
	
	settings: Instance of settings_manager singleton
	"""
	global settings
	
	settings = settings_manager.Singleton()
	
	settings._telnet = False
	settings._counters = { 'send': 0, 'recv': 0, 'flush': 0 }
	
	if settings.skip_shutdown == False:
		signal.signal(signal.SIGINT, gracefullShutdown)
		atexit.register(gracefullShutdown)
	
	if settings.local_path:
		mkdirP(settings.local_path)
	
	colorama.init()

def init2():
	if settings.nohead:
		head=None
	else:
		head = '// SDK v{}'.format(settings._version).encode('ascii') + b"\r\n"
		head += '// ARGV {}'.format(' '.join(sys.argv)).encode('ascii') + b"\r\n"
		# print(settings.getData())
		head += '// SETTINGS {}'.format(json.dumps(settings.getData())).encode('ascii') + b"\r\n"
	
	init_logging(head)
	
	if settings.run != None or settings.script != None or settings.test == True:
		init_recording(head)

def init_logging(head=None):
	if settings.log == None:
		settings.log = '{}log_{}.txt'.format(settings.local_path, settings._start)
	if settings.log:
		settings._lfh = open(settings.log, 'wb+')
		
		if head != None:
			settings._lfh.write(head)

def init_recording(head=None):
	if settings.record == None:
		settings.record = '{}record_{}.txt'.format(settings.local_path, settings._start)
	if settings.record:
		settings._rfh = open(settings.record, 'wb+')
		
		if head != None:
			settings._rfh.write(head)

def close_logging():
	if settings.log == None:
		return
	try:
		settings._lfh.write('// Completed in {:6.4f}s'.format(time.time() - settings._start))
		settings._lfh.close()
	except:
		pass
	
	settings.log = None

def close_recording():
	if settings.record == None:
		return
	try:
		settings._rfh.write('// Completed in {:6.4f}s'.format(time.time() - settings._start))
		settings._rfh.close()
	except:
		pass
	
	settings.record = None

def shouldLog(level):
	l = {
		'NONE': 0,
		'ERROR': 1,
		'ERR': 1,
		'WARNING': 2,
		'WARN': 2,
		'INFO': 4,
		'DEBUG': 8,
		'TRACE': 16
	}
	
	try:
		if l[settings.loglevel] >= l[level]:
			return True
	except:
		pass
	
	return False

def output(s, level='INFO', permissive=False):
	"""
	Prints data to terminal with fancy formatting and ascii assurance.
	
	# Arguments
	s (string): output string
	level (string): log level
	
	# Note
	
	This function is subject to `settings.loglevel`, if the `level` is lower
	than the desired, it will be skipped.
	
	"""
	if shouldLog(level) == False:
		return
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
				settings._lfh.write(('[{}] {} {}{}'.format(datetime.now().strftime("%H:%M:%S.%f"), os.getpid(), '[{}] '.format(level), s)).encode('ascii') + b"\n")
			else:
				settings._lfh.write(x.encode('ascii') + b"\n")
		except:
			pass
	
	if permissive == False and settings.abort_on_error == True and (level == 'ERROR' or level == 'WARN' or level == 'WARNING'):
		output('Aborting on error!')
		sys.exit(1)
	
def sendData(v, read=None, flush=None, timeout=3):
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
		settings._counters['send'] += 1
		output('[{}] Telnet sendData v: {} read: {} flush: {}'.format(settings._counters['send'], v, 'True' if read == True else 'False', 'True' if flush != None else 'False'))
	r = []
	abort = False
	
	for s in v:
		s = re.sub(r'\s{2,}', ' ', s.strip('\n\r').replace('\t', ' '))
		
		if len(s) == 0 or len(s.strip(' ')) == 0:
			continue
		if s[0:2] == '//' or s[0:2] == '--':
			if settings.quiet == False:
				output('>> {}'.format(s), 'DEBUG')
			continue
		if settings.quiet == False:
			output('>> {}'.format(s))
		
		s = s.encode('ascii') + b"\r\n"
		
		if settings.record:
			settings._rfh.write(s)
		
		if settings.debug:
			output('Telnet Writing: `{}` {} bytes'.format(s, len(s)), 'DEBUG')
		
		if settings.benchmark:
			settings._benchts = time.time()
		if settings.dry_run:
			continue
		
		try:
			settings._tn.write(s)
		except:
			pass
		
		abort = False
		
		if read:
			if settings.debug:
				settings._counters['recv'] += 1
				output('[{}] Telnet Reading...'.format(settings._counters['recv']), 'DEBUG')
			
			l = settings._tn.read_until(b"\r\n", timeout)
			l = shapeData(l)
			
			if settings.abort_on_error == True and abort == False and 'ERROR' in l:
				abort = True
			
			if isinstance(l, list):
				r.extend(l)
			else:
				r.append(l)
			
			# multi return hack, ideally first response would have a line count attached to it
			while True:
				if settings.debug:
					output('Telnet Read Loop... buffer: {}'.format(r), 'DEBUG')
				
				try:
					l = shapeData(settings._tn.read_eager())
				except EOFError:
					output('Error reading data from socket, reconnecting...', 'ERROR')
					initTelnet(settings.ip, settings.port)
					break
				
				if l is '' or not l:
					break
				
				if isinstance(l, list):
					r.extend(l)
				else:
					r.append(l)
			
			"""
			if flush:
				time.sleep(.5)
				l = settings._tn.read_until(b"\r\n", 1)
				l = shapeData(l)
				
				if l != '':
					sendData('NOOP', read=True, flush=True)
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

def tsWrite(fh, x):
	"""
	Prepends timestamp a string and appends it to a file pointer
	
	# Attributes
	
	fh (file handle): File handle of a previously open file to write to
	x (string): Data to be written
	
	"""
	fh.write('[{}] {}'.format(datetime.now().strftime("%H:%M:%S.%f"), x).encode('utf-8') + b"\n")

def shapeData(l):
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
		l = str(l.decode('utf-8')).rstrip()
	except TypeError as e:
		output('Error {} decoding: {}'.format(e, l), 'ERROR')
	
	if settings.quiet == False and l != '':
		f = l
		try:
			if settings.benchmark and isinstance(settings._benchts, float):
				f = '[{:7.4f}s] {}'.format(time.time() - settings._benchts, l)
		except:
			f = l
			pass
		
		output('<< {}'.format(f), 'WARN' if 'ERROR:' in l else 'INFO')
	
	if "\r\n" in l:
		try:
			x = l.split("\r\n")
			l = x
		except:
			pass
	
	return l

def gracefullShutdown(a=None, b=None):
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
	
	if settings._shutdown == True:
		output('Abort!')
		sys.exit(0)
		return
	
	settings._shutdown = True
	output('Shutdown sequence...', 'DEBUG')
	
	if settings.save_config:
		saveConfig()
	
	if settings._telnet == True:
		if settings.keep == False:
			time.sleep(1)
			
			try:
				for o in settings.obj:
					sendData('DELETE "{}"'.format(o), read=False)
				
				flushBuffer()
				time.sleep(5)
			except:
				pass
		else:
			output('Keeping objects in scene', 'DEBUG')
		
		""""
		try:
			output('queueCount: {}'.format(sendData('API GET API.Manager queueCount', read=True)))
		except:
			pass
		"""
		
		try:
			settings._tn.close()
		except:
			pass
	
	settings._tn = None
	if settings.debug:
		output('Telnet sent: {} recv: {} flush: {}'.format(settings._counters['send'], settings._counters['recv'], settings._counters['flush']), 'DEBUG')
	
	try:
		if settings.record:
			output('Recorded to: `{}`'.format(settings._rfh.name))
			close_recording()
	except:
		pass
	
	try:
		if settings.log:
			output('Logged to: `{}`'.format(settings._lfh.name))
			close_logging()
	except:
		pass
	
	output('Completed, wasted {:6.4f}s ... BYE'.format(time.time() - settings._start))

def flushBuffer():
	"""
	Forces a telnet command read by sending NOOP
	"""
	if settings.dry_run:
		return
	if settings.debug:
		settings._counters['flush'] += 1
	
	sendData('NOOP', read=True, flush=True)

def modulesHelp(module):
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

def modulesArgs(module, parser):
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

def loadConfig():
	if not os.path.isfile(settings.config):
		return
	
	output('Loading config from: `{}` ...'.format(settings.config))
	
	with open(settings.config, encoding='utf-8') as data:
		cfg = json.loads(data.read())
	
	for c in cfg:
		if settings.isset(c) == False:
			settings[c] = cfg[c]

def saveConfig():
	output('Saving config to: `{}` ...'.format(settings.config))
	data = settings.getData()
	
	with open(settings.config, "w", encoding='utf-8') as fh:
		fh.write(json.dumps(data, indent=4, sort_keys=True))

def runCL(path):
	"""
	Runs an arbitrary CL script
	
	# Arguments
	
	path (string): Path to file
	
	# Note
	
	This function support `#include "<path/to/cl>"` where path is relative to the initial path
	
	"""
	if os.path.exists(path):
		e = r'^\#include "(.*?)"'
		
		with open(path) as fp:
			for line in fp:
				if re.match(e, line) != None:
					output('Loading CL include from `{}`'.format(line), 'DEBUG')
					runCL(re.sub(e, lambda match: '{}/{}'.format(os.path.dirname(path), match.group(1)), line.strip('\n\r')))
				else:
					sendData(line)
		flushBuffer()
	else:
		raise Exception('File `{}` doesn\'t exists!'.format(path))

def localTimeOffset(t=None):
	"""
	Figures out local timezone
	"""
	if t is None:
		t = time.time()
	
	if time.localtime(t).tm_isdst and time.daylight:
		return -time.altzone
	else:
		return -time.timezone

def readAll(fn):
	with open(fn, "r") as fh:
		data = fh.read()
	return data

def argExists(aargs, argv=sys.argv):
	for i in argv:
		if i[0:1] != '-':
			continue
		if i in aargs:
			return True
	return False

def findArgOrder(aargs, argv=sys.argv):
	order = []
	
	for i in argv:
		if i[0:1] != '-':
			continue
		for j in aargs:
			if i in j['args']:
				order.append(j['id'])
	
	return order

def mkdirP(path):
	try:
		os.makedirs(path)
	except OSError as exc:
		if exc.errno == errno.EEXIST and os.path.isdir(path):
			pass
		else:
			raise

def waitQueue(threshold=0, wait=3):
	"""
	Blocks new CL commands until queue is above a threshold.
	
	# Arguments
	
	threshold (int): Maximum items on queue, defaults to `0`
	wait (int): Time in seconds to wait until asking again, defaults to `3`
	
	"""
	
	if settings._tn == None:
		return
	
	flushBuffer()
	
	b = False
	while b == False:
		res = sendData('"API" GET API.Manager queueCount', read=True)
		for r in res:
			s = str(r).lower()
			
			if s == 'ok' or 'error' in s:
				continue
			
			q = int(s)
			
			if q <= threshold:
				b = True
				break
			
			output('Waiting for queue to flush, {} pending...'.format(q))
		
		if b == False:
			time.sleep(wait)


def getAllFiles(base, ignore_path=['.git', '__pycache__'], ignore_ext=['.md', 'pyc'], recursive=True):
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

class readableDir(argparse.Action):
	def __call__(self, parser, namespace, values, option_string=None):
		prospective_dir=values
		if not os.path.isdir(prospective_dir):
			raise argparse.ArgumentTypeError("readableDir:{0} is not a valid path".format(prospective_dir))
		if os.access(prospective_dir, os.R_OK):
			setattr(namespace,self.dest,prospective_dir)
		else:
			raise argparse.ArgumentTypeError("readableDir:{0} is not a readable dir".format(prospective_dir))
