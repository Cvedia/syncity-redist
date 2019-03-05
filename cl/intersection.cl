"QualitySettings" SET shadowDistance 100 shadowCascades 2 shadows 2 realtimeReflectionProbes false

// ---------- WORLD LOADING

LOAD "Worlds/Intersection Loop/Intersection Loop" FROM "worlds"

//Switch variants
//REGEX "World Root/.*" EXECUTE Tiler.TileVariantSet SwitchVariant "Italian City"
//REGEX "World Root/.*" EXECUTE Tiler.TileVariantSet SwitchVariant "Florida Neighborhood"
//REGEX "World Root/.*" EXECUTE Tiler.TileVariantSet SwitchVariant "European Town"
//REGEX "World Root/.*" EXECUTE Tiler.TileVariantSet SwitchVariant "NY City"

//Disable parked cars to improve performance
//REGEX "World Root/.*/Cars" SET active false
"World Root" Set transform localPosition (0 -0.03 0)

CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100
"EnviroSky" SET EnviroSky GameTime.Hours 13


// ---------- CAMERA SETUP
CREATE "Camera"

// Create RGB camera
CREATE "Camera/cameraRGB"
"Camera/cameraRGB" SET active false
"Camera/cameraRGB" ADD Camera
"Camera/cameraRGB" SET Camera tag "MainCamera" near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading" allowHDR true
"Camera/cameraRGB" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"Camera/cameraRGB" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeLayer 1 volumeTrigger "Camera/cameraRGB" antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 1
"Camera/cameraRGB" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal true
"Camera/cameraRGB" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume profile ASSET "PostProcessingProfiles/Intersection PostPro" FROM "sensors"
"Camera/cameraRGB" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"
"Camera/cameraRGB" ADD Syncity.ImageEffects.Antialiasing

[UI.Window] ShowFromCamera "Camera/cameraRGB" AS "RGB" WITH 1920 1080 24 "ARGB32" "Default"
"Camera/cameraRGB" SET active true

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

"Camera/Thermal" SET active true
"Camera" SET active true

[UI.Window] ShowFromCamera "Camera/Thermal" AS "Thermal" WITH 1920 1080 24 "ARGB32" "Default"

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
"Traffic" SET CarsTick entityCullingReference "Camera/Thermal"
"Traffic" SET CarsTick entityCullingDistance 500
"Traffic" SET CarsTick randomizeObjectNames true
"Traffic" SET CarsTick bikeRiderSegmentationClassName "Person"
"Traffic" ADD SUMOController RandomProps.Spawners.Spawner RandomProps.Spawners.Vehicles.RandomLicensePlate RandomProps.Spawners.RandomColor
"Traffic" SET SUMOController currentTime 150
"Traffic" SET SUMOController restartTime 750
"Traffic" SET SUMOController enabled false
"Traffic" SET RandomProps.Spawners.RandomColor randomMethod "FromList"
"Traffic" PUSH RandomProps.Spawners.RandomColor availableColors "#46AE9DFF" "#57531DFF" "#BF7ADEFF" "#7ABD71FF" "#BC982DFF" "#B008DEFF" "#54ED6EFF" "#E03102FF" "#42405DFF" "#AA25BEFF" "#910998FF" "#AD4046FF" "#A4B1CEFF" "#D77B73FF" "#D02542FF" "#175918FF"
"Traffic" PUSH RandomProps.Spawners.RandomColor colorsWeights 14

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
//Accurate visibility for cyclists (ensure you set autoCreateOnChildEntities to true to ensure bike <-> rider intersection is considered
//"Bikes" ADD Segmentation.Spawners.AccurateVisibility
//"Bikes" SET Segmentation.Spawners.AccurateVisibility autoCreateOnChildEntities true

[Segmentation.Camera] CreateWithClassColors "Camera/Segmentation" WITH lookUpTable "lookUpTable"
[Cameras.RenderTexture] CreateNew "cameraSegmentation1" 1920 1080
"Camera/Segmentation" ADD Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes
"Camera/Segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1
"Camera/Segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Person" "Car" "Bicycle"
"Camera/Segmentation" SET Camera targetTexture "cameraSegmentation1" nearClipPlane 0.1 far 1000

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


// ----------- Thermal Light (to reduce spikes in the histogram), note: this light only affects the thermal output

CREATE "Thermal light"
"Thermal light" SET Transform localEulerAngles (24.82 311.338 334.491)
"Thermal light" ADD Thermal.ThermalLight
//Increase the temperature to "warm up" the scene even more
"Thermal light" SET Thermal.ThermalLight temperature 12
"Thermal light" SET Thermal.ThermalLight lightType "Directional"
"Thermal light" SET active true

// workaround for thermal lights having to much impact on the center part of intersection - use only if 'Thermal light' is enabled
"World Root/tile_(0, 0)/Road Network/Connection Objects/Asphalt_NoLines_ER_X" SET active false
"World Root/tile_(0, 0)/Road Network/Connection Objects/Asphalt_NoLines_ER_X" ADD Thermal.ThermalObjectOverride
"World Root/tile_(0, 0)/Road Network/Connection Objects/Asphalt_NoLines_ER_X" SET Thermal.ThermalObjectOverride ambientOffsetMode "Relative" overridedAmbientOffset.value -6.3
"World Root/tile_(0, 0)/Road Network/Connection Objects/Asphalt_NoLines_ER_X" SET active true


// ---------- Thermal Histogram improvements (to spread the histogram even more)

//Increase skybox temperature to prevent spikes on the low end
"Camera/Thermal" SET Thermal.ThermalCamera skyboxBackgroundTemperature -6
//Reduce maximum temperature to "move the entire histogram to the upper end", commented by default
//"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-10 30)



// ----------- POST SETUP

"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera" "Camera/Thermal"
"EnviroSky" SET active true

"Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler drawThermalOnly true disableProbesRendering false

"Traffic" ADD TemporarySolution.WheelsTemperatureOverride
"Traffic" SET TemporarySolution.WheelsTemperatureOverride  ambientOffsetMode "Absolute" overridedAmbientOffset.value -3 heatinessMode "Absolute" overridedHeatiness.value 0

"Traffic" SET active true
"Traffic" EXECUTE FilteredAssetsPool SetContainerForType "Human" "Pedestrians"
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Human" 60
"Traffic" EXECUTE FilteredAssetsPool SetContainerForType "Bike" "Bikes"
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Bike" 25
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Car" 50


"EnviroSky" SET EnviroSky cloudsMode "Flat"
"EnviroSky" EXECUTE EnviroSky SetWeatherOverwrite 3
