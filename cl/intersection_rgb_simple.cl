"QualitySettings" SET realtimeReflectionProbes true

// ---------- WORLD LOADING

LOAD "Worlds/Intersection Loop/New York" FROM "worlds"
//LOAD "Worlds/Intersection Loop/Florida" FROM "worlds"

REGEX "World Root/.*/Cars" SET active false

CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100
"EnviroSky" SET EnviroSky GameTime.Hours 13


// ---------- CAMERA SETUP

CREATE "Camera"
"Camera" ADD FlyCamera

CREATE "Camera/cameraRGB"
"Camera/cameraRGB" SET active false
"Camera/cameraRGB" SET Camera near 0.3 far 100 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true
"Camera/cameraRGB" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"Camera/cameraRGB" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "Camera/cameraRGB" antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 0
"Camera/cameraRGB" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal false profile "Cold Profile"
"Camera/cameraRGB" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"

[UI.Window] ShowFromCamera "Camera/cameraRGB" AS "cameraRGB" WITH 1920 1080 24 "ARGB32" "Default"
"Camera/cameraRGB" SET active true
"Camera" EXECUTE SetActive true

// ---------- HUMANS INITIALIZATION

CREATE "Humans/Male" FROM "humans" AS "human_male"
CREATE "Humans/Female" FROM "humans" AS "human_female"

REGEX "human_*" ADD Humans.Random.RandomHuman
REGEX "human_*" SET Humans.Random.RandomHuman settings.async false settings.context "Casual" numberOfHeadsToMorphBetween 3 numberOfBodyShapesToMorphBetween 3  attemptToFixClothingCollisions true randomizeOnEnable true
REGEX "human_*" ADD Humans.Locomotion.Character Humans.Locomotion.ExternalAgent
REGEX "human_*" SET Humans.Locomotion.ExternalAgent stickToGround true
REGEX "human_*" SET Humans.Locomotion.Character AnimatorForwardAmountMultiplier 1

//Add the line below for animation stepping
//REGEX "human_*" ADD Humans.Animation.AnimationStepper


// ---------- SUMO TRAFFIC

CREATE "Traffic"
"Traffic" ADD SUMOProcess
"Traffic" SET SUMOProcess sumoPath "sumo\"
"Traffic" SET SUMOProcess sumoParams "-v --remote-port 4001 --start --step-length 0.016 --collision.check-junctions true --collision.mingap-factor 0 --collision.action warn"

"Traffic" ADD FilteredAssetsPool
"Traffic" SET FilteredAssetsPool usePlaceholders false
"Traffic" PUSH FilteredAssetsPool humanReferences "human_male" "human_female"
"Traffic" ADD CarsTick
"Traffic" ADD PedestriansTick
"Traffic" ADD TrafficLightsTick
"Traffic" SET CarsTick entityCullingReference "Camera/cameraRGB"
"Traffic" SET CarsTick entityCullingDistance 999999
"Traffic" SET CarsTick bikeRiderSegmentationClassName "Person"
"Traffic" ADD SUMOController RandomProps.Spawners.Spawner RandomProps.Spawners.Vehicles.RandomLicensePlate

// CAR COLOR RANDOMIZER
//"Traffic" ADD RandomProps.Spawners.RandomColor
//"Traffic" SET RandomProps.Spawners.RandomColor randomMethod "FromList"
//"Traffic" PUSH RandomProps.Spawners.RandomColor availableColors "#46AE9DFF" "#57531DFF" "#BF7ADEFF" "#7ABD71FF" "#BC982DFF" "#B008DEFF" "#54ED6EFF" "#E03102FF" "#42405DFF" "#AA25BEFF" "#910998FF" "#AD4046FF" "#A4B1CEFF" "#D77B73FF" "#D02542FF" "#175918FF"
//"Traffic" PUSH RandomProps.Spawners.RandomColor colorsWeights 14

CREATE "Bikes"
"Bikes" SET active true

CREATE "Pedestrians"
"Pedestrians" SET active true
"Traffic" SET PedestriansTick pedestrianContainer "Pedestrians"
"Traffic" SET SUMOController scale 1

//"Traffic" SET CarsTick entityCullingReference "Main Camera"


// ----------- FAST FORWARD FRAMES

"Time.instance" SET captureFramerate 2
"Traffic" SET SUMOController smoothing false


// ---------- EXPORT SETUP

CREATE "dataExport1"
CREATE "dataExport1/exporter"
CREATE "dataExport1/links"
"dataExport1/exporter" ADD Sensors.DataExport
"dataExport1/exporter" SET Sensors.DataExport streamOutput "E:\tmp\"
"dataExport1/exporter" SET active true
"dataExport1/links" SET active true


// ----------- EXPORT RGB CAMERA

CREATE "dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e02"
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e02" ADD Sensors.ImageExportLink
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e02" SET Sensors.ImageExportLink target "Camera/cameraRGB" exportBBoxes "false" label "rgb" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e02"
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e02" EXECUTE Sensors.ImageExportLink SetOptions "height->1080"
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e02" EXECUTE Sensors.ImageExportLink SetOptions "width->1920"
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e02" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e02" EXECUTE Sensors.ImageExportLink SetOptions "format->jpg"
"dataExport1/links/770fa81b-e3f0-48a0-858a-5b5360db4e02" SET active true


// ----------- SEGMENTATION CAMERA SETUP

"Segmentation.Profile.instance" PUSH classes "Void" "Sky" "Car" "Bicycle" "Person" "Signs" "Traffic_light" "Crosswalk_sign"

CREATE Segmentation.LookUpTable AS "lookUpTable"
"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Void->black" "Sky->black" "Person->Yellow" "Car->Red" "Bicycle->White" "Signs->Blue" "Traffic_light->#FF00AAFF" "Crosswalk_sign->#AA00AAFF"

"Bikes" ADD RandomProps.Spawners.Spawner
"Bikes" ADD Segmentation.Class Segmentation.Spawners.Entity
"Bikes" SET Segmentation.Class className "Bicycle"
"Traffic" ADD RandomProps.Spawners.Spawner
"Traffic" ADD Segmentation.Class Segmentation.Spawners.Entity
"Traffic" SET Segmentation.Class className "Car"
"Pedestrians" ADD RandomProps.Spawners.Spawner
"Pedestrians" ADD Segmentation.Class Segmentation.Spawners.Entity
"Pedestrians" SET Segmentation.Class className "Person"

REGEX "World Root/.*/Signs/.*/Traffic Light.*" ADD Segmentation.Class
REGEX "World Root/.*/Signs/.*/Traffic Light.*" SET Segmentation.Class className "Traffic_light"
REGEX "World Root/.*/Signs/.*/crosswalk.*/Object*" ADD Segmentation.Class
REGEX "World Root/.*/Signs/.*/crosswalk.*/Object*" SET Segmentation.Class className "Crosswalk_sign"
REGEX "World Root/.*/Signs/.*/New sign/.*/.*shape" ADD Segmentation.Class
REGEX "World Root/.*/Signs/.*/New sign/.*/.*shape" SET Segmentation.Class className "Signs"

CREATE "Camera/Segmentation"
"Camera/Segmentation" SET active false
"Camera/Segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors Segmentation.Output.FilteredBoundingBoxes
"Camera/Segmentation" SET SegmentationCamera transparencyCutout 0
"Camera/Segmentation" SET Camera allowMSAA false allowHDR false near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point"
"Camera/Segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1
"Camera/Segmentation" SET Segmentation.Output.ClassColors lookUpTable "lookUpTable"
"Camera/Segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Sky" "Person" "Car" "Bicycle" "Signs" "Traffic_light" "Crosswalk_sign"
[UI.Window] ShowFromCamera "Camera/Segmentation" AS "segmentation" WITH 1920 1080 24 "ARGBFloat" "Default"
"Camera/Segmentation" SET active true

// ----------- EXPORT SEGMENTATION CAMERA

CREATE "dataExport1/links/022914b6-9cac-463c-940e-3712cf051084"
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" ADD Sensors.ImageExportLink
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" SET Sensors.ImageExportLink target "Camera/Segmentation" label "segmentation" exportBBoxes "true" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/022914b6-9cac-463c-940e-3712cf051084"
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" EXECUTE Sensors.ImageExportLink SetOptions "width->1920"
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" EXECUTE Sensors.ImageExportLink SetOptions "height->1080"
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" EXECUTE Sensors.ImageExportLink SetOptions "format->png"
"dataExport1/links/022914b6-9cac-463c-940e-3712cf051084" SET active true


// ----------- POST SETUP

"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera" "Camera/cameraRGB"
"EnviroSky" SET active true
"World Root" SET active true

"Traffic" SET active true
"Traffic" EXECUTE FilteredAssetsPool SetContainerForType "Human" "Pedestrians"
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Human" 60
"Traffic" EXECUTE FilteredAssetsPool SetContainerForType "Bike" "Bikes"
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Bike" 25
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Car" 50

"EnviroSky" EXECUTE EnviroSky SetWeatherOverwrite 3
SLEEP 10

// "dataExport1" SET active true
