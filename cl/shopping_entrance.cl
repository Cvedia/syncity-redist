// human spawner preliminary setup

CREATE "humans"
CREATE "humans/spawn_point_1"
"humans/spawn_point_1" SET Transform localPosition (0 0.071 20)
"humans/spawn_point_1" ADD Humans.HumanSpawnPoint
"humans/spawn_point_1" SET active true
CREATE "humans/spawn_point_2"
"humans/spawn_point_2" SET Transform localPosition (2.5 0.071 23.01)
"humans/spawn_point_2" ADD Humans.HumanSpawnPoint
"humans/spawn_point_2" SET active true
CREATE "humans/spawn_point_3"
"humans/spawn_point_3" SET Transform localPosition (12.04 0.071 24.01)
"humans/spawn_point_3" ADD Humans.HumanSpawnPoint
"humans/spawn_point_3" SET active true
CREATE "humans/spawn_point_4"
"humans/spawn_point_4" SET Transform localPosition (10.968 0.071 24.489)
"humans/spawn_point_4" ADD Humans.HumanSpawnPoint
"humans/spawn_point_4" SET active true
CREATE "humans/spawn_point_5"
"humans/spawn_point_5" SET Transform localPosition (12.04 0.071 25.366)
"humans/spawn_point_5" ADD Humans.HumanSpawnPoint
"humans/spawn_point_5" SET active true
CREATE "humans/spawn_point_6"
"humans/spawn_point_6" SET Transform localPosition (15.05 0.071 26.04)
"humans/spawn_point_6" ADD Humans.HumanSpawnPoint
"humans/spawn_point_6" SET active true
CREATE "humans/goal_point_1"
"humans/goal_point_1" SET Transform localPosition (-7.54 0.071 -1.78)
"humans/goal_point_1" SET active true
CREATE "humans/goal_point_2"
"humans/goal_point_2" SET Transform localPosition (-2.55 0.071 -1.78)
"humans/goal_point_2" SET active true
CREATE "humans/goal_point_3"
"humans/goal_point_3" SET Transform localPosition (-12.58 0.071 0.57)
"humans/goal_point_3" SET active true
CREATE "humans/goal_point_4"
"humans/goal_point_4" SET Transform localPosition (-5.96 0.071 0.32)
"humans/goal_point_4" SET active true
CREATE "humans/goal_point_5"
"humans/goal_point_5" SET Transform localPosition (-9.48 0.071 2.86)
"humans/goal_point_5" SET active true

CREATE "humans/container"

// cameras

CREATE "cameras"
"cameras" ADD FlyCamera
"cameras" SET active false
"cameras" SET Transform position (0 0 0) eulerAngles (0 0 0)

// RGB

CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" SET Transform localPosition (7.149458 6.276992 11.56043) localEulerAngles (80.25 4.046 0)
"cameras/cameraRGB" ADD Camera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 100 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true

"cameras/cameraRGB" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"cameras/cameraRGB" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "cameras/cameraRGB" antialiasingMode "SubpixelMorphologicalAntialiasing"

//"cameras/cameraRGB" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeLayer "UI"
//"cameras/cameraRGB" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeLayer 2

"cameras/cameraRGB" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal true profile "Cold Profile"

"cameras/cameraRGB" EXECUTE SetLayer "Scene"
"cameras/cameraRGB" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer SetVolumeLayer "Scene"
[UI.Window] ShowFromCamera "cameras/cameraRGB" AS "cameraRGB" WITH 1024 768 24 "ARGB32" "Default"
"cameras/cameraRGB" SET active true

// Mono camera at door

CREATE "cameras/cameraMono"
"cameras/cameraMono" SET active false
"cameras/cameraMono" SET Transform localPosition (7.149458 6.276992 11.56043) localEulerAngles (80.25 4.046 0)
"cameras/cameraMono" ADD Camera
"cameras/cameraMono" SET Camera near 0.3 far 100 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true
"cameras/cameraMono" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"cameras/cameraMono" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "cameras/cameraMono"
"cameras/cameraMono" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal true profile "Mono Profile"
"cameras/cameraMono" EXECUTE SetLayer "Satellite"
"cameras/cameraMono" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer SetVolumeLayer "Satellite"
[UI.Window] ShowFromCamera "cameras/cameraMono" AS "cameraMono" WITH 1024 768 24 "ARGB32" "Default"
"cameras/cameraMono" SET active true

// FishEye top camera

CREATE "cameras/cameraFishEye"
"cameras/cameraFishEye" SET active false
"cameras/cameraFishEye" SET Transform localPosition (7.149458 6.276992 11.56043) localEulerAngles (80.25 4.046 0)
"cameras/cameraFishEye" ADD Camera SphericalCamera
"cameras/cameraFishEye" SET Camera near 0.3 far 100 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true
"cameras/cameraFishEye" SET SphericalCamera azimuth 180 elevation 120

[UI.Window] ShowFromCamera "cameras/cameraFishEye" AS "cameraFishEye" WITH 1024 768 24 "ARGB32" "Default"
"cameras/cameraFishEye" SET active true

// Thermal camera at stairs

CREATE "cameras/cameraThermal"
"cameras/cameraThermal" SET active false
"cameras/cameraThermal" SET Transform localPosition (7.149458 6.276992 11.56043) localEulerAngles (80.25 4.046 0)
"cameras/cameraThermal" ADD Camera Thermal.ThermalCamera CameraFilterPack_Pixelisation_DeepOilPaintHQ CameraFilterPack_Blur_Noise
"cameras/cameraThermal" SET Camera near 0.3 far 1000 fieldOfView 60
"cameras/cameraThermal" SET Thermal.ThermalCamera enabled false
"cameras/cameraThermal" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ enabled false
"cameras/cameraThermal" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ _FixDistance 47 _Distance 0.085 _Size 0.5 Intensity 2.17 enabled true
"cameras/cameraThermal" SET CameraFilterPack_Blur_Noise Level 4 Distance (5 0) enabled true
"cameras/cameraThermal" SET Thermal.ThermalCamera ambientTemperature 10 temperatureRange (1.93 30.23) maxDistanceForProbeUpdate 100 useAGC true enabled true 
[UI.Window] ShowFromCamera "cameras/cameraThermal" AS "cameraThermal" WITH 1024 768 24 "ARGB32" "Default"
"cameras/cameraThermal" SET active true

// Segmentation camera

CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" SET Transform localPosition (7.149458 6.276992 11.56043) localEulerAngles (80.25 4.046 0)
"cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors
// set drawTransparentObjects to see thuru glass
"cameras/segmentation" SET SegmentationCamera transparencyCutout 0.5 drawTransparentObjects true
"cameras/segmentation" SET Camera near 0.3 far 100 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 

//"cameras/segmentation" SET Segmentation.Output.ClassColors lookUpTable "Segmentation.LookUpTable"

"cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Void->black" "Human->#FF00D8FF" "Hair->#E6FF00FF" "Hat->#590072FF" "Shirt->#269CFFFF" "Shoes->#FF0000FF" "Pants->#1EFF00FF" "Accessories->#FFC300FF" "Floor->#858585FF" "Wall->#444444FF" "Decoration->#5C4B2DFF"

"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Human"

[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1024 768 24 "ARGBFloat" "Default"
"cameras/segmentation" SET active true

// finalize setup and enable

"humans/container" ADD Humans.Segmentation.HumanClassGroup
"humans/container" SET Humans.Segmentation.HumanClassGroup humanClassName "Human" shirtClassName "Shirt" pantsClassName "Pants" shoesClassName "Shoes" hairClassName "Hair" hatClassName "Hat" accessoriesClassName "Accessories"
"humans/container" SET active true

LOAD "shopping_tile" FROM "shopping"

"Shop" ADD Thermal.ThermalObjectBehaviour Segmentation.Class
"Shop" SET Thermal.ThermalObjectBehaviour profile "ColdThermalProfile" enabled true
"Shop" SET Segmentation.Class className "Wall"

"Shop/Scene" ADD Thermal.ThermalObjectBehaviour Segmentation.Class
"Shop/Scene" SET Thermal.ThermalObjectBehaviour profile "ColdThermalProfile" enabled true
"Shop/Scene" SET Segmentation.Class className "Decoration"

"Shop/Doors" ADD Segmentation.Class
"Shop/Doors" SET Segmentation.Class className "Decoration"

// finalize spawner, adding the POI from the scene

CREATE "humans/spawner"
"humans/spawner" ADD Humans.Locomotion.WalkerSpawner
"humans/spawner" SET Humans.Locomotion.WalkerSpawner arriveDistance 0.1 minimumDelayBetweenSpawns 0.5 maximumDelayBetweenSpawns 1.5 minimumSpeed 1.5 maximumSpeed 2.2 maximumHumans 30 requireThermalClothing true container "humans/container"
"humans/spawner" PUSH Humans.Locomotion.WalkerSpawner spawnPoints "humans/spawn_point_1" "humans/spawn_point_2" "humans/spawn_point_3" "humans/spawn_point_4" "humans/spawn_point_5" "humans/spawn_point_6"
"humans/spawner" PUSH Humans.Locomotion.WalkerSpawner goalPoints "humans/goal_point_1" "humans/goal_point_2" "humans/goal_point_3" "humans/goal_point_4" "humans/goal_point_5" "nav/POI" "nav/POI (1)" "nav/POI (2)" "nav/POI (3)" "nav/POI (4)" "nav/POI (5)" "nav/POI (6)" "nav/POI (7)" "nav/POI (8)" "nav/POI (9)" "nav/POI (10)" "nav/POI (11)" "nav/POI (12)" "nav/POI (13)" "nav/POI (14)" "nav/POI (15)" "nav/POI (16)" "nav/POI (17)" "nav/POI (18)" "nav/POI (19)" "nav/POI (20)" "nav/POI (21)" "nav/POI (22)" "nav/POI (23)" "nav/POI (24)" "nav/POI (25)" "nav/POI (26)" "nav/POI (27)" "nav/POI (28)" "nav/POI (29)" "nav/POI (30)" "nav/POI (31)" "nav/POI (32)" "nav/POI (33)" "nav/POI (34)" "nav/POI (35)" "nav/POI (36)" "nav/POI (37)" "nav/POI (38)" "nav/POI (39)" "nav/POI (40)" "nav/POI (41)" "nav/POI (42)" "nav/POI (43)" "nav/POI (44)" "nav/POI (45)" "nav/POI (46)" "nav/POI (47)" "nav/POI (48)" "nav/POI (49)" "nav/POI (50)" "nav/POI (51)" "nav/POI (52)" "nav/POI (53)" "nav/POI (54)" "nav/POI (55)" "nav/POI (56)" "nav/POI (57)"
"humans/spawner" SET active true

"humans" SET active true
"cameras" SET FlyCamera enabled true
"cameras" SET active true

// setup disk

CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "E:\tmp\" counter 1
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
CREATE "disk1/Cameras/mono"
"disk1/Cameras/mono" ADD Sensors.RenderTextureLink
"disk1/Cameras/mono" SET Sensors.RenderTextureLink target "cameraMono"
"disk1/Cameras/mono" SET Sensors.RenderTextureLink outputType "LOSSLESS"
"disk1/Cameras/mono" SET active true
CREATE "disk1/Cameras/thermal"
"disk1/Cameras/thermal" ADD Sensors.RenderTextureLink
"disk1/Cameras/thermal" SET Sensors.RenderTextureLink target "cameraThermal"
"disk1/Cameras/thermal" SET active true
"disk1" SET active true

// "disk1" EXECUTE Sensors.Disk Snapshot
