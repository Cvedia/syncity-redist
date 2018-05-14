import pytest
import pytest_dependency
import pytest_timeout
import tcommon
import syncity
import string
from syncity import common, settings_manager

@pytest.mark.first
def test_alpha():
	assert tcommon.telnet() == True
	for x in range(0, 10):
		prefix = tcommon.getRandStr(chars=string.ascii_uppercase + string.ascii_lowercase)
		assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
		assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object
		assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy container

def test_alpha_long():
	for x in range(0, 10):
		prefix = tcommon.getRandStr(size=257, chars=string.ascii_uppercase + string.ascii_lowercase)
		assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
		assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object
		assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy container

def test_digits():
	for x in range(0, 10):
		prefix = tcommon.getRandStr(chars=string.digits)
		assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
		assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object
		assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy container

def test_space_nested():
	for x in range(0, 10):
		root = tcommon.getRandStr(chars=' ')
		prefix = root
		
		for i in range(0, 32):
			prefix += '/{}'.format(tcommon.getRandStr(chars=' '))
		
		assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
		assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object
		assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy container

def test_digits_long():
	for x in range(0, 10):
		prefix = tcommon.getRandStr(size=257, chars=string.digits)
		assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
		assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object
		assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy container

def test_create_del():
	for x in range(0, 10):
		prefix = tcommon.getRandStr()
		assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
		assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object
		assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy container

def test_create_del_longnames():
	for x in range(0, 10):
		prefix = tcommon.getRandStr(size=257)
		assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
		assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object
		assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy container

@pytest.mark.last
@pytest.mark.timeout(350)
def test_create_del_longnames_nested():
	root = tcommon.getRandStr(size=65)
	
	for x in range(0, 10):
		prefix = root
		
		# create 32 nested levels, each one with a 65 char length empty object name
		for i in range(0, 32):
			prefix += '/{}'.format(tcommon.getRandStr(size=65))
		
		assert common.sendData('CREATE "{}/obj"'.format(prefix)) == ["OK"] # create empty object
		assert common.sendData('DELETE "{}/obj"'.format(prefix)) == ["OK"] # destroy object
		assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy container
	
	assert common.sendData('DELETE "{}"'.format(root)) == ["OK"] # destroy root container
