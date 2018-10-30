"QualitySettings" SET shadowDistance 100 shadowCascades 2 shadows 0 realtimeReflectionProbes true

// ---------- WORLD LOADING

LOAD "Worlds/Intersection Loop/New York" FROM "worlds"

//Switch variants
//REGEX "World Root/.*" EXECUTE Tiler.TileVariantSet SwitchVariant "Italian City"
//REGEX "World Root/.*" EXECUTE Tiler.TileVariantSet SwitchVariant "Florida Neighborhood"

REGEX "World Root/.*/Cars" SET active false

CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100
"EnviroSky" SET EnviroSky GameTime.Hours 13


// ---------- CAMERA SETUP

CREATE "Camera"
"Camera" ADD FlyCamera
[Thermal.Camera] CreateCamera "Camera/Thermal"

// thermal pattern noise, remove this for a crisper look
"Camera/Thermal" ADD Thermal.ThermalNoise
"Camera/Thermal" SET Thermal.ThermalNoise spotsContrast 0.8 linesMaskIntensity 0.15 noiseIntensity 6 noiseContrast 0.4 noiseSize 0.1 noiseBlur 2 blendAmount 0.05 filterMode 2
"Camera/Thermal" ADD UnityStandardAssets.ImageEffects.BloomOptimized

// change skyboxBackgroundTemperature to control sky visibility
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-4 75) ambientTemperature -1.5 skyboxBackgroundTemperature 0
"Camera/Thermal" SET Camera far 400
"Camera/Thermal" SET Camera nearClipPlane 1
"Camera/Thermal" SET UnityStandardAssets.ImageEffects.BloomOptimized fastBloomShader "Hidden/FastBloom" threshold 0 intensity 0.15 blurSize 3.5 blurIterations 4

"Camera/Thermal" ADD UnityStandardAssets.CinematicEffects.TonemappingColorGrading
"Camera/Thermal" SET UnityStandardAssets.CinematicEffects.TonemappingColorGrading tonemapping.enabled true
"Camera/Thermal" SET UnityStandardAssets.CinematicEffects.TonemappingColorGrading tonemapping.neutralWhiteLevel 13
//"Camera/Thermal" ADD CameraFilterPack_Blur_Noise
//"Camera/Thermal" SET CameraFilterPack_Blur_Noise Level 5 Distance (4 0)

[UI.Window] ShowFromCamera "Camera/Thermal" AS "Thermal" WITH 1920 1080 24 "ARGB32" "Default"
"Camera/Thermal" EXECUTE SetActive true
"Camera" EXECUTE SetActive true


// ---------- THERMAL SETUP

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Buildings"
"ThermalBehaviour/Buildings" SET Thermal.ThermalObjectProfile name "ThermalBehaviour/Buildings" temperature.value 10 temperature.bandwidth 12.7 temperature.median 0.6 ambientOffset.value 10 heatiness.value 0 reflectivity.value 0.077 variance.value 0

REGEX "World Root/.*/Buildings" ADD Thermal.ThermalObjectBehaviour
REGEX "World Root/.*/Buildings" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Buildings"

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Trees"
"ThermalBehaviour/Trees" SET Thermal.ThermalObjectProfile name "Trees" temperature.value 20 temperature.bandwidth 20 temperature.median 0 ambientOffset.value -0.9 heatiness.value 0 reflectivity.value 0 variance.value 29.9
REGEX "World Root/.*/Trees" ADD Thermal.ThermalObjectBehaviour
REGEX "World Root/.*/Trees" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Trees"

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Props"
"ThermalBehaviour/Props" SET Thermal.ThermalObjectProfile name "Props" temperature.value 13 temperature.bandwidth 12.6 temperature.median 1 ambientOffset.value 3.3 heatiness.value 3.7 reflectivity.value 0 variance.value 0
REGEX "World Root/.*/Props" ADD Thermal.ThermalObjectBehaviour
REGEX "World Root/.*/Props" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"
REGEX "World Root/.*/Powerlines" ADD Thermal.ThermalObjectBehaviour
REGEX "World Root/.*/Powerlines" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Signs"
"ThermalBehaviour/Signs" SET Thermal.ThermalObjectProfile name "Signs" temperature.value -20 temperature.bandwidth 4.57 temperature.median 0.599 ambientOffset.value 25 heatiness.value 59.2 reflectivity.value 0.846 variance.value 28.5
REGEX "World Root/.*/Signs" ADD Thermal.ThermalObjectBehaviour
REGEX "World Root/.*/Signs" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Signs"

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Decals"
"ThermalBehaviour/Decals" SET Thermal.ThermalObjectProfile name "Decals" temperature.value 9 temperature.bandwidth 0 temperature.median 0.323 ambientOffset.value -23.8 heatiness.value 0 reflectivity.value 0 variance.value 33.3
REGEX "World Root/.*/Decals" ADD Thermal.ThermalObjectBehaviour
REGEX "World Root/.*/Decals" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Decals"

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Road"
"ThermalBehaviour/Road" SET Thermal.ThermalObjectProfile name "Road" temperature.value -20 temperature.bandwidth 1.5 temperature.median 0.285 ambientOffset.value -18.9 heatiness.value 0 reflectivity.value 0.361 variance.value 40

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Road2"
"ThermalBehaviour/Road2" SET Thermal.ThermalObjectProfile name "Road2" temperature.value -16 temperature.bandwidth 20 temperature.median 1 ambientOffset.value -7.4 heatiness.value 9 reflectivity.value 0 variance.value 3.1
REGEX "World Root/.*/Road" ADD Thermal.ThermalObjectBehaviour
REGEX "World Root/.*/Road" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Road2"

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Ground"
"ThermalBehaviour/Ground" SET Thermal.ThermalObjectProfile name "Ground" temperature.value -20 temperature.bandwidth 0 temperature.median 1 ambientOffset.value -24.7 heatiness.value 42 reflectivity.value 0 variance.value 16.7
REGEX "World Root/.*/Terrain" ADD Thermal.ThermalObjectBehaviour
REGEX "World Root/.*/Terrain" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Ground"

REGEX "World Root/.*/Terrains/.*/Terrain" ADD Thermal.ThermalTerrain
REGEX "World Root/.*/Terrains/.*/Terrain" SET Thermal.ThermalTerrain ambientOffset -5 bandwidth 17.48 median 1 baseMapDistance 10000 enabled true

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Sidewalk"
"ThermalBehaviour/Sidewalk" SET Thermal.ThermalObjectProfile name "Sidewalk" temperature.bandwidth 20 temperature.median 0.606 ambientOffset.value -8.9 heatiness.value 0 reflectivity.value 0
REGEX "World Root/.*/Others" ADD Thermal.ThermalObjectBehaviour
REGEX "World Root/.*/Others" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Sidewalk"


// ---------- HUMANS INITIALIZATION

CREATE "Humans/Male" FROM "humans" AS "human_male"
CREATE "Humans/Female" FROM "humans" AS "human_female"

REGEX "human_*" ADD Humans.Random.RandomHuman
REGEX "human_*" SET Humans.Random.RandomHuman settings.async false settings.context "Casual" numberOfHeadsToMorphBetween 3 numberOfBodyShapesToMorphBetween 3  attemptToFixClothingCollisions true randomizeOnEnable true
REGEX "human_*" ADD Humans.Locomotion.Character Humans.Locomotion.ExternalAgent
REGEX "human_*" SET Humans.Locomotion.ExternalAgent stickToGround true
REGEX "human_*" SET Humans.Locomotion.Character AnimatorForwardAmountMultiplier 1

//Add the line below for animation stepping
//REGEX "human_*" ADD Humans.Animation.AnimationStepper


// ---------- SUMO TRAFFIC

CREATE "Traffic"
"Traffic" ADD SUMOProcess
"Traffic" SET SUMOProcess sumoConfigName "traffic.pedestrians.15.min.sumocfg"
"Traffic" SET SUMOProcess sumoPath "sumo\"
"Traffic" SET SUMOProcess sumoParams "-v --remote-port 4001 --start --step-length 0.016 --collision.check-junctions true --collision.mingap-factor 1 --collision.action teleport --lanechange.duration 2"

"Traffic" ADD FilteredAssetsPool
"Traffic" SET FilteredAssetsPool usePlaceholders false
"Traffic" PUSH FilteredAssetsPool humanReferences "human_male" "human_female"
"Traffic" ADD CarsTick
"Traffic" ADD PedestriansTick
"Traffic" ADD TrafficLightsTick
"Traffic" SET CarsTick entityCullingReference "Camera/Thermal"
"Traffic" SET CarsTick entityCullingDistance 999999
"Traffic" SET CarsTick bikeRiderSegmentationClassName "Person"
"Traffic" ADD SUMOController RandomProps.Spawners.Spawner RandomProps.Spawners.Vehicles.RandomLicensePlate RandomProps.Spawners.RandomColor
"Traffic" SET SUMOController currentTime 150
"Traffic" SET SUMOController restartTime 750
"Traffic" SET SUMOController enabled false
"Traffic" SET RandomProps.Spawners.RandomColor randomMethod "FromList"
"Traffic" PUSH RandomProps.Spawners.RandomColor availableColors "#46AE9DFF" "#57531DFF" "#BF7ADEFF" "#7ABD71FF" "#BC982DFF" "#B008DEFF" "#54ED6EFF" "#E03102FF" "#42405DFF" "#AA25BEFF" "#910998FF" "#AD4046FF" "#A4B1CEFF" "#D77B73FF" "#D02542FF" "#175918FF"
"Traffic" PUSH RandomProps.Spawners.RandomColor colorsWeights 14

CREATE "Bikes"
"Bikes" SET active true

CREATE "Pedestrians"
"Pedestrians" SET active true
"Traffic" SET PedestriansTick pedestrianContainer "Pedestrians"
"Traffic" SET SUMOController scale 1

//"Traffic" SET CarsTick entityCullingReference "Main Camera"


// ----------- FAST FORWARD FRAMES

"Time.instance" SET captureFramerate 2
"Traffic" SET SUMOController smoothing false


// ---------- EXPORT SETUP

CREATE "dataExport1"
CREATE "dataExport1/exporter"
CREATE "dataExport1/links"
"dataExport1/exporter" ADD Sensors.DataExport
"dataExport1/exporter" SET Sensors.DataExport streamOutput "E:\tmp\"
"dataExport1/exporter" SET active true
"dataExport1/links" SET active true


// ----------- EXPORT THERMAL CAMERA

CREATE "dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e01"
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e01" ADD Sensors.ImageExportLink
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e01" SET Sensors.ImageExportLink target "Camera/Thermal" exportBBoxes "false" label "thermal" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e01"
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e01" EXECUTE Sensors.ImageExportLink SetOptions "height->1080"
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e01" EXECUTE Sensors.ImageExportLink SetOptions "width->1920"
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e01" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e01" EXECUTE Sensors.ImageExportLink SetOptions "format->jpg"
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e01" SET active true


// ----------- SEGMENTATION CAMERA SETUP

"Segmentation.Profile.instance" PUSH classes "Car" "Bicycle" "Person"
CREATE Segmentation.LookUpTable AS "lookUpTable"
"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Person->Yellow" "Car->Red" "Bicycle->White"

"Bikes" ADD RandomProps.Spawners.Spawner
"Bikes" ADD Segmentation.Class Segmentation.Spawners.Entity
"Bikes" SET Segmentation.Class className "Bicycle"
"Traffic" ADD RandomProps.Spawners.Spawner
"Traffic" ADD Segmentation.Class Segmentation.Spawners.Entity
"Traffic" SET Segmentation.Class className "Car"
"Pedestrians" ADD RandomProps.Spawners.Spawner
"Pedestrians" ADD Segmentation.Class Segmentation.Spawners.Entity
"Pedestrians" SET Segmentation.Class className "Person"

[Segmentation.Camera] CreateWithClassColors "Camera/Segmentation" WITH lookUpTable "lookUpTable"
[Cameras.RenderTexture] CreateNew "cameraSegmentation1" 1920 1080
"Camera/Segmentation" ADD Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes
"Camera/Segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1
"Camera/Segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Person" "Car" "Bicycle"
"Camera/Segmentation" SET Camera targetTexture "cameraSegmentation1" nearClipPlane 1 far 400
"Camera/Segmentation" SET active true
[UI.Window] ShowFromRenderTexture "cameraSegmentation1" AS "cameraSegmentation1"


// ----------- EXPORT SEGMENTATION CAMERA

CREATE "dataExport1/links/022914b6-9cac-463c-940e-3712cf051084"
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" ADD Sensors.ImageExportLink
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" SET Sensors.ImageExportLink target "Camera/Segmentation" label "segmentation" exportBBoxes "true" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/022914b6-9cac-463c-940e-3712cf051084"
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" EXECUTE Sensors.ImageExportLink SetOptions "width->1920"
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" EXECUTE Sensors.ImageExportLink SetOptions "height->1080"
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" EXECUTE Sensors.ImageExportLink SetOptions "format->png"
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" SET active true


// ----------- ENTROPY - Jump from one car to another at random

"Camera" ADD JumpBetweenObjects
"Camera" SET JumpBetweenObjects container "Traffic"
"Camera" SET JumpBetweenObjects localPosition (0 2 2.3)
"Camera" SET JumpBetweenObjects rotationMinY 0 rotationMaxY 0 ignoreObjectsNamed "Vehicle Pointer"


// ----------- POST SETUP

"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera" "Camera/Thermal"
"EnviroSky" SET active true
"World Root" SET active true

"Traffic" SET active true
"Traffic" EXECUTE FilteredAssetsPool SetContainerForType "Human" "Pedestrians"
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Human" 60
"Traffic" EXECUTE FilteredAssetsPool SetContainerForType "Bike" "Bikes"
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Bike" 25
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Car" 50

"Traffic" SET SUMOController enabled true

"EnviroSky" EXECUTE EnviroSky SetWeatherOverwrite 3
REGEX "World Root/.*/Road Network/Road Objects/.*/Decal_Asphalt_Crossroad_Mask_02_ERDecal_Start" SET Thermal.ThermalRenderer enabled false
SLEEP 10
"dataExport1" SET active true