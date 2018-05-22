import pytest
import pytest_dependency
import tcommon
import syncity
import os
import time
import re
import json
from syncity import common, settings_manager, helpers

settings = settings_manager.Singleton()
settings._obj = []
objs = {}
fns = {}
testSizes = []
mycams = {}
subjects = [
	{ 'object': 'Cars/VW_Golf_V/VW_Golf_V', 'class': 'Car', 'position': [ 0, 0, 0 ], 'rotation': [0, 0, 0] },
	{ 'object': 'Drones/DJI_Phantom_4_Pro/DJI_Phantom_4_Pron', 'class': 'Drone', 'position': [ 0, 2, 0 ], 'rotation': [0, 0, 0] }
]

# minimum rendering size is 64x64
# unity rendering will break when going from a small size to 1024, however,
# this will happen at random, that's why this tests repeats 3 times

"""
for i in range(0, 3):
	# for l in [[64, 64], [128, 64], [64, 128], [1024, 768], [768, 1024], [4096, 4096], [640, 480], [320, 240], [64, 128]]:
	for l in [[1024, 768]]:
		testSizes.append((l[0], l[1], tcommon.getRandStr(fsSafe=True)))
"""

testSizes.append((1024, 768, tcommon.getRandStr(fsSafe=True)))

def cleanup(gprefix):
	tcommon.cleanup(objs[gprefix], fns[gprefix])

@pytest.mark.first
@pytest.mark.dependency
@pytest.mark.parametrize("width,height,gprefix", testSizes)
def test_setup(width, height, gprefix):
	assert tcommon.telnet() == True
	tcommon.setConfig()
	objs[gprefix] = [gprefix]
	fns[gprefix] = []
	
	labelRoot = '{}/cameras'.format(gprefix)
	labelDisk = '{}/disk1'.format(gprefix)
	
	helpers.globalCameraSetup(labelRoot=labelRoot, position=[-6, 1, -15])
	
	segments = tcommon.subject2segments(subjects)
	lookupTable = tcommon.subject2lookupTable(subjects)
	
	"""
	mycams[gprefix] = [ '{}/rgb_{}'.format(labelRoot, gprefix), '{}/segmentation_{}'.format(labelRoot, gprefix), '{}/depth_{}'.format(labelRoot, gprefix) ]
	
	helpers.addCameraRGB(labelRoot=labelRoot, label=mycams[gprefix][0], width=width, audio=False, height=height, pp='EnviroFX')
	helpers.addCameraSeg(label=mycams[gprefix][1], width=width, height=height, segments=segments, lookupTable=lookupTable)
	helpers.addCameraDepth(label=mycams[gprefix][2], width=width, height=height)
	"""
	
	mycams[gprefix] = [ '{}/rgb_{}'.format(labelRoot, gprefix), '{}/segmentation_{}'.format(labelRoot, gprefix) ]
	helpers.addCameraRGB(labelRoot=labelRoot, label=mycams[gprefix][0], width=width, audio=False, height=height, pp='EnviroFX')
	helpers.addCameraSeg(label=mycams[gprefix][1], width=width, height=height, segments=segments, lookupTable=lookupTable)
	
	helpers.globalDiskSetup(label=labelDisk)
	helpers.addDiskOutput(mycams[gprefix], label=labelDisk)
	
	tcommon.setupSubjects(subjects, gprefix)
	
	objs[gprefix].extend([labelRoot, labelDisk])

@pytest.mark.dependency(depends=tcommon.parametrizeInstances(["test_setup"], testSizes))
@pytest.mark.parametrize("width,height,gprefix", testSizes)
def test_segmentation_export(width, height, gprefix):
	common.waitQueue()
	counter = helpers.getSaveCounter(label='{}/disk1'.format(gprefix))
	
	# take screenshot
	# assert common.sendData(['"{}/disk1" EXECUTE Sensors.Disk Snapshot'.format(gprefix), 'NOOP']) == ["OK", "OK"] # take a screenshot and make sure it's written by NOOPing
	helpers.takeSnapshot(mycams[gprefix], True, label='{}/disk1'.format(gprefix), prefix=gprefix, basePath=settings.output_path)
	
	objs[gprefix].append("{}/obj".format(gprefix));
	ifn = os.path.join(settings.output_path, '{}_{}_cameras_segmentation_{}.png'.format(counter, gprefix, gprefix))
	bfn = os.path.join(settings.output_path, '{}_{}.json'.format(gprefix, counter))
	
	assert os.path.exists(ifn) == True # check if image exists
	assert os.path.exists(bfn) == True # check if bbox exists
	
	fns[gprefix].extend([ifn, bfn])
	sf = os.stat(ifn)
	assert (sf.st_size > 0) == True # check if image is more than zero bytes
	
	sf = os.stat(bfn)
	assert (sf.st_size > 0) == True # check if bbox is more than zero bytes
	
	assert tcommon.assertApprox(
		tcommon.imageColors(ifn),
		[(414, (0, 255, 255, 255)), (43268, (0, 0, 255, 255)), (742750, (0, 0, 0, 255))],
		[
			{'field': '[0][0]', 'threshold': 20}, {'field': '[1][0]', 'threshold': 20}, {'field': '[2][0]', 'threshold': 20},
			{'field': '[0][1]', 'equals': True}
		]
	) == False # This image should contain 3 colors
	assert tcommon.imageSize(ifn) == (width, height) # check export image size
	
	with open(bfn, encoding='utf-8') as data:
		jdata = json.loads(data.read())
	
	assert tcommon.assertApprox(
		jdata,
		[{"classId":1,"numPoints":43268,"boxMin":[0.3773216,0.311603636],"boxMax":[0.6226784,0.60365057],"visibility":0.2680046},{"classId":2,"numPoints":399,"boxMin":[0.4848485,0.644067764],"boxMax":[0.5259042,0.6766623],"visibility":0.5495868}],
		[
			{'field': "[0]['numPoints']", 'threshold': 5}, {'field': "[1]['numPoints']", 'threshold': 5},
			{'field': "[0]['boxMin'][0]", 'threshold': 5}, {'field': "[0]['boxMin'][1]", 'threshold': 5},
			{'field': "[0]['boxMax'][0]", 'threshold': 5}, {'field': "[0]['boxMax'][1]", 'threshold': 5},
			{'field': "[1]['boxMin'][0]", 'threshold': 5}, {'field': "[1]['boxMin'][1]", 'threshold': 5},
			{'field': "[1]['boxMax'][0]", 'threshold': 5}, {'field': "[1]['boxMax'][1]", 'threshold': 5},
			{'field': "[0]['visibility']", 'threshold': 10}, {'field': "[1]['visibility']", 'threshold': 10}
		]
	) == False # Check bounding box
	
	cleanup(gprefix)
