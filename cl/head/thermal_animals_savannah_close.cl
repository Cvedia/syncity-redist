LOAD "Savannah" FROM "tile"
"Savannah" ADD WindZone
"Savannah" SET active true
CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors Sensors.RenderCamera
"cameras/segmentation" SET SegmentationCamera transparencyCutout 0
"cameras/segmentation" SET Camera near 0.3 far 10000 fieldOfView 90 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768)
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Animal->blue"
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Animal"
"cameras/segmentation" SET active true
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1024 768 24 "ARGB32" "Default"
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera Sensors.RenderCamera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 10000 fieldOfView 90 renderingPath "UsePlayerSettings"
"cameras/cameraRGB" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768)
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
CREATE "cameras/thermal"
"cameras/thermal" SET active false
"cameras/thermal" ADD Camera Thermal.ThermalCamera UnityEngine.PostProcessing.PostProcessingBehaviour Sensors.RenderCamera CameraFilterPack_Pixelisation_DeepOilPaintHQ CameraFilterPack_Blur_Noise Thermal.GlobalTreeSettings
"cameras/thermal" SET Camera near 0.3 far 10000 fieldOfView 90
"cameras/thermal" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768)
"cameras/thermal" SET Camera renderingPath "UsePlayerSettings"
"cameras/thermal" SET Thermal.ThermalCamera enabled false
"cameras/thermal" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ enabled false
"cameras/thermal" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ _FixDistance 10.6 _Distance 0.06 _Size 0.481 Intensity 0.6 enabled true
"cameras/thermal" SET CameraFilterPack_Blur_Noise Distance (2 1) enabled true
"cameras/thermal" SET Thermal.GlobalTreeSettings temperature 8 temperatureBandwidth 50 temperatureMedian 0 treeLeafsHeatVariance 10 enabled true 
"cameras/thermal" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "Thermal"
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 15 temperatureRange (9 35) maxDistanceForProbeUpdate 100 useAGC true enabled true 
"cameras/thermal" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled false
"cameras/thermal" SET active true
[UI.Window] ShowFromCamera "cameras/thermal" AS "thermal" WITH 1024 768 24 "ARGB32" "Default"
CREATE "cameras/depth"
"cameras/depth" SET active false
"cameras/depth" ADD Camera Sensors.RenderCamera Cameras.RenderDepthBufferSimple
"cameras/depth" SET Camera near 0.3 far 1000 fieldOfView 90 renderingPath "DeferredShading"
"cameras/depth" SET Sensors.RenderCamera format "RFloat" resolution (1024 768)
"cameras/depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
"cameras/depth" SET active true
[UI.Window] ShowFromCamera "cameras/depth" AS "depth" WITH 1024 768 32 "RFloat" "Default"
CREATE "spawner/animals0/container"
"spawner/animals0/container" SET active false
"spawner/animals0/container" ADD RandomProps.Rectangle
"spawner/animals0/container" ADD RandomProps.PropArea
"spawner/animals0/container" SET RandomProps.PropArea tags "+animal, +thermal"
"spawner/animals0/container" SET RandomProps.PropArea async false numberOfProps 100 collisionCheck true stickToGround true 
"spawner/animals0/container" SET RandomProps.Rectangle size (100 100)
"spawner/animals0/container" SET Transform position (3193 374.7158 8161) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals0/container" ADD Segmentation.Class
"spawner/animals0/container" SET Segmentation.Class className "Animal"
"spawner/animals0/container" SET active true
"spawner/animals0" SET active true
CREATE "spawner/animals1/container"
"spawner/animals1/container" SET active false
"spawner/animals1/container" ADD RandomProps.Rectangle
"spawner/animals1/container" ADD RandomProps.PropArea
"spawner/animals1/container" SET RandomProps.PropArea tags "+animal, +thermal"
"spawner/animals1/container" SET RandomProps.PropArea async false numberOfProps 100 collisionCheck true stickToGround true 
"spawner/animals1/container" SET RandomProps.Rectangle size (100 100)
"spawner/animals1/container" SET Transform position (3193 374.7158 8161) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals1/container" ADD Segmentation.Class
"spawner/animals1/container" SET Segmentation.Class className "Animal"
"spawner/animals1/container" SET active true
"spawner/animals1" SET active true
CREATE "spawner/animals2/container"
"spawner/animals2/container" SET active false
"spawner/animals2/container" ADD RandomProps.Rectangle
"spawner/animals2/container" ADD RandomProps.PropArea
"spawner/animals2/container" SET RandomProps.PropArea tags "+animal, +thermal"
"spawner/animals2/container" SET RandomProps.PropArea async false numberOfProps 100 collisionCheck true stickToGround true 
"spawner/animals2/container" SET RandomProps.Rectangle size (100 100)
"spawner/animals2/container" SET Transform position (3193 374.7158 8161) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals2/container" ADD Segmentation.Class
"spawner/animals2/container" SET Segmentation.Class className "Animal"
"spawner/animals2/container" SET active true
"spawner/animals2" SET active true
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
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/segmentation" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/depth" EXECUTE Sensors.RenderCamera RenderFrame
"Savannah/Main Terrain" SET Thermal.ThermalTerrain ambientOffset 0
"Savannah/Main Terrain" SET Thermal.ThermalTerrain bandwidth 50
"Savannah/Main Terrain" SET Thermal.ThermalTerrain median 0
"cameras" SET Transform position (3167 265 8160)
"cameras" SET Transform eulerAngles (13 0 0)
