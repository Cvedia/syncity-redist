import pytest
import tcommon
import syncity
from syncity import common, settings_manager

# note: angles will never go negative after parsed

def test_eulerangles_int():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
	assert common.sendData('"{}/obj" SET Transform eulerAngles (0 90 180)'.format(prefix)) == ["OK"] # set object eulerAngles
	assert common.sendData('"{}/obj" GET Transform eulerAngles'.format(prefix)) == ['[0.0,90.0,180.0]', "OK"] # get object eulerAngles
	assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy object

def test_eulerangles_float():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
	assert common.sendData('"{}/obj" SET Transform eulerAngles (-6.101 1.101 -50.101)'.format(prefix)) == ["OK"] # set object eulerAngles
	assert common.sendData('"{}/obj" GET Transform eulerAngles'.format(prefix)) == ['[353.899,1.101,309.899]', "OK"] # get object eulerAngles
	assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy object

def test_localeulerangles_float():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
	assert common.sendData('"{}/obj" SET Transform eulerAngles (0 0 0) localEulerAngles (-6.101 1.101 -50.101)'.format(prefix)) == ["OK"] # set object eulerAngles
	assert common.sendData('"{}/obj" GET Transform localEulerAngles'.format(prefix)) == ['[353.899,1.101,309.899]', "OK"] # get object eulerAngles
	assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy object
