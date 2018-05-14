import pytest
import pytest_dependency
import tcommon
import syncity
import os
import time
import re
from syncity import common, settings_manager

settings = settings_manager.Singleton()
objs = {}
fns = {}
testSizes = []

# minimum rendering size is 64x64
# unity rendering will break when going from a small size to 1024, however,
# this will happen at random, that's why this tests repeats 3 times
for i in range(0, 3):
	# for l in [[64, 64], [128, 64], [64, 128], [1024, 768], [768, 1024], [4096, 4096], [640, 480], [320, 240], [64, 128]]:
	for l in [[1024, 768]]:
		testSizes.append((l[0], l[1], tcommon.getRandStr()))

def cleanup(gprefix):
	tcommon.cleanup(objs[gprefix], fns[gprefix])

@pytest.mark.first
@pytest.mark.dependency
@pytest.mark.parametrize("width,height,gprefix", testSizes)
def test_disk_export_setup(width, height, gprefix):
	assert tcommon.telnet() == True
	tcommon.setConfig()
	objs[gprefix] = [gprefix]
	fns[gprefix] = []
	objs[gprefix].append('{}/disk1'.format(gprefix))
	assert common.sendData('CREATE "{}/disk1"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1" SET active false'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1" ADD Sensors.Disk'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1" SET Sensors.Disk path "{}"'.format(gprefix, settings.output_path)) == ["OK"]

@pytest.mark.dependency
@pytest.mark.parametrize("width,height,gprefix", testSizes)
def test_camera_segmentation_setup(width, height, gprefix):
	objs[gprefix].append('{}/cameras/segmentation'.format(gprefix))
	assert common.sendData('CREATE "{}/cameras/segmentation"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras" SET Transform position (-6 1 -15) eulerAngles (0 0 0)'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/segmentation" SET active false'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors Sensors.RenderCamera'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/segmentation" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/segmentation" SET Sensors.RenderCamera format "ARGB32" resolution ({} {})'.format(gprefix, width, height)) == ["OK"]
	assert common.sendData('"{}/cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Car->red" "Drone->blue"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Car" "Drone"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/segmentation" SET active true'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/cameras/segmentation" SET Camera enabled true'.format(gprefix)) == ["OK"]

@pytest.mark.dependency(depends=tcommon.parametrizeInstances(["test_disk_export_setup", "test_camera_segmentation_setup"], testSizes))
@pytest.mark.parametrize("width,height,gprefix", testSizes)
def test_disk_export_segmentation_setup(width, height, gprefix):
	objs[gprefix].append('{}/disk1/cameras/segmentation'.format(gprefix))
	assert common.sendData('CREATE "{}/disk1/cameras/segmentation"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1/cameras/segmentation" ADD Sensors.RenderCameraLink'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1/cameras/segmentation" SET Sensors.RenderCameraLink target "{}/cameras/segmentation"'.format(gprefix, gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1/cameras/segmentation" SET active true'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/disk1" SET active true'.format(gprefix)) == ["OK"]

@pytest.mark.dependency(depends=tcommon.parametrizeInstances(["test_camera_segmentation_setup", "test_disk_export_segmentation_setup"], testSizes))
@pytest.mark.parametrize("width,height,gprefix", testSizes)
def test_segmentation_export(width, height, gprefix):
	# create objects
	assert common.sendData('CREATE "Cars/VW_Golf_V/VW_Golf_V" FROM "cars" AS "{}/obj/subject0"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/obj" SET active false'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/obj/subject0" SET Transform position (0 0 0) eulerAngles (0 0 0)'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/obj/subject0" ADD Segmentation.Entity Segmentation.Class'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/obj/subject0" SET Segmentation.Class className "Car"'.format(gprefix)) == ["OK"]
	assert common.sendData('CREATE "Drones/DJI_Phantom_4_Pro/DJI_Phantom_4_Pron" FROM "drones" AS "{}/obj/subject1"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/obj" SET active false'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/obj/subject1" SET Transform position (0 2 0) eulerAngles (0 0 0)'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/obj/subject1" ADD Segmentation.Entity Segmentation.Class'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/obj/subject1" SET Segmentation.Class className "Drone"'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/obj" SET Transform position (-6 0 -9) eulerAngles (0 0 0)'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/obj" SET active true'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/obj/subject0" SET active true'.format(gprefix)) == ["OK"]
	assert common.sendData('"{}/obj/subject1" SET active true'.format(gprefix)) == ["OK"]
	# take screenshot
	assert common.sendData(['"{}/disk1" EXECUTE Sensors.Disk Snapshot'.format(gprefix), 'NOOP']) == ["OK", "OK"] # take a screenshot and make sure it's written by NOOPing
	objs[gprefix].append("{}/obj".format(gprefix));
	fn = os.path.join(settings.output_path, '1_cameras_segmentation.jpg')
	assert os.path.exists(fn) == True # check if file exists
	fns[gprefix].append(fn)
	sf = os.stat(fn)
	assert (sf.st_size > 0) == True # check if file is more than zero bytes
	assert tcommon.imageColors(fn) == None # check if there's more than 256 colors on the image
	assert tcommon.imageSize(fn) == (width, height) # check export image size
	output = common.sendData('"{}/cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes'.format(gprefix))
	assert len(output) == 2 # output length
	output[0] = re.sub('"id":\d+,', '', output[0])
	assert output == ['[{"classId":1,"numPoints":43268,"boxMin":[0.3773216, 0.3116036],"boxMax":[0.6226784, 0.6036506],"visibility":"Infinity"},{"classId":2,"numPoints":425,"boxMin":[0.4770283, 0.6440678],"boxMax":[0.5229716, 0.6779661],"visibility":"Infinity"}]', "OK"]
	
	cleanup(gprefix)
