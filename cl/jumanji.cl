CREATE "Camera"
"Camera" SET Transform localPosition (-1~1 0.5~2 -2~-1)
"Camera" SET Transform localEulerAngles (-2~0 -5~5 -3~3)
"Camera" ADD Camera UnityEngine.PostProcessing.PostProcessingBehaviour
"Camera" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX" profile.motionBlur.enabled false
"Camera" SET active true

CREATE "Camera/RGB"
"Camera/RGB" SET active false
"Camera/RGB" ADD Camera AudioListener
"Camera/RGB" SET Camera fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true
"Camera/RGB" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"Camera/RGB" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "Camera/RGB" antialiasingMode "SubpixelMorphologicalAntialiasing"
"Camera/RGB" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal true profile "Cold Profile"
"Camera/RGB" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"
"Camera/RGB" SET active true

// Create Thermal Camera
CREATE "Cameras/Thermal/ThermalCamera" FROM "sensors" AS "Camera/Thermal"
"Camera/Thermal" SET Transform localPosition (0 0 0)
"Camera/Thermal" SET Transform localEulerAngles (0 0 0)

//ANTI-ALIASING
//Add FXAA III
//"Camera/Thermal" ADD Syncity.ImageEffects.Antialiasing
//OR USE MSAA
"QualitySettings" SET antiAliasing 4
"Camera/Thermal" SET Camera allowMSAA true

// Uncomment the following three lines to get random background images. They will replace the sky, so adjusting skyboxBackgroundTemperature is important
//"Camera/Thermal" SET Thermal.ThermalCamera skyboxBackgroundTemperature 9
//"Camera/Thermal" ADD Cameras.RandomBackground
//"Camera/Thermal" EXECUTE Cameras.RandomBackground GetImagesFromDisk "D:\Projects\Syncity\random-images\*.jpg"

"Camera/Thermal" SET active true

"Segmentation.Profile.instance" PUSH classes "Void" "Sky" "Person" "Bicycles" "Car"
CREATE Segmentation.LookUpTable AS "lookUpTable"
"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Void->black" "Sky->#FF7B00FF" "Person->Yellow" "Bicycle->#00FF00FF" "Car->#FF0000FF"

CREATE "Camera/Segmentation"
"Camera/Segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes Segmentation.Output.ClassColors
"Camera/Segmentation" SET Segmentation.Output.ClassColors lookUpTable "lookUpTable"
"Camera/Segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Person" "Bicycle" "Car"
"Camera/Segmentation" SET active true

CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "Camera" PlayerCamera "Camera" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100
"EnviroSky" SET EnviroSky GameTime.Hours 13
"EnviroSky" EXECUTE EnviroSky ChangeWeather 1
"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera" "Camera"
"EnviroSky" SET active true

CREATE RenderTexture 1280 1024 24 "ARGB32" "Default" AS "rgb_rt"
CREATE RenderTexture 1280 1024 24 "ARGB32" "Default" AS "seg_rt"
CREATE RenderTexture 1280 1024 24 "ARGB32" "Default" AS "thermal_rt"

"Camera/RGB" SET Camera targetTexture "rgb_rt"
"Camera/Segmentation" SET Camera targetTexture "seg_rt"
"Camera/Thermal" SET Camera targetTexture "thermal_rt"


CREATE "Grounds"
"Grounds" SET Transform localPosition (0 0.01 0)
"Grounds" ADD RandomProps.FillGrid
"Grounds" SET RandomProps.FillGrid tags "ground_old"
"Grounds" SET RandomProps.FillGrid size (100 100)
"Grounds" SET RandomProps.FillGrid cellSize (10 10)
"Grounds" ADD Segmentation.Class Segmentation.Spawners.Entity
"Grounds" SET Segmentation.Class className "Void"
"Grounds" ADD Thermal.ThermalObjectBehaviour
"Grounds" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Ground"
"Grounds" SET active true

CREATE "Buildings"
"Buildings" SET Transform localPosition (20 0 0)
"Buildings" ADD RandomProps.Frustum
"Buildings" SET RandomProps.Frustum cam "Camera/Thermal"
"Buildings" SET RandomProps.Frustum minDistance 80
"Buildings" SET RandomProps.Frustum maxDistance 120
"Buildings" SET RandomProps.Frustum fixedYAxis 0
"Buildings" ADD RandomProps.PropArea
"Buildings" SET RandomProps.PropArea tags "building" collisionCheck True stickToGround True findTerrains True
"Buildings" PUSH RandomProps.PropArea groundObjects "Grounds"
"Buildings" SET RandomProps.PropArea numberOfProps 40
"Buildings" SET RandomProps.PropArea rotationStep 180
"Buildings" ADD Segmentation.Class Segmentation.Spawners.Entity
"Buildings" SET Segmentation.Class className "Void"
"Buildings" ADD Thermal.ThermalObjectBehaviour
"Buildings" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Buildings"
"Buildings" SET active true


CREATE "Trees"
"Trees" SET Transform localPosition (0 0 30)
"Trees" ADD RandomProps.Frustum
"Trees" SET RandomProps.Frustum cam "Camera/Thermal"
"Trees" SET RandomProps.Frustum minDistance 12
"Trees" SET RandomProps.Frustum maxDistance 30
"Trees" SET RandomProps.Frustum fixedYAxis 0
"Trees" ADD RandomProps.PropArea
"Trees" SET RandomProps.PropArea tags "tree" collisionCheck True stickToGround True findTerrains True
"Trees" PUSH RandomProps.PropArea groundObjects "Grounds"
"Trees" SET RandomProps.PropArea numberOfProps 10
"Trees" SET RandomProps.PropArea rotationStep 180
"Trees" ADD Segmentation.Class Segmentation.Spawners.Entity
"Trees" SET Segmentation.Class className "Void"
"Trees" ADD Thermal.ThermalObjectBehaviour
"Trees" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Trees"
"Trees" SET active true

////////SECTION REGARDING CARS////////
CREATE "Cars"
"Cars" SET Transform localPosition (0 0 20)
"Cars" ADD Segmentation.Class Segmentation.Spawners.Entity
"Cars" SET Segmentation.Class className "Car"
"Cars" ADD RandomProps.Frustum
"Cars" SET RandomProps.Frustum cam "Camera/Thermal"
"Cars" SET RandomProps.Frustum minDistance 12
"Cars" SET RandomProps.Frustum maxDistance 15
"Cars" SET RandomProps.Frustum fixedYAxis 0
"Cars" ADD RandomProps.PropArea
"Cars" SET RandomProps.PropArea tags "+car,+thermal" collisionCheck True stickToGround True findTerrains True

"Cars" SET RandomProps.PropArea numberOfProps 3
"Cars" SET RandomProps.PropArea collisionCheck True stickToGround False findTerrains False
"Cars" SET active true
////////END SECTION REGARDING CARS////////

CREATE "Signs"
"Signs" SET Transform localPosition (0 0 20)
"Signs" ADD RandomProps.Frustum
"Signs" SET RandomProps.Frustum cam "Camera/Thermal"
"Signs" SET RandomProps.Frustum minDistance 12
"Signs" SET RandomProps.Frustum maxDistance 15
"Signs" SET RandomProps.Frustum fixedYAxis 0
"Signs" ADD RandomProps.PropArea
"Signs" SET RandomProps.PropArea tags "sign" collisionCheck True stickToGround false findTerrains false
"Signs" PUSH RandomProps.PropArea groundObjects "Grounds"
"Signs" SET RandomProps.PropArea numberOfProps 8
"Signs" SET RandomProps.PropArea rotationStep 180
"Signs" ADD Segmentation.Class Segmentation.Spawners.Entity
"Signs" SET Segmentation.Class className "Void"
"Signs" ADD Thermal.ThermalObjectBehaviour
"Signs" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/Signs"
"Signs" SET active true

CREATE "Trafficlights"
"Trafficlights" ADD RandomProps.Frustum
"Trafficlights" SET RandomProps.Frustum cam "Camera/Thermal"
"Trafficlights" SET RandomProps.Frustum minDistance 20
"Trafficlights" SET RandomProps.Frustum maxDistance 25
"Trafficlights" SET RandomProps.Frustum fixedYAxis 0
"Trafficlights" ADD RandomProps.PropArea
"Trafficlights" SET RandomProps.PropArea tags "trafficlight"
"Trafficlights" SET RandomProps.PropArea findTerrains False collisionCheck True stickToGround True findTerrains True
"Trafficlights" PUSH RandomProps.PropArea groundObjects "Grounds"
"Trafficlights" SET RandomProps.PropArea numberOfProps 5
"Trafficlights" ADD Thermal.ThermalObjectBehaviour
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile "ThermalBehaviour/TrafficLights"
"Trafficlights" ADD Segmentation.Class Segmentation.Spawners.Entity
"Trafficlights" SET Segmentation.Class className "Void"
"Trafficlights" SET active true

//CREATE "Misc"
//"Misc" ADD RandomProps.Rectangle
//"Misc" SET RandomProps.Rectangle size (15 100)
//"Misc" ADD RandomProps.PropArea
//"Misc" SET RandomProps.PropArea findTerrains False
//"Misc" PUSH RandomProps.PropArea groundObjects "Grounds"
//"Misc" SET RandomProps.PropArea tags "Grounds" collisionCheck True stickToGround True findTerrains True
//"Misc" SET RandomProps.PropArea numberOfProps 50
//"Misc" ADD Segmentation.Class Segmentation.Spawners.Entity
//"Misc" SET Segmentation.Class className "Void"
//"Misc" SET active true

CREATE "Humans"
"Humans" SET Transform localPosition (10 0 -10)
"Humans" ADD Segmentation.Class Segmentation.Spawners.Entity Humans.Spawners.RandomHumans Humans.Spawners.RandomPose
"Humans" PUSH Humans.Spawners.RandomPose clips ASSET "Humans/animations/Walk" FROM "humans" ASSET "Humans/animations/Run" FROM "humans" ASSET "Humans/animations/LookingAroundNervously" FROM "humans" ASSET "Humans/animations/StandingAngry" FROM "humans" ASSET "Humans/animations/LookingAround" FROM "humans" ASSET "Humans/animations/Waving"  FROM "humans" ASSET "Humans/animations/ArmsCrossed" FROM "humans" ASSET "Humans/animations/LookBehind" FROM "humans" ASSET "Humans/animations/Looking" FROM "humans"
"Humans" SET Segmentation.Class className "Person"
"Humans" ADD RandomProps.Frustum
"Humans" SET RandomProps.Frustum cam "Camera/Thermal"
"Humans" SET RandomProps.Frustum minDistance 6
"Humans" SET RandomProps.Frustum maxDistance 12
"Humans" SET RandomProps.Frustum fixedYAxis 0
"Humans" ADD RandomProps.PropArea
"Humans" SET RandomProps.PropArea tags "human" collisionCheck True stickToGround True findTerrains True
"Humans" SET RandomProps.PropArea numberOfProps 3
"Humans" SET Humans.Spawners.RandomHumans settings.additionalTags ",+fixed"
"Humans" SET active true

CREATE "BicycleHumans"
"BicycleHumans" ADD Segmentation.Class Segmentation.Spawners.Entity
"BicycleHumans" SET Segmentation.Class className "Person"
"BicycleHumans" ADD RandomProps.Spawners.Spawner
//"BicycleHumans" ADD Thermal.Spawners.ReplaceThermalProfiles
//"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile "ThermalBehaviour/Humans"

CREATE "Bicycles"
"Bicycles" SET Transform localPosition (10 0 -10)
"Bicycles" ADD Segmentation.Class Segmentation.Spawners.Entity Humans.Spawners.RandomHumansVehiclePoser
"Bicycles" SET Humans.Spawners.RandomHumansVehiclePoser humansContainer "BicycleHumans"
"Bicycles" SET Humans.Spawners.RandomHumansVehiclePoser settings.additionalTags ",+fixed"
"Bicycles" SET Segmentation.Class className "Bicycle"
"Bicycles" ADD RandomProps.Frustum
"Bicycles" SET RandomProps.Frustum cam "Camera/Thermal"
"Bicycles" SET RandomProps.Frustum minDistance 6
"Bicycles" SET RandomProps.Frustum maxDistance 12
"Bicycles" SET RandomProps.Frustum fixedYAxis 0
"Bicycles" ADD RandomProps.PropArea
"Bicycles" SET RandomProps.PropArea collisionCheck True stickToGround False findTerrains False
"Bicycles" SET RandomProps.PropArea numberOfProps 1

"Bicycles" PUSH RandomProps.PropArea assets "transportation:Bikes/GenericWomansBicycle/GenericWomansBicycle" "transportation:Bikes/Family Bicycle/Family Bike" "transportation:Bikes/Touring Bicycle II/Touring Bicycle II"
"Bicycles" PUSH RandomProps.PropArea assets "transportation:Bikes/Mobikev1/Mobikev1" "transportation:Bikes/Purpose Bicycle/Purpose Bicycle" "transportation:Bikes/Pashley_Classic_Bicycle/Pashley Classic Bicycle"
"Bicycles" PUSH RandomProps.PropArea assets "transportation:Bikes/City Bicycle/City Bicycle" "transportation:Bikes/City_Bike_Green/City_Bike_Green" "transportation:Bikes/Lady_Cycle/Lady_Cycle"
"Bicycles" PUSH RandomProps.PropArea assets "transportation:Bikes/New_York_Citibike/New_York_Citibike" "transportation:Bikes/Bicycle_finish_sale/Bicycle_finish_sale"

"Bicycles" SET active true
"BicycleHumans" SET active true

"Camera" ADD Sensors.RenderCamera
"Camera" SET Sensors.RenderCamera resolution (1280 1024)

"Grounds" SET Thermal.ThermalObjectBehaviour enabled false
"Grounds" SET Thermal.ThermalObjectBehaviour enabled true
"Signs" SET Thermal.ThermalObjectBehaviour enabled false
"Signs" SET Thermal.ThermalObjectBehaviour enabled true
"Trafficlights" SET Thermal.ThermalObjectBehaviour enabled false
"Trafficlights" SET Thermal.ThermalObjectBehaviour enabled true
"Trees" SET Thermal.ThermalObjectBehaviour enabled false
"Trees" SET Thermal.ThermalObjectBehaviour enabled true
"Buildings" SET Thermal.ThermalObjectBehaviour enabled false
"Buildings" SET Thermal.ThermalObjectBehaviour enabled true
