CREATE "Camera"
"Camera" SET Transform localPosition (-10~10 0.5~2 -50~0)
"Camera" SET Transform localEulerAngles (-15~-10 -40~40 -10~10)
"Camera" ADD Camera UnityEngine.PostProcessing.PostProcessingBehaviour
"Camera" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX" profile.motionBlur.enabled false
"Camera" SET active true

CREATE "Camera/Thermal"
"Camera/Thermal" ADD Camera Thermal.ThermalCamera
CREATE RenderTexture 1920 1080 24 "ARGB32" "Default" AS "Thermal Texture"
"Camera/Thermal" SET Camera targetTexture "Thermal Texture" 
"Camera/Thermal" SET active true

"Segmentation.Profile.instance" PUSH classes "Void" "Cars" "Humans"
CREATE Segmentation.LookUpTable AS "lookUpTable"
"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Cars->#FF0000FF" "Humans->Yellow"

CREATE "Camera/Segmentation"
"Camera/Segmentation" ADD Camera Segmentation.Output.ClassColors Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes Segmentation.Output.BoundingBoxesOnTexture
"Camera/Segmentation" SET Segmentation.Output.ClassColors lookUpTable "lookUpTable"
"Camera/Segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Cars" "Humans"
"Camera/Segmentation" SET Segmentation.Output.BoundingBoxesOnTexture boxesColor "Yellow"

CREATE RenderTexture 1920 1080 24 "ARGB32" "Default" AS "Segmentation Texture"
"Camera/Segmentation" SET Camera targetTexture "Segmentation Texture" 
"Camera/Segmentation" SET active true

[UI.Window] ShowFromCamera "Camera" AS "RGB" WITH 1024 768 24 "ARGB32" "Default"
[UI.Window] ShowFromRenderTexture "Thermal Texture" AS "Thermal Texture"
[UI.Window] ShowFromRenderTexture "Segmentation Texture" AS "Segmentation Texture"

CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "Camera" PlayerCamera "Camera" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" SET EnviroSky GameTime.Hours 0~24
"EnviroSky" EXECUTE EnviroSky ChangeWeather 0~8
"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera" "Camera"
"EnviroSky" SET active true

CREATE "Buildings E"
"Buildings E" SET Transform localPosition (20 0 0)
"Buildings E" ADD RandomProps.FillGrid
"Buildings E" SET RandomProps.FillGrid tags "building"
"Buildings E" SET RandomProps.FillGrid size (10 100)
"Buildings E" SET RandomProps.FillGrid cellSize (10 10)
"Buildings E" SET active true
CREATE "Buildings W"
"Buildings W" SET Transform localPosition (-20 0 0)
"Buildings W" ADD RandomProps.FillGrid
"Buildings W" SET RandomProps.FillGrid tags "building"
"Buildings W" SET RandomProps.FillGrid size (10 100)
"Buildings W" SET RandomProps.FillGrid cellSize (10 10)
"Buildings W" SET active true
CREATE "Buildings N"
"Buildings N" SET Transform localPosition (0 0 55)
"Buildings N" ADD RandomProps.FillGrid
"Buildings N" SET RandomProps.FillGrid tags "building"
"Buildings N" SET RandomProps.FillGrid size (40 10)
"Buildings N" SET RandomProps.FillGrid cellSize (10 10)
"Buildings N" SET active true
CREATE "Floor"
"Floor" SET Transform localPosition (0 0 400)
"Floor" ADD RandomProps.FillGrid
"Floor" SET RandomProps.FillGrid tags "ground"
"Floor" SET RandomProps.FillGrid size (1000 1000)
"Floor" SET RandomProps.FillGrid cellSize (10 10)
"Floor" SET active true
CREATE "Parked Cars W"
"Parked Cars W" ADD Segmentation.Class Segmentation.Spawners.Entity
"Parked Cars W" SET Segmentation.Class className "Cars"
"Parked Cars W" SET Transform localPosition (-8.5 0 0)
"Parked Cars W" ADD RandomProps.Rectangle
"Parked Cars W" SET RandomProps.Rectangle size (3 100)
"Parked Cars W" ADD RandomProps.PropArea
"Parked Cars W" SET RandomProps.PropArea tags "car"
"Parked Cars W" SET RandomProps.PropArea findTerrains False
"Parked Cars W" PUSH RandomProps.PropArea groundObjects "Floor"
"Parked Cars W" SET RandomProps.PropArea numberOfProps 50
"Parked Cars W" SET RandomProps.PropArea rotationStep 180
"Parked Cars W" SET active true
CREATE "Parked Cars E"
"Parked Cars E" ADD Segmentation.Class Segmentation.Spawners.Entity
"Parked Cars E" SET Segmentation.Class className "Cars"
"Parked Cars E" SET Transform localPosition (8.5 0 0)
"Parked Cars E" ADD RandomProps.Rectangle
"Parked Cars E" SET RandomProps.Rectangle size (3 100)
"Parked Cars E" ADD RandomProps.PropArea
"Parked Cars E" SET RandomProps.PropArea tags "car"
"Parked Cars E" SET RandomProps.PropArea findTerrains False
"Parked Cars E" PUSH RandomProps.PropArea groundObjects "Floor"
"Parked Cars E" SET RandomProps.PropArea numberOfProps 50
"Parked Cars E" SET RandomProps.PropArea rotationStep 180
"Parked Cars E" SET active true
CREATE "Trees W"
"Trees W" SET Transform localPosition (-12.5 0 0)
"Trees W" ADD RandomProps.Rectangle
"Trees W" SET RandomProps.Rectangle size (5 100)
"Trees W" ADD RandomProps.PropArea
"Trees W" SET RandomProps.PropArea tags "tree"
"Trees W" SET RandomProps.PropArea findTerrains False
"Trees W" PUSH RandomProps.PropArea groundObjects "Floor"
"Trees W" SET RandomProps.PropArea numberOfProps 50
"Trees W" SET RandomProps.PropArea rotationStep 180
"Trees W" SET active true
CREATE "Trees E"
"Trees E" SET Transform localPosition (12.5 0 0)
"Trees E" ADD RandomProps.Rectangle
"Trees E" SET RandomProps.Rectangle size (5 100)
"Trees E" ADD RandomProps.PropArea
"Trees E" SET RandomProps.PropArea tags "tree"
"Trees E" SET RandomProps.PropArea findTerrains False
"Trees E" PUSH RandomProps.PropArea groundObjects "Floor"
"Trees E" SET RandomProps.PropArea numberOfProps 50
"Trees E" SET RandomProps.PropArea rotationStep 180
"Trees E" SET active true
CREATE "Animals"
"Animals" ADD RandomProps.Rectangle
"Animals" SET RandomProps.Rectangle size (15 100)
"Animals" ADD RandomProps.PropArea
"Animals" SET RandomProps.PropArea tags "animal"
"Animals" SET RandomProps.PropArea findTerrains False
"Animals" PUSH RandomProps.PropArea groundObjects "Floor"
"Animals" SET RandomProps.PropArea numberOfProps 50
"Animals" SET active true
CREATE "Cars"
"Cars" ADD Segmentation.Class Segmentation.Spawners.Entity
"Cars" SET Segmentation.Class className "Cars"
"Cars" ADD RandomProps.Rectangle
"Cars" SET RandomProps.Rectangle size (15 100)
"Cars" ADD RandomProps.PropArea
"Cars" SET RandomProps.PropArea tags "car"
"Cars" SET RandomProps.PropArea findTerrains False
"Cars" PUSH RandomProps.PropArea groundObjects "Floor"
"Cars" SET RandomProps.PropArea numberOfProps 10
"Cars" SET active true
CREATE "Trees"
"Trees" ADD RandomProps.Rectangle
"Trees" SET RandomProps.Rectangle size (15 100)
"Trees" ADD RandomProps.PropArea
"Trees" SET RandomProps.PropArea tags "tree"
"Trees" SET RandomProps.PropArea findTerrains False
"Trees" PUSH RandomProps.PropArea groundObjects "Floor"
"Trees" SET RandomProps.PropArea numberOfProps 10
"Trees" SET active true
CREATE "Bird"
"Bird" SET Transform localPosition (0 2 0)
"Bird" ADD RandomProps.Rectangle
"Bird" SET RandomProps.Rectangle size (15 100)
"Bird" ADD RandomProps.PropArea
"Bird" SET RandomProps.PropArea tags "bird"
"Bird" SET RandomProps.PropArea stickToGround False
"Bird" SET RandomProps.PropArea findTerrains False
"Bird" PUSH RandomProps.PropArea groundObjects "Floor"
"Bird" SET RandomProps.PropArea numberOfProps 10
"Bird" SET active true
CREATE "Signs"
"Signs" ADD RandomProps.Rectangle
"Signs" SET RandomProps.Rectangle size (15 100)
"Signs" ADD RandomProps.PropArea
"Signs" SET RandomProps.PropArea tags "sign"
"Signs" SET RandomProps.PropArea findTerrains False
"Signs" PUSH RandomProps.PropArea groundObjects "Floor"
"Signs" SET RandomProps.PropArea numberOfProps 10
"Signs" SET active true
CREATE "Grounds"
"Grounds" SET Transform localPosition (0 0.01 0)
"Grounds" ADD RandomProps.Rectangle
"Grounds" SET RandomProps.Rectangle size (50 100)
"Grounds" ADD RandomProps.PropArea
"Grounds" SET RandomProps.PropArea tags "ground"
"Grounds" SET RandomProps.PropArea collisionCheck False
"Grounds" SET RandomProps.PropArea stickToGround False
"Grounds" SET RandomProps.PropArea findTerrains False
"Grounds" PUSH RandomProps.PropArea groundObjects "Floor"
"Grounds" SET RandomProps.PropArea numberOfProps 100
"Grounds" SET active true
CREATE "Trafficlights"
"Trafficlights" ADD RandomProps.Rectangle
"Trafficlights" SET RandomProps.Rectangle size (15 100)
"Trafficlights" ADD RandomProps.PropArea
"Trafficlights" SET RandomProps.PropArea tags "trafficlight"
"Trafficlights" SET RandomProps.PropArea findTerrains False
"Trafficlights" PUSH RandomProps.PropArea groundObjects "Floor"
"Trafficlights" SET RandomProps.PropArea numberOfProps 10
"Trafficlights" SET active true
CREATE "Misc"
"Misc" ADD RandomProps.Rectangle
"Misc" SET RandomProps.Rectangle size (15 100)
"Misc" ADD RandomProps.PropArea
"Misc" SET RandomProps.PropArea findTerrains False
"Misc" PUSH RandomProps.PropArea groundObjects "Floor"
"Misc" SET RandomProps.PropArea numberOfProps 50
"Misc" SET active true
CREATE "Humans"
"Humans" ADD Segmentation.Class Segmentation.Spawners.Entity Humans.Spawners.RandomPose
"Humans" PUSH Humans.Spawners.RandomPose clips ASSET "Humans/animations/LookingAroundNervously" FROM "humans" ASSET "Humans/animations/LeanAgainstWall3" FROM "humans" ASSET "Humans/animations/StandingAngry" FROM "humans" ASSET "Humans/animations/LookingAround" FROM "humans" ASSET "Humans/animations/Crouch" FROM "humans" ASSET "Humans/animations/LeanAgainstWall2" FROM "humans" ASSET "Humans/animations/Sitting4" FROM "humans" ASSET "Humans/animations/Waving" FROM "humans" ASSET "Humans/animations/Sitting3" FROM "humans" ASSET "Humans/animations/PushButton" FROM "humans" ASSET "Humans/animations/Sitting1" FROM "humans" ASSET "Humans/animations/ShakingHands" FROM "humans" ASSET "Humans/animations/LeanAgainstWall" FROM "humans" ASSET "Humans/animations/ArmsCrossed" FROM "humans" ASSET "Humans/animations/Sitting2" FROM "humans" ASSET "Humans/animations/LookBehind" FROM "humans" ASSET "Humans/animations/Looking" FROM "humans"
"Humans" SET Segmentation.Class className "Humans"
"Humans" ADD RandomProps.Rectangle
"Humans" SET RandomProps.Rectangle size (15 100)
"Humans" ADD RandomProps.PropArea
"Humans" SET RandomProps.PropArea tags "human" collisionCheck False stickToGround False findTerrains False
"Humans" SET RandomProps.PropArea numberOfProps 50
"Humans" SET active true

"Camera" ADD Sensors.RenderCamera
"Camera" SET Sensors.RenderCamera resolution (1920 1080)

CREATE "disk1"
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "E:\tmp\"
CREATE "disk1/Cameras/rgb"
"disk1/Cameras/rgb" ADD Sensors.RenderCameraLink
"disk1/Cameras/rgb" SET Sensors.RenderCameraLink target "Camera"
"disk1/Cameras/rgb" SET Sensors.RenderCameraLink outputType "rgb"
"disk1/Cameras/rgb" SET active true
CREATE "disk1/Cameras/segmentation"
"disk1/Cameras/segmentation" ADD Sensors.RenderTextureLink
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink target "Segmentation Texture"
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink outputType "Segmentation"
"disk1/Cameras/segmentation" SET active true
CREATE "disk1/Cameras/thermal"
"disk1/Cameras/thermal" ADD Sensors.RenderTextureLink
"disk1/Cameras/thermal" SET Sensors.RenderTextureLink target "Thermal Texture"
"disk1/Cameras/thermal" SET Sensors.RenderTextureLink outputType "Thermal"
"disk1/Cameras/thermal" SET active true
"disk1" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
