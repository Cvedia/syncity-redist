"QualitySettings" SET shadowDistance 200 shadowCascades 2 shadows 2 realtimeReflectionProbes true

// ---------- WORLD LOADING

LOAD "Worlds/Intersection Loop/New York" FROM "worlds"

"RenderSettings" SET ambientMode "Trilight"
"RenderSettings" SET ambientSkyColor (0.7830189 0.7830189 0.7830189)

//Switch variants
//REGEX "World Root/.*" EXECUTE Tiler.TileVariantSet SwitchVariant "Italian City"
//REGEX "World Root/.*" EXECUTE Tiler.TileVariantSet SwitchVariant "Florida Neighborhood"

REGEX "World Root/.*/Cars" SET active false
"World Root" Set transform localPosition (0 -0.03 0)

CREATE "Direct Light"
"Direct Light" ADD Light
"Direct Light" SET Light type "Directional"
"Direct Light" SET Light shadows "Soft"
"Direct Light" SET Transform localPosition (-81.998 796.37 599.943)
"Direct Light" SET Transform localEulerAngles (52.785 172.361 0)
"Direct Light" SET Transform localScale (1000.003 1000.001 1000.002)
"Direct Light" SET Light shadowResolution "VeryHigh"
"Direct Light" SET Light color "#EAD2B9FF"
"Direct Light" SET Light intensity 1.466
"Direct Light" SET Light shadowBias 0
"Direct Light" SET active true


// ---------- CAMERA SETUP

CREATE "Camera"
"Camera" SET active true
CREATE "Camera/cameraRGB"
"Camera/cameraRGB" SET active false
"Camera/cameraRGB" ADD Camera
"Camera/cameraRGB" SET Camera tag "MainCamera" near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading" allowHDR true
"Camera/cameraRGB" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"Camera/cameraRGB" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeLayer 1 volumeTrigger "Camera/cameraRGB" antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 1
"Camera/cameraRGB" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal true
"Camera/cameraRGB" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume profile ASSET "PostProcessingProfiles/Intersection PostPro" FROM "sensors"
"Camera/cameraRGB" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"

[UI.Window] ShowFromCamera "Camera/cameraRGB" AS "RGB" WITH 1920 1080 24 "ARGB32" "Default"
"Camera/cameraRGB" SET active true

// ---------- HUMANS INITIALIZATION

CREATE "Humans/Male" FROM "humans" AS "human_male"
CREATE "Humans/Female" FROM "humans" AS "human_female"

REGEX "human_*" ADD Humans.Random.RandomHuman
REGEX "human_*" SET Humans.Random.RandomHuman settings.async false settings.context "Casual" numberOfHeadsToMorphBetween 3 numberOfBodyShapesToMorphBetween 3  attemptToFixClothingCollisions true randomizeOnEnable true
REGEX "human_*" ADD Humans.Locomotion.Character Humans.Locomotion.ExternalAgent
REGEX "human_*" SET Humans.Locomotion.ExternalAgent stickToGround true
REGEX "human_*" SET Humans.Locomotion.Character AnimatorForwardAmountMultiplier 1
REGEX "human_*" ADD Humans.Animation.RandomPose
"human_male" PUSH Humans.Animation.RandomPose clips ASSET "Humans/animations/Walk" FROM "humans" ASSET "Humans/animations/Run" FROM "humans"
"human_female" PUSH Humans.Animation.RandomPose clips ASSET "Humans/animations/Walk" FROM "humans" ASSET "Humans/animations/Run" FROM "humans"


// ---------- SUMO TRAFFIC

CREATE "Traffic"
"Traffic" ADD SUMOProcess
"Traffic" SET SUMOProcess sumoConfigName "traffic.pedestrians.15.min.sumocfg"

//USE THE LINE BELOW INSTEAD IF YOU DON'T WANT PEDESTRIANS IN THE SIMULATION, WAY FASTER TO GENERATE DATASETS
//"Traffic" SET SUMOProcess sumoConfigName "traffic._no_pedestrians.15.min.sumocfg"

//OR THIS ONE IF YOU WANT A LOW DENSITY OF PEDESTRIANS, FASTER TO GENERATE DATASETS
//"Traffic" SET SUMOProcess sumoConfigName "traffic.low_pedestrians.15.min.sumocfg"

"Traffic" SET SUMOProcess sumoPath "sumo\"
"Traffic" SET SUMOProcess sumoParams "-v --remote-port 4001 --start --step-length 0.016 --collision.check-junctions true --collision.mingap-factor 1 --collision.action teleport --lanechange.duration 2"

"Traffic" ADD FilteredAssetsPool
"Traffic" SET FilteredAssetsPool usePlaceholders false
"Traffic" PUSH FilteredAssetsPool humanReferences "human_male" "human_female"
"Traffic" ADD CarsTick
"Traffic" ADD PedestriansTick
"Traffic" ADD TrafficLightsTick
"Traffic" SET CarsTick entityCullingReference "Camera/cameraRGB"
"Traffic" SET CarsTick entityCullingDistance 500
"Traffic" SET CarsTick randomizeObjectNames true
"Traffic" SET CarsTick bikeRiderSegmentationClassName "Person"
"Traffic" ADD SUMOController RandomProps.Spawners.Spawner RandomProps.Spawners.Vehicles.RandomLicensePlate RandomProps.Spawners.RandomColor
"Traffic" SET SUMOController currentTime 150
"Traffic" SET SUMOController restartTime 750
"Traffic" SET SUMOController enabled false
"Traffic" SET RandomProps.Spawners.RandomColor randomMethod "FromList"
"Traffic" SET RandomProps.Spawners.RandomColor useForMainColor false
"Traffic" PUSH RandomProps.Spawners.RandomColor availableColors "#0A0A0A" "#8C8C8C" "#ABABAB" "#5A5A5A" "#162852" "#003400" "#A40000" "#76000C" "#60451E" "#312008" "#1E6376" "#2F1C33" "#9A8E67" "#B48F00" "#282D3E" "#B74A04"
"Traffic" PUSH RandomProps.Spawners.RandomColor colorsWeights 179 170 154 123 106 79 74 21 21 20 15 15 6 5 4 1

//Restrict by tags
"Traffic" SET FilteredAssetsPool carFilterTags "+car,+thermal,+fixed,-car.classification=\"Truck\",-car.classification=\"Bus\",-car.classification=\"Police\",-car.classification=\"Bike\",-car.classification=\"Special Purpose Vehicle\",-car.classification=\"Motorbike\""
"Traffic" SET FilteredAssetsPool vanFilterTags "car.classification=\"Truck\",+thermal,+fixed"
"Traffic" SET FilteredAssetsPool busFilterTags "car.classification=\"Bus\",+thermal,+fixed"
"Traffic" SET FilteredAssetsPool ambulanceFilterTags "car.classification=\"Police\",+thermal,+fixed"
"Traffic" SET FilteredAssetsPool bikeFilterTags "bicycle"

//OR restrict by specific vehicles
//"Traffic" PUSH FilteredAssetsPool carAssets "thermal-cars:Cars/BMW_X6/BMW_X6"

CREATE "Bikes"
"Bikes" SET active true

CREATE "Pedestrians"
"Pedestrians" SET active true
"Traffic" SET PedestriansTick pedestrianContainer "Pedestrians" smoothing false
"Traffic" SET SUMOController scale 1

//"Traffic" SET CarsTick entityCullingReference "Main Camera"


// ----------- FAST FORWARD FRAMES

"Time.instance" SET captureFramerate 2
"Traffic" SET SUMOController smoothing false

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

//Accurate visibility for cars
//"Traffic" ADD Segmentation.Spawners.AccurateVisibility
//Accurate visibility for pedestrians
//"Pedestrians" ADD Segmentation.Spawners.AccurateVisibility
//Accurate visibility for cyclists
//"Bikes" ADD Segmentation.Spawners.AccurateVisibility

[Segmentation.Camera] CreateWithClassColors "Camera/Segmentation" WITH lookUpTable "lookUpTable"
"Camera/Segmentation" SET active false
[Cameras.RenderTexture] CreateNew "cameraSegmentation1" 1920 1080
"Camera/Segmentation" ADD Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes
"Camera/Segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1
"Camera/Segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Person" "Car" "Bicycle"
"Camera/Segmentation" SET Camera targetTexture "cameraSegmentation1" nearClipPlane 0.1 far 1000 clearFlags "SolidColor"

//Accurate visibility. This needs to be added globally if you want accurate visibility for any of the entities
//"Camera/Segmentation" ADD Segmentation.Output.AccurateVisibilityModule

"Camera/Segmentation" SET active true
[UI.Window] ShowFromRenderTexture "cameraSegmentation1" AS "cameraSegmentation1"


//Uncomment the lines below if you want to hide entities that are too far from cameras (to prevent small objects from being rendered to the final frames altogether)
//"Pedestrians" ADD Cameras.Spawners.HideByDistance
//"Pedestrians" SET Cameras.Spawners.HideByDistance MaxDistance 20
//"Traffic" ADD Cameras.Spawners.HideByDistance
//"Traffic" SET Cameras.Spawners.HideByDistance MaxDistance 20
//"Bikes" ADD Cameras.Spawners.HideByDistance
//"Bikes" SET Cameras.Spawners.HideByDistance MaxDistance 20

// ----------- ENTROPY - Jump from one car to another at random

"Camera" ADD JumpBetweenObjects
"Camera" SET JumpBetweenObjects container "Traffic"
"Camera" SET JumpBetweenObjects localPosition (0 2 2.3)
"Camera" SET JumpBetweenObjects rotationMinY -20 rotationMaxY 20 ignoreObjectsNamed "Vehicle Pointer"


// ----------- POST SETUP

"World Root" SET active true

"Traffic" SET active true
"Traffic" EXECUTE FilteredAssetsPool SetContainerForType "Human" "Pedestrians"
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Human" 60
"Traffic" EXECUTE FilteredAssetsPool SetContainerForType "Bike" "Bikes"
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Bike" 25
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Car" 50
