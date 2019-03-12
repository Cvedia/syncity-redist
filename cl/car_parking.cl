"QualitySettings" SET shadowDistance 100 shadowCascades 2 shadows 2 realtimeReflectionProbes false

CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100
"EnviroSky" SET EnviroSky GameTime.Hours 13

CREATE "Camera"
"Camera" SET Transform localPosition (0 1.5 0)
"Camera" ADD Camera UnityEngine.PostProcessing.PostProcessingBehaviour
"Camera" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX" profile.motionBlur.enabled false
"Camera" SET active true

CREATE "Camera/RGB"
"Camera/RGB" SET active false
"Camera/RGB" ADD Camera
"Camera/RGB" SET Camera tag "MainCamera" near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading" allowHDR true
"Camera/RGB" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"Camera/RGB" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeLayer 1 volumeTrigger "Camera/cameraRGB" antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 1
"Camera/RGB" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal true
"Camera/RGB" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume profile ASSET "PostProcessingProfiles/Intersection PostPro" FROM "sensors"
"Camera/RGB" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"
"Camera/RGB" ADD Syncity.ImageEffects.Antialiasing
"Camera/RGB" SET active true

"Segmentation.Profile.instance" PUSH classes "Void" "Sky" "Person" "Bicycles" "Car"
CREATE Segmentation.LookUpTable AS "lookUpTable"
"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Car->#FF0000FF"

CREATE "Camera/Segmentation"
"Camera/Segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes Segmentation.Output.ClassColors
"Camera/Segmentation" SET Segmentation.Output.ClassColors lookUpTable "lookUpTable"
"Camera/Segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Car"
"Camera/Segmentation" SET active true


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

[UI.Window] ShowFromCamera "Camera/RGB" AS "RGB" WITH 1920 1080 24 "ARGB32" "Default"
[UI.Window] ShowFromCamera "Camera/Segmentation" AS "Segmentation" WITH 1920 1080 24 "ARGB32" "Default"
[UI.Window] ShowFromCamera "Camera/Thermal" AS "Thermal" WITH 1920 1080 24 "ARGB32" "Default"

// ----------- POST SETUP

"EnviroSky" EXECUTE EnviroSky AssignAndStart "Camera" "Camera/Thermal"
"EnviroSky" SET active true

"Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler drawThermalOnly true disableProbesRendering false

"EnviroSky" SET EnviroSky cloudsMode "Flat"
"EnviroSky" EXECUTE EnviroSky SetWeatherOverwrite 3

CREATE "Grounds/4 Lanes/4 Lanes Crossing/4 Lanes Crossing" FROM "grounds" AS "Grounds"
"Grounds" SET active true

CREATE "Cars-Right"
CREATE "Cars-Left"

REGEX "Cars-.*" ADD Segmentation.Class Segmentation.Spawners.Entity
REGEX "Cars-.*" SET Segmentation.Class className "Car"
REGEX "Cars-.*" ADD RandomProps.Spawners.Area.Frustum
REGEX "Cars-.*" SET RandomProps.Spawners.Area.Frustum cam "Camera/RGB"
REGEX "Cars-.*" SET RandomProps.Spawners.Area.Frustum minDistance 4
REGEX "Cars-.*" SET RandomProps.Spawners.Area.Frustum maxDistance 55
REGEX "Cars-.*" SET RandomProps.Spawners.Area.Frustum fixedYAxis 0

"Cars-Left" SET RandomProps.Spawners.Area.Frustum fixedXAxis -6
"Cars-Right" SET RandomProps.Spawners.Area.Frustum fixedXAxis 6

REGEX "Cars-.*" ADD RandomProps.Spawners.PropArea
REGEX "Cars-.*" SET RandomProps.Spawners.PropArea tags "+car,+thermal,-car.classification=\"Truck\",-car.classification=\"Bus\",-car.classification=\"Police\",-car.classification=\"Bike\",-car.classification=\"Special Purpose Vehicle\",-car.classification=\"Motorbike\"" collisionCheck True
REGEX "Cars-.*" SET RandomProps.Spawners.PropArea numberOfProps 10

REGEX "Cars-.*" ADD TemporarySolution.WheelsTemperatureOverride
REGEX "Cars-.*" SET TemporarySolution.WheelsTemperatureOverride  ambientOffsetMode "Absolute" overridedAmbientOffset.value -3 heatinessMode "Absolute" overridedHeatiness.value 0