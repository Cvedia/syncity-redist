CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
"Segmentation.Profile.instance" PUSH classes "Void" "drone0"
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors
"cameras/segmentation" SET SegmentationCamera transparencyCutout 0
"cameras/segmentation" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Void->black" "drone0->red"
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "drone0"
"cameras/segmentation" SET active true
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1536 1152 24 "ARGB32" "Default"
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB" "cameras/cameraRGB"
"EnviroSky" SET active true
"cameras/cameraRGB" SET active true
[UI.Window] ShowFromCamera "cameras/cameraRGB" AS "cameraRGB" WITH 1536 1152 24 "ARGB32" "Default"
"cameras" SET active true
"cameras/cameraRGB" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "/tmp/" counter 1
"disk1" SET active true
"disk1" SET active false
CREATE "disk1/Cameras/camerargb"
"disk1/Cameras/camerargb" ADD Sensors.RenderTextureLink
"disk1/Cameras/camerargb" SET Sensors.RenderTextureLink target "cameraRGB"
"disk1/Cameras/camerargb" SET active true
CREATE "disk1/Cameras/segmentation"
"disk1/Cameras/segmentation" ADD Sensors.RenderTextureLink
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink target "segmentation"
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink outputType "LOSSLESS"
"disk1/Cameras/segmentation" SET active true
"disk1" SET active true
CREATE "spawner/city/ground/container"
"spawner/city/ground/container" SET active false
"spawner/city/ground/container" ADD RandomProps.Torus
"spawner/city/ground/container" ADD RandomProps.PropArea
"spawner/city/ground/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground/container" SET RandomProps.PropArea async false numberOfProps 300 collisionCheck false stickToGround false 
"spawner/city/ground/container" SET RandomProps.Torus radius 150
"spawner/city/ground/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (3 3 3)
"spawner/city/ground/container" SET active true
"spawner/city/ground" SET active true
CREATE "spawner/humans_0/container"
"spawner/humans_0/container" SET active false
"spawner/humans_0/container" ADD RandomProps.Torus
"spawner/humans_0/container" ADD RandomProps.PropArea
"spawner/humans_0/container" SET RandomProps.PropArea tags "human, +random"
"spawner/humans_0/container" SET RandomProps.PropArea async false numberOfProps 40 collisionCheck false stickToGround false 
"spawner/humans_0/container" SET RandomProps.Torus radius 30
"spawner/humans_0/container" SET RandomProps.Torus innerRadius 2
"spawner/humans_0/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/humans_0/container" SET active true
"spawner/humans_0" SET active true
CREATE "spawner/city/nature/trees/container"
"spawner/city/nature/trees/container" SET active false
"spawner/city/nature/trees/container" ADD RandomProps.Torus
"spawner/city/nature/trees/container" ADD RandomProps.PropArea
"spawner/city/nature/trees/container" SET RandomProps.PropArea tags "tree"
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 183 collisionCheck false stickToGround false 
"spawner/city/nature/trees/container" SET RandomProps.Torus radius 60
"spawner/city/nature/trees/container" SET RandomProps.Torus innerRadius 15
"spawner/city/nature/trees/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/nature/trees/container" SET active true
"spawner/city/nature/trees" SET active true
CREATE "spawner/city/buildings/container"
"spawner/city/buildings/container" SET active false
"spawner/city/buildings/container" ADD RandomProps.Torus
"spawner/city/buildings/container" ADD RandomProps.PropArea
"spawner/city/buildings/container" SET RandomProps.PropArea tags "building"
"spawner/city/buildings/container" SET RandomProps.PropArea async false numberOfProps 100 collisionCheck false stickToGround false 
"spawner/city/buildings/container" SET RandomProps.Torus radius 120
"spawner/city/buildings/container" SET RandomProps.Torus innerRadius 80
"spawner/city/buildings/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/buildings/container" SET active true
"spawner/city/buildings" SET active true
CREATE "spawner/animals/generic/container"
"spawner/animals/generic/container" SET active false
"spawner/animals/generic/container" ADD RandomProps.Torus
"spawner/animals/generic/container" ADD RandomProps.PropArea
"spawner/animals/generic/container" SET RandomProps.PropArea tags "animal"
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 29 collisionCheck false stickToGround false 
"spawner/animals/generic/container" SET RandomProps.Torus radius 50
"spawner/animals/generic/container" SET RandomProps.Torus innerRadius 5
"spawner/animals/generic/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/generic/container" SET active true
"spawner/animals/generic" SET active true
CREATE "spawner/animals/birds/container"
"spawner/animals/birds/container" SET active false
"spawner/animals/birds/container" ADD RandomProps.Torus
"spawner/animals/birds/container" ADD RandomProps.PropArea
"spawner/animals/birds/container" SET RandomProps.PropArea tags "bird"
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 60 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 68 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/birds/container" SET active true
"spawner/animals/birds" SET active true
CREATE "spawner/cars/container"
"spawner/cars/container" SET active false
"spawner/cars/container" ADD RandomProps.Torus
"spawner/cars/container" ADD RandomProps.PropArea
"spawner/cars/container" SET RandomProps.PropArea tags "car"
"spawner/cars/container" SET RandomProps.PropArea async false numberOfProps 75 collisionCheck false stickToGround false 
"spawner/cars/container" SET RandomProps.Torus radius 50
"spawner/cars/container" SET RandomProps.Torus innerRadius 5
"spawner/cars/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/cars/container" SET active true
"spawner/cars" SET active true
CREATE "spawner/roadsigns/container"
"spawner/roadsigns/container" SET active false
"spawner/roadsigns/container" ADD RandomProps.Torus
"spawner/roadsigns/container" ADD RandomProps.PropArea
"spawner/roadsigns/container" SET RandomProps.PropArea tags "roadsign"
"spawner/roadsigns/container" SET RandomProps.PropArea async false numberOfProps 250 collisionCheck false stickToGround false 
"spawner/roadsigns/container" SET RandomProps.Torus radius 80
"spawner/roadsigns/container" SET RandomProps.Torus innerRadius 15
"spawner/roadsigns/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/roadsigns/container" SET active true
"spawner/roadsigns" SET active true
CREATE ccameras/drone/drone0/drone0v "Drones/DJI_Phantom_4_Pro/DJI_Phantom_4_Pron"
"cameras/drone/drone0" ADD Segmentation.ClassGroup
"cameras/drone/drone0" SET active false
"cameras/drone/drone0" SET Segmentation.ClassGroup itemsClassName "drone0"
"cameras/drone/drone0/drone0" SET Transform position (0 1 0)
"cameras/drone/drone0" SET active true
"cameras/drone/drone0/drone0" SET active true
"cameras/drone/drone0/drone0" SET Transform localPosition (0 0 0)
CREATE ccameras/drone/drone1/drone1v "Drones/DJI_Phantom_4_Pro/DJI_Phantom_4_Pron"
"cameras/drone/drone1" ADD Segmentation.ClassGroup
"cameras/drone/drone1" SET active false
"cameras/drone/drone1" SET Segmentation.ClassGroup itemsClassName "drone0"
"cameras/drone/drone1/drone1" SET Transform position (0 1 0)
"cameras/drone/drone1" SET active true
"cameras/drone/drone1/drone1" SET active true
"cameras/drone/drone1/drone1" SET Transform localPosition (0 0 0)
"cameras/cameraRGB" SET Camera enabled true
"cameras" SET Transform position (0 5 0)
"cameras" SET Transform eulerAngles (-18.435939036332158 0 0)
"EnviroSky" EXECUTE EnviroSky ChangeWeather "Cloudy 2"
"EnviroSky" SET EnviroSky cloudsMode "Volume"
"EnviroSky" SET EnviroSky fogSettings.heightFog false
"EnviroSky" SET EnviroSky fogSettings.distanceFog false
"EnviroSky" SET EnviroSky cloudsSettings.globalCloudCoverage -0.04
"cameras/drone" SET Transform localPosition (0 0 0)
"cameras/drone" SET Transform eulerAngles (0 0 0)
"cameras/drone" SET Transform localEulerAngles (10 0 0)
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.sampleCount 1
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.settings.frameBlending 0.004
"disk1" SET Sensors.Disk counter 1
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false
"spawner/city/ground" SET active false
"spawner/city/ground" SET RandomProps.PropArea numberOfProps 0
"spawner/city/ground" SET active false
"spawner/cars" SET active false
"spawner/cars" SET RandomProps.PropArea numberOfProps 0
"spawner/cars" SET active false
"spawner/city/nature/trees" SET active false
"spawner/city/nature/trees" SET RandomProps.PropArea 0
"spawner/city/nature/trees" SET active false
"spawner/city/buildings" SET active false
"spawner/city/buildings" SET RandomProps.PropArea 0
"spawner/city/buildings" SET RandomProps.Torus innerRadius 36
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.759722706940633 0)
"cameras" SET Transform eulerAngles (15.520685603900837 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40176951373040304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2291769621031918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13821067339863694
"cameras/drone/drone0" SET Transform localPosition (-1.0530777232623942 0.1857748950775296 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18332829027877784 1.2842220982391563 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 4 20)
"cameras/drone/drone0" SET Transform localScale (0.8115884430330191 0.8115884430330191 0.8115884430330191)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -12 11)
"cameras/drone/drone1" SET Transform localScale (0.8231252175051927 0.8231252175051927 0.8231252175051927)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.798612218962711 0)
"cameras" SET Transform eulerAngles (-0.36122536922713167 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4029299890704469
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9603701427173923
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.177294276407667
"cameras/drone/drone0" SET Transform localPosition (0.5612059965615026 0.18887818707905063 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22074739380413533 1.1768975628954954 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -18 -16)
"cameras/drone/drone0" SET Transform localScale (0.860967673491984 0.860967673491984 0.860967673491984)
"cameras/drone/drone1" SET Transform localEulerAngles (6 4 16)
"cameras/drone/drone1" SET Transform localScale (1.1143150092885614 1.1143150092885614 1.1143150092885614)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.78176386295401 0)
"cameras" SET Transform eulerAngles (11.61338856301072 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7169503677522022
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1563082252057049
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15517842801850748
"cameras/drone/drone0" SET Transform localPosition (0.2612399335312239 0.3557478113353713 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.28102224630211214 1.178730916152052 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -2 13)
"cameras/drone/drone0" SET Transform localScale (0.8057387175032698 0.8057387175032698 0.8057387175032698)
"cameras/drone/drone1" SET Transform localEulerAngles (2 5 -4)
"cameras/drone/drone1" SET Transform localScale (1.1294712787011432 1.1294712787011432 1.1294712787011432)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7047888839031122 0)
"cameras" SET Transform eulerAngles (4.559996692597885 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5379220327559318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0298089952167613
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09447008714880481
"cameras/drone/drone0" SET Transform localPosition (0.02975861224231302 -0.20018371934074614 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7247780567912618 1.0200216098951833 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -13 -6)
"cameras/drone/drone0" SET Transform localScale (1.484090549820265 1.484090549820265 1.484090549820265)
"cameras/drone/drone1" SET Transform localEulerAngles (0 20 3)
"cameras/drone/drone1" SET Transform localScale (0.6569589031134432 0.6569589031134432 0.6569589031134432)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6065076391928823 0)
"cameras" SET Transform eulerAngles (0.9060816355253785 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2636638590928855
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3789071110289153
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.004088511030303055
"cameras/drone/drone0" SET Transform localPosition (-0.21264101805187718 0.4712837183698488 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.30043249455412857 0.8746746600000399 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 4 -17)
"cameras/drone/drone0" SET Transform localScale (1.278893523294495 1.278893523294495 1.278893523294495)
"cameras/drone/drone1" SET Transform localEulerAngles (7 9 -2)
"cameras/drone/drone1" SET Transform localScale (0.9731903235136427 0.9731903235136427 0.9731903235136427)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.621116340015245 0)
"cameras" SET Transform eulerAngles (-19.612671959883144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.220103787648791
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9559716630454522
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23771142153746583
"cameras/drone/drone0" SET Transform localPosition (-0.22000686663120894 0.15749592059511758 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.044971679833494704 1.1478643857807511 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 2 -10)
"cameras/drone/drone0" SET Transform localScale (1.2498918068374776 1.2498918068374776 1.2498918068374776)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -5 18)
"cameras/drone/drone1" SET Transform localScale (1.0531657274509776 1.0531657274509776 1.0531657274509776)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.121202875344177 0)
"cameras" SET Transform eulerAngles (2.875661133415008 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8552300617476286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9172319169784
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3708516765155223
"cameras/drone/drone0" SET Transform localPosition (-0.6933893157495006 -0.24148840973033153 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2954681118383913 1.0828255733614596 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 12 3)
"cameras/drone/drone0" SET Transform localScale (0.920543884174889 0.920543884174889 0.920543884174889)
"cameras/drone/drone1" SET Transform localEulerAngles (2 17 -16)
"cameras/drone/drone1" SET Transform localScale (1.2390822204221588 1.2390822204221588 1.2390822204221588)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.458746281012397 0)
"cameras" SET Transform eulerAngles (-16.837750692413525 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3217297611206074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1487711539362042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14947299413547133
"cameras/drone/drone0" SET Transform localPosition (1.0092299846264134 -0.14277290626351474 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.30259085912306916 0.9284827313588413 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -7 15)
"cameras/drone/drone0" SET Transform localScale (0.7117221161897805 0.7117221161897805 0.7117221161897805)
"cameras/drone/drone1" SET Transform localEulerAngles (15 16 15)
"cameras/drone/drone1" SET Transform localScale (1.0223896482188244 1.0223896482188244 1.0223896482188244)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.394409861754748 0)
"cameras" SET Transform eulerAngles (-18.110184576805214 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4357684032252593
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0994174124825113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2428754481213935
"cameras/drone/drone0" SET Transform localPosition (-1.1260645688207782 0.6483366272866333 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17880414890792728 0.8847964687905578 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -8 1)
"cameras/drone/drone0" SET Transform localScale (0.8754538155070817 0.8754538155070817 0.8754538155070817)
"cameras/drone/drone1" SET Transform localEulerAngles (3 17 -1)
"cameras/drone/drone1" SET Transform localScale (1.2972686245028175 1.2972686245028175 1.2972686245028175)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.414874324079335 0)
"cameras" SET Transform eulerAngles (-9.885336594002014 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7670448117702445
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4388029647365692
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29057588258959627
"cameras/drone/drone0" SET Transform localPosition (-0.5857360493945325 0.5759329262273061 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.43587542749053665 1.0143437049526902 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -8 -20)
"cameras/drone/drone0" SET Transform localScale (1.485676278548938 1.485676278548938 1.485676278548938)
"cameras/drone/drone1" SET Transform localEulerAngles (1 13 19)
"cameras/drone/drone1" SET Transform localScale (1.2470247379548918 1.2470247379548918 1.2470247379548918)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9474543670987496 0)
"cameras" SET Transform eulerAngles (14.951746293552603 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.531622022068392
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4623576621171748
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10289005577069409
"cameras/drone/drone0" SET Transform localPosition (0.7672617515106694 0.6909149491135442 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37602242426628874 1.0858589574429236 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 15 -11)
"cameras/drone/drone0" SET Transform localScale (0.7923380796166858 0.7923380796166858 0.7923380796166858)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -20 9)
"cameras/drone/drone1" SET Transform localScale (1.2289936495805145 1.2289936495805145 1.2289936495805145)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.257639464918756 0)
"cameras" SET Transform eulerAngles (-10.292646939353585 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0702807141723947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0245234343759793
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05696209000459738
"cameras/drone/drone0" SET Transform localPosition (-0.5931678560651964 0.22801467825485305 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08141197648589382 1.0946253008238864 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -5 10)
"cameras/drone/drone0" SET Transform localScale (0.7247568225774284 0.7247568225774284 0.7247568225774284)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -9 16)
"cameras/drone/drone1" SET Transform localScale (1.1697968996459607 1.1697968996459607 1.1697968996459607)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.413561129036177 0)
"cameras" SET Transform eulerAngles (-13.656496569023432 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1251044354324042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6812653661710146
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3824629409232115
"cameras/drone/drone0" SET Transform localPosition (-0.5613815405036767 0.32547613638654466 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0296988403503862 1.28409121413573 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -5 -15)
"cameras/drone/drone0" SET Transform localScale (0.8194410217909001 0.8194410217909001 0.8194410217909001)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -7 18)
"cameras/drone/drone1" SET Transform localScale (0.6276361812632874 0.6276361812632874 0.6276361812632874)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.89175315045152 0)
"cameras" SET Transform eulerAngles (-0.0582408490446511 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0775873057713699
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7351664664796935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35500871366109327
"cameras/drone/drone0" SET Transform localPosition (-0.5177055484746708 -0.10036408187372275 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.43433018381764177 1.0927908982423458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 16 -12)
"cameras/drone/drone0" SET Transform localScale (0.9755045496989136 0.9755045496989136 0.9755045496989136)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 15 -14)
"cameras/drone/drone1" SET Transform localScale (0.6460738705860926 0.6460738705860926 0.6460738705860926)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2572407712162277 0)
"cameras" SET Transform eulerAngles (-5.287041686185967 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9074842845947755
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1587839453574287
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.052223207519976805
"cameras/drone/drone0" SET Transform localPosition (-0.9846192099805707 -0.29292496356621683 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17802962642430464 1.2123997173759367 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -17 14)
"cameras/drone/drone0" SET Transform localScale (0.754373531629377 0.754373531629377 0.754373531629377)
"cameras/drone/drone1" SET Transform localEulerAngles (1 12 11)
"cameras/drone/drone1" SET Transform localScale (0.6593781510377282 0.6593781510377282 0.6593781510377282)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.104572437250079 0)
"cameras" SET Transform eulerAngles (7.640107812430713 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.073721677353403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7257528080757576
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07858499083046772
"cameras/drone/drone0" SET Transform localPosition (-0.8622793142386009 0.19870074524280573 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0009355604024506 1.1552863132804276 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -15 3)
"cameras/drone/drone0" SET Transform localScale (0.888589220786228 0.888589220786228 0.888589220786228)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -9 -18)
"cameras/drone/drone1" SET Transform localScale (0.7406554851458088 0.7406554851458088 0.7406554851458088)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.850098836159203 0)
"cameras" SET Transform eulerAngles (-15.359057841487761 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0543209451598707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5779824614479399
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24839656119708403
"cameras/drone/drone0" SET Transform localPosition (0.9682179281193741 -0.29716488801538893 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6080657976615292 1.095174143461753 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 11 19)
"cameras/drone/drone0" SET Transform localScale (1.1712052478381985 1.1712052478381985 1.1712052478381985)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -12 -2)
"cameras/drone/drone1" SET Transform localScale (1.1474026049493415 1.1474026049493415 1.1474026049493415)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.423862701009232 0)
"cameras" SET Transform eulerAngles (4.238381063112591 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5849089182423541
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9460461491927582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10189793810469645
"cameras/drone/drone0" SET Transform localPosition (0.26076151556139937 0.11608700234137898 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.38622045814527817 0.9977658493642292 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 13 -1)
"cameras/drone/drone0" SET Transform localScale (0.9095206716579813 0.9095206716579813 0.9095206716579813)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -2 -1)
"cameras/drone/drone1" SET Transform localScale (1.3226469110949677 1.3226469110949677 1.3226469110949677)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7198346714378046 0)
"cameras" SET Transform eulerAngles (7.441346228736755 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8216136998287329
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9699876094041918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3046521400430233
"cameras/drone/drone0" SET Transform localPosition (0.03887251095640454 0.5581877271806495 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5261138320512833 0.8507692779166338 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 2 18)
"cameras/drone/drone0" SET Transform localScale (0.8314991026784936 0.8314991026784936 0.8314991026784936)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 2 -4)
"cameras/drone/drone1" SET Transform localScale (1.1304688820941562 1.1304688820941562 1.1304688820941562)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9377268265182783 0)
"cameras" SET Transform eulerAngles (16.968229217314956 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8304855072563276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2829597213020847
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16163042922423926
"cameras/drone/drone0" SET Transform localPosition (-0.05827289824120552 0.30139510100399663 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7948866288120919 1.2892201329324449 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -8 -17)
"cameras/drone/drone0" SET Transform localScale (1.319791826022065 1.319791826022065 1.319791826022065)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -5 16)
"cameras/drone/drone1" SET Transform localScale (1.0808241658149118 1.0808241658149118 1.0808241658149118)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.833303629216298 0)
"cameras" SET Transform eulerAngles (4.592429483416684 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5025262057282108
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0733237496949044
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15308841772767573
"cameras/drone/drone0" SET Transform localPosition (-0.7023322769709128 0.18237772343918496 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3337972996130928 1.0110114461119541 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -19 7)
"cameras/drone/drone0" SET Transform localScale (1.1178938752590422 1.1178938752590422 1.1178938752590422)
"cameras/drone/drone1" SET Transform localEulerAngles (15 5 -12)
"cameras/drone/drone1" SET Transform localScale (1.4925986889395908 1.4925986889395908 1.4925986889395908)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.265596764852697 0)
"cameras" SET Transform eulerAngles (7.40782237290286 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0340046618653753
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3287562405169593
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08350952207293463
"cameras/drone/drone0" SET Transform localPosition (-1.1609647237088805 -0.29765001151957066 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4742351129242569 0.9624363915325842 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -14 -7)
"cameras/drone/drone0" SET Transform localScale (0.9796704631681488 0.9796704631681488 0.9796704631681488)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -15 -10)
"cameras/drone/drone1" SET Transform localScale (1.169624454689587 1.169624454689587 1.169624454689587)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3596655869390926 0)
"cameras" SET Transform eulerAngles (10.382460190948613 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43650689364327355
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.928083871863838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20984247738693554
"cameras/drone/drone0" SET Transform localPosition (0.8174008356398812 -0.06136314677980376 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5619984390462798 1.0004884536391159 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 2 -19)
"cameras/drone/drone0" SET Transform localScale (0.7204764151500376 0.7204764151500376 0.7204764151500376)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -11 -20)
"cameras/drone/drone1" SET Transform localScale (0.8453413753885296 0.8453413753885296 0.8453413753885296)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.539512782903262 0)
"cameras" SET Transform eulerAngles (10.400575329453702 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5611123399490046
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.326427927007353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.366875182875187
"cameras/drone/drone0" SET Transform localPosition (0.8483359090056559 0.3443685137524937 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5748456981419294 1.1019044550808506 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 9 -15)
"cameras/drone/drone0" SET Transform localScale (0.942889519202198 0.942889519202198 0.942889519202198)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -17 3)
"cameras/drone/drone1" SET Transform localScale (1.1081902271928707 1.1081902271928707 1.1081902271928707)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8980532563167696 0)
"cameras" SET Transform eulerAngles (-7.229724162061277 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.432310806766329
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6037779962694094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19287009426091506
"cameras/drone/drone0" SET Transform localPosition (-1.069633911667752 -0.2511126142857995 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0692798003799389 1.0816087161068557 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 17 12)
"cameras/drone/drone0" SET Transform localScale (0.9610869929655896 0.9610869929655896 0.9610869929655896)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -13 14)
"cameras/drone/drone1" SET Transform localScale (1.4433939505622462 1.4433939505622462 1.4433939505622462)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6203434557480465 0)
"cameras" SET Transform eulerAngles (3.229606215731863 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4904264310570658
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.701446325400512
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27292015668757913
"cameras/drone/drone0" SET Transform localPosition (-0.9607282121822616 -0.21816773603795642 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9970929866569778 1.1515468231469987 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 0 -7)
"cameras/drone/drone0" SET Transform localScale (1.4061673661367582 1.4061673661367582 1.4061673661367582)
"cameras/drone/drone1" SET Transform localEulerAngles (12 9 10)
"cameras/drone/drone1" SET Transform localScale (1.1453528358283878 1.1453528358283878 1.1453528358283878)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.08322396405251 0)
"cameras" SET Transform eulerAngles (-17.981237593060335 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0015324987013217
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4491181971780245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37815337696245055
"cameras/drone/drone0" SET Transform localPosition (0.5862632448968559 0.5987000156515359 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5187558452308394 0.868854954133618 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 7 -8)
"cameras/drone/drone0" SET Transform localScale (1.4111319879918156 1.4111319879918156 1.4111319879918156)
"cameras/drone/drone1" SET Transform localEulerAngles (20 17 8)
"cameras/drone/drone1" SET Transform localScale (0.6347433507141603 0.6347433507141603 0.6347433507141603)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.403506530703888 0)
"cameras" SET Transform eulerAngles (7.717251270653897 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6305732507732014
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8312685442746655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3073114993180713
"cameras/drone/drone0" SET Transform localPosition (0.37494228954980136 0.6796908632770322 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7906146434472532 1.2454400258856926 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 5 -3)
"cameras/drone/drone0" SET Transform localScale (1.0607776174861125 1.0607776174861125 1.0607776174861125)
"cameras/drone/drone1" SET Transform localEulerAngles (1 13 17)
"cameras/drone/drone1" SET Transform localScale (0.6753392186336877 0.6753392186336877 0.6753392186336877)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.646569863406473 0)
"cameras" SET Transform eulerAngles (10.700570461593529 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4365486210237686
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8355231147653446
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10672035287853712
"cameras/drone/drone0" SET Transform localPosition (-0.614100253415598 0.272819331549428 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1283758033662403 1.0853373663981427 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 17 -8)
"cameras/drone/drone0" SET Transform localScale (0.7403617405541852 0.7403617405541852 0.7403617405541852)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -13 -6)
"cameras/drone/drone1" SET Transform localScale (1.14849061078934 1.14849061078934 1.14849061078934)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8239479725344516 0)
"cameras" SET Transform eulerAngles (6.869669347532593 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.469496694432302
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4775946938705884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3977275470440668
"cameras/drone/drone0" SET Transform localPosition (0.6606722291391318 0.5586917884093281 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7704208458332653 1.018853593129669 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 20 -10)
"cameras/drone/drone0" SET Transform localScale (1.0986971150319955 1.0986971150319955 1.0986971150319955)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 11 2)
"cameras/drone/drone1" SET Transform localScale (1.248670313303955 1.248670313303955 1.248670313303955)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.543865248609264 0)
"cameras" SET Transform eulerAngles (-14.565998388944799 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9362014849004322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0875912761606852
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3693326869894509
"cameras/drone/drone0" SET Transform localPosition (0.07640935795956283 0.5122698497098128 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0048956539203517 0.9042523126053679 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -1 -14)
"cameras/drone/drone0" SET Transform localScale (1.469663411664129 1.469663411664129 1.469663411664129)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 10 -16)
"cameras/drone/drone1" SET Transform localScale (1.199828422551915 1.199828422551915 1.199828422551915)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8383393506271037 0)
"cameras" SET Transform eulerAngles (12.282727781055115 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0530047219470005
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.998802491602806
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1350566773750649
"cameras/drone/drone0" SET Transform localPosition (0.6974096543370929 0.4050685565406697 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.048054220570884 1.137455073393017 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -17 19)
"cameras/drone/drone0" SET Transform localScale (1.0312153144958305 1.0312153144958305 1.0312153144958305)
"cameras/drone/drone1" SET Transform localEulerAngles (7 0 -17)
"cameras/drone/drone1" SET Transform localScale (1.0508781277965344 1.0508781277965344 1.0508781277965344)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.824167809794034 0)
"cameras" SET Transform eulerAngles (-9.953851713656544 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5468970917580412
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9097363789772683
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2874297538781398
"cameras/drone/drone0" SET Transform localPosition (0.8281309150052512 0.5167330936899328 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1130429577428413 1.1688846422841714 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -13 13)
"cameras/drone/drone0" SET Transform localScale (0.9056207939371714 0.9056207939371714 0.9056207939371714)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 19 9)
"cameras/drone/drone1" SET Transform localScale (1.313311699986901 1.313311699986901 1.313311699986901)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.375222933401279 0)
"cameras" SET Transform eulerAngles (-18.046377982781014 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1091843363175706
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.962375668134123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32827331098548673
"cameras/drone/drone0" SET Transform localPosition (0.6171113118738101 0.5342891122737727 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1495663055130592 1.0649956069437467 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 16 9)
"cameras/drone/drone0" SET Transform localScale (0.8825406337227477 0.8825406337227477 0.8825406337227477)
"cameras/drone/drone1" SET Transform localEulerAngles (12 18 -20)
"cameras/drone/drone1" SET Transform localScale (0.6203171693762224 0.6203171693762224 0.6203171693762224)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4548432443052297 0)
"cameras" SET Transform eulerAngles (3.2099407953303114 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6775279339634679
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6609788733851825
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2124000744836878
"cameras/drone/drone0" SET Transform localPosition (1.0408861983393238 -0.03352401267105559 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10586094979421645 0.9874953576519406 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -10 -9)
"cameras/drone/drone0" SET Transform localScale (1.3964793234461088 1.3964793234461088 1.3964793234461088)
"cameras/drone/drone1" SET Transform localEulerAngles (12 3 19)
"cameras/drone/drone1" SET Transform localScale (0.7583574089054563 0.7583574089054563 0.7583574089054563)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.302399018514822 0)
"cameras" SET Transform eulerAngles (-8.959539959691059 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5210968967499583
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0472877939531318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13097820897675794
"cameras/drone/drone0" SET Transform localPosition (0.6063966678513792 0.3768148206708209 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.013359847513103373 0.9134873312896861 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 17 9)
"cameras/drone/drone0" SET Transform localScale (1.247187129432365 1.247187129432365 1.247187129432365)
"cameras/drone/drone1" SET Transform localEulerAngles (13 16 -13)
"cameras/drone/drone1" SET Transform localScale (1.1147380424849342 1.1147380424849342 1.1147380424849342)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.523466215138798 0)
"cameras" SET Transform eulerAngles (1.2493122008869548 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2525359625397248
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6388361093853105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16887048755897138
"cameras/drone/drone0" SET Transform localPosition (0.08821682459820646 0.3684751003563885 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6269542330878468 1.087048256017334 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 16 20)
"cameras/drone/drone0" SET Transform localScale (1.3657773167002234 1.3657773167002234 1.3657773167002234)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -10 8)
"cameras/drone/drone1" SET Transform localScale (1.2706477810432775 1.2706477810432775 1.2706477810432775)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.302062786007786 0)
"cameras" SET Transform eulerAngles (15.109151197793203 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.545545837466805
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5061432381406894
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.059583465416454255
"cameras/drone/drone0" SET Transform localPosition (-0.4784224846003099 0.6985544938130217 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1363473051024104 1.2527186916127944 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -15 5)
"cameras/drone/drone0" SET Transform localScale (0.9556577074770392 0.9556577074770392 0.9556577074770392)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -14 9)
"cameras/drone/drone1" SET Transform localScale (0.9385731573614964 0.9385731573614964 0.9385731573614964)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.771777861252234 0)
"cameras" SET Transform eulerAngles (-2.2615738432576435 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0435864353000806
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.11912426514245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30504334125902055
"cameras/drone/drone0" SET Transform localPosition (-0.3488976960502874 0.5478764152795161 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7252814648059027 0.9514399619157061 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 14 15)
"cameras/drone/drone0" SET Transform localScale (1.1142323931576033 1.1142323931576033 1.1142323931576033)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -15 15)
"cameras/drone/drone1" SET Transform localScale (1.3918513007258673 1.3918513007258673 1.3918513007258673)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.73128901448269 0)
"cameras" SET Transform eulerAngles (15.976972301655707 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1074694977403696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2791562101045066
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2586710726209544
"cameras/drone/drone0" SET Transform localPosition (-0.24066004887640635 -0.22123118844979278 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8692969858944504 0.9254843225693001 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 3 15)
"cameras/drone/drone0" SET Transform localScale (1.1016483070794327 1.1016483070794327 1.1016483070794327)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -10 1)
"cameras/drone/drone1" SET Transform localScale (1.2127011582929312 1.2127011582929312 1.2127011582929312)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.302336998063129 0)
"cameras" SET Transform eulerAngles (3.2821237234276452 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1575390504251968
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3171290101952093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.199083012815209
"cameras/drone/drone0" SET Transform localPosition (0.1188212221737095 0.4591015056205316 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6320323525392795 0.9455418057127973 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -13 -7)
"cameras/drone/drone0" SET Transform localScale (0.7813301476974535 0.7813301476974535 0.7813301476974535)
"cameras/drone/drone1" SET Transform localEulerAngles (6 9 15)
"cameras/drone/drone1" SET Transform localScale (0.8645117584767497 0.8645117584767497 0.8645117584767497)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6455068431764994 0)
"cameras" SET Transform eulerAngles (-10.01208947452978 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9129224626736683
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1593714113210587
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19189173665162784
"cameras/drone/drone0" SET Transform localPosition (0.7297180042032592 -0.09501240961605445 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6711821918544888 0.9776785026996458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 11 13)
"cameras/drone/drone0" SET Transform localScale (1.3309549704428052 1.3309549704428052 1.3309549704428052)
"cameras/drone/drone1" SET Transform localEulerAngles (6 9 17)
"cameras/drone/drone1" SET Transform localScale (1.2225151530375813 1.2225151530375813 1.2225151530375813)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1096559632510035 0)
"cameras" SET Transform eulerAngles (3.531935019513739 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4385974516367908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6328001949915643
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15224410280924086
"cameras/drone/drone0" SET Transform localPosition (-0.3883165137921175 0.31722476916415493 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.20931481076054603 1.1079701386592253 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -5 -7)
"cameras/drone/drone0" SET Transform localScale (1.2770546825128626 1.2770546825128626 1.2770546825128626)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 3 -17)
"cameras/drone/drone1" SET Transform localScale (1.0028631100366574 1.0028631100366574 1.0028631100366574)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.360956608097667 0)
"cameras" SET Transform eulerAngles (-3.5051974806857444 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.378666535912584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7903806502955237
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3177735596980811
"cameras/drone/drone0" SET Transform localPosition (-0.2865362568527785 0.26879328878348946 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1468712241265453 0.8098946575821688 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 11 4)
"cameras/drone/drone0" SET Transform localScale (1.409330914498385 1.409330914498385 1.409330914498385)
"cameras/drone/drone1" SET Transform localEulerAngles (11 4 -15)
"cameras/drone/drone1" SET Transform localScale (0.7072141215656739 0.7072141215656739 0.7072141215656739)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.890543415356857 0)
"cameras" SET Transform eulerAngles (17.173233441557898 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.228350213636117
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2699257857163109
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3133861624054719
"cameras/drone/drone0" SET Transform localPosition (0.7887927872363458 0.04086707918551796 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.42937334358528345 1.0149037198901725 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 18 1)
"cameras/drone/drone0" SET Transform localScale (0.675077040386725 0.675077040386725 0.675077040386725)
"cameras/drone/drone1" SET Transform localEulerAngles (15 5 -12)
"cameras/drone/drone1" SET Transform localScale (1.0670491730514007 1.0670491730514007 1.0670491730514007)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.714022149454795 0)
"cameras" SET Transform eulerAngles (13.12413595239213 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9926290491401614
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6363444595835723
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2581228790785832
"cameras/drone/drone0" SET Transform localPosition (-0.730622561746109 -0.10170753256307646 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9854281152152706 0.9594038272452854 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -14 -12)
"cameras/drone/drone0" SET Transform localScale (0.7002237020122941 0.7002237020122941 0.7002237020122941)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -11 8)
"cameras/drone/drone1" SET Transform localScale (0.6835465326407629 0.6835465326407629 0.6835465326407629)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.864410573644167 0)
"cameras" SET Transform eulerAngles (13.278123258943467 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8754864253514679
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0795209422842764
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06685500715057922
"cameras/drone/drone0" SET Transform localPosition (0.09903530366200841 0.4930250713911703 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06231648137564472 1.0432355349924716 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -3 18)
"cameras/drone/drone0" SET Transform localScale (1.0287763508426413 1.0287763508426413 1.0287763508426413)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 19 -2)
"cameras/drone/drone1" SET Transform localScale (0.6361663453277409 0.6361663453277409 0.6361663453277409)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.305272062463283 0)
"cameras" SET Transform eulerAngles (11.52054533622588 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2459500860215436
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9550935533832756
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24536063432746388
"cameras/drone/drone0" SET Transform localPosition (-0.06530145622641159 0.16998957437609102 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32862777691469613 1.0538675024077462 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -19 -4)
"cameras/drone/drone0" SET Transform localScale (1.0400252793226321 1.0400252793226321 1.0400252793226321)
"cameras/drone/drone1" SET Transform localEulerAngles (4 12 17)
"cameras/drone/drone1" SET Transform localScale (1.1001031898050626 1.1001031898050626 1.1001031898050626)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.112196851620004 0)
"cameras" SET Transform eulerAngles (16.03447229982993 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4908547684305935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3140261055071623
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3345251552081076
"cameras/drone/drone0" SET Transform localPosition (-0.3805194932980568 0.3300808956413775 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1638009797514097 0.8554221455149638 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -13 -15)
"cameras/drone/drone0" SET Transform localScale (1.2157476521651143 1.2157476521651143 1.2157476521651143)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 18 -16)
"cameras/drone/drone1" SET Transform localScale (0.6343141360093754 0.6343141360093754 0.6343141360093754)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.461256112291326 0)
"cameras" SET Transform eulerAngles (0.9828575309681185 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.487957458490098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3708948464248507
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3225708478199871
"cameras/drone/drone0" SET Transform localPosition (0.30910506371315427 -0.11538246249340883 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.40476655907376535 1.0261029065670262 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -15 -20)
"cameras/drone/drone0" SET Transform localScale (1.003862458479222 1.003862458479222 1.003862458479222)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -12 19)
"cameras/drone/drone1" SET Transform localScale (1.263397443345505 1.263397443345505 1.263397443345505)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.919654582194688 0)
"cameras" SET Transform eulerAngles (-1.4552488171629285 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1724044941218084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.340969023195137
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06713505111793734
"cameras/drone/drone0" SET Transform localPosition (-0.7233184276682944 0.03145278754642117 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8194746029679736 0.9847661640190787 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 10 8)
"cameras/drone/drone0" SET Transform localScale (1.4631619517150174 1.4631619517150174 1.4631619517150174)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -18 11)
"cameras/drone/drone1" SET Transform localScale (1.0276057492399773 1.0276057492399773 1.0276057492399773)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.571353385772131 0)
"cameras" SET Transform eulerAngles (8.948748838725965 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4228321679967721
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5617001090710736
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3956101282838012
"cameras/drone/drone0" SET Transform localPosition (-0.4875139128691083 0.22179860413648794 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9718904462723938 1.1152193028146598 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 10 -15)
"cameras/drone/drone0" SET Transform localScale (0.789596866858077 0.789596866858077 0.789596866858077)
"cameras/drone/drone1" SET Transform localEulerAngles (4 3 -15)
"cameras/drone/drone1" SET Transform localScale (1.1060639643622139 1.1060639643622139 1.1060639643622139)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9325562365260156 0)
"cameras" SET Transform eulerAngles (-18.20588356174881 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8103798189790186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3801331871136573
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10221555823108211
"cameras/drone/drone0" SET Transform localPosition (-0.7503909318188018 0.12714456739264773 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.27036413109675816 1.1901547570475595 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 16 -18)
"cameras/drone/drone0" SET Transform localScale (0.7459704134845174 0.7459704134845174 0.7459704134845174)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -18 8)
"cameras/drone/drone1" SET Transform localScale (1.1895393789825797 1.1895393789825797 1.1895393789825797)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8077067280488635 0)
"cameras" SET Transform eulerAngles (0.17586219238005185 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.127234515541073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0719431988660366
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08417044933098561
"cameras/drone/drone0" SET Transform localPosition (-0.6540334781353718 0.6294719787753189 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9096288981050609 1.2942755969089876 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -10 13)
"cameras/drone/drone0" SET Transform localScale (1.1879078198503636 1.1879078198503636 1.1879078198503636)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -20 -15)
"cameras/drone/drone1" SET Transform localScale (1.2393992262939655 1.2393992262939655 1.2393992262939655)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.615840604255693 0)
"cameras" SET Transform eulerAngles (-4.84955312166797 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9131887867086443
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1575917439827772
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.291008492984856
"cameras/drone/drone0" SET Transform localPosition (-0.33393139605787925 -0.025841677516451667 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4322511369290617 1.0303018414354361 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -1 -4)
"cameras/drone/drone0" SET Transform localScale (1.371422111521505 1.371422111521505 1.371422111521505)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -9 -20)
"cameras/drone/drone1" SET Transform localScale (1.2755450715488839 1.2755450715488839 1.2755450715488839)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.591051945322223 0)
"cameras" SET Transform eulerAngles (-0.19847432591394565 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7158160382866038
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.023917794689828
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28393331867983534
"cameras/drone/drone0" SET Transform localPosition (-0.42147235129123173 -0.23151595094785488 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22873641440605952 1.2491707823140379 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -10 1)
"cameras/drone/drone0" SET Transform localScale (0.7678303830189067 0.7678303830189067 0.7678303830189067)
"cameras/drone/drone1" SET Transform localEulerAngles (17 7 -20)
"cameras/drone/drone1" SET Transform localScale (0.6483184915521247 0.6483184915521247 0.6483184915521247)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3167895336131874 0)
"cameras" SET Transform eulerAngles (8.94339492330165 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7460009669662957
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.20953362385618
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05229058863745975
"cameras/drone/drone0" SET Transform localPosition (-1.047439974498652 0.057313744388310994 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.23443520330180456 1.2828312271939146 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 0 20)
"cameras/drone/drone0" SET Transform localScale (1.3770088373093488 1.3770088373093488 1.3770088373093488)
"cameras/drone/drone1" SET Transform localEulerAngles (8 7 -5)
"cameras/drone/drone1" SET Transform localScale (1.1602462015311064 1.1602462015311064 1.1602462015311064)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.452787857979887 0)
"cameras" SET Transform eulerAngles (-11.757662896706345 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1502145289223513
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0693894182747887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34820685282908664
"cameras/drone/drone0" SET Transform localPosition (-0.2606116873517188 0.5134824956493786 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5766993362370548 1.009883215592984 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -14 2)
"cameras/drone/drone0" SET Transform localScale (1.4425213089359556 1.4425213089359556 1.4425213089359556)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -9 -20)
"cameras/drone/drone1" SET Transform localScale (0.9087644903419626 0.9087644903419626 0.9087644903419626)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.460069676645752 0)
"cameras" SET Transform eulerAngles (0.9855725910326285 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4158194693218791
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0115613557426912
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1506461104288231
"cameras/drone/drone0" SET Transform localPosition (0.12293722175071586 -0.23161699874295366 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9074127598461177 1.0574534989260447 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -13 -12)
"cameras/drone/drone0" SET Transform localScale (0.8483849048763585 0.8483849048763585 0.8483849048763585)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 16 3)
"cameras/drone/drone1" SET Transform localScale (1.1516171262419421 1.1516171262419421 1.1516171262419421)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.78833819777887 0)
"cameras" SET Transform eulerAngles (-19.13851018140535 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6937184658352367
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7268144326149106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16471543723039894
"cameras/drone/drone0" SET Transform localPosition (-1.0357142251661717 -0.2302098065926353 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9645847104847269 0.88210434838441 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -19 10)
"cameras/drone/drone0" SET Transform localScale (0.7917274563744171 0.7917274563744171 0.7917274563744171)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -17 -13)
"cameras/drone/drone1" SET Transform localScale (1.2289261367473747 1.2289261367473747 1.2289261367473747)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.718472286145064 0)
"cameras" SET Transform eulerAngles (-15.19121744281286 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.09740998535925
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9097582900345743
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20771555038236264
"cameras/drone/drone0" SET Transform localPosition (-0.9631704645214563 -0.2801280065484045 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9315485445349426 0.8532650252125595 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 10 18)
"cameras/drone/drone0" SET Transform localScale (1.0503909786249515 1.0503909786249515 1.0503909786249515)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -9 -9)
"cameras/drone/drone1" SET Transform localScale (1.2238624789996666 1.2238624789996666 1.2238624789996666)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9906596815900954 0)
"cameras" SET Transform eulerAngles (13.966079091114267 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6528839818057477
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9188634665534416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22338697332847787
"cameras/drone/drone0" SET Transform localPosition (-0.004706232434338098 -0.1411948676598595 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5762851711522237 1.0540766511697046 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -2 11)
"cameras/drone/drone0" SET Transform localScale (1.0272855728264114 1.0272855728264114 1.0272855728264114)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 1 3)
"cameras/drone/drone1" SET Transform localScale (0.8425039129063143 0.8425039129063143 0.8425039129063143)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0782543454138134 0)
"cameras" SET Transform eulerAngles (18.411389918985392 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9781224998560897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2211101416640806
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2411867140452018
"cameras/drone/drone0" SET Transform localPosition (0.1726753774493801 -0.0568063698097237 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8835993885151681 1.0513679783588776 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 8 9)
"cameras/drone/drone0" SET Transform localScale (1.4223958409205093 1.4223958409205093 1.4223958409205093)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 13 20)
"cameras/drone/drone1" SET Transform localScale (1.1115678932240756 1.1115678932240756 1.1115678932240756)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2122492732263455 0)
"cameras" SET Transform eulerAngles (-11.099449612330922 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6743580491856098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7631723292035546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2080434069987577
"cameras/drone/drone0" SET Transform localPosition (-0.537288614962624 -0.11124730305494995 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0892186558216579 0.8509638220959863 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 1 -10)
"cameras/drone/drone0" SET Transform localScale (0.6230728135402435 0.6230728135402435 0.6230728135402435)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -15 -10)
"cameras/drone/drone1" SET Transform localScale (1.089356543996306 1.089356543996306 1.089356543996306)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.180069335768664 0)
"cameras" SET Transform eulerAngles (17.537991905858348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5643312965757548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9880733225914593
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19170465956666868
"cameras/drone/drone0" SET Transform localPosition (-1.0592588217645054 0.1132526324299879 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0094381899097786 0.8873178360465157 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 11 17)
"cameras/drone/drone0" SET Transform localScale (1.309458317280297 1.309458317280297 1.309458317280297)
"cameras/drone/drone1" SET Transform localEulerAngles (3 10 -8)
"cameras/drone/drone1" SET Transform localScale (0.7700159687710343 0.7700159687710343 0.7700159687710343)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.628325974810979 0)
"cameras" SET Transform eulerAngles (4.148747194826594 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7843879862347052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4379765472262243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1210455286996342
"cameras/drone/drone0" SET Transform localPosition (-0.3397269860105968 0.4424050750218293 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5102836915624952 0.9428002462904179 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -18 -1)
"cameras/drone/drone0" SET Transform localScale (1.277653098441196 1.277653098441196 1.277653098441196)
"cameras/drone/drone1" SET Transform localEulerAngles (9 15 -6)
"cameras/drone/drone1" SET Transform localScale (0.9914973324456076 0.9914973324456076 0.9914973324456076)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.953234624992148 0)
"cameras" SET Transform eulerAngles (14.448035399140345 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0994464408595972
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9747066384141853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10640441488543768
"cameras/drone/drone0" SET Transform localPosition (-0.06125885321090507 0.5095740423823183 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.650707590138184 1.2957864750257526 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -8 8)
"cameras/drone/drone0" SET Transform localScale (0.7732639704806799 0.7732639704806799 0.7732639704806799)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -15 -20)
"cameras/drone/drone1" SET Transform localScale (1.0948358457693814 1.0948358457693814 1.0948358457693814)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2677498005154284 0)
"cameras" SET Transform eulerAngles (-8.763895825343031 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44382636025351146
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7489178874926985
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2569671346034493
"cameras/drone/drone0" SET Transform localPosition (-1.1390896235179133 0.5820243350578402 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8526858637583192 1.1210789956938045 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -1 -17)
"cameras/drone/drone0" SET Transform localScale (1.2459579350693906 1.2459579350693906 1.2459579350693906)
"cameras/drone/drone1" SET Transform localEulerAngles (1 15 15)
"cameras/drone/drone1" SET Transform localScale (0.6319466106412441 0.6319466106412441 0.6319466106412441)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.166654028870643 0)
"cameras" SET Transform eulerAngles (-8.046661855773895 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0596862778709633
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.940635104448826
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2667968080385144
"cameras/drone/drone0" SET Transform localPosition (-1.1886506977337494 0.2045248625215193 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8645941784315172 1.0913241551959725 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 12 5)
"cameras/drone/drone0" SET Transform localScale (0.9308355934401509 0.9308355934401509 0.9308355934401509)
"cameras/drone/drone1" SET Transform localEulerAngles (16 9 -11)
"cameras/drone/drone1" SET Transform localScale (0.7367515820164857 0.7367515820164857 0.7367515820164857)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.810278483651422 0)
"cameras" SET Transform eulerAngles (-14.486300414028115 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0345811360727648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7017031717222593
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2764800443136838
"cameras/drone/drone0" SET Transform localPosition (-0.9238677988357065 0.04692274843656724 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0617974922115863 1.2821176805761074 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -9 7)
"cameras/drone/drone0" SET Transform localScale (1.1560716027906857 1.1560716027906857 1.1560716027906857)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -2 18)
"cameras/drone/drone1" SET Transform localScale (0.8179643584665705 0.8179643584665705 0.8179643584665705)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.013694237349095 0)
"cameras" SET Transform eulerAngles (17.9025036846172 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5741703629430255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5433953371042026
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1298308779025013
"cameras/drone/drone0" SET Transform localPosition (-0.09808882650372919 -0.19515168220185958 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9421623689913228 1.0715849398282664 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 18 -8)
"cameras/drone/drone0" SET Transform localScale (1.3024246471051408 1.3024246471051408 1.3024246471051408)
"cameras/drone/drone1" SET Transform localEulerAngles (16 7 -5)
"cameras/drone/drone1" SET Transform localScale (0.7263493414803186 0.7263493414803186 0.7263493414803186)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.654098452778686 0)
"cameras" SET Transform eulerAngles (9.256885472471911 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3021732341187557
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5425006323355182
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11701882821642325
"cameras/drone/drone0" SET Transform localPosition (-0.27585509743921666 -0.20890949309113943 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.060749788678619465 1.0463806886594982 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 14 4)
"cameras/drone/drone0" SET Transform localScale (1.2367814720742654 1.2367814720742654 1.2367814720742654)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -2 2)
"cameras/drone/drone1" SET Transform localScale (1.3165531335386442 1.3165531335386442 1.3165531335386442)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.442226945713983 0)
"cameras" SET Transform eulerAngles (5.343830355881618 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2722061732568002
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3372235050720411
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07858988879153933
"cameras/drone/drone0" SET Transform localPosition (-1.0067158380186318 0.446875071817837 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.767199147393685 1.2304862733849502 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -17 -17)
"cameras/drone/drone0" SET Transform localScale (1.0073853702132454 1.0073853702132454 1.0073853702132454)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -11 -18)
"cameras/drone/drone1" SET Transform localScale (1.456854263730735 1.456854263730735 1.456854263730735)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.219495912208826 0)
"cameras" SET Transform eulerAngles (-9.94717344636447 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.401646022819118
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0157668301151377
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10387720976312904
"cameras/drone/drone0" SET Transform localPosition (-0.08991027344815938 0.31159954562394104 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.930036336134139 1.0287272511150767 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -13 -16)
"cameras/drone/drone0" SET Transform localScale (1.235507380259226 1.235507380259226 1.235507380259226)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 2 16)
"cameras/drone/drone1" SET Transform localScale (0.9489291183509239 0.9489291183509239 0.9489291183509239)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3235769286394135 0)
"cameras" SET Transform eulerAngles (3.384271020110422 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8231775137228707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7643477760191022
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11269547157249922
"cameras/drone/drone0" SET Transform localPosition (-1.0903422654326749 -0.2083462497527681 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0761587473053662 0.9623672338713128 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 6 -9)
"cameras/drone/drone0" SET Transform localScale (0.9897556810821603 0.9897556810821603 0.9897556810821603)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -7 -3)
"cameras/drone/drone1" SET Transform localScale (0.7270102538552342 0.7270102538552342 0.7270102538552342)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.276368204398876 0)
"cameras" SET Transform eulerAngles (10.17749913134887 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4165822712543517
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9204986975750375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23691785204273283
"cameras/drone/drone0" SET Transform localPosition (1.0844552623597596 0.025180657875719048 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.47971138342710684 1.2485992283255005 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -5 18)
"cameras/drone/drone0" SET Transform localScale (1.049216883443582 1.049216883443582 1.049216883443582)
"cameras/drone/drone1" SET Transform localEulerAngles (4 3 -20)
"cameras/drone/drone1" SET Transform localScale (0.8509391388923806 0.8509391388923806 0.8509391388923806)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.78577397363896 0)
"cameras" SET Transform eulerAngles (9.17245831822395 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5842760200673525
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2546241578916084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.029542994548949778
"cameras/drone/drone0" SET Transform localPosition (0.4214386100519256 0.5641708118956246 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8128143639783433 0.8191266776286628 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 0 12)
"cameras/drone/drone0" SET Transform localScale (1.0696754068901182 1.0696754068901182 1.0696754068901182)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -15 -17)
"cameras/drone/drone1" SET Transform localScale (1.1073082750124024 1.1073082750124024 1.1073082750124024)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.054399237029723 0)
"cameras" SET Transform eulerAngles (2.9710045779327103 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1867541869703517
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7758382061962388
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.342106551503968
"cameras/drone/drone0" SET Transform localPosition (0.1130295720022616 0.335498251304473 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0630738898764058 1.0340770284548788 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -13 3)
"cameras/drone/drone0" SET Transform localScale (1.0588992454641692 1.0588992454641692 1.0588992454641692)
"cameras/drone/drone1" SET Transform localEulerAngles (10 2 -18)
"cameras/drone/drone1" SET Transform localScale (1.1789736484118898 1.1789736484118898 1.1789736484118898)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.18997812827401 0)
"cameras" SET Transform eulerAngles (-6.179244214829707 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8294518543443357
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5507582406222613
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12945377674656333
"cameras/drone/drone0" SET Transform localPosition (0.8396415498680538 0.27502790321581855 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.869982388721968 1.1279165617021238 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 8 14)
"cameras/drone/drone0" SET Transform localScale (1.2714169802203275 1.2714169802203275 1.2714169802203275)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 14 -1)
"cameras/drone/drone1" SET Transform localScale (1.1953886807221084 1.1953886807221084 1.1953886807221084)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.142748896332896 0)
"cameras" SET Transform eulerAngles (1.828817959750502 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3625582111973418
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9397666824358979
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09402911188044932
"cameras/drone/drone0" SET Transform localPosition (-0.013422898497396307 0.41101467628075067 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8588356220532523 1.2263143146036848 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -12 6)
"cameras/drone/drone0" SET Transform localScale (1.0219336579240614 1.0219336579240614 1.0219336579240614)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 13 8)
"cameras/drone/drone1" SET Transform localScale (1.0216280427618412 1.0216280427618412 1.0216280427618412)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.661147190789714 0)
"cameras" SET Transform eulerAngles (-5.079834248792011 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.556137067007791
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7169339183459793
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19843194639249445
"cameras/drone/drone0" SET Transform localPosition (-0.6734350091492547 0.627636565952628 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5769345926970482 0.9296980567504081 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 20 16)
"cameras/drone/drone0" SET Transform localScale (0.8117507459162221 0.8117507459162221 0.8117507459162221)
"cameras/drone/drone1" SET Transform localEulerAngles (1 12 10)
"cameras/drone/drone1" SET Transform localScale (0.6858708423455786 0.6858708423455786 0.6858708423455786)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1309419707997987 0)
"cameras" SET Transform eulerAngles (12.49216963242133 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6464494957945931
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.098100354257241
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.018656883302439288
"cameras/drone/drone0" SET Transform localPosition (0.9896435861871786 -0.28459507912454135 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7300223939996686 0.9607600444713167 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 11 12)
"cameras/drone/drone0" SET Transform localScale (1.1177657686877704 1.1177657686877704 1.1177657686877704)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -5 1)
"cameras/drone/drone1" SET Transform localScale (1.1570947329823857 1.1570947329823857 1.1570947329823857)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5039262751995803 0)
"cameras" SET Transform eulerAngles (-7.3433668384020745 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3666465149132865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1665018181814932
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22333783961844775
"cameras/drone/drone0" SET Transform localPosition (1.124051714397633 -0.004117803919211516 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7252553979261602 0.8764017477790531 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -8 12)
"cameras/drone/drone0" SET Transform localScale (0.9063942170275285 0.9063942170275285 0.9063942170275285)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -19 20)
"cameras/drone/drone1" SET Transform localScale (0.7172524066389979 0.7172524066389979 0.7172524066389979)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.234133973007443 0)
"cameras" SET Transform eulerAngles (6.39679892008224 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.341220470717043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4698870023262003
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3360132179913658
"cameras/drone/drone0" SET Transform localPosition (-0.608325721453817 0.32630300017612607 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.06946347129737962 1.1939246507858057 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -1 -14)
"cameras/drone/drone0" SET Transform localScale (1.095558061480606 1.095558061480606 1.095558061480606)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -20 0)
"cameras/drone/drone1" SET Transform localScale (0.9030296315994855 0.9030296315994855 0.9030296315994855)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.631240760200126 0)
"cameras" SET Transform eulerAngles (9.848308576215157 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7706782308811759
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5584536425308677
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3851083715644026
"cameras/drone/drone0" SET Transform localPosition (0.9256903415318145 0.04968823841511577 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0751899395857378 1.2315903709805387 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 8 4)
"cameras/drone/drone0" SET Transform localScale (0.7164757507781575 0.7164757507781575 0.7164757507781575)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -8 20)
"cameras/drone/drone1" SET Transform localScale (1.154405939938603 1.154405939938603 1.154405939938603)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.056285267777525 0)
"cameras" SET Transform eulerAngles (14.146206667876669 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3450614772128138
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.655305707194114
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2603590005198157
"cameras/drone/drone0" SET Transform localPosition (0.5502250377552067 0.235869250131643 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9879456645945672 1.2657177028708193 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 8 11)
"cameras/drone/drone0" SET Transform localScale (1.1208441870568837 1.1208441870568837 1.1208441870568837)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -6 -5)
"cameras/drone/drone1" SET Transform localScale (0.9124541373294432 0.9124541373294432 0.9124541373294432)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2594774273250353 0)
"cameras" SET Transform eulerAngles (8.22467588478796 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5139830723864667
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9574511303914365
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18994946939388524
"cameras/drone/drone0" SET Transform localPosition (-0.8942454454822489 0.06371054911470081 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17365017621820833 0.8986485227098452 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 1 -12)
"cameras/drone/drone0" SET Transform localScale (0.6875579258901916 0.6875579258901916 0.6875579258901916)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -19 8)
"cameras/drone/drone1" SET Transform localScale (1.0979473894595473 1.0979473894595473 1.0979473894595473)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.265171935912571 0)
"cameras" SET Transform eulerAngles (-8.37997449059178 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8084416849442575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3594580901914552
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21082917835392762
"cameras/drone/drone0" SET Transform localPosition (-0.554859001979368 -0.17860314999482946 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5140371697768075 0.9941688395213588 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -15 -18)
"cameras/drone/drone0" SET Transform localScale (1.4237418046410397 1.4237418046410397 1.4237418046410397)
"cameras/drone/drone1" SET Transform localEulerAngles (11 5 -2)
"cameras/drone/drone1" SET Transform localScale (1.2618042956031703 1.2618042956031703 1.2618042956031703)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.155772359992299 0)
"cameras" SET Transform eulerAngles (-3.8515084740498793 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1194673676847833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6009391669522417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29009534792352815
"cameras/drone/drone0" SET Transform localPosition (-0.8550949656574327 0.6692930555023637 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.23867530351035038 1.1137505886601624 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -14 -8)
"cameras/drone/drone0" SET Transform localScale (1.1631506572414325 1.1631506572414325 1.1631506572414325)
"cameras/drone/drone1" SET Transform localEulerAngles (11 15 4)
"cameras/drone/drone1" SET Transform localScale (1.2406921689830905 1.2406921689830905 1.2406921689830905)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8736960482291627 0)
"cameras" SET Transform eulerAngles (16.550087457986706 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5416438157115064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7243934243631016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.050360641094866224
"cameras/drone/drone0" SET Transform localPosition (-0.6581904884392532 -0.18975499858327932 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12369845638348198 0.8692926459872168 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 15 -3)
"cameras/drone/drone0" SET Transform localScale (0.6598388934550979 0.6598388934550979 0.6598388934550979)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -1 -12)
"cameras/drone/drone1" SET Transform localScale (1.493340425991505 1.493340425991505 1.493340425991505)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7519750151906477 0)
"cameras" SET Transform eulerAngles (-11.053788734521799 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5506001276425971
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2332541822661907
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20420450993227202
"cameras/drone/drone0" SET Transform localPosition (0.8372868570005847 0.42282975968709163 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.307317821020034 1.1755832387414722 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -4 16)
"cameras/drone/drone0" SET Transform localScale (1.353018316749346 1.353018316749346 1.353018316749346)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -2 -18)
"cameras/drone/drone1" SET Transform localScale (1.1920653149454457 1.1920653149454457 1.1920653149454457)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9997972269494575 0)
"cameras" SET Transform eulerAngles (-10.907193555338225 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4630604764372448
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0627502696687943
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3893742799706764
"cameras/drone/drone0" SET Transform localPosition (-0.574895542318131 0.2898205937971066 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9701756349131185 1.1088500381452728 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 8 9)
"cameras/drone/drone0" SET Transform localScale (1.4322313809864462 1.4322313809864462 1.4322313809864462)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -10 -2)
"cameras/drone/drone1" SET Transform localScale (1.4352322209918253 1.4352322209918253 1.4352322209918253)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9183621692284407 0)
"cameras" SET Transform eulerAngles (3.046016831645268 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2518012799011111
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2443130250039973
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11399616067797168
"cameras/drone/drone0" SET Transform localPosition (-0.034854216104135416 0.059443835552519364 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9652927972891143 1.1543200143839278 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -19 7)
"cameras/drone/drone0" SET Transform localScale (0.7969748139740657 0.7969748139740657 0.7969748139740657)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -1 -3)
"cameras/drone/drone1" SET Transform localScale (0.7687423983717306 0.7687423983717306 0.7687423983717306)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3817390377902687 0)
"cameras" SET Transform eulerAngles (-14.191477073572422 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2417972830640944
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7019689263447588
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03484019899121895
"cameras/drone/drone0" SET Transform localPosition (0.48773693597828904 -0.04442139700210107 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0880979569038749 1.0992082202627682 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 0 17)
"cameras/drone/drone0" SET Transform localScale (0.9474271949837217 0.9474271949837217 0.9474271949837217)
"cameras/drone/drone1" SET Transform localEulerAngles (0 16 4)
"cameras/drone/drone1" SET Transform localScale (0.6566655285135495 0.6566655285135495 0.6566655285135495)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.860601443406211 0)
"cameras" SET Transform eulerAngles (7.77503188840403 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43186209127832476
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.764473735864001
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11611821021237825
"cameras/drone/drone0" SET Transform localPosition (-0.23027074852878449 0.6302786004630738 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4696491848024167 1.1248207318516754 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 10 2)
"cameras/drone/drone0" SET Transform localScale (1.4669467409383794 1.4669467409383794 1.4669467409383794)
"cameras/drone/drone1" SET Transform localEulerAngles (3 11 -15)
"cameras/drone/drone1" SET Transform localScale (0.7437742974345279 0.7437742974345279 0.7437742974345279)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.406313902891499 0)
"cameras" SET Transform eulerAngles (10.532840549302144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4736137777060945
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6499637422185485
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0003045818008861279
"cameras/drone/drone0" SET Transform localPosition (-1.0768821575588465 0.21375189659678745 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8547204362208969 1.0045544317562776 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -17 6)
"cameras/drone/drone0" SET Transform localScale (1.2934027416969287 1.2934027416969287 1.2934027416969287)
"cameras/drone/drone1" SET Transform localEulerAngles (3 17 -7)
"cameras/drone/drone1" SET Transform localScale (0.869830744063046 0.869830744063046 0.869830744063046)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.887490556963001 0)
"cameras" SET Transform eulerAngles (15.345491557755501 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7439595999057877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9964202916431845
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23533868752863685
"cameras/drone/drone0" SET Transform localPosition (0.34237787588065194 0.18571316720513004 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8828405263202191 1.1012400758901844 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -17 13)
"cameras/drone/drone0" SET Transform localScale (1.4064741909127647 1.4064741909127647 1.4064741909127647)
"cameras/drone/drone1" SET Transform localEulerAngles (12 0 4)
"cameras/drone/drone1" SET Transform localScale (1.2990530829974136 1.2990530829974136 1.2990530829974136)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.913745045620697 0)
"cameras" SET Transform eulerAngles (-18.29681192811419 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9444580250807416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0906022318152133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15547624635374047
"cameras/drone/drone0" SET Transform localPosition (-0.6764454762908364 0.16467584064002644 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04137574423439894 1.1356884381395704 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 6 17)
"cameras/drone/drone0" SET Transform localScale (0.785712175210079 0.785712175210079 0.785712175210079)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 12 10)
"cameras/drone/drone1" SET Transform localScale (1.121297824525523 1.121297824525523 1.121297824525523)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.791105743866603 0)
"cameras" SET Transform eulerAngles (19.37322948058027 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1957877915101727
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3643059773983781
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30089151912685885
"cameras/drone/drone0" SET Transform localPosition (0.9016107180995003 0.5550842983202076 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6574653836805876 1.2243892361691915 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 10 -3)
"cameras/drone/drone0" SET Transform localScale (1.4582068100055454 1.4582068100055454 1.4582068100055454)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 4 -12)
"cameras/drone/drone1" SET Transform localScale (1.1062156375652465 1.1062156375652465 1.1062156375652465)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6049024057312025 0)
"cameras" SET Transform eulerAngles (-5.446703164549858 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.491986418282106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7029249517037093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21439227292461732
"cameras/drone/drone0" SET Transform localPosition (1.146411322821357 -0.15806548919579538 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.567147085011289 0.9078934722998755 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 4 -13)
"cameras/drone/drone0" SET Transform localScale (0.8293935968400811 0.8293935968400811 0.8293935968400811)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -3 1)
"cameras/drone/drone1" SET Transform localScale (0.7384444912347234 0.7384444912347234 0.7384444912347234)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
