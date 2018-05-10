CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB" "cameras/cameraRGB"
"EnviroSky" SET active true
"cameras/cameraRGB" SET active true
[UI.Window] ShowFromCamera "cameras/cameraRGB" AS "cameraRGB" WITH 1024 768 24 "ARGB32" "Default"
"cameras" SET active true
"cameras/cameraRGB" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
"Segmentation.Profile.instance" PUSH classes "Void" "Car" "Drone"
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors
"cameras/segmentation" SET SegmentationCamera transparencyCutout 0
"cameras/segmentation" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Void->black" "Car->red" "Drone->blue"
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Car" "Drone"
"cameras/segmentation" SET active true
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1024 768 24 "ARGB32" "Default"
CREATE "cameras/depth"
"cameras/depth" SET active false
"cameras/depth" ADD Camera Cameras.RenderDepthBufferSimple Sensors.RenderCamera
"cameras/depth" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading"
"cameras/depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
CREATE RenderTexture 1024 768 32 "RFloat" "Default" AS "cameras_depth_RT"
"cameras_depth_RT" SET name "cameras/depth"
"cameras_depth_RT" EXECUTE @Create
"cameras/depth" SET Camera targetTexture "cameras_depth_RT"
"cameras/depth" SET Sensors.RenderCamera format "RFloat" resolution (1024 768)
"cameras/depth" SET active true
[UI.Window] ShowFromRenderTexture "cameras_depth_RT"
CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "/tmp/"
"disk1" SET active true
"disk1" SET active false
CREATE "disk1/Cameras/camerargb"
"disk1/Cameras/camerargb" ADD Sensors.RenderTextureLink
"disk1/Cameras/camerargb" SET Sensors.RenderTextureLink target "cameraRGB"
"disk1/Cameras/camerargb" SET active true
CREATE "disk1/Cameras/segmentation"
"disk1/Cameras/segmentation" ADD Sensors.RenderTextureLink
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink target "segmentation"
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink outputType "LOSSLESS"
"disk1/Cameras/segmentation" SET active true
CREATE "disk1/Cameras/depth"
"disk1/Cameras/depth" ADD Sensors.RenderTextureLink
"disk1/Cameras/depth" SET Sensors.RenderTextureLink target "depth"
"disk1/Cameras/depth" SET Sensors.RenderTextureLink outputType "DEPTH"
"disk1/Cameras/depth" SET active true
"disk1" SET active true
"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"
CREATE "Cars/VW_Golf_V/VW_Golf_V" FROM "cars" AS "obj/subject0"
"obj" SET active false
"obj/subject0" SET Transform position (0 0 0) eulerAngles (0 0 0)
"obj/subject0" ADD Segmentation.Entity Segmentation.Class
"obj/subject0" SET Segmentation.Class className "Car"
CREATE "Drones/DJI_Phantom_4_Pro/DJI_Phantom_4_Pron" FROM "drones" AS "obj/subject1"
"obj" SET active false
"obj/subject1" SET Transform position (0 2 0) eulerAngles (0 0 0)
"obj/subject1" ADD Segmentation.Entity Segmentation.Class
"obj/subject1" SET Segmentation.Class className "Drone"
"obj" SET Transform position (-6 0 -9) eulerAngles (0 0 0)
"obj" SET active true
"obj/subject0" SET active true
"obj/subject1" SET active true
"cameras/cameraRGB" SET Camera enabled true
"cameras/segmentation" SET Camera enabled true
"cameras" SET Transform position (0 1 -16)
"cameras" SET Transform eulerAngles (0 -40 0)
"EnviroSky" SET EnviroSky cloudsMode "Volume"
"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage -0.04
"EnviroSky" EXECUTE EnviroSky ChangeWeather "Cloudy 1"
