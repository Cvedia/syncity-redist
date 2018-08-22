// python syncity.py -r cl/endless_runner/dataset_generation_entropy.cl -s dataset_generation_entropy

"Time" SET captureFramerate 15
"QualitySettings" SET shadowDistance 100 shadowCascades 2 shadows 0 realtimeReflectionProbes true
"Config.instance" SET physicsEnabled true

//"Time" SET timeScale 6.0

CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" SET EnviroSky GameTime.Hours 13

//--- MAIN CAR 
CREATE "Pickup" FROM "highway" AS "mainCar"
"mainCar" SET Rigidbody isKinematic true
"mainCar" SET transform position (8.8 0 -352.5)
"mainCar" SET VPVehicleController enabled false
"mainCar/Lights" SET active false

//--- TILES
CREATE "Tiles/Tile 1 Random" FROM "tiles" as "tile0"
CREATE "Tiles/Tile 2 Random" FROM "tiles" as "tile1"
CREATE "Tiles/Tile 3 Random" FROM "tiles" as "tile2"
CREATE "Tiles/Tile 4 Random" FROM "tiles" as "tile3"

REGEX "tile*/Terrain" SET active false
REGEX "tile*/Terrain_Mesh" SET active true

// --- TILE PEDESTRIAN SETUP BEGIN ---

REGEX "tile*/Humans/NavMesh" ADD RandomProps.Spawners.Area.Navigation RandomProps.Spawners.PropArea Humans.Spawners.RandomHumans Humans.Spawners.HumanWanderers
REGEX "tile*/Humans/NavMesh" SET Humans.Spawners.RandomHumans settings.context "Casual"

// deprecated
// "tile0/Humans/NavMesh" PUSH Humans.Spawners.HumanWanderers pointsOfInterest REGEX "tile0/Humans/Walking points/.*"
// "tile1/Humans/NavMesh" PUSH Humans.Spawners.HumanWanderers pointsOfInterest REGEX "tile1/Humans/Walking points/.*"
// "tile2/Humans/NavMesh" PUSH Humans.Spawners.HumanWanderers pointsOfInterest REGEX "tile2/Humans/Walking points/.*"
// "tile3/Humans/NavMesh" PUSH Humans.Spawners.HumanWanderers pointsOfInterest REGEX "tile3/Humans/Walking points/.*"

REGEX "tile*/Humans/NavMesh" SET Humans.Spawners.HumanWanderers minSpeed 1 maxSpeed 1.5 stoppingDistance 2
REGEX "tile*/Humans/NavMesh" SET RandomProps.Spawners.Area.Navigation size (500 750) areaMask -1
// change numberOfProps to spawn more humans per tile
REGEX "tile*/Humans/NavMesh" SET RandomProps.Spawners.PropArea tags "human" numberOfProps 20 collisionCheck false

// --- TILE PEDESTRIAN SETUP END ---

// --- THERMAL SETUP BEGIN ---

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Trees"
"ThermalBehaviour/Trees" SET temperature.value 3 temperature.bandwidth 3 temperature.median 0.95 ambientOffset.value -25 heatiness.value 0 reflectivity.value 0 variance.value 2.4
CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Buildings"
"ThermalBehaviour/Buildings" SET temperature.value 14 temperature.bandwidth 7 temperature.median 0.3 ambientOffset.value 4 heatiness.value 0 reflectivity.value 0 variance.value 1.5
CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Humans"
"ThermalBehaviour/Humans" SET temperature.value 10 temperature.bandwidth 1 temperature.median 0.5 ambientOffset.value 0 heatiness.value 50 reflectivity.value 0 variance.value 0
CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Props"
"ThermalBehaviour/Props" SET temperature.value -20 temperature.bandwidth 7 temperature.median 0.23 ambientOffset.value 4.8 heatiness.value 0 reflectivity.value 0 variance.value 0
CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Roads"
"ThermalBehaviour/Roads" SET temperature.value -20 temperature.bandwidth 14 temperature.median 0 ambientOffset.value 6.7 heatiness.value 0 reflectivity.value 0 variance.value 0
CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/RoadsProps"
"ThermalBehaviour/RoadsProps" SET temperature.value -20 temperature.bandwidth 5 temperature.median 0.25 ambientOffset.value 4.4 heatiness.value 0 reflectivity.value 0.0 variance.value 0
CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Others"
"ThermalBehaviour/Others" SET temperature.value -20 temperature.bandwidth 0 temperature.median 0 ambientOffset.value -25 heatiness.value 0 reflectivity.value 0 variance.value 0
CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Terrain"
"ThermalBehaviour/Terrain" SET temperature.value 10 temperature.bandwidth 1 temperature.median 0.574 ambientOffset.value 3.6 heatiness.value 0 reflectivity.value 0 variance.value 0

REGEX "tile*" ADD Thermal.ThermalProfileOverride
REGEX "tile*" SET Thermal.ThermalProfileOverride ambientOffsetMode "Relative" ambientOffset -5 temperatureMode "Relative" temperature -4
REGEX "tile*/Terrain_Mesh" ADD Thermal.ThermalObjectBehaviour
REGEX "tile*/Terrain_Mesh" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Terrain"
REGEX "tile*/Humans" ADD Thermal.ThermalObjectBehaviour
REGEX "tile*/Humans" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Humans"
REGEX "tile*/Buildings" ADD Thermal.ThermalObjectBehaviour
REGEX "tile*/Buildings" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Buildings"
REGEX "tile*/Props" ADD Thermal.ThermalObjectBehaviour
REGEX "tile*/Props" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"
REGEX "tile*/Trees" ADD Thermal.ThermalObjectBehaviour
REGEX "tile*/Trees" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Trees"
REGEX "tile*/Powerlines" ADD Thermal.ThermalObjectBehaviour
REGEX "tile*/Powerlines" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"
REGEX "tile*/Signs" ADD Thermal.ThermalObjectBehaviour
REGEX "tile*/Signs" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"
REGEX "tile*/Road system/Road*/MainMeshes" ADD Thermal.ThermalObjectBehaviour
REGEX "tile*/Road system/Road*/MainMeshes" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Roads"
REGEX "tile*/Road system/Intersections" ADD Thermal.ThermalObjectBehaviour
REGEX "tile*/Road system/Intersections" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/RoadsProps"
REGEX "tile*/Road system/Road*" ADD Thermal.ThermalObjectBehaviour
REGEX "tile*/Road system/Road*" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/RoadsProps"

// --- THERMAL SETUP END ---


// --- SEGMENTATION SETUP BEGIN ---

"Segmentation.Profile.instance" PUSH classes "Void" "Person" "Car" "Bicycle"
CREATE Segmentation.LookUpTable AS "lookUpTable"
"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Person->Yellow" "Car->Red" "Bicycle->White"


REGEX "tile*/Humans/Humans" ADD Segmentation.Class Segmentation.Spawners.Entity
REGEX "tile*/Humans/Humans" SET Segmentation.Class className "Person"
REGEX "tile*/Cars" ADD Segmentation.Class Segmentation.Spawners.Entity
REGEX "tile*/Cars" SET Segmentation.Class className "Car"

// --- SEGMENTATION SETUP END ---

CREATE "OpenSteerNetwork"
"OpenSteerNetwork" ADD OpenSteerNetwork

"mainCar" ADD OSVehicle
"mainCar" SET OSVehicle selfDriving true externControl false isBike false bikeLeanMult 40 startSpeed 35 maxSpeed 60 maxForce 40 spinWheels true spinWheelDisableDistance 100 predictMult 0.4
"mainCar" ADD OSBHVehicleDriver
"mainCar" SET OSBHVehicleDriver selfDriving true driverSpeed 20 brakePower 10000 steerFactor 10 steerOvertake 2 smoothAdjust 100.0 laneWidth 0.5 osNetwork "OpenSteerNetwork"

CREATE "cyclists"
// "cyclists" SET active true

CREATE "cyclist1"
CREATE "cyclist1/human"
"cyclist1/human" SET active true
CREATE "bikes/bike_03" FROM "transportation" as "cyclist1/bike"
"cyclist1/bike" SET active true
"cyclist1/bike" ADD Humans.Posing.RandomHumanVehiclePoser
"cyclist1/bike" SET Humans.Posing.RandomHumanVehiclePoser executeOnEnable true settings.context "Casual" createNewHumanOnEnable true humansContainer "cyclist1/human"
"cyclist1/bike" ADD Segmentation.Class Segmentation.Entity
"cyclist1/bike" SET Segmentation.Class className "Bicycle"
"cyclist1/human" ADD Segmentation.Class Segmentation.Entity
"cyclist1/human" SET Segmentation.Class className "Person"

CREATE "cyclist2"
CREATE "cyclist2/human"
"cyclist2/human" SET active true
CREATE "bikes/bike_03" FROM "transportation" as "cyclist2/bike"
"cyclist2/bike" SET active true
"cyclist2/bike" ADD Humans.Posing.RandomHumanVehiclePoser
"cyclist2/bike" SET Humans.Posing.RandomHumanVehiclePoser executeOnEnable true settings.context "Casual" createNewHumanOnEnable true humansContainer "cyclist2/human"
"cyclist2/bike" ADD Segmentation.Class Segmentation.Entity
"cyclist2/bike" SET Segmentation.Class className "Bicycle"
"cyclist2/human" ADD Segmentation.Class Segmentation.Entity
"cyclist2/human" SET Segmentation.Class className "Person"


CREATE "VehicleSpawner"
"VehicleSpawner" SET Transform localPosition (0 0 0)
"VehicleSpawner" ADD OSNetworkRoads
"VehicleSpawner" SET OSNetworkRoads network "OpenSteerNetwork"
"VehicleSpawner" ADD OSNetworkSpawner
"VehicleSpawner" SET OSNetworkSpawner spawnDelay 0 spawnRadius 50 speedVariance 20 spawnClearance 2 despawnRadius 275 speedVariance 5 brakeLightPower 2 spawnFocus "mainCar" removeProbes false removeBoxColliders false removeRigidBodies true
"VehicleSpawner" ADD OSNetworkVehiclePool
// change maxObjects to control how many cars are active
"VehicleSpawner" SET OSNetworkVehiclePool loadCarsAsynchronously false databaseFilter "+car.classification!=\"Special Purpose Vehicle\",+car.classification!=\"Truck\",+thermal" hidePosition "VehicleSpawner" maxObjects 25

"VehicleSpawner" ADD Thermal.ThermalProfileOverride
"VehicleSpawner" SET Thermal.ThermalProfileOverride heatinessMode "Relative" heatiness -24

"VehicleSpawner" ADD Segmentation.Class Segmentation.Spawners.Entity
"VehicleSpawner" SET Segmentation.Class className "Car"

"cyclist1" EXECUTE transform SetParent "cyclists"
"VehicleSpawner" EXECUTE OSNetworkVehiclePool AddToObjectPool "cyclists/cyclist1"
"cyclist2" EXECUTE transform SetParent "cyclists"
"VehicleSpawner" EXECUTE OSNetworkVehiclePool AddToObjectPool "cyclists/cyclist2"

// --- THERMAL CAMERAS

CREATE "mainCar/cameras"
"mainCar/cameras" SET active false
"mainCar/cameras" SET Transform localPosition (0 1.78 0.3) localEulerAngles (0 0 0)
"Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler disableProbesRendering true drawThermalOnly true
[Thermal.Camera] CreateCamera "mainCar/cameras/cameraThermal1"
"mainCar/cameras/cameraThermal1" SET Transform localPosition (0.1 0 0) localEulerAngles (0 -3 0)
"mainCar/cameras/cameraThermal1" ADD Thermal.ThermalNoise
"mainCar/cameras/cameraThermal1" SET Thermal.ThermalNoise spotsContrast 0.8 linesMaskIntensity 0.15 noiseIntensity 6 noiseContrast 0.4 noiseSize 0.1 noiseBlur 2 blendAmount 0.05 filterMode 2 
"mainCar/cameras/cameraThermal1" ADD UnityStandardAssets.ImageEffects.BloomOptimized
"mainCar/cameras/cameraThermal1" SET Thermal.ThermalCamera temperatureRange (-4 50)
"mainCar/cameras/cameraThermal1" SET Thermal.ThermalCamera ambientTemperature -1.5
"mainCar/cameras/cameraThermal1" SET Camera far 400
"mainCar/cameras/cameraThermal1" SET UnityStandardAssets.ImageEffects.BloomOptimized fastBloomShader "Hidden/FastBloom" threshold 0 intensity 0.15 blurSize 3.5 blurIterations 4
"mainCar/cameras/cameraThermal1" ADD UnityStandardAssets.CinematicEffects.TonemappingColorGrading
"mainCar/cameras/cameraThermal1" SET UnityStandardAssets.CinematicEffects.TonemappingColorGrading tonemapping.enabled true
"mainCar/cameras/cameraThermal1" SET UnityStandardAssets.CinematicEffects.TonemappingColorGrading tonemapping.neutralWhiteLevel 13
CREATE RenderTexture 1920 1080 24 "ARGB32" "Default" AS "cameraThermal1"
"mainCar/cameras/cameraThermal1" SET Camera targetTexture "cameraThermal1"
"mainCar/cameras/cameraThermal1" SET active true
[UI.Window] ShowFromRenderTexture "cameraThermal1" AS "cameraThermal1"
"mainCar/cameras/cameraThermal1" ADD CameraFilterPack_Blur_Noise
"mainCar/cameras/cameraThermal1" SET CameraFilterPack_Blur_Noise Level 5 Distance (4 0)

// --- SEGMENTATION CAMERAS

[Segmentation.Camera] CreateWithClassColors "mainCar/cameras/cameraSegmentation1" WITH lookUpTable "lookUpTable"
[Cameras.RenderTexture] CreateNew "cameraSegmentation1" 1920 1080
"mainCar/cameras/cameraSegmentation1" SET Transform localPosition (0.1 0 0) localEulerAngles (0 -3 0)
"mainCar/cameras/cameraSegmentation1" ADD Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes
"mainCar/cameras/cameraSegmentation1" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Person" "Car" "Bicycle"
"mainCar/cameras/cameraSegmentation1" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1
"mainCar/cameras/cameraSegmentation1" SET Camera targetTexture "cameraSegmentation1" far 400
"mainCar/cameras/cameraSegmentation1" SET active true
[UI.Window] ShowFromRenderTexture "cameraSegmentation1" AS "cameraSegmentation1"

"EnviroSky" EXECUTE EnviroSky AssignAndStart "mainCar" "mainCar/cameras/cameraThermal1"
"EnviroSky" SET active true
NOOP
// set weather to "Cloudy 2"
"EnviroSky" EXECUTE EnviroSky SetWeatherOverwrite 2

CREATE "Tiler"
"Tiler" SET Transform localPosition (251.59 0.03 249.715)
"Tiler" ADD Tiler.PoolTileLoader
"Tiler" PUSH Tiler.PoolTileLoader pool "tile0" "tile1" "tile2" "tile3"
CREATE "tileContainer"
"Tiler" ADD Tiler.Tiler
"Tiler" SET Tiler.Tiler targetReference "mainCar" tileContainer "tileContainer" loadOtherTilesSynchronously false
"tileContainer" SET active true
"Tiler" ADD Tiler.TileOpenSteerProcessor
"Tiler" SET Tiler.TileOpenSteerProcessor spawnerRoadUpdateFrequency 0.2 mainCar "mainCar" networkSpawner "VehicleSpawner" roadNetwork "OpenSteerNetwork"
"Tiler" SET active true

"VehicleSpawner" SET active true
"mainCar/cameras" SET active true
"mainCar" SET active true

REGEX "^VehicleSpawner$/.*/Reflection Probe" SET ReflectionProbe boxProjection false farClipPlane 70 size (50 50 50) resolution 128 hdr false

// enables reflection probes
"Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler drawThermalOnly true disableProbesRendering false

// disables reflection probes
// "Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler disableProbesRendering true
