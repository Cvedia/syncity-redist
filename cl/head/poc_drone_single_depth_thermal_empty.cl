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
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1536 1152 24 "ARGB32" "Default"
"cameras/segmentation" SET active true
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB" "cameras/cameraRGB"
"EnviroSky" SET active true
[UI.Window] ShowFromCamera "cameras/cameraRGB" AS "cameraRGB" WITH 1536 1152 24 "ARGB32" "Default"
"cameras/cameraRGB" SET active true
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
"spawner/city/ground/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground/container" SET RandomProps.Torus radius 150
"spawner/city/ground/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (3 3 3)
"spawner/city/ground/container" SET active true
"spawner/city/ground" SET active true
CREATE "spawner/humans_0/container"
"spawner/humans_0/container" SET active false
"spawner/humans_0/container" ADD RandomProps.Torus
"spawner/humans_0/container" ADD RandomProps.PropArea
"spawner/humans_0/container" SET RandomProps.PropArea tags "human, +random"
"spawner/humans_0/container" SET RandomProps.PropArea async false numberOfProps 40 collisionCheck false stickToGround false 
"spawner/humans_0/container" SET RandomProps.Torus innerRadius 2
"spawner/humans_0/container" SET RandomProps.Torus radius 30
"spawner/humans_0/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/humans_0/container" SET active true
"spawner/humans_0" SET active true
CREATE "spawner/city/nature/trees/container"
"spawner/city/nature/trees/container" SET active false
"spawner/city/nature/trees/container" ADD RandomProps.Torus
"spawner/city/nature/trees/container" ADD RandomProps.PropArea
"spawner/city/nature/trees/container" SET RandomProps.PropArea tags "tree"
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 171 collisionCheck false stickToGround false 
"spawner/city/nature/trees/container" SET RandomProps.Torus innerRadius 15
"spawner/city/nature/trees/container" SET RandomProps.Torus radius 60
"spawner/city/nature/trees/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/nature/trees/container" SET active true
"spawner/city/nature/trees" SET active true
CREATE "spawner/city/buildings/container"
"spawner/city/buildings/container" SET active false
"spawner/city/buildings/container" ADD RandomProps.Torus
"spawner/city/buildings/container" ADD RandomProps.PropArea
"spawner/city/buildings/container" SET RandomProps.PropArea tags "building"
"spawner/city/buildings/container" SET RandomProps.PropArea async false numberOfProps 100 collisionCheck false stickToGround false 
"spawner/city/buildings/container" SET RandomProps.Torus innerRadius 80
"spawner/city/buildings/container" SET RandomProps.Torus radius 120
"spawner/city/buildings/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/buildings/container" SET active true
"spawner/city/buildings" SET active true
CREATE "spawner/animals/generic/container"
"spawner/animals/generic/container" SET active false
"spawner/animals/generic/container" ADD RandomProps.Torus
"spawner/animals/generic/container" ADD RandomProps.PropArea
"spawner/animals/generic/container" SET RandomProps.PropArea tags "animal"
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 18 collisionCheck false stickToGround false 
"spawner/animals/generic/container" SET RandomProps.Torus innerRadius 5
"spawner/animals/generic/container" SET RandomProps.Torus radius 50
"spawner/animals/generic/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/generic/container" SET active true
"spawner/animals/generic" SET active true
CREATE "spawner/animals/birds/container"
"spawner/animals/birds/container" SET active false
"spawner/animals/birds/container" ADD RandomProps.Torus
"spawner/animals/birds/container" ADD RandomProps.PropArea
"spawner/animals/birds/container" SET RandomProps.PropArea tags "bird"
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 86 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET Transform position (0 16 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/birds/container" SET active true
"spawner/animals/birds" SET active true
CREATE "spawner/cars/container"
"spawner/cars/container" SET active false
"spawner/cars/container" ADD RandomProps.Torus
"spawner/cars/container" ADD RandomProps.PropArea
"spawner/cars/container" SET RandomProps.PropArea tags "car"
"spawner/cars/container" SET RandomProps.PropArea async false numberOfProps 75 collisionCheck false stickToGround false 
"spawner/cars/container" SET RandomProps.Torus innerRadius 5
"spawner/cars/container" SET RandomProps.Torus radius 50
"spawner/cars/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/cars/container" SET active true
"spawner/cars" SET active true
CREATE "spawner/roadsigns/container"
"spawner/roadsigns/container" SET active false
"spawner/roadsigns/container" ADD RandomProps.Torus
"spawner/roadsigns/container" ADD RandomProps.PropArea
"spawner/roadsigns/container" SET RandomProps.PropArea tags "roadsign"
"spawner/roadsigns/container" SET RandomProps.PropArea async false numberOfProps 250 collisionCheck false stickToGround false 
"spawner/roadsigns/container" SET RandomProps.Torus innerRadius 15
"spawner/roadsigns/container" SET RandomProps.Torus radius 80
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
"cameras" SET Transform eulerAngles (-18.21601343132204 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 68
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.038311238430426 0)
"cameras" SET Transform eulerAngles (-4.041192534340237 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2086571831314346
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6181368303254682
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2676858438399851
"cameras/drone/drone0" SET Transform localPosition (0.2406127129144049 -0.2507157138414738 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5695370371309643 1.1680012169829888 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 1 -2)
"cameras/drone/drone0" SET Transform localScale (1.4471439438873963 1.4471439438873963 1.4471439438873963)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -1 -10)
"cameras/drone/drone1" SET Transform localScale (0.9414727340102405 0.9414727340102405 0.9414727340102405)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.135266413569295 0)
"cameras" SET Transform eulerAngles (4.292552055502121 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.400981000422175
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9691859359907458
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0778044216232733
"cameras/drone/drone0" SET Transform localPosition (1.157549812872482 0.287700354931606 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6642724088615038 1.2359385648895032 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 14 -1)
"cameras/drone/drone0" SET Transform localScale (1.2625252107630043 1.2625252107630043 1.2625252107630043)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 18 5)
"cameras/drone/drone1" SET Transform localScale (1.2705252031129701 1.2705252031129701 1.2705252031129701)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4928602894858534 0)
"cameras" SET Transform eulerAngles (11.736365833065413 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9372949007642949
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.894381599782466
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32230301357627583
"cameras/drone/drone0" SET Transform localPosition (0.2629832822775455 0.5104838987009366 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8387299427260968 1.2153728877583743 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -3 -3)
"cameras/drone/drone0" SET Transform localScale (0.8265522123247462 0.8265522123247462 0.8265522123247462)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -7 11)
"cameras/drone/drone1" SET Transform localScale (0.6218665713340257 0.6218665713340257 0.6218665713340257)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.927998273426271 0)
"cameras" SET Transform eulerAngles (-2.5433095576734708 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5271154099183646
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4109453815822313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3465427061250643
"cameras/drone/drone0" SET Transform localPosition (1.0458571871518398 0.0136672223673035 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.010562045750725835 1.063645725036952 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 3 -8)
"cameras/drone/drone0" SET Transform localScale (1.2446666887016407 1.2446666887016407 1.2446666887016407)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -4 -4)
"cameras/drone/drone1" SET Transform localScale (0.6733943320810095 0.6733943320810095 0.6733943320810095)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2970733039978106 0)
"cameras" SET Transform eulerAngles (-0.45898928455893184 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4681760553486392
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1745054402017208
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02683759671224513
"cameras/drone/drone0" SET Transform localPosition (-0.2567299137726635 0.6359743829419244 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6114179355833727 1.1515736463899233 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 14 16)
"cameras/drone/drone0" SET Transform localScale (1.45401329117306 1.45401329117306 1.45401329117306)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -12 -1)
"cameras/drone/drone1" SET Transform localScale (1.324952544600635 1.324952544600635 1.324952544600635)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.775102019924991 0)
"cameras" SET Transform eulerAngles (-1.6557370817733315 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5425626120762206
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3118698875518848
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.053275134043311835
"cameras/drone/drone0" SET Transform localPosition (-0.17507046874313215 0.4160104960023115 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4314575360474857 0.8744067104485769 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 7 -8)
"cameras/drone/drone0" SET Transform localScale (1.128692920912124 1.128692920912124 1.128692920912124)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -1 -14)
"cameras/drone/drone1" SET Transform localScale (1.3317123287545676 1.3317123287545676 1.3317123287545676)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2237837245650045 0)
"cameras" SET Transform eulerAngles (-13.891817080696933 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8246668436505626
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2525749258001992
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07509208643546605
"cameras/drone/drone0" SET Transform localPosition (0.5586462707417219 0.6710225936912877 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09873338636373008 0.9291120709689252 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 2 0)
"cameras/drone/drone0" SET Transform localScale (0.9811784327591033 0.9811784327591033 0.9811784327591033)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -14 5)
"cameras/drone/drone1" SET Transform localScale (0.8691569265060333 0.8691569265060333 0.8691569265060333)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.916725330000355 0)
"cameras" SET Transform eulerAngles (3.752444039361972 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5997814739940321
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3059588286789108
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07221150407708339
"cameras/drone/drone0" SET Transform localPosition (-0.5200066213038125 0.4119353700627559 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8311738537960784 1.253587383514964 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -4 11)
"cameras/drone/drone0" SET Transform localScale (1.1352098868077714 1.1352098868077714 1.1352098868077714)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -11 8)
"cameras/drone/drone1" SET Transform localScale (1.0475607075660922 1.0475607075660922 1.0475607075660922)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.277419952086089 0)
"cameras" SET Transform eulerAngles (-4.561159720432411 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4113172406887822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1385808115176352
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08217816030749132
"cameras/drone/drone0" SET Transform localPosition (-0.4393876461617192 0.18335434649940846 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9703477505256901 1.2348202774465897 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 4 5)
"cameras/drone/drone0" SET Transform localScale (0.839088018881333 0.839088018881333 0.839088018881333)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -8 -16)
"cameras/drone/drone1" SET Transform localScale (0.6690872085188643 0.6690872085188643 0.6690872085188643)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9091110500927586 0)
"cameras" SET Transform eulerAngles (12.839729323212758 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5552070738060615
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.514888265828457
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07644897070711916
"cameras/drone/drone0" SET Transform localPosition (-0.07919160907381073 0.2030727047183037 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5502725901531853 1.1720325428596954 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 17 -18)
"cameras/drone/drone0" SET Transform localScale (1.1548796004196382 1.1548796004196382 1.1548796004196382)
"cameras/drone/drone1" SET Transform localEulerAngles (5 19 -16)
"cameras/drone/drone1" SET Transform localScale (1.2056984141897589 1.2056984141897589 1.2056984141897589)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.798428532830252 0)
"cameras" SET Transform eulerAngles (-17.436469405623995 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2860161161035226
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7224892297166825
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.138012726155625
"cameras/drone/drone0" SET Transform localPosition (0.5905266201686148 -0.20705890831167623 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4952983643376224 1.1592533983272724 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -11 -19)
"cameras/drone/drone0" SET Transform localScale (0.7602260492642426 0.7602260492642426 0.7602260492642426)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -15 19)
"cameras/drone/drone1" SET Transform localScale (1.1597613026433997 1.1597613026433997 1.1597613026433997)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1140888234171635 0)
"cameras" SET Transform eulerAngles (-14.869430684849467 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5685980758057294
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2984485940550594
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27009786632799204
"cameras/drone/drone0" SET Transform localPosition (0.28114483584803374 0.36094665756826066 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.089991323020531 0.8768307063770111 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -3 12)
"cameras/drone/drone0" SET Transform localScale (1.168398877618454 1.168398877618454 1.168398877618454)
"cameras/drone/drone1" SET Transform localEulerAngles (11 9 12)
"cameras/drone/drone1" SET Transform localScale (0.6975318566874746 0.6975318566874746 0.6975318566874746)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.045572277545251 0)
"cameras" SET Transform eulerAngles (7.398351360125748 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7874609769743284
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1878076371343491
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19047682147436296
"cameras/drone/drone0" SET Transform localPosition (0.010852369744058787 0.0460920837551671 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3894943213791874 0.9381036538393772 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 10 11)
"cameras/drone/drone0" SET Transform localScale (0.8194538421683424 0.8194538421683424 0.8194538421683424)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -6 -12)
"cameras/drone/drone1" SET Transform localScale (0.6198550551677575 0.6198550551677575 0.6198550551677575)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5562080148166775 0)
"cameras" SET Transform eulerAngles (14.967823900195526 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5924806320622988
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.890759994629318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.044674438824572074
"cameras/drone/drone0" SET Transform localPosition (0.36514990060254626 0.2468151267729723 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9846800999040188 1.063011775308722 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 17 -5)
"cameras/drone/drone0" SET Transform localScale (0.6303424486885134 0.6303424486885134 0.6303424486885134)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -16 -16)
"cameras/drone/drone1" SET Transform localScale (1.0276652721085295 1.0276652721085295 1.0276652721085295)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7648878682274427 0)
"cameras" SET Transform eulerAngles (8.64693643716457 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4204075797980429
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.702958487756424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12253111896275067
"cameras/drone/drone0" SET Transform localPosition (-0.014736936189305716 0.03046110564054144 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.04587079656091042 1.1367327975654349 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -3 -16)
"cameras/drone/drone0" SET Transform localScale (1.3028707889433586 1.3028707889433586 1.3028707889433586)
"cameras/drone/drone1" SET Transform localEulerAngles (15 15 13)
"cameras/drone/drone1" SET Transform localScale (1.1251710166075792 1.1251710166075792 1.1251710166075792)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0506233704280445 0)
"cameras" SET Transform eulerAngles (-18.846039760422123 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9979620394525767
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.354002909072717
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13349508817839886
"cameras/drone/drone0" SET Transform localPosition (-0.5287821383127148 -0.003009368394910339 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9620508053039696 1.2870066414284222 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 13 12)
"cameras/drone/drone0" SET Transform localScale (1.16336554845729 1.16336554845729 1.16336554845729)
"cameras/drone/drone1" SET Transform localEulerAngles (19 14 -16)
"cameras/drone/drone1" SET Transform localScale (0.9375082801811743 0.9375082801811743 0.9375082801811743)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.599152947417675 0)
"cameras" SET Transform eulerAngles (6.278922188585657 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4842043824192719
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4299458596560437
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07147613520110303
"cameras/drone/drone0" SET Transform localPosition (-0.41387028308995566 0.2666260880434333 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3969084545398489 1.090618215746457 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 5 16)
"cameras/drone/drone0" SET Transform localScale (0.7372849698105511 0.7372849698105511 0.7372849698105511)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -11 -10)
"cameras/drone/drone1" SET Transform localScale (0.9130900692268207 0.9130900692268207 0.9130900692268207)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.205506037576632 0)
"cameras" SET Transform eulerAngles (-15.402273988550125 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9424642955156101
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2792837544675009
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21995654417513721
"cameras/drone/drone0" SET Transform localPosition (0.91986832086837 0.5128512584410401 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.30863636057269783 1.2533199636075303 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -4 7)
"cameras/drone/drone0" SET Transform localScale (1.335619872246618 1.335619872246618 1.335619872246618)
"cameras/drone/drone1" SET Transform localEulerAngles (10 7 15)
"cameras/drone/drone1" SET Transform localScale (0.755368739063945 0.755368739063945 0.755368739063945)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8454219149350344 0)
"cameras" SET Transform eulerAngles (-13.48858680774233 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9036940715744682
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.646417898159127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05656016630425609
"cameras/drone/drone0" SET Transform localPosition (0.6194757917074616 -0.08415425174431473 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.771319097174306 1.2626117522382527 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -9 17)
"cameras/drone/drone0" SET Transform localScale (0.7514563962857326 0.7514563962857326 0.7514563962857326)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -18 9)
"cameras/drone/drone1" SET Transform localScale (1.172847649397768 1.172847649397768 1.172847649397768)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.688268843483838 0)
"cameras" SET Transform eulerAngles (5.289394442245936 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5882994457786628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9007936416004299
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09271700885204473
"cameras/drone/drone0" SET Transform localPosition (0.04953586146561895 0.19377358379728388 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0450233742779231 1.2289748447485314 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 2 13)
"cameras/drone/drone0" SET Transform localScale (1.2436080677723242 1.2436080677723242 1.2436080677723242)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -10 -12)
"cameras/drone/drone1" SET Transform localScale (0.9984960274188182 0.9984960274188182 0.9984960274188182)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.547442263264118 0)
"cameras" SET Transform eulerAngles (-8.202250179044848 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6613020645036447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8134504404181122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13817324740985804
"cameras/drone/drone0" SET Transform localPosition (0.6786387395585225 0.6083444493617263 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5225027321306968 1.0709120784089863 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -14 -14)
"cameras/drone/drone0" SET Transform localScale (1.20342617343158 1.20342617343158 1.20342617343158)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 18 -4)
"cameras/drone/drone1" SET Transform localScale (0.756743970367876 0.756743970367876 0.756743970367876)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.114745489941142 0)
"cameras" SET Transform eulerAngles (-1.1453896092345062 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2588104922846788
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4340288436031936
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0007172151386397818
"cameras/drone/drone0" SET Transform localPosition (-0.6107207485761985 0.03552483538088075 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8646772400682756 0.8052453155750903 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -6 18)
"cameras/drone/drone0" SET Transform localScale (1.3248766926151796 1.3248766926151796 1.3248766926151796)
"cameras/drone/drone1" SET Transform localEulerAngles (3 15 -18)
"cameras/drone/drone1" SET Transform localScale (1.3174639725381723 1.3174639725381723 1.3174639725381723)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.911886582035804 0)
"cameras" SET Transform eulerAngles (19.986904994811837 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2725486001212625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9790598580384752
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22309780009311606
"cameras/drone/drone0" SET Transform localPosition (-1.1018697843192544 -0.1680370334696732 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.971304765797065 1.176950948036417 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -14 -3)
"cameras/drone/drone0" SET Transform localScale (1.287651665417893 1.287651665417893 1.287651665417893)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 17 0)
"cameras/drone/drone1" SET Transform localScale (1.0810124917372113 1.0810124917372113 1.0810124917372113)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7600199758405717 0)
"cameras" SET Transform eulerAngles (-16.72388255110068 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7997428138092715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3313135958420834
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3135664624334371
"cameras/drone/drone0" SET Transform localPosition (-1.1182973637406108 0.08427920930002125 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5874145258896658 0.95887572709321 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 4 20)
"cameras/drone/drone0" SET Transform localScale (0.9417442234130855 0.9417442234130855 0.9417442234130855)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -1 17)
"cameras/drone/drone1" SET Transform localScale (0.7309389561250359 0.7309389561250359 0.7309389561250359)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.515350918846204 0)
"cameras" SET Transform eulerAngles (2.339397988238918 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.522629939589509
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4375625169091184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2410804284358445
"cameras/drone/drone0" SET Transform localPosition (0.8189241973032086 0.14540805698133702 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1259220029469481 1.0084084817291563 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 16 1)
"cameras/drone/drone0" SET Transform localScale (1.0566177842418667 1.0566177842418667 1.0566177842418667)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -14 -20)
"cameras/drone/drone1" SET Transform localScale (0.8308772398261117 0.8308772398261117 0.8308772398261117)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.772459353318517 0)
"cameras" SET Transform eulerAngles (-18.665069219972562 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5282993149101447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1489109422694057
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3965680170407787
"cameras/drone/drone0" SET Transform localPosition (-0.2668647582510556 -0.07050271299418415 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1636287722612979 1.0973459358597413 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -9 7)
"cameras/drone/drone0" SET Transform localScale (1.2698759388722305 1.2698759388722305 1.2698759388722305)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -1 -15)
"cameras/drone/drone1" SET Transform localScale (1.494069028860247 1.494069028860247 1.494069028860247)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.338171454864424 0)
"cameras" SET Transform eulerAngles (-0.43555002324740144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49992838457063654
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.709054779616241
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25747872009934086
"cameras/drone/drone0" SET Transform localPosition (-0.5246644717818975 0.6890409474621246 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3199164448048637 1.0310237291223192 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 4 15)
"cameras/drone/drone0" SET Transform localScale (1.358511023894635 1.358511023894635 1.358511023894635)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -10 -11)
"cameras/drone/drone1" SET Transform localScale (0.7571884214385507 0.7571884214385507 0.7571884214385507)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.39314627865741 0)
"cameras" SET Transform eulerAngles (10.127480522761111 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7998269595545582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5718565921702652
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07861905935064542
"cameras/drone/drone0" SET Transform localPosition (-1.1541814308021159 0.19396686600844576 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5974280396880896 0.8791464265351456 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -19 10)
"cameras/drone/drone0" SET Transform localScale (0.759055133788699 0.759055133788699 0.759055133788699)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 17 16)
"cameras/drone/drone1" SET Transform localScale (1.019026704573962 1.019026704573962 1.019026704573962)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.623680903446834 0)
"cameras" SET Transform eulerAngles (9.75503759334569 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4365404081908064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4710430837227624
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38633001693693925
"cameras/drone/drone0" SET Transform localPosition (0.4370074384369391 0.6063754586804442 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8721580577222294 0.8713144665883448 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -10 10)
"cameras/drone/drone0" SET Transform localScale (0.9577625735647874 0.9577625735647874 0.9577625735647874)
"cameras/drone/drone1" SET Transform localEulerAngles (4 10 -13)
"cameras/drone/drone1" SET Transform localScale (0.720426712742384 0.720426712742384 0.720426712742384)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.188766298229686 0)
"cameras" SET Transform eulerAngles (-1.184273180888475 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.167253755110537
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3919852977403029
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16277838911497355
"cameras/drone/drone0" SET Transform localPosition (-0.5696392812958626 0.024512650877701103 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1426717886763293 1.073519418785075 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -19 1)
"cameras/drone/drone0" SET Transform localScale (0.7985296662863135 0.7985296662863135 0.7985296662863135)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -2 -10)
"cameras/drone/drone1" SET Transform localScale (1.4425516110706886 1.4425516110706886 1.4425516110706886)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.525808958140266 0)
"cameras" SET Transform eulerAngles (-19.80320059902197 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4139526959846906
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9378231380972271
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14324441867004825
"cameras/drone/drone0" SET Transform localPosition (-1.050962695486735 -0.0003226050913303635 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0197329126488488 1.1129024664867795 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 8 -11)
"cameras/drone/drone0" SET Transform localScale (1.1424693068334009 1.1424693068334009 1.1424693068334009)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 8 -5)
"cameras/drone/drone1" SET Transform localScale (0.9052173450708121 0.9052173450708121 0.9052173450708121)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5872194608641434 0)
"cameras" SET Transform eulerAngles (17.281746663342574 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0988195727082974
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6962683753013477
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1290988839052581
"cameras/drone/drone0" SET Transform localPosition (-0.11763186907392775 0.6021832199333881 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8844974795391549 0.9998639560620665 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 18 14)
"cameras/drone/drone0" SET Transform localScale (0.7791051120296273 0.7791051120296273 0.7791051120296273)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -9 -15)
"cameras/drone/drone1" SET Transform localScale (0.9475189354743201 0.9475189354743201 0.9475189354743201)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.249203142990991 0)
"cameras" SET Transform eulerAngles (16.572936783445385 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4735049983793801
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0210714900795697
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2726836909646014
"cameras/drone/drone0" SET Transform localPosition (0.3525192022839123 0.675985441959106 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10692154054679026 0.9778833057717058 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -20 -2)
"cameras/drone/drone0" SET Transform localScale (1.164885027628936 1.164885027628936 1.164885027628936)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 9 12)
"cameras/drone/drone1" SET Transform localScale (1.401626926404672 1.401626926404672 1.401626926404672)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7197668405725093 0)
"cameras" SET Transform eulerAngles (-6.281761669326876 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8862146296307143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.928201975540902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.377275965053572
"cameras/drone/drone0" SET Transform localPosition (1.0176688277998458 0.022828021721292335 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1151512042798377 0.8530511991359981 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 9 1)
"cameras/drone/drone0" SET Transform localScale (0.907060369185509 0.907060369185509 0.907060369185509)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 3 -15)
"cameras/drone/drone1" SET Transform localScale (1.2439318547756546 1.2439318547756546 1.2439318547756546)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.427964589380195 0)
"cameras" SET Transform eulerAngles (-3.3323190954200896 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7838975592708404
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3432505878972987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2393589673895163
"cameras/drone/drone0" SET Transform localPosition (0.28719025279148447 0.27159195961431365 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7753604409880752 0.9695760035529642 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -17 18)
"cameras/drone/drone0" SET Transform localScale (0.8480093438658849 0.8480093438658849 0.8480093438658849)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 20 -18)
"cameras/drone/drone1" SET Transform localScale (0.9257821286285031 0.9257821286285031 0.9257821286285031)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1337940140648706 0)
"cameras" SET Transform eulerAngles (19.235506995975896 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6408034113089478
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3817220939574795
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11065646535792202
"cameras/drone/drone0" SET Transform localPosition (-1.0620047926969567 -0.25310544809343044 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9737976534067363 0.8525639305792331 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -1 -18)
"cameras/drone/drone0" SET Transform localScale (0.6272716925107977 0.6272716925107977 0.6272716925107977)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 4 11)
"cameras/drone/drone1" SET Transform localScale (1.4547538065328458 1.4547538065328458 1.4547538065328458)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.155189051481427 0)
"cameras" SET Transform eulerAngles (-11.008762413500857 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4751347086235311
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.723871484634235
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10785566066557895
"cameras/drone/drone0" SET Transform localPosition (-0.740576924366144 0.5998408447405856 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8766590586902392 1.2418076107118732 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -11 -9)
"cameras/drone/drone0" SET Transform localScale (0.9971745458976482 0.9971745458976482 0.9971745458976482)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -6 -20)
"cameras/drone/drone1" SET Transform localScale (1.0069447239245077 1.0069447239245077 1.0069447239245077)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0272439195235847 0)
"cameras" SET Transform eulerAngles (-1.9957452266208477 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6309506260245539
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3618781287856618
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17010450412093545
"cameras/drone/drone0" SET Transform localPosition (-0.05548420865442072 -0.10892897936625806 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3551628663278066 1.1110561186748988 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 16 19)
"cameras/drone/drone0" SET Transform localScale (0.9672816142676065 0.9672816142676065 0.9672816142676065)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 20 -17)
"cameras/drone/drone1" SET Transform localScale (1.0958218633835979 1.0958218633835979 1.0958218633835979)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.131456487352812 0)
"cameras" SET Transform eulerAngles (-11.973406196227598 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9445357376280206
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3742466451348556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19321643400927158
"cameras/drone/drone0" SET Transform localPosition (0.767333445193598 -0.1908043117352614 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9070575438838719 0.8593609839920722 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 13 20)
"cameras/drone/drone0" SET Transform localScale (0.9928124100863378 0.9928124100863378 0.9928124100863378)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -15 8)
"cameras/drone/drone1" SET Transform localScale (1.2720730538785898 1.2720730538785898 1.2720730538785898)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3122586097750704 0)
"cameras" SET Transform eulerAngles (13.970431127409384 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3478811692570718
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.871426218141481
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0956029952807283
"cameras/drone/drone0" SET Transform localPosition (0.2565964451035623 0.6917097987546406 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1637300827385781 0.8889790576545027 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 0 -11)
"cameras/drone/drone0" SET Transform localScale (0.6358608434655413 0.6358608434655413 0.6358608434655413)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 15 -4)
"cameras/drone/drone1" SET Transform localScale (1.2541887318236842 1.2541887318236842 1.2541887318236842)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.633290286837221 0)
"cameras" SET Transform eulerAngles (-15.329460017099299 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7003501483045285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.283177216911077
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11517087520375822
"cameras/drone/drone0" SET Transform localPosition (-0.021076147518226396 -0.08670908330130195 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8012827097700419 0.9961254998350874 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 6 17)
"cameras/drone/drone0" SET Transform localScale (0.9188985211540222 0.9188985211540222 0.9188985211540222)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -11 18)
"cameras/drone/drone1" SET Transform localScale (1.114143630425326 1.114143630425326 1.114143630425326)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1429520356959117 0)
"cameras" SET Transform eulerAngles (12.712489355893375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.013878479060025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0767577048712857
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34840126147383743
"cameras/drone/drone0" SET Transform localPosition (0.9853571389983966 0.5606507952764903 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7596467973788708 1.0610973683955798 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -8 18)
"cameras/drone/drone0" SET Transform localScale (1.236633897512087 1.236633897512087 1.236633897512087)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 13 11)
"cameras/drone/drone1" SET Transform localScale (1.4847385476164607 1.4847385476164607 1.4847385476164607)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.469225616676012 0)
"cameras" SET Transform eulerAngles (5.305369646663316 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2911852931925596
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6363598818388723
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25973103220457844
"cameras/drone/drone0" SET Transform localPosition (0.34553351605843363 0.28783758941045084 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0955013131646136 0.9735222400715071 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -14 -9)
"cameras/drone/drone0" SET Transform localScale (1.1882591885869487 1.1882591885869487 1.1882591885869487)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -1 13)
"cameras/drone/drone1" SET Transform localScale (0.7520065181185214 0.7520065181185214 0.7520065181185214)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.830928958864799 0)
"cameras" SET Transform eulerAngles (1.0476754015126204 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5552295757430239
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6740159324357455
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07692708472793802
"cameras/drone/drone0" SET Transform localPosition (0.14498465045493858 0.37911250695984994 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0579000900167161 1.034286360254218 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -18 15)
"cameras/drone/drone0" SET Transform localScale (1.0784168226922288 1.0784168226922288 1.0784168226922288)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -20 3)
"cameras/drone/drone1" SET Transform localScale (1.4739863072166206 1.4739863072166206 1.4739863072166206)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.854000126775626 0)
"cameras" SET Transform eulerAngles (6.631650095258422 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.621890471447862
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8685469323295343
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30146682591300333
"cameras/drone/drone0" SET Transform localPosition (0.5321433541669687 0.16951550650528996 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6900275785611492 1.0816340942780402 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 7 14)
"cameras/drone/drone0" SET Transform localScale (0.6620794937617221 0.6620794937617221 0.6620794937617221)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 17 7)
"cameras/drone/drone1" SET Transform localScale (1.0357310766469774 1.0357310766469774 1.0357310766469774)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.524978158728624 0)
"cameras" SET Transform eulerAngles (12.356291471301915 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5056563137647628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3743803513316728
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22207271919977442
"cameras/drone/drone0" SET Transform localPosition (0.33170186443563776 0.020396606084622848 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9051198144664758 0.8093121330545978 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 2 2)
"cameras/drone/drone0" SET Transform localScale (1.3640165202880525 1.3640165202880525 1.3640165202880525)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 3 10)
"cameras/drone/drone1" SET Transform localScale (0.6525824834449767 0.6525824834449767 0.6525824834449767)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6014856544370906 0)
"cameras" SET Transform eulerAngles (-6.426553523260665 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3334312082301618
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0202634773832888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11914117359512773
"cameras/drone/drone0" SET Transform localPosition (0.944964151451724 0.626425009940883 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.324024024467376 1.2185023663162924 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -3 6)
"cameras/drone/drone0" SET Transform localScale (0.7247986125862286 0.7247986125862286 0.7247986125862286)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 11 -4)
"cameras/drone/drone1" SET Transform localScale (1.2379266698648816 1.2379266698648816 1.2379266698648816)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.357747800213303 0)
"cameras" SET Transform eulerAngles (6.300789750379167 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1519796468443322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.34512786349685
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12952914312322283
"cameras/drone/drone0" SET Transform localPosition (-1.0993421475049205 0.6872558727225238 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9870247670831982 0.9883926104106928 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -13 19)
"cameras/drone/drone0" SET Transform localScale (0.6289184292238545 0.6289184292238545 0.6289184292238545)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 16 -15)
"cameras/drone/drone1" SET Transform localScale (1.2172225681226707 1.2172225681226707 1.2172225681226707)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.720617245660878 0)
"cameras" SET Transform eulerAngles (11.839704072331713 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2904352161609538
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.314282346521153
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22852814973490113
"cameras/drone/drone0" SET Transform localPosition (-0.3421353739000702 -0.017080183723566622 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1479383847927866 0.8558383973548523 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 13 1)
"cameras/drone/drone0" SET Transform localScale (1.2833510239303139 1.2833510239303139 1.2833510239303139)
"cameras/drone/drone1" SET Transform localEulerAngles (7 3 -6)
"cameras/drone/drone1" SET Transform localScale (0.9746360056775047 0.9746360056775047 0.9746360056775047)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8274383958969156 0)
"cameras" SET Transform eulerAngles (-8.98719827763907 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8706040692962251
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7564672171984053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.061146729789054
"cameras/drone/drone0" SET Transform localPosition (1.0171764200648046 -0.21134655215916404 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28434465646000695 0.9804310496438974 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 18 10)
"cameras/drone/drone0" SET Transform localScale (0.7542264656742366 0.7542264656742366 0.7542264656742366)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -19 14)
"cameras/drone/drone1" SET Transform localScale (1.3699730950352809 1.3699730950352809 1.3699730950352809)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3814076836803584 0)
"cameras" SET Transform eulerAngles (-15.337649079420705 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7457942617041792
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2902805722656179
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3791438372642889
"cameras/drone/drone0" SET Transform localPosition (-0.238968426083491 0.26043830115297845 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5997423237069976 1.0132126439779534 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -9 10)
"cameras/drone/drone0" SET Transform localScale (0.7369926727914584 0.7369926727914584 0.7369926727914584)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 15 -3)
"cameras/drone/drone1" SET Transform localScale (0.8624044819758208 0.8624044819758208 0.8624044819758208)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2384498863630693 0)
"cameras" SET Transform eulerAngles (7.457826245911654 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.538137236384006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.289499810353423
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15125432195694205
"cameras/drone/drone0" SET Transform localPosition (0.4614933471066145 0.18979847029960667 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6856045490955897 1.064211408685658 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -5 0)
"cameras/drone/drone0" SET Transform localScale (0.84522555373291 0.84522555373291 0.84522555373291)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 11 4)
"cameras/drone/drone1" SET Transform localScale (0.6955429111859691 0.6955429111859691 0.6955429111859691)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.155995701140899 0)
"cameras" SET Transform eulerAngles (-3.4736123456105794 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7176737102351144
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9254233563024576
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2575997438910295
"cameras/drone/drone0" SET Transform localPosition (-0.7890416122535029 0.29887831905179946 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3682466490729239 1.1345431844076808 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -1 -9)
"cameras/drone/drone0" SET Transform localScale (0.896304007719839 0.896304007719839 0.896304007719839)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -20 -1)
"cameras/drone/drone1" SET Transform localScale (0.7867195980786226 0.7867195980786226 0.7867195980786226)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3145439225655675 0)
"cameras" SET Transform eulerAngles (4.142634188487776 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5179739387214416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8779631559750016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2897228383213174
"cameras/drone/drone0" SET Transform localPosition (0.9113778868019609 0.1268305210964667 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7518846035474444 1.298299678022551 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -18 6)
"cameras/drone/drone0" SET Transform localScale (1.2284763060902733 1.2284763060902733 1.2284763060902733)
"cameras/drone/drone1" SET Transform localEulerAngles (10 7 16)
"cameras/drone/drone1" SET Transform localScale (1.382301590039288 1.382301590039288 1.382301590039288)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.050287992729434 0)
"cameras" SET Transform eulerAngles (7.754521006919731 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5360514319777043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5104300395930768
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18120916868255177
"cameras/drone/drone0" SET Transform localPosition (0.4214987874509799 0.5122563668964009 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7932893843231088 1.1056642064562492 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 6 18)
"cameras/drone/drone0" SET Transform localScale (1.271884207198489 1.271884207198489 1.271884207198489)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 3 19)
"cameras/drone/drone1" SET Transform localScale (0.9992484981331566 0.9992484981331566 0.9992484981331566)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.250322918945479 0)
"cameras" SET Transform eulerAngles (-2.439514146082441 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8876833523619143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6449640335216071
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14269057488564238
"cameras/drone/drone0" SET Transform localPosition (-0.9777995782815672 0.42962506163051345 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0515547282880868 1.2505960704998014 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -1 10)
"cameras/drone/drone0" SET Transform localScale (1.243271807535511 1.243271807535511 1.243271807535511)
"cameras/drone/drone1" SET Transform localEulerAngles (18 2 -4)
"cameras/drone/drone1" SET Transform localScale (0.6231264596481549 0.6231264596481549 0.6231264596481549)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.950919548671852 0)
"cameras" SET Transform eulerAngles (5.894158685492712 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8307767580390645
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1676814346833422
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21569233309661595
"cameras/drone/drone0" SET Transform localPosition (0.4411718991454425 0.4819200198333327 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3440069373952246 0.8607734236283711 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 14 -12)
"cameras/drone/drone0" SET Transform localScale (0.7995488835418866 0.7995488835418866 0.7995488835418866)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 17 -3)
"cameras/drone/drone1" SET Transform localScale (0.8850905419279693 0.8850905419279693 0.8850905419279693)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.412285845441453 0)
"cameras" SET Transform eulerAngles (-3.7328099022689223 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42630384631501334
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2712281665790657
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20740468441752224
"cameras/drone/drone0" SET Transform localPosition (0.03523451628168228 0.27945250486838197 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17329236965346073 1.04905943407328 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -14 -2)
"cameras/drone/drone0" SET Transform localScale (1.0294098216346663 1.0294098216346663 1.0294098216346663)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -19 -20)
"cameras/drone/drone1" SET Transform localScale (0.9875778546901681 0.9875778546901681 0.9875778546901681)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.642442350191231 0)
"cameras" SET Transform eulerAngles (-13.133832225096445 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43384788375714034
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8326170226289709
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0372921476225855
"cameras/drone/drone0" SET Transform localPosition (-0.022095065185365748 0.5848035083149115 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18450631272812945 1.277944542915459 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -7 -14)
"cameras/drone/drone0" SET Transform localScale (1.0531448278792217 1.0531448278792217 1.0531448278792217)
"cameras/drone/drone1" SET Transform localEulerAngles (7 3 0)
"cameras/drone/drone1" SET Transform localScale (0.6548842464739603 0.6548842464739603 0.6548842464739603)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3840267832968225 0)
"cameras" SET Transform eulerAngles (-3.2113983994050557 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5740910161581358
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.062864761497573
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14452614658910212
"cameras/drone/drone0" SET Transform localPosition (0.5328482759800346 0.2839502763878236 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9575742271184292 1.0845469916267763 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -1 -4)
"cameras/drone/drone0" SET Transform localScale (0.932193858807993 0.932193858807993 0.932193858807993)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -10 7)
"cameras/drone/drone1" SET Transform localScale (1.16222232419804 1.16222232419804 1.16222232419804)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.463645382906978 0)
"cameras" SET Transform eulerAngles (-16.450828469600836 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9941369930099908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1746352765612749
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36861407749005715
"cameras/drone/drone0" SET Transform localPosition (-1.1015491873532872 0.5560723689659568 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7855321796605774 0.8822453773405267 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 17 -2)
"cameras/drone/drone0" SET Transform localScale (0.9274359318208227 0.9274359318208227 0.9274359318208227)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -5 16)
"cameras/drone/drone1" SET Transform localScale (1.3980770326248853 1.3980770326248853 1.3980770326248853)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.268824094375936 0)
"cameras" SET Transform eulerAngles (-1.1135427342714586 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9480790640240079
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5475049601267425
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1176910526200321
"cameras/drone/drone0" SET Transform localPosition (1.1439492721073596 0.2034499175963697 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.022053399175587796 0.8020010011824503 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 1 11)
"cameras/drone/drone0" SET Transform localScale (1.113574554942532 1.113574554942532 1.113574554942532)
"cameras/drone/drone1" SET Transform localEulerAngles (6 15 7)
"cameras/drone/drone1" SET Transform localScale (0.9537304275148126 0.9537304275148126 0.9537304275148126)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.267346329066436 0)
"cameras" SET Transform eulerAngles (8.666381648720488 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2668357875210785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5419318989219637
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2717858259168115
"cameras/drone/drone0" SET Transform localPosition (1.0963400610998904 0.027301591451729335 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.088523708454147 1.1749572673692232 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 17 -4)
"cameras/drone/drone0" SET Transform localScale (1.4793657792267 1.4793657792267 1.4793657792267)
"cameras/drone/drone1" SET Transform localEulerAngles (12 10 -18)
"cameras/drone/drone1" SET Transform localScale (0.8761533687911871 0.8761533687911871 0.8761533687911871)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.634721267686257 0)
"cameras" SET Transform eulerAngles (-8.508331407340064 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5876731892505316
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.909029473894785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.014005933670325944
"cameras/drone/drone0" SET Transform localPosition (-0.02149588310322148 0.5914657199183941 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.373032530096864 1.168352044875262 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 11 -19)
"cameras/drone/drone0" SET Transform localScale (0.6604689504969397 0.6604689504969397 0.6604689504969397)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -5 13)
"cameras/drone/drone1" SET Transform localScale (0.7956945344106106 0.7956945344106106 0.7956945344106106)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5262600417326695 0)
"cameras" SET Transform eulerAngles (16.823671103203566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2992846564864449
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2570636455494393
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16825916166226837
"cameras/drone/drone0" SET Transform localPosition (1.0534278579452796 0.09921252904927585 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6649635781245935 1.2127792914233095 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 10 9)
"cameras/drone/drone0" SET Transform localScale (0.9301711235098236 0.9301711235098236 0.9301711235098236)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -10 2)
"cameras/drone/drone1" SET Transform localScale (0.8564357247429768 0.8564357247429768 0.8564357247429768)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.615049871981611 0)
"cameras" SET Transform eulerAngles (11.0184087148251 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5529563082854002
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8750678382345578
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1603650031629328
"cameras/drone/drone0" SET Transform localPosition (-0.20131420309223091 -0.05432268336624818 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7117639576547445 0.9121932438141719 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 11 11)
"cameras/drone/drone0" SET Transform localScale (1.0288981175764391 1.0288981175764391 1.0288981175764391)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 6 -2)
"cameras/drone/drone1" SET Transform localScale (0.997894933144451 0.997894933144451 0.997894933144451)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.828900970123393 0)
"cameras" SET Transform eulerAngles (-3.766791207595567 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8692283727821162
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.673350708087599
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3402067237645454
"cameras/drone/drone0" SET Transform localPosition (-0.5310805843779656 0.6230734745265181 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9217630201119651 0.853727223085954 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -10 -2)
"cameras/drone/drone0" SET Transform localScale (0.9473358430573652 0.9473358430573652 0.9473358430573652)
"cameras/drone/drone1" SET Transform localEulerAngles (5 12 12)
"cameras/drone/drone1" SET Transform localScale (1.2576907831084245 1.2576907831084245 1.2576907831084245)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.397744157777714 0)
"cameras" SET Transform eulerAngles (5.000187501797377 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4354549501786585
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3023861627362185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16273142800262352
"cameras/drone/drone0" SET Transform localPosition (-0.22730665391117577 0.38914947515965564 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6776305264326683 0.9759213134471859 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 5 -13)
"cameras/drone/drone0" SET Transform localScale (1.1790695716676722 1.1790695716676722 1.1790695716676722)
"cameras/drone/drone1" SET Transform localEulerAngles (5 20 -4)
"cameras/drone/drone1" SET Transform localScale (0.6198893810624869 0.6198893810624869 0.6198893810624869)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.47231771909849 0)
"cameras" SET Transform eulerAngles (-0.7505936253184728 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9227807607206276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7684441243683162
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07422043565876067
"cameras/drone/drone0" SET Transform localPosition (-1.0218777505657397 -0.2762535478752722 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3521411141828428 1.0356120177069266 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 6 -18)
"cameras/drone/drone0" SET Transform localScale (1.2540766959295717 1.2540766959295717 1.2540766959295717)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -12 -16)
"cameras/drone/drone1" SET Transform localScale (1.1216108699054197 1.1216108699054197 1.1216108699054197)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2591604031022348 0)
"cameras" SET Transform eulerAngles (-19.08811201262572 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6475244529827305
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.30643312420955
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1291109410574199
"cameras/drone/drone0" SET Transform localPosition (-0.6399254783965294 -0.04802311857388658 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.23890710563570328 0.9688749189104209 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -1 19)
"cameras/drone/drone0" SET Transform localScale (1.0777350929785654 1.0777350929785654 1.0777350929785654)
"cameras/drone/drone1" SET Transform localEulerAngles (0 1 3)
"cameras/drone/drone1" SET Transform localScale (0.9878558001717159 0.9878558001717159 0.9878558001717159)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8573575081138314 0)
"cameras" SET Transform eulerAngles (-4.631210202860583 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0412498211571437
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9633376643540166
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28931528911179427
"cameras/drone/drone0" SET Transform localPosition (0.35252302623496634 0.1380952373762439 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.14699118575304881 0.8293411797515698 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 20 8)
"cameras/drone/drone0" SET Transform localScale (0.7918709826399506 0.7918709826399506 0.7918709826399506)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -3 -14)
"cameras/drone/drone1" SET Transform localScale (0.7055569901618233 0.7055569901618233 0.7055569901618233)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.05871941835614 0)
"cameras" SET Transform eulerAngles (15.842406745043057 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.550170778046025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0405298922494708
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2902252689343539
"cameras/drone/drone0" SET Transform localPosition (1.1951919075921376 0.6070077003498844 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9791607136131095 0.9775522463192574 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 19 14)
"cameras/drone/drone0" SET Transform localScale (1.0989019770667392 1.0989019770667392 1.0989019770667392)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 6 0)
"cameras/drone/drone1" SET Transform localScale (1.1387240507798286 1.1387240507798286 1.1387240507798286)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5688073362324895 0)
"cameras" SET Transform eulerAngles (5.2444384229791865 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9961724281486617
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.977342296881581
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0911476854247288
"cameras/drone/drone0" SET Transform localPosition (0.8549928238680173 0.3208308884546183 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8351626452081107 0.9001239141778706 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -20 -15)
"cameras/drone/drone0" SET Transform localScale (0.67366025657811 0.67366025657811 0.67366025657811)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 13 -17)
"cameras/drone/drone1" SET Transform localScale (0.8124960779835203 0.8124960779835203 0.8124960779835203)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.766258715939546 0)
"cameras" SET Transform eulerAngles (18.05463828802629 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6704484831833214
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2262471907167787
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21752122792226053
"cameras/drone/drone0" SET Transform localPosition (-1.146264094809559 0.5119686078950658 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.028552826648269525 0.9217438704589335 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -4 9)
"cameras/drone/drone0" SET Transform localScale (1.1796867973940395 1.1796867973940395 1.1796867973940395)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -1 -5)
"cameras/drone/drone1" SET Transform localScale (1.22896418126023 1.22896418126023 1.22896418126023)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5540284033714933 0)
"cameras" SET Transform eulerAngles (7.992281850708345 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2314633724806914
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7861320567671535
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29236433173717685
"cameras/drone/drone0" SET Transform localPosition (0.04345181492078609 0.0017686741324664523 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.03153586308321876 1.2852656571565015 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 9 -14)
"cameras/drone/drone0" SET Transform localScale (1.1357077604986667 1.1357077604986667 1.1357077604986667)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -7 18)
"cameras/drone/drone1" SET Transform localScale (0.8053603756970251 0.8053603756970251 0.8053603756970251)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9448918764772243 0)
"cameras" SET Transform eulerAngles (-2.989013630520553 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6080590539316693
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0824322630183212
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16144390301199404
"cameras/drone/drone0" SET Transform localPosition (-0.2522588454802016 -0.011730604332985839 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4447033868046968 1.110313023859241 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -9 19)
"cameras/drone/drone0" SET Transform localScale (1.1229769008775847 1.1229769008775847 1.1229769008775847)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -4 -6)
"cameras/drone/drone1" SET Transform localScale (1.4867486237257026 1.4867486237257026 1.4867486237257026)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8773544987701567 0)
"cameras" SET Transform eulerAngles (13.997867141967049 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6449779078758048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9646108026418583
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23218035865004807
"cameras/drone/drone0" SET Transform localPosition (0.03702579627382918 0.04085856249934622 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7618508537592747 0.8650404555389785 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 3 3)
"cameras/drone/drone0" SET Transform localScale (0.7605720712568684 0.7605720712568684 0.7605720712568684)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 20 -4)
"cameras/drone/drone1" SET Transform localScale (0.6052335032419395 0.6052335032419395 0.6052335032419395)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.744638871083695 0)
"cameras" SET Transform eulerAngles (14.17750752748237 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5573728895066696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.72781805895582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1884746210386708
"cameras/drone/drone0" SET Transform localPosition (-0.42497488057749566 0.3050429735879164 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1345460127000566 0.9503084470210736 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 0 14)
"cameras/drone/drone0" SET Transform localScale (1.2239986406730474 1.2239986406730474 1.2239986406730474)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -2 -15)
"cameras/drone/drone1" SET Transform localScale (1.145053461426089 1.145053461426089 1.145053461426089)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.894712736456329 0)
"cameras" SET Transform eulerAngles (-6.729595127215253 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.52162617169515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5880441199557525
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35878612081951916
"cameras/drone/drone0" SET Transform localPosition (-0.9952495796574152 0.2838504054186208 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21461992616490533 0.9473711890073772 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 14 -13)
"cameras/drone/drone0" SET Transform localScale (0.9400908067970681 0.9400908067970681 0.9400908067970681)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 0 7)
"cameras/drone/drone1" SET Transform localScale (0.8079997876034468 0.8079997876034468 0.8079997876034468)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.224047338535226 0)
"cameras" SET Transform eulerAngles (11.204470453998976 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8613876058894364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7596607515503584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13053041809527302
"cameras/drone/drone0" SET Transform localPosition (0.8557104274117389 0.5532208367629075 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.151188550376412 0.9002471190874916 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 20 20)
"cameras/drone/drone0" SET Transform localScale (0.8030058696953424 0.8030058696953424 0.8030058696953424)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -20 -3)
"cameras/drone/drone1" SET Transform localScale (0.9717309161632601 0.9717309161632601 0.9717309161632601)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.653494586701694 0)
"cameras" SET Transform eulerAngles (-2.5259700047269327 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4570721831989766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3562840971971
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36185794028321133
"cameras/drone/drone0" SET Transform localPosition (0.19041253897638266 -0.0658622316980147 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.10799339194721225 0.8078782396132436 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -2 -5)
"cameras/drone/drone0" SET Transform localScale (1.4302363573403127 1.4302363573403127 1.4302363573403127)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 2 8)
"cameras/drone/drone1" SET Transform localScale (1.2383239304692486 1.2383239304692486 1.2383239304692486)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.727846103234508 0)
"cameras" SET Transform eulerAngles (1.3313784388835899 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8990221321927278
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7798758558528194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37095424531219223
"cameras/drone/drone0" SET Transform localPosition (0.01511802771490367 -0.29343236226349606 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.671051899101039 1.2384336890347327 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -8 -7)
"cameras/drone/drone0" SET Transform localScale (0.6610688050550999 0.6610688050550999 0.6610688050550999)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 2 -17)
"cameras/drone/drone1" SET Transform localScale (1.3118197832399607 1.3118197832399607 1.3118197832399607)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.756473181250338 0)
"cameras" SET Transform eulerAngles (-1.7137611160223827 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.212985418486353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9965710301952514
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35113370608226296
"cameras/drone/drone0" SET Transform localPosition (-0.6598689765434951 0.2507611889193548 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9241812680965492 0.8058430257543212 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 3 -1)
"cameras/drone/drone0" SET Transform localScale (1.04547954696811 1.04547954696811 1.04547954696811)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -7 11)
"cameras/drone/drone1" SET Transform localScale (1.3639514240853532 1.3639514240853532 1.3639514240853532)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8924011599767563 0)
"cameras" SET Transform eulerAngles (-19.231444462158066 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8003712696089973
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2010616471746425
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.298467987593152
"cameras/drone/drone0" SET Transform localPosition (-0.6994236772245785 0.533221573697874 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.35994235686039555 0.8778298757425036 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -17 -15)
"cameras/drone/drone0" SET Transform localScale (0.6184714297774281 0.6184714297774281 0.6184714297774281)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -6 -16)
"cameras/drone/drone1" SET Transform localScale (1.2490653408338703 1.2490653408338703 1.2490653408338703)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1079238819004362 0)
"cameras" SET Transform eulerAngles (-0.2091704039756621 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8937928191608145
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5367548354147735
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14810146185261527
"cameras/drone/drone0" SET Transform localPosition (0.31516055052422964 0.34834996694685544 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.836639739008133 1.2861756179851835 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -14 7)
"cameras/drone/drone0" SET Transform localScale (1.3732710191892052 1.3732710191892052 1.3732710191892052)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -16 6)
"cameras/drone/drone1" SET Transform localScale (1.1467323418364876 1.1467323418364876 1.1467323418364876)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.962190604795516 0)
"cameras" SET Transform eulerAngles (-5.045882938577332 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1346152635147442
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3462685954039035
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09371267567496405
"cameras/drone/drone0" SET Transform localPosition (-0.10159415087564438 0.37437075352437127 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8671954835684184 1.110490879067361 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -19 -3)
"cameras/drone/drone0" SET Transform localScale (0.768890512260261 0.768890512260261 0.768890512260261)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -20 -2)
"cameras/drone/drone1" SET Transform localScale (1.118563418236933 1.118563418236933 1.118563418236933)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.12276030282519 0)
"cameras" SET Transform eulerAngles (-16.340904473379215 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7361871454786029
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7523418530894386
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2182730723679813
"cameras/drone/drone0" SET Transform localPosition (-0.26352063840182127 0.2500587778072954 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.892280752432378 1.1833231279772238 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -13 -10)
"cameras/drone/drone0" SET Transform localScale (1.2959618948904819 1.2959618948904819 1.2959618948904819)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 9 -4)
"cameras/drone/drone1" SET Transform localScale (0.6623586212187024 0.6623586212187024 0.6623586212187024)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1812579591848986 0)
"cameras" SET Transform eulerAngles (-9.48134277034075 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6400787000771287
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9219743552219052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04197397660313702
"cameras/drone/drone0" SET Transform localPosition (-1.1076088528125276 -0.04510252774685647 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6081436437290663 0.9266814058093009 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -3 -17)
"cameras/drone/drone0" SET Transform localScale (0.9820616374165578 0.9820616374165578 0.9820616374165578)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -2 14)
"cameras/drone/drone1" SET Transform localScale (1.3733267260551782 1.3733267260551782 1.3733267260551782)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.264180264995443 0)
"cameras" SET Transform eulerAngles (-18.510729222547432 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5805774207589425
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9241781126980332
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3496778007340596
"cameras/drone/drone0" SET Transform localPosition (0.9278770453511644 0.43839360741026184 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5637092492404651 0.976726682075791 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 3 -2)
"cameras/drone/drone0" SET Transform localScale (1.2614009431987334 1.2614009431987334 1.2614009431987334)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 12 -20)
"cameras/drone/drone1" SET Transform localScale (0.9388460474045619 0.9388460474045619 0.9388460474045619)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9049367747488892 0)
"cameras" SET Transform eulerAngles (-1.0799252318573203 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1064904258299324
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2086324130183415
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10529556681091737
"cameras/drone/drone0" SET Transform localPosition (-0.39296367417351064 -0.1554314604210007 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.29636084604447677 1.1292446194799477 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 10 -3)
"cameras/drone/drone0" SET Transform localScale (1.0770478380722333 1.0770478380722333 1.0770478380722333)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 15 -4)
"cameras/drone/drone1" SET Transform localScale (0.8737081156311752 0.8737081156311752 0.8737081156311752)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.032823367060785 0)
"cameras" SET Transform eulerAngles (0.4759178726685107 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8162031374886266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7449296812973432
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13823977498754406
"cameras/drone/drone0" SET Transform localPosition (-0.2871807466552483 0.07583613308324894 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8307002613468527 1.1612037526884085 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -17 20)
"cameras/drone/drone0" SET Transform localScale (1.2593703027245222 1.2593703027245222 1.2593703027245222)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -20 -12)
"cameras/drone/drone1" SET Transform localScale (1.228766860782645 1.228766860782645 1.228766860782645)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.614378725540194 0)
"cameras" SET Transform eulerAngles (9.710140925770396 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0269519306770731
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0615890198405915
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2743693654581177
"cameras/drone/drone0" SET Transform localPosition (0.5287836792200062 0.5260344551980547 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7208108156570503 1.1834962740495152 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -9 -20)
"cameras/drone/drone0" SET Transform localScale (1.024852889377452 1.024852889377452 1.024852889377452)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -4 19)
"cameras/drone/drone1" SET Transform localScale (0.8449089784753412 0.8449089784753412 0.8449089784753412)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.437122923556393 0)
"cameras" SET Transform eulerAngles (-11.373345781180525 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5329632631354506
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4880697926968707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03152715607615462
"cameras/drone/drone0" SET Transform localPosition (-1.098551925368931 0.15247851604290402 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.690741039879605 0.8135581288425616 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -19 -8)
"cameras/drone/drone0" SET Transform localScale (1.2640690553739322 1.2640690553739322 1.2640690553739322)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -6 14)
"cameras/drone/drone1" SET Transform localScale (1.0340290472153693 1.0340290472153693 1.0340290472153693)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.596709996683756 0)
"cameras" SET Transform eulerAngles (6.6422136619744805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4686798358985852
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9418602039840681
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20447528486400937
"cameras/drone/drone0" SET Transform localPosition (1.012932111358775 0.20997938001720268 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10530978225459964 1.0182019325538905 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -18 -19)
"cameras/drone/drone0" SET Transform localScale (1.260306434857212 1.260306434857212 1.260306434857212)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 3 14)
"cameras/drone/drone1" SET Transform localScale (1.0539456616693634 1.0539456616693634 1.0539456616693634)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.818437294608566 0)
"cameras" SET Transform eulerAngles (-6.25066453743937 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8768238027479299
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0657791328215873
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3997793271466638
"cameras/drone/drone0" SET Transform localPosition (0.811154790122824 0.05609679764104708 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8457511689127188 0.8854739225545458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -18 -11)
"cameras/drone/drone0" SET Transform localScale (1.0034717869496248 1.0034717869496248 1.0034717869496248)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -2 16)
"cameras/drone/drone1" SET Transform localScale (1.0946359811824784 1.0946359811824784 1.0946359811824784)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.311188641343129 0)
"cameras" SET Transform eulerAngles (-0.4489981464477637 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.525650832744141
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8265461412556263
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34691962717523617
"cameras/drone/drone0" SET Transform localPosition (-0.8957015218736368 0.4323227069064434 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7412780577078724 1.198160449267975 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 11 7)
"cameras/drone/drone0" SET Transform localScale (0.9571386546134847 0.9571386546134847 0.9571386546134847)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -13 6)
"cameras/drone/drone1" SET Transform localScale (0.9146922135582 0.9146922135582 0.9146922135582)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.355346471737189 0)
"cameras" SET Transform eulerAngles (13.38389304844653 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2046932274040858
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9575239375597597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0876618337177388
"cameras/drone/drone0" SET Transform localPosition (0.31550360494922214 0.34182171942156553 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5728530271765871 0.9803013287941351 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 3 -8)
"cameras/drone/drone0" SET Transform localScale (0.612633348226807 0.612633348226807 0.612633348226807)
"cameras/drone/drone1" SET Transform localEulerAngles (8 17 -9)
"cameras/drone/drone1" SET Transform localScale (1.1667995798337945 1.1667995798337945 1.1667995798337945)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.186218759304044 0)
"cameras" SET Transform eulerAngles (-1.22357830673036 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.586296818455522
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.642546086554157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30231487952904706
"cameras/drone/drone0" SET Transform localPosition (1.1095083623286228 0.19666336971583037 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9903271117428806 0.9351090006779258 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -19 9)
"cameras/drone/drone0" SET Transform localScale (0.7519917362576575 0.7519917362576575 0.7519917362576575)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -5 -13)
"cameras/drone/drone1" SET Transform localScale (0.9630274408081736 0.9630274408081736 0.9630274408081736)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7361040281341715 0)
"cameras" SET Transform eulerAngles (-9.816265680735142 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.556242355734049
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0912111023096556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2281142017788901
"cameras/drone/drone0" SET Transform localPosition (-0.20823006483451423 0.08234916230076522 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1562069565064002 1.2942749514947165 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -16 2)
"cameras/drone/drone0" SET Transform localScale (0.7446480766139367 0.7446480766139367 0.7446480766139367)
"cameras/drone/drone1" SET Transform localEulerAngles (0 3 0)
"cameras/drone/drone1" SET Transform localScale (0.7952466546779959 0.7952466546779959 0.7952466546779959)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.282202123148573 0)
"cameras" SET Transform eulerAngles (2.1748164427051755 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8774709907657026
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4330664058097529
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17122845417154117
"cameras/drone/drone0" SET Transform localPosition (-1.0140474567472535 0.5443076582606134 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8196908316924854 0.8758827450141435 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 6 17)
"cameras/drone/drone0" SET Transform localScale (1.0206460843429286 1.0206460843429286 1.0206460843429286)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -8 -14)
"cameras/drone/drone1" SET Transform localScale (1.057417350982022 1.057417350982022 1.057417350982022)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
