CREATE "ROS2"
"ROS2" SET active false
"ROS2" ADD Sensors.ROS2

// IMU data broadcast and write fields for controlling the car -----------------

CREATE "ROS2/throttle"
"ROS2/throttle" ADD Sensors.WriteFieldLink
"ROS2/throttle" SET Sensors.WriteFieldLink topicName "syncity/throttle" target "mainCar" componentName "VPCustomInput" fieldName "externalThrottle" intervalSeconds 0.5 
"ROS2/throttle" SET active true

CREATE "ROS2/brake"
"ROS2/brake" ADD Sensors.WriteFieldLink
"ROS2/brake" SET Sensors.WriteFieldLink topicName "syncity/brake" target "mainCar" componentName "VPCustomInput" fieldName "externalBrake" intervalSeconds 0.5 
"ROS2/brake" SET active true

CREATE "ROS2/handbrake"
"ROS2/handbrake" ADD Sensors.WriteFieldLink
"ROS2/handbrake" SET Sensors.WriteFieldLink topicName "syncity/handbrake" target "mainCar" componentName "VPCustomInput" fieldName "externalHandbrake" intervalSeconds 0.5 
"ROS2/handbrake" SET active true

CREATE "ROS2/steer"
"ROS2/steer" ADD Sensors.WriteFieldLink
"ROS2/steer" SET Sensors.WriteFieldLink topicName "syncity/steer" target "mainCar" componentName "VPCustomInput" fieldName "externalSteer" intervalSeconds 0.5 
"ROS2/steer" SET active true

CREATE "ROS2/velocity"
"ROS2/velocity" ADD Sensors.ReadFieldLink
"ROS2/velocity" SET Sensors.ReadFieldLink topicName "syncity/velocity" target "mainCar" componentName "Rigidbody" fieldName "velocity" intervalSeconds 0.5 onChange true 
"ROS2/velocity" SET active true

CREATE "ROS2/angularVelocity"
"ROS2/angularVelocity" ADD Sensors.ReadFieldLink
"ROS2/angularVelocity" SET Sensors.ReadFieldLink topicName "syncity/angularVelocity" target "mainCar" componentName "Rigidbody" fieldName "angularVelocity" intervalSeconds 0.5 onChange true 
"ROS2/angularVelocity" SET active true

CREATE "ROS2/angularDrag"
"ROS2/angularDrag" ADD Sensors.ReadFieldLink
"ROS2/angularDrag" SET Sensors.ReadFieldLink topicName "syncity/angularDrag" target "mainCar" componentName "Rigidbody" fieldName "angularDrag" intervalSeconds 0.5 onChange true 
"ROS2/angularDrag" SET active true

CREATE "ROS2/position"
"ROS2/position" ADD Sensors.ReadFieldLink
"ROS2/position" SET Sensors.ReadFieldLink topicName "syncity/position" target "mainCar" componentName "Transform" fieldName "position" intervalSeconds 0.5 onChange true 
"ROS2/position" SET active true

CREATE "ROS2/rotation"
"ROS2/rotation" ADD Sensors.ReadFieldLink
"ROS2/rotation" SET Sensors.ReadFieldLink topicName "syncity/rotation" target "mainCar" componentName "Transform" fieldName "eulerAngles" intervalSeconds 0.5 onChange true 
"ROS2/rotation" SET active true

// broadcast cameras -----------------------------------------------------------

CREATE "ROS2/front_camera"
"ROS2/front_camera" ADD Sensors.ReadFieldLink
"ROS2/front_camera" SET Sensors.ReadFieldLink topicName "syncity/front_camera" target "mainCar/cameras/Front" componentName "Camera" fieldName "targetTexture" intervalSeconds 1 onChange true 
"ROS2/front_camera" SET active true
"mainCar/cameras/Front" SET Sensors.RenderCamera alwaysOn true
CREATE "ROS2/segmentation_camera"
"ROS2/segmentation_camera" ADD Sensors.ReadFieldLink
"ROS2/segmentation_camera" SET Sensors.ReadFieldLink topicName "syncity/segmentation_camera" target "mainCar/cameras/Segment" componentName "Camera" fieldName "targetTexture" intervalSeconds 1 onChange true 
"ROS2/segmentation_camera" SET active true
"mainCar/cameras/Segment" SET Sensors.RenderCamera alwaysOn true
CREATE "ROS2/depth_camera"
"ROS2/depth_camera" ADD Sensors.ReadFieldLink
"ROS2/depth_camera" SET Sensors.ReadFieldLink topicName "syncity/depth_camera" target "mainCar/cameras/Depth" componentName "Camera" fieldName "targetTexture" intervalSeconds 1 onChange true 
"ROS2/depth_camera" SET active true
"mainCar/cameras/Depth" SET Sensors.RenderCamera alwaysOn true

// -----------------------------------------------------------------------------

"ROS2" SET active true

