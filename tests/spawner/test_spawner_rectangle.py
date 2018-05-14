import pytest
import tcommon
import syncity
from syncity import common, settings_manager

def test_rectangle():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	
	assert common.sendData('CREATE "{}/spawner/drone/container"'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" SET active false'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" ADD RandomProps.Rectangle'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" ADD RandomProps.PropArea'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" SET RandomProps.PropArea tags "drone"'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" SET RandomProps.PropArea async false numberOfProps 25 collisionCheck false stickToGround false'.format(prefix)) == ["OK"]
	# assert common.sendData('"{}/spawner/drone/container" SET RandomProps.Rectangle size (0 0)'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" SET RandomProps.Rectangle size (10 10)'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" SET active true'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone" SET active true'.format(prefix)) == ["OK"]
	
	assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy container
