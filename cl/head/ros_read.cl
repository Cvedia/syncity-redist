CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera Sensors.RenderCamera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true allowMSAA false 
CREATE RenderTexture 1024 768 24 "ARGB32" "Default" AS "cameraRGB_RT"
"cameraRGB_RT" SET name "cameras/cameraRGB"
"cameraRGB_RT" EXECUTE @Create
"cameras/cameraRGB" SET Camera targetTexture "cameraRGB_RT"
"cameras/cameraRGB" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768) alwaysOn false
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB" "cameras/cameraRGB"
"EnviroSky" SET active true
[UI.Window] ShowFromRenderTexture "cameraRGB_RT" AS "cameraRGB"
"cameras/cameraRGB" SET active true
"cameras" SET active true
"cameras/cameraRGB" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
"Segmentation.Profile.instance" PUSH classes "Void" "Car"
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors
"cameras/segmentation" SET SegmentationCamera transparencyCutout 0
"cameras/segmentation" SET Camera allowMSAA false allowHDR false near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Void->black" "Car->red"
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Car"
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1024 768 24 "ARGBFloat" "Default"
"cameras/segmentation" SET active true
CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "/tmp/" counter 1
"disk1" SET active true
"disk1" SET active false
CREATE "disk1/Cameras/camerargb"
"disk1/Cameras/camerargb" ADD Sensors.RenderTextureLink
"disk1/Cameras/camerargb" SET Sensors.RenderTextureLink target "cameraRGB"
"disk1/Cameras/camerargb" SET active true
CREATE "disk1/Cameras/segmentation"
"disk1/Cameras/segmentation" ADD Sensors.RenderTextureLink
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink target "segmentation"
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink outputType "CUSTOM" outputChannels 3 outputPixelSize 4 outputExtension "png"
"disk1/Cameras/segmentation" SET active true
"disk1" SET active true
CREATE "obj/subject" "Cars/VW_Golf_V/VW_Golf_V"
"obj" SET active false
"obj/subject" SET Transform position (0 0 0)
"obj/subject" SET Transform eulerAngles (0 0 0)
"obj" ADD Segmentation.Entity Segmentation.Class
"obj" SET Segmentation.Class className "Car"
"obj" SET Transform position (-6 0 -9)
"obj" SET Transform eulerAngles (0 0 0)
"obj" SET active true
"obj/subject" SET active true
"cameras/cameraRGB" SET Camera enabled true
"cameras/segmentation" SET Camera enabled true
"cameras" SET Transform position (0 1 -16)
"cameras" SET Transform eulerAngles (0 -40 0)
"EnviroSky" SET EnviroSky cloudsMode "Volume"
"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage -0.04
"EnviroSky" EXECUTE EnviroSky ChangeWeather "Cloudy 1"
CREATE "ROS2"
"ROS2" SET active false
"ROS2" ADD Sensors.ROS2
CREATE "ROS2/eulerAngles"
"ROS2/eulerAngles" ADD Sensors.ReadFieldLink
"ROS2/eulerAngles" SET Sensors.ReadFieldLink topicName "obj/r/eulerAngles" target "obj/subject" componentName "Transform" fieldName "eulerAngles" intervalSeconds 0.5 onChange true 
"ROS2/eulerAngles" SET active true
CREATE "ROS2/position"
"ROS2/position" ADD Sensors.ReadFieldLink
"ROS2/position" SET Sensors.ReadFieldLink topicName "obj/r/position" target "obj/subject" componentName "Transform" fieldName "position" intervalSeconds 0.5 onChange true 
"ROS2/position" SET active true
CREATE "ROS2/mass"
"ROS2/mass" ADD Sensors.ReadFieldLink
"ROS2/mass" SET Sensors.ReadFieldLink topicName "obj/r/mass" target "obj/subject" componentName "Rigidbody" fieldName "mass" intervalSeconds 0.5 onChange true 
"ROS2/mass" SET active true
CREATE "ROS2/drag"
"ROS2/drag" ADD Sensors.ReadFieldLink
"ROS2/drag" SET Sensors.ReadFieldLink topicName "obj/r/drag" target "obj/subject" componentName "Rigidbody" fieldName "drag" intervalSeconds 0.5 onChange true 
"ROS2/drag" SET active true
"ROS2" SET active true
