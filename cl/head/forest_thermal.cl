LOAD "Forest" FROM "tile"
"Forest" SET active false
"Forest" ADD Segmentation.Class
"Forest" SET Segmentation.Class className "ground"
"Forest" ADD Thermal.ThermalTerrain
"Forest" SET Thermal.ThermalTerrain ambientOffset 0 bandwidth -15.88 median 0.094 baseMapDistance 10000 
CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (1600 246 6829) eulerAngles (31.971 60.161 0)
"cameras" ADD FlyCamera
"cameras" SET FlyCamera enabled true
"Segmentation.Profile.instance" PUSH classes "Void" "Human"
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors
"cameras/segmentation" SET SegmentationCamera transparencyCutout 0
"cameras/segmentation" SET Camera near 0.3 far 10000 fieldOfView 90 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Void->black" "Human->green" "ground->#520000FF" "Animal->red"
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Human"
"cameras/segmentation" SET active true
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1024 768 24 "ARGB32" "Default"
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera
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
"Forest" ADD WindZone
"Forest" SET WindZone mode "Directional" radius 0 windMain 0.12 windTurbulence 0.5 windPulseMagnitude 0.5 windPulseFrequency 0.01 
"Forest" SET active true
CREATE "cameras/thermal"
"cameras/thermal" SET active false
"cameras/thermal" ADD Camera Thermal.ThermalCamera UnityEngine.PostProcessing.PostProcessingBehaviour CameraFilterPack_Pixelisation_DeepOilPaintHQ CameraFilterPack_Blur_Noise Thermal.GlobalTreeSettings
"cameras/thermal" SET Camera near 0.3 far 10000 fieldOfView 90
"cameras/thermal" SET Thermal.ThermalCamera enabled false
"cameras/thermal" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ enabled false
"cameras/thermal" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ _FixDistance 10.6 _Distance 0.06 _Size 0.481 Intensity 0.6 enabled true
"cameras/thermal" SET CameraFilterPack_Blur_Noise Distance (2 1) enabled true
"cameras/thermal" SET Thermal.GlobalTreeSettings temperature 6.41 temperatureBandwidth 50 temperatureMedian 0.18 treeLeafsHeatVariance 10 enabled true 
"cameras/thermal" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "Thermal"
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 4.3 temperatureRange (4.5 35) maxDistanceForProbeUpdate 100 useAGC true enabled true 
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
CREATE "spawner/animals/container"
"spawner/animals/container" SET active false
"spawner/animals/container" ADD RandomProps.Torus
"spawner/animals/container" ADD RandomProps.PropArea
"spawner/animals/container" SET RandomProps.PropArea tags "+animal, +thermal"
"spawner/animals/container" SET RandomProps.PropArea async false numberOfProps 100 collisionCheck true stickToGround true 
"spawner/animals/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/container" SET RandomProps.Torus radius 100
"spawner/animals/container" SET Transform position (1696.21069 250 7000) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/container" ADD Segmentation.Class
"spawner/animals/container" SET Segmentation.Class className "Animal"
"spawner/animals/container" SET active true
"spawner/animals" SET active true
CREATE "spawner/human_walker"
CREATE "spawner/human_walker/points"
CREATE "spawner/human_walker/points/goals"
CREATE "spawner/human_walker/points/spawners"
CREATE "spawner/human_walker/humanSpawner"
CREATE "spawner/human_walker/container"
"spawner/human_walker/humanSpawner" SET active false
"spawner/human_walker/humanSpawner" ADD Humans.Locomotion.WalkerSpawner
"spawner/human_walker/humanSpawner" SET Humans.Locomotion.WalkerSpawner minimumDelayBetweenSpawns 0.01 maximumDelayBetweenSpawns 0.3 minimumSpeed 0.5 maximumSpeed 5 maximumHumans 50 arriveDistance 5 genderRestriction "None" requireThermalClothing true 
"spawner/human_walker/humanSpawner" SET Humans.Locomotion.WalkerSpawner container "spawner/human_walker/container"
"spawner/human_walker/container" ADD Segmentation.Class
"spawner/human_walker/container" SET Segmentation.Class className "Human"
CREATE "spawner/human_walker/points/goals/g_0"
"spawner/human_walker/points/goals/g_0" SET Transform position (1696.21069 215.3 7000)
"spawner/human_walker/points/goals/g_0" SET active true
"spawner/human_walker/humanSpawner" PUSH Humans.Locomotion.WalkerSpawner goalPoints "spawner/human_walker/points/goals/g_0"
CREATE "spawner/human_walker/points/spawners/s_0"
"spawner/human_walker/points/spawners/s_0" SET Transform position (1723.81311 213.312 6838.701)
"spawner/human_walker/points/spawners/s_0" ADD Humans.HumanSpawnPoint
"spawner/human_walker/points/spawners/s_0" SET active true
"spawner/human_walker/humanSpawner" PUSH Humans.Locomotion.WalkerSpawner spawnPoints "spawner/human_walker/points/spawners/s_0"
CREATE "spawner/human_walker/points/spawners/s_1"
"spawner/human_walker/points/spawners/s_1" SET Transform position (1655.723 211.563 6797.911)
"spawner/human_walker/points/spawners/s_1" ADD Humans.HumanSpawnPoint
"spawner/human_walker/points/spawners/s_1" SET active true
"spawner/human_walker/humanSpawner" PUSH Humans.Locomotion.WalkerSpawner spawnPoints "spawner/human_walker/points/spawners/s_1"
CREATE "spawner/human_walker/points/spawners/s_2"
"spawner/human_walker/points/spawners/s_2" SET Transform position (1528.34314 219.4655 7124.911)
"spawner/human_walker/points/spawners/s_2" ADD Humans.HumanSpawnPoint
"spawner/human_walker/points/spawners/s_2" SET active true
"spawner/human_walker/humanSpawner" PUSH Humans.Locomotion.WalkerSpawner spawnPoints "spawner/human_walker/points/spawners/s_2"
"spawner/human_walker/humanSpawner" SET active true
"spawner/human_walker/points/goals" SET active true
"spawner/human_walker/points/spawners" SET active true
"spawner/human_walker/container" SET active true
"spawner/human_walker/points" SET active true
"spawner/human_walker" SET active true
"spawner/human_walker/container" ADD Thermal.ThermalProfileOverride
"spawner/human_walker/container" SET Thermal.ThermalProfileOverride temperatureMode "Disabled" temperature 0 temperatureMedianMode "Disabled" temperatureMedian 0.5 temperatureBandwidthMode "Disabled" temperatureBandwidth 0 heatinessMode "Absolute" heatiness 60 varianceMode "Disabled" variance 0 reflectivityMode "Disabled" reflectivity 0 ambientOffsetMode "Disabled" ambientOffset 0 
"spawner/human_walker/container" ADD Thermal.ThermalProfileOverride
"spawner/human_walker/container" SET Thermal.ThermalProfileOverride temperatureMode "Disabled" temperature 0 temperatureMedianMode "Disabled" temperatureMedian 0.5 temperatureBandwidthMode "Disabled" temperatureBandwidth 0 heatinessMode "Absolute" heatiness 60 varianceMode "Disabled" variance 0 reflectivityMode "Disabled" reflectivity 0 ambientOffsetMode "Disabled" ambientOffset 0 
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/segmentation" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/depth" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/cameraRGB" SET Camera enabled true
"cameras/thermal" SET Camera enabled true
"cameras/segmentation" SET Camera enabled true
"cameras/depth" SET Camera enabled true
"cameras/thermal" SET Thermal.ThermalCamera temperatureRange (-3~5 30~35)
"cameras" SET Transform position (1600 246 6829) eulerAngles (31.971 60.161 0)
