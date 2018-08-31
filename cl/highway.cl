"Config.instance" SET physicsEnabled true

// load highway scene ----------------------------------------------------------

[Highway.Car] CreateCar "mainCar" AT (1390.49 98.121 1958.68) (0 84.42 0)

LOAD "highway" FROM "highway_scene"

"EnviroSky" SET EnviroSky profile ASSET "Enviro - Dynamic Enviroment/Profiles/Enviro Profile 2.0" FROM "Highway"
"EnviroSky" SET active true

"mainCar" SET Highway.ToggleBetweenAutoDriveAndUserControl button "J"
"mainCar" SET OSBHVehicleDriver driverSpeed 60

// disk output setup -----------------------------------------------------------

CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "E:\tmp\"

// main camera misc ------------------------------------------------------------

"Camera" ADD Sensors.RenderCamera
"Camera" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768) alwaysOn true
"Camera" SET Postprocessing.EnviroMerged dayProfile ASSET "Highway/Resources/Day" FROM "highway" nightProfile ASSET "Highway/Resources/Night" FROM "highway"
//"Camera" SET registerCamera windowName "Driver"
"Camera" SET Camera enabled true

"Camera" SET FlyCamera enabled false
"Camera" SET VPCameraController target "mainCar/DriverHeadPivot/DriverHead"
"Camera" SET VPCameraController enabled true

CREATE "disk1/mainCar/cameras/driver"
"disk1/mainCar/cameras/driver" ADD Sensors.RenderCameraLink
"disk1/mainCar/cameras/driver" SET Sensors.RenderCameraLink target "Camera"
"disk1/mainCar/cameras/driver" SET active true

"mainCar" SET active true
"spawner" SET OSVehicleSpawner enabled true
//"EnviroSky" SET active true
"Camera" SET active true

[UI.Window] ShowFromCamera "Camera" AS "Driver" WITH 1024 768 24 "ARGB32" "Default"

// -----------------------------------------------------------------------------
