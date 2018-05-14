import pytest
import pytest_dependency
import tcommon
import syncity
import os
import time
from syncity import common, settings_manager

settings = settings_manager.Singleton()
objs = {}
fns = {}
testSizes = []

# minimum rendering size is 64x64
# unity rendering will break when going from a small size to 1024, however,
# this will happen at random, that's why this tests repeats 3 times
for i in range(0, 3):
	for l in [[64, 64], [128, 64], [64, 128], [1024, 768], [768, 1024], [4096, 4096], [640, 480], [320, 240], [64, 128]]:
		testSizes.append((l[0], l[1], tcommon.getRandStr()))

def cleanup(gprefix):
	tcommon.cleanup(objs[gprefix], fns[gprefix])

@pytest.mark.first
@pytest.mark.dependency
@pytest.mark.parametrize("width,height,gprefix", testSizes)
def test_disk_export_setup(width, height, gprefix):
	assert tcommon.telnet() == True
	objs[gprefix] = [gprefix]
	fns[gprefix] = []
	objs[gprefix].append('{}/disk1'.format(gprefix))
	assert common.sendData('CREATE "{}/disk1"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1" SET active false'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1" ADD Sensors.Disk'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1" SET Sensors.Disk path "{}"'.format(gprefix, settings.output_path)) == ["OK"]

@pytest.mark.dependency
@pytest.mark.parametrize("width,height,gprefix", testSizes)
def test_camera_rgb_setup(width, height, gprefix):
	objs[gprefix].append('{}/cameras/cameraRGB'.format(gprefix))
	assert common.sendData('CREATE "{}/cameras/cameraRGB"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/cameraRGB" SET active false'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/cameraRGB" ADD Camera Sensors.RenderCamera'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/cameraRGB" SET Sensors.RenderCamera format "ARGB32" resolution ({} {})'.format(gprefix, width, height)) == ["OK"]
	assert common.sendData('"{}/cameras/cameraRGB" SET active true'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/cameraRGB" SET Camera enabled true'.format(gprefix)) == ["OK"]

@pytest.mark.dependency(depends=tcommon.parametrizeInstances(["test_disk_export_setup", "test_camera_rgb_setup"], testSizes))
@pytest.mark.parametrize("width,height,gprefix", testSizes)
def test_disk_export_rgb_setup(width, height, gprefix):
	objs[gprefix].append('{}/disk1/cameras/cameraRGB'.format(gprefix))
	assert common.sendData('CREATE "{}/disk1/cameras/cameraRGB"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1/cameras/cameraRGB" ADD Sensors.RenderCameraLink'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1/cameras/cameraRGB" SET Sensors.RenderCameraLink target "{}/cameras/cameraRGB"'.format(gprefix, gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1/cameras/cameraRGB" SET active true'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1" SET active true'.format(gprefix)) == ["OK"]

@pytest.mark.dependency(depends=tcommon.parametrizeInstances(["test_camera_rgb_setup", "test_disk_export_rgb_setup"], testSizes))
@pytest.mark.parametrize("width,height,gprefix", testSizes)
def test_rgb_export(width, height, gprefix):
	assert common.sendData(['"{}/disk1" EXECUTE Sensors.Disk Snapshot'.format(gprefix), 'NOOP']) == ["OK", "OK"] # take a screenshot and make sure it's written by NOOPing
	fn = os.path.join(settings.output_path, '1_cameras_camerargb.jpg')
	assert os.path.exists(fn) == True # check if file exists
	fns[gprefix].append(fn)
	sf = os.stat(fn)
	assert (sf.st_size > 0) == True # check if file is more than zero bytes
	assert len(tcommon.imageColors(fn)) == 1 # check if there's only one col or on the image
	assert tcommon.imageSize(fn) == (width, height) # check export image size
	
	cleanup(gprefix)
