LOAD "Savannah" FROM "tile"
"Savannah" ADD WindZone
CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
"cameras" SET Orbit target "Savannah/Main Terrain" targetOffset (1667.05 32.37876 1000) snapOffset (0 60 0)
"Canvas/Cameras/Viewport/Content" SET UI.GridLayoutGroup cellSize (1024 768)
"Canvas" SET active true
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera Segmentation.Segmentation Segmentation.LookUpTable Sensors.RenderCamera
"cameras/segmentation" SET Camera near 0.3 far 10000 fieldOfView 90 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768)
"cameras/segmentation" SET Segmentation.Segmentation minimumObjectVisibility 0 outputType "Auto" boundingBoxesExtensionAmount 0 transparencyCutout 0 
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "Void"
"cameras/segmentation" PUSH Segmentation.Segmentation boundingBoxesFilter "Car"
"cameras/segmentation" PUSH Segmentation.Segmentation boundingBoxesFilter "Animal"
"cameras/segmentation" PUSH Segmentation.Segmentation boundingBoxesFilter "Human"
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "Car"
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "Animal"
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "Human"
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "ground"
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "Void" "Car" "Animal" "Human" "ground"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "black" "red" "blue" "green" "#807C00FF"
"cameras/segmentation" EXECUTE Segmentation.LookUpTable MarkTextureDirty
"cameras/segmentation" SET active true
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
"cameras" SET active true
"cameras/cameraRGB" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
CREATE "cameras/depth"
"cameras/depth" SET active false
"cameras/depth" ADD Camera Sensors.RenderCamera
"cameras/depth" SET Camera near 0.3 far 1000 fieldOfView 90 renderingPath "DeferredShading"
"cameras/depth" SET Sensors.RenderCamera format "RFloat" resolution (1024 768)
"cameras/depth" ADD Cameras.RenderDepthBufferSimple
"cameras/depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
"cameras/depth" SET active true
"Savannah" SET active true
"Savannah" ADD Segmentation.ClassGroup
"Savannah" SET Segmentation.ClassGroup itemsClassName "ground"
"Savannah" SET active false
"Savannah/Main Terrain" SET Segmentation.ClassInfo itemClass "ground"
"Savannah/Main Terrain/SubMeshes" ADD Segmentation.ClassInfo
"Savannah/Main Terrain/SubMeshes" SET Segmentation.ClassInfo itemClass "ground"
"Savannah" SET active true
CREATE "cameras/thermal"
"cameras/thermal" SET active false
"cameras/thermal" ADD Camera Thermal.ThermalCamera UnityEngine.PostProcessing.PostProcessingBehaviour Sensors.RenderCamera CameraFilterPack_Pixelisation_DeepOilPaintHQ CameraFilterPack_Blur_Noise Thermal.GlobalTreeSettings
"cameras/thermal" SET Camera near 0.3 far 10000 fieldOfView 90
"cameras/thermal" SET Sensors.RenderCamera format "ARGB32" resolution (2048 1536)
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
CREATE "disk1/Cameras/thermal"
"disk1/Cameras/thermal" ADD Sensors.RenderCameraLink
"disk1/Cameras/thermal" SET Sensors.RenderCameraLink target "cameras/thermal"
"disk1/Cameras/thermal" SET active true
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
CREATE "spawner/animals0/container"
"spawner/animals0/container" SET active false
"spawner/animals0/container" ADD RandomProps.Rectangle
"spawner/animals0/container" ADD RandomProps.PropArea
"spawner/animals0/container" SET RandomProps.PropArea tags "+animal, +thermal"
"spawner/animals0/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck true stickToGround true 
"spawner/animals0/container" SET RandomProps.Rectangle size (1000 1000)
"spawner/animals0/container" SET Transform position (1685 591 7894) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals0/container" ADD Segmentation.ClassGroup
"spawner/animals0/container" SET Segmentation.ClassGroup itemsClassName "Animal"
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
"spawner/cars0/container" ADD Segmentation.ClassGroup
"spawner/cars0/container" SET Segmentation.ClassGroup itemsClassName "Car"
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
"spawner/humans0/container" ADD Segmentation.ClassGroup
"spawner/humans0/container" SET Segmentation.ClassGroup itemsClassName "Human"
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
