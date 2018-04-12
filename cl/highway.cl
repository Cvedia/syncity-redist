"Config.instance" SET physicsEnabled true
"Canvas" SET active false

// load highway scene ----------------------------------------------------------

LOAD "highway" FROM "highway_scene"
CREATE "Pickup" FROM "highway" AS "mainCar"

"mainCar" SET Transform position (1390.49 98.121 1958.68) eulerAngles (0 84.42 0)
"mainCar" ADD OSVehicle OSBHVehicleDriver Highway.ToggleBetweenAutoDriveAndUserControl
"mainCar" SET OSVehicle externControl true
"mainCar" SET OSBHVehicleDriver smoothAdjust 100.0
"mainCar" SET Highway.ToggleBetweenAutoDriveAndUserControl button "J"

// front / bumper camera -------------------------------------------------------

CREATE "mainCar/cameras"
"mainCar/cameras" SET active false
"mainCar/cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0) localPosition (0 0.872 2.318) localEulerAngles (0 0 0)

CREATE "mainCar/cameras/Front"
"mainCar/cameras/Front" SET active false
"mainCar/cameras/Front" ADD Camera
"mainCar/cameras/Front" SET Camera near 0.3 far 1000 fieldOfView 60 allowMSAA false

// postprocessing stack matching what's on the driver camera
"mainCar/cameras/Front" ADD EnviroSkyRendering
"mainCar/cameras/Front" ADD EnviroLightShafts
"mainCar/cameras/Front" ADD Postprocessing.EnviroMerged
"mainCar/cameras/Front" SET Postprocessing.EnviroMerged dayProfile ASSET "Highway/Resources/Day" FROM "highway" dayProfile ASSET "Highway/Resources/Night" FROM "highway"

"mainCar/cameras/Front" ADD UnityEngine.Rendering.PostProcessing.PostProcessLayer
"mainCar/cameras/Front" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 0 volumeTrigger "mainCar/cameras/Front"

"mainCar/cameras/Front" ADD Sensors.RenderCamera

// WARNING: This camera must be `alwaysOn` because is has motionBlur enabled on postprocessing
// otherwise motion blur would just blur the interleaving images
"mainCar/cameras/Front" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768) alwaysOn true

"mainCar/cameras/Front" SET Camera renderingPath "DeferredShading"
"mainCar/cameras/Front" SET active true

// depth camera ----------------------------------------------------------------

CREATE "mainCar/cameras/Depth"
"mainCar/cameras/Depth" SET active false
"mainCar/cameras/Depth" ADD Camera
"mainCar/cameras/Depth" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading" allowMSAA false
"mainCar/cameras/Depth" ADD Sensors.RenderCamera
//"mainCar/cameras/Depth" SET Sensors.RenderCamera format "RFloat" resolution (1024 768) alwaysOn false
"mainCar/cameras/Depth" SET Sensors.RenderCamera format "RFloat" resolution (1024 768) alwaysOn true
"mainCar/cameras/Depth" ADD Cameras.RenderDepthBufferSimple
"mainCar/cameras/Depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
"mainCar/cameras/Depth" SET active true

// segmentation camera ---------------------------------------------------------

CREATE "mainCar/cameras/Segment"
"mainCar/cameras/Segment" SET active false
"mainCar/cameras/Segment" ADD Camera
"mainCar/cameras/Segment" SET Camera near 0.3 far 1000 fieldOfView 60 allowMSAA false
"mainCar/cameras/Segment" ADD Sensors.RenderCamera
"mainCar/cameras/Segment" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768) alwaysOn true
"mainCar/cameras/Segment" SET Camera renderingPath "DeferredShading" targetTexture.filterMode "Point"
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

"RoadArchitectSystem1/Road1/MainMeshes/RoadMesh" ADD Segmentation.ClassGroup
"RoadArchitectSystem1/Road1/MainMeshes/RoadMesh" EXECUTE Segmentation.ClassGroup UpdateClass "ROAD"
"RoadArchitectSystem1/Road1/MainMeshes/ShoulderR" ADD Segmentation.ClassGroup
"RoadArchitectSystem1/Road1/MainMeshes/ShoulderR" EXECUTE Segmentation.ClassGroup UpdateClass "SHOULDER"
"RoadArchitectSystem1/Road1/MainMeshes/ShoulderL" ADD Segmentation.ClassGroup
"RoadArchitectSystem1/Road1/MainMeshes/ShoulderL" EXECUTE Segmentation.ClassGroup UpdateClass "SHOULDER"

// TODO: Break components apart
"Road meshes 1" ADD Segmentation.ClassGroup
"Road meshes 1" EXECUTE Segmentation.ClassGroup UpdateClass "STRUCT"
"Road meshes 3" ADD Segmentation.ClassGroup
"Road meshes 3" EXECUTE Segmentation.ClassGroup UpdateClass "STRUCT"

"Road meshes 2" ADD Segmentation.ClassGroup
"Road meshes 2" EXECUTE Segmentation.ClassGroup UpdateClass "BILLBOARD"

"Road trees" ADD Segmentation.ClassGroup
"Road trees" EXECUTE Segmentation.ClassGroup UpdateClass "TREE"

"spawner" ADD Segmentation.ClassGroup
"spawner" EXECUTE Segmentation.ClassGroup UpdateClass "CAR"
"spawner/Active" ADD Segmentation.ClassGroup
"spawner/Active" EXECUTE Segmentation.ClassGroup UpdateClass "CAR"

// main camera misc ------------------------------------------------------------

"Camera" ADD Sensors.RenderCamera
"Camera" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768) alwaysOn true
"Camera" SET Camera enabled true

"Camera" SET FlyCamera enabled false
"Camera" SET VPCameraController target "mainCar/DriverHeadPivot/DriverHead" 
"Camera" SET VPCameraController enabled true

// disk ------------------------------------------------------------------------

CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "E:\tmp\"

CREATE "disk1/mainCar/cameras/driver"
"disk1/mainCar/cameras/driver" ADD Sensors.RenderCameraLink
"disk1/mainCar/cameras/driver" SET Sensors.RenderCameraLink target "Camera"
"disk1/mainCar/cameras/driver" SET active true

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

// -----------------------------------------------------------------------------

// #include "highway_lidar.cl"
// #include "highway_pip.cl"

"lidarVirtualCamera" SET AutoOrbit enabled true

"mainCar" SET active true
"spawner" SET OSVehicleSpawner enabled true

"disk1" SET active true
NOOP

// #include "highway_ros.cl"

// take a shot from all cameras
// "disk1" EXECUTE Sensors.Disk Snapshot
