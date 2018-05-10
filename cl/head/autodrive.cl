CREATE "autodrive/autodrive_tile" FROM "autodrive" AS "autodrive"
CREATE "autodrive/SyncityJPickup" FROM "autodrive" AS "SyncityJPickup"
"autodrive" ADD WindZone
"autodrive" SET WindZone mode "Directional" radius 0 windMain 1 windTurbulence 1 windPulseMagnitude 0.5 windPulseFrequency 0.01 
CREATE "SyncityJPickup/cameras"
"SyncityJPickup/cameras" SET active false
"SyncityJPickup/cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
CREATE "SyncityJPickup/cameras/Front"
"SyncityJPickup/cameras/Front" SET active false
"SyncityJPickup/cameras/Front" ADD Camera
"SyncityJPickup/cameras/Front" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "SyncityJPickup/cameras" PlayerCamera "SyncityJPickup/cameras/Front" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "SyncityJPickup/cameras/Front" "SyncityJPickup/cameras/Front"
"EnviroSky" SET active true
"SyncityJPickup/cameras/Front" SET active true
[UI.Window] ShowFromCamera "SyncityJPickup/cameras/Front" AS "Front" WITH 640 480 24 "ARGB32" "Default"
"SyncityJPickup/cameras" SET active true
"SyncityJPickup/cameras/Front" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"SyncityJPickup/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"SyncityJPickup/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
CREATE "SyncityJPickup/cameras/Depth"
"SyncityJPickup/cameras/Depth" SET active false
"SyncityJPickup/cameras/Depth" ADD Camera Cameras.RenderDepthBufferSimple Sensors.RenderCamera
"SyncityJPickup/cameras/Depth" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading"
"SyncityJPickup/cameras/Depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
CREATE RenderTexture 640 480 32 "RFloat" "Default" AS "SyncityJPickup_cameras_Depth_RT"
"SyncityJPickup_cameras_Depth_RT" SET name "SyncityJPickup/cameras/Depth"
"SyncityJPickup_cameras_Depth_RT" EXECUTE @Create
"SyncityJPickup/cameras/Depth" SET Camera targetTexture "SyncityJPickup_cameras_Depth_RT"
"SyncityJPickup/cameras/Depth" SET Sensors.RenderCamera format "RFloat" resolution (640 480)
"SyncityJPickup/cameras/Depth" SET active true
[UI.Window] ShowFromRenderTexture "SyncityJPickup_cameras_Depth_RT"
"Segmentation.Profile.instance" PUSH classes "Void" "LINES" "DIRT" "ROAD" "PROPS" "SIGNS"
CREATE "SyncityJPickup/cameras/Segment"
"SyncityJPickup/cameras/Segment" SET active false
"SyncityJPickup/cameras/Segment" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors
"SyncityJPickup/cameras/Segment" SET SegmentationCamera transparencyCutout 0
"SyncityJPickup/cameras/Segment" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"SyncityJPickup/cameras/Segment" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"SyncityJPickup/cameras/Segment" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Void->black" "LINES->white" "DIRT->blue" "ROAD->#838383" "PROPS->#09FF00" "SIGNS->red"
"SyncityJPickup/cameras/Segment" ADD Segmentation.Output.FilteredBoundingBoxes
"SyncityJPickup/cameras/Segment" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "LINES" "DIRT" "ROAD" "PROPS" "SIGNS"
"SyncityJPickup/cameras/Segment" SET active true
[UI.Window] ShowFromCamera "SyncityJPickup/cameras/Segment" AS "Segment" WITH 640 480 24 "ARGB32" "Default"
CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "/tmp/"
"disk1" SET active true
"disk1" SET active false
CREATE "disk1/Syncityjpickup/cameras/front"
"disk1/Syncityjpickup/cameras/front" ADD Sensors.RenderTextureLink
"disk1/Syncityjpickup/cameras/front" SET Sensors.RenderTextureLink target "Front"
"disk1/Syncityjpickup/cameras/front" SET active true
CREATE "disk1/Syncityjpickup/cameras/depth"
"disk1/Syncityjpickup/cameras/depth" ADD Sensors.RenderTextureLink
"disk1/Syncityjpickup/cameras/depth" SET Sensors.RenderTextureLink target "Depth"
"disk1/Syncityjpickup/cameras/depth" SET Sensors.RenderTextureLink outputType "DEPTH"
"disk1/Syncityjpickup/cameras/depth" SET active true
CREATE "disk1/Syncityjpickup/cameras/segment"
"disk1/Syncityjpickup/cameras/segment" ADD Sensors.RenderTextureLink
"disk1/Syncityjpickup/cameras/segment" SET Sensors.RenderTextureLink target "Segment"
"disk1/Syncityjpickup/cameras/segment" SET active true
"disk1" SET active true
"autodrive/Road/Lines" ADD Segmentation.Entity Segmentation.Class
"autodrive/Road/Lines" SET Segmentation.Class className "LINES"
"autodrive/Road/Dirt" ADD Segmentation.Entity Segmentation.Class
"autodrive/Road/Dirt" SET Segmentation.Class className "DIRT"
"autodrive/Road/Props" ADD Segmentation.Entity Segmentation.Class
"autodrive/Road/Props" SET Segmentation.Class className "PROPS"
"autodrive/Road/Signs" ADD Segmentation.Entity Segmentation.Class
"autodrive/Road/Signs" SET Segmentation.Class className "SIGNS"
"autodrive/Road/Road floor Signs" ADD Segmentation.Entity Segmentation.Class
"autodrive/Road/Road floor Signs" SET Segmentation.Class className "SIGNS"
"autodrive/Terrain New" ADD Segmentation.Class
"autodrive/Terrain New" SET Segmentation.Class className "DIRT"
"autodrive/Road/Autodrive Road" ADD Segmentation.Class
"autodrive/Road/Autodrive Road" SET Segmentation.Class className "ROAD"
"SyncityJPickup/cameras" SET Transform localPosition (0 0.872 2.318) localEulerAngles (0 0 0)
"SyncityJPickup" SET Transform position (-100.76 2.25 -415.57) eulerAngles (0.274 37.499 0)
"SyncityJPickup" SET VPCustomInput enabled true
"SyncityJPickup/cameras/Front" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"SyncityJPickup/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"SyncityJPickup/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.eyeAdaptation.enabled true
"SyncityJPickup/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.tonemapping.tonemapper "1"
"SyncityJPickup/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.antialiasing.enabled true profile.antialiasing.settings.method 1 profile.antialiasing.settings.taaSettings.jitterSpread 1.0 profile.antialiasing.settings.taaSettings.sharpen 0.8 profile.antialiasing.settings.taaSettings.stationaryBlending 0.99 profile.antialiasing.settings.taaSettings.motionBlending 0.8 
"SyncityJPickup/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.ambientOcclusion.enabled true profile.ambientOcclusion.settings.intensity 1.3 profile.ambientOcclusion.settings.radius 0.3 profile.ambientOcclusion.settings.sampleCount 10 profile.ambientOcclusion.settings.downsampling 1 profile.ambientOcclusion.settings.forceForwardCompatibility 0 profile.ambientOcclusion.settings.ambientOnly 0 profile.ambientOcclusion.settings.highPrecision 0 
"SyncityJPickup/cameras/Front" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled true profile.motionBlur.settings.shutterAngle 180 profile.motionBlur.settings.sampleCount 4 profile.motionBlur.settings.frameBlending 0.5 
"autodrive" SET active true
CREATE "SyncityJPickup/Lidar"
"SyncityJPickup/Lidar" SET Transform localPosition (0 2 0)
"SyncityJPickup/Lidar" SET Transform localEulerAngles (0 0 0)
"SyncityJPickup/Lidar" ADD Sensors.Lidar
"SyncityJPickup/Lidar" SET Sensors.Lidar model "VLP_16" minAz -180 maxAz 180 minEl -30 maxEl 30 rpm 900 minimumIntensity 0 timingAccuracy "ULTRA" accuracy "HIGH" ipAddressOverride "192.168.1.100" disableUDPBroadcast false 
"SyncityJPickup/Lidar" SET active true
"SyncityJPickup/cameras/Front" SET Sensors.RenderCamera alwaysOn true
"SyncityJPickup/cameras/Depth" SET Sensors.RenderCamera alwaysOn true
"SyncityJPickup/cameras/Segment" SET Sensors.RenderCamera alwaysOn true
"SyncityJPickup/cameras/Front" SET Camera enabled true
"SyncityJPickup/cameras/Depth" SET Camera enabled true
"SyncityJPickup/cameras/Segment" SET Camera enabled true
"SyncityJPickup" SET active true
"EnviroSky" EXECUTE EnviroSky ChangeWeather "Cloudy 1"
CREATE "ROS2"
"ROS2" SET active false
"ROS2" ADD Sensors.ROS2
CREATE "ROS2/throttle"
"ROS2/throttle" ADD Sensors.WriteFieldLink
"ROS2/throttle" SET Sensors.WriteFieldLink topicName "syncity/throttle" target "SyncityJPickup" componentName "VPCustomInput" fieldName "externalThrottle" intervalSeconds 0.5 
"ROS2/throttle" SET active true
CREATE "ROS2/brake"
"ROS2/brake" ADD Sensors.WriteFieldLink
"ROS2/brake" SET Sensors.WriteFieldLink topicName "syncity/brake" target "SyncityJPickup" componentName "VPCustomInput" fieldName "externalBrake" intervalSeconds 0.5 
"ROS2/brake" SET active true
CREATE "ROS2/handbrake"
"ROS2/handbrake" ADD Sensors.WriteFieldLink
"ROS2/handbrake" SET Sensors.WriteFieldLink topicName "syncity/handbrake" target "SyncityJPickup" componentName "VPCustomInput" fieldName "externalHandbrake" intervalSeconds 0.5 
"ROS2/handbrake" SET active true
CREATE "ROS2/steer"
"ROS2/steer" ADD Sensors.WriteFieldLink
"ROS2/steer" SET Sensors.WriteFieldLink topicName "syncity/steer" target "SyncityJPickup" componentName "VPCustomInput" fieldName "externalSteer" intervalSeconds 0.5 
"ROS2/steer" SET active true
CREATE "ROS2/velocity"
"ROS2/velocity" ADD Sensors.ReadFieldLink
"ROS2/velocity" SET Sensors.ReadFieldLink topicName "syncity/velocity" target "SyncityJPickup" componentName "Rigidbody" fieldName "velocity" intervalSeconds 0.5 onChange true 
"ROS2/velocity" SET active true
CREATE "ROS2/angularVelocity"
"ROS2/angularVelocity" ADD Sensors.ReadFieldLink
"ROS2/angularVelocity" SET Sensors.ReadFieldLink topicName "syncity/angularVelocity" target "SyncityJPickup" componentName "Rigidbody" fieldName "angularVelocity" intervalSeconds 0.5 onChange true 
"ROS2/angularVelocity" SET active true
CREATE "ROS2/angularDrag"
"ROS2/angularDrag" ADD Sensors.ReadFieldLink
"ROS2/angularDrag" SET Sensors.ReadFieldLink topicName "syncity/angularDrag" target "SyncityJPickup" componentName "Rigidbody" fieldName "angularDrag" intervalSeconds 0.5 onChange true 
"ROS2/angularDrag" SET active true
CREATE "ROS2/position"
"ROS2/position" ADD Sensors.ReadFieldLink
"ROS2/position" SET Sensors.ReadFieldLink topicName "syncity/position" target "SyncityJPickup" componentName "Transform" fieldName "position" intervalSeconds 0.5 onChange true 
"ROS2/position" SET active true
CREATE "ROS2/rotation"
"ROS2/rotation" ADD Sensors.ReadFieldLink
"ROS2/rotation" SET Sensors.ReadFieldLink topicName "syncity/rotation" target "SyncityJPickup" componentName "Transform" fieldName "eulerAngles" intervalSeconds 0.5 onChange true 
"ROS2/rotation" SET active true
CREATE "ROS2/front_camera"
"ROS2/front_camera" ADD Sensors.ReadFieldLink
"ROS2/front_camera" SET Sensors.ReadFieldLink topicName "syncity/front_camera" target "SyncityJPickup/cameras/Front" componentName "Camera" fieldName "targetTexture" intervalSeconds 1 onChange true 
"ROS2/front_camera" SET active true
"SyncityJPickup/cameras/Front" SET Sensors.RenderCamera alwaysOn true
CREATE "ROS2/segmentation_camera"
"ROS2/segmentation_camera" ADD Sensors.ReadFieldLink
"ROS2/segmentation_camera" SET Sensors.ReadFieldLink topicName "syncity/segmentation_camera" target "SyncityJPickup/cameras/Segment" componentName "Camera" fieldName "targetTexture" intervalSeconds 1 onChange true 
"ROS2/segmentation_camera" SET active true
"SyncityJPickup/cameras/Segment" SET Sensors.RenderCamera alwaysOn true
CREATE "ROS2/depth_camera"
"ROS2/depth_camera" ADD Sensors.ReadFieldLink
"ROS2/depth_camera" SET Sensors.ReadFieldLink topicName "syncity/depth_camera" target "SyncityJPickup/cameras/Depth" componentName "Camera" fieldName "targetTexture" intervalSeconds 1 onChange true 
"ROS2/depth_camera" SET active true
"SyncityJPickup/cameras/Depth" SET Sensors.RenderCamera alwaysOn true
"ROS2" SET active true
