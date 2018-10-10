"Config.instance" SET assetBundlesCache "F:\shared\__assetbundles__\181001\"
"Config.instance" SET databaseFolderPath "F:\shared\__assetbundles__\181001\"
"Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler drawThermalOnly false disableProbesRendering false
"Config.instance" SET physicsEnabled false

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
CREATE "Camera/A"
CREATE "Camera/B"
CREATE "Camera/C"
CREATE "Camera/D"
CREATE "CameraJumper"

"Camera" ADD FlyCamera

// global reflection probe
"Camera" ADD ReflectionProbe
"Camera" SET ReflectionProbe type 2 mode 1 refreshMode 1 shadowDistance 0 boxProjection true farClipPlane 350 size (250 250 250) resolution 1024 hdr true enabled true


CREATE "Camera/A/cameraRGB1"
"Camera/A/cameraRGB1" SET active false
"Camera/A/cameraRGB1" SET Transform position (0 0 0) eulerAngles (0 0 0)
"Camera/A/cameraRGB1" ADD Camera
"Camera/A/cameraRGB1" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true
"Camera/A/cameraRGB1" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"Camera/A/cameraRGB1" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "Camera/A/cameraRGB1" antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 0
"Camera/A/cameraRGB1" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal false profile "Cold Profile"
"Camera/A/cameraRGB1" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"
[UI.Window] ShowFromCamera "Camera/A/cameraRGB1" AS "cameraRGB1" WITH 2048 1024 24 "ARGB32" "Default"
"Camera/A/cameraRGB1" SET active true

CREATE "Camera/B/cameraRGB2"
"Camera/B/cameraRGB2" SET active false
"Camera/B/cameraRGB2" SET Transform position (0 0 0) eulerAngles (0 0 0)
"Camera/B/cameraRGB2" ADD Camera
"Camera/B/cameraRGB2" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true
"Camera/B/cameraRGB2" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"Camera/B/cameraRGB2" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "Camera/B/cameraRGB2" antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 0
"Camera/B/cameraRGB2" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal false profile "Cold Profile"
"Camera/B/cameraRGB2" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"
[UI.Window] ShowFromCamera "Camera/B/cameraRGB2" AS "cameraRGB2" WITH 2048 1024 24 "ARGB32" "Default"
"Camera/B/cameraRGB2" SET active true

CREATE "Camera/C/cameraRGB3"
"Camera/C/cameraRGB3" SET active false
"Camera/C/cameraRGB3" SET Transform position (0 0 0) eulerAngles (0 0 0)
"Camera/C/cameraRGB3" ADD Camera
"Camera/C/cameraRGB3" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true
"Camera/C/cameraRGB3" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"Camera/C/cameraRGB3" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "Camera/C/cameraRGB3" antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 0
"Camera/C/cameraRGB3" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal false profile "Cold Profile"
"Camera/C/cameraRGB3" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"
[UI.Window] ShowFromCamera "Camera/C/cameraRGB3" AS "cameraRGB3" WITH 2048 1024 24 "ARGB32" "Default"
"Camera/C/cameraRGB3" SET active true

CREATE "Camera/D/cameraRGB4"
"Camera/D/cameraRGB4" SET active false
"Camera/D/cameraRGB4" SET Transform localPosition (0 0 0) localEulerAngles (0 0 0)
"Camera/D/cameraRGB4" ADD Camera
"Camera/D/cameraRGB4" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true
"Camera/D/cameraRGB4" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"Camera/D/cameraRGB4" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "Camera/D/cameraRGB4" antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 0
"Camera/D/cameraRGB4" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal false profile "Cold Profile"
"Camera/D/cameraRGB4" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"
[UI.Window] ShowFromCamera "Camera/D/cameraRGB4" AS "cameraRGB4" WITH 2048 1024 24 "ARGB32" "Default"
"Camera/D/cameraRGB4" SET active true

CREATE "CameraJumper/cameraRGBJ"
"CameraJumper/cameraRGBJ" SET active false
"CameraJumper/cameraRGBJ" ADD Camera
"CameraJumper/cameraRGBJ" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true
"CameraJumper/cameraRGBJ" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"CameraJumper/cameraRGBJ" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "CameraJumper/cameraRGBJ" antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 0
"CameraJumper/cameraRGBJ" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal false profile "Cold Profile"
"CameraJumper/cameraRGBJ" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"
[UI.Window] ShowFromCamera "CameraJumper/cameraRGBJ" AS "cameraRGBJ" WITH 2048 1024 24 "ARGB32" "Default"
"CameraJumper/cameraRGBJ" SET active true

"CameraJumper" EXECUTE SetActive true
"Camera/A" EXECUTE SetActive true
"Camera/B" EXECUTE SetActive true
"Camera/C" EXECUTE SetActive true
"Camera/D" EXECUTE SetActive true
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
"Traffic" SET CarsTick entityCullingReference "Camera/A/cameraRGB1"
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

// ----------- SEGMENTATION CAMERA SETUP

"Segmentation.Profile.instance" PUSH classes "Void" "Sky" "Car" "Bicycle" "Person" "Signs" "Traffic_light" "Crosswalk_light" "Crosswalk_sign"

CREATE Segmentation.LookUpTable AS "lookUpTable"
"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Void->black" "Sky->black" "Person->Yellow" "Car->Red" "Bicycle->White" "Signs->Blue" "Traffic_light->#FF00AAFF" "Crosswalk_sign->#AA00AAFF" "Crosswalk_light->#00FF00FF"

"Bikes" ADD RandomProps.Spawners.Spawner
"Bikes" ADD Segmentation.Class Segmentation.Spawners.Entity
"Bikes" SET Segmentation.Class className "Bicycle"
"Traffic" ADD RandomProps.Spawners.Spawner
"Traffic" ADD Segmentation.Class Segmentation.Spawners.Entity
"Traffic" SET Segmentation.Class className "Car"
"Pedestrians" ADD RandomProps.Spawners.Spawner
"Pedestrians" ADD Segmentation.Class Segmentation.Spawners.Entity
"Pedestrians" SET Segmentation.Class className "Person"

//REGEX "World Root/.*/Signs" ADD Segmentation.Class
//REGEX "World Root/.*/Signs" SET Segmentation.Class className "Signs"

REGEX "World Root/.*/Signs/.*/Traffic Light.*/Box 1" ADD Segmentation.Class
REGEX "World Root/.*/Signs/.*/Traffic Light.*/Box 1" SET Segmentation.Class className "Traffic_light"
REGEX "World Root/.*/Signs/.*/Traffic Light.*/Box 2" ADD Segmentation.Class
REGEX "World Root/.*/Signs/.*/Traffic Light.*/Box 2" SET Segmentation.Class className "Traffic_light"
REGEX "World Root/.*/Signs/.*/Traffic Light.*/Box 3" ADD Segmentation.Class
REGEX "World Root/.*/Signs/.*/Traffic Light.*/Box 3" SET Segmentation.Class className "Traffic_light"

REGEX "World Root/.*/Signs/.*/Traffic Light.*/Box 4" ADD Segmentation.Class
REGEX "World Root/.*/Signs/.*/Traffic Light.*/Box 4" SET Segmentation.Class className "Crosswalk_light"
REGEX "World Root/.*/Signs/.*/Traffic Light.*/Box 5" ADD Segmentation.Class
REGEX "World Root/.*/Signs/.*/Traffic Light.*/Box 5" SET Segmentation.Class className "Crosswalk_light"

REGEX "World Root/.*/Signs/.*/crosswalk.*/Object*" ADD Segmentation.Class
REGEX "World Root/.*/Signs/.*/crosswalk.*/Object*" SET Segmentation.Class className "Crosswalk_sign"
REGEX "World Root/.*/Signs/.*/New sign/.*/.*shape" ADD Segmentation.Class
REGEX "World Root/.*/Signs/.*/New sign/.*/.*shape" SET Segmentation.Class className "Signs"

CREATE "Camera/A/Segmentation1"
"Camera/A/Segmentation1" SET active false
"Camera/A/Segmentation1" SET Transform localPosition (0 0 0) localEulerAngles (0 0 0)
"Camera/A/Segmentation1" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors Segmentation.Output.FilteredBoundingBoxes
"Camera/A/Segmentation1" SET SegmentationCamera transparencyCutout 0
"Camera/A/Segmentation1" SET Camera allowMSAA false allowHDR false near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point"
"Camera/A/Segmentation1" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1
"Camera/A/Segmentation1" SET Segmentation.Output.ClassColors lookUpTable "lookUpTable"
"Camera/A/Segmentation1" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Sky" "Person" "Car" "Bicycle" "Signs" "Traffic_light" "Crosswalk_sign" "Crosswalk_light"
[UI.Window] ShowFromCamera "Camera/A/Segmentation1" AS "segmentation1" WITH 2048 1024 24 "ARGBFloat" "Default"
"Camera/A/Segmentation1" SET active true

CREATE "Camera/B/Segmentation2"
"Camera/B/Segmentation2" SET active false
"Camera/B/Segmentation2" SET Transform localPosition (0 0 0) localEulerAngles (0 0 0)
"Camera/B/Segmentation2" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors Segmentation.Output.FilteredBoundingBoxes
"Camera/B/Segmentation2" SET SegmentationCamera transparencyCutout 0
"Camera/B/Segmentation2" SET Camera allowMSAA false allowHDR false near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point"
"Camera/B/Segmentation2" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1
"Camera/B/Segmentation2" SET Segmentation.Output.ClassColors lookUpTable "lookUpTable"
"Camera/B/Segmentation2" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Sky" "Person" "Car" "Bicycle" "Signs" "Traffic_light" "Crosswalk_sign" "Crosswalk_light"
[UI.Window] ShowFromCamera "Camera/B/Segmentation2" AS "segmentation2" WITH 2048 1024 24 "ARGBFloat" "Default"
"Camera/B/Segmentation2" SET active true

CREATE "Camera/C/Segmentation3"
"Camera/C/Segmentation3" SET active false
"Camera/C/Segmentation3" SET Transform localPosition (0 0 0) localEulerAngles (0 0 0)
"Camera/C/Segmentation3" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors Segmentation.Output.FilteredBoundingBoxes
"Camera/C/Segmentation3" SET SegmentationCamera transparencyCutout 0
"Camera/C/Segmentation3" SET Camera allowMSAA false allowHDR false near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point"
"Camera/C/Segmentation3" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1
"Camera/C/Segmentation3" SET Segmentation.Output.ClassColors lookUpTable "lookUpTable"
"Camera/C/Segmentation3" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Sky" "Person" "Car" "Bicycle" "Signs" "Traffic_light" "Crosswalk_sign" "Crosswalk_light"
[UI.Window] ShowFromCamera "Camera/C/Segmentation3" AS "segmentation3" WITH 2048 1024 24 "ARGBFloat" "Default"
"Camera/C/Segmentation3" SET active true

CREATE "Camera/D/Segmentation4"
"Camera/D/Segmentation4" SET active false
"Camera/D/Segmentation4" SET Transform localPosition (0 0 0) localEulerAngles (0 0 0)
"Camera/D/Segmentation4" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors Segmentation.Output.FilteredBoundingBoxes
"Camera/D/Segmentation4" SET SegmentationCamera transparencyCutout 0
"Camera/D/Segmentation4" SET Camera allowMSAA false allowHDR false near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point"
"Camera/D/Segmentation4" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1
"Camera/D/Segmentation4" SET Segmentation.Output.ClassColors lookUpTable "lookUpTable"
"Camera/D/Segmentation4" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Sky" "Person" "Car" "Bicycle" "Signs" "Traffic_light" "Crosswalk_sign" "Crosswalk_light"
[UI.Window] ShowFromCamera "Camera/D/Segmentation4" AS "segmentation4" WITH 2048 1024 24 "ARGBFloat" "Default"
"Camera/D/Segmentation4" SET active true

CREATE "CameraJumper/SegmentationJ"
"CameraJumper/SegmentationJ" SET active false
"CameraJumper/SegmentationJ" SET Transform localPosition (0 0 0) localEulerAngles (0 0 0)
"CameraJumper/SegmentationJ" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors Segmentation.Output.FilteredBoundingBoxes
"CameraJumper/SegmentationJ" SET SegmentationCamera transparencyCutout 0
"CameraJumper/SegmentationJ" SET Camera allowMSAA false allowHDR false near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point"
"CameraJumper/SegmentationJ" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1
"CameraJumper/SegmentationJ" SET Segmentation.Output.ClassColors lookUpTable "lookUpTable"
"CameraJumper/SegmentationJ" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Sky" "Person" "Car" "Bicycle" "Signs" "Traffic_light" "Crosswalk_sign" "Crosswalk_light"
[UI.Window] ShowFromCamera "CameraJumper/SegmentationJ" AS "segmentationJ" WITH 2048 1024 24 "ARGBFloat" "Default"
"CameraJumper/SegmentationJ" SET active true

"CameraJumper" ADD JumpBetweenObjects
"CameraJumper" SET JumpBetweenObjects container "Traffic"
"CameraJumper" SET JumpBetweenObjects localPosition (0 1.5~3.5 2)

// ---------- EXPORT SETUP

CREATE "dataExport1"
CREATE "dataExport1/exporter"
CREATE "dataExport1/links"
"dataExport1/exporter" ADD Sensors.DataExport
"dataExport1/exporter" SET Sensors.DataExport streamOutput "E:\tmp\"
"dataExport1/exporter" SET active true
"dataExport1/links" SET active true

// ----------- EXPORT CAMERA SETUP 1

CREATE "dataExport1/links/exp-cameraRGB1"
"dataExport1/links/exp-cameraRGB1" ADD Sensors.ImageExportLink
"dataExport1/links/exp-cameraRGB1" SET Sensors.ImageExportLink target "Camera/A/cameraRGB1" exportBBoxes "false" label "RGB1" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/exp-cameraRGB1"
"dataExport1/links/exp-cameraRGB1" EXECUTE Sensors.ImageExportLink SetOptions "height->1024"
"dataExport1/links/exp-cameraRGB1" EXECUTE Sensors.ImageExportLink SetOptions "width->2048"
"dataExport1/links/exp-cameraRGB1" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/exp-cameraRGB1" EXECUTE Sensors.ImageExportLink SetOptions "format->jpg"
"dataExport1/links/exp-cameraRGB1" SET active true

CREATE "dataExport1/links/exp-Segmentation1"
"dataExport1/links/exp-Segmentation1" ADD Sensors.ImageExportLink
"dataExport1/links/exp-Segmentation1" SET Sensors.ImageExportLink target "Camera/A/Segmentation1" label "Segmentation1" exportBBoxes "true" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/exp-Segmentation1"
"dataExport1/links/exp-Segmentation1" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/exp-Segmentation1" EXECUTE Sensors.ImageExportLink SetOptions "width->2048"
"dataExport1/links/exp-Segmentation1" EXECUTE Sensors.ImageExportLink SetOptions "height->1024"
"dataExport1/links/exp-Segmentation1" EXECUTE Sensors.ImageExportLink SetOptions "format->png"
"dataExport1/links/exp-Segmentation1" SET active true

// ----------- EXPORT CAMERA SETUP 2

CREATE "dataExport1/links/exp-cameraRGB2"
"dataExport1/links/exp-cameraRGB2" ADD Sensors.ImageExportLink
"dataExport1/links/exp-cameraRGB2" SET Sensors.ImageExportLink target "Camera/B/cameraRGB2" exportBBoxes "false" label "RGB2" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/exp-cameraRGB2"
"dataExport1/links/exp-cameraRGB2" EXECUTE Sensors.ImageExportLink SetOptions "height->1024"
"dataExport1/links/exp-cameraRGB2" EXECUTE Sensors.ImageExportLink SetOptions "width->2048"
"dataExport1/links/exp-cameraRGB2" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/exp-cameraRGB2" EXECUTE Sensors.ImageExportLink SetOptions "format->jpg"
"dataExport1/links/exp-cameraRGB2" SET active true

CREATE "dataExport1/links/exp-Segmentation2"
"dataExport1/links/exp-Segmentation2" ADD Sensors.ImageExportLink
"dataExport1/links/exp-Segmentation2" SET Sensors.ImageExportLink target "Camera/B/Segmentation2" label "Segmentation2" exportBBoxes "true" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/exp-Segmentation2"
"dataExport1/links/exp-Segmentation2" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/exp-Segmentation2" EXECUTE Sensors.ImageExportLink SetOptions "width->2048"
"dataExport1/links/exp-Segmentation2" EXECUTE Sensors.ImageExportLink SetOptions "height->1024"
"dataExport1/links/exp-Segmentation2" EXECUTE Sensors.ImageExportLink SetOptions "format->png"
"dataExport1/links/exp-Segmentation2" SET active true

// ----------- EXPORT CAMERA SETUP 3

CREATE "dataExport1/links/exp-cameraRGB3"
"dataExport1/links/exp-cameraRGB3" ADD Sensors.ImageExportLink
"dataExport1/links/exp-cameraRGB3" SET Sensors.ImageExportLink target "Camera/C/cameraRGB3" exportBBoxes "false" label "RGB3" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/exp-cameraRGB3"
"dataExport1/links/exp-cameraRGB3" EXECUTE Sensors.ImageExportLink SetOptions "height->1024"
"dataExport1/links/exp-cameraRGB3" EXECUTE Sensors.ImageExportLink SetOptions "width->2048"
"dataExport1/links/exp-cameraRGB3" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/exp-cameraRGB3" EXECUTE Sensors.ImageExportLink SetOptions "format->jpg"
"dataExport1/links/exp-cameraRGB3" SET active true

CREATE "dataExport1/links/exp-Segmentation3"
"dataExport1/links/exp-Segmentation3" ADD Sensors.ImageExportLink
"dataExport1/links/exp-Segmentation3" SET Sensors.ImageExportLink target "Camera/C/Segmentation3" label "Segmentation3" exportBBoxes "true" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/exp-Segmentation3"
"dataExport1/links/exp-Segmentation3" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/exp-Segmentation3" EXECUTE Sensors.ImageExportLink SetOptions "width->2048"
"dataExport1/links/exp-Segmentation3" EXECUTE Sensors.ImageExportLink SetOptions "height->1024"
"dataExport1/links/exp-Segmentation3" EXECUTE Sensors.ImageExportLink SetOptions "format->png"
"dataExport1/links/exp-Segmentation3" SET active true

// ----------- EXPORT CAMERA SETUP 4

CREATE "dataExport1/links/exp-cameraRGB4"
"dataExport1/links/exp-cameraRGB4" ADD Sensors.ImageExportLink
"dataExport1/links/exp-cameraRGB4" SET Sensors.ImageExportLink target "Camera/D/cameraRGB4" exportBBoxes "false" label "RGB4" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/exp-cameraRGB4"
"dataExport1/links/exp-cameraRGB4" EXECUTE Sensors.ImageExportLink SetOptions "height->1024"
"dataExport1/links/exp-cameraRGB4" EXECUTE Sensors.ImageExportLink SetOptions "width->2048"
"dataExport1/links/exp-cameraRGB4" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/exp-cameraRGB4" EXECUTE Sensors.ImageExportLink SetOptions "format->jpg"
"dataExport1/links/exp-cameraRGB4" SET active true

CREATE "dataExport1/links/exp-Segmentation4"
"dataExport1/links/exp-Segmentation4" ADD Sensors.ImageExportLink
"dataExport1/links/exp-Segmentation4" SET Sensors.ImageExportLink target "Camera/D/Segmentation4" label "Segmentation4" exportBBoxes "true" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/exp-Segmentation4"
"dataExport1/links/exp-Segmentation4" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/exp-Segmentation4" EXECUTE Sensors.ImageExportLink SetOptions "width->2048"
"dataExport1/links/exp-Segmentation4" EXECUTE Sensors.ImageExportLink SetOptions "height->1024"
"dataExport1/links/exp-Segmentation4" EXECUTE Sensors.ImageExportLink SetOptions "format->png"
"dataExport1/links/exp-Segmentation4" SET active true

// ----------- EXPORT CAMERA SETUP J

CREATE "dataExport1/links/exp-cameraRGBJ"
"dataExport1/links/exp-cameraRGBJ" ADD Sensors.ImageExportLink
"dataExport1/links/exp-cameraRGBJ" SET Sensors.ImageExportLink target "CameraJumper/cameraRGBJ" exportBBoxes "false" label "RGBJ" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/exp-cameraRGBJ"
"dataExport1/links/exp-cameraRGBJ" EXECUTE Sensors.ImageExportLink SetOptions "height->1024"
"dataExport1/links/exp-cameraRGBJ" EXECUTE Sensors.ImageExportLink SetOptions "width->2048"
"dataExport1/links/exp-cameraRGBJ" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/exp-cameraRGBJ" EXECUTE Sensors.ImageExportLink SetOptions "format->jpg"
"dataExport1/links/exp-cameraRGBJ" SET active true

CREATE "dataExport1/links/exp-SegmentationJ"
"dataExport1/links/exp-SegmentationJ" ADD Sensors.ImageExportLink
"dataExport1/links/exp-SegmentationJ" SET Sensors.ImageExportLink target "CameraJumper/SegmentationJ" label "SegmentationJ" exportBBoxes "true" enabled true
"dataExport1/exporter" PUSH Sensors.DataExport imageLinks "dataExport1/links/exp-SegmentationJ"
"dataExport1/links/exp-SegmentationJ" EXECUTE Sensors.ImageExportLink SetOptions "stream_max->1"
"dataExport1/links/exp-SegmentationJ" EXECUTE Sensors.ImageExportLink SetOptions "width->2048"
"dataExport1/links/exp-SegmentationJ" EXECUTE Sensors.ImageExportLink SetOptions "height->1024"
"dataExport1/links/exp-SegmentationJ" EXECUTE Sensors.ImageExportLink SetOptions "format->png"
"dataExport1/links/exp-SegmentationJ" SET active true

// ----------- POST SETUP

"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera" "Camera/A/cameraRGB1"
"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera" "Camera/B/cameraRGB2"
"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera" "Camera/C/cameraRGB3"
"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera" "Camera/D/cameraRGB4"
"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera" "CameraJumper/cameraRGBJ"

"EnviroSky" SET active true
"World Root" SET active true

"Traffic" SET active true
"Traffic" EXECUTE FilteredAssetsPool SetContainerForType "Human" "Pedestrians"
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Human" 60
"Traffic" EXECUTE FilteredAssetsPool SetContainerForType "Bike" "Bikes"
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Bike" 25
"Traffic" EXECUTE FilteredAssetsPool SetPoolSizeForType "Car" 50

"EnviroSky" EXECUTE EnviroSky SetWeatherOverwrite 3

"Camera/A/Segmentation1" SET Camera enabled true
"Camera/B/Segmentation2" SET Camera enabled true
"Camera/C/Segmentation3" SET Camera enabled true
"Camera/D/Segmentation4" SET Camera enabled true
"CameraJumper/SegmentationJ" SET Camera enabled true

//"dataExport1" SET active true
