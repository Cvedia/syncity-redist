CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
"Canvas/Cameras/Viewport/Content" SET UI.GridLayoutGroup cellSize (1024 768)
"Canvas" SET active true
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera Sensors.RenderCamera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
"cameras/cameraRGB" SET Sensors.RenderCamera format "ARGB32" resolution (640 480)
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB" "cameras/cameraRGB"
"EnviroSky" SET active true
"cameras/cameraRGB" SET active true
"cameras" SET active true
"cameras/cameraRGB" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera Segmentation.Segmentation Segmentation.LookUpTable Sensors.RenderCamera
"cameras/segmentation" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Sensors.RenderCamera format "ARGB32" resolution (640 480)
"cameras/segmentation" SET Segmentation.Segmentation minimumObjectVisibility 0 outputType "Auto" boundingBoxesExtensionAmount 0 transparencyCutout 0 
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "Void"
"cameras/segmentation" PUSH Segmentation.Segmentation boundingBoxesFilter "Car"
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "Car"
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "Void" "Car"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "black" "red"
"cameras/segmentation" EXECUTE Segmentation.LookUpTable MarkTextureDirty
"cameras/segmentation" SET active true
CREATE "cameras/depth"
"cameras/depth" SET active false
"cameras/depth" ADD Camera Sensors.RenderCamera
"cameras/depth" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading"
"cameras/depth" SET Sensors.RenderCamera format "RFloat" resolution (640 480)
"cameras/depth" ADD Cameras.RenderDepthBufferSimple
"cameras/depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
"cameras/depth" SET active true
CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "/tmp/"
"disk1" SET active true
"disk1" SET active false
CREATE "disk1/Cameras/camerargb"
"disk1/Cameras/camerargb" ADD Sensors.RenderCameraLink
"disk1/Cameras/camerargb" SET Sensors.RenderCameraLink target "cameras/cameraRGB"
"disk1/Cameras/camerargb" SET active true
CREATE "disk1/Cameras/segmentation"
"disk1/Cameras/segmentation" ADD Sensors.RenderCameraLink
"disk1/Cameras/segmentation" SET Sensors.RenderCameraLink target "cameras/segmentation"
"disk1/Cameras/segmentation" SET active true
CREATE "disk1/Cameras/depth"
"disk1/Cameras/depth" ADD Sensors.RenderCameraLink
"disk1/Cameras/depth" SET Sensors.RenderCameraLink target "cameras/depth"
"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"
"disk1/Cameras/depth" SET active true
"disk1" SET active true
CREATE "Cars/VW_Golf_V/VW_Golf_V" FROM "cars" AS "obj/subject"
"obj" SET active false
"obj/subject" SET Transform position (0 0 0)
"obj/subject" SET Transform eulerAngles (0 0 0)
"obj" ADD Segmentation.ClassGroup
"obj" SET Segmentation.ClassGroup itemsClassName "Car"
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
CREATE "ROS2/camera"
"ROS2/camera" ADD Sensors.ReadFieldLink
"ROS2/camera" SET Sensors.ReadFieldLink topicName "syncity/camera" target "cameras/cameraRGB" componentName "Camera" fieldName "targetTexture" intervalSeconds 0.5 onChange true 
"ROS2/camera" SET active true
"cameras/cameraRGB" SET Sensors.RenderCamera alwaysOn true
"ROS2" SET active true
