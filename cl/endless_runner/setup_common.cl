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

// ----- TILER -----

CREATE "tileContainer"
"tileContainer" ADD Tiler.Helpers.LightProcessor
"tileContainer" SET active true

CREATE "Tiles/Tile 1 Random" FROM "tiles" AS "tile1"

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