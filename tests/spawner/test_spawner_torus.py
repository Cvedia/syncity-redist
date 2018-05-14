import pytest
import tcommon
import syncity
from syncity import common, settings_manager

def test_torus():
	prefix = tcommon.getRandStr()
	assert tcommon.telnet() == True
	
	assert common.sendData('CREATE "{}/spawner/drone/container"'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" SET active false'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" ADD RandomProps.Torus'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" ADD RandomProps.PropArea'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" SET RandomProps.PropArea tags "drone"'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" SET RandomProps.PropArea async false numberOfProps 25 collisionCheck false stickToGround false'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" SET RandomProps.Torus radius 10 innerRadius 0'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone/container" SET active true'.format(prefix)) == ["OK"]
	assert common.sendData('"{}/spawner/drone" SET active true'.format(prefix)) == ["OK"]
	
	assert common.sendData('DELETE "{}"'.format(prefix)) == ["OK"] # destroy container
