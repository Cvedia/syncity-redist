LOAD "Savannah" FROM "tile"
"Savannah" ADD WindZone
"Savannah" SET active true
CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
"cameras" SET Orbit target "Savannah/Main Terrain" targetOffset (1667.05 32.37876 1000) snapOffset (0 60 0)
"Segmentation.Profile.instance" PUSH classes "Void" "Car" "Animal"
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors
"cameras/segmentation" SET SegmentationCamera transparencyCutout 0
"cameras/segmentation" SET Camera near 0.3 far 10000 fieldOfView 90 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Void->black" "Car->red" "Animal->blue"
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Car" "Animal"
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
CREATE "cameras/depth"
"cameras/depth" SET active false
"cameras/depth" ADD Camera Cameras.RenderDepthBufferSimple
"cameras/depth" SET Camera near 0.3 far 1000 fieldOfView 90 renderingPath "DeferredShading"
"cameras/depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
"cameras/depth" SET active true
[UI.Window] ShowFromCamera "cameras/depth" AS "depth" WITH 1024 768 32 "RFloat" "Default"
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
CREATE "disk1/Cameras/depth"
"disk1/Cameras/depth" ADD Sensors.RenderTextureLink
"disk1/Cameras/depth" SET Sensors.RenderTextureLink target "depth"
"disk1/Cameras/depth" SET Sensors.RenderTextureLink outputType "DEPTH"
"disk1/Cameras/depth" SET active true
CREATE "disk1/Cameras/thermal"
"disk1/Cameras/thermal" ADD Sensors.RenderTextureLink
"disk1/Cameras/thermal" SET Sensors.RenderTextureLink target "thermal"
"disk1/Cameras/thermal" SET active true
"disk1" SET active true
CREATE "spawner/cars0/container"
"spawner/cars0/container" SET active false
"spawner/cars0/container" ADD RandomProps.Rectangle
"spawner/cars0/container" ADD RandomProps.PropArea
"spawner/cars0/container" SET RandomProps.PropArea tags "+car, +thermal"
"spawner/cars0/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck true stickToGround true 
"spawner/cars0/container" SET RandomProps.Rectangle size (5000 625)
"spawner/cars0/container" SET Transform position (2519 591 9630) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/cars0/container" ADD Segmentation.Class
"spawner/cars0/container" SET Segmentation.Class className "Car"
"spawner/cars0/container" SET active true
"spawner/cars0" SET active true
CREATE "spawner/animals0/container"
"spawner/animals0/container" SET active false
"spawner/animals0/container" ADD RandomProps.Rectangle
"spawner/animals0/container" ADD RandomProps.PropArea
"spawner/animals0/container" SET RandomProps.PropArea tags "+animal, +thermal"
"spawner/animals0/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck true stickToGround true 
"spawner/animals0/container" SET RandomProps.Rectangle size (5000 625)
"spawner/animals0/container" SET Transform position (2519 591 9630) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals0/container" ADD Segmentation.Class
"spawner/animals0/container" SET Segmentation.Class className "Animal"
"spawner/animals0/container" SET active true
"spawner/animals0" SET active true
CREATE "spawner/animals1/container"
"spawner/animals1/container" SET active false
"spawner/animals1/container" ADD RandomProps.Rectangle
"spawner/animals1/container" ADD RandomProps.PropArea
"spawner/animals1/container" SET RandomProps.PropArea tags "+animal, +thermal"
"spawner/animals1/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck true stickToGround true 
"spawner/animals1/container" SET RandomProps.Rectangle size (5000 625)
"spawner/animals1/container" SET Transform position (2519 591 9630) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals1/container" ADD Segmentation.Class
"spawner/animals1/container" SET Segmentation.Class className "Animal"
"spawner/animals1/container" SET active true
"spawner/animals1" SET active true
CREATE "spawner/animals2/container"
"spawner/animals2/container" SET active false
"spawner/animals2/container" ADD RandomProps.Rectangle
"spawner/animals2/container" ADD RandomProps.PropArea
"spawner/animals2/container" SET RandomProps.PropArea tags "+animal, +thermal"
"spawner/animals2/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck true stickToGround true 
"spawner/animals2/container" SET RandomProps.Rectangle size (5000 625)
"spawner/animals2/container" SET Transform position (2519 591 9630) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals2/container" ADD Segmentation.Class
"spawner/animals2/container" SET Segmentation.Class className "Animal"
"spawner/animals2/container" SET active true
"spawner/animals2" SET active true
CREATE "spawner/animals3/container"
"spawner/animals3/container" SET active false
"spawner/animals3/container" ADD RandomProps.Rectangle
"spawner/animals3/container" ADD RandomProps.PropArea
"spawner/animals3/container" SET RandomProps.PropArea tags "+animal, +thermal"
"spawner/animals3/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck true stickToGround true 
"spawner/animals3/container" SET RandomProps.Rectangle size (5000 625)
"spawner/animals3/container" SET Transform position (2519 591 9630) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals3/container" ADD Segmentation.Class
"spawner/animals3/container" SET Segmentation.Class className "Animal"
"spawner/animals3/container" SET active true
"spawner/animals3" SET active true
CREATE "spawner/animalsF/container"
"spawner/animalsF/container" SET active false
"spawner/animalsF/container" ADD RandomProps.Rectangle
"spawner/animalsF/container" ADD RandomProps.PropArea
"spawner/animalsF/container" SET RandomProps.PropArea tags "+animal, +thermal"
"spawner/animalsF/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck true stickToGround true 
"spawner/animalsF/container" SET RandomProps.Rectangle size (100 100)
"spawner/animalsF/container" SET Transform position (1685 591 9856) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animalsF/container" ADD Segmentation.Class
"spawner/animalsF/container" SET Segmentation.Class className "Animal"
"spawner/animalsF/container" SET active true
"spawner/animalsF" SET active true
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
"spawner/animals1" SET Transform position (2519 591 9005)
"spawner/animals2" SET Transform position (2519 591 8380)
"spawner/animals3" SET Transform position (2519 591 7755)
"spawner" SET active true
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/segmentation" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/depth" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (9 35)
"cameras" SET Orbit distance 260~320 elevation 72 azimuth 0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 30)
"cameras" SET Orbit distance 260~320 elevation 71.75 azimuth 0.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 33)
"cameras" SET Orbit distance 260~320 elevation 71.5 azimuth 1.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 30)
"cameras" SET Orbit distance 260~320 elevation 71.25 azimuth 1.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 29)
"cameras" SET Orbit distance 260~320 elevation 71.0 azimuth 2.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 33)
"cameras" SET Orbit distance 260~320 elevation 70.75 azimuth 2.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 29)
"cameras" SET Orbit distance 260~320 elevation 70.5 azimuth 3.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 25)
"cameras" SET Orbit distance 260~320 elevation 70.25 azimuth 3.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 35)
"cameras" SET Orbit distance 260~320 elevation 70.0 azimuth 4.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 29)
"cameras" SET Orbit distance 260~320 elevation 69.75 azimuth 4.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 29)
"cameras" SET Orbit distance 260~320 elevation 69.5 azimuth 5.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 30)
"cameras" SET Orbit distance 260~320 elevation 69.25 azimuth 5.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 33)
"cameras" SET Orbit distance 260~320 elevation 69.0 azimuth 6.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 32)
"cameras" SET Orbit distance 260~320 elevation 68.75 azimuth 6.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 30)
"cameras" SET Orbit distance 260~320 elevation 68.5 azimuth 7.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 28)
"cameras" SET Orbit distance 260~320 elevation 68.25 azimuth 7.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 32)
"cameras" SET Orbit distance 260~320 elevation 68.0 azimuth 8.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 29)
"cameras" SET Orbit distance 260~320 elevation 67.75 azimuth 8.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 32)
"cameras" SET Orbit distance 260~320 elevation 67.5 azimuth 9.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 35)
"cameras" SET Orbit distance 260~320 elevation 67.25 azimuth 9.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 30)
"cameras" SET Orbit distance 260~320 elevation 67.0 azimuth 10.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 34)
"cameras" SET Orbit distance 260~320 elevation 66.75 azimuth 10.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 25)
"cameras" SET Orbit distance 260~320 elevation 66.5 azimuth 11.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 29)
"cameras" SET Orbit distance 260~320 elevation 66.25 azimuth 11.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 29)
"cameras" SET Orbit distance 260~320 elevation 66.0 azimuth 12.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 31)
"cameras" SET Orbit distance 260~320 elevation 65.75 azimuth 12.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 30)
"cameras" SET Orbit distance 260~320 elevation 65.5 azimuth 13.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 35)
"cameras" SET Orbit distance 260~320 elevation 65.25 azimuth 13.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 31)
"cameras" SET Orbit distance 260~320 elevation 65.0 azimuth 14.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 25)
"cameras" SET Orbit distance 260~320 elevation 64.75 azimuth 14.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 35)
"cameras" SET Orbit distance 260~320 elevation 64.5 azimuth 15.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 33)
"cameras" SET Orbit distance 260~320 elevation 64.25 azimuth 15.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 30)
"cameras" SET Orbit distance 260~320 elevation 64.0 azimuth 16.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 33)
"cameras" SET Orbit distance 260~320 elevation 63.75 azimuth 16.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 30)
"cameras" SET Orbit distance 260~320 elevation 63.5 azimuth 17.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 34)
"cameras" SET Orbit distance 260~320 elevation 63.25 azimuth 17.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 30)
"cameras" SET Orbit distance 260~320 elevation 63.0 azimuth 18.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 33)
"cameras" SET Orbit distance 260~320 elevation 62.75 azimuth 18.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 26)
"cameras" SET Orbit distance 260~320 elevation 62.5 azimuth 19.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 32)
"cameras" SET Orbit distance 260~320 elevation 62.25 azimuth 19.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 26)
"cameras" SET Orbit distance 260~320 elevation 62.0 azimuth 20.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 32)
"cameras" SET Orbit distance 260~320 elevation 61.75 azimuth 20.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 33)
"cameras" SET Orbit distance 260~320 elevation 61.5 azimuth 21.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 26)
"cameras" SET Orbit distance 260~320 elevation 61.25 azimuth 21.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 26)
"cameras" SET Orbit distance 260~320 elevation 61.0 azimuth 22.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 32)
"cameras" SET Orbit distance 260~320 elevation 60.75 azimuth 22.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 31)
"cameras" SET Orbit distance 260~320 elevation 60.5 azimuth 23.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 33)
"cameras" SET Orbit distance 260~320 elevation 60.25 azimuth 23.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 28)
"cameras" SET Orbit distance 260~320 elevation 60.0 azimuth 24.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 29)
"cameras" SET Orbit distance 260~320 elevation 59.75 azimuth 24.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 35)
"cameras" SET Orbit distance 260~320 elevation 59.5 azimuth 25.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 26)
"cameras" SET Orbit distance 260~320 elevation 59.25 azimuth 25.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 32)
"cameras" SET Orbit distance 260~320 elevation 59.0 azimuth 26.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 26)
"cameras" SET Orbit distance 260~320 elevation 58.75 azimuth 26.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 26)
"cameras" SET Orbit distance 260~320 elevation 58.5 azimuth 27.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 27)
"cameras" SET Orbit distance 260~320 elevation 58.25 azimuth 27.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 32)
"cameras" SET Orbit distance 260~320 elevation 58.0 azimuth 28.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 25)
"cameras" SET Orbit distance 260~320 elevation 57.75 azimuth 28.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 32)
"cameras" SET Orbit distance 260~320 elevation 57.5 azimuth 29.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 32)
"cameras" SET Orbit distance 260~320 elevation 57.25 azimuth 29.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 26)
"cameras" SET Orbit distance 260~320 elevation 57.0 azimuth 30.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 29)
"cameras" SET Orbit distance 260~320 elevation 56.75 azimuth 30.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 30)
"cameras" SET Orbit distance 260~320 elevation 56.5 azimuth 31.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 33)
"cameras" SET Orbit distance 260~320 elevation 56.25 azimuth 31.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 35)
"cameras" SET Orbit distance 260~320 elevation 56.0 azimuth 32.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 33)
"cameras" SET Orbit distance 260~320 elevation 55.75 azimuth 32.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 35)
"cameras" SET Orbit distance 260~320 elevation 55.5 azimuth 33.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 34)
"cameras" SET Orbit distance 260~320 elevation 55.25 azimuth 33.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 29)
"cameras" SET Orbit distance 260~320 elevation 55.0 azimuth 34.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 25)
"cameras" SET Orbit distance 260~320 elevation 54.75 azimuth 34.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 27)
"cameras" SET Orbit distance 260~320 elevation 54.5 azimuth 35.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 28)
"cameras" SET Orbit distance 260~320 elevation 54.25 azimuth 35.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 32)
"cameras" SET Orbit distance 260~320 elevation 54.0 azimuth 36.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 30)
"cameras" SET Orbit distance 260~320 elevation 53.75 azimuth 36.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 35)
"cameras" SET Orbit distance 260~320 elevation 53.5 azimuth 37.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 27)
"cameras" SET Orbit distance 260~320 elevation 53.25 azimuth 37.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 28)
"cameras" SET Orbit distance 260~320 elevation 53.0 azimuth 38.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 30)
"cameras" SET Orbit distance 260~320 elevation 52.75 azimuth 38.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 25)
"cameras" SET Orbit distance 260~320 elevation 52.5 azimuth 39.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 33)
"cameras" SET Orbit distance 260~320 elevation 52.25 azimuth 39.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 26)
"cameras" SET Orbit distance 260~320 elevation 52.0 azimuth 40.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 32)
"cameras" SET Orbit distance 260~320 elevation 51.75 azimuth 40.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 33)
"cameras" SET Orbit distance 260~320 elevation 51.5 azimuth 41.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 28)
"cameras" SET Orbit distance 260~320 elevation 51.25 azimuth 41.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 25)
"cameras" SET Orbit distance 260~320 elevation 51.0 azimuth 42.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 34)
"cameras" SET Orbit distance 260~320 elevation 50.75 azimuth 42.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 27)
"cameras" SET Orbit distance 260~320 elevation 50.5 azimuth 43.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 25)
"cameras" SET Orbit distance 260~320 elevation 50.25 azimuth 43.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 29)
"cameras" SET Orbit distance 260~320 elevation 50.0 azimuth 44.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 32)
"cameras" SET Orbit distance 260~320 elevation 49.75 azimuth 44.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 27)
"cameras" SET Orbit distance 260~320 elevation 49.5 azimuth 45.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 32)
"cameras" SET Orbit distance 260~320 elevation 49.25 azimuth 45.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 32)
"cameras" SET Orbit distance 260~320 elevation 49.0 azimuth 46.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 29)
"cameras" SET Orbit distance 260~320 elevation 48.75 azimuth 46.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 34)
"cameras" SET Orbit distance 260~320 elevation 48.5 azimuth 47.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 33)
"cameras" SET Orbit distance 260~320 elevation 48.25 azimuth 47.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 31)
"cameras" SET Orbit distance 260~320 elevation 48.0 azimuth 48.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 29)
"cameras" SET Orbit distance 260~320 elevation 47.75 azimuth 48.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 28)
"cameras" SET Orbit distance 260~320 elevation 47.5 azimuth 49.0 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 27)
"cameras" SET Orbit distance 260~320 elevation 47.25 azimuth 49.5 snapOffset (0 55~65 0)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
