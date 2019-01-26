CREATE "Camera"
// camera height and rotation from ADAS dataset, -2.8 just to move camera back 
"Camera" SET Transform localPosition (0 1.1 -3)
"Camera" SET Transform localEulerAngles (2 0 0)

"Camera" SET active true

CREATE "Camera/RGB"
"Camera/RGB" SET active false
"Camera/RGB" ADD Camera AudioListener
"Camera/RGB" SET Camera fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true
"Camera/RGB" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"Camera/RGB" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "Camera/RGB" antialiasingMode "None"
"Camera/RGB" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal true profile "Cold Profile"
"Camera/RGB" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"
//Add FXAA III
"Camera/RGB" ADD Syncity.ImageEffects.Antialiasing
"Camera/RGB" SET active true

// Create Thermal Camera
CREATE "Cameras/Thermal/ThermalCamera" FROM "sensors" AS "Camera/Thermal"
"Camera/Thermal" SET Transform localPosition (0 0 0)
"Camera/Thermal" SET Transform localEulerAngles (0 0 0)
//Add FXAA III
"Camera/Thermal" ADD Syncity.ImageEffects.Antialiasing
"Camera/Thermal" SET active true

// Create Segmentation Camera
"Segmentation.Profile.instance" PUSH classes "Person" "Bicycle" "Cars"
CREATE Segmentation.LookUpTable AS "lookUpTable"
"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Person->Yellow" "Bicycle->#00FF00FF" "Cars->#FF000FFF"

CREATE "Camera/Segmentation"
"Camera/Segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes Segmentation.Output.ClassColors
"Camera/Segmentation" SET Segmentation.Output.ClassColors lookUpTable "lookUpTable"
"Camera/Segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Person" "Bicycle" "Cars"
"Camera/Segmentation" SET active true

// Create depth camera
CREATE "Camera/Depth"
"Camera/Depth" SET active false
"Camera/Depth" ADD Camera Cameras.RenderDepthBufferSimple
"Camera/Depth" SET Camera near 0.3 far 1000 fieldOfView 60 allowMSAA false renderingPath "DeferredShading"
"Camera/Depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
"Camera/Depth" SET active true

CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "Camera" PlayerCamera "Camera" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" SET EnviroSky GameTime.Hours 13
"EnviroSky" EXECUTE EnviroSky ChangeWeather 1
"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera/RGB" "Camera/RGB"
"EnviroSky" SET active true

// UI setup 
[UI.Window] ShowFromCamera "Camera/RGB" AS "RGB" WITH 1472 1472 24 "ARGB32" "Default"
[UI.Window] ShowFromCamera "Camera/Segmentation" AS "segmentation" WITH 1472 1472 24 "ARGBFloat" "Default"
[UI.Window] ShowFromCamera "Camera/Thermal" AS "thermal" WITH 1472 1472 24 "ARGB32" "Default"
[UI.Window] ShowFromCamera "Camera/Depth" AS "depth" WITH 1472 1472 32 "RFloat" "Default"

CREATE "Humans"
"Humans" SET Transform localPosition (0 0 0)
"Humans" ADD Segmentation.Class Segmentation.Spawners.Entity Humans.Spawners.RandomHumans Humans.Spawners.RandomPose
"Humans" SET Humans.Spawners.RandomHumans settings.additionalTags ",+fixed"
//"Humans" PUSH Humans.Spawners.RandomPose clips ASSET "Humans/animations/Walk" FROM "humans" ASSET "Humans/animations/Run" FROM "humans" ASSET "Humans/animations/LookingAroundNervously" FROM "humans" ASSET "Humans/animations/StandingAngry" FROM "humans" ASSET "Humans/animations/LookingAround" FROM "humans" ASSET "Humans/animations/Waving" FROM "humans" ASSET "Humans/animations/PushButton" FROM "humans" ASSET "Humans/animations/ShakingHands" FROM "humans" ASSET "Humans/animations/ArmsCrossed" FROM "humans" ASSET "Humans/animations/LookBehind" FROM "humans" ASSET "Humans/animations/Looking" FROM "humans"
"Humans" SET Segmentation.Class className "Person"
"Humans" ADD RandomProps.Frustum
"Humans" SET RandomProps.Frustum cam "Camera/Thermal"
"Humans" SET RandomProps.Frustum fixedYAxis 0
"Humans" SET RandomProps.Frustum fixedZAxis 5
"Humans" SET RandomProps.Frustum fixedXAxis 0 
"Humans" ADD RandomProps.PropArea
"Humans" SET RandomProps.PropArea tags "human" collisionCheck True stickToGround True findTerrains False
"Humans" SET RandomProps.PropArea numberOfProps 1
"Humans" SET active true

CREATE "BicycleHumans"
"BicycleHumans" ADD Segmentation.Class Segmentation.Spawners.Entity
"BicycleHumans" SET Segmentation.Class className "Person"
"BicycleHumans" ADD RandomProps.Spawners.Spawner

CREATE "Bicycles"
"Bicycles" SET Transform localPosition (0 0 0)
"Bicycles" ADD Segmentation.Class Segmentation.Spawners.Entity Humans.Spawners.RandomHumansVehiclePoser
"Bicycles" SET Humans.Spawners.RandomHumansVehiclePoser humansContainer "BicycleHumans"
"Bicycles" SET Humans.Spawners.RandomHumansVehiclePoser settings.additionalTags ",+fixed"
"Bicycles" SET Segmentation.Class className "Bicycle"
"Bicycles" ADD RandomProps.Frustum
"Bicycles" SET RandomProps.Frustum cam "Camera/Thermal"
"Bicycles" SET RandomProps.Frustum fixedYAxis 0
"Bicycles" SET RandomProps.Frustum fixedZAxis 0
"Bicycles" SET RandomProps.Frustum fixedXAxis 0 
"Bicycles" ADD RandomProps.PropArea
"Bicycles" SET RandomProps.PropArea tags "bicycle" collisionCheck True stickToGround True findTerrains False
"Bicycles" SET RandomProps.PropArea numberOfProps 1
"Bicycles" SET active true
"BicycleHumans" SET active true


CREATE "Cars"
"Cars" SET Transform localPosition (0 0 0)
"Cars" ADD Segmentation.Class Segmentation.Spawners.Entity
"Cars" SET Segmentation.Class className "Cars"
"Cars" ADD RandomProps.Frustum
"Cars" SET RandomProps.Frustum cam "Camera/Thermal"
"Cars" SET RandomProps.Frustum fixedYAxis 0
"Cars" SET RandomProps.Frustum fixedXAxis 0
"Cars" SET RandomProps.Frustum fixedZAxis 5
"Cars" ADD RandomProps.PropArea
"Cars" SET RandomProps.PropArea collisionCheck True stickToGround False findTerrains False
"Cars" SET RandomProps.PropArea findTerrains False
"Cars" SET RandomProps.PropArea numberOfProps 1
//Restrict to typical cars
"Cars" SET RandomProps.PropArea tags "+car,+thermal,+fixed,-car.classification=\"Truck\",-car.classification=\"Bus\",-car.classification=\"Police\",-car.classification=\"Bike\",-car.classification=\"Special Purpose Vehicle\",-car.classification=\"Motorbike\""

"Cars" SET active true

"Bicycles" SET active false
"BicycleHumans" SET active false
"Cars" SET active false
"Humans" SET active false

// reset UI
"UI.WindowController.instance" EXECUTE ResetLayout
