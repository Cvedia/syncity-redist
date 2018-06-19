"""
This script is an alternate to the regular `helpers.takeSnapshot` approach to export data, it allows for a faster export rate without potentially locking rendering when a export happens at the expense of be always rendering.

Using ROS2 protocol texture data from one of more cameras is directly streamed to the network via `topics`, which are then, converted by this script, to image outputs.

## Running exporter

`python syncity.py -t ros2disk -l E:\ros_exports --topic /syncity/rgb_camera`

## Options

- `--topic` (required): Defines a `Image` topic to export images from
- `--image_format`: Defines a type for the exported image, defaults to `jpg` (any `cv2` supported format can be specified)
- `-l` (or local_path) will be used to define where the images will be saved to.

Since ROS topics are network-wide you don't need to specify a ip, as long the machine broadcasting data and the one running this script are on the same network you should be able to export data.

## Notes:

- Before running this script you must have a `topic` set for one or more cameras, this script allows you to export one topic at time, so if you want to export multiple topics you can simply run multiple instances of this script. Here's an example of how to setup a `topic` using the ros helper:

```python
helpers.setupROSTopics(
	readLinks=[
		{
			"label": "rgb_camera",
			"topic": "syncity/rgb_camera",
			"target": "cameras/cameraRGB",
			"component": "Camera",
			"field": "targetTexture",
			"interval": 0.5
		}
	]
)
```

This will bind the game object `cameras/cameraRGB` to a topic `syncity/rgb_camera`, updated every 0.5 second, you can then export this topic using `ros2disk` like:

`python syncity.py -t ros2disk --topic /syncity/rgb_camera -l C:\path\to\images`

Note `topic` parameter has a `/` on the beggining.
When running `ros2disk` it will subscribe to the topic and export any images received until stopped.

- In order for `ros2disk` work you must have ROS2 framework installed and `rclpy` module available, you can follow this tutorials to install it:

- [ROS2 Install on windows](https://github.com/ros2/ros2/wiki/Windows-Install-Binary)
- [ROS2 Install on linux / osx](https://github.com/ros2/ros2/wiki/Installation)

You should use **FastRTPS** not OpenSplice.

It's also important to note, that ROS2 requires a envoriment to be set, so before you run `ros2disk` you should run:

- on windows: `call <path\to\ros2\install>\local_setup.bat`
- on linux: `. /opt/ros/kinetic/setup.bash`

This will setup all envoriment and roscore services, after that, without closing this window, you should be able to call `ros2disk` on syncity.

Finally, if you see no outputs comming out, make sure that the topics are working, you can list them like:

`ros2 topic list -t`

If you have any local network firewall restrictions this may avoid ros from working properly.

"""

missing_modules = False
try:
	import numpy as np
	import rclpy
	import cv2
except:
	missing_modules = True

import os
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
		common.output('You\'re missing one or more modules to run this script, you must have: numpy, cv2 and rclpy. Check syncity documentation or open this file (syncity/tools/ros2disk) for more information.', 'ERROR')
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

