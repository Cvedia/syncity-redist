LOAD "Savannah" FROM "tile"
"Savannah" ADD WindZone
CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
"cameras" SET Orbit target "Savannah/Main Terrain" targetOffset (1667.05 32.37876 1000) snapOffset (0 60 0)
"Segmentation.Profile.instance" PUSH classes "Void" "Car" "Animal" "Human"
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors
"cameras/segmentation" SET SegmentationCamera transparencyCutout 0
"cameras/segmentation" SET Camera near 0.3 far 10000 fieldOfView 90 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Void->black" "Car->red" "Animal->blue" "Human->green" "ground->#807C00FF"
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Car" "Animal" "Human"
"cameras/segmentation" SET active true
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1024 768 24 "ARGB32" "Default"
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 10000 fieldOfView 90 renderingPath "UsePlayerSettings"
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
CREATE "cameras/depth"
"cameras/depth" SET active false
"cameras/depth" ADD Camera Cameras.RenderDepthBufferSimple
"cameras/depth" SET Camera near 0.3 far 1000 fieldOfView 90 renderingPath "DeferredShading"
"cameras/depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
"cameras/depth" SET active true
[UI.Window] ShowFromCamera "cameras/depth" AS "depth" WITH 1024 768 32 "RFloat" "Default"
"Savannah" SET active true
"Savannah" ADD Segmentation.Entity Segmentation.Class
"Savannah" SET Segmentation.Class className "ground"
"Savannah" SET active false
"Savannah/Main Terrain" SET Segmentation.Class className "ground"
"Savannah/Main Terrain/SubMeshes" ADD Segmentation.Class
"Savannah/Main Terrain/SubMeshes" SET Segmentation.Class className "ground"
"Savannah" SET active true
CREATE "cameras/thermal"
"cameras/thermal" SET active false
"cameras/thermal" ADD Camera Thermal.ThermalCamera UnityEngine.PostProcessing.PostProcessingBehaviour CameraFilterPack_Pixelisation_DeepOilPaintHQ CameraFilterPack_Blur_Noise Thermal.GlobalTreeSettings
"cameras/thermal" SET Camera near 0.3 far 10000 fieldOfView 90
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
CREATE "disk1/Cameras/thermal"
"disk1/Cameras/thermal" ADD Sensors.RenderTextureLink
"disk1/Cameras/thermal" SET Sensors.RenderTextureLink target "thermal"
"disk1/Cameras/thermal" SET active true
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
CREATE "spawner/animals0/container"
"spawner/animals0/container" SET active false
"spawner/animals0/container" ADD RandomProps.Rectangle
"spawner/animals0/container" ADD RandomProps.PropArea
"spawner/animals0/container" SET RandomProps.PropArea tags "+animal, +thermal"
"spawner/animals0/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck true stickToGround true 
"spawner/animals0/container" SET RandomProps.Rectangle size (1000 1000)
"spawner/animals0/container" SET Transform position (1685 591 7894) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals0/container" ADD Segmentation.Class
"spawner/animals0/container" SET Segmentation.Class className "Animal"
"spawner/animals0/container" SET active true
"spawner/animals0" SET active true
CREATE "spawner/cars0/container"
"spawner/cars0/container" SET active false
"spawner/cars0/container" ADD RandomProps.Rectangle
"spawner/cars0/container" ADD RandomProps.PropArea
"spawner/cars0/container" SET RandomProps.PropArea tags "+car, +thermal"
"spawner/cars0/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck true stickToGround true 
"spawner/cars0/container" SET RandomProps.Rectangle size (1000 1000)
"spawner/cars0/container" SET Transform position (1685 591 7894) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/cars0/container" ADD Segmentation.Class
"spawner/cars0/container" SET Segmentation.Class className "Car"
"spawner/cars0/container" SET active true
"spawner/cars0" SET active true
CREATE "spawner/humans0/container"
"spawner/humans0/container" SET active false
"spawner/humans0/container" ADD RandomProps.Rectangle
"spawner/humans0/container" ADD RandomProps.PropArea
"spawner/humans0/container" SET RandomProps.PropArea tags "+human"
"spawner/humans0/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck true stickToGround true 
"spawner/humans0/container" SET RandomProps.Rectangle size (1000 1000)
"spawner/humans0/container" SET Transform position (1685 591 7894) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/humans0/container" ADD Segmentation.Class
"spawner/humans0/container" SET Segmentation.Class className "Human"
"spawner/humans0/container" SET active true
"spawner/humans0" SET active true
"Savannah/Main Terrain" SET Thermal.ThermalTerrain ambientOffset 0
"Savannah/Main Terrain" SET Thermal.ThermalTerrain bandwidth 50
"Savannah/Main Terrain" SET Thermal.ThermalTerrain median 0
"spawner/cars0/container/RangeRover(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50
"spawner/animals0/container/Rino(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50
"spawner/animals0/container/giraffe(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 35
"spawner/animals0/container/Buffalo(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50
"spawner/animals0/container/Pelican(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50
"spawner/animals0/container/Flamingo(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50
"spawner/animals0/container/Vulture_Red(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50
"spawner/animals0/container/Vulture_White(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 50
"spawner/animals0/container/Elef(Clone)" SET Thermal.ThermalObjectBehaviour profile.heatiness.value 40
"spawner" SET active false
"spawner/cars0" SET RandomProps.PropArea numberOfProps 50
"spawner/animals0" SET RandomProps.PropArea numberOfProps 250
"spawner/humans0" SET RandomProps.PropArea numberOfProps 250
"spawner" SET active true
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/segmentation" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/depth" EXECUTE Sensors.RenderCamera RenderFrame
