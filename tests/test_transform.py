import pytest
import tcommon
import syncity
from syncity import common, settings_manager

# ref #554
# TODO: Read GET results once it's fixed

def test_position_int():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
	assert common.sendData('"{}/obj" SET Transform position (0 32000 65000)'.format(prefix)) == ["OK"] # set object position
	assert common.sendData('"{}/obj" GET Transform position'.format(prefix)) == ["OK"] # get object position
	assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object

def test_position_float():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
	assert common.sendData('"{}/obj" SET Transform position (-6.101 1.101 -50.101)'.format(prefix)) == ["OK"] # set object position
	assert common.sendData('"{}/obj" GET Transform position'.format(prefix)) == ["OK"] # get object position
	assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object

def test_eulerangles_int():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
	assert common.sendData('"{}/obj" SET Transform eulerAngles (0 90 180)'.format(prefix)) == ["OK"] # set object eulerAngles
	assert common.sendData('"{}/obj" GET Transform eulerAngles'.format(prefix)) == ["OK"] # get object eulerAngles
	assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object

def test_eulerangles_float():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
	assert common.sendData('"{}/obj" SET Transform eulerAngles (-6.101 1.101 -50.101)'.format(prefix)) == ["OK"] # set object eulerAngles
	assert common.sendData('"{}/obj" GET Transform eulerAngles'.format(prefix)) == ["OK"] # get object eulerAngles
	assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object

def test_scale_int():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
	assert common.sendData('"{}/obj" SET Transform scale (0 32000 65000)'.format(prefix)) == ["OK"] # set object scale
	assert common.sendData('"{}/obj" GET Transform scale'.format(prefix)) == ["OK"] # get object scale
	assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object

def test_scale_float():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
	assert common.sendData('"{}/obj" SET Transform scale (-6.101 1.101 -50.101)'.format(prefix)) == ["OK"] # set object scale
	assert common.sendData('"{}/obj" GET Transform scale'.format(prefix)) == ["OK"] # get object scale
	assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object
