missing_modules = False
try:
	import numpy as np
	import rclpy
	import cv2
except:
	missing_modules = True

import os
import time
import sys

from .. import common, helpers, settings_manager

try:
	from sensor_msgs.msg import Image
except:
	missing_modules = True

settings = settings_manager.Singleton()

def help():
	return '''\
	Dumps images produced by a ROS2 Image topic to disk.
	This script is an alternative version to the old embedded disk export module,
	allowing for greater performance without locking rendering.
	
	Note: This requires numpy, rclpy and cv2 modules, that are not installed by default,
	you may also need to change your PYTHONPATH env variable to point out for 
	specific ROS2 python library in order to be able to load rclpy modules.
'''

def args(parser):
	try:
		parser.add_argument('--topic', default=None, help='Defines a topic to dump images from, example /syncity/camerargb1')
	except:
		pass
	try:
		parser.add_argument('--image_format', default='jpg', help='Image format to write images from topic')
	except:
		pass

def topic_cb(msg):
	common.output('Message RCVD', 'DEBUG')
	
	# rgba8 -> rgb8
	raw = msg.data[:]
	
	del raw[3::4]
	
	# reshape contiguous array into 3 channels following the message image size
	inp = np.reshape(np.asarray(raw, np.uint8), (msg.height, msg.width, 3))
	
	# show image (will only work when running on a desktop)
	# cv2.imshow('test', inp)
	# cv2.waitKey(1)
	
	fn = os.path.join(
		settings.local_path,
		'{}_{}.{}'.format(
			settings.topic.replace('/', '_').replace('\\', '_').strip('_'),
			settings._zid,
			settings.image_format
		)
	)
	
	inp = cv2.cvtColor(inp, cv2.COLOR_BGR2RGB)
	common.output('Writing {}...'.format(fn))
	cv2.imwrite(fn, inp)
	common.output('Wrote', 'DEBUG')
	settings._zid += 1

def run():
	if missing_modules == True:
		common.output('You\'re missing one or more modules to run this script, you must have: numpy, cv2 and rclpy', 'ERROR')
		sys.exit(1)
	if settings.topic == None:
		common.output('No topic defined', 'ERROR')
		sys.exit(1)
	
	settings._zid = 0
	common.output('RCL Init...')
	rclpy.init()
	common.output('Subscriber node init...')
	settings._node = rclpy.create_node('minimal_subscriber')
	common.output('Subscribing to {}...'.format(settings.topic))
	subscription = settings._node.create_subscription(Image, settings.topic, topic_cb)
	subscription  # prevent unused variable warning
	
	common.output('Entering Spin loop...', 'DEBUG')
	
	while rclpy.ok():
		common.output('Spin', 'DEBUG')
		rclpy.spin(settings._node)
	
	common.output('Destroying...')
	
	# Destroy the node explicitly
	# (optional - otherwise it will be done automatically
	# when the garbage collector destroys the node object)
	settings._node.destroy_node()
	rclpy.shutdown()

