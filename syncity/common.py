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
import commentjson as json
import json as json_alt
import types
import re
import hashlib
import errno
import telnetlib
import socket
import colorama
import code
import uuid

from . import settings_manager
from datetime import datetime
from subprocess import PIPE, Popen, STDOUT

settings = False

export2list = {
	"ReadFieldLink": "fieldLinks",
	"ImageExportLink": "imageLinks",
	"VideoExportLink": "videoLinks"
}

def initTelnet(ip, port, retries=-1, wait=.5, timeout=30, ka_interval=3, ka_fail=10, ka_idle=1, return_fail=False):
	"""
	Telnet initalizator
	
	# Arguments
	ip (string): Ip address of target machine
	port (int): Port of target machine, usually `10200`
	retries (int): Retry connection if failed, defaults to `-1`, when negative will retry forever
	wait (float): Time in seconds to wait between retries, defaults to `.5`
	timeout(float): Timeout in seconds for socket connection, defaults to `30`
	ka_interval (float): Keep alive interval in seconds, defaults to `3`
	ka_fail (int): Max number of failed keep alive packages to consider a fail, defaults to `10`
	ka_idle (int): Send keep alives when idle to keep connection alive, defaults to `1`
	return_fail (bool): Return bool instead of sys.exit when critical errors happens, defaults to `False`
	
	"""
	if settings.dry_run:
		os.environ['SYNCITY_VERSION'] = settings._simulator_version = "99.00.00.0000"
		initSequence()
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
	
	while retries < 0 or retry < retries:
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
			else: # linux
				sock.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)
				sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPIDLE, ka_idle)
				sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPINTVL, ka_interval)
				sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPCNT, ka_fail)
			
			if settings.debug:
				settings._tn.set_debuglevel(9)
			
			settings._telnet = True
			output('Connected')
			
			# find version
			try:
				settings._simulator_version = re.findall(r'\d{2}.\d{2}.\d{2}.\d{4}', sendData(['VERSION', 'NOOP'], read=True)[0])[0]
			except IndexError:
				output('Your simulator is deprecated / version unknown', 'WARNING')
				settings._simulator_version = '18.01.01.0000'
			
			output('Simulator Version: {}'.format(settings._simulator_version))
			
			if settings.test == False:
				os.environ['SYNCITY_VERSION'] = settings._simulator_version
				if settings.version == True:
					output('SDK Version: {}'.format(settings._version))
					sys.exit(0)
				
				if versionCompare(settings._simulator_version, settings._simulator_min_version, '<'):
					output('The version of the simulator you\'re connecting with is deprecated and most likely not compatible with the version of this SDK.', 'ERROR', permissive=True)
					output('You should use a old branch of the SDK or update the simulator.', 'ERROR', permissive=True)
					output('SDK minimum supported simulator version: {}'.format(settings._simulator_min_version), 'ERROR', permissive=True)
					output('Simulator version: {}'.format(settings._simulator_version), 'ERROR', permissive=True)
			
			if settings.skip_init == True:
				ouptut('Skipping init sequence')
			else:
				initSequence()
			break
		except Exception as e:
			output('Error connecting: {}'.format(e), 'ERROR', permissive=True)
			retry += 1
			
			if retries > 0 and retry >= retries:
				output('Ran out of retries, unable to connect. Aborting!', 'ERROR')
				
				if return_fail:
					return False
				
				sys.exit(1)
			else:
				output('Waiting for retry #{} ...'.format(retry))
				time.sleep(wait)
	
	flushBuffer()
	return True

def initSequence():
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
	
	if settings.disable_reflections or versionCompare(settings._simulator_version, '18.08.10.0000', '<'):
		sendData('"Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler disableProbesRendering true')
	else:
		sendData('"Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler drawThermalOnly false disableProbesRendering false')
	
	sendData('"Config.instance" SET physicsEnabled {}'.format('false' if settings.enable_physics == False else 'true'))
	
	if settings.seed_api:
		setAPISeed(settings.seed_api)
	if settings.layout != None:
		loadLayout(settings.layout)

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
	settings._seqSave = {}
	
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
		head = [
			'// SDK v{}'.format(settings._version),
			'// ARGV {}'.format(' '.join(sys.argv)),
			'// SETTINGS {}'.format(json.dumps(settings.getData()))
		]
		
		# This may contain sensitive information, we only collect it on test mode
		try:
			if settings.test == True:
				head.append('// ENV {}'.format(json.dumps(os.environ.__dict__)))
		except:
			pass
	
	init_logging(head)
	init_recording(head)

def init_logging(head=None):
	if settings.log == None:
		base = os.path.join(settings._root, 'logs') if settings.log_path == None else settings.log_path
		output('Logging to: {}'.format(base), 'DEBUG')
		mkdirP(base)
		settings.log = os.path.join(base, 'log_{}.txt'.format(settings._start))
	if settings.log:
		settings._lfh = open(settings.log, 'wb+')
		
		if head != None:
			logS(head)

def init_recording(head=None):
	if settings.record == None:
		base = os.path.join(settings._root, 'records') if settings.log_path == None else settings.log_path
		output('Recording to: {}'.format(base), 'DEBUG')
		mkdirP(base)
		settings.record = os.path.join(base, 'record_{}.cl'.format(settings._start))
	if settings.record:
		settings._rfh = open(settings.record, 'wb+')
		
		if head != None:
			recordS(head)

def close_logging():
	if settings.log == None:
		return
	try:
		logS('// Completed in {:6.4f}s'.format(time.time() - settings._start))
		settings._lfh.close()
	except:
		pass
	
	settings.log = None

def close_recording():
	if settings.record == None:
		return
	try:
		recordS('// Completed in {:6.4f}s'.format(time.time() - settings._start))
		settings._rfh.close()
	except:
		pass
	
	settings.record = None

def shouldLog(level):
	l = {
		'FATAL': -1,
		'NONE': 0,
		'OBSOLETE': 1,
		'DEPRECATED': 1,
		'ERROR': 1,
		'ERR': 1,
		'WARNING': 2,
		'WARN': 2,
		'SQL': 4,
		'INFO': 4,
		'DEBUG': 8,
		'TRACE': 16
	}
	
	try:
		if l[level] < 0 or l[settings.loglevel] >= l[level]:
			return True
	except:
		pass
	
	return False

def shapeString(s):
	return s.encode('ascii') + b"\n"
def logS(s):
	if not isinstance(s, list):
		s = [ s ]
	for l in s:
		try: settings._lfh.write(shapeString(l))
		except: pass
def recordS(s):
	if not isinstance(s, list):
		s = [ s ]
	for l in s:
		try: settings._rfh.write(shapeString(l))
		except: pass

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
	if settings.no_color and settings.no_color == True:
		x = '[{}] {}{}'.format(datetime.now().strftime("%H:%M:%S.%f"), '[{}] '.format(level), s)
	else:
		if level == 'INFO':
			level_color = colorama.Fore.GREEN
		elif level == 'OBSOLETE':
			level_color = colorama.Fore.BLUE
		elif level == 'ERROR' or level == 'DEPRECATED' or level == 'FATAL':
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
				logS('[{}] {} {}{}'.format(datetime.now().strftime("%H:%M:%S.%f"), os.getpid(), '[{}] '.format(level), s))
			else:
				logS(x)
		except:
			pass
	
	if level == 'FATAL' or (permissive == False and settings.abort_on_error == True and (level == 'ERROR' or level == 'WARN' or level == 'WARNING')):
		output('Aborting on error!')
		sys.exit(1)
	
def sendData(v, read=None, flush=None, timeout=3, readWait=.5):
	"""
	Sends data via telnet to the server
	
	# Arguments
	
	v (list|string): Command or multiple commands to be sent to the server
	read (bool): Waits for a confirmation from server for each command been executed/queued (this greatly slows down execution), defaults to `None`
	flush (bool): Flush after reading, defaults to `None`
	timeout (float): Time in seconds to wait for a immediate reply, defaults to `3`
	readWait (float): If it happens we didn't received a reply on the immediate read, we will keep pooling for a reply every readWait seconds cycle, ideally this is just to avoid a fast as possible loop on a already loaded API. Defaults to `.5`
	
	# Notes
	
	- When `settings.async` is disabled (default behaviour) read flag is redundant, as system will always force a read, the same applies for flush, since there won't be any buffer to be read, trying to flush will have no effect.
	
	# Returns
	
	string: Reply from server or raw data
	
	"""
	try:
		if settings.force_sync == True:
			read = True
		else: # not recommended
			if read == None:
				if getattr(settings, "async") == True:
					read = False
				else:
					read = True
	except:
		read = True
	
	if not isinstance(v, list):
		v = [ v ]
	
	if settings.debug:
		settings._counters['send'] += 1
		output('[{}] Telnet sendData v: {} read: {} flush: {}'.format(settings._counters['send'], v, 'True' if read == True else 'False', 'True' if flush != None else 'False'))
	r = []
	abort = False
	tBytes = 0
	
	for s in v:
		s = re.sub(r'\s{2,}', ' ', s.strip('\n\r').replace('\t', ' '))
		
		# skip empty lines
		if len(s) == 0 or len(s.strip(' ')) == 0:
			continue
		
		# comment skip
		if s[0:2] == '//' or s[0:2] == '--':
			if settings.quiet == False:
				output('>> {}'.format(s), 'DEBUG')
			continue
		
		# mute
		if settings.quiet == False:
			output('>> {}'.format(s))
		
		if settings.record:
			recordS(s)
		
		s = s.encode('ascii') + b"\r\n"
		
		if settings.debug:
			output('Telnet Writing: `{}` {} bytes'.format(s, len(s)), 'DEBUG')
		
		if settings.benchmark:
			settings._benchts = time.time()
		
		try:
			settings._tn.write(s)
		except:
			pass
		
		if settings.dry_run:
			continue
		
		abort = False
		rBytes = 0
		
		if read == True:
			if settings.debug:
				settings._counters['recv'] += 1
				output('[{}] Telnet Reading...'.format(settings._counters['recv']), 'DEBUG')
			
			rData = settings._tn.read_until(b"\r\n", timeout)
			
			if settings.debug:
				output('[{}] Raw data: {}'.format(settings._counters['recv'], rData), 'DEBUG')
			
			rBytes += len(rData)
			l = shapeData(rData)
			
			if settings.abort_on_error == True and abort == False and 'error' in str(l).lower():
				abort = True
			
			if isinstance(l, list):
				r.extend(l)
			else:
				r.append(l)
			
			aBytes = 0
			eolFlag = True if rBytes > 0 and str(rData.decode('utf-8'))[-2:] == '\r\n' else False
			
			if settings.debug:
				output('[{}] rBytes: {} eolFlag: {} rData: {}'.format(settings._counters['recv'], rBytes, '1' if eolFlag == True else '0', rData), 'DEBUG')
			
			rData = []
			
			while True:
				if settings.debug:
					output('[{}:{}] Telnet Read Loop... buffer: {}'.format(rBytes, '1' if eolFlag == True else '0', r), 'DEBUG')
				
				try:
					eData = settings._tn.read_eager()
					l = ''
					s = len(eData)
					
					if settings.debug:
						output('eData[{}]: {}'.format(s, eData), 'DEBUG')
					
					if s > 0:
						rData.append(eData.decode('utf-8'))
						rBytes += s
						aBytes += s
						merged = str(''.join(rData))
						
						if len(merged) >= 2 and merged[-2:] == '\r\n':
							if settings.debug:
								output('Line break found', 'DEBUG')
							l = shapeData(merged)
							rData = []
							eolFlag = True
				except EOFError:
					output('Error reading data from socket, reconnecting...', 'ERROR')
					initTelnet(settings.ip, settings.port)
					break
				
				if len(l) > 0:
					if settings.debug:
						output('rData[{}:{}]: {}'.format(aBytes, '1' if eolFlag == True else '0', rData), 'DEBUG')
				
				if l is '' or not l:
					if (rBytes > 0 and aBytes == 0) or (aBytes > 0 and eolFlag == True): # read enough?
						break
					else: # nothing read, keep looping until we read something
						if readWait > 0:
							time.sleep(readWait)
						continue
				
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
			tBytes += rBytes
	
	if settings.debug:
		output('Telnet Read {} bytes: {}'.format(tBytes, r), 'DEBUG')
	if abort == True:
		output('Error received via telnet, aborting', 'ERROR')
	
	if settings.test:
		for l in r:
			if 'error' in str(l).lower():
				output('Error on response: {}'.format(l), 'WARN')
				# assert False
	
	return r

def md5_file(fname):
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

def md5(s):
	"""
	Creates a md5 hash from a string
	
	# Attributes
	
	s (string): String
	
	# Returns
	
	string: md5 hash
	"""
	
	hash_md5 = hashlib.md5()
	hash_md5.update(s.encode('utf-8'))
	
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
	
	l (str|bytes): Raw data
	
	# Raises
	
	TypeError: If invalid data type sent
	
	# Returns
	
	string: UTF-8 Data
	"""
	try:
		l = str(l.decode('utf-8')).rstrip() if not isinstance(l, str) else l.rstrip()
	except TypeError as e:
		output('Error decoding: {}'.format(l), 'ERROR')
	except:
		output('Unknown error while decoding output from telnet', 'ERROR')
		return ''
	
	if settings.quiet == False and l != '':
		f = l
		try:
			if settings.benchmark and isinstance(settings._benchts, float):
				f = '[{:7.4f}s] {}'.format(time.time() - settings._benchts, l)
		except:
			f = l
			pass
		
		output('<< {}'.format(f), 'WARN' if 'ERROR:' in l else 'INFO')
		
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
	
	"""
	if settings.save_config:
		saveConfig()
	"""
	
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
			output('Recorded to: `{}`'.format(settings._rfh.name), 'DEBUG')
			close_recording()
	except:
		pass
	
	try:
		if settings.log:
			output('Logged to: `{}`'.format(settings._lfh.name), 'DEBUG')
			close_logging()
	except:
		pass
	
	output('Completed, wasted {:6.4f}s ... BYE'.format(time.time() - settings._start))

def flushBuffer():
	"""
	Forces a telnet command read by sending NOOP
	"""
	try:
		if settings.dry_run or settings.force_sync == True:
			return
	except:
		pass
	
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
			except AttributeError:
				output.append('\tNo description')
			except:
				pass
	
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

def loadJSONS(s):
	if isinstance(s, bytes):
		return json_alt.loads(s)
		
		"""
		try:
			s = s.decode('utf-8')
		except:
			output('Unable to decode bytes to string: {}'.format(s), 'ERROR')
			return False
		"""
	
	return json.loads(s)

def loadJSON(path):
	output('Loading JSON object from: `{}` ...'.format(path))
	
	with open(path, encoding='utf-8') as data:
		r = json.loads(data.read())
	
	return r

def loadConfig():
	if not os.path.isfile(settings.config):
		return
	
	cfg = loadJSON(settings.config)
	
	"""
	for c in cfg:
		if settings.isset(c) == False:
			settings[c] = cfg[c]
	"""
	
	# overwrite / add existing values
	for c in cfg:
		settings[c] = cfg[c]

def deep_merge_lists(original, incoming, extendKeys=[]):
	common_length = min(len(original), len(incoming))
	
	for idx in range(common_length):
		if isinstance(original[idx], dict) and isinstance(incoming[idx], dict):
			deep_merge_dicts(original[idx], incoming[idx], extendKeys)
		elif isinstance(original[idx], list) and isinstance(incoming[idx], list):
			deep_merge_lists(original[idx], incoming[idx], extendKeys)
		else:
			original[idx] = incoming[idx]
	
	for idx in range(common_length, len(incoming)):
		original.append(incoming[idx])

def deep_merge_dicts(original, incoming, extendKeys=[]):
	for key in incoming:
		if key in original:
			if isinstance(original[key], dict) and isinstance(incoming[key], dict):
				deep_merge_dicts(original[key], incoming[key], extendKeys)
			elif isinstance(original[key], list) and isinstance(incoming[key], list):
				if key in extendKeys:
					original[key].extend(incoming[key])
				else:
					deep_merge_lists(original[key], incoming[key], extendKeys)
			else:
				original[key] = incoming[key]
		else:
			original[key] = incoming[key]

def flatList(l):
	r = []
	for sublist in l:
		for item in sublist:
			r.append(item)
	return r

def findLayoutFromOptions(hint, suffix=None, prefix=None):
	layouts = getAllFiles(os.path.join(settings._root, 'layout', hint), recursive=False)
	sets = []
	
	try:
		for x in settings._options:
			sets.append(x.split('\\')[-1].split('/')[-1].split('.')[0])
	except:
		pass
	
	layout = None
	
	for x in sets:
		if any(x in s for s in layouts):
			if layout != None:
				layout = 'combined'
				break
			else:
				layout = x
	
	if layout != None:
		loadLayout('{}{}{}.layout'.format(prefix if prefix != None else '', layout, suffix if suffix != None else ''))

def findLayout(hint):
	try:
		lfn = os.path.join(settings._root, 'layout', '{}.layout'.format(hint))
		if os.path.isfile(lfn):
			loadLayout(lfn)
		else:
			output('No layout match found, path: {}'.format(lfn), 'DEBUG')
	except:
		output('Failed to autoload layout', 'DEBUG')

def loadLayout(fn):
	sendData('"UI.WindowController.instance" EXECUTE LoadLayout "{}"'.format(fn))
	output('Loaded layout: {}'.format(fn), 'DEBUG')

def loadOptions():
	if settings.options == None:
		return
	
	fns = flatList(settings.options)
	cfg = None
	
	for fn in fns:
		if not os.path.isfile(fn):
			output('File: {} not accessible'.format(fn), 'ERROR')
			sys.exit(1)
			return
		
		_cfg = loadJSON(fn)
		
		"""
		output('Loading options from: `{}` ...'.format(fn))
		
		with open(fn, encoding='utf-8') as data:
			_cfg = json.loads(data.read())
		"""
		
		if cfg == None:
			cfg = _cfg.copy()
		else:
			deep_merge_dicts(cfg, _cfg, extendKeys=['writeLinks', 'readLinks'])
	
	settings._options = fns.copy()
	settings.options = cfg.copy()

"""
def saveConfig():
	output('Saving config to: `{}` ...'.format(settings.config))
	data = settings.getData()
	
	with open(settings.config, "w", encoding='utf-8') as fh:
		fh.write(json.dumps(data, indent=4, sort_keys=True))
"""

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

def addStack(target, sType):
	"""
	Adds an arbitrary target to main execution stack.
	This allows for dynamic stack shaping from within the execution loop.
	
	# Arguments
	
	target (string): Defines target, a script, cl, path, or whatever main engine is capable of running
	sType (string): Type of target, supported types are defined under syncity.py main loop.
	
	# Example
	
	`common.addStack("generic_exporter", "script")`
	
	Adds the `generic_exporter` script to current stack as the immediate next in execution order
	
	"""
	if not sType in settings._stack:
		settings._stack.append(sType)
	settings[sType][settings._idx[sType]].append(target)

def genID():
	return str(uuid.uuid4())

def versionCompare(a, b, condition, failWarning=None):
	if condition == '<' and int(str(a).replace('.', '')[0:10]) < int(str(b).replace('.', '')[0:10]):
		return True
	elif condition == '>' and int(str(a).replace('.', '')[0:10]) > int(str(b).replace('.', '')[0:10]):
		return True
	elif (condition == '<=' or condition == '=>') and int(str(a).replace('.', '')[0:10]) <= int(str(b).replace('.', '')[0:10]):
		return True
	elif (condition == '>=' or condition == '=<') and int(str(a).replace('.', '')[0:10]) >= int(str(b).replace('.', '')[0:10]):
		return True
	elif (condition == '==' or condition == '=') and int(str(a).replace('.', '')[0:10]) == int(str(b).replace('.', '')[0:10]):
		return True
	elif (condition == '!=' or condition == '<>') and int(str(a).replace('.', '')[0:10]) != int(str(b).replace('.', '')[0:10]):
		return True
	
	if failWarning != None:
		output(failWarning, 'WARN')
	
	return False

def waitQueue(threshold=None, wait=.5):
	if versionCompare(settings._simulator_version, '18.07.05.0000', '>='):
		return
	
	"""
	Blocks new CL commands until queue is above a threshold.
	
	# Arguments
	
	threshold (int): Maximum items on queue, defaults to `None` that fallsback to `settings.queue_threshold`
	wait (int): Time in seconds to wait until asking again, defaults to `3`
	
	"""
	
	if settings._tn == None or settings.skip_queue:
		return
	if threshold == None:
		threshold = settings.queue_threshold
	
	flushBuffer()
	
	output('Checking for queue...', 'DEBUG')
	
	b = False
	
	while b == False:
		res = sendData('"API" GET API.Manager queueCount', read=True)
		for r in res:
			s = str(r).lower()
			
			if s == '' or s == 'ok' or 'error' in s:
				continue
			
			try:
				s = re.findall(r'\d+', s)[0]
				q = int(s)
				
				if q <= threshold:
					b = True
					break
				
				output('Waiting for queue to flush, {} pending...'.format(q))
			except:
				pass
		
		if b == False:
			time.sleep(wait)
	
	output('Queue is below threshold', 'DEBUG')

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
	if not isinstance(base, list):
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
