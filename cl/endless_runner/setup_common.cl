// ----- BACKGROUND -----
"Config.instance" SET physicsEnabled true

CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" SET EnviroSky GameTime.Hours 13

// ----- MAIN CAR -----

CREATE "Pickup" FROM "highway" AS "mainCar"
"mainCar" SET Rigidbody isKinematic true
"mainCar" SET transform position (8.8 0 -352.5)
"mainCar/Lights" SET active false
"mainCar" ADD OSVehicle
"mainCar" SET OSVehicle maxSpeed 60.0
"mainCar" SET OSVehicle startSpeed 60.0
"mainCar" SET OSVehicle externControl false
"mainCar" SET VPVehicleController enabled false
"mainCar" ADD ToggleBetweenAutoDriveAndUserControl
"mainCar" SET OSBHVehicleDriver smoothAdjust 100.0
"mainCar" SET OSBHVehicleDriver selfDriving true
"mainCar" SET OSBHVehicleDriver enabled false

// ----- TRAFFIC -----

CREATE "OpenSteerNetwork"
"OpenSteerNetwork" ADD OpenSteerNetwork

"mainCar" SET OSBHVehicleDriver osNetwork "OpenSteerNetwork"

CREATE "Vehicle Spawner"
"Vehicle Spawner" SET Transform position (0 0 0)
"Vehicle Spawner" ADD OSNetworkSpawner
"Vehicle Spawner" SET OSNetworkSpawner maxObjects 20
"Vehicle Spawner" SET OSNetworkSpawner spawnRadius 140
"Vehicle Spawner" SET OSNetworkSpawner spawnSize 20
"Vehicle Spawner" SET OSNetworkSpawner despawnRadius 150
"Vehicle Spawner" SET OSNetworkSpawner hidePosition "Vehicle Spawner"
"Vehicle Spawner" SET OSNetworkSpawner network "OpenSteerNetwork"
"Vehicle Spawner" SET OSNetworkSpawner listSelect False
"Vehicle Spawner" SET OSNetworkSpawner databaseFilter "+car,+thermal"
"Vehicle Spawner" SET OSNetworkSpawner spawnFocus "mainCar"
"Vehicle Spawner" SET OSNetworkSpawner removeProbes true
"Vehicle Spawner" SET OSNetworkSpawner speedVariance 0
"Vehicle Spawner" ADD Tiler.Helpers.LightProcessor

CREATE "TrafficEvents"
"TrafficEvents" ADD TrafficEvents
"TrafficEvents" SET TrafficEvents network "OpenSteerNetwork"
"TrafficEvents" SET active true


// ----- GLOBAL SEGMENTATION SETUP -----

"Segmentation.Profile.instance" PUSH classes "Void" "Pedestrian" "Building" "Car" "Road" "Tree" "Prop" "Sign"
CREATE Segmentation.LookUpTable AS "lookUpTable"
"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Pedestrian->Yellow" "Building->Green" "Car->Red"  "Road->Blue" "Tree->Grey" "Prop->Cyan" "Sign->White"

// ----- GLOBAL THERMAL SETUP -----

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Trees"
"ThermalBehaviour/Trees" SET temperature.value -9 temperature.bandwidth 3.67 temperature.median 0 ambientOffset.value -25 heatiness.value 0 reflectivity.value 0.5 variance.value 0

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Buildings"
"ThermalBehaviour/Buildings" SET temperature.value 14 temperature.bandwidth 20 temperature.median 0 ambientOffset.value -15.7 heatiness.value 0 reflectivity.value 0.5 variance.value 0

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Humans"
"ThermalBehaviour/Humans" SET temperature.value 10 temperature.bandwidth 1 temperature.median 0.5 ambientOffset.value 0 heatiness.value 50 reflectivity.value 0.5 variance.value 0

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Props"
"ThermalBehaviour/Props" SET temperature.value -20 temperature.bandwidth 2.27 temperature.median 0.214 ambientOffset.value -17.8 heatiness.value 0 reflectivity.value 0.5 variance.value 0

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Roads"
"ThermalBehaviour/Roads" SET temperature.value -20 temperature.bandwidth 7.07 temperature.median 0 ambientOffset.value -16.4 heatiness.value 0 reflectivity.value 0 variance.value 0

CREATE Thermal.ThermalObjectProfile AS "ThermalBehaviour/Others"
"ThermalBehaviour/Others" SET temperature.value -20 temperature.bandwidth 0 temperature.median 0 ambientOffset.value -25 heatiness.value 0 reflectivity.value 0 variance.value 0


// ----- TILER -----

CREATE "tileContainer"
"tileContainer" ADD Tiler.Helpers.LightProcessor
"tileContainer" SET active true

// ----- LOOP THIS FOR EACH TILE - BEGIN -----

CREATE "Tiles/Tile 1 Random" FROM "tiles" AS "tile1"

// ----- TILE SEGMENTATION SETUP -----

"tile1/Humans" ADD Segmentation.Class
"tile1/Humans" SET Segmentation.Class className "Pedestrian"
"tile1/Buildings" ADD Segmentation.Class
"tile1/Buildings" SET Segmentation.Class className "Building"
"tile1/Cars" ADD Segmentation.Class
"tile1/Cars" SET Segmentation.Class className "Car"
"tile1/Road system/Road0/MainMeshes/RoadMesh" ADD Segmentation.Class
"tile1/Road system/Road0/MainMeshes/RoadMesh" SET Segmentation.Class className "Road"
"tile1/Props" ADD Segmentation.Class
"tile1/Props" SET Segmentation.Class className "Prop"
"tile1/Powerlines" ADD Segmentation.Class
"tile1/Powerlines" SET Segmentation.Class className "Prop"
"tile1/Trees" ADD Segmentation.Class
"tile1/Trees" SET Segmentation.Class className "Tree"
"tile1/Signs" ADD Segmentation.Class
"tile1/Signs" SET Segmentation.Class className "Sign"

// ----- TILE THERMAL SETUP -----

"tile1/Terrain" ADD Thermal.ThermalTerrain
"tile1/Terrain" SET Thermal.ThermalTerrain ambientOffset -18
"tile1/Humans" ADD Thermal.ThermalObjectBehaviour
"tile1/Humans" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Humans"
"tile1/Buildings" ADD Thermal.ThermalObjectBehaviour
"tile1/Buildings" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Buildings"
"tile1/Props" ADD Thermal.ThermalObjectBehaviour
"tile1/Props" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"
"tile1/Trees" ADD Thermal.ThermalObjectBehaviour
"tile1/Trees" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Trees"
"tile1/Powerlines" ADD Thermal.ThermalObjectBehaviour
"tile1/Powerlines" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"
"tile1/Signs" ADD Thermal.ThermalObjectBehaviour
"tile1/Signs" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"
"tile1/Road system/Road0/MainMeshes" ADD Thermal.ThermalObjectBehaviour
"tile1/Road system/Road0/MainMeshes" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Roads"
"tile1/Road system/Road0" ADD Thermal.ThermalObjectBehaviour
"tile1/Road system/Road0" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Props"


// ----- LOOP THIS FOR EACH TILE - END -----

CREATE "Tiler"
"Tiler" SET Transform localPosition (251.59 0.03 249.715)
"Tiler" ADD Tiler.PoolTileLoader
"Tiler" PUSH Tiler.PoolTileLoader pool "tile1"
"Tiler" ADD Tiler.Tiler
"Tiler" SET Tiler.Tiler targetReferenceTileDistance 800
"Tiler" SET Tiler.Tiler targetReference "mainCar"
"Tiler" SET Tiler.Tiler tileContainer "tileContainer"
"Tiler" SET Tiler.Tiler loadOtherTilesSynchronously false
"Tiler" ADD Tiler.TileOpenSteerProcessor
"Tiler" SET Tiler.TileOpenSteerProcessor roadNetwork "OpenSteerNetwork"
"Tiler" SET Tiler.TileOpenSteerProcessor mainCar "mainCar"
"Tiler" SET Tiler.TileOpenSteerProcessor networkSpawner "Vehicle Spawner"
"Tiler" SET active true

CREATE "mainCar/cameras"
"mainCar/cameras" SET active false
"mainCar/cameras" SET Transform localPosition (0 1.78 0.3) localEulerAngles (0 0 0)
"mainCar/cameras" SET active TRUE
