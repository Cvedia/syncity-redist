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
"cameras/segmentation" SET Camera allowMSAA false allowHDR false near 0.3 far 10000 fieldOfView 90 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Void->black" "Car->red" "Animal->blue"
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Car" "Animal"
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1024 768 24 "ARGBFloat" "Default"
"cameras/segmentation" SET active true
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera Sensors.RenderCamera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 10000 fieldOfView 90 renderingPath "UsePlayerSettings" allowHDR true allowMSAA false 
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
[UI.Window] ShowFromCamera "cameras/thermal" AS "thermal" WITH 1024 768 24 "ARGB32" "Default"
"cameras/thermal" SET active true
CREATE "cameras/depth"
"cameras/depth" SET active false
"cameras/depth" ADD Camera Cameras.RenderDepthBufferSimple
"cameras/depth" SET Camera near 0.3 far 1000 fieldOfView 90 allowMSAA false renderingPath "DeferredShading"
"cameras/depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
[UI.Window] ShowFromCamera "cameras/depth" AS "depth" WITH 1024 768 32 "RFloat" "Default"
"cameras/depth" SET active true
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
"spawner/cars0/container" ADD Segmentation.Class Segmentation.Spawners.Entity
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
"spawner/animals0/container" ADD Segmentation.Class Segmentation.Spawners.Entity
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
"spawner/animals1/container" ADD Segmentation.Class Segmentation.Spawners.Entity
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
"spawner/animals2/container" ADD Segmentation.Class Segmentation.Spawners.Entity
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
"spawner/animals3/container" ADD Segmentation.Class Segmentation.Spawners.Entity
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
"spawner/animalsF/container" ADD Segmentation.Class Segmentation.Spawners.Entity
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
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 27)
"cameras" SET Orbit distance 260~320 elevation 71.75 azimuth 0.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 34)
"cameras" SET Orbit distance 260~320 elevation 71.5 azimuth 1.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 30)
"cameras" SET Orbit distance 260~320 elevation 71.25 azimuth 1.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 31)
"cameras" SET Orbit distance 260~320 elevation 71.0 azimuth 2.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 32)
"cameras" SET Orbit distance 260~320 elevation 70.75 azimuth 2.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 25)
"cameras" SET Orbit distance 260~320 elevation 70.5 azimuth 3.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 33)
"cameras" SET Orbit distance 260~320 elevation 70.25 azimuth 3.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 34)
"cameras" SET Orbit distance 260~320 elevation 70.0 azimuth 4.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 34)
"cameras" SET Orbit distance 260~320 elevation 69.75 azimuth 4.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 25)
"cameras" SET Orbit distance 260~320 elevation 69.5 azimuth 5.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 27)
"cameras" SET Orbit distance 260~320 elevation 69.25 azimuth 5.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 31)
"cameras" SET Orbit distance 260~320 elevation 69.0 azimuth 6.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 26)
"cameras" SET Orbit distance 260~320 elevation 68.75 azimuth 6.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 31)
"cameras" SET Orbit distance 260~320 elevation 68.5 azimuth 7.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 32)
"cameras" SET Orbit distance 260~320 elevation 68.25 azimuth 7.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 25)
"cameras" SET Orbit distance 260~320 elevation 68.0 azimuth 8.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 34)
"cameras" SET Orbit distance 260~320 elevation 67.75 azimuth 8.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 35)
"cameras" SET Orbit distance 260~320 elevation 67.5 azimuth 9.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 26)
"cameras" SET Orbit distance 260~320 elevation 67.25 azimuth 9.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 31)
"cameras" SET Orbit distance 260~320 elevation 67.0 azimuth 10.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 35)
"cameras" SET Orbit distance 260~320 elevation 66.75 azimuth 10.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 32)
"cameras" SET Orbit distance 260~320 elevation 66.5 azimuth 11.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 26)
"cameras" SET Orbit distance 260~320 elevation 66.25 azimuth 11.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 34)
"cameras" SET Orbit distance 260~320 elevation 66.0 azimuth 12.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 25)
"cameras" SET Orbit distance 260~320 elevation 65.75 azimuth 12.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 30)
"cameras" SET Orbit distance 260~320 elevation 65.5 azimuth 13.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 35)
"cameras" SET Orbit distance 260~320 elevation 65.25 azimuth 13.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 29)
"cameras" SET Orbit distance 260~320 elevation 65.0 azimuth 14.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 32)
"cameras" SET Orbit distance 260~320 elevation 64.75 azimuth 14.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 29)
"cameras" SET Orbit distance 260~320 elevation 64.5 azimuth 15.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 30)
"cameras" SET Orbit distance 260~320 elevation 64.25 azimuth 15.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 29)
"cameras" SET Orbit distance 260~320 elevation 64.0 azimuth 16.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 29)
"cameras" SET Orbit distance 260~320 elevation 63.75 azimuth 16.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 34)
"cameras" SET Orbit distance 260~320 elevation 63.5 azimuth 17.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 26)
"cameras" SET Orbit distance 260~320 elevation 63.25 azimuth 17.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 26)
"cameras" SET Orbit distance 260~320 elevation 63.0 azimuth 18.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 34)
"cameras" SET Orbit distance 260~320 elevation 62.75 azimuth 18.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 26)
"cameras" SET Orbit distance 260~320 elevation 62.5 azimuth 19.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 33)
"cameras" SET Orbit distance 260~320 elevation 62.25 azimuth 19.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 31)
"cameras" SET Orbit distance 260~320 elevation 62.0 azimuth 20.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 34)
"cameras" SET Orbit distance 260~320 elevation 61.75 azimuth 20.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 25)
"cameras" SET Orbit distance 260~320 elevation 61.5 azimuth 21.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 28)
"cameras" SET Orbit distance 260~320 elevation 61.25 azimuth 21.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 25)
"cameras" SET Orbit distance 260~320 elevation 61.0 azimuth 22.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 28)
"cameras" SET Orbit distance 260~320 elevation 60.75 azimuth 22.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 31)
"cameras" SET Orbit distance 260~320 elevation 60.5 azimuth 23.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 33)
"cameras" SET Orbit distance 260~320 elevation 60.25 azimuth 23.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 30)
"cameras" SET Orbit distance 260~320 elevation 60.0 azimuth 24.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 30)
"cameras" SET Orbit distance 260~320 elevation 59.75 azimuth 24.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 34)
"cameras" SET Orbit distance 260~320 elevation 59.5 azimuth 25.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 25)
"cameras" SET Orbit distance 260~320 elevation 59.25 azimuth 25.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 31)
"cameras" SET Orbit distance 260~320 elevation 59.0 azimuth 26.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 26)
"cameras" SET Orbit distance 260~320 elevation 58.75 azimuth 26.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 29)
"cameras" SET Orbit distance 260~320 elevation 58.5 azimuth 27.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 35)
"cameras" SET Orbit distance 260~320 elevation 58.25 azimuth 27.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 35)
"cameras" SET Orbit distance 260~320 elevation 58.0 azimuth 28.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 29)
"cameras" SET Orbit distance 260~320 elevation 57.75 azimuth 28.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 25)
"cameras" SET Orbit distance 260~320 elevation 57.5 azimuth 29.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 34)
"cameras" SET Orbit distance 260~320 elevation 57.25 azimuth 29.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 26)
"cameras" SET Orbit distance 260~320 elevation 57.0 azimuth 30.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 29)
"cameras" SET Orbit distance 260~320 elevation 56.75 azimuth 30.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 31)
"cameras" SET Orbit distance 260~320 elevation 56.5 azimuth 31.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 27)
"cameras" SET Orbit distance 260~320 elevation 56.25 azimuth 31.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 35)
"cameras" SET Orbit distance 260~320 elevation 56.0 azimuth 32.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 33)
"cameras" SET Orbit distance 260~320 elevation 55.75 azimuth 32.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 31)
"cameras" SET Orbit distance 260~320 elevation 55.5 azimuth 33.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 25)
"cameras" SET Orbit distance 260~320 elevation 55.25 azimuth 33.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 28)
"cameras" SET Orbit distance 260~320 elevation 55.0 azimuth 34.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 29)
"cameras" SET Orbit distance 260~320 elevation 54.75 azimuth 34.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 27)
"cameras" SET Orbit distance 260~320 elevation 54.5 azimuth 35.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 33)
"cameras" SET Orbit distance 260~320 elevation 54.25 azimuth 35.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 31)
"cameras" SET Orbit distance 260~320 elevation 54.0 azimuth 36.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 35)
"cameras" SET Orbit distance 260~320 elevation 53.75 azimuth 36.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 29)
"cameras" SET Orbit distance 260~320 elevation 53.5 azimuth 37.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 32)
"cameras" SET Orbit distance 260~320 elevation 53.25 azimuth 37.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 34)
"cameras" SET Orbit distance 260~320 elevation 53.0 azimuth 38.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 29)
"cameras" SET Orbit distance 260~320 elevation 52.75 azimuth 38.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 25)
"cameras" SET Orbit distance 260~320 elevation 52.5 azimuth 39.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 31)
"cameras" SET Orbit distance 260~320 elevation 52.25 azimuth 39.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 35)
"cameras" SET Orbit distance 260~320 elevation 52.0 azimuth 40.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 34)
"cameras" SET Orbit distance 260~320 elevation 51.75 azimuth 40.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 33)
"cameras" SET Orbit distance 260~320 elevation 51.5 azimuth 41.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 30)
"cameras" SET Orbit distance 260~320 elevation 51.25 azimuth 41.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 26)
"cameras" SET Orbit distance 260~320 elevation 51.0 azimuth 42.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 25)
"cameras" SET Orbit distance 260~320 elevation 50.75 azimuth 42.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 25)
"cameras" SET Orbit distance 260~320 elevation 50.5 azimuth 43.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 31)
"cameras" SET Orbit distance 260~320 elevation 50.25 azimuth 43.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 32)
"cameras" SET Orbit distance 260~320 elevation 50.0 azimuth 44.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 30)
"cameras" SET Orbit distance 260~320 elevation 49.75 azimuth 44.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 26)
"cameras" SET Orbit distance 260~320 elevation 49.5 azimuth 45.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 28)
"cameras" SET Orbit distance 260~320 elevation 49.25 azimuth 45.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 30)
"cameras" SET Orbit distance 260~320 elevation 49.0 azimuth 46.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 26)
"cameras" SET Orbit distance 260~320 elevation 48.75 azimuth 46.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 25)
"cameras" SET Orbit distance 260~320 elevation 48.5 azimuth 47.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 31)
"cameras" SET Orbit distance 260~320 elevation 48.25 azimuth 47.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 30)
"cameras" SET Orbit distance 260~320 elevation 48.0 azimuth 48.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 29)
"cameras" SET Orbit distance 260~320 elevation 47.75 azimuth 48.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 35)
"cameras" SET Orbit distance 260~320 elevation 47.5 azimuth 49.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 30)
"cameras" SET Orbit distance 260~320 elevation 47.25 azimuth 49.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 33)
"cameras" SET Orbit distance 260~320 elevation 47.0 azimuth 50.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 29)
"cameras" SET Orbit distance 260~320 elevation 46.75 azimuth 50.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 25)
"cameras" SET Orbit distance 260~320 elevation 46.5 azimuth 51.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 32)
"cameras" SET Orbit distance 260~320 elevation 46.25 azimuth 51.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 25)
"cameras" SET Orbit distance 260~320 elevation 46.0 azimuth 52.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 25)
"cameras" SET Orbit distance 260~320 elevation 45.75 azimuth 52.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 31)
"cameras" SET Orbit distance 260~320 elevation 45.5 azimuth 53.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 28)
"cameras" SET Orbit distance 260~320 elevation 45.25 azimuth 53.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 29)
"cameras" SET Orbit distance 260~320 elevation 45.0 azimuth 54.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 27)
"cameras" SET Orbit distance 260~320 elevation 44.75 azimuth 54.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 33)
"cameras" SET Orbit distance 260~320 elevation 44.5 azimuth 55.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 31)
"cameras" SET Orbit distance 260~320 elevation 44.25 azimuth 55.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 31)
"cameras" SET Orbit distance 260~320 elevation 44.0 azimuth 56.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 35)
"cameras" SET Orbit distance 260~320 elevation 43.75 azimuth 56.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 26)
"cameras" SET Orbit distance 260~320 elevation 43.5 azimuth 57.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 30)
"cameras" SET Orbit distance 260~320 elevation 43.25 azimuth 57.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 30)
"cameras" SET Orbit distance 260~320 elevation 43.0 azimuth 58.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 32)
"cameras" SET Orbit distance 260~320 elevation 42.75 azimuth 58.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 25)
"cameras" SET Orbit distance 260~320 elevation 42.5 azimuth 59.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 28)
"cameras" SET Orbit distance 260~320 elevation 42.25 azimuth 59.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 33)
"cameras" SET Orbit distance 260~320 elevation 42.0 azimuth 60.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 35)
"cameras" SET Orbit distance 260~320 elevation 41.75 azimuth 60.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 35)
"cameras" SET Orbit distance 260~320 elevation 41.5 azimuth 61.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 35)
"cameras" SET Orbit distance 260~320 elevation 41.25 azimuth 61.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 35)
"cameras" SET Orbit distance 260~320 elevation 41.0 azimuth 62.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 26)
"cameras" SET Orbit distance 260~320 elevation 40.75 azimuth 62.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 35)
"cameras" SET Orbit distance 260~320 elevation 40.5 azimuth 63.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 27)
"cameras" SET Orbit distance 260~320 elevation 40.25 azimuth 63.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 29)
"cameras" SET Orbit distance 260~320 elevation 40.0 azimuth 64.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 27)
"cameras" SET Orbit distance 260~320 elevation 39.75 azimuth 64.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 28)
"cameras" SET Orbit distance 260~320 elevation 39.5 azimuth 65.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 27)
"cameras" SET Orbit distance 260~320 elevation 39.25 azimuth 65.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 29)
"cameras" SET Orbit distance 260~320 elevation 39.0 azimuth 66.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 31)
"cameras" SET Orbit distance 260~320 elevation 38.75 azimuth 66.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 33)
"cameras" SET Orbit distance 260~320 elevation 38.5 azimuth 67.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 28)
"cameras" SET Orbit distance 260~320 elevation 38.25 azimuth 67.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 25)
"cameras" SET Orbit distance 260~320 elevation 38.0 azimuth 68.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 26)
"cameras" SET Orbit distance 260~320 elevation 37.75 azimuth 68.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 25)
"cameras" SET Orbit distance 260~320 elevation 37.5 azimuth 69.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 26)
"cameras" SET Orbit distance 260~320 elevation 37.25 azimuth 69.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 30)
"cameras" SET Orbit distance 260~320 elevation 37.0 azimuth 70.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 26)
"cameras" SET Orbit distance 260~320 elevation 36.75 azimuth 70.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 35)
"cameras" SET Orbit distance 260~320 elevation 36.5 azimuth 71.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 33)
"cameras" SET Orbit distance 260~320 elevation 36.25 azimuth 71.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 27)
"cameras" SET Orbit distance 260~320 elevation 36.0 azimuth 72.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 34)
"cameras" SET Orbit distance 260~320 elevation 35.75 azimuth 72.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 33)
"cameras" SET Orbit distance 260~320 elevation 35.5 azimuth 73.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 31)
"cameras" SET Orbit distance 260~320 elevation 35.25 azimuth 73.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 30)
"cameras" SET Orbit distance 260~320 elevation 35.0 azimuth 74.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 26)
"cameras" SET Orbit distance 260~320 elevation 34.75 azimuth 74.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 29)
"cameras" SET Orbit distance 260~320 elevation 34.5 azimuth 75.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 28)
"cameras" SET Orbit distance 260~320 elevation 34.25 azimuth 75.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 27)
"cameras" SET Orbit distance 260~320 elevation 34.0 azimuth 76.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 30)
"cameras" SET Orbit distance 260~320 elevation 33.75 azimuth 76.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 33)
"cameras" SET Orbit distance 260~320 elevation 33.5 azimuth 77.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 25)
"cameras" SET Orbit distance 260~320 elevation 33.25 azimuth 77.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 25)
"cameras" SET Orbit distance 260~320 elevation 33.0 azimuth 78.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 26)
"cameras" SET Orbit distance 260~320 elevation 32.75 azimuth 78.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 31)
"cameras" SET Orbit distance 260~320 elevation 32.5 azimuth 79.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 30)
"cameras" SET Orbit distance 260~320 elevation 32.25 azimuth 79.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 32)
"cameras" SET Orbit distance 260~320 elevation 32.0 azimuth 80.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 34)
"cameras" SET Orbit distance 260~320 elevation 32.25 azimuth 80.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 32)
"cameras" SET Orbit distance 260~320 elevation 32.5 azimuth 81.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 27)
"cameras" SET Orbit distance 260~320 elevation 32.75 azimuth 81.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 32)
"cameras" SET Orbit distance 260~320 elevation 33.0 azimuth 82.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 30)
"cameras" SET Orbit distance 260~320 elevation 33.25 azimuth 82.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 26)
"cameras" SET Orbit distance 260~320 elevation 33.5 azimuth 83.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 35)
"cameras" SET Orbit distance 260~320 elevation 33.75 azimuth 83.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 34)
"cameras" SET Orbit distance 260~320 elevation 34.0 azimuth 84.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 28)
"cameras" SET Orbit distance 260~320 elevation 34.25 azimuth 84.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 29)
"cameras" SET Orbit distance 260~320 elevation 34.5 azimuth 85.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 29)
"cameras" SET Orbit distance 260~320 elevation 34.75 azimuth 85.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 28)
"cameras" SET Orbit distance 260~320 elevation 35.0 azimuth 86.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 28)
"cameras" SET Orbit distance 260~320 elevation 35.25 azimuth 86.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 25)
"cameras" SET Orbit distance 260~320 elevation 35.5 azimuth 87.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 31)
"cameras" SET Orbit distance 260~320 elevation 35.75 azimuth 87.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 26)
"cameras" SET Orbit distance 260~320 elevation 36.0 azimuth 88.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 26)
"cameras" SET Orbit distance 260~320 elevation 36.25 azimuth 88.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 28)
"cameras" SET Orbit distance 260~320 elevation 36.5 azimuth 89.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 29)
"cameras" SET Orbit distance 260~320 elevation 36.75 azimuth 89.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 35)
"cameras" SET Orbit distance 260~320 elevation 37.0 azimuth 90.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 34)
"cameras" SET Orbit distance 260~320 elevation 37.25 azimuth 90.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 27)
"cameras" SET Orbit distance 260~320 elevation 37.5 azimuth 91.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 31)
"cameras" SET Orbit distance 260~320 elevation 37.75 azimuth 91.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 25)
"cameras" SET Orbit distance 260~320 elevation 38.0 azimuth 92.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 34)
"cameras" SET Orbit distance 260~320 elevation 38.25 azimuth 92.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 33)
"cameras" SET Orbit distance 260~320 elevation 38.5 azimuth 93.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 27)
"cameras" SET Orbit distance 260~320 elevation 38.75 azimuth 93.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 29)
"cameras" SET Orbit distance 260~320 elevation 39.0 azimuth 94.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 34)
"cameras" SET Orbit distance 260~320 elevation 39.25 azimuth 94.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 27)
"cameras" SET Orbit distance 260~320 elevation 39.5 azimuth 95.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 30)
"cameras" SET Orbit distance 260~320 elevation 39.75 azimuth 95.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 29)
"cameras" SET Orbit distance 260~320 elevation 40.0 azimuth 96.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 35)
"cameras" SET Orbit distance 260~320 elevation 40.25 azimuth 96.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 34)
"cameras" SET Orbit distance 260~320 elevation 40.5 azimuth 97.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 33)
"cameras" SET Orbit distance 260~320 elevation 40.75 azimuth 97.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 34)
"cameras" SET Orbit distance 260~320 elevation 41.0 azimuth 98.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 29)
"cameras" SET Orbit distance 260~320 elevation 41.25 azimuth 98.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 27)
"cameras" SET Orbit distance 260~320 elevation 41.5 azimuth 99.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 28)
"cameras" SET Orbit distance 260~320 elevation 41.75 azimuth 99.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 32)
"cameras" SET Orbit distance 260~320 elevation 42.0 azimuth 100.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 31)
"cameras" SET Orbit distance 260~320 elevation 42.25 azimuth 100.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 30)
"cameras" SET Orbit distance 260~320 elevation 42.5 azimuth 101.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 32)
"cameras" SET Orbit distance 260~320 elevation 42.75 azimuth 101.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 34)
"cameras" SET Orbit distance 260~320 elevation 43.0 azimuth 102.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 33)
"cameras" SET Orbit distance 260~320 elevation 43.25 azimuth 102.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 28)
"cameras" SET Orbit distance 260~320 elevation 43.5 azimuth 103.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 26)
"cameras" SET Orbit distance 260~320 elevation 43.75 azimuth 103.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 29)
"cameras" SET Orbit distance 260~320 elevation 44.0 azimuth 104.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 28)
"cameras" SET Orbit distance 260~320 elevation 44.25 azimuth 104.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 29)
"cameras" SET Orbit distance 260~320 elevation 44.5 azimuth 105.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 31)
"cameras" SET Orbit distance 260~320 elevation 44.75 azimuth 105.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 27)
"cameras" SET Orbit distance 260~320 elevation 45.0 azimuth 106.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 25)
"cameras" SET Orbit distance 260~320 elevation 45.25 azimuth 106.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 33)
"cameras" SET Orbit distance 260~320 elevation 45.5 azimuth 107.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 32)
"cameras" SET Orbit distance 260~320 elevation 45.75 azimuth 107.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 27)
"cameras" SET Orbit distance 260~320 elevation 46.0 azimuth 108.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 32)
"cameras" SET Orbit distance 260~320 elevation 46.25 azimuth 108.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 26)
"cameras" SET Orbit distance 260~320 elevation 46.5 azimuth 109.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 27)
"cameras" SET Orbit distance 260~320 elevation 46.75 azimuth 109.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 35)
"cameras" SET Orbit distance 260~320 elevation 47.0 azimuth 110.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 33)
"cameras" SET Orbit distance 260~320 elevation 47.25 azimuth 110.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 26)
"cameras" SET Orbit distance 260~320 elevation 47.5 azimuth 111.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 26)
"cameras" SET Orbit distance 260~320 elevation 47.75 azimuth 111.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 28)
"cameras" SET Orbit distance 260~320 elevation 48.0 azimuth 112.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 34)
"cameras" SET Orbit distance 260~320 elevation 48.25 azimuth 112.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 33)
"cameras" SET Orbit distance 260~320 elevation 48.5 azimuth 113.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 28)
"cameras" SET Orbit distance 260~320 elevation 48.75 azimuth 113.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 25)
"cameras" SET Orbit distance 260~320 elevation 49.0 azimuth 114.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 31)
"cameras" SET Orbit distance 260~320 elevation 49.25 azimuth 114.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 34)
"cameras" SET Orbit distance 260~320 elevation 49.5 azimuth 115.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 29)
"cameras" SET Orbit distance 260~320 elevation 49.75 azimuth 115.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 35)
"cameras" SET Orbit distance 260~320 elevation 50.0 azimuth 116.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 30)
"cameras" SET Orbit distance 260~320 elevation 50.25 azimuth 116.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 32)
"cameras" SET Orbit distance 260~320 elevation 50.5 azimuth 117.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 30)
"cameras" SET Orbit distance 260~320 elevation 50.75 azimuth 117.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 26)
"cameras" SET Orbit distance 260~320 elevation 51.0 azimuth 118.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 35)
"cameras" SET Orbit distance 260~320 elevation 51.25 azimuth 118.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 26)
"cameras" SET Orbit distance 260~320 elevation 51.5 azimuth 119.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 25)
"cameras" SET Orbit distance 260~320 elevation 51.75 azimuth 119.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 27)
"cameras" SET Orbit distance 260~320 elevation 52.0 azimuth 120.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 28)
"cameras" SET Orbit distance 260~320 elevation 52.25 azimuth 120.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 30)
"cameras" SET Orbit distance 260~320 elevation 52.5 azimuth 121.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 25)
"cameras" SET Orbit distance 260~320 elevation 52.75 azimuth 121.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 35)
"cameras" SET Orbit distance 260~320 elevation 53.0 azimuth 122.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 27)
"cameras" SET Orbit distance 260~320 elevation 53.25 azimuth 122.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 35)
"cameras" SET Orbit distance 260~320 elevation 53.5 azimuth 123.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 29)
"cameras" SET Orbit distance 260~320 elevation 53.75 azimuth 123.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 28)
"cameras" SET Orbit distance 260~320 elevation 54.0 azimuth 124.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 27)
"cameras" SET Orbit distance 260~320 elevation 54.25 azimuth 124.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 28)
"cameras" SET Orbit distance 260~320 elevation 54.5 azimuth 125.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 26)
"cameras" SET Orbit distance 260~320 elevation 54.75 azimuth 125.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 29)
"cameras" SET Orbit distance 260~320 elevation 55.0 azimuth 126.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 25)
"cameras" SET Orbit distance 260~320 elevation 55.25 azimuth 126.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 28)
"cameras" SET Orbit distance 260~320 elevation 55.5 azimuth 127.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 27)
"cameras" SET Orbit distance 260~320 elevation 55.75 azimuth 127.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 30)
"cameras" SET Orbit distance 260~320 elevation 56.0 azimuth 128.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 33)
"cameras" SET Orbit distance 260~320 elevation 56.25 azimuth 128.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 29)
"cameras" SET Orbit distance 260~320 elevation 56.5 azimuth 129.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 28)
"cameras" SET Orbit distance 260~320 elevation 56.75 azimuth 129.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 34)
"cameras" SET Orbit distance 260~320 elevation 57.0 azimuth 130.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 25)
"cameras" SET Orbit distance 260~320 elevation 57.25 azimuth 130.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 26)
"cameras" SET Orbit distance 260~320 elevation 57.5 azimuth 131.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 35)
"cameras" SET Orbit distance 260~320 elevation 57.75 azimuth 131.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 32)
"cameras" SET Orbit distance 260~320 elevation 58.0 azimuth 132.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 35)
"cameras" SET Orbit distance 260~320 elevation 58.25 azimuth 132.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 31)
"cameras" SET Orbit distance 260~320 elevation 58.5 azimuth 133.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 27)
"cameras" SET Orbit distance 260~320 elevation 58.75 azimuth 133.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 29)
"cameras" SET Orbit distance 260~320 elevation 59.0 azimuth 134.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 28)
"cameras" SET Orbit distance 260~320 elevation 59.25 azimuth 134.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 32)
"cameras" SET Orbit distance 260~320 elevation 59.5 azimuth 135.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 25)
"cameras" SET Orbit distance 260~320 elevation 59.75 azimuth 135.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 31)
"cameras" SET Orbit distance 260~320 elevation 60.0 azimuth 136.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 31)
"cameras" SET Orbit distance 260~320 elevation 60.25 azimuth 136.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 30)
"cameras" SET Orbit distance 260~320 elevation 60.5 azimuth 137.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 28)
"cameras" SET Orbit distance 260~320 elevation 60.75 azimuth 137.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 31)
"cameras" SET Orbit distance 260~320 elevation 61.0 azimuth 138.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 25)
"cameras" SET Orbit distance 260~320 elevation 61.25 azimuth 138.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 34)
"cameras" SET Orbit distance 260~320 elevation 61.5 azimuth 139.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 29)
"cameras" SET Orbit distance 260~320 elevation 61.75 azimuth 139.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 33)
"cameras" SET Orbit distance 260~320 elevation 62.0 azimuth 140.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 34)
"cameras" SET Orbit distance 260~320 elevation 62.25 azimuth 140.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 30)
"cameras" SET Orbit distance 260~320 elevation 62.5 azimuth 141.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 27)
"cameras" SET Orbit distance 260~320 elevation 62.75 azimuth 141.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 31)
"cameras" SET Orbit distance 260~320 elevation 63.0 azimuth 142.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 31)
"cameras" SET Orbit distance 260~320 elevation 63.25 azimuth 142.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 26)
"cameras" SET Orbit distance 260~320 elevation 63.5 azimuth 143.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 35)
"cameras" SET Orbit distance 260~320 elevation 63.75 azimuth 143.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 32)
"cameras" SET Orbit distance 260~320 elevation 64.0 azimuth 144.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 25)
"cameras" SET Orbit distance 260~320 elevation 64.25 azimuth 144.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 32)
"cameras" SET Orbit distance 260~320 elevation 64.5 azimuth 145.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 35)
"cameras" SET Orbit distance 260~320 elevation 64.75 azimuth 145.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 33)
"cameras" SET Orbit distance 260~320 elevation 65.0 azimuth 146.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 34)
"cameras" SET Orbit distance 260~320 elevation 65.25 azimuth 146.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 31)
"cameras" SET Orbit distance 260~320 elevation 65.5 azimuth 147.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 28)
"cameras" SET Orbit distance 260~320 elevation 65.75 azimuth 147.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 27)
"cameras" SET Orbit distance 260~320 elevation 66.0 azimuth 148.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 33)
"cameras" SET Orbit distance 260~320 elevation 66.25 azimuth 148.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 27)
"cameras" SET Orbit distance 260~320 elevation 66.5 azimuth 149.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 31)
"cameras" SET Orbit distance 260~320 elevation 66.75 azimuth 149.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 27)
"cameras" SET Orbit distance 260~320 elevation 67.0 azimuth 150.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 28)
"cameras" SET Orbit distance 260~320 elevation 67.25 azimuth 150.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 31)
"cameras" SET Orbit distance 260~320 elevation 67.5 azimuth 151.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 34)
"cameras" SET Orbit distance 260~320 elevation 67.75 azimuth 151.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 35)
"cameras" SET Orbit distance 260~320 elevation 68.0 azimuth 152.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 27)
"cameras" SET Orbit distance 260~320 elevation 68.25 azimuth 152.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 26)
"cameras" SET Orbit distance 260~320 elevation 68.5 azimuth 153.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 31)
"cameras" SET Orbit distance 260~320 elevation 68.75 azimuth 153.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 31)
"cameras" SET Orbit distance 260~320 elevation 69.0 azimuth 154.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 25)
"cameras" SET Orbit distance 260~320 elevation 69.25 azimuth 154.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 32)
"cameras" SET Orbit distance 260~320 elevation 69.5 azimuth 155.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 28)
"cameras" SET Orbit distance 260~320 elevation 69.75 azimuth 155.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 26)
"cameras" SET Orbit distance 260~320 elevation 70.0 azimuth 156.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 29)
"cameras" SET Orbit distance 260~320 elevation 70.25 azimuth 156.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 29)
"cameras" SET Orbit distance 260~320 elevation 70.5 azimuth 157.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 32)
"cameras" SET Orbit distance 260~320 elevation 70.75 azimuth 157.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 27)
"cameras" SET Orbit distance 260~320 elevation 71.0 azimuth 158.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 32)
"cameras" SET Orbit distance 260~320 elevation 71.25 azimuth 158.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 27)
"cameras" SET Orbit distance 260~320 elevation 71.5 azimuth 159.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 33)
"cameras" SET Orbit distance 260~320 elevation 71.75 azimuth 159.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 27)
"cameras" SET Orbit distance 260~320 elevation 72.0 azimuth 160.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 29)
"cameras" SET Orbit distance 260~320 elevation 71.75 azimuth 160.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 35)
"cameras" SET Orbit distance 260~320 elevation 71.5 azimuth 161.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 32)
"cameras" SET Orbit distance 260~320 elevation 71.25 azimuth 161.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 31)
"cameras" SET Orbit distance 260~320 elevation 71.0 azimuth 162.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 25)
"cameras" SET Orbit distance 260~320 elevation 70.75 azimuth 162.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 28)
"cameras" SET Orbit distance 260~320 elevation 70.5 azimuth 163.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 28)
"cameras" SET Orbit distance 260~320 elevation 70.25 azimuth 163.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 29)
"cameras" SET Orbit distance 260~320 elevation 70.0 azimuth 164.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 32)
"cameras" SET Orbit distance 260~320 elevation 69.75 azimuth 164.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 29)
"cameras" SET Orbit distance 260~320 elevation 69.5 azimuth 165.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 31)
"cameras" SET Orbit distance 260~320 elevation 69.25 azimuth 165.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 25)
"cameras" SET Orbit distance 260~320 elevation 69.0 azimuth 166.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 35)
"cameras" SET Orbit distance 260~320 elevation 68.75 azimuth 166.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 25)
"cameras" SET Orbit distance 260~320 elevation 68.5 azimuth 167.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 29)
"cameras" SET Orbit distance 260~320 elevation 68.25 azimuth 167.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 25)
"cameras" SET Orbit distance 260~320 elevation 68.0 azimuth 168.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 25)
"cameras" SET Orbit distance 260~320 elevation 67.75 azimuth 168.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 25)
"cameras" SET Orbit distance 260~320 elevation 67.5 azimuth 169.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 32)
"cameras" SET Orbit distance 260~320 elevation 67.25 azimuth 169.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 30)
"cameras" SET Orbit distance 260~320 elevation 67.0 azimuth 170.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 26)
"cameras" SET Orbit distance 260~320 elevation 66.75 azimuth 170.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 34)
"cameras" SET Orbit distance 260~320 elevation 66.5 azimuth 171.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 27)
"cameras" SET Orbit distance 260~320 elevation 66.25 azimuth 171.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 31)
"cameras" SET Orbit distance 260~320 elevation 66.0 azimuth 172.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 30)
"cameras" SET Orbit distance 260~320 elevation 65.75 azimuth 172.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 35)
"cameras" SET Orbit distance 260~320 elevation 65.5 azimuth 173.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 33)
"cameras" SET Orbit distance 260~320 elevation 65.25 azimuth 173.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 29)
"cameras" SET Orbit distance 260~320 elevation 65.0 azimuth 174.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 29)
"cameras" SET Orbit distance 260~320 elevation 64.75 azimuth 174.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 28)
"cameras" SET Orbit distance 260~320 elevation 64.5 azimuth 175.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 31)
"cameras" SET Orbit distance 260~320 elevation 64.25 azimuth 175.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 25)
"cameras" SET Orbit distance 260~320 elevation 64.0 azimuth 176.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 35)
"cameras" SET Orbit distance 260~320 elevation 63.75 azimuth 176.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 27)
"cameras" SET Orbit distance 260~320 elevation 63.5 azimuth 177.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 29)
"cameras" SET Orbit distance 260~320 elevation 63.25 azimuth 177.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 28)
"cameras" SET Orbit distance 260~320 elevation 63.0 azimuth 178.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 25)
"cameras" SET Orbit distance 260~320 elevation 62.75 azimuth 178.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 35)
"cameras" SET Orbit distance 260~320 elevation 62.5 azimuth 179.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 35)
"cameras" SET Orbit distance 260~320 elevation 62.25 azimuth 179.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 27)
"cameras" SET Orbit distance 260~320 elevation 62.0 azimuth 180.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 31)
"cameras" SET Orbit distance 260~320 elevation 61.75 azimuth 180.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 28)
"cameras" SET Orbit distance 260~320 elevation 61.5 azimuth 181.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 35)
"cameras" SET Orbit distance 260~320 elevation 61.25 azimuth 181.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 29)
"cameras" SET Orbit distance 260~320 elevation 61.0 azimuth 182.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 30)
"cameras" SET Orbit distance 260~320 elevation 60.75 azimuth 182.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 25)
"cameras" SET Orbit distance 260~320 elevation 60.5 azimuth 183.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 34)
"cameras" SET Orbit distance 260~320 elevation 60.25 azimuth 183.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 31)
"cameras" SET Orbit distance 260~320 elevation 60.0 azimuth 184.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 33)
"cameras" SET Orbit distance 260~320 elevation 59.75 azimuth 184.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 25)
"cameras" SET Orbit distance 260~320 elevation 59.5 azimuth 185.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 26)
"cameras" SET Orbit distance 260~320 elevation 59.25 azimuth 185.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 29)
"cameras" SET Orbit distance 260~320 elevation 59.0 azimuth 186.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 34)
"cameras" SET Orbit distance 260~320 elevation 58.75 azimuth 186.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 29)
"cameras" SET Orbit distance 260~320 elevation 58.5 azimuth 187.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 34)
"cameras" SET Orbit distance 260~320 elevation 58.25 azimuth 187.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 29)
"cameras" SET Orbit distance 260~320 elevation 58.0 azimuth 188.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 34)
"cameras" SET Orbit distance 260~320 elevation 57.75 azimuth 188.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 28)
"cameras" SET Orbit distance 260~320 elevation 57.5 azimuth 189.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 32)
"cameras" SET Orbit distance 260~320 elevation 57.25 azimuth 189.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 30)
"cameras" SET Orbit distance 260~320 elevation 57.0 azimuth 190.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 27)
"cameras" SET Orbit distance 260~320 elevation 56.75 azimuth 190.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 34)
"cameras" SET Orbit distance 260~320 elevation 56.5 azimuth 191.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 26)
"cameras" SET Orbit distance 260~320 elevation 56.25 azimuth 191.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 34)
"cameras" SET Orbit distance 260~320 elevation 56.0 azimuth 192.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 29)
"cameras" SET Orbit distance 260~320 elevation 55.75 azimuth 192.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 35)
"cameras" SET Orbit distance 260~320 elevation 55.5 azimuth 193.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 33)
"cameras" SET Orbit distance 260~320 elevation 55.25 azimuth 193.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 28)
"cameras" SET Orbit distance 260~320 elevation 55.0 azimuth 194.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 34)
"cameras" SET Orbit distance 260~320 elevation 54.75 azimuth 194.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 35)
"cameras" SET Orbit distance 260~320 elevation 54.5 azimuth 195.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 31)
"cameras" SET Orbit distance 260~320 elevation 54.25 azimuth 195.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 33)
"cameras" SET Orbit distance 260~320 elevation 54.0 azimuth 196.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 29)
"cameras" SET Orbit distance 260~320 elevation 53.75 azimuth 196.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 27)
"cameras" SET Orbit distance 260~320 elevation 53.5 azimuth 197.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 33)
"cameras" SET Orbit distance 260~320 elevation 53.25 azimuth 197.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 35)
"cameras" SET Orbit distance 260~320 elevation 53.0 azimuth 198.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 29)
"cameras" SET Orbit distance 260~320 elevation 52.75 azimuth 198.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 35)
"cameras" SET Orbit distance 260~320 elevation 52.5 azimuth 199.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 33)
"cameras" SET Orbit distance 260~320 elevation 52.25 azimuth 199.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 31)
"cameras" SET Orbit distance 260~320 elevation 52.0 azimuth 200.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 34)
"cameras" SET Orbit distance 260~320 elevation 51.75 azimuth 200.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 35)
"cameras" SET Orbit distance 260~320 elevation 51.5 azimuth 201.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 34)
"cameras" SET Orbit distance 260~320 elevation 51.25 azimuth 201.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 31)
"cameras" SET Orbit distance 260~320 elevation 51.0 azimuth 202.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 34)
"cameras" SET Orbit distance 260~320 elevation 50.75 azimuth 202.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 28)
"cameras" SET Orbit distance 260~320 elevation 50.5 azimuth 203.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 33)
"cameras" SET Orbit distance 260~320 elevation 50.25 azimuth 203.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 33)
"cameras" SET Orbit distance 260~320 elevation 50.0 azimuth 204.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 25)
"cameras" SET Orbit distance 260~320 elevation 49.75 azimuth 204.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 33)
"cameras" SET Orbit distance 260~320 elevation 49.5 azimuth 205.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 25)
"cameras" SET Orbit distance 260~320 elevation 49.25 azimuth 205.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 35)
"cameras" SET Orbit distance 260~320 elevation 49.0 azimuth 206.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 32)
"cameras" SET Orbit distance 260~320 elevation 48.75 azimuth 206.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 31)
"cameras" SET Orbit distance 260~320 elevation 48.5 azimuth 207.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 28)
"cameras" SET Orbit distance 260~320 elevation 48.25 azimuth 207.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 33)
"cameras" SET Orbit distance 260~320 elevation 48.0 azimuth 208.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 29)
"cameras" SET Orbit distance 260~320 elevation 47.75 azimuth 208.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 34)
"cameras" SET Orbit distance 260~320 elevation 47.5 azimuth 209.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 32)
"cameras" SET Orbit distance 260~320 elevation 47.25 azimuth 209.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 30)
"cameras" SET Orbit distance 260~320 elevation 47.0 azimuth 210.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 29)
"cameras" SET Orbit distance 260~320 elevation 46.75 azimuth 210.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 28)
"cameras" SET Orbit distance 260~320 elevation 46.5 azimuth 211.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 27)
"cameras" SET Orbit distance 260~320 elevation 46.25 azimuth 211.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 34)
"cameras" SET Orbit distance 260~320 elevation 46.0 azimuth 212.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 26)
"cameras" SET Orbit distance 260~320 elevation 45.75 azimuth 212.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 26)
"cameras" SET Orbit distance 260~320 elevation 45.5 azimuth 213.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 29)
"cameras" SET Orbit distance 260~320 elevation 45.25 azimuth 213.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 34)
"cameras" SET Orbit distance 260~320 elevation 45.0 azimuth 214.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 34)
"cameras" SET Orbit distance 260~320 elevation 44.75 azimuth 214.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 33)
"cameras" SET Orbit distance 260~320 elevation 44.5 azimuth 215.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 29)
"cameras" SET Orbit distance 260~320 elevation 44.25 azimuth 215.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 30)
"cameras" SET Orbit distance 260~320 elevation 44.0 azimuth 216.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 26)
"cameras" SET Orbit distance 260~320 elevation 43.75 azimuth 216.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 26)
"cameras" SET Orbit distance 260~320 elevation 43.5 azimuth 217.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 31)
"cameras" SET Orbit distance 260~320 elevation 43.25 azimuth 217.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 26)
"cameras" SET Orbit distance 260~320 elevation 43.0 azimuth 218.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 26)
"cameras" SET Orbit distance 260~320 elevation 42.75 azimuth 218.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 27)
"cameras" SET Orbit distance 260~320 elevation 42.5 azimuth 219.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 35)
"cameras" SET Orbit distance 260~320 elevation 42.25 azimuth 219.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 30)
"cameras" SET Orbit distance 260~320 elevation 42.0 azimuth 220.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 25)
"cameras" SET Orbit distance 260~320 elevation 41.75 azimuth 220.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 34)
"cameras" SET Orbit distance 260~320 elevation 41.5 azimuth 221.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 30)
"cameras" SET Orbit distance 260~320 elevation 41.25 azimuth 221.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 30)
"cameras" SET Orbit distance 260~320 elevation 41.0 azimuth 222.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 32)
"cameras" SET Orbit distance 260~320 elevation 40.75 azimuth 222.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 25)
"cameras" SET Orbit distance 260~320 elevation 40.5 azimuth 223.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 35)
"cameras" SET Orbit distance 260~320 elevation 40.25 azimuth 223.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 26)
"cameras" SET Orbit distance 260~320 elevation 40.0 azimuth 224.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 31)
"cameras" SET Orbit distance 260~320 elevation 39.75 azimuth 224.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 33)
"cameras" SET Orbit distance 260~320 elevation 39.5 azimuth 225.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 34)
"cameras" SET Orbit distance 260~320 elevation 39.25 azimuth 225.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 26)
"cameras" SET Orbit distance 260~320 elevation 39.0 azimuth 226.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 30)
"cameras" SET Orbit distance 260~320 elevation 38.75 azimuth 226.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 33)
"cameras" SET Orbit distance 260~320 elevation 38.5 azimuth 227.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 33)
"cameras" SET Orbit distance 260~320 elevation 38.25 azimuth 227.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 32)
"cameras" SET Orbit distance 260~320 elevation 38.0 azimuth 228.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-4 34)
"cameras" SET Orbit distance 260~320 elevation 37.75 azimuth 228.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 31)
"cameras" SET Orbit distance 260~320 elevation 37.5 azimuth 229.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 25)
"cameras" SET Orbit distance 260~320 elevation 37.25 azimuth 229.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 29)
"cameras" SET Orbit distance 260~320 elevation 37.0 azimuth 230.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 28)
"cameras" SET Orbit distance 260~320 elevation 36.75 azimuth 230.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (1 32)
"cameras" SET Orbit distance 260~320 elevation 36.5 azimuth 231.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 33)
"cameras" SET Orbit distance 260~320 elevation 36.25 azimuth 231.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 33)
"cameras" SET Orbit distance 260~320 elevation 36.0 azimuth 232.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 32)
"cameras" SET Orbit distance 260~320 elevation 35.75 azimuth 232.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 34)
"cameras" SET Orbit distance 260~320 elevation 35.5 azimuth 233.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 29)
"cameras" SET Orbit distance 260~320 elevation 35.25 azimuth 233.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 26)
"cameras" SET Orbit distance 260~320 elevation 35.0 azimuth 234.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 33)
"cameras" SET Orbit distance 260~320 elevation 34.75 azimuth 234.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 26)
"cameras" SET Orbit distance 260~320 elevation 34.5 azimuth 235.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 33)
"cameras" SET Orbit distance 260~320 elevation 34.25 azimuth 235.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 26)
"cameras" SET Orbit distance 260~320 elevation 34.0 azimuth 236.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-2 30)
"cameras" SET Orbit distance 260~320 elevation 33.75 azimuth 236.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 31)
"cameras" SET Orbit distance 260~320 elevation 33.5 azimuth 237.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 25)
"cameras" SET Orbit distance 260~320 elevation 33.25 azimuth 237.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 32)
"cameras" SET Orbit distance 260~320 elevation 33.0 azimuth 238.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 27)
"cameras" SET Orbit distance 260~320 elevation 32.75 azimuth 238.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 34)
"cameras" SET Orbit distance 260~320 elevation 32.5 azimuth 239.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 26)
"cameras" SET Orbit distance 260~320 elevation 32.25 azimuth 239.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-9 31)
"cameras" SET Orbit distance 260~320 elevation 32.0 azimuth 240.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 27)
"cameras" SET Orbit distance 260~320 elevation 32.25 azimuth 240.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 35)
"cameras" SET Orbit distance 260~320 elevation 32.5 azimuth 241.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 33)
"cameras" SET Orbit distance 260~320 elevation 32.75 azimuth 241.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 29)
"cameras" SET Orbit distance 260~320 elevation 33.0 azimuth 242.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 25)
"cameras" SET Orbit distance 260~320 elevation 33.25 azimuth 242.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3 32)
"cameras" SET Orbit distance 260~320 elevation 33.5 azimuth 243.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 28)
"cameras" SET Orbit distance 260~320 elevation 33.75 azimuth 243.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 34)
"cameras" SET Orbit distance 260~320 elevation 34.0 azimuth 244.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 27)
"cameras" SET Orbit distance 260~320 elevation 34.25 azimuth 244.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 26)
"cameras" SET Orbit distance 260~320 elevation 34.5 azimuth 245.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (0 25)
"cameras" SET Orbit distance 260~320 elevation 34.75 azimuth 245.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 31)
"cameras" SET Orbit distance 260~320 elevation 35.0 azimuth 246.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-1 26)
"cameras" SET Orbit distance 260~320 elevation 35.25 azimuth 246.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-7 29)
"cameras" SET Orbit distance 260~320 elevation 35.5 azimuth 247.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-6 33)
"cameras" SET Orbit distance 260~320 elevation 35.75 azimuth 247.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-5 33)
"cameras" SET Orbit distance 260~320 elevation 36.0 azimuth 248.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 31)
"cameras" SET Orbit distance 260~320 elevation 36.25 azimuth 248.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-8 34)
"cameras" SET Orbit distance 260~320 elevation 36.5 azimuth 249.0 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"cameras" SET Transform position.z 8900~2000
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (2 27)
"cameras" SET Orbit distance 260~320 elevation 36.75 azimuth 249.5 snapOffset (0 55~65 0)
"cameras/cameraRGB" SET Camera allowHDR false
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
