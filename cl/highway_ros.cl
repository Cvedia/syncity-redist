"Config.instance" SET physicsEnabled true

// disable default canvas
"Canvas" SET active false
CREATE "Pickup" FROM "highway" AS "mainCar"

LOAD "highway" FROM "highway_scene"
"mainCar" LISTEN CollisionDetector OnCollision TRIGGER "Canvas/CollisionInfo" CollisionListener Collided


"mainCar" SET Transform position (1390.49 98.121 1958.68) eulerAngles (0 84.42 0)
"mainCar" ADD MainCar OSVehicle OSBHVehicleDriver Highway.ToggleBetweenAutoDriveAndUserControl CollisionDetector
"mainCar" SET OSVehicle externControl true
"mainCar" SET OSBHVehicleDriver smoothAdjust 100.0

// -----------------------------------------------------------------------------

// setup bumper, depth and segmentation cameras
CREATE "mainCar/cameras"
"mainCar/cameras" SET active false
"mainCar/cameras" SET Transform position (-6 1 -50)
"mainCar/cameras" SET Transform eulerAngles (0 0 0)
"mainCar/cameras" ADD Orbit

CREATE "mainCar/cameras/Front"
"mainCar/cameras/Front" SET active false
"mainCar/cameras/Front" ADD Camera
"mainCar/cameras/Front" SET Camera near 0.3 far 1000 fieldOfView 60
"mainCar/cameras/Front" ADD Sensors.RenderCamera
"mainCar/cameras/Front" SET Sensors.RenderCamera format "ARGB32" resolution (640 480)
"mainCar/cameras/Front" SET Camera renderingPath "UsePlayerSettings"
"mainCar/cameras/Front" SET active true

CREATE "mainCar/cameras/Depth"
"mainCar/cameras/Depth" SET active false
"mainCar/cameras/Depth" ADD Camera
"mainCar/cameras/Depth" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading"
"mainCar/cameras/Depth" ADD Sensors.RenderCamera
"mainCar/cameras/Depth" SET Sensors.RenderCamera format "RFloat" resolution (640 480)
"mainCar/cameras/Depth" ADD Cameras.RenderDepthBufferSimple
"mainCar/cameras/Depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
"mainCar/cameras/Depth" SET active true

CREATE "mainCar/cameras/Segment"
"mainCar/cameras/Segment" SET active false
"mainCar/cameras/Segment" ADD Camera
"mainCar/cameras/Segment" SET Camera near 0.3 far 1000 fieldOfView 60
"mainCar/cameras/Segment" ADD Sensors.RenderCamera
"mainCar/cameras/Segment" SET Sensors.RenderCamera format "ARGB32" resolution (640 480)
"mainCar/cameras/Segment" SET Camera renderingPath "UsePlayerSettings" targetTexture.filterMode "Point"
"mainCar/cameras/Segment" ADD Segmentation.Segmentation
"mainCar/cameras/Segment" SET Segmentation.Segmentation minimumObjectVisibility 0 outputType "Auto" boundingBoxesExtensionAmount 0 transparencyCutout 0 
"mainCar/cameras/Segment" EXECUTE Segmentation.Segmentation DefineClass "Void"

"mainCar/cameras/Segment" PUSH Segmentation.Segmentation boundingBoxesFilter "SHOULDER"
"mainCar/cameras/Segment" PUSH Segmentation.Segmentation boundingBoxesFilter "STRUCT"
"mainCar/cameras/Segment" PUSH Segmentation.Segmentation boundingBoxesFilter "ROAD"
"mainCar/cameras/Segment" PUSH Segmentation.Segmentation boundingBoxesFilter "TREE"
"mainCar/cameras/Segment" PUSH Segmentation.Segmentation boundingBoxesFilter "BILLBOARD"
"mainCar/cameras/Segment" PUSH Segmentation.Segmentation boundingBoxesFilter "CAR"

"mainCar/cameras/Segment" ADD Segmentation.LookUpTable

"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable classes "Void"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable colors "black"

"mainCar/cameras/Segment" EXECUTE Segmentation.Segmentation DefineClass "SHOULDER"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable classes "SHOULDER"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable colors "white"

"mainCar/cameras/Segment" EXECUTE Segmentation.Segmentation DefineClass "STRUCT"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable classes "STRUCT"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable colors "blue"

"mainCar/cameras/Segment" EXECUTE Segmentation.Segmentation DefineClass "ROAD"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable classes "ROAD"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable colors "#838383"

"mainCar/cameras/Segment" EXECUTE Segmentation.Segmentation DefineClass "TREE"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable classes "TREE"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable colors "green"

"mainCar/cameras/Segment" EXECUTE Segmentation.Segmentation DefineClass "BILLBOARD"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable classes "BILLBOARD"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable colors "red"

"mainCar/cameras/Segment" EXECUTE Segmentation.Segmentation DefineClass "CAR"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable classes "CAR"
"mainCar/cameras/Segment" PUSH Segmentation.LookUpTable colors "#FF00FF"

"mainCar/cameras/Segment" EXECUTE Segmentation.LookUpTable MarkTextureDirty
"mainCar/cameras/Segment" SET active true

"mainCar/cameras" SET active true

"Camera" ADD Sensors.RenderCamera
"Camera" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768)
"Camera" SET Sensors.RenderCamera alwaysOn true
"Camera" SET Camera enabled true

CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "E:\tmp\"

//CREATE "disk1/mainCar/cameras/driver"
//"disk1/mainCar/cameras/driver" ADD Sensors.RenderCameraLink
//"disk1/mainCar/cameras/driver" SET Sensors.RenderCameraLink target "Camera"
//"disk1/mainCar/cameras/driver" SET active true

CREATE "disk1/mainCar/cameras/front"
"disk1/mainCar/cameras/front" ADD Sensors.RenderCameraLink
"disk1/mainCar/cameras/front" SET Sensors.RenderCameraLink target "mainCar/cameras/Front"
"disk1/mainCar/cameras/front" SET active true

CREATE "disk1/mainCar/cameras/depth"
"disk1/mainCar/cameras/depth" ADD Sensors.RenderCameraLink
"disk1/mainCar/cameras/depth" SET Sensors.RenderCameraLink target "mainCar/cameras/Depth"
"disk1/mainCar/cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"
"disk1/mainCar/cameras/depth" SET active true

CREATE "disk1/mainCar/cameras/segment"
"disk1/mainCar/cameras/segment" ADD Sensors.RenderCameraLink
"disk1/mainCar/cameras/segment" SET Sensors.RenderCameraLink target "mainCar/cameras/Segment"
"disk1/mainCar/cameras/segment" SET active true
"disk1" SET active true

"RoadArchitectSystem1/Road1/MainMeshes/RoadMesh" ADD Segmentation.ClassGroup
"RoadArchitectSystem1/Road1/MainMeshes/RoadMesh" SET Segmentation.ClassGroup itemsClassName "ROAD"
"RoadArchitectSystem1/Road1/MainMeshes/ShoulderR" ADD Segmentation.ClassGroup
"RoadArchitectSystem1/Road1/MainMeshes/ShoulderR" SET Segmentation.ClassGroup itemsClassName "SHOULDER"
"RoadArchitectSystem1/Road1/MainMeshes/ShoulderL" ADD Segmentation.ClassGroup
"RoadArchitectSystem1/Road1/MainMeshes/ShoulderL" SET Segmentation.ClassGroup itemsClassName "SHOULDER"

// TODO: Break components apart
"Road meshes 1" ADD Segmentation.ClassGroup
"Road meshes 1" SET Segmentation.ClassGroup itemsClassName "STRUCT"
"Road meshes 3" ADD Segmentation.ClassGroup
"Road meshes 3" SET Segmentation.ClassGroup itemsClassName "STRUCT"

"Road meshes 2" ADD Segmentation.ClassGroup
"Road meshes 2" SET Segmentation.ClassGroup itemsClassName "BILLBOARD"

"Road trees" ADD Segmentation.ClassGroup
"Road trees" SET Segmentation.ClassGroup itemsClassName "TREE"

"spawner" ADD Segmentation.ClassGroup
"spawner" SET Segmentation.ClassGroup itemsClassName "CAR"

"mainCar/cameras" SET Transform localPosition (0 0.872 2.318) localEulerAngles (0 0 0)
"mainCar/cameras/Front" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"mainCar/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"mainCar/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled true
"mainCar/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.tonemapper "1"
"mainCar/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.enabled true profile.antialiasing.settings.method 1 profile.antialiasing.settings.taaSettings.jitterSpread 1.0 profile.antialiasing.settings.taaSettings.sharpen 0.8 profile.antialiasing.settings.taaSettings.stationaryBlending 0.99 profile.antialiasing.settings.taaSettings.motionBlending 0.8 
"mainCar/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.enabled true profile.ambientOcclusion.settings.intensity 1.3 profile.ambientOcclusion.settings.radius 0.3 profile.ambientOcclusion.settings.sampleCount 10 profile.ambientOcclusion.settings.downsampling 1 profile.ambientOcclusion.settings.forceForwardCompatibility 0 profile.ambientOcclusion.settings.ambientOnly 0 profile.ambientOcclusion.settings.highPrecision 0 
"mainCar/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false

//"mainCar/cameras/Front" SET Sensors.RenderCamera alwaysOn true
//"mainCar/cameras/Depth" SET Sensors.RenderCamera alwaysOn true
//"mainCar/cameras/Segment" SET Sensors.RenderCamera alwaysOn true
//"mainCar/cameras/Front" SET Camera enabled true
//"mainCar/cameras/Depth" SET Camera enabled true
//"mainCar/cameras/Segment" SET Camera enabled true

// -----------------------------------------------------------------------------

"Camera" SET FlyCamera enabled false
"Camera" SET VPCameraController target "mainCar/DriverHeadPivot/DriverHead" 
"Camera" SET VPCameraController enabled true

// keys
"mainCar" SET Highway.ToggleBetweenAutoDriveAndUserControl button "J"

// original lidar
// "mainCar/LidarPlaceholder" SET active false
// "mainCar/LidarPlaceholder" ADD Sensors.Lidar
// "mainCar/LidarPlaceholder" SET Sensors.Lidar model "VLP_16" dataType "Intensity" accuracy "HIGH" timingAccuracy "LOW"
// "mainCar/LidarPlaceholder" ADD Sensors.LidarComponents.TextureVisualizer
// "mainCar/LidarPlaceholder" SET Sensors.LidarComponents.TextureVisualizer virtualCamera "lidarVirtualCamera" targetFps 20

"mainCar/LidarPlaceholder" SET active false
"mainCar/LidarPlaceholder" ADD Sensors.Lidar
"mainCar/LidarPlaceholder" SET Sensors.Lidar model "VLP_16" minAz -180 maxAz 180 minEl -30 maxEl 30 rpm 900 minimumIntensity 0 timingAccuracy "ULTRA" accuracy "HIGH" ipAddressOverride "192.168.1.100" disableUDPBroadcast false 

// CRASH!
// "mainCar/LidarPlaceholder" ADD Sensors.LidarComponents.TextureVisualizer
// "mainCar/LidarPlaceholder" SET Sensors.LidarComponents.TextureVisualizer virtualCamera "lidarVirtualCamera" targetFps 20

"Canvas/PIP" ADD RenderToTexture
"Canvas/PIP" SET RenderToTexture width 1920 height 1080
"Canvas/PIP" LISTEN RenderToTexture onRenderTexture TRIGGER "Canvas/PIP" UI.RawImage texture
"Canvas/PIP" LISTEN RenderToTexture onRenderTexture TRIGGER "Camera" Camera targetTexture
"Canvas/PIP" SET active true

"Canvas/FullScreen" ADD RenderToTexture
"Canvas/FullScreen" SET RenderToTexture width 1024 height 768
"Canvas/FullScreen" LISTEN RenderToTexture onRenderTexture TRIGGER "Canvas/FullScreen" UI.RawImage texture
// "Canvas/FullScreen" LISTEN RenderToTexture onRenderTexture TRIGGER "mainCar/LidarPlaceholder" Sensors.LidarComponents.TextureVisualizer outputTexture
"Canvas/FullScreen" SET active true

"lidarVirtualCamera" SET AutoOrbit enabled true

"mainCar" SET active true
"mainCar/LidarPlaceholder" SET active true
NOOP
"disk1" SET active false
NOOP
"disk1" SET active true

// ROS -------------------------------------------------------------------------

CREATE "ROS2"
"ROS2" SET active false
"ROS2" ADD Sensors.ROS2
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
"ROS2" SET active true
NOOP

// take a shot from all cameras
// "disk1" EXECUTE Sensors.Disk Snapshot
