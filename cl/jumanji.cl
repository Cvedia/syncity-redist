CREATE "Camera"
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-10)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Camera" ADD Camera UnityEngine.PostProcessing.PostProcessingBehaviour
"Camera" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX" profile.motionBlur.enabled false
"Camera" SET active true

CREATE "ThermalCameraPrefab" AS "Camera/Thermal" 
CREATE RenderTexture 1472 1472 24 "ARGB32" "Default" AS "Thermal Texture"
"Camera/Thermal" SET Camera targetTexture "Thermal Texture" 
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-10 30)
"Camera/Thermal" SET active true

"Segmentation.Profile.instance" PUSH classes "Void" "Person" "Bicycle" "Car"
CREATE Segmentation.LookUpTable AS "lookUpTable"
"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Person->Yellow" "Bicycle->#00FF00FF" "Car->#FF0000FF" 

CREATE "Camera/Segmentation"
"Camera/Segmentation" ADD Camera Segmentation.Output.ClassColors Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes Segmentation.Output.BoundingBoxesOnTexture
"Camera/Segmentation" SET Segmentation.Output.ClassColors lookUpTable "lookUpTable"
"Camera/Segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Person" "Bicycle" "Car"
"Camera/Segmentation" SET Segmentation.Output.BoundingBoxesOnTexture boxesColor "Yellow"
"Camera/Segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0.25 extensionAmount 0 minimumPixelsCount 30 

CREATE RenderTexture 1472 1472 24 "RGFloat" "Linear" AS "Segmentation Texture"
"Camera/Segmentation" SET Camera targetTexture "Segmentation Texture" 
"Camera/Segmentation" SET active true

[UI.Window] ShowFromRenderTexture "Thermal Texture" AS "Thermal Texture"
[UI.Window] ShowFromCamera "Camera" AS "RGB" WITH 1024 768 24 "ARGB32" "Default"
[UI.Window] ShowFromRenderTexture "Segmentation Texture" AS "Segmentation Texture"

CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "Camera" PlayerCamera "Camera" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" SET EnviroSky GameTime.Hours 13
"EnviroSky" EXECUTE EnviroSky ChangeWeather 1
"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera" "Camera"
"EnviroSky" SET active true

CREATE "Grounds"
"Grounds" SET Transform localPosition (0 0.01 0)
"Grounds" ADD RandomProps.Rectangle
"Grounds" SET RandomProps.Rectangle size (50 100)
"Grounds" ADD RandomProps.PropArea
"Grounds" SET RandomProps.PropArea tags "ground"
"Grounds" SET RandomProps.PropArea collisionCheck False
"Grounds" SET RandomProps.PropArea stickToGround False
"Grounds" SET RandomProps.PropArea findTerrains False
"Grounds" SET RandomProps.PropArea numberOfProps 100
"Grounds" ADD Segmentation.Class Segmentation.Spawners.Entity
"Grounds" SET Segmentation.Class className "Void"
"Grounds" ADD Thermal.ThermalObjectBehaviour
"Grounds" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Ground"
"Grounds" SET active true

CREATE "Buildings E"
"Buildings E" SET Transform localPosition (20 0 0)
"Buildings E" ADD RandomProps.FillGrid
"Buildings E" SET RandomProps.FillGrid tags "building"
"Buildings E" SET RandomProps.FillGrid size (10 100)
"Buildings E" SET RandomProps.FillGrid cellSize (10 10)
"Buildings E" ADD Segmentation.Class Segmentation.Spawners.Entity
"Buildings E" SET Segmentation.Class className "Void"
"Buildings E" ADD Thermal.ThermalObjectBehaviour
"Buildings E" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Buildings"
"Buildings E" SET active true

CREATE "Buildings W"
"Buildings W" SET Transform localPosition (-20 0 0)
"Buildings W" ADD RandomProps.FillGrid
"Buildings W" SET RandomProps.FillGrid tags "building"
"Buildings W" SET RandomProps.FillGrid size (10 100)
"Buildings W" SET RandomProps.FillGrid cellSize (10 10)
"Buildings W" ADD Segmentation.Class Segmentation.Spawners.Entity
"Buildings W" SET Segmentation.Class className "Void"
"Buildings W" ADD Thermal.ThermalObjectBehaviour
"Buildings W" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Buildings"
"Buildings W" SET active true

CREATE "Buildings N"
"Buildings N" SET Transform localPosition (0 0 55)
"Buildings N" ADD RandomProps.FillGrid
"Buildings N" SET RandomProps.FillGrid tags "building"
"Buildings N" SET RandomProps.FillGrid size (40 10)
"Buildings N" SET RandomProps.FillGrid cellSize (10 10)
"Buildings N" ADD Segmentation.Class Segmentation.Spawners.Entity
"Buildings N" SET Segmentation.Class className "Void"
"Buildings N" ADD Thermal.ThermalObjectBehaviour
"Buildings N" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Buildings"
"Buildings N" SET active true

CREATE "Parked Cars W"
"Parked Cars W" ADD Segmentation.Class Segmentation.Spawners.Entity
"Parked Cars W" SET Segmentation.Class className "Void"
"Parked Cars W" SET Transform localPosition (-6 0 0)
"Parked Cars W" ADD RandomProps.Rectangle
"Parked Cars W" SET RandomProps.Rectangle size (3 50)
"Parked Cars W" ADD RandomProps.PropArea
"Parked Cars W" SET RandomProps.PropArea tags "+car,+thermal"
"Parked Cars W" SET RandomProps.PropArea findTerrains False
"Parked Cars W" PUSH RandomProps.PropArea groundObjects "Grounds"
"Parked Cars W" SET RandomProps.PropArea numberOfProps 10
"Parked Cars W" SET RandomProps.PropArea rotationStep 180
"Parked Cars W" ADD Thermal.Spawners.ReplaceThermalProfiles
"Parked Cars W" SET Thermal.Spawners.ReplaceThermalProfiles profile "ThermalBehaviour/Cars"
"Parked Cars W" SET active true
CREATE "Parked Cars E"
"Parked Cars E" ADD Segmentation.Class Segmentation.Spawners.Entity
"Parked Cars E" SET Segmentation.Class className "Void"
"Parked Cars E" SET Transform localPosition (6 0 0)
"Parked Cars E" ADD RandomProps.Rectangle
"Parked Cars E" SET RandomProps.Rectangle size (3 50)
"Parked Cars E" ADD RandomProps.PropArea
"Parked Cars E" SET RandomProps.PropArea tags "+car,+thermal"
"Parked Cars E" SET RandomProps.PropArea findTerrains False
"Parked Cars E" PUSH RandomProps.PropArea groundObjects "Grounds"
"Parked Cars E" SET RandomProps.PropArea numberOfProps 10
"Parked Cars E" SET RandomProps.PropArea rotationStep 180
"Parked Cars E" ADD Thermal.Spawners.ReplaceThermalProfiles
"Parked Cars E" SET Thermal.Spawners.ReplaceThermalProfiles profile "ThermalBehaviour/Cars"
"Parked Cars E" SET active true
CREATE "Trees W"
"Trees W" SET Transform localPosition (-12.5 0 0)
"Trees W" ADD RandomProps.Rectangle
"Trees W" SET RandomProps.Rectangle size (5 100)
"Trees W" ADD RandomProps.PropArea
"Trees W" SET RandomProps.PropArea tags "tree"
"Trees W" SET RandomProps.PropArea findTerrains False
"Trees W" PUSH RandomProps.PropArea groundObjects "Grounds"
"Trees W" SET RandomProps.PropArea numberOfProps 0
"Trees W" SET RandomProps.PropArea rotationStep 180
"Trees W" ADD Segmentation.Class Segmentation.Spawners.Entity
"Trees W" SET Segmentation.Class className "Void"
"Trees W" ADD Thermal.ThermalObjectBehaviour
"Trees W" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Trees"
"Trees W" SET active false
CREATE "Trees E"
"Trees E" SET Transform localPosition (12.5 0 0)
"Trees E" ADD RandomProps.Rectangle
"Trees E" SET RandomProps.Rectangle size (5 100)
"Trees E" ADD RandomProps.PropArea
"Trees E" SET RandomProps.PropArea tags "tree"
"Trees E" SET RandomProps.PropArea findTerrains False
"Trees E" PUSH RandomProps.PropArea groundObjects "Grounds"
"Trees E" SET RandomProps.PropArea numberOfProps 0
"Trees E" SET RandomProps.PropArea rotationStep 180
"Trees E" ADD Segmentation.Class Segmentation.Spawners.Entity
"Trees E" SET Segmentation.Class className "Void"
"Trees E" ADD Thermal.ThermalObjectBehaviour
"Trees E" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Trees"
"Trees E" SET active false

CREATE "Trees"
"Trees" SET Transform localPosition (0 0 30)
"Trees" ADD RandomProps.Rectangle
"Trees" SET RandomProps.Rectangle size (15 50)
"Trees" ADD RandomProps.PropArea
"Trees" SET RandomProps.PropArea tags "tree"
"Trees" SET RandomProps.PropArea findTerrains False
"Trees" PUSH RandomProps.PropArea groundObjects "Grounds"
"Trees" SET RandomProps.PropArea numberOfProps 40
"Trees" SET RandomProps.PropArea rotationStep 180
"Trees" ADD Segmentation.Class Segmentation.Spawners.Entity
"Trees" SET Segmentation.Class className "Void"
"Trees" ADD Thermal.ThermalObjectBehaviour
"Trees" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Trees"
"Trees" SET active true

CREATE "Cars"
"Cars" SET Transform localPosition (0 0 20)
"Cars" ADD Segmentation.Class Segmentation.Spawners.Entity
"Cars" SET Segmentation.Class className "Void"
"Cars" ADD RandomProps.Rectangle
"Cars" SET RandomProps.Rectangle size (15 50)
"Cars" ADD RandomProps.PropArea
"Cars" SET RandomProps.PropArea tags "+car,+thermal" collisionCheck True stickToGround False findTerrains False
"Cars" SET RandomProps.PropArea findTerrains False
"Cars" PUSH RandomProps.PropArea groundObjects "Grounds"
"Cars" SET RandomProps.PropArea numberOfProps 2
"Cars" ADD Thermal.Spawners.ReplaceThermalProfiles
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile "ThermalBehaviour/Cars"
"Cars" SET active true

CREATE "Bird"
"Bird" SET Transform localPosition (0 2 0)
"Bird" ADD RandomProps.Rectangle
"Bird" SET RandomProps.Rectangle size (15 100)
"Bird" ADD RandomProps.PropArea
"Bird" SET RandomProps.PropArea tags "bird"
"Bird" SET RandomProps.PropArea stickToGround False
"Bird" SET RandomProps.PropArea findTerrains False
"Bird" PUSH RandomProps.PropArea groundObjects "Grounds"
"Bird" SET RandomProps.PropArea numberOfProps 10
"Bird" SET active true

CREATE "Signs"
"Signs" SET Transform localPosition (0 0 20)
"Signs" ADD RandomProps.Rectangle
"Signs" SET RandomProps.Rectangle size (15 50)
"Signs" ADD RandomProps.PropArea
"Signs" SET RandomProps.PropArea tags "sign"
"Signs" SET RandomProps.PropArea findTerrains False
"Signs" PUSH RandomProps.PropArea groundObjects "Grounds"
"Signs" SET RandomProps.PropArea numberOfProps 20
"Signs" ADD Segmentation.Class Segmentation.Spawners.Entity
"Signs" SET Segmentation.Class className "Void"
"Signs" ADD Thermal.ThermalObjectBehaviour
"Signs" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Signs"
"Signs" SET active true

CREATE "Trafficlights"
"Trafficlights" ADD RandomProps.Rectangle
"Trafficlights" SET RandomProps.Rectangle size (15 100)
"Trafficlights" ADD RandomProps.PropArea
"Trafficlights" SET RandomProps.PropArea tags "trafficlight"
"Trafficlights" SET RandomProps.PropArea findTerrains False
"Trafficlights" PUSH RandomProps.PropArea groundObjects "Grounds"
"Trafficlights" SET RandomProps.PropArea numberOfProps 10
"Trafficlights" ADD Thermal.ThermalObjectBehaviour
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/TrafficLights"
"Trafficlights" ADD Segmentation.Class Segmentation.Spawners.Entity
"Trafficlights" SET Segmentation.Class className "Void"
"Trafficlights" SET active true

CREATE "Misc"
"Misc" ADD RandomProps.Rectangle
"Misc" SET RandomProps.Rectangle size (15 100)
"Misc" ADD RandomProps.PropArea
"Misc" SET RandomProps.PropArea findTerrains False
"Misc" PUSH RandomProps.PropArea groundObjects "Grounds"
"Misc" SET RandomProps.PropArea numberOfProps 50
"Misc" ADD Segmentation.Class Segmentation.Spawners.Entity
"Misc" SET Segmentation.Class className "Void"
"Misc" SET active true

CREATE "Humans"
"Humans" SET Transform localPosition (0 0 -10)
"Humans" ADD Segmentation.Class Segmentation.Spawners.Entity Humans.Spawners.RandomPose
"Humans" PUSH Humans.Spawners.RandomPose clips ASSET "Humans/animations/LookingAroundNervously" FROM "humans" ASSET "Humans/animations/LeanAgainstWall3" FROM "humans" ASSET "Humans/animations/StandingAngry" FROM "humans" ASSET "Humans/animations/LookingAround" FROM "humans" ASSET "Humans/animations/LeanAgainstWall2" FROM "humans" ASSET "Humans/animations/Sitting4" FROM "humans" ASSET "Humans/animations/Waving" FROM "humans" ASSET "Humans/animations/Sitting3" FROM "humans" ASSET "Humans/animations/PushButton" FROM "humans" ASSET "Humans/animations/Sitting1" FROM "humans" ASSET "Humans/animations/ShakingHands" FROM "humans" ASSET "Humans/animations/LeanAgainstWall" FROM "humans" ASSET "Humans/animations/ArmsCrossed" FROM "humans" ASSET "Humans/animations/Sitting2" FROM "humans" ASSET "Humans/animations/LookBehind" FROM "humans" ASSET "Humans/animations/Looking" FROM "humans"
"Humans" SET Segmentation.Class className "Person"
"Humans" ADD RandomProps.Rectangle
"Humans" SET RandomProps.Rectangle size (4 10)
"Humans" ADD RandomProps.PropArea
"Humans" SET RandomProps.PropArea tags "human" collisionCheck True stickToGround False findTerrains False
"Humans" SET RandomProps.PropArea numberOfProps 1
"Humans" ADD Thermal.Spawners.ReplaceThermalProfiles
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile "ThermalBehaviour/Humans"
"Humans" SET active true

CREATE "BicycleHumans"
"BicycleHumans" ADD Segmentation.Class Segmentation.Spawners.Entity
"BicycleHumans" SET Segmentation.Class className "Person"
"BicycleHumans" ADD Thermal.Spawners.ReplaceThermalProfiles
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile "ThermalBehaviour/Humans"

CREATE "Bicycles"
"Bicycles" SET Transform localPosition (4 0 -10)
"Bicycles" ADD Segmentation.Class Segmentation.Spawners.Entity Humans.Spawners.RandomHumansVehiclePoser
"Bicycles" SET Humans.Spawners.RandomHumansVehiclePoser container "BicycleHumans"
"Bicycles" SET Segmentation.Class className "Bicycle"
"Bicycles" ADD RandomProps.Rectangle
"Bicycles" SET RandomProps.Rectangle size (4 10)
"Bicycles" ADD RandomProps.PropArea
"Bicycles" SET RandomProps.PropArea tags "bicycle" collisionCheck True stickToGround False findTerrains False
"Bicycles" SET RandomProps.PropArea numberOfProps 1
"Bicycles" ADD Thermal.Spawners.ReplaceThermalProfiles
"Bicycles" SET Thermal.Spawners.ReplaceThermalProfiles profile "ThermalBehaviour/Bicycles"
"Bicycles" SET active true
"BicycleHumans" SET active true

"Camera" ADD Sensors.RenderCamera
"Camera" SET Sensors.RenderCamera resolution (1472 1472)

"Grounds" SET Thermal.ThermalObjectBehaviour enabled false
"Grounds" SET Thermal.ThermalObjectBehaviour enabled true
"Signs" SET Thermal.ThermalObjectBehaviour enabled false
"Signs" SET Thermal.ThermalObjectBehaviour enabled true
"Trafficlights" SET Thermal.ThermalObjectBehaviour enabled false
"Trafficlights" SET Thermal.ThermalObjectBehaviour enabled true
"Misc" SET Thermal.ThermalObjectBehaviour enabled false
"Misc" SET Thermal.ThermalObjectBehaviour enabled true
"Trees" SET Thermal.ThermalObjectBehaviour enabled false
"Trees" SET Thermal.ThermalObjectBehaviour enabled true
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles enabled false
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles enabled true
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles enabled false
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles enabled true
"Bicycles" SET Thermal.Spawners.ReplaceThermalProfiles enabled false
"Bicycles" SET Thermal.Spawners.ReplaceThermalProfiles enabled true

CREATE "disk1"
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "V:\adas_test1\"
CREATE "disk1/Cameras/thermal"
"disk1/Cameras/thermal" ADD Sensors.RenderTextureLink
"disk1/Cameras/thermal" SET Sensors.RenderTextureLink target "Thermal Texture"
"disk1/Cameras/thermal" SET Sensors.RenderTextureLink outputType "Thermal"
"disk1/Cameras/thermal" SET active true
"disk1" SET active true
