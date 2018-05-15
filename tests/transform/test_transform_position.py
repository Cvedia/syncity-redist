import pytest
import tcommon
import syncity
from syncity import common, settings_manager

def test_position_int():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
	assert common.sendData('"{}/obj" SET Transform position (0 32000 65000)'.format(prefix)) == ["OK"] # set object position
	assert common.sendData('"{}/obj" GET Transform position'.format(prefix)) == ['[0.0,32000.0,65000.0]', "OK"] # get object position
	assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy object

def test_position_float():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
	assert common.sendData('"{}/obj" SET Transform position (-6.101 1.101 -50.101)'.format(prefix)) == ["OK"] # set object position
	assert common.sendData('"{}/obj" GET Transform position'.format(prefix)) == ['[-6.101,1.101,-50.101]', "OK"] # get object position
	assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy object

def test_localposition_float():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
	assert common.sendData('"{}/obj" SET Transform position (0 0 0) localPosition (-6.101 1.101 -50.101)'.format(prefix)) == ["OK"] # set object position
	assert common.sendData('"{}/obj" GET Transform localPosition'.format(prefix)) == ['[-6.101,1.101,-50.101]', "OK"] # get object position
	assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy object
