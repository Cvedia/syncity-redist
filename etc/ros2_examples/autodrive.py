"""
Based on https://github.com/ros2/examples/tree/master/rclpy/topics/minimal_publisher

This script require ros2 rclpy libraries.

This will send random brake, steer and throttle inputs to ros2 topics that are
compatible with the script autodrive.py

Note that syncity simulator streams data in ros2, if you're using ros1 you might
want to setup a bridge: https://github.com/ros2/ros1_bridge

"""

import rclpy
import time
import random

from std_msgs.msg import Float32

def main(args=None):
	rclpy.init(args=args)
	
	print('Setting up publishers')
	
	node = rclpy.create_node('minimal_publisher')
	
	publishers = {
		"steer": node.create_publisher(Float32, 'syncity/steer'),
		"throttle": node.create_publisher(Float32, 'syncity/throttle'),
		"brake": node.create_publisher(Float32, 'syncity/brake')
	}
	
	msg = Float32()
	i = 0
	
	def timer_callback():
		nonlocal i
		msg.data = random.uniform(-1,1)
		i += 1
		print('Steer: {}'.format(msg.data))
		publishers["steer"].publish(msg)
		
		msg.data = random.uniform(0,1)
		print('Throttle: {}'.format(msg.data))
		publishers["throttle"].publish(msg)
		
		# remove this block to get the car moving fast
		msg.data = random.uniform(0,.005)
		print('Brake: {}'.format(msg.data))
		publishers["brake"].publish(msg)
	
	timer_period = 0.5  # seconds
	timer = node.create_timer(timer_period, timer_callback)
	
	rclpy.spin(node)
	
	# Destroy the timer attached to the node explicitly
	# (optional - otherwise it will be done automatically
	# when the garbage collector destroys the node object)
	
	node.destroy_timer(timer)
	node.destroy_node()
	rclpy.shutdown()

if __name__ == '__main__':
	main()
