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
[UI.Window] ShowFromCamera "cameras/cameraRGB" AS "cameraRGB" WITH 1024 768 24 "ARGB32" "Default"
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
"cameras/segmentation" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Void->black" "Car->red"
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Car"
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1024 768 24 "ARGB32" "Default"
"cameras/segmentation" SET active true
CREATE "cameras/depth_blob"
"cameras/depth_blob" SET active false
"cameras/depth_blob" ADD Camera Cameras.RenderDepthBufferSimple
"cameras/depth_blob" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading"
"cameras/depth_blob" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
[UI.Window] ShowFromCamera "cameras/depth_blob" AS "depth_blob" WITH 1024 768 32 "RFloat" "Default"
"cameras/depth_blob" SET active true
CREATE "cameras/depth_depth"
"cameras/depth_depth" SET active false
"cameras/depth_depth" ADD Camera Cameras.RenderDepthBufferSimple
"cameras/depth_depth" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading"
"cameras/depth_depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
[UI.Window] ShowFromCamera "cameras/depth_depth" AS "depth_depth" WITH 1024 768 32 "RFloat" "Default"
"cameras/depth_depth" SET active true
CREATE "cameras/depth_rgb"
"cameras/depth_rgb" SET active false
"cameras/depth_rgb" ADD Camera Cameras.RenderDepthBufferSimple
"cameras/depth_rgb" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading"
"cameras/depth_rgb" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
[UI.Window] ShowFromCamera "cameras/depth_rgb" AS "depth_rgb" WITH 1024 768 32 "RFloat" "Default"
"cameras/depth_rgb" SET active true
CREATE "cameras/depth_jpg"
"cameras/depth_jpg" SET active false
"cameras/depth_jpg" ADD Camera Cameras.RenderDepthBufferSimple
"cameras/depth_jpg" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading"
"cameras/depth_jpg" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
[UI.Window] ShowFromCamera "cameras/depth_jpg" AS "depth_jpg" WITH 1024 768 32 "RFloat" "Default"
"cameras/depth_jpg" SET active true
CREATE "cameras/depth_tif"
"cameras/depth_tif" SET active false
"cameras/depth_tif" ADD Camera Cameras.RenderDepthBufferSimple
"cameras/depth_tif" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading"
"cameras/depth_tif" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
[UI.Window] ShowFromCamera "cameras/depth_tif" AS "depth_tif" WITH 1024 768 32 "RFloat" "Default"
"cameras/depth_tif" SET active true
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
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink outputType "LOSSLESS"
"disk1/Cameras/segmentation" SET active true
CREATE "disk1/Cameras/depth_blob"
"disk1/Cameras/depth_blob" ADD Sensors.RenderTextureLink
"disk1/Cameras/depth_blob" SET Sensors.RenderTextureLink target "depth_blob"
"disk1/Cameras/depth_blob" SET Sensors.RenderTextureLink outputType "DEPTH"
"disk1/Cameras/depth_blob" SET active true
CREATE "disk1/Cameras/depth_depth"
"disk1/Cameras/depth_depth" ADD Sensors.RenderTextureLink
"disk1/Cameras/depth_depth" SET Sensors.RenderTextureLink target "depth_depth"
"disk1/Cameras/depth_depth" SET Sensors.RenderTextureLink outputType "DEPTH"
"disk1/Cameras/depth_depth" SET active true
CREATE "disk1/Cameras/depth_rgb"
"disk1/Cameras/depth_rgb" ADD Sensors.RenderTextureLink
"disk1/Cameras/depth_rgb" SET Sensors.RenderTextureLink target "depth_rgb"
"disk1/Cameras/depth_rgb" SET Sensors.RenderTextureLink outputType "DEPTH"
"disk1/Cameras/depth_rgb" SET active true
CREATE "disk1/Cameras/depth_jpg"
"disk1/Cameras/depth_jpg" ADD Sensors.RenderTextureLink
"disk1/Cameras/depth_jpg" SET Sensors.RenderTextureLink target "depth_jpg"
"disk1/Cameras/depth_jpg" SET Sensors.RenderTextureLink outputType "DEPTH"
"disk1/Cameras/depth_jpg" SET active true
CREATE "disk1/Cameras/depth_tif"
"disk1/Cameras/depth_tif" ADD Sensors.RenderTextureLink
"disk1/Cameras/depth_tif" SET Sensors.RenderTextureLink target "depth_tif"
"disk1/Cameras/depth_tif" SET Sensors.RenderTextureLink outputType "DEPTH"
"disk1/Cameras/depth_tif" SET active true
"disk1" SET active true
"disk1/Cameras/depth_blob" SET Sensors.RenderCameraLink outputType "BLOB"
"disk1/Cameras/depth_depth" SET Sensors.RenderCameraLink outputType "DEPTH"
"disk1/Cameras/depth_rgb" SET Sensors.RenderCameraLink outputType "RGB"
"disk1/Cameras/depth_jpg" SET Sensors.RenderCameraLink outputType "CUSTOM" outputChannels 3 outputPixelSize 1 outputExtension "jpg" 
"disk1/Cameras/depth_tif" SET Sensors.RenderCameraLink outputType "CUSTOM" outputChannels 1 outputPixelSize 2 outputExtension "tif" 
CREATE "Cars/VW_Golf_V/VW_Golf_V" FROM "cars" AS "obj/subject"
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
