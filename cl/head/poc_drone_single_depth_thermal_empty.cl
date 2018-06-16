CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
"Segmentation.Profile.instance" PUSH classes "Void" "drone0"
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors
"cameras/segmentation" SET SegmentationCamera transparencyCutout 0
"cameras/segmentation" SET Camera allowMSAA false allowHDR false near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Void->black" "drone0->red"
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "drone0"
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1536 1152 24 "ARGBFloat" "Default"
"cameras/segmentation" SET active true
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera Sensors.RenderCamera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true allowMSAA false 
CREATE RenderTexture 1536 1152 24 "ARGB32" "Default" AS "cameraRGB_RT"
"cameraRGB_RT" SET name "cameras/cameraRGB"
"cameraRGB_RT" EXECUTE @Create
"cameras/cameraRGB" SET Camera targetTexture "cameraRGB_RT"
"cameras/cameraRGB" SET Sensors.RenderCamera format "ARGB32" resolution (1536 1152) alwaysOn false
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB" "cameras/cameraRGB"
"EnviroSky" SET active true
[UI.Window] ShowFromRenderTexture "cameraRGB_RT" AS "cameraRGB"
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
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink outputType "CUSTOM" outputChannels 3 outputPixelSize 4 outputExtension "png"
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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 158 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 27 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 60 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET Transform position (0 30 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/birds/container" SET active true
"spawner/animals/birds" SET active true
CREATE "spawner/cars/container"
"spawner/cars/container" SET active false
"spawner/cars/container" ADD RandomProps.Torus
"spawner/cars/container" ADD RandomProps.PropArea
"spawner/cars/container" SET RandomProps.PropArea tags "car"
"spawner/cars/container" SET RandomProps.PropArea async false numberOfProps 5 collisionCheck false stickToGround false 
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
"cameras" SET Transform eulerAngles (-17.37986200571929 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 46
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.9292386585299472 0)
"cameras" SET Transform eulerAngles (-16.00616812345296 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7473644640250002
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6504182262515639
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23750228447803587
"cameras/drone/drone0" SET Transform localPosition (0.10478525932540528 0.12835164502790447 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.42410389273428806 1.0068909904999692 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 10 4)
"cameras/drone/drone0" SET Transform localScale (0.8784040471723642 0.8784040471723642 0.8784040471723642)
"cameras/drone/drone1" SET Transform localEulerAngles (13 8 0)
"cameras/drone/drone1" SET Transform localScale (0.7904861980069989 0.7904861980069989 0.7904861980069989)
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
"cameras" SET Transform position (0 4.805275597114876 0)
"cameras" SET Transform eulerAngles (-18.943269006887608 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8471961709379154
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9662382986403932
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13686158908188636
"cameras/drone/drone0" SET Transform localPosition (-0.2550517685644519 0.10489857244063766 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1883496362891395 1.0320433464888428 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 10 -11)
"cameras/drone/drone0" SET Transform localScale (0.9197223500595241 0.9197223500595241 0.9197223500595241)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -5 5)
"cameras/drone/drone1" SET Transform localScale (1.4624154246858827 1.4624154246858827 1.4624154246858827)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.369491434344443 0)
"cameras" SET Transform eulerAngles (-12.2037245996396 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3515365214421338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8734403800587827
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.258141876906843
"cameras/drone/drone0" SET Transform localPosition (-0.8495172269973836 -0.24111296189220582 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7318359076131251 1.160602757752685 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -12 19)
"cameras/drone/drone0" SET Transform localScale (1.458058945048784 1.458058945048784 1.458058945048784)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -13 15)
"cameras/drone/drone1" SET Transform localScale (1.059454030236405 1.059454030236405 1.059454030236405)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.121592159752667 0)
"cameras" SET Transform eulerAngles (-6.726722386076158 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3175178806650123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2359847622876416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28104131895819523
"cameras/drone/drone0" SET Transform localPosition (1.0440214220039017 0.21361606639736924 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5077322178303842 1.284006581430714 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -12 16)
"cameras/drone/drone0" SET Transform localScale (1.37365644966078 1.37365644966078 1.37365644966078)
"cameras/drone/drone1" SET Transform localEulerAngles (2 2 -20)
"cameras/drone/drone1" SET Transform localScale (1.3518911991064986 1.3518911991064986 1.3518911991064986)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.102294544714438 0)
"cameras" SET Transform eulerAngles (-11.18857738434861 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5455264834548195
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.278480080181057
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1859484401694226
"cameras/drone/drone0" SET Transform localPosition (-0.2992291227154811 -0.1899700054156383 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4808177706195984 1.1552949777435264 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -1 -14)
"cameras/drone/drone0" SET Transform localScale (0.6978358328314928 0.6978358328314928 0.6978358328314928)
"cameras/drone/drone1" SET Transform localEulerAngles (5 19 -2)
"cameras/drone/drone1" SET Transform localScale (1.448691134732651 1.448691134732651 1.448691134732651)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.42135943350804 0)
"cameras" SET Transform eulerAngles (-2.8561503313869316 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1619115136606748
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4025709223474838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.003130818422173576
"cameras/drone/drone0" SET Transform localPosition (-0.08462912511735143 0.21845084882568527 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4257481057959791 1.2595848529766747 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 6 -12)
"cameras/drone/drone0" SET Transform localScale (1.0667519340518066 1.0667519340518066 1.0667519340518066)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -11 11)
"cameras/drone/drone1" SET Transform localScale (0.875617216228216 0.875617216228216 0.875617216228216)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.306809002341706 0)
"cameras" SET Transform eulerAngles (16.654840156284195 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3336602273847733
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7514483632100246
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.017773802047797504
"cameras/drone/drone0" SET Transform localPosition (1.122669902377621 0.18954870616547165 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9084478852974032 0.8050061605039848 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 12 18)
"cameras/drone/drone0" SET Transform localScale (1.3381073919066926 1.3381073919066926 1.3381073919066926)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -10 2)
"cameras/drone/drone1" SET Transform localScale (1.108686256861991 1.108686256861991 1.108686256861991)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.499753487406111 0)
"cameras" SET Transform eulerAngles (16.877068907540043 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.219989794507161
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5150639274005528
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11819388658461749
"cameras/drone/drone0" SET Transform localPosition (0.763310292716014 0.20551596578932102 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7915831790240291 1.0244435680463395 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -14 -8)
"cameras/drone/drone0" SET Transform localScale (1.373229375168478 1.373229375168478 1.373229375168478)
"cameras/drone/drone1" SET Transform localEulerAngles (13 10 7)
"cameras/drone/drone1" SET Transform localScale (1.4133547901270633 1.4133547901270633 1.4133547901270633)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.973097423840043 0)
"cameras" SET Transform eulerAngles (-13.260182450154554 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.339749358801601
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7624984615181003
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32449501079670573
"cameras/drone/drone0" SET Transform localPosition (0.34847025943908383 0.5644431682842037 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1505782521823524 0.823491308836776 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -11 4)
"cameras/drone/drone0" SET Transform localScale (0.7819369018874168 0.7819369018874168 0.7819369018874168)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 14 20)
"cameras/drone/drone1" SET Transform localScale (0.7118683431158609 0.7118683431158609 0.7118683431158609)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.371202145433359 0)
"cameras" SET Transform eulerAngles (17.011436221871605 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4060539411660833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5601815502197869
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19463333757864767
"cameras/drone/drone0" SET Transform localPosition (-0.07300219500466576 0.39898392845875325 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06692202027432836 1.1147126910555072 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 16 17)
"cameras/drone/drone0" SET Transform localScale (0.7224092679060256 0.7224092679060256 0.7224092679060256)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -7 -1)
"cameras/drone/drone1" SET Transform localScale (1.2691305140989622 1.2691305140989622 1.2691305140989622)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0687790547139917 0)
"cameras" SET Transform eulerAngles (12.579001148013482 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5628054379609337
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4596271526757494
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22037709452291188
"cameras/drone/drone0" SET Transform localPosition (0.9019643106999287 -0.11985348194446349 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.05925901473634365 0.9656853023238574 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 15 6)
"cameras/drone/drone0" SET Transform localScale (1.4347723117010043 1.4347723117010043 1.4347723117010043)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -7 17)
"cameras/drone/drone1" SET Transform localScale (0.9356686669941066 0.9356686669941066 0.9356686669941066)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.126630605027472 0)
"cameras" SET Transform eulerAngles (6.658324375855642 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49342704881428123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7355513934056486
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3365117669751474
"cameras/drone/drone0" SET Transform localPosition (0.970877939528392 -0.22673267566243566 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1487890097387974 1.1254428535242074 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 17 -8)
"cameras/drone/drone0" SET Transform localScale (1.231236383715031 1.231236383715031 1.231236383715031)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 11 8)
"cameras/drone/drone1" SET Transform localScale (1.1580940973323006 1.1580940973323006 1.1580940973323006)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.853898246724795 0)
"cameras" SET Transform eulerAngles (12.034806864197883 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7985046562340922
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5187014269667976
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.005878983980040254
"cameras/drone/drone0" SET Transform localPosition (0.8736374875702075 -0.022438160744833124 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8922011672568126 0.8919109859127219 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -15 1)
"cameras/drone/drone0" SET Transform localScale (1.346721764119899 1.346721764119899 1.346721764119899)
"cameras/drone/drone1" SET Transform localEulerAngles (2 13 -6)
"cameras/drone/drone1" SET Transform localScale (0.7799356547617665 0.7799356547617665 0.7799356547617665)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.122579939735361 0)
"cameras" SET Transform eulerAngles (4.309437723181901 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9212040078805984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3772415497318484
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2786655910222901
"cameras/drone/drone0" SET Transform localPosition (0.053680780555306784 -0.2469107344510894 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.562375598262369 1.2541990724360543 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -18 5)
"cameras/drone/drone0" SET Transform localScale (0.6838741733733694 0.6838741733733694 0.6838741733733694)
"cameras/drone/drone1" SET Transform localEulerAngles (5 14 -11)
"cameras/drone/drone1" SET Transform localScale (0.7998025477452574 0.7998025477452574 0.7998025477452574)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.477769596901915 0)
"cameras" SET Transform eulerAngles (17.42458029733414 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5655735769736069
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5811766252342645
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37114146224086086
"cameras/drone/drone0" SET Transform localPosition (-1.1956559664125463 0.4901860633550223 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1951289714126487 1.187029340054363 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 15 -10)
"cameras/drone/drone0" SET Transform localScale (1.3757790050181593 1.3757790050181593 1.3757790050181593)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 15 -3)
"cameras/drone/drone1" SET Transform localScale (0.7843294038453877 0.7843294038453877 0.7843294038453877)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.512639028385072 0)
"cameras" SET Transform eulerAngles (15.473716229017477 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.072071972261373
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4585720244709173
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0951089817708247
"cameras/drone/drone0" SET Transform localPosition (-1.0288767262296477 0.6193153369157531 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1801559540136017 1.0885608735090617 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 20 11)
"cameras/drone/drone0" SET Transform localScale (0.6615073491233111 0.6615073491233111 0.6615073491233111)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -9 -6)
"cameras/drone/drone1" SET Transform localScale (1.3898177324110934 1.3898177324110934 1.3898177324110934)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1546404289874745 0)
"cameras" SET Transform eulerAngles (-3.567685521801586 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7373545776154906
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5687999095362557
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0707571183613775
"cameras/drone/drone0" SET Transform localPosition (1.0910598753091942 0.46331854489390406 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23196517030063246 0.8286800377550313 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 2 20)
"cameras/drone/drone0" SET Transform localScale (0.622505022090259 0.622505022090259 0.622505022090259)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -3 -19)
"cameras/drone/drone1" SET Transform localScale (1.4514213049227749 1.4514213049227749 1.4514213049227749)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.239103485822013 0)
"cameras" SET Transform eulerAngles (2.4375688683305263 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7745414090206582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.696713221594965
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3985709667040007
"cameras/drone/drone0" SET Transform localPosition (-0.7623470050420664 0.4684123140647615 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7294640215361354 1.066157173476801 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -1 12)
"cameras/drone/drone0" SET Transform localScale (0.9429500003634381 0.9429500003634381 0.9429500003634381)
"cameras/drone/drone1" SET Transform localEulerAngles (14 19 -9)
"cameras/drone/drone1" SET Transform localScale (0.9834625236690395 0.9834625236690395 0.9834625236690395)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.350828527018387 0)
"cameras" SET Transform eulerAngles (-2.4288891875511 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5173733521054809
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.634189690580428
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12307701170663742
"cameras/drone/drone0" SET Transform localPosition (1.1535411538885156 0.25413003933627937 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8580588089017882 1.1351522174109663 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -18 -6)
"cameras/drone/drone0" SET Transform localScale (0.8651858305785871 0.8651858305785871 0.8651858305785871)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -13 10)
"cameras/drone/drone1" SET Transform localScale (1.1430525936460236 1.1430525936460236 1.1430525936460236)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.870070492012465 0)
"cameras" SET Transform eulerAngles (-13.563649468608435 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5607350299499116
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.187843836007839
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36731113149742284
"cameras/drone/drone0" SET Transform localPosition (0.09655178718687529 0.21790252516408765 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8897201996537327 1.2224999003157861 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -17 1)
"cameras/drone/drone0" SET Transform localScale (1.3036696349022914 1.3036696349022914 1.3036696349022914)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -10 -4)
"cameras/drone/drone1" SET Transform localScale (1.4988839747713878 1.4988839747713878 1.4988839747713878)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.361586975705368 0)
"cameras" SET Transform eulerAngles (-10.175657771573011 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9771149762334908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.319709667452265
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38630475097285655
"cameras/drone/drone0" SET Transform localPosition (1.1342357038694606 0.02658929652883185 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6150465949764483 1.130296093207942 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -10 -7)
"cameras/drone/drone0" SET Transform localScale (0.9033586280765649 0.9033586280765649 0.9033586280765649)
"cameras/drone/drone1" SET Transform localEulerAngles (18 12 8)
"cameras/drone/drone1" SET Transform localScale (1.1075271666176376 1.1075271666176376 1.1075271666176376)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8414391874325844 0)
"cameras" SET Transform eulerAngles (-3.772728147375691 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8841634186254389
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8578236443610097
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3337533324954817
"cameras/drone/drone0" SET Transform localPosition (0.32122011379131465 0.4964226205978433 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.38269334012831746 1.2259891778589025 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -12 -14)
"cameras/drone/drone0" SET Transform localScale (0.9101172924965046 0.9101172924965046 0.9101172924965046)
"cameras/drone/drone1" SET Transform localEulerAngles (3 13 2)
"cameras/drone/drone1" SET Transform localScale (0.6017473274041476 0.6017473274041476 0.6017473274041476)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.642639692065833 0)
"cameras" SET Transform eulerAngles (3.991503385788249 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5476789489675165
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9111593045537698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24010005982606697
"cameras/drone/drone0" SET Transform localPosition (0.8430653737568707 0.5443915847988485 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.171438298215713 1.2858086153037782 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -16 12)
"cameras/drone/drone0" SET Transform localScale (0.675632268889781 0.675632268889781 0.675632268889781)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 8 6)
"cameras/drone/drone1" SET Transform localScale (1.0965335052357874 1.0965335052357874 1.0965335052357874)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6924785103372604 0)
"cameras" SET Transform eulerAngles (12.3165323564345 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9723934237664833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.459114946721304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.004287232483179526
"cameras/drone/drone0" SET Transform localPosition (0.926406845762475 0.39784728087156634 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7065324131360926 1.2055400579644675 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -9 16)
"cameras/drone/drone0" SET Transform localScale (1.3565296375586002 1.3565296375586002 1.3565296375586002)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 12 18)
"cameras/drone/drone1" SET Transform localScale (1.0360532324773022 1.0360532324773022 1.0360532324773022)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.672205479654518 0)
"cameras" SET Transform eulerAngles (-9.407220772725445 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6923936462138756
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6044994551595884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18557653834274263
"cameras/drone/drone0" SET Transform localPosition (0.9789734667472547 0.42496300720584207 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0976542997783614 1.275084121258322 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -19 13)
"cameras/drone/drone0" SET Transform localScale (0.6067899069620546 0.6067899069620546 0.6067899069620546)
"cameras/drone/drone1" SET Transform localEulerAngles (8 0 5)
"cameras/drone/drone1" SET Transform localScale (0.8972498637848628 0.8972498637848628 0.8972498637848628)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.157420342059334 0)
"cameras" SET Transform eulerAngles (17.628554267523462 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2494922278092302
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1250079357002247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20606154519865522
"cameras/drone/drone0" SET Transform localPosition (-0.23836549676051944 0.5177413181052484 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1853628754254473 1.1960169131051124 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -14 0)
"cameras/drone/drone0" SET Transform localScale (1.0232532244373826 1.0232532244373826 1.0232532244373826)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -11 -12)
"cameras/drone/drone1" SET Transform localScale (1.0858599948532421 1.0858599948532421 1.0858599948532421)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.858586468412955 0)
"cameras" SET Transform eulerAngles (-4.140869430881974 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7676778069666794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7498838758489201
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04194991254561131
"cameras/drone/drone0" SET Transform localPosition (-0.8291979225651249 0.30875713812027833 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9519889557420875 1.1051514500515314 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 13 -13)
"cameras/drone/drone0" SET Transform localScale (0.6215471341012713 0.6215471341012713 0.6215471341012713)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 8 2)
"cameras/drone/drone1" SET Transform localScale (1.0148498383618825 1.0148498383618825 1.0148498383618825)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9896524436453022 0)
"cameras" SET Transform eulerAngles (13.849353816165333 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1729690926403353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0698010637234436
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02878457077843706
"cameras/drone/drone0" SET Transform localPosition (0.08033525935321206 0.3965534691117239 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2714070269372454 0.9894143885047845 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 9 -18)
"cameras/drone/drone0" SET Transform localScale (0.8372528919226401 0.8372528919226401 0.8372528919226401)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 1 -14)
"cameras/drone/drone1" SET Transform localScale (0.7432938270051869 0.7432938270051869 0.7432938270051869)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.150674525850224 0)
"cameras" SET Transform eulerAngles (-14.37114204454733 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6532560304065576
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.646482212660758
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07496440333562733
"cameras/drone/drone0" SET Transform localPosition (0.17931785527325594 0.027029346213609473 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8904735563112383 0.8421097010428206 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 17 -8)
"cameras/drone/drone0" SET Transform localScale (0.7833204259765071 0.7833204259765071 0.7833204259765071)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -3 4)
"cameras/drone/drone1" SET Transform localScale (1.4657626277961198 1.4657626277961198 1.4657626277961198)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.239699884780641 0)
"cameras" SET Transform eulerAngles (10.33788671735477 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.752341411418616
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.92389874102697
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1037945286680345
"cameras/drone/drone0" SET Transform localPosition (0.3984344477253625 0.5160422261951538 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.127176354145085 1.035581642670754 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -7 9)
"cameras/drone/drone0" SET Transform localScale (0.9872859948673263 0.9872859948673263 0.9872859948673263)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -6 -20)
"cameras/drone/drone1" SET Transform localScale (1.3916661568099307 1.3916661568099307 1.3916661568099307)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.172484602009522 0)
"cameras" SET Transform eulerAngles (3.5769820825166967 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7964310286622194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5847262114828382
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13324751778511557
"cameras/drone/drone0" SET Transform localPosition (1.1405319177551625 0.024405119090424365 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.39930608357738806 1.1210775606704442 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -13 -2)
"cameras/drone/drone0" SET Transform localScale (1.251542040269198 1.251542040269198 1.251542040269198)
"cameras/drone/drone1" SET Transform localEulerAngles (6 18 7)
"cameras/drone/drone1" SET Transform localScale (0.6829342318265303 0.6829342318265303 0.6829342318265303)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1935186956995825 0)
"cameras" SET Transform eulerAngles (-12.416436152437536 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3172905753729955
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7339643901303328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06200708468627561
"cameras/drone/drone0" SET Transform localPosition (0.2385422415652112 -0.16451537178815306 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4920069281134105 1.2606761505740485 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -18 1)
"cameras/drone/drone0" SET Transform localScale (1.4622922129212617 1.4622922129212617 1.4622922129212617)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 17 3)
"cameras/drone/drone1" SET Transform localScale (0.845586540782641 0.845586540782641 0.845586540782641)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4041811765242147 0)
"cameras" SET Transform eulerAngles (1.0723301763952797 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1364093342353556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4437224738589904
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06811644286730277
"cameras/drone/drone0" SET Transform localPosition (-0.6643296521577489 -0.2688988897323425 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.020922980519351153 1.277213101484938 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 4 11)
"cameras/drone/drone0" SET Transform localScale (0.7701095345697397 0.7701095345697397 0.7701095345697397)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -14 1)
"cameras/drone/drone1" SET Transform localScale (1.2555639909765068 1.2555639909765068 1.2555639909765068)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.500913584372174 0)
"cameras" SET Transform eulerAngles (-16.830052024352106 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1092886195952625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2691136795006894
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10507377930034925
"cameras/drone/drone0" SET Transform localPosition (-0.4839713987480342 -0.008377832890357595 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10918021832260805 1.23683148687992 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -7 3)
"cameras/drone/drone0" SET Transform localScale (0.7760954673681851 0.7760954673681851 0.7760954673681851)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -20 -14)
"cameras/drone/drone1" SET Transform localScale (0.6936481833471158 0.6936481833471158 0.6936481833471158)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2715186488606784 0)
"cameras" SET Transform eulerAngles (11.224432567542518 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6017488112544975
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9651412535607546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23968233603195835
"cameras/drone/drone0" SET Transform localPosition (0.9630355802003836 0.09927881957492984 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8883738026038526 1.2117912626524712 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 8 19)
"cameras/drone/drone0" SET Transform localScale (1.4186664277516126 1.4186664277516126 1.4186664277516126)
"cameras/drone/drone1" SET Transform localEulerAngles (0 7 0)
"cameras/drone/drone1" SET Transform localScale (1.2092144249806989 1.2092144249806989 1.2092144249806989)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.137797617676349 0)
"cameras" SET Transform eulerAngles (-16.598133015944075 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9332822378492285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.718452576440391
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30460324013771073
"cameras/drone/drone0" SET Transform localPosition (-0.5126100319959771 -0.10125054242367931 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0648972072512073 1.0959969763230675 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -15 15)
"cameras/drone/drone0" SET Transform localScale (1.4062093305806576 1.4062093305806576 1.4062093305806576)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 15 19)
"cameras/drone/drone1" SET Transform localScale (0.7202414819810549 0.7202414819810549 0.7202414819810549)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.670722600471356 0)
"cameras" SET Transform eulerAngles (-13.102841819194806 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.926735114539672
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.365747949082673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2361175433072361
"cameras/drone/drone0" SET Transform localPosition (-0.4659998292808668 -0.0017357615215373712 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1880217274396523 0.9091450160573433 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -18 13)
"cameras/drone/drone0" SET Transform localScale (0.8681746351177322 0.8681746351177322 0.8681746351177322)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -13 -1)
"cameras/drone/drone1" SET Transform localScale (1.067886119276244 1.067886119276244 1.067886119276244)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.385114020617302 0)
"cameras" SET Transform eulerAngles (-15.86724289306602 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.214620141476403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.063408764876518
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3516213109910302
"cameras/drone/drone0" SET Transform localPosition (-1.1612135888850172 0.5075556871177478 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3017391432684403 1.1255138861922414 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -8 6)
"cameras/drone/drone0" SET Transform localScale (1.1753936508466554 1.1753936508466554 1.1753936508466554)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -8 20)
"cameras/drone/drone1" SET Transform localScale (0.9903375518332793 0.9903375518332793 0.9903375518332793)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.76833805039559 0)
"cameras" SET Transform eulerAngles (19.134517769004596 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6893352066176728
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.743531704982845
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09011769684286289
"cameras/drone/drone0" SET Transform localPosition (0.729581910816335 -0.2731905922696433 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.24851282011701403 0.8880082473547918 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 6 -17)
"cameras/drone/drone0" SET Transform localScale (1.4444682458590878 1.4444682458590878 1.4444682458590878)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 6 5)
"cameras/drone/drone1" SET Transform localScale (0.634803491980318 0.634803491980318 0.634803491980318)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.250437476903526 0)
"cameras" SET Transform eulerAngles (-3.565598033377295 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3676733148807525
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9239446866268207
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38773379051789686
"cameras/drone/drone0" SET Transform localPosition (0.8302448426163613 0.6642665691444973 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11148109811521545 0.9929048876738922 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 3 12)
"cameras/drone/drone0" SET Transform localScale (0.8891574648030175 0.8891574648030175 0.8891574648030175)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -16 -11)
"cameras/drone/drone1" SET Transform localScale (1.4726775109998207 1.4726775109998207 1.4726775109998207)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.593124492377843 0)
"cameras" SET Transform eulerAngles (-13.530180739011964 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0342967590843926
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.934435026784395
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.020211679763918734
"cameras/drone/drone0" SET Transform localPosition (-0.8890146197919446 -0.10288866742562913 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3051140584890919 1.061907316574135 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -4 -14)
"cameras/drone/drone0" SET Transform localScale (1.4101597113054816 1.4101597113054816 1.4101597113054816)
"cameras/drone/drone1" SET Transform localEulerAngles (12 3 10)
"cameras/drone/drone1" SET Transform localScale (0.8375885316074384 0.8375885316074384 0.8375885316074384)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6229539201744583 0)
"cameras" SET Transform eulerAngles (7.409469158106749 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2746240190047655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4248021974047784
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3059802203867701
"cameras/drone/drone0" SET Transform localPosition (0.7828439379964893 -0.004687221321093726 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2567156262479444 0.9644388033481068 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -1 12)
"cameras/drone/drone0" SET Transform localScale (1.0810129309459007 1.0810129309459007 1.0810129309459007)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -18 -9)
"cameras/drone/drone1" SET Transform localScale (1.2501889233867156 1.2501889233867156 1.2501889233867156)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.526390282775273 0)
"cameras" SET Transform eulerAngles (-15.695014335725187 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6113358385278681
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2219353593733029
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05276551587299774
"cameras/drone/drone0" SET Transform localPosition (1.064723705717148 -0.2769481703227072 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9719301393045691 1.178947030578137 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 14 -1)
"cameras/drone/drone0" SET Transform localScale (1.0067916646604775 1.0067916646604775 1.0067916646604775)
"cameras/drone/drone1" SET Transform localEulerAngles (2 1 16)
"cameras/drone/drone1" SET Transform localScale (1.4052439567599468 1.4052439567599468 1.4052439567599468)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7743143655772338 0)
"cameras" SET Transform eulerAngles (12.417740883031769 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0004662808190985
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1371175643309175
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2768632300988975
"cameras/drone/drone0" SET Transform localPosition (-0.05031117470613178 -0.2455142182230145 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3021345626112497 1.021608735587385 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 16 11)
"cameras/drone/drone0" SET Transform localScale (0.7731865215808833 0.7731865215808833 0.7731865215808833)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 13 7)
"cameras/drone/drone1" SET Transform localScale (0.6471149540485795 0.6471149540485795 0.6471149540485795)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.462865846047457 0)
"cameras" SET Transform eulerAngles (-3.9224738696761676 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6306439312585572
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9589038685915146
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06419680894770363
"cameras/drone/drone0" SET Transform localPosition (-0.45568438041604875 0.5683179362163957 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7294677904595139 1.1453009774946443 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -1 14)
"cameras/drone/drone0" SET Transform localScale (0.7428702530221847 0.7428702530221847 0.7428702530221847)
"cameras/drone/drone1" SET Transform localEulerAngles (1 3 -5)
"cameras/drone/drone1" SET Transform localScale (0.877320511269128 0.877320511269128 0.877320511269128)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.688457809143012 0)
"cameras" SET Transform eulerAngles (-4.6691461339124185 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.010840885039404
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6288757335579849
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09086699139705293
"cameras/drone/drone0" SET Transform localPosition (-0.7150915226292403 -0.07268573204575851 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4821010546196862 1.2324155144163194 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 19 13)
"cameras/drone/drone0" SET Transform localScale (1.2710684963196006 1.2710684963196006 1.2710684963196006)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 0 14)
"cameras/drone/drone1" SET Transform localScale (1.3031081463619456 1.3031081463619456 1.3031081463619456)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.116441563627388 0)
"cameras" SET Transform eulerAngles (-16.82386922203891 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.455285274740628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.288900517387722
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04794733041951056
"cameras/drone/drone0" SET Transform localPosition (0.9450684058691807 0.465152977492936 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.05091782385397292 1.1903662463762619 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -17 4)
"cameras/drone/drone0" SET Transform localScale (1.0546257027223693 1.0546257027223693 1.0546257027223693)
"cameras/drone/drone1" SET Transform localEulerAngles (7 14 13)
"cameras/drone/drone1" SET Transform localScale (0.751434675086663 0.751434675086663 0.751434675086663)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.504408212981467 0)
"cameras" SET Transform eulerAngles (-16.04298353342871 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7977154440221185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4001939562076584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22510144974189422
"cameras/drone/drone0" SET Transform localPosition (-1.0076105944646818 -0.21159818969492322 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0773677312301444 1.2042854911172372 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 11 9)
"cameras/drone/drone0" SET Transform localScale (1.2975792412292149 1.2975792412292149 1.2975792412292149)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 0 15)
"cameras/drone/drone1" SET Transform localScale (0.763524580318627 0.763524580318627 0.763524580318627)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.153448406078033 0)
"cameras" SET Transform eulerAngles (-1.0854119279674705 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.235718430901601
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.229006697760743
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06484408730667468
"cameras/drone/drone0" SET Transform localPosition (0.9994364990372391 -0.28041806177312795 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37263052589613166 1.2475647941178514 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 1 -18)
"cameras/drone/drone0" SET Transform localScale (1.0199531322004525 1.0199531322004525 1.0199531322004525)
"cameras/drone/drone1" SET Transform localEulerAngles (20 9 -9)
"cameras/drone/drone1" SET Transform localScale (1.4264987256629942 1.4264987256629942 1.4264987256629942)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.802002623404146 0)
"cameras" SET Transform eulerAngles (3.9505810764939895 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3130236228961993
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7221583544395411
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28997549891140934
"cameras/drone/drone0" SET Transform localPosition (-0.5516879353658543 -0.026773473350125754 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5856894360393594 1.187780791406333 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 4 -13)
"cameras/drone/drone0" SET Transform localScale (1.2912917686280951 1.2912917686280951 1.2912917686280951)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -9 0)
"cameras/drone/drone1" SET Transform localScale (1.3020492280172669 1.3020492280172669 1.3020492280172669)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.928977632804379 0)
"cameras" SET Transform eulerAngles (16.25304008305357 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5672963663804325
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6171828697402102
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31665676388435204
"cameras/drone/drone0" SET Transform localPosition (0.9708632323492072 0.4839420449900101 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7178595020014422 0.8378914912533493 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 12 20)
"cameras/drone/drone0" SET Transform localScale (1.3622933199078613 1.3622933199078613 1.3622933199078613)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 11 11)
"cameras/drone/drone1" SET Transform localScale (1.2982360103990551 1.2982360103990551 1.2982360103990551)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.144458902277477 0)
"cameras" SET Transform eulerAngles (6.318055534734018 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5271964011980735
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.805861181411629
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.020188169013033178
"cameras/drone/drone0" SET Transform localPosition (-0.5350268717721426 0.0003395497367743583 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7616156135568368 0.8678652834982832 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -20 5)
"cameras/drone/drone0" SET Transform localScale (0.8697955516288864 0.8697955516288864 0.8697955516288864)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 12 15)
"cameras/drone/drone1" SET Transform localScale (1.3658013014006423 1.3658013014006423 1.3658013014006423)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7749090788805137 0)
"cameras" SET Transform eulerAngles (3.6970845895867477 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5056738987536133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7413833300361738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38617193536970085
"cameras/drone/drone0" SET Transform localPosition (0.5259444797694715 -0.06875310087404335 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08407770350346011 1.1209452374440956 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -17 -8)
"cameras/drone/drone0" SET Transform localScale (1.2264094158963728 1.2264094158963728 1.2264094158963728)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -12 -17)
"cameras/drone/drone1" SET Transform localScale (0.6515784570534238 0.6515784570534238 0.6515784570534238)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0353148344258267 0)
"cameras" SET Transform eulerAngles (16.556485316426325 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6893583461245157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2311022042828579
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0055550681646225454
"cameras/drone/drone0" SET Transform localPosition (-0.22056812665193937 0.40468457305616307 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18618879304444613 0.8435548438206402 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 13 -4)
"cameras/drone/drone0" SET Transform localScale (0.6591275512350325 0.6591275512350325 0.6591275512350325)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 17 0)
"cameras/drone/drone1" SET Transform localScale (1.36931514202506 1.36931514202506 1.36931514202506)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.659248841858934 0)
"cameras" SET Transform eulerAngles (-3.203396296653164 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0172820944727796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0235115190365776
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.023553827593248356
"cameras/drone/drone0" SET Transform localPosition (-0.3740678087323335 -0.0374209224278052 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4268173160636751 0.9572876797843444 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -7 13)
"cameras/drone/drone0" SET Transform localScale (0.718697817352006 0.718697817352006 0.718697817352006)
"cameras/drone/drone1" SET Transform localEulerAngles (16 20 -17)
"cameras/drone/drone1" SET Transform localScale (0.6975008389945329 0.6975008389945329 0.6975008389945329)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.977315813725683 0)
"cameras" SET Transform eulerAngles (7.107490821494839 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2925918415808972
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.599398883881704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39426945812349085
"cameras/drone/drone0" SET Transform localPosition (-1.1335027207943054 0.08969492713295907 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9041267888416407 1.1599763537908188 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 16 -15)
"cameras/drone/drone0" SET Transform localScale (0.7212904661547301 0.7212904661547301 0.7212904661547301)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 1 -9)
"cameras/drone/drone1" SET Transform localScale (1.427506610756026 1.427506610756026 1.427506610756026)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8487419968901793 0)
"cameras" SET Transform eulerAngles (6.835648399038821 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1154067525546076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7319732785771107
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.017617235043230785
"cameras/drone/drone0" SET Transform localPosition (-0.6632423959979575 -0.005739931651940033 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6258030603603372 1.293877446488869 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 11 -8)
"cameras/drone/drone0" SET Transform localScale (0.9237307072076455 0.9237307072076455 0.9237307072076455)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -10 6)
"cameras/drone/drone1" SET Transform localScale (1.434442966479054 1.434442966479054 1.434442966479054)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2545763679069175 0)
"cameras" SET Transform eulerAngles (-15.128941877509895 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.005074208270333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9572928351663692
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03646978844827684
"cameras/drone/drone0" SET Transform localPosition (-0.49591772592764105 0.18257327398928097 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5066172519626352 0.8706280065556857 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -16 9)
"cameras/drone/drone0" SET Transform localScale (0.8939505674931361 0.8939505674931361 0.8939505674931361)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -2 -2)
"cameras/drone/drone1" SET Transform localScale (1.0962006632895172 1.0962006632895172 1.0962006632895172)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.733582417943034 0)
"cameras" SET Transform eulerAngles (4.84868328725495 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8557899327993488
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8794215583512717
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1511174932769499
"cameras/drone/drone0" SET Transform localPosition (1.1759388751415638 0.6709335394265086 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08219123779259307 0.9715359270396466 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 18 -2)
"cameras/drone/drone0" SET Transform localScale (1.2513758645802442 1.2513758645802442 1.2513758645802442)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 6 10)
"cameras/drone/drone1" SET Transform localScale (0.7557996385851103 0.7557996385851103 0.7557996385851103)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.754712238992406 0)
"cameras" SET Transform eulerAngles (5.903618663205528 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5953766463092792
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6544019055538124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02398124867920335
"cameras/drone/drone0" SET Transform localPosition (-0.3950477864082461 0.19416707411449424 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.43129053953298824 1.1420036582985624 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 5 14)
"cameras/drone/drone0" SET Transform localScale (0.7902424925492874 0.7902424925492874 0.7902424925492874)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 2 -2)
"cameras/drone/drone1" SET Transform localScale (0.6875850014351077 0.6875850014351077 0.6875850014351077)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4488430034016657 0)
"cameras" SET Transform eulerAngles (10.426261334296566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1210825261546926
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7513747104289348
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09526228313873247
"cameras/drone/drone0" SET Transform localPosition (-0.03519650425999288 0.22819983237989777 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.06863639983557457 0.9243421183866534 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -15 -18)
"cameras/drone/drone0" SET Transform localScale (0.8945600051698253 0.8945600051698253 0.8945600051698253)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -7 -6)
"cameras/drone/drone1" SET Transform localScale (0.9844701349941403 0.9844701349941403 0.9844701349941403)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8787646515270873 0)
"cameras" SET Transform eulerAngles (15.599857519285301 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8225428671768042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9761569154787838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25167382510105607
"cameras/drone/drone0" SET Transform localPosition (1.0736069189070878 0.4555584222809797 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0649042830517235 1.297741760444393 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -13 2)
"cameras/drone/drone0" SET Transform localScale (0.9031073586964762 0.9031073586964762 0.9031073586964762)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 11 -3)
"cameras/drone/drone1" SET Transform localScale (0.8141521729291243 0.8141521729291243 0.8141521729291243)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6640823009518613 0)
"cameras" SET Transform eulerAngles (7.410493577148483 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3503130183631402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7865618389402396
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14635005515868157
"cameras/drone/drone0" SET Transform localPosition (-0.8027241016193567 -0.16396235944154963 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9364812657400161 1.101181209568371 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -11 -17)
"cameras/drone/drone0" SET Transform localScale (0.6260369684640219 0.6260369684640219 0.6260369684640219)
"cameras/drone/drone1" SET Transform localEulerAngles (3 0 -6)
"cameras/drone/drone1" SET Transform localScale (0.9905375465596644 0.9905375465596644 0.9905375465596644)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.827533521740425 0)
"cameras" SET Transform eulerAngles (-15.805581986650097 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2942165816720972
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.687663912621733
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07381028147735438
"cameras/drone/drone0" SET Transform localPosition (-0.07400509415662859 0.06542246304777505 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4941200055919862 1.0493344698576692 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -11 -6)
"cameras/drone/drone0" SET Transform localScale (1.0728637825973464 1.0728637825973464 1.0728637825973464)
"cameras/drone/drone1" SET Transform localEulerAngles (6 1 11)
"cameras/drone/drone1" SET Transform localScale (1.2657729768266401 1.2657729768266401 1.2657729768266401)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.344079497172233 0)
"cameras" SET Transform eulerAngles (19.007291949789746 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.061703034914828
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6691138570333082
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03622616610072993
"cameras/drone/drone0" SET Transform localPosition (0.9747822107928255 -0.24875390953851045 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3314828918996472 0.8320983137424027 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 11 8)
"cameras/drone/drone0" SET Transform localScale (0.804094216175571 0.804094216175571 0.804094216175571)
"cameras/drone/drone1" SET Transform localEulerAngles (14 17 -3)
"cameras/drone/drone1" SET Transform localScale (0.8461202385976219 0.8461202385976219 0.8461202385976219)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6978296459505913 0)
"cameras" SET Transform eulerAngles (-1.7809892287244082 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3090465485526042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2772393578858068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3551149621139629
"cameras/drone/drone0" SET Transform localPosition (-0.2376557736637599 0.1422600932235874 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5493973428888979 1.2723876816723534 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -4 -18)
"cameras/drone/drone0" SET Transform localScale (1.0937355633175228 1.0937355633175228 1.0937355633175228)
"cameras/drone/drone1" SET Transform localEulerAngles (10 11 4)
"cameras/drone/drone1" SET Transform localScale (0.7637259702003389 0.7637259702003389 0.7637259702003389)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.9260529540129046 0)
"cameras" SET Transform eulerAngles (-1.9799754843235142 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6729540510786503
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6708707293073521
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2826251577522613
"cameras/drone/drone0" SET Transform localPosition (-1.1944375445676618 -0.2836026956403149 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9907975178385133 0.8416488367415025 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -20 2)
"cameras/drone/drone0" SET Transform localScale (0.7323973031362154 0.7323973031362154 0.7323973031362154)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 0 15)
"cameras/drone/drone1" SET Transform localScale (1.0350575328140728 1.0350575328140728 1.0350575328140728)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.942292269560731 0)
"cameras" SET Transform eulerAngles (-17.09909650926651 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9045822679786722
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7131659424427887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.019015829080533654
"cameras/drone/drone0" SET Transform localPosition (-0.009835259421618225 -0.19326350109974805 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4365539815180217 0.8122536512810572 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 18 15)
"cameras/drone/drone0" SET Transform localScale (1.06023265183171 1.06023265183171 1.06023265183171)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 5 -16)
"cameras/drone/drone1" SET Transform localScale (1.4049785992791697 1.4049785992791697 1.4049785992791697)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.643941661081657 0)
"cameras" SET Transform eulerAngles (15.551378574147456 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5480589713387447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.055717391443879
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39555856406004614
"cameras/drone/drone0" SET Transform localPosition (0.39246232411289217 0.08645220483343657 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.13673856486689528 1.2488217196877416 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -16 -18)
"cameras/drone/drone0" SET Transform localScale (1.0109107966435353 1.0109107966435353 1.0109107966435353)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -8 -18)
"cameras/drone/drone1" SET Transform localScale (0.9196786054001467 0.9196786054001467 0.9196786054001467)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.209809597946677 0)
"cameras" SET Transform eulerAngles (18.46767321492318 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5966180830882517
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9424053850267216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13790294825411764
"cameras/drone/drone0" SET Transform localPosition (-0.04635396492446331 -0.02595274335136516 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17232338939564196 0.8671779233470647 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -2 -9)
"cameras/drone/drone0" SET Transform localScale (1.1484848046490455 1.1484848046490455 1.1484848046490455)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 2 18)
"cameras/drone/drone1" SET Transform localScale (1.2249130121655991 1.2249130121655991 1.2249130121655991)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7694568123691683 0)
"cameras" SET Transform eulerAngles (-7.573910667718016 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0916565678202994
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3746557003982023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09022531095561998
"cameras/drone/drone0" SET Transform localPosition (0.9220765676148475 0.14375997002531343 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9545362811228348 1.0279926500579788 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -18 2)
"cameras/drone/drone0" SET Transform localScale (0.8521211356247529 0.8521211356247529 0.8521211356247529)
"cameras/drone/drone1" SET Transform localEulerAngles (11 12 19)
"cameras/drone/drone1" SET Transform localScale (1.3097801884933595 1.3097801884933595 1.3097801884933595)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.845300753539606 0)
"cameras" SET Transform eulerAngles (-1.7417297431593894 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3337279750060533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7807141660053687
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29868326984061117
"cameras/drone/drone0" SET Transform localPosition (0.7070736363536099 0.015547858420353833 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6801264918718084 1.2469409338252604 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 4 -4)
"cameras/drone/drone0" SET Transform localScale (0.666850481610948 0.666850481610948 0.666850481610948)
"cameras/drone/drone1" SET Transform localEulerAngles (17 17 -14)
"cameras/drone/drone1" SET Transform localScale (0.6168178141104247 0.6168178141104247 0.6168178141104247)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.565909437922293 0)
"cameras" SET Transform eulerAngles (7.321135201842939 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1350982368915172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3442560372207266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10598154433911909
"cameras/drone/drone0" SET Transform localPosition (-0.1735683437619442 0.6152193100019019 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.06095748541925028 1.0523345923024567 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -11 9)
"cameras/drone/drone0" SET Transform localScale (1.2511253896619698 1.2511253896619698 1.2511253896619698)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -5 2)
"cameras/drone/drone1" SET Transform localScale (1.3283038344392586 1.3283038344392586 1.3283038344392586)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7434555875492657 0)
"cameras" SET Transform eulerAngles (-10.605866108479557 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0287025979800726
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4240371502656808
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1777932025541451
"cameras/drone/drone0" SET Transform localPosition (-0.06271866630495104 0.6024010317292905 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8264076889918346 1.1506134868368076 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -6 13)
"cameras/drone/drone0" SET Transform localScale (1.0302961410999292 1.0302961410999292 1.0302961410999292)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -7 5)
"cameras/drone/drone1" SET Transform localScale (0.8054810870168639 0.8054810870168639 0.8054810870168639)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.011875136069169 0)
"cameras" SET Transform eulerAngles (1.6091120027026378 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7125019970961515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6964532434465713
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09874856279281148
"cameras/drone/drone0" SET Transform localPosition (0.41565593727906736 0.3507498699092873 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5033977676767045 0.9880331342788086 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 2 0)
"cameras/drone/drone0" SET Transform localScale (1.2857690359511738 1.2857690359511738 1.2857690359511738)
"cameras/drone/drone1" SET Transform localEulerAngles (17 12 -5)
"cameras/drone/drone1" SET Transform localScale (0.9606315138715202 0.9606315138715202 0.9606315138715202)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0535172962799164 0)
"cameras" SET Transform eulerAngles (2.7276304626084915 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2090102094128155
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.26939804048324
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06120076758304114
"cameras/drone/drone0" SET Transform localPosition (0.4287828792980355 -0.0687899194126464 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.0616292149280957 1.142593397892108 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 14 15)
"cameras/drone/drone0" SET Transform localScale (1.1493436577055214 1.1493436577055214 1.1493436577055214)
"cameras/drone/drone1" SET Transform localEulerAngles (8 11 15)
"cameras/drone/drone1" SET Transform localScale (0.8468802075871307 0.8468802075871307 0.8468802075871307)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1234865334032875 0)
"cameras" SET Transform eulerAngles (7.08008764495629 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7176457954716355
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6402264601413115
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025254973781318094
"cameras/drone/drone0" SET Transform localPosition (-0.6198776438628183 0.15730756696053544 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6508690076460912 1.2604474696902388 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 18 13)
"cameras/drone/drone0" SET Transform localScale (1.152667858142999 1.152667858142999 1.152667858142999)
"cameras/drone/drone1" SET Transform localEulerAngles (9 2 18)
"cameras/drone/drone1" SET Transform localScale (1.207183544084725 1.207183544084725 1.207183544084725)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4301305896956755 0)
"cameras" SET Transform eulerAngles (-5.342305393745139 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4000411476826905
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8408276729103146
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1751528605012773
"cameras/drone/drone0" SET Transform localPosition (0.7822452902016173 -0.20094760871870615 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1602033563701937 1.2982176267534393 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 8 9)
"cameras/drone/drone0" SET Transform localScale (0.7731024788768935 0.7731024788768935 0.7731024788768935)
"cameras/drone/drone1" SET Transform localEulerAngles (1 16 -14)
"cameras/drone/drone1" SET Transform localScale (1.3899781943027665 1.3899781943027665 1.3899781943027665)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.368607514379036 0)
"cameras" SET Transform eulerAngles (-5.000796939820177 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5125281244824458
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9359419992949247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22348555166716824
"cameras/drone/drone0" SET Transform localPosition (-0.05259691122233656 -0.22085848677753378 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19975076768184752 1.0466608619251263 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -16 6)
"cameras/drone/drone0" SET Transform localScale (0.9228706378197906 0.9228706378197906 0.9228706378197906)
"cameras/drone/drone1" SET Transform localEulerAngles (4 5 -13)
"cameras/drone/drone1" SET Transform localScale (1.2879611645588802 1.2879611645588802 1.2879611645588802)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.188830651012335 0)
"cameras" SET Transform eulerAngles (19.23709131073732 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9039058561136675
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1336293802273754
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05714431165897249
"cameras/drone/drone0" SET Transform localPosition (0.2618970125326505 -0.21001341718677385 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16747363879244825 0.8648845620505137 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -5 20)
"cameras/drone/drone0" SET Transform localScale (0.6090783016050205 0.6090783016050205 0.6090783016050205)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 15 -1)
"cameras/drone/drone1" SET Transform localScale (1.0777277415607318 1.0777277415607318 1.0777277415607318)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.904883127934882 0)
"cameras" SET Transform eulerAngles (15.983432424270262 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7985492212813345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2403205154415289
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16455178895440403
"cameras/drone/drone0" SET Transform localPosition (0.47686389290543807 -0.01493485902424635 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9398520252967398 1.1237694393822744 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 16 13)
"cameras/drone/drone0" SET Transform localScale (1.0310419950620795 1.0310419950620795 1.0310419950620795)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 18 5)
"cameras/drone/drone1" SET Transform localScale (0.7506269470322107 0.7506269470322107 0.7506269470322107)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.536638560941759 0)
"cameras" SET Transform eulerAngles (10.116398815664894 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7954866498306052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.360109069250796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35192237130564413
"cameras/drone/drone0" SET Transform localPosition (0.07655457599174831 0.16087129044883258 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.41536410787889155 1.0171978775196746 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -19 -9)
"cameras/drone/drone0" SET Transform localScale (0.8521238135871824 0.8521238135871824 0.8521238135871824)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -19 -19)
"cameras/drone/drone1" SET Transform localScale (1.0666839127925356 1.0666839127925356 1.0666839127925356)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.462383700943208 0)
"cameras" SET Transform eulerAngles (10.880150985060698 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9651386657837068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3580791094969142
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10888476697138545
"cameras/drone/drone0" SET Transform localPosition (0.4701040493981341 0.14041862732335336 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.44574115869749265 0.8902016244526592 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 6 -1)
"cameras/drone/drone0" SET Transform localScale (0.6173368514104431 0.6173368514104431 0.6173368514104431)
"cameras/drone/drone1" SET Transform localEulerAngles (0 17 18)
"cameras/drone/drone1" SET Transform localScale (1.2663711795958519 1.2663711795958519 1.2663711795958519)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.825051683079057 0)
"cameras" SET Transform eulerAngles (2.389556343977496 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8469729633241017
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9007338383831655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30225320652538984
"cameras/drone/drone0" SET Transform localPosition (-0.26843987534827374 0.2025118887906942 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.033336349031107604 0.9554909967092537 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 11 -1)
"cameras/drone/drone0" SET Transform localScale (1.4083443087010674 1.4083443087010674 1.4083443087010674)
"cameras/drone/drone1" SET Transform localEulerAngles (2 13 -7)
"cameras/drone/drone1" SET Transform localScale (1.11318054458143 1.11318054458143 1.11318054458143)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.080145499072497 0)
"cameras" SET Transform eulerAngles (0.6844776651665185 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4127057568367425
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8152082419269493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1107542931244935
"cameras/drone/drone0" SET Transform localPosition (-0.9635339260746328 0.03620863017658443 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1078104830341136 1.2444503153023507 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 17 9)
"cameras/drone/drone0" SET Transform localScale (0.9191424205366585 0.9191424205366585 0.9191424205366585)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -2 -9)
"cameras/drone/drone1" SET Transform localScale (0.8364293694814201 0.8364293694814201 0.8364293694814201)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8181186089553885 0)
"cameras" SET Transform eulerAngles (-16.142147156201496 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1216693559200581
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9344060472737534
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14580662975414913
"cameras/drone/drone0" SET Transform localPosition (0.8213374221552987 -0.10799516852048735 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18622842489144809 1.1413623076679276 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -11 2)
"cameras/drone/drone0" SET Transform localScale (0.7584260961463845 0.7584260961463845 0.7584260961463845)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -6 -8)
"cameras/drone/drone1" SET Transform localScale (0.7298781201619458 0.7298781201619458 0.7298781201619458)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.794544424817029 0)
"cameras" SET Transform eulerAngles (9.577732024023945 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0532010978142043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6763475499385723
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1847630880679647
"cameras/drone/drone0" SET Transform localPosition (-0.5114056767561778 -0.03979349167706164 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2911905057870092 1.134917718849335 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -18 -18)
"cameras/drone/drone0" SET Transform localScale (1.0482618432132853 1.0482618432132853 1.0482618432132853)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -16 9)
"cameras/drone/drone1" SET Transform localScale (1.3509942308230245 1.3509942308230245 1.3509942308230245)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.205802876366384 0)
"cameras" SET Transform eulerAngles (5.012025715799069 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6444643560350258
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5406614876562708
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.093233962267333
"cameras/drone/drone0" SET Transform localPosition (-0.40070035912409996 0.6644833788279774 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1416490946154496 0.9111706511830783 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 5 -5)
"cameras/drone/drone0" SET Transform localScale (1.0600594464908486 1.0600594464908486 1.0600594464908486)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 7 -19)
"cameras/drone/drone1" SET Transform localScale (1.054593187001113 1.054593187001113 1.054593187001113)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.244538158334597 0)
"cameras" SET Transform eulerAngles (8.290479003447228 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5375245789052872
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6283577727154113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26591410738825866
"cameras/drone/drone0" SET Transform localPosition (-0.11062212388964698 0.027330410444613873 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.005537253737099013 0.8469155680372307 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -4 -3)
"cameras/drone/drone0" SET Transform localScale (0.854125994319672 0.854125994319672 0.854125994319672)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -10 -4)
"cameras/drone/drone1" SET Transform localScale (1.4001955226047182 1.4001955226047182 1.4001955226047182)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.567277648287758 0)
"cameras" SET Transform eulerAngles (9.194589737201756 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5126879858794235
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1821321228828783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27694244317202027
"cameras/drone/drone0" SET Transform localPosition (0.7971658673790079 0.1432176527369366 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6300303452412119 0.965475160032939 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 9 -3)
"cameras/drone/drone0" SET Transform localScale (1.0580217009007864 1.0580217009007864 1.0580217009007864)
"cameras/drone/drone1" SET Transform localEulerAngles (1 4 4)
"cameras/drone/drone1" SET Transform localScale (0.7024072465255888 0.7024072465255888 0.7024072465255888)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4469427209737225 0)
"cameras" SET Transform eulerAngles (-14.591323067315685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2264988954603298
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1221585049323068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19609035483836765
"cameras/drone/drone0" SET Transform localPosition (-0.8972054333468447 0.6261552746929429 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0904813931092017 0.9377388283770244 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -4 -9)
"cameras/drone/drone0" SET Transform localScale (0.7897532528000505 0.7897532528000505 0.7897532528000505)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -10 19)
"cameras/drone/drone1" SET Transform localScale (0.6538567343018759 0.6538567343018759 0.6538567343018759)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.089752332950663 0)
"cameras" SET Transform eulerAngles (14.020370906131319 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7727741132308661
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9689929200127017
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34120319416606737
"cameras/drone/drone0" SET Transform localPosition (-0.7122396336115637 -0.23566232375233137 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6939551954173733 0.9923269945266928 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -1 1)
"cameras/drone/drone0" SET Transform localScale (1.4525485646365421 1.4525485646365421 1.4525485646365421)
"cameras/drone/drone1" SET Transform localEulerAngles (0 18 1)
"cameras/drone/drone1" SET Transform localScale (1.178378632077928 1.178378632077928 1.178378632077928)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.663395683764984 0)
"cameras" SET Transform eulerAngles (3.55357622708571 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0099598694288114
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2530335151433514
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04969322712721063
"cameras/drone/drone0" SET Transform localPosition (-0.8837171452330627 0.16078048111218485 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.015664325444610494 1.132175714962592 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -5 -5)
"cameras/drone/drone0" SET Transform localScale (1.16755265386527 1.16755265386527 1.16755265386527)
"cameras/drone/drone1" SET Transform localEulerAngles (9 0 0)
"cameras/drone/drone1" SET Transform localScale (0.7275007780672791 0.7275007780672791 0.7275007780672791)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3443141441158595 0)
"cameras" SET Transform eulerAngles (-12.6586278291736 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6612756195567191
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.972979797098826
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.041291657063891846
"cameras/drone/drone0" SET Transform localPosition (0.994296677243754 0.6638609427966762 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0829647329499965 0.8990505490561854 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 13 14)
"cameras/drone/drone0" SET Transform localScale (1.4091620469748536 1.4091620469748536 1.4091620469748536)
"cameras/drone/drone1" SET Transform localEulerAngles (19 12 0)
"cameras/drone/drone1" SET Transform localScale (0.6768232670553788 0.6768232670553788 0.6768232670553788)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.63116501584129 0)
"cameras" SET Transform eulerAngles (3.395093283263108 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7478416315355138
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4720706831338939
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07996512684234625
"cameras/drone/drone0" SET Transform localPosition (0.027219495692444085 -0.21916038200192317 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1600944349520832 1.0676331534275922 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 18 3)
"cameras/drone/drone0" SET Transform localScale (1.45948516955061 1.45948516955061 1.45948516955061)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 17 6)
"cameras/drone/drone1" SET Transform localScale (1.061079039518282 1.061079039518282 1.061079039518282)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4722391847388514 0)
"cameras" SET Transform eulerAngles (12.768551802313539 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6787504904937369
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.141497874748338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.008569264311890734
"cameras/drone/drone0" SET Transform localPosition (0.3763687400854323 0.36819621336975866 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.07837832347523777 1.0625039620284045 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -9 5)
"cameras/drone/drone0" SET Transform localScale (1.1641737439691309 1.1641737439691309 1.1641737439691309)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -4 -2)
"cameras/drone/drone1" SET Transform localScale (1.3557193724277101 1.3557193724277101 1.3557193724277101)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.60410645060848 0)
"cameras" SET Transform eulerAngles (15.742418461593488 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4392043235532634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1085730416383273
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.280676369527191
"cameras/drone/drone0" SET Transform localPosition (-0.9979430670883164 0.3505768846295724 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7198587882731217 1.003314600483225 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -7 -13)
"cameras/drone/drone0" SET Transform localScale (0.9238364253785809 0.9238364253785809 0.9238364253785809)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 11 15)
"cameras/drone/drone1" SET Transform localScale (1.1208056618808395 1.1208056618808395 1.1208056618808395)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.536866640940733 0)
"cameras" SET Transform eulerAngles (-4.421845747897324 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0251504098948505
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0222898055379603
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37532381768628165
"cameras/drone/drone0" SET Transform localPosition (-0.8625453930065816 0.337101973708339 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6377838587902156 1.0722465042191485 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 8 4)
"cameras/drone/drone0" SET Transform localScale (1.1014110147817828 1.1014110147817828 1.1014110147817828)
"cameras/drone/drone1" SET Transform localEulerAngles (13 5 -4)
"cameras/drone/drone1" SET Transform localScale (0.9797476068422757 0.9797476068422757 0.9797476068422757)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2659795462499295 0)
"cameras" SET Transform eulerAngles (-12.200169414785766 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7833941207762349
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3841119383266394
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.006512900964955205
"cameras/drone/drone0" SET Transform localPosition (1.1776510934884399 0.06495648784638658 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1516397176168205 1.1637992343115948 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 18 10)
"cameras/drone/drone0" SET Transform localScale (0.6642597555657939 0.6642597555657939 0.6642597555657939)
"cameras/drone/drone1" SET Transform localEulerAngles (19 3 7)
"cameras/drone/drone1" SET Transform localScale (1.4592591750324044 1.4592591750324044 1.4592591750324044)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.610038255223449 0)
"cameras" SET Transform eulerAngles (-14.180379388192264 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5782210397877625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5087482119636078
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0775420118663337
"cameras/drone/drone0" SET Transform localPosition (0.3284264261038712 0.6095882911976986 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9900527359899343 1.1409146383489517 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -6 -9)
"cameras/drone/drone0" SET Transform localScale (0.8921594299332654 0.8921594299332654 0.8921594299332654)
"cameras/drone/drone1" SET Transform localEulerAngles (9 1 19)
"cameras/drone/drone1" SET Transform localScale (0.989533846459971 0.989533846459971 0.989533846459971)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 45
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.671402443855227 0)
"cameras" SET Transform eulerAngles (-14.800163393603402 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7601513874590498
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5083318658634746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06631483559756744
"cameras/drone/drone0" SET Transform localPosition (-0.24159328587786733 -0.2519577443625443 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10476687809613416 1.0887555110924247 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -10 -17)
"cameras/drone/drone0" SET Transform localScale (0.6735780530424331 0.6735780530424331 0.6735780530424331)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 5 -19)
"cameras/drone/drone1" SET Transform localScale (1.3748883354530068 1.3748883354530068 1.3748883354530068)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.268157152611843 0)
"cameras" SET Transform eulerAngles (-11.617609004621624 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5968193956659589
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8267723959085354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06659047239731164
"cameras/drone/drone0" SET Transform localPosition (0.2911975165959739 0.4647808805510129 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.005803181734658 1.2770962928898193 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 0 -2)
"cameras/drone/drone0" SET Transform localScale (1.4214325974018616 1.4214325974018616 1.4214325974018616)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -9 -10)
"cameras/drone/drone1" SET Transform localScale (1.4164041888903494 1.4164041888903494 1.4164041888903494)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7665242926590334 0)
"cameras" SET Transform eulerAngles (-8.97262461464492 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2992973243540846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9767199284294481
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05889838937803207
"cameras/drone/drone0" SET Transform localPosition (0.7166564537468676 0.6906275882326778 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4123446014183261 0.8655108963612503 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -18 -11)
"cameras/drone/drone0" SET Transform localScale (0.8608549530988039 0.8608549530988039 0.8608549530988039)
"cameras/drone/drone1" SET Transform localEulerAngles (15 13 -8)
"cameras/drone/drone1" SET Transform localScale (1.1167131737808995 1.1167131737808995 1.1167131737808995)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.163345376835903 0)
"cameras" SET Transform eulerAngles (-13.236749908520778 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1318182447861376
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9497344550950017
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33650829235315105
"cameras/drone/drone0" SET Transform localPosition (0.2567196514087322 0.17100472159907637 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9922288089119999 1.078272443273246 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 10 -17)
"cameras/drone/drone0" SET Transform localScale (1.0309838674052338 1.0309838674052338 1.0309838674052338)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -6 -19)
"cameras/drone/drone1" SET Transform localScale (1.2907460755425268 1.2907460755425268 1.2907460755425268)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.045703316962406 0)
"cameras" SET Transform eulerAngles (9.987185232096966 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.737715596231445
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.512173660443223
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3508955696182148
"cameras/drone/drone0" SET Transform localPosition (0.9015156933640258 -0.20412041151203858 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6034508119536501 0.9888843150701565 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 7 -16)
"cameras/drone/drone0" SET Transform localScale (1.0610067072896212 1.0610067072896212 1.0610067072896212)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -5 6)
"cameras/drone/drone1" SET Transform localScale (1.445505396690244 1.445505396690244 1.445505396690244)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1802532695263235 0)
"cameras" SET Transform eulerAngles (-15.783058394848455 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9735263560540303
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.676798572211521
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10666528126620084
"cameras/drone/drone0" SET Transform localPosition (-0.8582165333815241 -0.09013919743138382 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.217953099623166 0.8358771263114098 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -14 11)
"cameras/drone/drone0" SET Transform localScale (1.1467929622248885 1.1467929622248885 1.1467929622248885)
"cameras/drone/drone1" SET Transform localEulerAngles (10 1 -18)
"cameras/drone/drone1" SET Transform localScale (1.4709578167532422 1.4709578167532422 1.4709578167532422)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9294138848958213 0)
"cameras" SET Transform eulerAngles (-16.04447706208414 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0782236686399156
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9318145913541799
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2578240880834268
"cameras/drone/drone0" SET Transform localPosition (-0.7753880206515242 0.2014635459129726 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5359473067724865 0.9523340359110097 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 19 -17)
"cameras/drone/drone0" SET Transform localScale (0.6977721708609912 0.6977721708609912 0.6977721708609912)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 7 -12)
"cameras/drone/drone1" SET Transform localScale (1.4634199882998937 1.4634199882998937 1.4634199882998937)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.720095217574928 0)
"cameras" SET Transform eulerAngles (-9.513670885491475 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.371928854832043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9432147365620313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3231516379592693
"cameras/drone/drone0" SET Transform localPosition (0.48623197410867935 -0.2297123007478647 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18872567325303913 1.165899314316536 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -16 7)
"cameras/drone/drone0" SET Transform localScale (0.60594071142273 0.60594071142273 0.60594071142273)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 18 1)
"cameras/drone/drone1" SET Transform localScale (1.0312564586284911 1.0312564586284911 1.0312564586284911)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.849951086032954 0)
"cameras" SET Transform eulerAngles (0.9476831368420591 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7538211994318313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.707929288542787
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.052393388825063926
"cameras/drone/drone0" SET Transform localPosition (-1.0711584009006139 -0.08832433763432906 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6889237404699383 0.9459787727614117 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -18 -17)
"cameras/drone/drone0" SET Transform localScale (0.864789305328834 0.864789305328834 0.864789305328834)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -4 18)
"cameras/drone/drone1" SET Transform localScale (1.1330577739122707 1.1330577739122707 1.1330577739122707)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.085464014478701 0)
"cameras" SET Transform eulerAngles (13.889278547681002 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8501518034754326
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4135638858106807
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35289755349302726
"cameras/drone/drone0" SET Transform localPosition (0.09039556084756706 0.20027894931777118 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7413045207230262 0.8319205606481685 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 8 12)
"cameras/drone/drone0" SET Transform localScale (1.1043015599222095 1.1043015599222095 1.1043015599222095)
"cameras/drone/drone1" SET Transform localEulerAngles (3 18 -14)
"cameras/drone/drone1" SET Transform localScale (0.7189082675664787 0.7189082675664787 0.7189082675664787)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.870318675208308 0)
"cameras" SET Transform eulerAngles (-16.707517601727897 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.118737867882897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8330859229490872
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3187330267956462
"cameras/drone/drone0" SET Transform localPosition (0.6456953256981073 0.28923836499132743 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.104751511451208 1.007611012856469 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 15 8)
"cameras/drone/drone0" SET Transform localScale (1.1529333781132678 1.1529333781132678 1.1529333781132678)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -20 12)
"cameras/drone/drone1" SET Transform localScale (0.9509680755789771 0.9509680755789771 0.9509680755789771)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.174374179558036 0)
"cameras" SET Transform eulerAngles (-10.268232433833383 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6311967302514853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.508286658227704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0955664775493542
"cameras/drone/drone0" SET Transform localPosition (-1.1830529481917913 0.6218862981105184 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6843034174502731 0.8675145269581586 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 6 15)
"cameras/drone/drone0" SET Transform localScale (1.0782340683477245 1.0782340683477245 1.0782340683477245)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 6 6)
"cameras/drone/drone1" SET Transform localScale (1.0641069833989998 1.0641069833989998 1.0641069833989998)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.046748846511241 0)
"cameras" SET Transform eulerAngles (-9.867229492308773 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7177208741002079
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2616944781104387
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.197935958061788
"cameras/drone/drone0" SET Transform localPosition (0.5426523906023584 0.5177933075655232 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.009924898943793226 1.0252268324086744 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 8 -19)
"cameras/drone/drone0" SET Transform localScale (0.6047106759109506 0.6047106759109506 0.6047106759109506)
"cameras/drone/drone1" SET Transform localEulerAngles (5 0 3)
"cameras/drone/drone1" SET Transform localScale (1.344628002461941 1.344628002461941 1.344628002461941)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.329082898752905 0)
"cameras" SET Transform eulerAngles (15.900144415893223 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8428727361374506
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3852729390954157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27541252344745526
"cameras/drone/drone0" SET Transform localPosition (0.17143115136245357 0.1754797348330523 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6980280444718003 0.8828882772993458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 10 -8)
"cameras/drone/drone0" SET Transform localScale (1.0986885927642722 1.0986885927642722 1.0986885927642722)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -5 14)
"cameras/drone/drone1" SET Transform localScale (0.9168365375470278 0.9168365375470278 0.9168365375470278)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.151289485916912 0)
"cameras" SET Transform eulerAngles (8.907437341290631 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.375163058000938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.509864009361201
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05740167847155928
"cameras/drone/drone0" SET Transform localPosition (0.4188720597549582 0.15550618542714417 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0413915175407984 0.8193298066623267 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 13 4)
"cameras/drone/drone0" SET Transform localScale (1.176105495398534 1.176105495398534 1.176105495398534)
"cameras/drone/drone1" SET Transform localEulerAngles (20 3 -15)
"cameras/drone/drone1" SET Transform localScale (1.0587190925342411 1.0587190925342411 1.0587190925342411)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.274661043304847 0)
"cameras" SET Transform eulerAngles (-10.32516909069264 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5820879165819863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4352283806858832
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.234118258384693
"cameras/drone/drone0" SET Transform localPosition (-0.6167562081536199 0.4357566388398974 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1446306358340534 1.116325965338845 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -1 -4)
"cameras/drone/drone0" SET Transform localScale (0.8487450729069339 0.8487450729069339 0.8487450729069339)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 9 11)
"cameras/drone/drone1" SET Transform localScale (1.1587160294871404 1.1587160294871404 1.1587160294871404)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6137610392956327 0)
"cameras" SET Transform eulerAngles (-13.210251066676939 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8222496677762248
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.590775397007084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05310188758073453
"cameras/drone/drone0" SET Transform localPosition (-0.630509169271349 0.43540141453234876 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5111919698930472 1.2069181018701458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -3 -18)
"cameras/drone/drone0" SET Transform localScale (0.8575768844561661 0.8575768844561661 0.8575768844561661)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 7 -18)
"cameras/drone/drone1" SET Transform localScale (0.8817452375905938 0.8817452375905938 0.8817452375905938)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.01560597667298 0)
"cameras" SET Transform eulerAngles (18.65211567108092 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8385214645395812
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5190368154303837
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.022312746468664324
"cameras/drone/drone0" SET Transform localPosition (0.9861382199430937 -0.1703091134297558 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8424059060478513 0.8459238329699686 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 16 0)
"cameras/drone/drone0" SET Transform localScale (1.2871481600753722 1.2871481600753722 1.2871481600753722)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -9 -17)
"cameras/drone/drone1" SET Transform localScale (1.1085337842691998 1.1085337842691998 1.1085337842691998)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.294584211340302 0)
"cameras" SET Transform eulerAngles (-6.9447091584204745 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5078506933818354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6814561038871632
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3013715078578807
"cameras/drone/drone0" SET Transform localPosition (-1.0579194739964042 0.6075840879357042 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2775631580105502 1.0994626216483918 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -19 9)
"cameras/drone/drone0" SET Transform localScale (0.7172978964712055 0.7172978964712055 0.7172978964712055)
"cameras/drone/drone1" SET Transform localEulerAngles (20 20 -1)
"cameras/drone/drone1" SET Transform localScale (1.4265242628434072 1.4265242628434072 1.4265242628434072)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.647782069927896 0)
"cameras" SET Transform eulerAngles (-8.376117926668215 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0556749756328592
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5479380249245978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08109241651336477
"cameras/drone/drone0" SET Transform localPosition (-0.44387596344683555 -0.17674146732191925 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7825447561493581 1.2759040374995418 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 6 16)
"cameras/drone/drone0" SET Transform localScale (0.6381426942916268 0.6381426942916268 0.6381426942916268)
"cameras/drone/drone1" SET Transform localEulerAngles (20 4 16)
"cameras/drone/drone1" SET Transform localScale (0.9983246948989015 0.9983246948989015 0.9983246948989015)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.029010828722069 0)
"cameras" SET Transform eulerAngles (0.29441515689613595 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9301986796732592
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4533299985637975
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3251628964122275
"cameras/drone/drone0" SET Transform localPosition (0.2190859578745581 -0.18539877563223622 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4401717759000361 0.9370683247602534 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 3 -16)
"cameras/drone/drone0" SET Transform localScale (1.4081787562331538 1.4081787562331538 1.4081787562331538)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 8 -1)
"cameras/drone/drone1" SET Transform localScale (1.4728925954886887 1.4728925954886887 1.4728925954886887)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.293889123562633 0)
"cameras" SET Transform eulerAngles (-19.729712937812632 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7325412790504846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.654313049539962
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10202778811465554
"cameras/drone/drone0" SET Transform localPosition (0.08232257839002255 0.46866787342112753 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4850532557652951 1.2605087690811578 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 8 9)
"cameras/drone/drone0" SET Transform localScale (1.005162722843981 1.005162722843981 1.005162722843981)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 15 -19)
"cameras/drone/drone1" SET Transform localScale (1.333135339695306 1.333135339695306 1.333135339695306)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.153201953833671 0)
"cameras" SET Transform eulerAngles (14.254911510491333 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3754798751006505
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6612867726700642
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33744578108151435
"cameras/drone/drone0" SET Transform localPosition (-0.7321007725683024 0.5653110541970097 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8693982500189141 1.1072396300214742 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 17 13)
"cameras/drone/drone0" SET Transform localScale (1.0550223669725547 1.0550223669725547 1.0550223669725547)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -1 3)
"cameras/drone/drone1" SET Transform localScale (1.4352719516622008 1.4352719516622008 1.4352719516622008)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3150938812812054 0)
"cameras" SET Transform eulerAngles (8.860971230868373 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.309605689275935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.471576434354932
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0803361375864923
"cameras/drone/drone0" SET Transform localPosition (-0.6536788935879806 0.003399538697304638 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1504820194740404 1.2724306810036974 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -12 -9)
"cameras/drone/drone0" SET Transform localScale (0.9726129664398411 0.9726129664398411 0.9726129664398411)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -20 -10)
"cameras/drone/drone1" SET Transform localScale (1.1612892678845514 1.1612892678845514 1.1612892678845514)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7124919317420133 0)
"cameras" SET Transform eulerAngles (7.809573551137518 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44200797579688245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9564789786543213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24152064596249848
"cameras/drone/drone0" SET Transform localPosition (-0.8391124472065896 0.46345026514759086 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.13103224862150098 0.8876526400450069 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 15 -12)
"cameras/drone/drone0" SET Transform localScale (0.6848082183125633 0.6848082183125633 0.6848082183125633)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 20 -19)
"cameras/drone/drone1" SET Transform localScale (1.145968613970574 1.145968613970574 1.145968613970574)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8888424830537422 0)
"cameras" SET Transform eulerAngles (11.254832380475538 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1792845036720014
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.609792308839486
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02803093686303835
"cameras/drone/drone0" SET Transform localPosition (0.89413795137174 -0.07410729653144382 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6986171449708825 0.811376104622439 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 9 20)
"cameras/drone/drone0" SET Transform localScale (0.6555461507447168 0.6555461507447168 0.6555461507447168)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -4 17)
"cameras/drone/drone1" SET Transform localScale (0.8435003416323053 0.8435003416323053 0.8435003416323053)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1592134071754927 0)
"cameras" SET Transform eulerAngles (-16.630535663239556 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3436136944732824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.58353055042044
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02587812378275336
"cameras/drone/drone0" SET Transform localPosition (-0.6807184510418627 0.17111622015521527 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.22458788773906158 0.9283587986446556 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -13 4)
"cameras/drone/drone0" SET Transform localScale (0.9327044156617752 0.9327044156617752 0.9327044156617752)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -13 -19)
"cameras/drone/drone1" SET Transform localScale (1.466073302598264 1.466073302598264 1.466073302598264)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3572684113229316 0)
"cameras" SET Transform eulerAngles (-0.3779237896492731 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1553662981890636
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.249855843156627
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2715636313304516
"cameras/drone/drone0" SET Transform localPosition (-0.2890681607661748 0.04325478078271566 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8197570240738793 0.9919165454574053 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -10 -10)
"cameras/drone/drone0" SET Transform localScale (1.1365284247840461 1.1365284247840461 1.1365284247840461)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -6 -1)
"cameras/drone/drone1" SET Transform localScale (1.214933796903845 1.214933796903845 1.214933796903845)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2457195034430626 0)
"cameras" SET Transform eulerAngles (-8.61954957055116 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1014083091154916
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9396277123591478
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2159606479598163
"cameras/drone/drone0" SET Transform localPosition (0.7643018557389338 0.3398209413460092 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.14991467270886139 1.2245254455228216 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -3 -11)
"cameras/drone/drone0" SET Transform localScale (0.6318910865552523 0.6318910865552523 0.6318910865552523)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -10 8)
"cameras/drone/drone1" SET Transform localScale (0.7920242153498418 0.7920242153498418 0.7920242153498418)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2741037820535794 0)
"cameras" SET Transform eulerAngles (-16.01409511844937 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8482251691620055
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.390904354836111
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.366872120763784
"cameras/drone/drone0" SET Transform localPosition (0.5240025671352424 -0.060549677352755016 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37442491563308955 0.8765248211465573 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -7 7)
"cameras/drone/drone0" SET Transform localScale (1.0931945874918478 1.0931945874918478 1.0931945874918478)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -15 6)
"cameras/drone/drone1" SET Transform localScale (0.6123064079363709 0.6123064079363709 0.6123064079363709)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.801960697406309 0)
"cameras" SET Transform eulerAngles (10.569455688636712 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.047262854284932
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.521122053238869
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1764182975912929
"cameras/drone/drone0" SET Transform localPosition (0.7457430481201055 0.46196260916300597 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7042800036614765 1.2177554419539223 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -18 -5)
"cameras/drone/drone0" SET Transform localScale (0.9063028186546641 0.9063028186546641 0.9063028186546641)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -2 14)
"cameras/drone/drone1" SET Transform localScale (0.790264804530101 0.790264804530101 0.790264804530101)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.049656686860211 0)
"cameras" SET Transform eulerAngles (-0.112970703071408 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.187633466001904
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4858645515663995
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28445245966861116
"cameras/drone/drone0" SET Transform localPosition (-0.11151907064647548 0.34686919374181097 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.33763156188657584 1.2314888873455851 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -3 -10)
"cameras/drone/drone0" SET Transform localScale (1.2271613348429324 1.2271613348429324 1.2271613348429324)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -20 -2)
"cameras/drone/drone1" SET Transform localScale (0.6637054193543316 0.6637054193543316 0.6637054193543316)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2198893791860677 0)
"cameras" SET Transform eulerAngles (-4.973246904331647 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0429255383206537
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1187484926281548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.002183199572333949
"cameras/drone/drone0" SET Transform localPosition (-0.6350627140081079 0.020261665717614064 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4653243407677805 0.9571048528910241 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 9 16)
"cameras/drone/drone0" SET Transform localScale (1.17628229408594 1.17628229408594 1.17628229408594)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -17 -3)
"cameras/drone/drone1" SET Transform localScale (1.0390949625484474 1.0390949625484474 1.0390949625484474)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3134782146719335 0)
"cameras" SET Transform eulerAngles (-13.604905819218605 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5295267092624661
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.654214724529321
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13030918990552812
"cameras/drone/drone0" SET Transform localPosition (0.3136433847117397 0.05572215521354135 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5662763849745767 1.1457863588462525 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -2 -10)
"cameras/drone/drone0" SET Transform localScale (1.060135502974271 1.060135502974271 1.060135502974271)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -19 1)
"cameras/drone/drone1" SET Transform localScale (1.0449152773728794 1.0449152773728794 1.0449152773728794)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.609518552677207 0)
"cameras" SET Transform eulerAngles (-16.017854772955115 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6824818807214721
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4056841862371767
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2989796536278048
"cameras/drone/drone0" SET Transform localPosition (0.4755551558883606 -0.07991580708741458 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6477549382665668 1.2268983798347706 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 13 -3)
"cameras/drone/drone0" SET Transform localScale (1.0797002205886053 1.0797002205886053 1.0797002205886053)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -19 10)
"cameras/drone/drone1" SET Transform localScale (0.7306644961197617 0.7306644961197617 0.7306644961197617)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.789767268849351 0)
"cameras" SET Transform eulerAngles (-8.235832953901511 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.439759719010362
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4239935887260446
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2750213949009637
"cameras/drone/drone0" SET Transform localPosition (-0.5133373802991782 0.10688234079569386 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17627013173947947 0.9908389596983826 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 1 19)
"cameras/drone/drone0" SET Transform localScale (0.9587870948224242 0.9587870948224242 0.9587870948224242)
"cameras/drone/drone1" SET Transform localEulerAngles (13 17 -9)
"cameras/drone/drone1" SET Transform localScale (0.7334157811187242 0.7334157811187242 0.7334157811187242)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.956222089355028 0)
"cameras" SET Transform eulerAngles (13.780691968085115 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5651591185110322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4107310574059981
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35219137393860067
"cameras/drone/drone0" SET Transform localPosition (0.47219259646541456 0.3553232381196752 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8214943971362214 1.2085710554243347 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -18 11)
"cameras/drone/drone0" SET Transform localScale (1.0548073345266258 1.0548073345266258 1.0548073345266258)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -15 -20)
"cameras/drone/drone1" SET Transform localScale (1.0668539270366364 1.0668539270366364 1.0668539270366364)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8519577796798643 0)
"cameras" SET Transform eulerAngles (3.389566553323604 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9600812706298165
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6722263467508878
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10312083252209839
"cameras/drone/drone0" SET Transform localPosition (-0.9109098230855797 0.4872669110674826 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12712364778290652 0.8267123609624842 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 1 -11)
"cameras/drone/drone0" SET Transform localScale (0.7160916698378157 0.7160916698378157 0.7160916698378157)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 1 19)
"cameras/drone/drone1" SET Transform localScale (0.9538814378372742 0.9538814378372742 0.9538814378372742)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7975728362768297 0)
"cameras" SET Transform eulerAngles (4.808374834515419 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.429662842460911
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9069720118454496
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19588554978342684
"cameras/drone/drone0" SET Transform localPosition (0.21396205193751916 -0.25509200936941107 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.34078560031207605 0.8680622778067768 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 3 15)
"cameras/drone/drone0" SET Transform localScale (0.6266895517876488 0.6266895517876488 0.6266895517876488)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -19 -5)
"cameras/drone/drone1" SET Transform localScale (0.6165184297246901 0.6165184297246901 0.6165184297246901)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7387696265906216 0)
"cameras" SET Transform eulerAngles (-8.79271361859345 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1617530829352507
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.791552907188132
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2044475820959563
"cameras/drone/drone0" SET Transform localPosition (0.11804276055856211 0.5133116617505729 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.27943918805730894 0.9153212536873117 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -3 -15)
"cameras/drone/drone0" SET Transform localScale (1.2111289708057722 1.2111289708057722 1.2111289708057722)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 5 8)
"cameras/drone/drone1" SET Transform localScale (1.1612965539825328 1.1612965539825328 1.1612965539825328)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.126849967375624 0)
"cameras" SET Transform eulerAngles (-2.5624893607141104 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1097128187200824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7632578983881877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.286621662946882
"cameras/drone/drone0" SET Transform localPosition (-0.6097773496045724 0.10989561783083507 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9835926110884596 1.0463359116918711 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -11 -7)
"cameras/drone/drone0" SET Transform localScale (1.244425247151105 1.244425247151105 1.244425247151105)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -12 1)
"cameras/drone/drone1" SET Transform localScale (0.6924144062791509 0.6924144062791509 0.6924144062791509)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.464310208324914 0)
"cameras" SET Transform eulerAngles (10.911860140481338 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.412517361183025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2949086557108695
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26213803858892915
"cameras/drone/drone0" SET Transform localPosition (0.5429645642228744 0.22796554254849616 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7605073064536512 1.2530494795788165 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 2 0)
"cameras/drone/drone0" SET Transform localScale (1.1524114778142338 1.1524114778142338 1.1524114778142338)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -11 -8)
"cameras/drone/drone1" SET Transform localScale (0.9510835140434195 0.9510835140434195 0.9510835140434195)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.558827324491286 0)
"cameras" SET Transform eulerAngles (-1.2646095611275427 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9145740309295128
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2023455122599078
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31376194965432197
"cameras/drone/drone0" SET Transform localPosition (0.0887790670129367 -0.1196538910367973 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7946854294965096 1.051622070724766 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -11 16)
"cameras/drone/drone0" SET Transform localScale (0.7297329958677461 0.7297329958677461 0.7297329958677461)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -17 19)
"cameras/drone/drone1" SET Transform localScale (1.1840431882500828 1.1840431882500828 1.1840431882500828)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.813152615099533 0)
"cameras" SET Transform eulerAngles (-0.4127726618008438 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8455801326710584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.093180845222778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17773386131601093
"cameras/drone/drone0" SET Transform localPosition (0.8913835791147593 0.44839943055612624 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0384558097747256 1.0250308100620695 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -5 -2)
"cameras/drone/drone0" SET Transform localScale (1.2840683996683122 1.2840683996683122 1.2840683996683122)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -15 11)
"cameras/drone/drone1" SET Transform localScale (1.4547207130479562 1.4547207130479562 1.4547207130479562)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.041224095446481 0)
"cameras" SET Transform eulerAngles (13.256911273961833 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6361297358383271
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2265709721860532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35467455863242464
"cameras/drone/drone0" SET Transform localPosition (0.8843237079773065 -0.15427377665733283 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8212622428856492 1.1526942056997806 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 18 13)
"cameras/drone/drone0" SET Transform localScale (0.7385060773930191 0.7385060773930191 0.7385060773930191)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -12 -2)
"cameras/drone/drone1" SET Transform localScale (0.6574620993987826 0.6574620993987826 0.6574620993987826)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.952213258167706 0)
"cameras" SET Transform eulerAngles (-19.77977944040814 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1562648526421262
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0796526751639766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2346819708028535
"cameras/drone/drone0" SET Transform localPosition (-0.06973045439166392 -0.18028774597942016 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.088983511465403 1.2442729437238822 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 14 13)
"cameras/drone/drone0" SET Transform localScale (1.0064159575056064 1.0064159575056064 1.0064159575056064)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -3 11)
"cameras/drone/drone1" SET Transform localScale (0.9149195539844068 0.9149195539844068 0.9149195539844068)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.266161300341388 0)
"cameras" SET Transform eulerAngles (-3.140767974243733 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4354807665356564
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2584078008636226
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10218874697627674
"cameras/drone/drone0" SET Transform localPosition (-0.49599086362047073 -0.05958549556597653 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0423180366256326 1.0687437093406518 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 2 13)
"cameras/drone/drone0" SET Transform localScale (0.8791110990245017 0.8791110990245017 0.8791110990245017)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -8 15)
"cameras/drone/drone1" SET Transform localScale (1.459211573472802 1.459211573472802 1.459211573472802)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.223843472465774 0)
"cameras" SET Transform eulerAngles (-9.700095245123745 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3454197390541052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0020494641714044
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3709991714706167
"cameras/drone/drone0" SET Transform localPosition (0.9776844858846545 0.48277363212996377 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1041343062744404 1.2143734448037116 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -8 -9)
"cameras/drone/drone0" SET Transform localScale (0.6086089341124227 0.6086089341124227 0.6086089341124227)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -1 12)
"cameras/drone/drone1" SET Transform localScale (1.229199977847537 1.229199977847537 1.229199977847537)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.114655404741999 0)
"cameras" SET Transform eulerAngles (8.782168826472457 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4716639184283619
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5586364530574617
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31815298471497555
"cameras/drone/drone0" SET Transform localPosition (0.8143806467675494 0.1813436814452128 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05738149311530072 0.9914666897084736 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 15 -19)
"cameras/drone/drone0" SET Transform localScale (1.0702289835111083 1.0702289835111083 1.0702289835111083)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 2 2)
"cameras/drone/drone1" SET Transform localScale (0.7375834575289201 0.7375834575289201 0.7375834575289201)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5911887783478416 0)
"cameras" SET Transform eulerAngles (8.56755208950728 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3297659336585606
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5669930928682736
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19860323657569198
"cameras/drone/drone0" SET Transform localPosition (-0.11109433595392115 0.6729095267953131 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.39611515531076125 1.0169393471746506 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 14 -2)
"cameras/drone/drone0" SET Transform localScale (0.6690292437638715 0.6690292437638715 0.6690292437638715)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 1 -20)
"cameras/drone/drone1" SET Transform localScale (0.6080901568581558 0.6080901568581558 0.6080901568581558)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.119350110088234 0)
"cameras" SET Transform eulerAngles (-12.70229148125904 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6146307986904247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5518725808217133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.032769843315969015
"cameras/drone/drone0" SET Transform localPosition (0.9561732041633284 0.059993422475140445 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.33124661994093485 0.9092835999339495 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 13 -19)
"cameras/drone/drone0" SET Transform localScale (1.2039548635420845 1.2039548635420845 1.2039548635420845)
"cameras/drone/drone1" SET Transform localEulerAngles (6 13 -17)
"cameras/drone/drone1" SET Transform localScale (1.2508990657111283 1.2508990657111283 1.2508990657111283)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.479809599850029 0)
"cameras" SET Transform eulerAngles (-9.696784443553916 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7047287974093348
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9124124465877113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08094382225295403
"cameras/drone/drone0" SET Transform localPosition (-0.544979136996465 0.411594988787447 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4717995127707513 1.1299371807240224 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -5 3)
"cameras/drone/drone0" SET Transform localScale (1.288367971149273 1.288367971149273 1.288367971149273)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -4 -12)
"cameras/drone/drone1" SET Transform localScale (0.6059350026814435 0.6059350026814435 0.6059350026814435)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.465739504481588 0)
"cameras" SET Transform eulerAngles (9.108678009469369 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5183383787911677
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.149631828704149
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10052050441651815
"cameras/drone/drone0" SET Transform localPosition (-1.0628085937050695 -0.12513288238484105 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32584439704694734 0.986645336938498 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 20 17)
"cameras/drone/drone0" SET Transform localScale (0.8233819097624797 0.8233819097624797 0.8233819097624797)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -6 5)
"cameras/drone/drone1" SET Transform localScale (0.8616236305920131 0.8616236305920131 0.8616236305920131)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.971117970145983 0)
"cameras" SET Transform eulerAngles (-7.694068827727879 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5440634328513656
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7780497183167392
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17677299877562028
"cameras/drone/drone0" SET Transform localPosition (-0.6976901954449019 0.12378724940517788 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1894350982589723 1.108630649852083 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -7 -1)
"cameras/drone/drone0" SET Transform localScale (1.2560098226481855 1.2560098226481855 1.2560098226481855)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -5 18)
"cameras/drone/drone1" SET Transform localScale (1.101486232915284 1.101486232915284 1.101486232915284)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.702955102174955 0)
"cameras" SET Transform eulerAngles (-14.077061790229099 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5021763764958344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0971349528710443
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3983566633709983
"cameras/drone/drone0" SET Transform localPosition (1.1255032606026452 0.542804998660992 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5099476448242123 1.0561469267880041 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 5 8)
"cameras/drone/drone0" SET Transform localScale (0.9210706886166641 0.9210706886166641 0.9210706886166641)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -16 4)
"cameras/drone/drone1" SET Transform localScale (0.8939963416177112 0.8939963416177112 0.8939963416177112)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.414870081021814 0)
"cameras" SET Transform eulerAngles (-10.602685727248492 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.917943672618218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.918687231621027
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10775919892366762
"cameras/drone/drone0" SET Transform localPosition (-0.03694777816264794 0.07274212245091866 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1103453362709501 1.2302787782570497 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -17 -13)
"cameras/drone/drone0" SET Transform localScale (1.0486105269451274 1.0486105269451274 1.0486105269451274)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 6 11)
"cameras/drone/drone1" SET Transform localScale (0.84800554103145 0.84800554103145 0.84800554103145)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.795470220232529 0)
"cameras" SET Transform eulerAngles (19.62747195583684 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1414416105110143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9655143569289848
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27942911485853317
"cameras/drone/drone0" SET Transform localPosition (-0.7759298731040443 -0.11467963239033502 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8491895330202863 0.8535378296153764 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -5 14)
"cameras/drone/drone0" SET Transform localScale (1.3264597240688523 1.3264597240688523 1.3264597240688523)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -19 6)
"cameras/drone/drone1" SET Transform localScale (1.259550179575793 1.259550179575793 1.259550179575793)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.652262651090628 0)
"cameras" SET Transform eulerAngles (-8.802014430761208 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5385678166541065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7486649581534361
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2942635839500161
"cameras/drone/drone0" SET Transform localPosition (-0.7014575537728257 0.38525570558775674 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7753455233288367 1.0584430212095435 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 6 -14)
"cameras/drone/drone0" SET Transform localScale (0.9129772668611535 0.9129772668611535 0.9129772668611535)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -8 17)
"cameras/drone/drone1" SET Transform localScale (0.8884474980403714 0.8884474980403714 0.8884474980403714)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8175449732400395 0)
"cameras" SET Transform eulerAngles (2.7613053712095663 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1771001465993793
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.563425056534443
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19133565837878586
"cameras/drone/drone0" SET Transform localPosition (0.8695039121614816 -0.09556517126475778 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3728716802175791 1.0154301741769136 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -10 -8)
"cameras/drone/drone0" SET Transform localScale (1.4065814271974268 1.4065814271974268 1.4065814271974268)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 1 11)
"cameras/drone/drone1" SET Transform localScale (1.484905802207972 1.484905802207972 1.484905802207972)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.162433133514741 0)
"cameras" SET Transform eulerAngles (-9.251822836002459 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7155934734189467
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7431328462331548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.228055250099332
"cameras/drone/drone0" SET Transform localPosition (0.6915977047082895 0.4571647640736353 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5474876248578783 1.2238611959825658 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 2 -13)
"cameras/drone/drone0" SET Transform localScale (1.076598775851577 1.076598775851577 1.076598775851577)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -10 -2)
"cameras/drone/drone1" SET Transform localScale (1.194329003280671 1.194329003280671 1.194329003280671)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.027266891896343 0)
"cameras" SET Transform eulerAngles (-5.378282919167594 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1854549324116692
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0981808470886727
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36849664989893266
"cameras/drone/drone0" SET Transform localPosition (0.36334115933025624 0.20620876439360342 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9559767444208511 1.2475055934564865 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 18 3)
"cameras/drone/drone0" SET Transform localScale (0.8900414551514277 0.8900414551514277 0.8900414551514277)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 15 -2)
"cameras/drone/drone1" SET Transform localScale (0.7217568745823534 0.7217568745823534 0.7217568745823534)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4966901086826905 0)
"cameras" SET Transform eulerAngles (18.28210426632768 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6491011638278796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1180769252932266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.056186884915930296
"cameras/drone/drone0" SET Transform localPosition (-0.7600056078186872 -0.2495163605607305 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.015256360085899 0.9252445097688163 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 11 7)
"cameras/drone/drone0" SET Transform localScale (1.4002142748494952 1.4002142748494952 1.4002142748494952)
"cameras/drone/drone1" SET Transform localEulerAngles (17 13 -6)
"cameras/drone/drone1" SET Transform localScale (1.2119061857720637 1.2119061857720637 1.2119061857720637)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3615113116126274 0)
"cameras" SET Transform eulerAngles (-9.475547215935771 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4144887388060352
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6177396569971658
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0981296480636357
"cameras/drone/drone0" SET Transform localPosition (-0.07454990399471284 0.5157597347963339 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7545793695325076 0.919033040350385 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -17 18)
"cameras/drone/drone0" SET Transform localScale (0.6989269316028658 0.6989269316028658 0.6989269316028658)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -3 5)
"cameras/drone/drone1" SET Transform localScale (0.8942112678480381 0.8942112678480381 0.8942112678480381)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2061294370672435 0)
"cameras" SET Transform eulerAngles (-9.722182623639423 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.151218812280589
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0510185608927216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13599987051645998
"cameras/drone/drone0" SET Transform localPosition (-0.8692245036134243 -0.15131977916541334 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.176645450466088 1.0914932046976444 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -3 11)
"cameras/drone/drone0" SET Transform localScale (1.261692514535846 1.261692514535846 1.261692514535846)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -16 20)
"cameras/drone/drone1" SET Transform localScale (1.0529362015015726 1.0529362015015726 1.0529362015015726)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.082119731302277 0)
"cameras" SET Transform eulerAngles (-18.785106813467124 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6163243373213227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7711015935546497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0628250577529474
"cameras/drone/drone0" SET Transform localPosition (-1.034120933420275 0.5224977234901562 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.24372469591869983 0.9433318638931623 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 18 -4)
"cameras/drone/drone0" SET Transform localScale (0.8447518627683812 0.8447518627683812 0.8447518627683812)
"cameras/drone/drone1" SET Transform localEulerAngles (3 6 -19)
"cameras/drone/drone1" SET Transform localScale (1.0029725287402265 1.0029725287402265 1.0029725287402265)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.039527060310576 0)
"cameras" SET Transform eulerAngles (16.350491101602962 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9507554814533172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6815008459617728
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.021417939266881715
"cameras/drone/drone0" SET Transform localPosition (-0.6428756518945838 -0.12684351542895173 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.395474114150411 1.1558301028099358 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -19 -11)
"cameras/drone/drone0" SET Transform localScale (1.2438229125369227 1.2438229125369227 1.2438229125369227)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -9 5)
"cameras/drone/drone1" SET Transform localScale (1.1448359107045034 1.1448359107045034 1.1448359107045034)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.772232752615854 0)
"cameras" SET Transform eulerAngles (2.995098233771806 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2579144852685982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7648959037226892
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2841106666349153
"cameras/drone/drone0" SET Transform localPosition (0.42409749009422626 -0.009564118397819732 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0701123175063005 1.0595062142441634 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -11 -19)
"cameras/drone/drone0" SET Transform localScale (1.12512773331306 1.12512773331306 1.12512773331306)
"cameras/drone/drone1" SET Transform localEulerAngles (2 13 15)
"cameras/drone/drone1" SET Transform localScale (0.7530704232997532 0.7530704232997532 0.7530704232997532)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.685310753199401 0)
"cameras" SET Transform eulerAngles (-14.093146563915502 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.496611147169693
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5375314536336302
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32927689935627724
"cameras/drone/drone0" SET Transform localPosition (-0.49925983583164857 0.250776585338453 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03247689727768832 1.2682245699345929 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 10 8)
"cameras/drone/drone0" SET Transform localScale (1.362156222177429 1.362156222177429 1.362156222177429)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 11 15)
"cameras/drone/drone1" SET Transform localScale (1.150431924297231 1.150431924297231 1.150431924297231)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8210003680909086 0)
"cameras" SET Transform eulerAngles (-13.541084487907415 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9553573216254831
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6552382941699153
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3818908478305949
"cameras/drone/drone0" SET Transform localPosition (-0.9769512675864181 0.354418772345015 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5656330499987056 0.9295975960133802 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 8 -6)
"cameras/drone/drone0" SET Transform localScale (1.21298318867288 1.21298318867288 1.21298318867288)
"cameras/drone/drone1" SET Transform localEulerAngles (0 5 -6)
"cameras/drone/drone1" SET Transform localScale (1.2528801761288109 1.2528801761288109 1.2528801761288109)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.40307291533934 0)
"cameras" SET Transform eulerAngles (18.157980689977826 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2508892832017493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.959460634386974
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3329836814483398
"cameras/drone/drone0" SET Transform localPosition (-1.1522722055593804 -0.2249298034950677 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2311176649033534 1.0580849078817776 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -5 -18)
"cameras/drone/drone0" SET Transform localScale (1.2911697649527878 1.2911697649527878 1.2911697649527878)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -20 12)
"cameras/drone/drone1" SET Transform localScale (0.7735513563787224 0.7735513563787224 0.7735513563787224)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.193041514903538 0)
"cameras" SET Transform eulerAngles (-10.996872668386043 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7059109418700078
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4909500573107417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06988246818965282
"cameras/drone/drone0" SET Transform localPosition (0.05148561095674631 -0.2377719355684778 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.039931895762481 1.0848577894766605 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -19 -1)
"cameras/drone/drone0" SET Transform localScale (0.861190649508409 0.861190649508409 0.861190649508409)
"cameras/drone/drone1" SET Transform localEulerAngles (4 8 6)
"cameras/drone/drone1" SET Transform localScale (0.6892027952116128 0.6892027952116128 0.6892027952116128)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.194697560257447 0)
"cameras" SET Transform eulerAngles (-19.227845153016048 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3191477034464625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4647728814082415
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.010013014616182448
"cameras/drone/drone0" SET Transform localPosition (0.46277161681678036 0.06257609450191831 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5091822815060321 1.2415875672476402 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -12 7)
"cameras/drone/drone0" SET Transform localScale (1.4654243869411832 1.4654243869411832 1.4654243869411832)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 1 20)
"cameras/drone/drone1" SET Transform localScale (0.836730889119315 0.836730889119315 0.836730889119315)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.323976254993809 0)
"cameras" SET Transform eulerAngles (15.627127631146692 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8977200150917131
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1393791482852142
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12508334178392141
"cameras/drone/drone0" SET Transform localPosition (1.0913969921074187 -0.017293523828297575 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.43157040407835845 1.0402174454901874 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -8 18)
"cameras/drone/drone0" SET Transform localScale (1.154588482722646 1.154588482722646 1.154588482722646)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -19 -3)
"cameras/drone/drone1" SET Transform localScale (0.9502212277060939 0.9502212277060939 0.9502212277060939)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7637554940402405 0)
"cameras" SET Transform eulerAngles (-2.963765242351659 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.013526931212887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.71059635645
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23324086953187365
"cameras/drone/drone0" SET Transform localPosition (-0.7900761094302391 -0.15166682786560132 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.43987384495707293 0.8272990546212706 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 7 -19)
"cameras/drone/drone0" SET Transform localScale (1.039109262377796 1.039109262377796 1.039109262377796)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 9 0)
"cameras/drone/drone1" SET Transform localScale (1.1972342159669034 1.1972342159669034 1.1972342159669034)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1899424247044212 0)
"cameras" SET Transform eulerAngles (-8.906150958586148 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6560395360130507
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4424246568448502
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08362579424230687
"cameras/drone/drone0" SET Transform localPosition (-0.04182377677254401 0.03733583515408684 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0975589376448645 1.2667735295937963 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 13 20)
"cameras/drone/drone0" SET Transform localScale (1.1041589696794782 1.1041589696794782 1.1041589696794782)
"cameras/drone/drone1" SET Transform localEulerAngles (5 12 -14)
"cameras/drone/drone1" SET Transform localScale (0.6251097223128853 0.6251097223128853 0.6251097223128853)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.898365848170714 0)
"cameras" SET Transform eulerAngles (4.721782052871632 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9766155194970574
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6892424095600456
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3615379748716753
"cameras/drone/drone0" SET Transform localPosition (0.8602243968648693 0.4765857350522977 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5860067746580246 1.1536680692946928 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -2 7)
"cameras/drone/drone0" SET Transform localScale (1.248924313600215 1.248924313600215 1.248924313600215)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 9 -10)
"cameras/drone/drone1" SET Transform localScale (1.04968591265945 1.04968591265945 1.04968591265945)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.485493456959368 0)
"cameras" SET Transform eulerAngles (-13.635435449744628 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7708807871808017
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.165167619635648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.318999642418991
"cameras/drone/drone0" SET Transform localPosition (-0.8532530564426084 -0.09364128831129187 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.948131826366366 0.8498612819537305 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -17 -8)
"cameras/drone/drone0" SET Transform localScale (0.874938583995224 0.874938583995224 0.874938583995224)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -13 13)
"cameras/drone/drone1" SET Transform localScale (0.9681855395525554 0.9681855395525554 0.9681855395525554)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2691470445939306 0)
"cameras" SET Transform eulerAngles (-8.724140717825396 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7493801348102282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2659353155428035
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2909097663344708
"cameras/drone/drone0" SET Transform localPosition (1.0994795035996356 0.5206522832431995 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08865513290829052 1.2690369074386987 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -5 17)
"cameras/drone/drone0" SET Transform localScale (0.9590501709699675 0.9590501709699675 0.9590501709699675)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -13 16)
"cameras/drone/drone1" SET Transform localScale (0.7470964351719717 0.7470964351719717 0.7470964351719717)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.496049265742334 0)
"cameras" SET Transform eulerAngles (-12.744242947937643 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4035002628754394
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4454774010500477
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16021081352671335
"cameras/drone/drone0" SET Transform localPosition (0.9973084148818996 0.18418929526958955 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3576618972358542 0.9781421763849667 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 8 -12)
"cameras/drone/drone0" SET Transform localScale (1.3627120128135082 1.3627120128135082 1.3627120128135082)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -14 -17)
"cameras/drone/drone1" SET Transform localScale (1.1003685388584175 1.1003685388584175 1.1003685388584175)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.226796519880011 0)
"cameras" SET Transform eulerAngles (7.582939701332499 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6977457852933437
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5718615900909416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22889327668961804
"cameras/drone/drone0" SET Transform localPosition (0.8719805568599759 -0.17342619777448637 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.112614810929281 1.1992018586877584 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -11 6)
"cameras/drone/drone0" SET Transform localScale (1.099863671851888 1.099863671851888 1.099863671851888)
"cameras/drone/drone1" SET Transform localEulerAngles (6 14 -12)
"cameras/drone/drone1" SET Transform localScale (0.866226821084208 0.866226821084208 0.866226821084208)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.38283198587042 0)
"cameras" SET Transform eulerAngles (18.168837979110712 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.560450182652183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9102622149368517
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2996683456507993
"cameras/drone/drone0" SET Transform localPosition (0.6630212652721341 0.11865080217891005 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8027238825427804 1.0858171803612162 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 20 -9)
"cameras/drone/drone0" SET Transform localScale (1.3392822933428872 1.3392822933428872 1.3392822933428872)
"cameras/drone/drone1" SET Transform localEulerAngles (0 6 19)
"cameras/drone/drone1" SET Transform localScale (0.6679589229237684 0.6679589229237684 0.6679589229237684)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.615257384419368 0)
"cameras" SET Transform eulerAngles (-7.621603574762483 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.24013829977963
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.009715159403172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2608526931511906
"cameras/drone/drone0" SET Transform localPosition (-0.5671548433378373 0.6817010908696761 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.918953096332557 1.072678745119112 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 7 6)
"cameras/drone/drone0" SET Transform localScale (1.494025587615438 1.494025587615438 1.494025587615438)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -16 3)
"cameras/drone/drone1" SET Transform localScale (0.6115011153721985 0.6115011153721985 0.6115011153721985)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9890435221961233 0)
"cameras" SET Transform eulerAngles (4.072842243698787 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2111387998359053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3115016376159006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3977412798478307
"cameras/drone/drone0" SET Transform localPosition (-0.7045814120148853 0.3873758448908153 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0323518417274535 1.0278972713590182 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -11 -6)
"cameras/drone/drone0" SET Transform localScale (1.3247320339415425 1.3247320339415425 1.3247320339415425)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -13 -9)
"cameras/drone/drone1" SET Transform localScale (1.2594669650818338 1.2594669650818338 1.2594669650818338)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.066442576147178 0)
"cameras" SET Transform eulerAngles (5.896294272250163 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40140167832886053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7285789501463498
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09216776675886473
"cameras/drone/drone0" SET Transform localPosition (-0.9896255221404364 0.3733253072027763 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5585577396178759 1.089297180981806 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 0 -13)
"cameras/drone/drone0" SET Transform localScale (0.7003126908677241 0.7003126908677241 0.7003126908677241)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 6 19)
"cameras/drone/drone1" SET Transform localScale (0.8486843217194618 0.8486843217194618 0.8486843217194618)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.785983440260043 0)
"cameras" SET Transform eulerAngles (13.639822536594266 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7664744913483286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.552396995803974
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.386005541436076
"cameras/drone/drone0" SET Transform localPosition (1.1046434630412632 -0.01667124510287138 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.551205664519838 0.9130689492885733 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 2 -14)
"cameras/drone/drone0" SET Transform localScale (1.3608109129493715 1.3608109129493715 1.3608109129493715)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 10 -10)
"cameras/drone/drone1" SET Transform localScale (1.36189324991721 1.36189324991721 1.36189324991721)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2302845308887678 0)
"cameras" SET Transform eulerAngles (-1.5652675532119567 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3255438993746655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6271212411059235
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.011548623975175244
"cameras/drone/drone0" SET Transform localPosition (-0.2819207982713017 0.2301629323685394 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5804380690459231 1.0328590881644542 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -9 12)
"cameras/drone/drone0" SET Transform localScale (1.2877435333809337 1.2877435333809337 1.2877435333809337)
"cameras/drone/drone1" SET Transform localEulerAngles (19 5 -9)
"cameras/drone/drone1" SET Transform localScale (0.9493575201156681 0.9493575201156681 0.9493575201156681)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.122731535171452 0)
"cameras" SET Transform eulerAngles (19.030495008749753 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8948963462006073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5288685366216752
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.019083316391796768
"cameras/drone/drone0" SET Transform localPosition (-0.9926563313180644 0.4755401580982232 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7268235578348428 1.1105775866092469 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 12 -16)
"cameras/drone/drone0" SET Transform localScale (0.846205987124151 0.846205987124151 0.846205987124151)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -16 19)
"cameras/drone/drone1" SET Transform localScale (1.2507842599698777 1.2507842599698777 1.2507842599698777)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.016304505976408 0)
"cameras" SET Transform eulerAngles (-3.254157119717501 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2925581615361161
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8404467802611177
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12722243787215276
"cameras/drone/drone0" SET Transform localPosition (-0.5362142233213203 0.12194836177259943 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6781392532071318 1.2911418985741396 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 4 13)
"cameras/drone/drone0" SET Transform localScale (1.3635046035333722 1.3635046035333722 1.3635046035333722)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -5 3)
"cameras/drone/drone1" SET Transform localScale (0.759564493482131 0.759564493482131 0.759564493482131)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.156711171368904 0)
"cameras" SET Transform eulerAngles (4.795971824917778 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4677644144740642
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7555077312884855
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1393295702406892
"cameras/drone/drone0" SET Transform localPosition (1.1735855021846133 -0.005455918124766257 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.118484704835845 1.26257482815344 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 6 4)
"cameras/drone/drone0" SET Transform localScale (0.9068045938022584 0.9068045938022584 0.9068045938022584)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -16 16)
"cameras/drone/drone1" SET Transform localScale (1.0322485706011029 1.0322485706011029 1.0322485706011029)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.755559149512347 0)
"cameras" SET Transform eulerAngles (-15.677060411398935 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7631420904603295
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9910863994641385
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.00025847361262978377
"cameras/drone/drone0" SET Transform localPosition (0.7253556504231302 0.2951317886532226 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1848140260317377 0.8948204532085462 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -2 8)
"cameras/drone/drone0" SET Transform localScale (1.2455980497055046 1.2455980497055046 1.2455980497055046)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -5 -17)
"cameras/drone/drone1" SET Transform localScale (1.46741185154914 1.46741185154914 1.46741185154914)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.141201110891716 0)
"cameras" SET Transform eulerAngles (0.5468768666198116 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6561172458279738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2037341286519252
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3636556346912784
"cameras/drone/drone0" SET Transform localPosition (-0.7934189809498247 0.41392826895675455 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8760125542586026 1.214461294632977 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -20 14)
"cameras/drone/drone0" SET Transform localScale (0.9303405143993715 0.9303405143993715 0.9303405143993715)
"cameras/drone/drone1" SET Transform localEulerAngles (15 9 -20)
"cameras/drone/drone1" SET Transform localScale (1.4988180698708167 1.4988180698708167 1.4988180698708167)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.501050883531322 0)
"cameras" SET Transform eulerAngles (14.950448021403595 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.372112542935247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6218536204783596
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23489933350844755
"cameras/drone/drone0" SET Transform localPosition (-0.745150819166783 0.5757989955586078 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.080567181012841 0.8126279523590179 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 6 -19)
"cameras/drone/drone0" SET Transform localScale (0.6132013147846451 0.6132013147846451 0.6132013147846451)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -13 -15)
"cameras/drone/drone1" SET Transform localScale (0.9674360203162399 0.9674360203162399 0.9674360203162399)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4226040407353775 0)
"cameras" SET Transform eulerAngles (-17.419441876199425 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5318316466969462
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2765140196173363
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24146859404125434
"cameras/drone/drone0" SET Transform localPosition (-0.49136468122018795 -0.007081763881681857 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8174956522185437 0.922400281165253 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 3 19)
"cameras/drone/drone0" SET Transform localScale (1.18161473599271 1.18161473599271 1.18161473599271)
"cameras/drone/drone1" SET Transform localEulerAngles (11 15 -1)
"cameras/drone/drone1" SET Transform localScale (1.4860273864183509 1.4860273864183509 1.4860273864183509)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.231987426668466 0)
"cameras" SET Transform eulerAngles (0.8492027734310028 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1254650458778606
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0390605965308863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2565494406966075
"cameras/drone/drone0" SET Transform localPosition (0.5192300913281442 -0.24967934829095312 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6577020321914713 0.9611481157257966 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 15 9)
"cameras/drone/drone0" SET Transform localScale (0.9520949252807374 0.9520949252807374 0.9520949252807374)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 13 -12)
"cameras/drone/drone1" SET Transform localScale (1.2358267728573376 1.2358267728573376 1.2358267728573376)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.719290444367624 0)
"cameras" SET Transform eulerAngles (-15.702958660350959 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3433998647442416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4744911264476044
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3119512457610784
"cameras/drone/drone0" SET Transform localPosition (0.8690909150958956 -0.030959694072185073 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6262996682647617 1.2588271682348506 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 11 -19)
"cameras/drone/drone0" SET Transform localScale (1.1424019326545642 1.1424019326545642 1.1424019326545642)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 18 -12)
"cameras/drone/drone1" SET Transform localScale (1.1340446793070362 1.1340446793070362 1.1340446793070362)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1767990877947594 0)
"cameras" SET Transform eulerAngles (-15.569502383764181 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0898132477580518
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8070801328947663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3529203418375142
"cameras/drone/drone0" SET Transform localPosition (-0.24073544628061094 -0.2860283215527865 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4462797504506464 0.8334680223222457 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 1 -8)
"cameras/drone/drone0" SET Transform localScale (1.047273725171469 1.047273725171469 1.047273725171469)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -6 19)
"cameras/drone/drone1" SET Transform localScale (0.641296852905936 0.641296852905936 0.641296852905936)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9768170065062223 0)
"cameras" SET Transform eulerAngles (16.559479305488424 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.046575607430752
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1850897825797801
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21661601933521424
"cameras/drone/drone0" SET Transform localPosition (-0.09267928778700618 -0.08570072963989855 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.890181146111791 0.9091440605916566 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -10 -2)
"cameras/drone/drone0" SET Transform localScale (0.7697942903379997 0.7697942903379997 0.7697942903379997)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 2 -11)
"cameras/drone/drone1" SET Transform localScale (1.036273575890309 1.036273575890309 1.036273575890309)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2163366994691245 0)
"cameras" SET Transform eulerAngles (3.983332122085411 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5992674583567457
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0627904682663285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2749153325561026
"cameras/drone/drone0" SET Transform localPosition (-0.576716078206341 -0.08069947298679586 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.094554629085745 1.0476186241034036 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 14 1)
"cameras/drone/drone0" SET Transform localScale (0.9772478357363462 0.9772478357363462 0.9772478357363462)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -13 6)
"cameras/drone/drone1" SET Transform localScale (1.2682689481923917 1.2682689481923917 1.2682689481923917)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4297308595032145 0)
"cameras" SET Transform eulerAngles (-3.62056324533393 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9905168820722211
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9091646428619673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08614196856935728
"cameras/drone/drone0" SET Transform localPosition (1.024337794191332 0.20545618999315501 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0054481105522666 1.2263144786812217 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 16 2)
"cameras/drone/drone0" SET Transform localScale (1.3699231225646513 1.3699231225646513 1.3699231225646513)
"cameras/drone/drone1" SET Transform localEulerAngles (12 1 -1)
"cameras/drone/drone1" SET Transform localScale (1.1702626830554692 1.1702626830554692 1.1702626830554692)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.542372693502638 0)
"cameras" SET Transform eulerAngles (-11.896540809839369 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3799184628331462
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7960196200471814
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08006044461848223
"cameras/drone/drone0" SET Transform localPosition (-1.006115533963126 0.6244200664684354 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7991479961248047 0.9399027883292153 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -7 -20)
"cameras/drone/drone0" SET Transform localScale (0.7095667306878918 0.7095667306878918 0.7095667306878918)
"cameras/drone/drone1" SET Transform localEulerAngles (11 7 12)
"cameras/drone/drone1" SET Transform localScale (0.7666948426555488 0.7666948426555488 0.7666948426555488)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 100
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.873225462002987 0)
"cameras" SET Transform eulerAngles (11.443305092497095 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9285061882113255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8283443008905966
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.260847463223217
"cameras/drone/drone0" SET Transform localPosition (0.46157916341969885 -0.2920415206499843 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.565971454654381 1.1087269288372725 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 5 -13)
"cameras/drone/drone0" SET Transform localScale (1.238183440515825 1.238183440515825 1.238183440515825)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -13 -16)
"cameras/drone/drone1" SET Transform localScale (1.2588293726724034 1.2588293726724034 1.2588293726724034)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.47019891747647 0)
"cameras" SET Transform eulerAngles (3.3077240063801163 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0879646081226413
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1368303735910124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14923072632121712
"cameras/drone/drone0" SET Transform localPosition (0.33951845562657956 0.08478023210623525 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5852246240857535 1.2643621977168507 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 19 12)
"cameras/drone/drone0" SET Transform localScale (0.6465800440878383 0.6465800440878383 0.6465800440878383)
"cameras/drone/drone1" SET Transform localEulerAngles (0 13 -14)
"cameras/drone/drone1" SET Transform localScale (1.191609120786877 1.191609120786877 1.191609120786877)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.117791117297229 0)
"cameras" SET Transform eulerAngles (0.9900820840564428 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6887519058452006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1328426915780614
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3638657511488903
"cameras/drone/drone0" SET Transform localPosition (-0.49315735341485645 0.20181526604987493 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05587327213206872 1.1319803299514732 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -15 -4)
"cameras/drone/drone0" SET Transform localScale (0.8607814341733386 0.8607814341733386 0.8607814341733386)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 14 16)
"cameras/drone/drone1" SET Transform localScale (1.1885181861393277 1.1885181861393277 1.1885181861393277)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.273158182108177 0)
"cameras" SET Transform eulerAngles (2.4898116710261604 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5330757959575778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5587158576640345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1002017035009148
"cameras/drone/drone0" SET Transform localPosition (0.4272711589289888 0.6612705420640494 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.47246600947513473 1.153655000912642 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 15 7)
"cameras/drone/drone0" SET Transform localScale (1.0095025213982458 1.0095025213982458 1.0095025213982458)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -13 -18)
"cameras/drone/drone1" SET Transform localScale (0.6642783267620589 0.6642783267620589 0.6642783267620589)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.64166285325061 0)
"cameras" SET Transform eulerAngles (-8.93592791268973 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9168853424595622
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8986628247395965
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.021726365327382216
"cameras/drone/drone0" SET Transform localPosition (0.9937015244689122 0.4269103957562252 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3449677684058392 0.8393517628501126 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 13 -2)
"cameras/drone/drone0" SET Transform localScale (1.4677008458078045 1.4677008458078045 1.4677008458078045)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -13 18)
"cameras/drone/drone1" SET Transform localScale (1.1584055767304222 1.1584055767304222 1.1584055767304222)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.651919010212931 0)
"cameras" SET Transform eulerAngles (15.421743584878207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.155563117407835
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7234038310957485
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23944186399988274
"cameras/drone/drone0" SET Transform localPosition (0.5096023769109417 -0.12385051795022856 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1069245958439613 1.2269190842741837 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -13 -18)
"cameras/drone/drone0" SET Transform localScale (1.2042197207635414 1.2042197207635414 1.2042197207635414)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -11 19)
"cameras/drone/drone1" SET Transform localScale (0.8703998042713758 0.8703998042713758 0.8703998042713758)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.564459027763152 0)
"cameras" SET Transform eulerAngles (12.516285212104165 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7088229905384764
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5931534457469425
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1360086709260504
"cameras/drone/drone0" SET Transform localPosition (-0.762436674056493 0.021237880678374343 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3716990171921686 0.9635162454263075 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 9 -8)
"cameras/drone/drone0" SET Transform localScale (0.7098224866649774 0.7098224866649774 0.7098224866649774)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -6 -5)
"cameras/drone/drone1" SET Transform localScale (1.4154801112717719 1.4154801112717719 1.4154801112717719)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.299008038286514 0)
"cameras" SET Transform eulerAngles (-13.574568323904588 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2231801657747947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3127438859798373
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35631938769587806
"cameras/drone/drone0" SET Transform localPosition (0.9260869962587994 0.6741014552094295 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1972170447284669 0.936858552407885 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 13 -4)
"cameras/drone/drone0" SET Transform localScale (1.3382227246239031 1.3382227246239031 1.3382227246239031)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -8 -12)
"cameras/drone/drone1" SET Transform localScale (1.2092282006951582 1.2092282006951582 1.2092282006951582)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.729367411058215 0)
"cameras" SET Transform eulerAngles (15.735227020884423 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.478789821083081
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7979356175919818
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10212965827914311
"cameras/drone/drone0" SET Transform localPosition (0.6853911675765323 0.3532386631903823 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.29875236250932935 0.993558894598112 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -12 -1)
"cameras/drone/drone0" SET Transform localScale (1.1114241438775685 1.1114241438775685 1.1114241438775685)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -11 11)
"cameras/drone/drone1" SET Transform localScale (1.4965118933858728 1.4965118933858728 1.4965118933858728)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.9781063430000305 0)
"cameras" SET Transform eulerAngles (-10.726124313429803 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7861628251638788
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.087021894885782
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.039778867107122556
"cameras/drone/drone0" SET Transform localPosition (-0.471824350140818 0.034299938757127835 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2776140635736505 0.8314772698776363 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -17 7)
"cameras/drone/drone0" SET Transform localScale (1.300563236134899 1.300563236134899 1.300563236134899)
"cameras/drone/drone1" SET Transform localEulerAngles (1 18 -19)
"cameras/drone/drone1" SET Transform localScale (0.940681144979078 0.940681144979078 0.940681144979078)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.274964658409628 0)
"cameras" SET Transform eulerAngles (-19.80853585228256 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7313933589854622
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6855172397349927
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0997073219336671
"cameras/drone/drone0" SET Transform localPosition (-1.1436028743547246 0.0789083221611489 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20892106089244278 0.9981624397591995 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -9 13)
"cameras/drone/drone0" SET Transform localScale (0.8609649347828124 0.8609649347828124 0.8609649347828124)
"cameras/drone/drone1" SET Transform localEulerAngles (6 15 10)
"cameras/drone/drone1" SET Transform localScale (0.7239723320472237 0.7239723320472237 0.7239723320472237)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1745405684873 0)
"cameras" SET Transform eulerAngles (-9.512638033187848 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.684545949372954
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.946521430002778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3346484695365035
"cameras/drone/drone0" SET Transform localPosition (-0.09022830204793797 0.17433742107665512 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.56207118983137 1.2924965918749376 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -12 -7)
"cameras/drone/drone0" SET Transform localScale (1.1421446658073795 1.1421446658073795 1.1421446658073795)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -18 -11)
"cameras/drone/drone1" SET Transform localScale (1.0749049882499562 1.0749049882499562 1.0749049882499562)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.589595625488751 0)
"cameras" SET Transform eulerAngles (16.30639531107778 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49030855944574825
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.117112747394114
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16359486577293542
"cameras/drone/drone0" SET Transform localPosition (-0.9963172008014929 0.02788761353626451 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22273638171136456 1.104675218587406 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -12 -2)
"cameras/drone/drone0" SET Transform localScale (0.887634522319189 0.887634522319189 0.887634522319189)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -5 4)
"cameras/drone/drone1" SET Transform localScale (1.1155114002659157 1.1155114002659157 1.1155114002659157)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.349040926384042 0)
"cameras" SET Transform eulerAngles (11.577023648407025 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.397327324954567
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2655679381870328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1842630448857676
"cameras/drone/drone0" SET Transform localPosition (0.21389421419305021 -0.011992246830629993 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9752419735423857 1.211672048935538 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 4 13)
"cameras/drone/drone0" SET Transform localScale (1.4745898717789379 1.4745898717789379 1.4745898717789379)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -10 -6)
"cameras/drone/drone1" SET Transform localScale (0.7038153374731257 0.7038153374731257 0.7038153374731257)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2154614920413165 0)
"cameras" SET Transform eulerAngles (12.389693385342902 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0037702613118453
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4719308042274564
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.001572941493812108
"cameras/drone/drone0" SET Transform localPosition (0.4175372727190656 0.21879587385802807 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9682523308922768 1.1100219967412288 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 6 10)
"cameras/drone/drone0" SET Transform localScale (1.3892666253704875 1.3892666253704875 1.3892666253704875)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -17 16)
"cameras/drone/drone1" SET Transform localScale (0.7841172822436034 0.7841172822436034 0.7841172822436034)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.163827023521881 0)
"cameras" SET Transform eulerAngles (9.838480365407133 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5661634681705867
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8419781064517793
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0508422310973125
"cameras/drone/drone0" SET Transform localPosition (-1.1552635791295263 0.6522785149697927 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7125764196885913 0.9082346709379281 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 9 3)
"cameras/drone/drone0" SET Transform localScale (1.0903373467347348 1.0903373467347348 1.0903373467347348)
"cameras/drone/drone1" SET Transform localEulerAngles (4 0 -19)
"cameras/drone/drone1" SET Transform localScale (0.8676330270480368 0.8676330270480368 0.8676330270480368)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.31144059970047 0)
"cameras" SET Transform eulerAngles (10.011544046694432 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5490326717197536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1660766485964005
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27928487478564346
"cameras/drone/drone0" SET Transform localPosition (-0.9762956270749611 0.024461596649145212 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7292227343997018 1.117181121077565 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 14 -15)
"cameras/drone/drone0" SET Transform localScale (1.0430829285233914 1.0430829285233914 1.0430829285233914)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 11 9)
"cameras/drone/drone1" SET Transform localScale (1.1699163782926694 1.1699163782926694 1.1699163782926694)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.103208836045706 0)
"cameras" SET Transform eulerAngles (17.343792913039422 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0582712273375345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5723624813273656
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16629332446246328
"cameras/drone/drone0" SET Transform localPosition (0.5108079905716412 0.6631106477951638 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18291403320588673 1.172695815928718 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -12 -20)
"cameras/drone/drone0" SET Transform localScale (0.681191116772323 0.681191116772323 0.681191116772323)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 9 -10)
"cameras/drone/drone1" SET Transform localScale (1.2637860920511939 1.2637860920511939 1.2637860920511939)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1348063760450655 0)
"cameras" SET Transform eulerAngles (18.737644287598656 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3744300249846173
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7714667271583346
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17447945982326024
"cameras/drone/drone0" SET Transform localPosition (1.167908865877756 0.6324023022105631 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5637411808624211 0.9054780337789301 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -12 1)
"cameras/drone/drone0" SET Transform localScale (0.8764149716484582 0.8764149716484582 0.8764149716484582)
"cameras/drone/drone1" SET Transform localEulerAngles (15 3 -10)
"cameras/drone/drone1" SET Transform localScale (0.6279974502387599 0.6279974502387599 0.6279974502387599)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.869648127168675 0)
"cameras" SET Transform eulerAngles (-11.630472746865518 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9249234278688435
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8118904147774415
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28536336102659965
"cameras/drone/drone0" SET Transform localPosition (-0.2084287543716965 0.3462041065064529 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12066563994005541 1.1122430316810188 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -5 -12)
"cameras/drone/drone0" SET Transform localScale (1.3312314573266488 1.3312314573266488 1.3312314573266488)
"cameras/drone/drone1" SET Transform localEulerAngles (9 18 8)
"cameras/drone/drone1" SET Transform localScale (1.496618295882159 1.496618295882159 1.496618295882159)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1026253769872154 0)
"cameras" SET Transform eulerAngles (4.818812133577644 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5887433929743628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6244866783809642
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28228670149545965
"cameras/drone/drone0" SET Transform localPosition (0.490307549934069 0.40031509881186284 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.770563752784932 1.0603958997337264 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 12 -13)
"cameras/drone/drone0" SET Transform localScale (0.6538073713734908 0.6538073713734908 0.6538073713734908)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -6 10)
"cameras/drone/drone1" SET Transform localScale (1.4889511542471001 1.4889511542471001 1.4889511542471001)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.050680643462199 0)
"cameras" SET Transform eulerAngles (-2.3742948156032284 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3062672767574424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1111309685344766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31912303553327226
"cameras/drone/drone0" SET Transform localPosition (0.8667580004048931 0.5994517553903322 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6653729271797977 0.95459827289641 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -20 -14)
"cameras/drone/drone0" SET Transform localScale (1.4889358996336859 1.4889358996336859 1.4889358996336859)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -5 1)
"cameras/drone/drone1" SET Transform localScale (1.2005600905477012 1.2005600905477012 1.2005600905477012)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.34084594775008 0)
"cameras" SET Transform eulerAngles (10.828007542205658 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.59665536782134
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2811392758940077
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24826803898393363
"cameras/drone/drone0" SET Transform localPosition (1.094730905677985 0.3486088324780415 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0441489635796617 1.0885027369935107 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 4 -11)
"cameras/drone/drone0" SET Transform localScale (0.8933600979311538 0.8933600979311538 0.8933600979311538)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -15 -10)
"cameras/drone/drone1" SET Transform localScale (1.4657972701560118 1.4657972701560118 1.4657972701560118)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9498618092763405 0)
"cameras" SET Transform eulerAngles (-13.295865825138812 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7783408075602025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.771332892350761
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13037809189789895
"cameras/drone/drone0" SET Transform localPosition (1.083068200884327 -0.29278172561254684 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8965257735373722 1.0751579176311379 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 1 -4)
"cameras/drone/drone0" SET Transform localScale (0.9985226502714559 0.9985226502714559 0.9985226502714559)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -6 -12)
"cameras/drone/drone1" SET Transform localScale (0.6443615832907376 0.6443615832907376 0.6443615832907376)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.934836486941545 0)
"cameras" SET Transform eulerAngles (6.642144937662383 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9674129231675564
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3905675399935544
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3947676259986239
"cameras/drone/drone0" SET Transform localPosition (0.5008368713847222 0.18329417885385352 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.15480954179653095 1.1470115535219434 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -20 5)
"cameras/drone/drone0" SET Transform localScale (0.9692413765981197 0.9692413765981197 0.9692413765981197)
"cameras/drone/drone1" SET Transform localEulerAngles (15 9 0)
"cameras/drone/drone1" SET Transform localScale (1.1675377740646886 1.1675377740646886 1.1675377740646886)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.441112209218894 0)
"cameras" SET Transform eulerAngles (3.386525282439486 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9962112670838744
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6333302619435202
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12270412106028622
"cameras/drone/drone0" SET Transform localPosition (0.05487601925841035 0.5897280659184203 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.824134848464565 1.1981642271244644 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 7 -12)
"cameras/drone/drone0" SET Transform localScale (1.494423461084805 1.494423461084805 1.494423461084805)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -15 5)
"cameras/drone/drone1" SET Transform localScale (1.047058120895949 1.047058120895949 1.047058120895949)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.330972475237787 0)
"cameras" SET Transform eulerAngles (3.21250446906971 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.087095024346226
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5901369159956285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.089027836214439
"cameras/drone/drone0" SET Transform localPosition (-0.3906549587227297 0.2422476454953411 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3825619747112552 1.1066758545063335 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -18 6)
"cameras/drone/drone0" SET Transform localScale (0.7992643456222841 0.7992643456222841 0.7992643456222841)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -6 1)
"cameras/drone/drone1" SET Transform localScale (1.4934849936777452 1.4934849936777452 1.4934849936777452)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5611119439578793 0)
"cameras" SET Transform eulerAngles (-17.341955297705937 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1729489986909611
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2440878989134336
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1459949221038109
"cameras/drone/drone0" SET Transform localPosition (0.8249687319853367 -0.15693637442887415 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07066967429722038 1.1934070566984032 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -19 2)
"cameras/drone/drone0" SET Transform localScale (1.193939319548594 1.193939319548594 1.193939319548594)
"cameras/drone/drone1" SET Transform localEulerAngles (13 20 -1)
"cameras/drone/drone1" SET Transform localScale (0.6631480169280795 0.6631480169280795 0.6631480169280795)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.658386812108954 0)
"cameras" SET Transform eulerAngles (5.657001257742586 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.959207912673324
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0840225617377761
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14583137941973212
"cameras/drone/drone0" SET Transform localPosition (0.46890325043681935 0.11132117697617444 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9686645268639261 1.298379361645546 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 15 20)
"cameras/drone/drone0" SET Transform localScale (1.2253417580315935 1.2253417580315935 1.2253417580315935)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -11 4)
"cameras/drone/drone1" SET Transform localScale (1.0262118186030633 1.0262118186030633 1.0262118186030633)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.639134324230207 0)
"cameras" SET Transform eulerAngles (1.329681056674282 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4954031203708763
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9725437888628551
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2126768243246584
"cameras/drone/drone0" SET Transform localPosition (-0.965099675602547 0.2999809263994651 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6311402791265028 0.9547781476602373 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 4 -12)
"cameras/drone/drone0" SET Transform localScale (1.0440585369459394 1.0440585369459394 1.0440585369459394)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -6 -12)
"cameras/drone/drone1" SET Transform localScale (1.1283742376924886 1.1283742376924886 1.1283742376924886)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3537007783142245 0)
"cameras" SET Transform eulerAngles (-16.34537450046072 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9976067295653422
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1668521299933456
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15099440544063994
"cameras/drone/drone0" SET Transform localPosition (-0.7138375710447089 0.3383232465049603 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5533055384529519 0.968936226423895 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 1 7)
"cameras/drone/drone0" SET Transform localScale (1.1860655205682127 1.1860655205682127 1.1860655205682127)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -15 6)
"cameras/drone/drone1" SET Transform localScale (1.3273124365326876 1.3273124365326876 1.3273124365326876)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.57438627886919 0)
"cameras" SET Transform eulerAngles (1.529275302818462 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5142339394246722
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1131740920839763
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1850554116341718
"cameras/drone/drone0" SET Transform localPosition (-0.017974206580239294 0.133070932180737 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0219841087827166 1.2372153046725987 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 15 -2)
"cameras/drone/drone0" SET Transform localScale (0.7113030467427647 0.7113030467427647 0.7113030467427647)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -2 7)
"cameras/drone/drone1" SET Transform localScale (0.6118275664613153 0.6118275664613153 0.6118275664613153)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.642928769403291 0)
"cameras" SET Transform eulerAngles (-14.572745211693267 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4912860519783275
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.202825262376804
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06531260976930149
"cameras/drone/drone0" SET Transform localPosition (-0.7176321828156165 0.6743733433727568 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20568250871339844 1.1104188716641858 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -2 -18)
"cameras/drone/drone0" SET Transform localScale (1.045544903237228 1.045544903237228 1.045544903237228)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -11 5)
"cameras/drone/drone1" SET Transform localScale (0.7604747459825432 0.7604747459825432 0.7604747459825432)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.707366020065055 0)
"cameras" SET Transform eulerAngles (7.065380551514316 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1748428337486185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0518650586347043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2886218376888278
"cameras/drone/drone0" SET Transform localPosition (0.4272060058647962 0.6400236206658623 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8566076024693601 1.2436131710603933 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 9 20)
"cameras/drone/drone0" SET Transform localScale (0.6952179238695761 0.6952179238695761 0.6952179238695761)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -2 8)
"cameras/drone/drone1" SET Transform localScale (0.609211288273695 0.609211288273695 0.609211288273695)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.545987298044161 0)
"cameras" SET Transform eulerAngles (4.377859604105268 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4595494436004621
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9265813634970774
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37974210831246347
"cameras/drone/drone0" SET Transform localPosition (-0.3554484795391948 -0.2328774790666191 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5665919111902276 1.2930677139941995 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -1 17)
"cameras/drone/drone0" SET Transform localScale (0.6932123709884332 0.6932123709884332 0.6932123709884332)
"cameras/drone/drone1" SET Transform localEulerAngles (16 4 14)
"cameras/drone/drone1" SET Transform localScale (1.3907769601051707 1.3907769601051707 1.3907769601051707)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7169822609580345 0)
"cameras" SET Transform eulerAngles (11.97329221058078 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8143948896246964
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.415185565276258
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2334778779354746
"cameras/drone/drone0" SET Transform localPosition (0.8726278272987893 0.5471348812762482 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.108407993046782 0.9997578868018329 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 2 8)
"cameras/drone/drone0" SET Transform localScale (0.8625992760062502 0.8625992760062502 0.8625992760062502)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -9 -20)
"cameras/drone/drone1" SET Transform localScale (0.7285953834701073 0.7285953834701073 0.7285953834701073)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.507293694262488 0)
"cameras" SET Transform eulerAngles (-19.373846432378482 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2025115061266338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0615799171613072
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06182666416144662
"cameras/drone/drone0" SET Transform localPosition (-1.1151730442238776 0.22740437652710427 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0739822694705363 1.1943590190515216 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -9 -10)
"cameras/drone/drone0" SET Transform localScale (0.7161515307492354 0.7161515307492354 0.7161515307492354)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -6 -6)
"cameras/drone/drone1" SET Transform localScale (1.12195043564068 1.12195043564068 1.12195043564068)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.654892463965667 0)
"cameras" SET Transform eulerAngles (-10.205161784814067 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2935273933047582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5176427358803448
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2388050050667462
"cameras/drone/drone0" SET Transform localPosition (0.6910560572488285 0.49954445322799274 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1139562623584702 1.1288435358093616 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -8 2)
"cameras/drone/drone0" SET Transform localScale (0.880211678168827 0.880211678168827 0.880211678168827)
"cameras/drone/drone1" SET Transform localEulerAngles (18 9 11)
"cameras/drone/drone1" SET Transform localScale (0.7635835291167561 0.7635835291167561 0.7635835291167561)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.656533285198552 0)
"cameras" SET Transform eulerAngles (-6.625568475651487 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.776296736059216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4421265678368014
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10435636894832992
"cameras/drone/drone0" SET Transform localPosition (0.45995225450970434 0.41850685204086396 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.47513016944038244 1.0943862955332573 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -1 -20)
"cameras/drone/drone0" SET Transform localScale (1.2445066634357178 1.2445066634357178 1.2445066634357178)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 13 1)
"cameras/drone/drone1" SET Transform localScale (0.7571755487008175 0.7571755487008175 0.7571755487008175)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.136972749160089 0)
"cameras" SET Transform eulerAngles (6.72111675935103 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8985449779580836
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9926111728864623
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23720073742669756
"cameras/drone/drone0" SET Transform localPosition (0.7947767920412261 0.17814422281586656 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.20812787270705768 1.0334422502383869 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 5 15)
"cameras/drone/drone0" SET Transform localScale (0.641053412289306 0.641053412289306 0.641053412289306)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -8 -1)
"cameras/drone/drone1" SET Transform localScale (0.8731261428832129 0.8731261428832129 0.8731261428832129)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.673789896498781 0)
"cameras" SET Transform eulerAngles (8.79892568095434 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5795899803866673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1424795142207773
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21790563828433174
"cameras/drone/drone0" SET Transform localPosition (-0.6106571442386187 -0.014840790314458896 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40854416520064585 1.0462973425454445 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -12 13)
"cameras/drone/drone0" SET Transform localScale (0.931982623503908 0.931982623503908 0.931982623503908)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -12 10)
"cameras/drone/drone1" SET Transform localScale (1.483681532016106 1.483681532016106 1.483681532016106)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.489354565425607 0)
"cameras" SET Transform eulerAngles (17.052418602223113 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9809911581811429
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2935365605029077
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3316418410991564
"cameras/drone/drone0" SET Transform localPosition (1.1959341432230468 0.08540549665393887 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9984765425194853 1.1089949730527677 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 8 6)
"cameras/drone/drone0" SET Transform localScale (1.3602802996632057 1.3602802996632057 1.3602802996632057)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 10 9)
"cameras/drone/drone1" SET Transform localScale (0.8462886895295632 0.8462886895295632 0.8462886895295632)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.772198118259961 0)
"cameras" SET Transform eulerAngles (17.00846692967091 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5510078684390618
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4050793036228493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.021312090254788266
"cameras/drone/drone0" SET Transform localPosition (-0.08176393599783682 -0.0817250620223618 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0719067277987233 0.8773579824784108 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 4 -20)
"cameras/drone/drone0" SET Transform localScale (1.390478663244329 1.390478663244329 1.390478663244329)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -15 0)
"cameras/drone/drone1" SET Transform localScale (0.9941417371045922 0.9941417371045922 0.9941417371045922)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9120623058092856 0)
"cameras" SET Transform eulerAngles (-12.757474687205551 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9131402016324023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.794281398270204
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3281258113107226
"cameras/drone/drone0" SET Transform localPosition (-0.19581139310117535 0.25864697138976683 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1279917161628299 0.8192736882342424 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -14 13)
"cameras/drone/drone0" SET Transform localScale (0.7027885541783521 0.7027885541783521 0.7027885541783521)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -2 9)
"cameras/drone/drone1" SET Transform localScale (1.4963897831405704 1.4963897831405704 1.4963897831405704)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.373679506249515 0)
"cameras" SET Transform eulerAngles (-9.728619776690257 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9957491761296824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9204854498269268
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28348263231370846
"cameras/drone/drone0" SET Transform localPosition (-0.4116166057769425 0.3100849829953785 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22121962969483677 1.0282339856248626 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 1 9)
"cameras/drone/drone0" SET Transform localScale (1.4875976757474065 1.4875976757474065 1.4875976757474065)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 11 -10)
"cameras/drone/drone1" SET Transform localScale (0.7676080814746574 0.7676080814746574 0.7676080814746574)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4370229218334676 0)
"cameras" SET Transform eulerAngles (-17.739644326524996 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5572304548722508
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1054652813143104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22489380039057247
"cameras/drone/drone0" SET Transform localPosition (-0.09226545010330289 0.09385106459195353 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.929441255533668 1.0554481456693048 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -19 -12)
"cameras/drone/drone0" SET Transform localScale (0.8390028471751207 0.8390028471751207 0.8390028471751207)
"cameras/drone/drone1" SET Transform localEulerAngles (3 16 -4)
"cameras/drone/drone1" SET Transform localScale (1.3404025088531224 1.3404025088531224 1.3404025088531224)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7232377862591886 0)
"cameras" SET Transform eulerAngles (-18.39763507619804 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45299158175602255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5304544912444276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17089594495850913
"cameras/drone/drone0" SET Transform localPosition (0.12147473328306702 0.2674431443458905 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8883571413492752 0.8515460233337594 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 5 -3)
"cameras/drone/drone0" SET Transform localScale (0.9308787990500951 0.9308787990500951 0.9308787990500951)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -1 17)
"cameras/drone/drone1" SET Transform localScale (0.9986955394470912 0.9986955394470912 0.9986955394470912)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.422415343910294 0)
"cameras" SET Transform eulerAngles (14.183943975427347 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7113650014556427
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8208767780281097
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07489144864067106
"cameras/drone/drone0" SET Transform localPosition (0.36170370147827424 0.5150228982352532 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4091882236604858 1.2272160406850354 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -12 -9)
"cameras/drone/drone0" SET Transform localScale (1.025270014022 1.025270014022 1.025270014022)
"cameras/drone/drone1" SET Transform localEulerAngles (12 18 8)
"cameras/drone/drone1" SET Transform localScale (0.6199933068283792 0.6199933068283792 0.6199933068283792)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6949335733319857 0)
"cameras" SET Transform eulerAngles (19.248129973645746 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2100342347602073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6230908472244028
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29424920184065034
"cameras/drone/drone0" SET Transform localPosition (-0.3975984944861215 0.57176549037759 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.39286844975612145 0.9771155993070728 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 3 -13)
"cameras/drone/drone0" SET Transform localScale (1.4442789130519964 1.4442789130519964 1.4442789130519964)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -3 -20)
"cameras/drone/drone1" SET Transform localScale (0.6765284558788958 0.6765284558788958 0.6765284558788958)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8488416357186805 0)
"cameras" SET Transform eulerAngles (-10.599339573051406 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4342331467837481
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8768748614007635
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16748366131026274
"cameras/drone/drone0" SET Transform localPosition (0.4034866361745162 0.49023744471876135 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08318439996460603 1.0538122153493412 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -17 2)
"cameras/drone/drone0" SET Transform localScale (1.1019609917572093 1.1019609917572093 1.1019609917572093)
"cameras/drone/drone1" SET Transform localEulerAngles (4 18 5)
"cameras/drone/drone1" SET Transform localScale (0.6781418385469383 0.6781418385469383 0.6781418385469383)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.013531689444993 0)
"cameras" SET Transform eulerAngles (3.267991526457518 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3211360229901032
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.987228770697016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1859757933877614
"cameras/drone/drone0" SET Transform localPosition (0.4656267542090886 0.4591610931453903 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2063507679465657 1.0896130846914107 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 5 0)
"cameras/drone/drone0" SET Transform localScale (1.3861677887934047 1.3861677887934047 1.3861677887934047)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -16 -12)
"cameras/drone/drone1" SET Transform localScale (1.131683424725606 1.131683424725606 1.131683424725606)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.693948618038475 0)
"cameras" SET Transform eulerAngles (18.906517400126262 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6603512534702647
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0366372935312549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2126281128053154
"cameras/drone/drone0" SET Transform localPosition (-0.6548922529271042 0.025542944134999412 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3082686071585452 1.1710999730148302 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -15 -6)
"cameras/drone/drone0" SET Transform localScale (0.6042939533369193 0.6042939533369193 0.6042939533369193)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -20 11)
"cameras/drone/drone1" SET Transform localScale (0.6250719412430517 0.6250719412430517 0.6250719412430517)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3263578931402735 0)
"cameras" SET Transform eulerAngles (-4.1518869772710865 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4493661683553558
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9869374330194144
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.030814592415215315
"cameras/drone/drone0" SET Transform localPosition (-1.0572952009359091 0.2533994886326521 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.739691899886048 1.2261668887801058 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -9 2)
"cameras/drone/drone0" SET Transform localScale (1.252306611218705 1.252306611218705 1.252306611218705)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 18 1)
"cameras/drone/drone1" SET Transform localScale (0.918681215826102 0.918681215826102 0.918681215826102)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.414711979376806 0)
"cameras" SET Transform eulerAngles (8.690563509386152 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5624889058810632
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2304107586207202
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025901331217030334
"cameras/drone/drone0" SET Transform localPosition (-1.1676170811836546 0.45050504981634226 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11729267221652906 1.156856216358135 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -17 10)
"cameras/drone/drone0" SET Transform localScale (1.166899459717551 1.166899459717551 1.166899459717551)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -9 19)
"cameras/drone/drone1" SET Transform localScale (0.6052540965748031 0.6052540965748031 0.6052540965748031)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6834541109070105 0)
"cameras" SET Transform eulerAngles (14.977399621393879 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7513515166155069
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.403658089145965
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18537779493365958
"cameras/drone/drone0" SET Transform localPosition (-0.19190091790749442 0.168420520633289 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6633366934749354 0.8937455386409723 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 12 -14)
"cameras/drone/drone0" SET Transform localScale (1.0525693359275565 1.0525693359275565 1.0525693359275565)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -11 1)
"cameras/drone/drone1" SET Transform localScale (1.3456240428777866 1.3456240428777866 1.3456240428777866)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.656304420935631 0)
"cameras" SET Transform eulerAngles (-5.689386956207816 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5640120561346351
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3937442593468898
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26534616414778556
"cameras/drone/drone0" SET Transform localPosition (0.2994694289623534 -0.06893938488456058 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.13376166643490617 1.0123668293615218 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 14 19)
"cameras/drone/drone0" SET Transform localScale (1.0230985019431484 1.0230985019431484 1.0230985019431484)
"cameras/drone/drone1" SET Transform localEulerAngles (12 15 -17)
"cameras/drone/drone1" SET Transform localScale (1.1319128361577 1.1319128361577 1.1319128361577)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.836444920366413 0)
"cameras" SET Transform eulerAngles (-18.29950612891342 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4114087173875256
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1216370110319558
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12504363646069527
"cameras/drone/drone0" SET Transform localPosition (0.5171030139900963 0.06874448501012514 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0425799455095828 1.0187331889021545 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -13 13)
"cameras/drone/drone0" SET Transform localScale (0.8029470676191779 0.8029470676191779 0.8029470676191779)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 16 20)
"cameras/drone/drone1" SET Transform localScale (0.9441094592071919 0.9441094592071919 0.9441094592071919)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1620168031905096 0)
"cameras" SET Transform eulerAngles (16.822824406813872 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5082775191267315
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5436431588441075
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10879943956702026
"cameras/drone/drone0" SET Transform localPosition (-0.7630622965603291 0.2579059748323333 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5752966732784233 0.9752422515142749 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 9 -15)
"cameras/drone/drone0" SET Transform localScale (1.0515669563436063 1.0515669563436063 1.0515669563436063)
"cameras/drone/drone1" SET Transform localEulerAngles (10 7 9)
"cameras/drone/drone1" SET Transform localScale (0.7321770365754512 0.7321770365754512 0.7321770365754512)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.019710982880781 0)
"cameras" SET Transform eulerAngles (-7.725177930532174 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3629264074921834
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9985651403060402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.332969826837322
"cameras/drone/drone0" SET Transform localPosition (0.8100992139380845 0.12321020918007103 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5765550842187528 1.082482858502487 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 13 14)
"cameras/drone/drone0" SET Transform localScale (0.8452848371708573 0.8452848371708573 0.8452848371708573)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -18 15)
"cameras/drone/drone1" SET Transform localScale (1.082929101811521 1.082929101811521 1.082929101811521)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.995765232371676 0)
"cameras" SET Transform eulerAngles (-19.086328999311473 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.482685513752691
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3226010221283733
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3775507700946347
"cameras/drone/drone0" SET Transform localPosition (-0.9753004282912633 0.5031488732624572 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9432814092362054 1.069984080364137 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 11 -16)
"cameras/drone/drone0" SET Transform localScale (1.4645866197364654 1.4645866197364654 1.4645866197364654)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -2 -11)
"cameras/drone/drone1" SET Transform localScale (0.8955433748047716 0.8955433748047716 0.8955433748047716)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6191661505428208 0)
"cameras" SET Transform eulerAngles (15.171161603191415 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1079822283048977
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9205128884068285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26505557796100093
"cameras/drone/drone0" SET Transform localPosition (1.1063550337904589 0.40334338144861576 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.585951984618208 0.8601104472554173 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -13 16)
"cameras/drone/drone0" SET Transform localScale (0.7650832731953061 0.7650832731953061 0.7650832731953061)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -20 -3)
"cameras/drone/drone1" SET Transform localScale (1.3123642515645786 1.3123642515645786 1.3123642515645786)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.789071012389609 0)
"cameras" SET Transform eulerAngles (-4.953180309012533 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5038387626059428
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6030344212327299
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.056532366412378465
"cameras/drone/drone0" SET Transform localPosition (0.610409759668159 -0.27260914459828595 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3880780114469321 1.055727918070197 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 16 9)
"cameras/drone/drone0" SET Transform localScale (0.9595434711140733 0.9595434711140733 0.9595434711140733)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 10 -18)
"cameras/drone/drone1" SET Transform localScale (1.091694837054166 1.091694837054166 1.091694837054166)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.609140150573653 0)
"cameras" SET Transform eulerAngles (-2.4248294090379545 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7485448123544682
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3566521753217007
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3369417697162511
"cameras/drone/drone0" SET Transform localPosition (-0.5283236365966834 0.3305845575844127 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9267562236418525 1.2269250523519768 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 17 3)
"cameras/drone/drone0" SET Transform localScale (0.7232847575912051 0.7232847575912051 0.7232847575912051)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -16 -14)
"cameras/drone/drone1" SET Transform localScale (1.356273932588982 1.356273932588982 1.356273932588982)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9032589685196193 0)
"cameras" SET Transform eulerAngles (8.07909081671863 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5540166324820737
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7518716663177554
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3658238789071362
"cameras/drone/drone0" SET Transform localPosition (0.3699040431136307 0.5245915241238215 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7021967205073012 0.878526965301986 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -16 -8)
"cameras/drone/drone0" SET Transform localScale (0.6083650575361814 0.6083650575361814 0.6083650575361814)
"cameras/drone/drone1" SET Transform localEulerAngles (4 8 3)
"cameras/drone/drone1" SET Transform localScale (0.9375462665719809 0.9375462665719809 0.9375462665719809)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.375952385969814 0)
"cameras" SET Transform eulerAngles (10.310131528540264 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6692912941554915
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2018936134960025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11760840293731621
"cameras/drone/drone0" SET Transform localPosition (-0.8434722399893295 0.2567984410455691 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6540664633200932 1.0561963893279585 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -13 4)
"cameras/drone/drone0" SET Transform localScale (1.2581545791305766 1.2581545791305766 1.2581545791305766)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 14 18)
"cameras/drone/drone1" SET Transform localScale (0.8646493946506868 0.8646493946506868 0.8646493946506868)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.800232470478885 0)
"cameras" SET Transform eulerAngles (19.796377369028896 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.171023847485103
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3968590923750974
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3342287032053217
"cameras/drone/drone0" SET Transform localPosition (0.31547827011627927 0.3769986594404568 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9554647120102419 0.8174461040314316 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -17 4)
"cameras/drone/drone0" SET Transform localScale (1.2777741707029495 1.2777741707029495 1.2777741707029495)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -1 -16)
"cameras/drone/drone1" SET Transform localScale (1.2294787296173377 1.2294787296173377 1.2294787296173377)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0149203493332672 0)
"cameras" SET Transform eulerAngles (3.162329867872078 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3507390682680445
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.589503195975331
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04747975453602602
"cameras/drone/drone0" SET Transform localPosition (0.8399790340968785 0.2117613673120487 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.113593646649361 0.9800882576089585 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -14 -13)
"cameras/drone/drone0" SET Transform localScale (0.7108401536873838 0.7108401536873838 0.7108401536873838)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -15 16)
"cameras/drone/drone1" SET Transform localScale (0.6877540950863849 0.6877540950863849 0.6877540950863849)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.240544646492819 0)
"cameras" SET Transform eulerAngles (-18.4986982101703 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4956918887532824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6598773016602504
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26675626218048437
"cameras/drone/drone0" SET Transform localPosition (0.4599538464353803 0.4854675791507778 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7656848045473166 1.1274023877258128 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -1 -8)
"cameras/drone/drone0" SET Transform localScale (1.2735635420130504 1.2735635420130504 1.2735635420130504)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -14 -12)
"cameras/drone/drone1" SET Transform localScale (1.4546684688872844 1.4546684688872844 1.4546684688872844)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.816283943953931 0)
"cameras" SET Transform eulerAngles (-15.253398540112983 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5297306297497775
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9487387551375513
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3581573963070233
"cameras/drone/drone0" SET Transform localPosition (1.1502811844619714 -0.2043453748822855 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.570381007229504 1.1424379483065379 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 20 -17)
"cameras/drone/drone0" SET Transform localScale (1.231204950896236 1.231204950896236 1.231204950896236)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 5 -2)
"cameras/drone/drone1" SET Transform localScale (1.0696383660989823 1.0696383660989823 1.0696383660989823)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.466084566403475 0)
"cameras" SET Transform eulerAngles (-6.927377745114288 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5887857277964628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2296982177974227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04747498662638963
"cameras/drone/drone0" SET Transform localPosition (-0.7893868053931973 0.029101734566103044 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4597583453610362 0.8250467451190001 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -14 10)
"cameras/drone/drone0" SET Transform localScale (1.0067410635598006 1.0067410635598006 1.0067410635598006)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -4 -12)
"cameras/drone/drone1" SET Transform localScale (1.4842635786995824 1.4842635786995824 1.4842635786995824)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.012076913811285 0)
"cameras" SET Transform eulerAngles (-4.305278130403995 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4862699186228712
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.716633768120797
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20471423138823774
"cameras/drone/drone0" SET Transform localPosition (0.4512227590282374 0.08631095939893746 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.14311267825006357 1.100136319350793 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 1 1)
"cameras/drone/drone0" SET Transform localScale (1.0791885550884297 1.0791885550884297 1.0791885550884297)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -17 13)
"cameras/drone/drone1" SET Transform localScale (0.716448984100998 0.716448984100998 0.716448984100998)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5731070158921456 0)
"cameras" SET Transform eulerAngles (5.341578889201823 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6704728497353543
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9728387101090332
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.00140306865551052
"cameras/drone/drone0" SET Transform localPosition (-0.15991507053813248 -0.10096212874175187 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9263784915652311 1.1457625768022075 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 9 1)
"cameras/drone/drone0" SET Transform localScale (1.0310079473726113 1.0310079473726113 1.0310079473726113)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 8 6)
"cameras/drone/drone1" SET Transform localScale (0.6028607728746695 0.6028607728746695 0.6028607728746695)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.480338339563712 0)
"cameras" SET Transform eulerAngles (-11.461850188754532 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.298892979540863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5130907414893886
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1264398281042609
"cameras/drone/drone0" SET Transform localPosition (1.0008102524666465 -0.011206380839381136 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5070196309691106 0.8801858116765007 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 15 8)
"cameras/drone/drone0" SET Transform localScale (1.4468526441635277 1.4468526441635277 1.4468526441635277)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -12 -13)
"cameras/drone/drone1" SET Transform localScale (0.9350016871632035 0.9350016871632035 0.9350016871632035)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.52210963595252 0)
"cameras" SET Transform eulerAngles (16.83135022877879 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.121746141860131
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5727695873404786
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3579008484484151
"cameras/drone/drone0" SET Transform localPosition (1.1260438764627885 0.6980140766124772 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.879336043526814 1.2075193746481356 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -8 -19)
"cameras/drone/drone0" SET Transform localScale (0.956667116325917 0.956667116325917 0.956667116325917)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -4 -20)
"cameras/drone/drone1" SET Transform localScale (1.2645164003948097 1.2645164003948097 1.2645164003948097)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3581294033463553 0)
"cameras" SET Transform eulerAngles (1.4705004745429981 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5243496740260842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.166213647387567
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2644315893069001
"cameras/drone/drone0" SET Transform localPosition (-0.11577107321898694 -0.02425363721616486 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.29208109320223885 1.0147835411401789 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -11 8)
"cameras/drone/drone0" SET Transform localScale (1.3053070887257179 1.3053070887257179 1.3053070887257179)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 19 9)
"cameras/drone/drone1" SET Transform localScale (0.83286554392021 0.83286554392021 0.83286554392021)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.015176443038774 0)
"cameras" SET Transform eulerAngles (9.819419846259642 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5736939182706537
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6469763246353066
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10640426830305781
"cameras/drone/drone0" SET Transform localPosition (0.9744365316307622 0.360516332870551 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16709435591959232 0.8256206316660295 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 8 16)
"cameras/drone/drone0" SET Transform localScale (1.4544995325042414 1.4544995325042414 1.4544995325042414)
"cameras/drone/drone1" SET Transform localEulerAngles (4 4 -1)
"cameras/drone/drone1" SET Transform localScale (1.1143474770180029 1.1143474770180029 1.1143474770180029)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.426879007366613 0)
"cameras" SET Transform eulerAngles (-13.919767723060389 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4575152572537517
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2965971641324843
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13129189414394524
"cameras/drone/drone0" SET Transform localPosition (0.7846485103531167 -0.026268464524209778 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21413689542891934 1.0825597331927868 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -9 -12)
"cameras/drone/drone0" SET Transform localScale (1.3550309222758743 1.3550309222758743 1.3550309222758743)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -7 10)
"cameras/drone/drone1" SET Transform localScale (1.1119142341797237 1.1119142341797237 1.1119142341797237)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8225732432967936 0)
"cameras" SET Transform eulerAngles (15.21929428584231 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3577295197122552
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.897501154753687
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37885511847412956
"cameras/drone/drone0" SET Transform localPosition (-1.1674188549703464 0.18640151065424088 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.172581107090257 0.875768340162395 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 18 20)
"cameras/drone/drone0" SET Transform localScale (0.9936653777723683 0.9936653777723683 0.9936653777723683)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -3 -9)
"cameras/drone/drone1" SET Transform localScale (0.939219588402068 0.939219588402068 0.939219588402068)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0510310005930457 0)
"cameras" SET Transform eulerAngles (7.73320922809696 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.398267662175477
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1875696945117389
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3743478042225528
"cameras/drone/drone0" SET Transform localPosition (0.030610925717767135 0.507752538699743 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.749862523083112 1.2329218862667926 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -1 5)
"cameras/drone/drone0" SET Transform localScale (1.3385686028446173 1.3385686028446173 1.3385686028446173)
"cameras/drone/drone1" SET Transform localEulerAngles (10 15 18)
"cameras/drone/drone1" SET Transform localScale (1.1012236051427295 1.1012236051427295 1.1012236051427295)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.394552017782134 0)
"cameras" SET Transform eulerAngles (-16.82559076211422 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4698099065922077
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9716472386696955
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24897937401678175
"cameras/drone/drone0" SET Transform localPosition (0.8858080331527158 0.17681942717202576 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9145925693413952 1.0032585384316848 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 8 -12)
"cameras/drone/drone0" SET Transform localScale (0.7257748272285348 0.7257748272285348 0.7257748272285348)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -15 9)
"cameras/drone/drone1" SET Transform localScale (0.8421076803140068 0.8421076803140068 0.8421076803140068)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7895474598257275 0)
"cameras" SET Transform eulerAngles (9.143368915303629 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9749006582307889
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.493889110250275
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28015553867211296
"cameras/drone/drone0" SET Transform localPosition (0.5204644024186009 0.553304663313473 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7563680327062703 0.9604793603575018 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -17 10)
"cameras/drone/drone0" SET Transform localScale (1.0966185033192124 1.0966185033192124 1.0966185033192124)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 14 -2)
"cameras/drone/drone1" SET Transform localScale (1.024975596956323 1.024975596956323 1.024975596956323)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0950879882559685 0)
"cameras" SET Transform eulerAngles (11.757954306629038 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4363312487747373
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1580950243994081
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36303745742601956
"cameras/drone/drone0" SET Transform localPosition (-0.95350523104692 0.09663556363280273 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9543775976253788 0.8684175849230238 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 12 18)
"cameras/drone/drone0" SET Transform localScale (0.9497717192338893 0.9497717192338893 0.9497717192338893)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -10 -20)
"cameras/drone/drone1" SET Transform localScale (1.104420995871779 1.104420995871779 1.104420995871779)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.664603150994208 0)
"cameras" SET Transform eulerAngles (-3.284900557542393 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8911153085391028
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4490050716497507
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3156157936823904
"cameras/drone/drone0" SET Transform localPosition (-0.21405580615094588 0.3642433855319856 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6997818222078106 1.0029893595001873 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -7 -16)
"cameras/drone/drone0" SET Transform localScale (1.0481266144735844 1.0481266144735844 1.0481266144735844)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -11 -10)
"cameras/drone/drone1" SET Transform localScale (0.7974425499491524 0.7974425499491524 0.7974425499491524)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5327789858394087 0)
"cameras" SET Transform eulerAngles (-16.258312418885964 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0015815477885228
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0847924030508316
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27583368128819824
"cameras/drone/drone0" SET Transform localPosition (-0.9750933820694181 0.46317259232915925 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1317648208741533 1.1484785488150289 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 5 7)
"cameras/drone/drone0" SET Transform localScale (0.656881687942462 0.656881687942462 0.656881687942462)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -3 5)
"cameras/drone/drone1" SET Transform localScale (0.989659841803251 0.989659841803251 0.989659841803251)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6482863892982413 0)
"cameras" SET Transform eulerAngles (-14.268194058796269 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.517535545273257
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0274210154595325
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.046039364031496666
"cameras/drone/drone0" SET Transform localPosition (-0.5061058934551618 0.6270457457655294 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.48301279147867426 1.1221946101363809 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -13 18)
"cameras/drone/drone0" SET Transform localScale (1.2588880434579313 1.2588880434579313 1.2588880434579313)
"cameras/drone/drone1" SET Transform localEulerAngles (17 2 -2)
"cameras/drone/drone1" SET Transform localScale (1.1462014315943558 1.1462014315943558 1.1462014315943558)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.526514890902289 0)
"cameras" SET Transform eulerAngles (-3.1422567243650192 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2524152832393702
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1292000907921262
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05034147602267285
"cameras/drone/drone0" SET Transform localPosition (-0.7687243636350904 -0.1079257480851375 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.14330580881468635 1.1240851022077707 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -19 -6)
"cameras/drone/drone0" SET Transform localScale (0.9654191671681103 0.9654191671681103 0.9654191671681103)
"cameras/drone/drone1" SET Transform localEulerAngles (6 10 -4)
"cameras/drone/drone1" SET Transform localScale (1.4144397771505899 1.4144397771505899 1.4144397771505899)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2756786160967346 0)
"cameras" SET Transform eulerAngles (2.2934659972279476 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7276325595918693
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5229408124576544
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10623721236236312
"cameras/drone/drone0" SET Transform localPosition (-0.2981080263238941 0.18716016175406808 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0665909088804961 0.8063772840914376 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 13 20)
"cameras/drone/drone0" SET Transform localScale (0.8875198830392873 0.8875198830392873 0.8875198830392873)
"cameras/drone/drone1" SET Transform localEulerAngles (10 9 5)
"cameras/drone/drone1" SET Transform localScale (1.0921468079191528 1.0921468079191528 1.0921468079191528)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5238504412446177 0)
"cameras" SET Transform eulerAngles (18.97253653396698 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4999721350920603
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1256613869312584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16890897045287967
"cameras/drone/drone0" SET Transform localPosition (0.5111660639516031 -0.13948054117803682 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0269197206665757 0.908286046762306 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -5 -14)
"cameras/drone/drone0" SET Transform localScale (1.117962776002392 1.117962776002392 1.117962776002392)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -9 10)
"cameras/drone/drone1" SET Transform localScale (0.6351869653050445 0.6351869653050445 0.6351869653050445)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.477586758786353 0)
"cameras" SET Transform eulerAngles (0.10124709004795207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5843835490986153
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0421322045310304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.355789539575136
"cameras/drone/drone0" SET Transform localPosition (-0.5577901888303924 -0.022560986797780236 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.42320610833910743 1.0219314665523138 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 9 -12)
"cameras/drone/drone0" SET Transform localScale (0.9339759993779989 0.9339759993779989 0.9339759993779989)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -5 10)
"cameras/drone/drone1" SET Transform localScale (0.9664785975035528 0.9664785975035528 0.9664785975035528)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.924074266763353 0)
"cameras" SET Transform eulerAngles (-10.168507328799636 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2367537160678663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3304562457341673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3638470941570836
"cameras/drone/drone0" SET Transform localPosition (-0.4708680095175459 0.04953375921077935 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.41286041525344075 1.1624202553995928 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 9 3)
"cameras/drone/drone0" SET Transform localScale (1.157947577626329 1.157947577626329 1.157947577626329)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -17 -7)
"cameras/drone/drone1" SET Transform localScale (1.4044323693740872 1.4044323693740872 1.4044323693740872)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.313806102757092 0)
"cameras" SET Transform eulerAngles (8.970669364336334 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48824696077765595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9789740148431636
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32911277846338993
"cameras/drone/drone0" SET Transform localPosition (-0.5264855859566485 0.30984549676893475 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.14901258258950678 1.179129343627749 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -6 -19)
"cameras/drone/drone0" SET Transform localScale (1.1434133149191963 1.1434133149191963 1.1434133149191963)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 0 -10)
"cameras/drone/drone1" SET Transform localScale (1.4821666694932882 1.4821666694932882 1.4821666694932882)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.041511619194849 0)
"cameras" SET Transform eulerAngles (-10.021890169015544 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2116878952558336
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9607240914197495
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0698376543236726
"cameras/drone/drone0" SET Transform localPosition (0.6913354456130805 0.042150215852521045 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8974446011323842 1.2152310227944887 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 10 1)
"cameras/drone/drone0" SET Transform localScale (1.2870030780713146 1.2870030780713146 1.2870030780713146)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -13 6)
"cameras/drone/drone1" SET Transform localScale (1.2999223480227806 1.2999223480227806 1.2999223480227806)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.655442697724481 0)
"cameras" SET Transform eulerAngles (2.2043150822299893 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3940447376488032
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.54306874924169
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18308456530206405
"cameras/drone/drone0" SET Transform localPosition (0.8712325351626744 -0.11783959972991348 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1862505248618438 1.169882947270873 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 13 3)
"cameras/drone/drone0" SET Transform localScale (0.6697274556796585 0.6697274556796585 0.6697274556796585)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -3 -3)
"cameras/drone/drone1" SET Transform localScale (1.3966292067489268 1.3966292067489268 1.3966292067489268)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.981351037955789 0)
"cameras" SET Transform eulerAngles (-12.379266800189463 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4343448806985872
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9307931047340184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20312572438658552
"cameras/drone/drone0" SET Transform localPosition (1.1841552057264393 0.4745350300513575 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8601002291554078 1.0665908017547276 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 6 -20)
"cameras/drone/drone0" SET Transform localScale (0.8369413611369493 0.8369413611369493 0.8369413611369493)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 15 -8)
"cameras/drone/drone1" SET Transform localScale (1.2506904705451507 1.2506904705451507 1.2506904705451507)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.628469460038524 0)
"cameras" SET Transform eulerAngles (19.91929347440577 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0106186556046084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9990427230353263
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33876972890118834
"cameras/drone/drone0" SET Transform localPosition (-0.42978906953844265 0.4696248664961092 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7243581795969857 1.2971141778645146 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -7 -18)
"cameras/drone/drone0" SET Transform localScale (0.9414984297694303 0.9414984297694303 0.9414984297694303)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 4 -8)
"cameras/drone/drone1" SET Transform localScale (1.2630528813065531 1.2630528813065531 1.2630528813065531)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8165267176857816 0)
"cameras" SET Transform eulerAngles (18.45257723319078 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4195017581005036
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.554741881509233
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12591641016462715
"cameras/drone/drone0" SET Transform localPosition (-0.16260026284438744 0.15258802221426532 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1355055112352648 1.201529791714685 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -11 11)
"cameras/drone/drone0" SET Transform localScale (0.617180642676784 0.617180642676784 0.617180642676784)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -16 -6)
"cameras/drone/drone1" SET Transform localScale (0.9359119339885285 0.9359119339885285 0.9359119339885285)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9637260718439524 0)
"cameras" SET Transform eulerAngles (2.5674046997834346 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5606266808131806
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0641566345226137
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0019150729414634249
"cameras/drone/drone0" SET Transform localPosition (0.7804670189716088 0.31072668691615274 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20739299727276816 1.0826687238434491 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 15 -1)
"cameras/drone/drone0" SET Transform localScale (1.4782694856340264 1.4782694856340264 1.4782694856340264)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 10 2)
"cameras/drone/drone1" SET Transform localScale (1.3125922091175386 1.3125922091175386 1.3125922091175386)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.852595080037869 0)
"cameras" SET Transform eulerAngles (-0.23379117034882313 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.191077254389707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9547058992433894
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19865057917283713
"cameras/drone/drone0" SET Transform localPosition (-0.3706299673225202 -0.053124758087474244 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6402209193376429 0.9225376011079669 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -1 20)
"cameras/drone/drone0" SET Transform localScale (0.8548186692760522 0.8548186692760522 0.8548186692760522)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -18 9)
"cameras/drone/drone1" SET Transform localScale (0.9320645023809382 0.9320645023809382 0.9320645023809382)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6754921706009607 0)
"cameras" SET Transform eulerAngles (6.84935929834657 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.803897915952529
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1512874110731754
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3896381402658079
"cameras/drone/drone0" SET Transform localPosition (0.6543799799770196 0.5837255683995173 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1017376372355654 0.8271742947748735 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 5 7)
"cameras/drone/drone0" SET Transform localScale (1.2965277154969561 1.2965277154969561 1.2965277154969561)
"cameras/drone/drone1" SET Transform localEulerAngles (20 14 5)
"cameras/drone/drone1" SET Transform localScale (1.2304870218215185 1.2304870218215185 1.2304870218215185)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6910256291136747 0)
"cameras" SET Transform eulerAngles (-0.8346924239616342 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7008283400088493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4139860389015753
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33374956204854256
"cameras/drone/drone0" SET Transform localPosition (-0.0016931344860535713 -0.0671751083776338 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7484699564676669 1.1659507044186808 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 16 0)
"cameras/drone/drone0" SET Transform localScale (0.9828318875978506 0.9828318875978506 0.9828318875978506)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -9 2)
"cameras/drone/drone1" SET Transform localScale (1.3720787057070412 1.3720787057070412 1.3720787057070412)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 75
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.037927889272382 0)
"cameras" SET Transform eulerAngles (-18.281864241911748 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9374145580684147
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2484929865529089
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.030517850701437955
"cameras/drone/drone0" SET Transform localPosition (0.6621380382080244 0.09297147381394683 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06119257572808268 1.2353689604013753 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 16 -1)
"cameras/drone/drone0" SET Transform localScale (1.3808113694756297 1.3808113694756297 1.3808113694756297)
"cameras/drone/drone1" SET Transform localEulerAngles (11 14 -15)
"cameras/drone/drone1" SET Transform localScale (0.9208661351892089 0.9208661351892089 0.9208661351892089)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.455661491909914 0)
"cameras" SET Transform eulerAngles (8.15706468706496 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41415819506450885
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5385933076134677
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1744320274036639
"cameras/drone/drone0" SET Transform localPosition (-0.8908660254253276 0.17542977975578528 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0565784262026685 1.0696113901446491 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -9 11)
"cameras/drone/drone0" SET Transform localScale (0.799630045169204 0.799630045169204 0.799630045169204)
"cameras/drone/drone1" SET Transform localEulerAngles (11 19 -15)
"cameras/drone/drone1" SET Transform localScale (0.9985862343236219 0.9985862343236219 0.9985862343236219)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9741021185050514 0)
"cameras" SET Transform eulerAngles (13.894377968630721 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45238060286528675
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1448769253679172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15614549292031984
"cameras/drone/drone0" SET Transform localPosition (-0.5794212292054057 0.6766167124354248 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1770144012931716 1.0042475888873938 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -7 17)
"cameras/drone/drone0" SET Transform localScale (0.925754304574356 0.925754304574356 0.925754304574356)
"cameras/drone/drone1" SET Transform localEulerAngles (19 12 -5)
"cameras/drone/drone1" SET Transform localScale (0.676379488674844 0.676379488674844 0.676379488674844)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6843257235587314 0)
"cameras" SET Transform eulerAngles (-16.839555806656705 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8583540234043933
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2937147609951611
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39811536583915724
"cameras/drone/drone0" SET Transform localPosition (0.6162119078308259 0.09720503645488904 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08726134840158073 1.2758599333243232 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 1 12)
"cameras/drone/drone0" SET Transform localScale (1.461145273090341 1.461145273090341 1.461145273090341)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -4 17)
"cameras/drone/drone1" SET Transform localScale (0.9479439151419218 0.9479439151419218 0.9479439151419218)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.923741037576662 0)
"cameras" SET Transform eulerAngles (-1.2655869719005608 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8619181626675961
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.685806430092705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01917896318955119
"cameras/drone/drone0" SET Transform localPosition (-0.5878033929234123 0.1500463912880145 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1225550474941004 0.8650212210829444 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 13 -2)
"cameras/drone/drone0" SET Transform localScale (1.1636601772482762 1.1636601772482762 1.1636601772482762)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -20 -14)
"cameras/drone/drone1" SET Transform localScale (0.8183312928117711 0.8183312928117711 0.8183312928117711)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2597230291952357 0)
"cameras" SET Transform eulerAngles (12.580234915232637 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1628662275915214
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7540076324228009
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22995254144241964
"cameras/drone/drone0" SET Transform localPosition (0.5795722566208978 0.1692908279698188 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1628982701759896 1.1363591767398211 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -11 -16)
"cameras/drone/drone0" SET Transform localScale (0.8724365261775868 0.8724365261775868 0.8724365261775868)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -5 3)
"cameras/drone/drone1" SET Transform localScale (1.2015520559185977 1.2015520559185977 1.2015520559185977)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2319496677082755 0)
"cameras" SET Transform eulerAngles (-13.815474440246241 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0626680268444755
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7821662303312522
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07167020116028411
"cameras/drone/drone0" SET Transform localPosition (0.23360886333533726 0.2961223635913535 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.0719062704062563 0.9443044822575256 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 6 -1)
"cameras/drone/drone0" SET Transform localScale (0.9105990019815864 0.9105990019815864 0.9105990019815864)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -12 -18)
"cameras/drone/drone1" SET Transform localScale (0.7618500159924733 0.7618500159924733 0.7618500159924733)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.359646117176658 0)
"cameras" SET Transform eulerAngles (-16.660774841552094 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5900401042016634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9796085072040794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34529820138775924
"cameras/drone/drone0" SET Transform localPosition (0.38005790665228556 0.027772940839020432 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.48092362131547417 1.165577733874101 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -1 9)
"cameras/drone/drone0" SET Transform localScale (0.7259141361370688 0.7259141361370688 0.7259141361370688)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -8 0)
"cameras/drone/drone1" SET Transform localScale (1.1422070623574347 1.1422070623574347 1.1422070623574347)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.538908180132349 0)
"cameras" SET Transform eulerAngles (-0.7236966106248524 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3691287880443634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.480163917070562
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2820167869454106
"cameras/drone/drone0" SET Transform localPosition (1.1473926001576802 0.06090698211969531 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0818364663914475 1.291901189508887 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -13 8)
"cameras/drone/drone0" SET Transform localScale (0.7647992393725287 0.7647992393725287 0.7647992393725287)
"cameras/drone/drone1" SET Transform localEulerAngles (16 6 -2)
"cameras/drone/drone1" SET Transform localScale (0.9195567919966073 0.9195567919966073 0.9195567919966073)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8841606107769033 0)
"cameras" SET Transform eulerAngles (14.735046944052044 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5421763547943106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.915368573124867
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.263795217387543
"cameras/drone/drone0" SET Transform localPosition (0.8169448649614688 0.3108605560204552 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04607380496615621 1.2013544782720125 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -8 -12)
"cameras/drone/drone0" SET Transform localScale (1.4592143875369725 1.4592143875369725 1.4592143875369725)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -6 -3)
"cameras/drone/drone1" SET Transform localScale (1.1413603620570725 1.1413603620570725 1.1413603620570725)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.057127723521825 0)
"cameras" SET Transform eulerAngles (-13.637484269098824 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1764320994371569
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.536171567320356
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22656577996628968
"cameras/drone/drone0" SET Transform localPosition (-0.21341167341276301 -0.09686190910203601 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.46000846368363657 1.1849628168876847 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 3 19)
"cameras/drone/drone0" SET Transform localScale (0.8221605922736981 0.8221605922736981 0.8221605922736981)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 13 9)
"cameras/drone/drone1" SET Transform localScale (1.067625525034623 1.067625525034623 1.067625525034623)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.071886486876382 0)
"cameras" SET Transform eulerAngles (-0.5330972238585474 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5805241535022043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6533958501918113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3266925368134421
"cameras/drone/drone0" SET Transform localPosition (-0.2998484640956297 0.29387454087093107 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0654972344931928 0.8958395161607946 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 1 -16)
"cameras/drone/drone0" SET Transform localScale (1.133890323813024 1.133890323813024 1.133890323813024)
"cameras/drone/drone1" SET Transform localEulerAngles (19 7 -1)
"cameras/drone/drone1" SET Transform localScale (1.1157831586155345 1.1157831586155345 1.1157831586155345)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.186750041398027 0)
"cameras" SET Transform eulerAngles (-10.818741237154077 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1253378448891145
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7256378068106102
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3805879509719017
"cameras/drone/drone0" SET Transform localPosition (-0.7389289751439672 0.38799117627439433 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5907841186586373 1.0885950583770239 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -7 -7)
"cameras/drone/drone0" SET Transform localScale (1.2552635669290373 1.2552635669290373 1.2552635669290373)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -16 13)
"cameras/drone/drone1" SET Transform localScale (1.0997733908746954 1.0997733908746954 1.0997733908746954)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.883742781944708 0)
"cameras" SET Transform eulerAngles (-2.31199867826669 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0342742988676896
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5993577653836724
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29720091342019067
"cameras/drone/drone0" SET Transform localPosition (-0.1618400573962646 -0.027521202012099122 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8782808230790667 0.824526485914557 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -5 11)
"cameras/drone/drone0" SET Transform localScale (1.2421862050844683 1.2421862050844683 1.2421862050844683)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -7 13)
"cameras/drone/drone1" SET Transform localScale (1.2762038483235651 1.2762038483235651 1.2762038483235651)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7553406816610355 0)
"cameras" SET Transform eulerAngles (5.679323891209766 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4722411096403394
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8151278639258352
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08655290289036005
"cameras/drone/drone0" SET Transform localPosition (0.019303589347179573 0.1440930312272562 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0199754003655588 0.9858103371417556 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 17 -16)
"cameras/drone/drone0" SET Transform localScale (0.7226127676261392 0.7226127676261392 0.7226127676261392)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -7 19)
"cameras/drone/drone1" SET Transform localScale (1.2245534051314693 1.2245534051314693 1.2245534051314693)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.241263943896113 0)
"cameras" SET Transform eulerAngles (-16.329536585154273 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5745477843132183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9813192602064786
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19920019498938524
"cameras/drone/drone0" SET Transform localPosition (0.5958791725937638 0.46385795920693434 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3390000509899844 0.907263979237457 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 8 1)
"cameras/drone/drone0" SET Transform localScale (0.7652388182002231 0.7652388182002231 0.7652388182002231)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 20 -19)
"cameras/drone/drone1" SET Transform localScale (1.4096849158634437 1.4096849158634437 1.4096849158634437)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.461742674518902 0)
"cameras" SET Transform eulerAngles (14.607064439930951 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2769581293592174
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5906773714607871
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10371431748121572
"cameras/drone/drone0" SET Transform localPosition (-0.4612089529927702 -0.024187889403765983 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23373629002749707 1.1011700856859408 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 4 20)
"cameras/drone/drone0" SET Transform localScale (0.7999604086311559 0.7999604086311559 0.7999604086311559)
"cameras/drone/drone1" SET Transform localEulerAngles (16 2 12)
"cameras/drone/drone1" SET Transform localScale (1.2685928489818088 1.2685928489818088 1.2685928489818088)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.666431461079782 0)
"cameras" SET Transform eulerAngles (11.29095379450667 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0192412636215211
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.208116086241856
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15505470665735502
"cameras/drone/drone0" SET Transform localPosition (0.0808305114541894 0.21181289060378633 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.846079530530903 1.1622345007982195 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -12 0)
"cameras/drone/drone0" SET Transform localScale (0.8050257480959303 0.8050257480959303 0.8050257480959303)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 17 14)
"cameras/drone/drone1" SET Transform localScale (0.9256799538264995 0.9256799538264995 0.9256799538264995)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.147348688136352 0)
"cameras" SET Transform eulerAngles (11.560885733464097 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.254964047212948
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9965944126798143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3935017782934773
"cameras/drone/drone0" SET Transform localPosition (1.1236506815299683 0.6806648709547589 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0508755445731512 0.9101343120883056 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -18 3)
"cameras/drone/drone0" SET Transform localScale (0.943599725772321 0.943599725772321 0.943599725772321)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -17 -6)
"cameras/drone/drone1" SET Transform localScale (0.8498212445900579 0.8498212445900579 0.8498212445900579)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.388615893643275 0)
"cameras" SET Transform eulerAngles (-5.7593950685763105 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0895737181709786
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2940374814865179
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01978356771408656
"cameras/drone/drone0" SET Transform localPosition (-1.192614170474419 0.48662983238776986 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4984213866290983 0.9012541506731859 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -11 -14)
"cameras/drone/drone0" SET Transform localScale (0.8510729650274664 0.8510729650274664 0.8510729650274664)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -3 5)
"cameras/drone/drone1" SET Transform localScale (0.9634278000139304 0.9634278000139304 0.9634278000139304)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.434196620990553 0)
"cameras" SET Transform eulerAngles (-9.608435441104408 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.128591339766461
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.296613709176694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0829112801541378
"cameras/drone/drone0" SET Transform localPosition (-0.37148485597217484 0.26505846153474183 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9121403913720056 0.9927478291271445 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 1 2)
"cameras/drone/drone0" SET Transform localScale (1.1884612233427432 1.1884612233427432 1.1884612233427432)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 13 -2)
"cameras/drone/drone1" SET Transform localScale (1.258096760601343 1.258096760601343 1.258096760601343)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.315427406033374 0)
"cameras" SET Transform eulerAngles (-11.002230122824649 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7919834726815668
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9450660196027991
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.019817968545057775
"cameras/drone/drone0" SET Transform localPosition (0.7494489636080888 0.5507468228275529 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6271791183094091 1.0281449236101479 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 5 -17)
"cameras/drone/drone0" SET Transform localScale (0.8844665983368902 0.8844665983368902 0.8844665983368902)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -7 -20)
"cameras/drone/drone1" SET Transform localScale (0.714097314369132 0.714097314369132 0.714097314369132)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5426988693010513 0)
"cameras" SET Transform eulerAngles (13.911500709545152 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1116027957590058
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9620971528506317
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2129458642690755
"cameras/drone/drone0" SET Transform localPosition (-0.8945427200055076 0.39799578121164364 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1804091324039174 1.057337222506043 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -20 12)
"cameras/drone/drone0" SET Transform localScale (0.9567969273259627 0.9567969273259627 0.9567969273259627)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 8 10)
"cameras/drone/drone1" SET Transform localScale (0.9434772886082585 0.9434772886082585 0.9434772886082585)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.65355641173843 0)
"cameras" SET Transform eulerAngles (0.3748724503374845 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49964393119073175
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9647662097617942
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3054540283352102
"cameras/drone/drone0" SET Transform localPosition (0.6713640393970401 0.260970913870845 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4675666979653972 1.1016575221423492 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -3 2)
"cameras/drone/drone0" SET Transform localScale (0.8640730125492668 0.8640730125492668 0.8640730125492668)
"cameras/drone/drone1" SET Transform localEulerAngles (4 3 -12)
"cameras/drone/drone1" SET Transform localScale (0.9149866651912208 0.9149866651912208 0.9149866651912208)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.708398699704694 0)
"cameras" SET Transform eulerAngles (-5.941911665936912 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.352862194334651
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6822619333546212
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26119065465958075
"cameras/drone/drone0" SET Transform localPosition (0.6511417791323657 0.4824215407589206 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.797680674621843 0.8319526182672137 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -12 -4)
"cameras/drone/drone0" SET Transform localScale (0.6092972751905185 0.6092972751905185 0.6092972751905185)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -6 19)
"cameras/drone/drone1" SET Transform localScale (0.7612323465787953 0.7612323465787953 0.7612323465787953)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.697756279262223 0)
"cameras" SET Transform eulerAngles (-11.192763910024164 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1668748299459546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6788046028598065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14249468676509364
"cameras/drone/drone0" SET Transform localPosition (-1.1073802919407256 0.6600002085383956 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7962248347113204 1.179466764508926 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 6 -4)
"cameras/drone/drone0" SET Transform localScale (0.6181572638214569 0.6181572638214569 0.6181572638214569)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 12 1)
"cameras/drone/drone1" SET Transform localScale (1.2377069093686484 1.2377069093686484 1.2377069093686484)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5422689770542437 0)
"cameras" SET Transform eulerAngles (-14.998361138715822 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.329013721886668
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7588130649857696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10984454209597652
"cameras/drone/drone0" SET Transform localPosition (0.2542058292374687 0.20647276515913598 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.27374853637534324 0.8847236395937923 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 17 -13)
"cameras/drone/drone0" SET Transform localScale (0.8855945271178204 0.8855945271178204 0.8855945271178204)
"cameras/drone/drone1" SET Transform localEulerAngles (14 7 -9)
"cameras/drone/drone1" SET Transform localScale (0.6688571999749192 0.6688571999749192 0.6688571999749192)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7967945254660176 0)
"cameras" SET Transform eulerAngles (10.720436939802148 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3062468517238768
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4674124423092874
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26314821517548975
"cameras/drone/drone0" SET Transform localPosition (-0.7488371235755625 -0.24258696319072676 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1206536635661115 1.1376153566329736 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -11 10)
"cameras/drone/drone0" SET Transform localScale (0.7771752895050522 0.7771752895050522 0.7771752895050522)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -3 -19)
"cameras/drone/drone1" SET Transform localScale (1.1733228644400042 1.1733228644400042 1.1733228644400042)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9111057048212015 0)
"cameras" SET Transform eulerAngles (-2.8504641436112976 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1669269906614288
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0511321464086532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2835825025354595
"cameras/drone/drone0" SET Transform localPosition (-0.8641702747036113 0.2996276849093205 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7936029928252872 0.8002477410721085 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -16 4)
"cameras/drone/drone0" SET Transform localScale (0.71601012373042 0.71601012373042 0.71601012373042)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -16 0)
"cameras/drone/drone1" SET Transform localScale (0.9955616807344724 0.9955616807344724 0.9955616807344724)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.374147858234372 0)
"cameras" SET Transform eulerAngles (-16.67913931723655 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8523478693844713
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2131370835756328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17679863446306202
"cameras/drone/drone0" SET Transform localPosition (-0.2517669272881212 0.3527441349571135 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.019153090169079956 0.9999112298465485 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 20 -17)
"cameras/drone/drone0" SET Transform localScale (1.2988483639989301 1.2988483639989301 1.2988483639989301)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -3 5)
"cameras/drone/drone1" SET Transform localScale (1.4897757642654632 1.4897757642654632 1.4897757642654632)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7149440999205074 0)
"cameras" SET Transform eulerAngles (4.474040751400622 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7492020358563245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7735475372091098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19414269646202806
"cameras/drone/drone0" SET Transform localPosition (0.06818556004021525 0.23997771873440882 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.26095408466473713 1.230256739572319 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 12 -14)
"cameras/drone/drone0" SET Transform localScale (0.7956478660240395 0.7956478660240395 0.7956478660240395)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -9 -18)
"cameras/drone/drone1" SET Transform localScale (0.7935139581556533 0.7935139581556533 0.7935139581556533)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.087112992794181 0)
"cameras" SET Transform eulerAngles (-10.259238071622367 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3264349735137575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4041150111609655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18819446952962593
"cameras/drone/drone0" SET Transform localPosition (0.1429458054366921 0.544788410869006 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2538914047938693 0.8963730049504941 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -10 4)
"cameras/drone/drone0" SET Transform localScale (0.8258706551103926 0.8258706551103926 0.8258706551103926)
"cameras/drone/drone1" SET Transform localEulerAngles (1 6 20)
"cameras/drone/drone1" SET Transform localScale (0.945508449341903 0.945508449341903 0.945508449341903)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8703766848240297 0)
"cameras" SET Transform eulerAngles (-10.507399914301562 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7167590223772364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.224918419426043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10696881182423806
"cameras/drone/drone0" SET Transform localPosition (0.5309998661012032 -0.13489801712675914 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9032671986326128 1.1139107171958802 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -9 18)
"cameras/drone/drone0" SET Transform localScale (1.1688690556301924 1.1688690556301924 1.1688690556301924)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -15 -2)
"cameras/drone/drone1" SET Transform localScale (1.4324669802116512 1.4324669802116512 1.4324669802116512)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.470807122034829 0)
"cameras" SET Transform eulerAngles (17.341885108862122 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9470894765640918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7787214739254713
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17516160472225517
"cameras/drone/drone0" SET Transform localPosition (0.8614926826845866 0.18787314477590028 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6228129530792306 1.1978424047089744 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -17 -1)
"cameras/drone/drone0" SET Transform localScale (1.3530603757926616 1.3530603757926616 1.3530603757926616)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 2 -5)
"cameras/drone/drone1" SET Transform localScale (0.8065889017480844 0.8065889017480844 0.8065889017480844)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7805481331705457 0)
"cameras" SET Transform eulerAngles (-16.006187760514447 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5740613651567408
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5023148460902782
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03820895783524195
"cameras/drone/drone0" SET Transform localPosition (-1.0002510971316874 0.5165978492568086 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.006013324076064919 1.002154770160745 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 19 -12)
"cameras/drone/drone0" SET Transform localScale (0.6945743923800154 0.6945743923800154 0.6945743923800154)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -12 2)
"cameras/drone/drone1" SET Transform localScale (1.0548208323140962 1.0548208323140962 1.0548208323140962)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.012732223331172 0)
"cameras" SET Transform eulerAngles (-9.096877014364235 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5026053880678698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9816272742613594
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03592577818071776
"cameras/drone/drone0" SET Transform localPosition (0.0744693391081308 0.590750101677689 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0320551196610561 0.9247423163757962 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 5 18)
"cameras/drone/drone0" SET Transform localScale (1.1883924474083831 1.1883924474083831 1.1883924474083831)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -18 -15)
"cameras/drone/drone1" SET Transform localScale (0.6220855159186441 0.6220855159186441 0.6220855159186441)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.022500540246086 0)
"cameras" SET Transform eulerAngles (14.783307256895156 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6586044488020087
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.05624891392813
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3381785674871767
"cameras/drone/drone0" SET Transform localPosition (0.8633863046554222 0.2062457168398814 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19414212201909842 0.8827399059913197 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -1 15)
"cameras/drone/drone0" SET Transform localScale (1.4892970314299703 1.4892970314299703 1.4892970314299703)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -1 0)
"cameras/drone/drone1" SET Transform localScale (1.2928558363565337 1.2928558363565337 1.2928558363565337)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.752180398371373 0)
"cameras" SET Transform eulerAngles (-10.779298350957799 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8216558667142075
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1078758251054366
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20653334453990319
"cameras/drone/drone0" SET Transform localPosition (-0.27603729226384655 0.13530820052850573 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.18071915807090155 1.2978761673787176 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 15 -19)
"cameras/drone/drone0" SET Transform localScale (1.132912195579559 1.132912195579559 1.132912195579559)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 2 4)
"cameras/drone/drone1" SET Transform localScale (0.7920686235758496 0.7920686235758496 0.7920686235758496)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.529204616176002 0)
"cameras" SET Transform eulerAngles (-14.091570198992699 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0523548700821501
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.577641343086933
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22204170465020967
"cameras/drone/drone0" SET Transform localPosition (0.41531867874228356 0.18465838881890323 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7011247038410522 1.0833747727471577 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 15 3)
"cameras/drone/drone0" SET Transform localScale (1.4914701954712353 1.4914701954712353 1.4914701954712353)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -7 -8)
"cameras/drone/drone1" SET Transform localScale (0.9651716264675902 0.9651716264675902 0.9651716264675902)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.147255955377951 0)
"cameras" SET Transform eulerAngles (-7.519970825787986 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8652638932693472
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8835615327896238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2668012963234492
"cameras/drone/drone0" SET Transform localPosition (-0.26043485312009806 -0.05609788697443302 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3332306759351571 1.141098490638321 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -18 8)
"cameras/drone/drone0" SET Transform localScale (1.3709830104925702 1.3709830104925702 1.3709830104925702)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 14 -13)
"cameras/drone/drone1" SET Transform localScale (0.8803972250242581 0.8803972250242581 0.8803972250242581)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7141993726959095 0)
"cameras" SET Transform eulerAngles (-7.339074320913461 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5023688882658962
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5325976102280112
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21699253473322183
"cameras/drone/drone0" SET Transform localPosition (-0.23477802927951497 0.24546314998743363 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6326954787978283 0.9963465889522793 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -20 -15)
"cameras/drone/drone0" SET Transform localScale (0.8881389899786702 0.8881389899786702 0.8881389899786702)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 10 18)
"cameras/drone/drone1" SET Transform localScale (1.3608021502679604 1.3608021502679604 1.3608021502679604)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.932951693886151 0)
"cameras" SET Transform eulerAngles (-4.303953621445412 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.419353859691273
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7164671262157878
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21815000816626806
"cameras/drone/drone0" SET Transform localPosition (-0.42604354475532147 0.16795698464686276 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.15789212820451182 0.8770314334525411 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 8 1)
"cameras/drone/drone0" SET Transform localScale (1.3288700119286407 1.3288700119286407 1.3288700119286407)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 18 4)
"cameras/drone/drone1" SET Transform localScale (0.7267750013295345 0.7267750013295345 0.7267750013295345)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.366786941081996 0)
"cameras" SET Transform eulerAngles (-17.98005117996867 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.073384659252203
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9578524325483997
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05918931706133717
"cameras/drone/drone0" SET Transform localPosition (-0.013208450185347331 -0.2913487145794363 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2357754067740735 1.1859453404653244 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -2 -18)
"cameras/drone/drone0" SET Transform localScale (1.3978407414634322 1.3978407414634322 1.3978407414634322)
"cameras/drone/drone1" SET Transform localEulerAngles (15 1 -4)
"cameras/drone/drone1" SET Transform localScale (1.452607112155989 1.452607112155989 1.452607112155989)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4343021308409147 0)
"cameras" SET Transform eulerAngles (12.696402843661318 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45722679381887465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6106171555637394
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.265577816206139
"cameras/drone/drone0" SET Transform localPosition (1.1293532003039413 0.1558974315582083 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7377054842978277 0.9613771201184939 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 5 20)
"cameras/drone/drone0" SET Transform localScale (0.7432616487713272 0.7432616487713272 0.7432616487713272)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 0 8)
"cameras/drone/drone1" SET Transform localScale (1.1433302129268563 1.1433302129268563 1.1433302129268563)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9122496376560916 0)
"cameras" SET Transform eulerAngles (12.131963606062882 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9613236849738904
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3959282958215566
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2833960956682455
"cameras/drone/drone0" SET Transform localPosition (-0.3241066543812209 0.49346337853594785 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4814593890597322 0.8396935361240829 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 0 -20)
"cameras/drone/drone0" SET Transform localScale (0.8033349026082481 0.8033349026082481 0.8033349026082481)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -15 -3)
"cameras/drone/drone1" SET Transform localScale (1.2446221174472472 1.2446221174472472 1.2446221174472472)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.204471527355706 0)
"cameras" SET Transform eulerAngles (-8.474178118080582 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9733866098752948
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.171803478584155
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24251302193281085
"cameras/drone/drone0" SET Transform localPosition (-0.7410357020194096 0.2559903804965871 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2514603747784814 1.0449473491903263 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -16 -4)
"cameras/drone/drone0" SET Transform localScale (0.6599182727747512 0.6599182727747512 0.6599182727747512)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -19 -9)
"cameras/drone/drone1" SET Transform localScale (0.8799930300566459 0.8799930300566459 0.8799930300566459)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3912787418892316 0)
"cameras" SET Transform eulerAngles (-12.278414550627716 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9452138713835301
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2654142725165534
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20752815556929677
"cameras/drone/drone0" SET Transform localPosition (0.312598445559219 0.07710501047583523 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1282738114077746 1.2502490794327092 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 10 -5)
"cameras/drone/drone0" SET Transform localScale (0.8407514640273971 0.8407514640273971 0.8407514640273971)
"cameras/drone/drone1" SET Transform localEulerAngles (13 10 10)
"cameras/drone/drone1" SET Transform localScale (1.247681362806293 1.247681362806293 1.247681362806293)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.68244764441043 0)
"cameras" SET Transform eulerAngles (-6.048247570184749 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8687709471115318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.450345874245686
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10865422866775419
"cameras/drone/drone0" SET Transform localPosition (0.5146167446802508 0.029293024073820895 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.29119897262994643 0.9629010315613492 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 13 19)
"cameras/drone/drone0" SET Transform localScale (0.8091944990281547 0.8091944990281547 0.8091944990281547)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 1 -15)
"cameras/drone/drone1" SET Transform localScale (0.7889128753309526 0.7889128753309526 0.7889128753309526)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0312902035936355 0)
"cameras" SET Transform eulerAngles (-19.233457192251535 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46854305937308494
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9537241128670977
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.016660884467887226
"cameras/drone/drone0" SET Transform localPosition (-0.6379977258331276 -0.20269367132741262 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0216943450153462 1.1408836804887705 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -1 -4)
"cameras/drone/drone0" SET Transform localScale (1.0448326207246228 1.0448326207246228 1.0448326207246228)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -2 -3)
"cameras/drone/drone1" SET Transform localScale (0.8820232996722019 0.8820232996722019 0.8820232996722019)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.485149823946304 0)
"cameras" SET Transform eulerAngles (-9.282632572542017 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8424698248153154
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3393803064984802
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12264129065868055
"cameras/drone/drone0" SET Transform localPosition (0.8995612475626122 0.07764735048162458 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8623419279929665 0.8862417490623509 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 17 -4)
"cameras/drone/drone0" SET Transform localScale (1.4880897441677907 1.4880897441677907 1.4880897441677907)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 16 6)
"cameras/drone/drone1" SET Transform localScale (1.4553954293089357 1.4553954293089357 1.4553954293089357)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0495128651055796 0)
"cameras" SET Transform eulerAngles (11.579361221444607 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0685748004593751
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6107905457376588
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1008411057924997
"cameras/drone/drone0" SET Transform localPosition (0.8335687613577669 0.5352251773744714 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5462099592870027 0.996392291591592 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -2 11)
"cameras/drone/drone0" SET Transform localScale (1.2540800995839052 1.2540800995839052 1.2540800995839052)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -4 -1)
"cameras/drone/drone1" SET Transform localScale (1.3019379303101755 1.3019379303101755 1.3019379303101755)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.737209170759401 0)
"cameras" SET Transform eulerAngles (4.226412105365224 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4202353393724105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3599264375399254
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18160499931079419
"cameras/drone/drone0" SET Transform localPosition (-0.44342428645550147 -0.2086930328946735 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5072450359221682 1.2051494003872496 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 7 13)
"cameras/drone/drone0" SET Transform localScale (0.8921212082808401 0.8921212082808401 0.8921212082808401)
"cameras/drone/drone1" SET Transform localEulerAngles (3 19 -17)
"cameras/drone/drone1" SET Transform localScale (1.4824353472286527 1.4824353472286527 1.4824353472286527)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.583982651339261 0)
"cameras" SET Transform eulerAngles (-0.38081433623933947 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4931425092529897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7471794175476796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36422589162538843
"cameras/drone/drone0" SET Transform localPosition (-0.9440555501326142 -0.14608871116829908 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7107007175694182 1.015116785837832 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -8 -14)
"cameras/drone/drone0" SET Transform localScale (0.9076442743931494 0.9076442743931494 0.9076442743931494)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -7 -8)
"cameras/drone/drone1" SET Transform localScale (1.01398254748575 1.01398254748575 1.01398254748575)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.820020734795624 0)
"cameras" SET Transform eulerAngles (12.693990534544469 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.490921787625961
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1027467140696985
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11579748157242067
"cameras/drone/drone0" SET Transform localPosition (0.5598085198247251 -0.21004768695883297 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.185522608319433 0.865056010991252 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 15 3)
"cameras/drone/drone0" SET Transform localScale (1.399559338080039 1.399559338080039 1.399559338080039)
"cameras/drone/drone1" SET Transform localEulerAngles (6 19 -6)
"cameras/drone/drone1" SET Transform localScale (1.3770295690532257 1.3770295690532257 1.3770295690532257)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.907717755620368 0)
"cameras" SET Transform eulerAngles (5.64644783248319 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1229288597347595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6197891083104952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22825933306360643
"cameras/drone/drone0" SET Transform localPosition (-0.5786767222818692 0.09971118528525807 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.46622363181961535 1.2519883251206498 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -8 -9)
"cameras/drone/drone0" SET Transform localScale (1.2163846704519252 1.2163846704519252 1.2163846704519252)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 0 10)
"cameras/drone/drone1" SET Transform localScale (1.1936548907775157 1.1936548907775157 1.1936548907775157)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0188272218284116 0)
"cameras" SET Transform eulerAngles (10.169400116964805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0644489956674028
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0718391505839076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21285797446806215
"cameras/drone/drone0" SET Transform localPosition (-0.7814884940338267 0.6322451861371834 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4346410971886947 1.189331379686099 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 0 16)
"cameras/drone/drone0" SET Transform localScale (1.1299183237348143 1.1299183237348143 1.1299183237348143)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -9 -11)
"cameras/drone/drone1" SET Transform localScale (0.7480797556774064 0.7480797556774064 0.7480797556774064)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9740173598342206 0)
"cameras" SET Transform eulerAngles (11.063392087516277 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4633357111565815
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6392870855289403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25025642505385287
"cameras/drone/drone0" SET Transform localPosition (0.6546852411287876 0.22557383203939535 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5870424342627794 1.021240600119899 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -11 2)
"cameras/drone/drone0" SET Transform localScale (0.7922287214944822 0.7922287214944822 0.7922287214944822)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -1 9)
"cameras/drone/drone1" SET Transform localScale (1.4560722520570555 1.4560722520570555 1.4560722520570555)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.485445842071207 0)
"cameras" SET Transform eulerAngles (-8.487078997853082 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1439633427162468
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6591025475102898
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19260685051800436
"cameras/drone/drone0" SET Transform localPosition (-0.990004492099391 -0.08560351273184336 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.46975484968292736 0.934156970180862 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 18 19)
"cameras/drone/drone0" SET Transform localScale (1.4284049370264298 1.4284049370264298 1.4284049370264298)
"cameras/drone/drone1" SET Transform localEulerAngles (17 11 8)
"cameras/drone/drone1" SET Transform localScale (0.939685017753372 0.939685017753372 0.939685017753372)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.73566612582606 0)
"cameras" SET Transform eulerAngles (-8.408530540237233 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.42099409746448
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7486740954264088
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28241049990909783
"cameras/drone/drone0" SET Transform localPosition (-0.004614763062409599 -0.16581019613048947 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.057171209689677704 1.1078078500272663 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 6 8)
"cameras/drone/drone0" SET Transform localScale (0.9512555168813543 0.9512555168813543 0.9512555168813543)
"cameras/drone/drone1" SET Transform localEulerAngles (0 9 -17)
"cameras/drone/drone1" SET Transform localScale (1.2527783942990216 1.2527783942990216 1.2527783942990216)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7368721388599795 0)
"cameras" SET Transform eulerAngles (-19.707358005127816 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4291830931700087
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7291259244275352
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2212740211675723
"cameras/drone/drone0" SET Transform localPosition (0.026242299622289744 0.5760526818815241 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.518700251233129 1.0742011471665878 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -16 7)
"cameras/drone/drone0" SET Transform localScale (1.4533042700182075 1.4533042700182075 1.4533042700182075)
"cameras/drone/drone1" SET Transform localEulerAngles (11 2 -8)
"cameras/drone/drone1" SET Transform localScale (0.7284613758774565 0.7284613758774565 0.7284613758774565)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.146747318128556 0)
"cameras" SET Transform eulerAngles (-14.636072001266673 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8280298540884374
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1909824434261447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01503404234225827
"cameras/drone/drone0" SET Transform localPosition (-0.42739520055336766 0.0733159081768397 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5574071691175835 0.9765222855747752 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 19 -1)
"cameras/drone/drone0" SET Transform localScale (0.610406474008941 0.610406474008941 0.610406474008941)
"cameras/drone/drone1" SET Transform localEulerAngles (13 3 13)
"cameras/drone/drone1" SET Transform localScale (0.6291298129702241 0.6291298129702241 0.6291298129702241)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7865154550481632 0)
"cameras" SET Transform eulerAngles (16.315951447190628 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.797677650220252
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0128594490561227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0915624001625993
"cameras/drone/drone0" SET Transform localPosition (0.9593541658803517 0.38112515964208366 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0409744420440499 1.1292291490443764 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 19 17)
"cameras/drone/drone0" SET Transform localScale (0.9248982630080085 0.9248982630080085 0.9248982630080085)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -1 17)
"cameras/drone/drone1" SET Transform localScale (1.2357610995715735 1.2357610995715735 1.2357610995715735)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.013743084422812 0)
"cameras" SET Transform eulerAngles (0.14944601151069037 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4870452189827749
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5106695813747502
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12060728182298092
"cameras/drone/drone0" SET Transform localPosition (-0.7731771101349978 0.6306287774846213 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7649768828819676 1.149601483156807 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -13 17)
"cameras/drone/drone0" SET Transform localScale (0.7782627082704296 0.7782627082704296 0.7782627082704296)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 20 -4)
"cameras/drone/drone1" SET Transform localScale (1.0408881302148123 1.0408881302148123 1.0408881302148123)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.769683049126443 0)
"cameras" SET Transform eulerAngles (0.8718994221340566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0867144616066962
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0414849726773259
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11028061271523747
"cameras/drone/drone0" SET Transform localPosition (1.0199248709851558 -0.129703581359704 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.652506730797097 1.2855835253406254 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -8 14)
"cameras/drone/drone0" SET Transform localScale (1.093563845657488 1.093563845657488 1.093563845657488)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -10 -8)
"cameras/drone/drone1" SET Transform localScale (0.7968754111263144 0.7968754111263144 0.7968754111263144)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.583686508561746 0)
"cameras" SET Transform eulerAngles (-1.6352159662296586 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4681853009850494
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9260694139265162
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2481646944971974
"cameras/drone/drone0" SET Transform localPosition (0.36291145939223135 0.41631883679563814 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.195717362407685 0.94534767042266 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -18 1)
"cameras/drone/drone0" SET Transform localScale (0.7115741741923798 0.7115741741923798 0.7115741741923798)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 19 -17)
"cameras/drone/drone1" SET Transform localScale (0.7448194208248754 0.7448194208248754 0.7448194208248754)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.886291790789565 0)
"cameras" SET Transform eulerAngles (-2.5703649004663163 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8388627245662109
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7621655458526255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13144546970028212
"cameras/drone/drone0" SET Transform localPosition (1.133953926438177 0.03209443737601375 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1253925100208293 1.046253783506719 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 6 -2)
"cameras/drone/drone0" SET Transform localScale (1.3483831488411988 1.3483831488411988 1.3483831488411988)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -17 -19)
"cameras/drone/drone1" SET Transform localScale (1.03872761043065 1.03872761043065 1.03872761043065)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.833658047615448 0)
"cameras" SET Transform eulerAngles (3.938628724229144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7475311993450362
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8028835322981958
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12419815418204042
"cameras/drone/drone0" SET Transform localPosition (0.12648183367614707 -0.018851440239914974 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.26555126843000587 1.1462210675500453 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 20 7)
"cameras/drone/drone0" SET Transform localScale (0.7059309980117331 0.7059309980117331 0.7059309980117331)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -2 18)
"cameras/drone/drone1" SET Transform localScale (1.4652050739923892 1.4652050739923892 1.4652050739923892)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.156236460968399 0)
"cameras" SET Transform eulerAngles (19.998043393471605 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5275414677415569
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8565136892801082
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3945179592949296
"cameras/drone/drone0" SET Transform localPosition (0.9534410619175164 -0.11244932910870858 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6475711843073865 1.1802332682848202 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 10 -14)
"cameras/drone/drone0" SET Transform localScale (0.9137517854621398 0.9137517854621398 0.9137517854621398)
"cameras/drone/drone1" SET Transform localEulerAngles (16 17 2)
"cameras/drone/drone1" SET Transform localScale (1.32970870525021 1.32970870525021 1.32970870525021)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.23702910997571 0)
"cameras" SET Transform eulerAngles (12.097143302307927 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2817978410105013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.555207289546062
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25652779207267823
"cameras/drone/drone0" SET Transform localPosition (-0.1075785171834922 0.2639973816545694 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9909094342059263 1.0539782036305079 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -17 -20)
"cameras/drone/drone0" SET Transform localScale (1.2073005533679653 1.2073005533679653 1.2073005533679653)
"cameras/drone/drone1" SET Transform localEulerAngles (1 17 -15)
"cameras/drone/drone1" SET Transform localScale (0.7115455017959441 0.7115455017959441 0.7115455017959441)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.475493222745497 0)
"cameras" SET Transform eulerAngles (-1.5553664662097013 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5432041670388437
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5136930237842532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09133165161578348
"cameras/drone/drone0" SET Transform localPosition (0.24299078359326498 0.5198137795919371 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.29401478471342557 0.8068068963003363 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -12 7)
"cameras/drone/drone0" SET Transform localScale (1.4764331144686793 1.4764331144686793 1.4764331144686793)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 17 -6)
"cameras/drone/drone1" SET Transform localScale (1.4692214254831264 1.4692214254831264 1.4692214254831264)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3433730970398363 0)
"cameras" SET Transform eulerAngles (-5.183126563829248 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4784026896269115
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4780555366175065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14732769278702704
"cameras/drone/drone0" SET Transform localPosition (-1.0244141361861887 -0.1341455039035256 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3743629272049942 0.8355740047276095 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 3 20)
"cameras/drone/drone0" SET Transform localScale (1.0148394771197042 1.0148394771197042 1.0148394771197042)
"cameras/drone/drone1" SET Transform localEulerAngles (3 16 -15)
"cameras/drone/drone1" SET Transform localScale (1.0233922871692172 1.0233922871692172 1.0233922871692172)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.093913224316733 0)
"cameras" SET Transform eulerAngles (7.521843699852781 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7426663397308324
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9223344911564973
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12953487619756757
"cameras/drone/drone0" SET Transform localPosition (0.6360518857743633 -0.2167933780580869 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.24162308528903353 0.8165848760703556 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 2 9)
"cameras/drone/drone0" SET Transform localScale (0.7811863641700236 0.7811863641700236 0.7811863641700236)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -13 18)
"cameras/drone/drone1" SET Transform localScale (1.0978526454071722 1.0978526454071722 1.0978526454071722)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.679271404975621 0)
"cameras" SET Transform eulerAngles (-5.950211944383067 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0619040042534729
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.587348830976795
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22101862564053648
"cameras/drone/drone0" SET Transform localPosition (-0.8439428599188288 0.38057477782711663 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0531005990790414 0.8590876683922466 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -3 -4)
"cameras/drone/drone0" SET Transform localScale (1.0509112462163008 1.0509112462163008 1.0509112462163008)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -16 2)
"cameras/drone/drone1" SET Transform localScale (0.9259340229597846 0.9259340229597846 0.9259340229597846)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4388209887505363 0)
"cameras" SET Transform eulerAngles (-3.4398144468353173 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8379794097559117
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3299650210058607
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24655413909787055
"cameras/drone/drone0" SET Transform localPosition (0.9451880950913034 0.3264860874889714 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.368006630796073 1.0274527790800065 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -6 7)
"cameras/drone/drone0" SET Transform localScale (1.2022104897560402 1.2022104897560402 1.2022104897560402)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -13 16)
"cameras/drone/drone1" SET Transform localScale (1.1461505741607514 1.1461505741607514 1.1461505741607514)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.535847908908081 0)
"cameras" SET Transform eulerAngles (-0.9999504354020736 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9714169355727075
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6193338638640244
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.323891266408835
"cameras/drone/drone0" SET Transform localPosition (0.8985615458977814 0.2974341626109253 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4063098965704547 0.9296799610183587 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -6 13)
"cameras/drone/drone0" SET Transform localScale (1.0757754157650212 1.0757754157650212 1.0757754157650212)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -20 13)
"cameras/drone/drone1" SET Transform localScale (0.7639846401054755 0.7639846401054755 0.7639846401054755)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.464814268190528 0)
"cameras" SET Transform eulerAngles (-1.50335635403842 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5941361607611984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7741547318071405
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14281890441940015
"cameras/drone/drone0" SET Transform localPosition (0.03809830839397832 0.23009815532275496 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8860721508130343 1.1279608674054062 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 18 -9)
"cameras/drone/drone0" SET Transform localScale (1.087816436728187 1.087816436728187 1.087816436728187)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 2 5)
"cameras/drone/drone1" SET Transform localScale (0.6089814037489765 0.6089814037489765 0.6089814037489765)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.603396217630875 0)
"cameras" SET Transform eulerAngles (3.1834508476642185 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.439483891282787
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8887056728857519
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22340620270209174
"cameras/drone/drone0" SET Transform localPosition (0.301632370122924 0.2606150868905161 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1398203014450119 1.266717706566788 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -13 -12)
"cameras/drone/drone0" SET Transform localScale (1.1103040078652286 1.1103040078652286 1.1103040078652286)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 4 -18)
"cameras/drone/drone1" SET Transform localScale (1.2512643357069446 1.2512643357069446 1.2512643357069446)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.047910784300127 0)
"cameras" SET Transform eulerAngles (0.5362135533120949 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4360271310263588
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5691134810065255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33739245444417143
"cameras/drone/drone0" SET Transform localPosition (0.8241953469324714 -0.21449082046936968 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1128847433398692 1.1535343533766529 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 19 -14)
"cameras/drone/drone0" SET Transform localScale (0.8123939633578242 0.8123939633578242 0.8123939633578242)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -2 20)
"cameras/drone/drone1" SET Transform localScale (0.7246292880992932 0.7246292880992932 0.7246292880992932)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8550349730087774 0)
"cameras" SET Transform eulerAngles (-15.927003544771319 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8282012700908059
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8957186778968556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24712312155511929
"cameras/drone/drone0" SET Transform localPosition (0.39848073129646555 -0.12441228738640814 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4448779275673018 1.1647493965340556 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 19 -9)
"cameras/drone/drone0" SET Transform localScale (0.9137280337211489 0.9137280337211489 0.9137280337211489)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 3 -14)
"cameras/drone/drone1" SET Transform localScale (0.9440453094934582 0.9440453094934582 0.9440453094934582)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.594510537497978 0)
"cameras" SET Transform eulerAngles (18.884539806207542 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0444640512097192
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.827624982148106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2713603001908957
"cameras/drone/drone0" SET Transform localPosition (-0.6525661780872485 0.35687556681126714 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.125781862126692 0.9843304781974718 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 4 17)
"cameras/drone/drone0" SET Transform localScale (0.691754141475099 0.691754141475099 0.691754141475099)
"cameras/drone/drone1" SET Transform localEulerAngles (7 7 14)
"cameras/drone/drone1" SET Transform localScale (1.1917575031258174 1.1917575031258174 1.1917575031258174)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9628896690125077 0)
"cameras" SET Transform eulerAngles (6.53317705012266 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.338049619939177
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9598264880350058
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.336417646927278
"cameras/drone/drone0" SET Transform localPosition (-0.3707991993893216 0.22523225268563957 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6496322517518703 0.9692618301742743 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -13 1)
"cameras/drone/drone0" SET Transform localScale (0.9379272446997795 0.9379272446997795 0.9379272446997795)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -8 -7)
"cameras/drone/drone1" SET Transform localScale (0.7110214847835835 0.7110214847835835 0.7110214847835835)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4227864388356006 0)
"cameras" SET Transform eulerAngles (6.417095637087982 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3794582548799026
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2695087917739474
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11329359347257971
"cameras/drone/drone0" SET Transform localPosition (-0.305407927218286 0.10352876856177345 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0045476477086450195 1.004549461600139 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 20 -3)
"cameras/drone/drone0" SET Transform localScale (0.8768512367450192 0.8768512367450192 0.8768512367450192)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -4 19)
"cameras/drone/drone1" SET Transform localScale (0.6339831293758091 0.6339831293758091 0.6339831293758091)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.20982080843703 0)
"cameras" SET Transform eulerAngles (-0.6972425062005918 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5075463013267515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2858449353323156
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09747446355211267
"cameras/drone/drone0" SET Transform localPosition (-0.6199293748708177 0.2035309496764957 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.120718430812942 1.0472855491422806 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 4 3)
"cameras/drone/drone0" SET Transform localScale (0.8547233835235183 0.8547233835235183 0.8547233835235183)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -1 17)
"cameras/drone/drone1" SET Transform localScale (0.7384512037450017 0.7384512037450017 0.7384512037450017)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.434438342713915 0)
"cameras" SET Transform eulerAngles (-8.389030199111179 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6041268808077943
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9231591731596591
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35748708592486245
"cameras/drone/drone0" SET Transform localPosition (0.2501494709109724 0.4776675321384834 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6810704495182623 1.2905213784212952 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -2 -12)
"cameras/drone/drone0" SET Transform localScale (0.9785568846244436 0.9785568846244436 0.9785568846244436)
"cameras/drone/drone1" SET Transform localEulerAngles (16 6 10)
"cameras/drone/drone1" SET Transform localScale (0.7318885054677531 0.7318885054677531 0.7318885054677531)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8211062996974454 0)
"cameras" SET Transform eulerAngles (-11.806029359195968 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1773015344525501
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0984781659224072
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12733201763810872
"cameras/drone/drone0" SET Transform localPosition (0.908977833625048 0.013352885253292868 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9593656081489488 0.8223721376458999 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 15 0)
"cameras/drone/drone0" SET Transform localScale (1.4001402525967845 1.4001402525967845 1.4001402525967845)
"cameras/drone/drone1" SET Transform localEulerAngles (14 8 -12)
"cameras/drone/drone1" SET Transform localScale (1.296114343949505 1.296114343949505 1.296114343949505)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.17620866974693 0)
"cameras" SET Transform eulerAngles (16.835983258029565 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8365389051305235
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1572532416715617
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27253090060600565
"cameras/drone/drone0" SET Transform localPosition (0.6097860178308596 -0.1179136634649855 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5661361525741193 1.0602680750901903 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -10 5)
"cameras/drone/drone0" SET Transform localScale (0.7818506022107236 0.7818506022107236 0.7818506022107236)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 5 -7)
"cameras/drone/drone1" SET Transform localScale (0.6147439997198096 0.6147439997198096 0.6147439997198096)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.396101296407742 0)
"cameras" SET Transform eulerAngles (19.983715685304915 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3647585988015203
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1730132209183572
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2276145311345939
"cameras/drone/drone0" SET Transform localPosition (0.4287525049194567 -0.018492877313780187 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.37379132349670297 0.8815873803016886 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 16 -11)
"cameras/drone/drone0" SET Transform localScale (1.479653537978511 1.479653537978511 1.479653537978511)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 20 8)
"cameras/drone/drone1" SET Transform localScale (0.6685088837100238 0.6685088837100238 0.6685088837100238)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.834255812265422 0)
"cameras" SET Transform eulerAngles (-18.040179958186904 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4073845119343282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7786934023619871
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13031721676959857
"cameras/drone/drone0" SET Transform localPosition (0.7594470492269461 0.576950104088721 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4194663834632404 1.260516663941855 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -8 -18)
"cameras/drone/drone0" SET Transform localScale (1.2842607577523208 1.2842607577523208 1.2842607577523208)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -9 -8)
"cameras/drone/drone1" SET Transform localScale (1.0298749306891266 1.0298749306891266 1.0298749306891266)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6331168322783336 0)
"cameras" SET Transform eulerAngles (16.420704030853074 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4604980815049071
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0077370398971952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20464456781979068
"cameras/drone/drone0" SET Transform localPosition (-0.37832378896050545 -0.10934677918918662 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.0741199012086724 1.2742583488682249 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 1 5)
"cameras/drone/drone0" SET Transform localScale (1.2687543065180298 1.2687543065180298 1.2687543065180298)
"cameras/drone/drone1" SET Transform localEulerAngles (3 20 4)
"cameras/drone/drone1" SET Transform localScale (1.0610527173448023 1.0610527173448023 1.0610527173448023)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.991675448715853 0)
"cameras" SET Transform eulerAngles (-1.4535619736735441 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7496265257012797
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4073538022945247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20165161751650262
"cameras/drone/drone0" SET Transform localPosition (0.12330604087203478 0.010257969755242013 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.974795277314324 0.8580666510530501 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -10 -3)
"cameras/drone/drone0" SET Transform localScale (1.275926677905233 1.275926677905233 1.275926677905233)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 7 -1)
"cameras/drone/drone1" SET Transform localScale (1.2570033729166825 1.2570033729166825 1.2570033729166825)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6108102616424143 0)
"cameras" SET Transform eulerAngles (-13.675182375405628 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4491491834656811
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9297917673096867
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2898766828399428
"cameras/drone/drone0" SET Transform localPosition (0.3492661229568883 0.5806839903270469 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1896242858487125 0.847459546480185 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -6 2)
"cameras/drone/drone0" SET Transform localScale (1.4807831651345809 1.4807831651345809 1.4807831651345809)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -1 -2)
"cameras/drone/drone1" SET Transform localScale (0.7099629240941485 0.7099629240941485 0.7099629240941485)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.423946341818323 0)
"cameras" SET Transform eulerAngles (-8.831730038528022 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3779796526028423
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9460738576924186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3818625895744978
"cameras/drone/drone0" SET Transform localPosition (-0.49560505677337496 0.2925131832335089 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08178503695198325 1.1995097303949378 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -6 -14)
"cameras/drone/drone0" SET Transform localScale (0.9459802140485831 0.9459802140485831 0.9459802140485831)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -3 -17)
"cameras/drone/drone1" SET Transform localScale (0.6831125053319909 0.6831125053319909 0.6831125053319909)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0664891292569414 0)
"cameras" SET Transform eulerAngles (19.722688691226516 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5224587598537106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.451500793876245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07144852722963223
"cameras/drone/drone0" SET Transform localPosition (-0.4336050503760357 -0.24069648551625306 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.13349994037564694 0.8805901521511399 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -6 -17)
"cameras/drone/drone0" SET Transform localScale (0.780688712640552 0.780688712640552 0.780688712640552)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -20 17)
"cameras/drone/drone1" SET Transform localScale (1.305586300064514 1.305586300064514 1.305586300064514)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.386720463291135 0)
"cameras" SET Transform eulerAngles (17.77872967182747 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8494334417919347
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.658820811755926
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.023838049981510914
"cameras/drone/drone0" SET Transform localPosition (0.7998914502776346 0.21123221423179767 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8945420351432605 1.156775935118474 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 12 -4)
"cameras/drone/drone0" SET Transform localScale (1.3907166903160992 1.3907166903160992 1.3907166903160992)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -18 -13)
"cameras/drone/drone1" SET Transform localScale (0.6859113389220087 0.6859113389220087 0.6859113389220087)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.113596818514545 0)
"cameras" SET Transform eulerAngles (-2.725301830224506 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1008981294997047
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1459983316914146
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3537100205871009
"cameras/drone/drone0" SET Transform localPosition (-0.992584648959669 -0.03803232349794056 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.932595013364187 0.9858409146719423 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 13 6)
"cameras/drone/drone0" SET Transform localScale (1.4514468176070414 1.4514468176070414 1.4514468176070414)
"cameras/drone/drone1" SET Transform localEulerAngles (7 1 -5)
"cameras/drone/drone1" SET Transform localScale (0.6457500820538156 0.6457500820538156 0.6457500820538156)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.806000480573065 0)
"cameras" SET Transform eulerAngles (-14.960894886950884 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0135803085285737
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4207829783201833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06040695104511334
"cameras/drone/drone0" SET Transform localPosition (-1.1957452722053645 -0.07022783268907046 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7741884315161083 0.8935468903810319 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 13 4)
"cameras/drone/drone0" SET Transform localScale (0.6258878764128686 0.6258878764128686 0.6258878764128686)
"cameras/drone/drone1" SET Transform localEulerAngles (19 15 18)
"cameras/drone/drone1" SET Transform localScale (0.926803948522082 0.926803948522082 0.926803948522082)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8449797719863703 0)
"cameras" SET Transform eulerAngles (0.050074027836430446 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5123770648830657
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7160454339516642
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12223862920107052
"cameras/drone/drone0" SET Transform localPosition (0.9485771344290963 0.35366193018269926 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0740327885957652 0.949557801907897 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 5 -18)
"cameras/drone/drone0" SET Transform localScale (0.6304086478545223 0.6304086478545223 0.6304086478545223)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -8 -1)
"cameras/drone/drone1" SET Transform localScale (1.3040635151032034 1.3040635151032034 1.3040635151032034)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6325930462841023 0)
"cameras" SET Transform eulerAngles (9.785326190743895 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5804822657486339
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9103796813962197
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3219674278288463
"cameras/drone/drone0" SET Transform localPosition (-0.46696171469710424 -0.1265703228404484 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8718930959787452 1.0447066086316557 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -15 -11)
"cameras/drone/drone0" SET Transform localScale (1.023496828473303 1.023496828473303 1.023496828473303)
"cameras/drone/drone1" SET Transform localEulerAngles (2 4 -20)
"cameras/drone/drone1" SET Transform localScale (1.2341349977933043 1.2341349977933043 1.2341349977933043)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.74725293217773 0)
"cameras" SET Transform eulerAngles (-7.891243142670735 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6536258495955652
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9733730963151513
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0916234882606391
"cameras/drone/drone0" SET Transform localPosition (0.9777352172772786 0.5049619609159237 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.041008786174487666 1.1270064587587336 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -1 -4)
"cameras/drone/drone0" SET Transform localScale (0.751481320225742 0.751481320225742 0.751481320225742)
"cameras/drone/drone1" SET Transform localEulerAngles (2 12 11)
"cameras/drone/drone1" SET Transform localScale (1.3735218646053466 1.3735218646053466 1.3735218646053466)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.620616405120248 0)
"cameras" SET Transform eulerAngles (-1.6909225432608643 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5605632830933797
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7809270051055979
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3186586254521079
"cameras/drone/drone0" SET Transform localPosition (-1.0553286076089372 -0.12051089057054093 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8235957899222586 1.046630118470775 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -4 19)
"cameras/drone/drone0" SET Transform localScale (0.9083357965082562 0.9083357965082562 0.9083357965082562)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -20 -14)
"cameras/drone/drone1" SET Transform localScale (1.4157114047820911 1.4157114047820911 1.4157114047820911)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 98
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.827288411858312 0)
"cameras" SET Transform eulerAngles (-5.004361934125839 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.36597963983279
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7663654224911411
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.277162589073537
"cameras/drone/drone0" SET Transform localPosition (-1.0596919497020383 -0.1685737475202846 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5367744301744781 1.2787073714488406 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -2 -5)
"cameras/drone/drone0" SET Transform localScale (1.3962640709101728 1.3962640709101728 1.3962640709101728)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -16 -7)
"cameras/drone/drone1" SET Transform localScale (1.2209038632538922 1.2209038632538922 1.2209038632538922)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2126939553329685 0)
"cameras" SET Transform eulerAngles (-2.8809316917406527 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.538020302162388
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.972068645699928
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3457347739538264
"cameras/drone/drone0" SET Transform localPosition (-0.4522501333423311 -0.09252987118294392 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.14128286116947564 1.0132476210947128 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -9 9)
"cameras/drone/drone0" SET Transform localScale (1.2747565376105374 1.2747565376105374 1.2747565376105374)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -7 -13)
"cameras/drone/drone1" SET Transform localScale (1.0589602700782108 1.0589602700782108 1.0589602700782108)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.797626567687811 0)
"cameras" SET Transform eulerAngles (-11.795168830843213 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7037342804860541
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5158413958001067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12413179329291767
"cameras/drone/drone0" SET Transform localPosition (-0.04751052475510531 -0.053067807053666705 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.550632310485532 1.097999765607382 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -9 -12)
"cameras/drone/drone0" SET Transform localScale (1.2943866323801643 1.2943866323801643 1.2943866323801643)
"cameras/drone/drone1" SET Transform localEulerAngles (6 15 1)
"cameras/drone/drone1" SET Transform localScale (0.743872328682602 0.743872328682602 0.743872328682602)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.493933958978613 0)
"cameras" SET Transform eulerAngles (-1.057392523930261 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4557979858091411
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.320205312665617
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2789281574799179
"cameras/drone/drone0" SET Transform localPosition (0.7996551606926907 -0.034817502962670444 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6146536531882837 0.8185396889525468 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -9 -8)
"cameras/drone/drone0" SET Transform localScale (1.3195656123458006 1.3195656123458006 1.3195656123458006)
"cameras/drone/drone1" SET Transform localEulerAngles (3 6 -14)
"cameras/drone/drone1" SET Transform localScale (1.3535810811403661 1.3535810811403661 1.3535810811403661)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.527196915570199 0)
"cameras" SET Transform eulerAngles (-15.434282761124592 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5964570094576556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9292014224039615
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3620058893431637
"cameras/drone/drone0" SET Transform localPosition (-0.32264172625578325 0.15221371098383757 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.28018491362712405 1.2135752701269176 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 14 -12)
"cameras/drone/drone0" SET Transform localScale (1.2389691964625236 1.2389691964625236 1.2389691964625236)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -5 -1)
"cameras/drone/drone1" SET Transform localScale (1.3660302400601447 1.3660302400601447 1.3660302400601447)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.350447943805135 0)
"cameras" SET Transform eulerAngles (-11.057532777015652 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4971852160192798
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4043198314878693
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34488616795747884
"cameras/drone/drone0" SET Transform localPosition (-0.9499221345016693 -0.21440545755089285 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2228895957653383 0.9515200958171162 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -15 5)
"cameras/drone/drone0" SET Transform localScale (0.6220271974544967 0.6220271974544967 0.6220271974544967)
"cameras/drone/drone1" SET Transform localEulerAngles (12 1 14)
"cameras/drone/drone1" SET Transform localScale (1.3379613136360082 1.3379613136360082 1.3379613136360082)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.773620449393909 0)
"cameras" SET Transform eulerAngles (-1.2183516414931006 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6754241664458932
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0647257262482606
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04757270977735724
"cameras/drone/drone0" SET Transform localPosition (0.33884386345003725 0.09203229287924347 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8941413126735187 0.9081656663997515 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 8 6)
"cameras/drone/drone0" SET Transform localScale (0.7741856233837301 0.7741856233837301 0.7741856233837301)
"cameras/drone/drone1" SET Transform localEulerAngles (18 13 -3)
"cameras/drone/drone1" SET Transform localScale (1.3285582804252094 1.3285582804252094 1.3285582804252094)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.027266438136684 0)
"cameras" SET Transform eulerAngles (-15.843184453185453 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6887187190242288
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8836940283305552
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0454482840427731
"cameras/drone/drone0" SET Transform localPosition (0.6681530470131418 0.5559800362304679 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5131202111801427 0.8159616644071935 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 13 2)
"cameras/drone/drone0" SET Transform localScale (1.2984204266243475 1.2984204266243475 1.2984204266243475)
"cameras/drone/drone1" SET Transform localEulerAngles (10 20 -16)
"cameras/drone/drone1" SET Transform localScale (0.611006204551375 0.611006204551375 0.611006204551375)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.750550687191529 0)
"cameras" SET Transform eulerAngles (-4.992219912771777 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.435440442982662
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6370882917613596
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2036038699438327
"cameras/drone/drone0" SET Transform localPosition (0.37992663556048045 -0.04806172053728569 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3045188026980904 1.19502932769662 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 9 -4)
"cameras/drone/drone0" SET Transform localScale (0.6199709278277171 0.6199709278277171 0.6199709278277171)
"cameras/drone/drone1" SET Transform localEulerAngles (5 8 3)
"cameras/drone/drone1" SET Transform localScale (1.3079310574215137 1.3079310574215137 1.3079310574215137)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.776627664540186 0)
"cameras" SET Transform eulerAngles (-18.057148058462023 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3373398560917864
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0551109105176317
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.010770809462850695
"cameras/drone/drone0" SET Transform localPosition (-0.9641208507734331 -0.2976722024282698 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9378407801044835 1.190625532126564 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -16 -13)
"cameras/drone/drone0" SET Transform localScale (0.8444544259419471 0.8444544259419471 0.8444544259419471)
"cameras/drone/drone1" SET Transform localEulerAngles (19 12 -16)
"cameras/drone/drone1" SET Transform localScale (1.1485670834902697 1.1485670834902697 1.1485670834902697)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0387983421418836 0)
"cameras" SET Transform eulerAngles (-3.0753845188922533 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0597702698358709
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3840056037716124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3422002783928215
"cameras/drone/drone0" SET Transform localPosition (-0.757908749299943 0.11702386016271799 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18283182465699865 1.1843369419438505 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -19 -6)
"cameras/drone/drone0" SET Transform localScale (0.8189712383535545 0.8189712383535545 0.8189712383535545)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 3 8)
"cameras/drone/drone1" SET Transform localScale (1.382921885640945 1.382921885640945 1.382921885640945)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.099980968007005 0)
"cameras" SET Transform eulerAngles (3.1097035355894604 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5239575493356514
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.627646064218668
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19557465143856417
"cameras/drone/drone0" SET Transform localPosition (1.1705173593158358 0.1539088747773521 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0668003423711252 1.1882865516040146 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 14 -16)
"cameras/drone/drone0" SET Transform localScale (0.6905445146702448 0.6905445146702448 0.6905445146702448)
"cameras/drone/drone1" SET Transform localEulerAngles (16 3 1)
"cameras/drone/drone1" SET Transform localScale (1.1752180441213498 1.1752180441213498 1.1752180441213498)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5554694544609315 0)
"cameras" SET Transform eulerAngles (-6.820990657258381 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9398094568554399
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5683981377851801
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11163718112460562
"cameras/drone/drone0" SET Transform localPosition (-0.28587651219438925 0.39632819931547086 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8182808388104845 0.8405251837222525 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -4 5)
"cameras/drone/drone0" SET Transform localScale (1.304071904271711 1.304071904271711 1.304071904271711)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -12 -15)
"cameras/drone/drone1" SET Transform localScale (0.8121680167620469 0.8121680167620469 0.8121680167620469)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.126416406226212 0)
"cameras" SET Transform eulerAngles (-17.950710248601183 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6718884618544723
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7456765926662754
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3989915990891919
"cameras/drone/drone0" SET Transform localPosition (1.1808514714297706 0.18849937076750561 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.15002186657298222 1.0668835142165938 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -15 -3)
"cameras/drone/drone0" SET Transform localScale (1.0295657356411252 1.0295657356411252 1.0295657356411252)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -3 -8)
"cameras/drone/drone1" SET Transform localScale (0.8187292177568295 0.8187292177568295 0.8187292177568295)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0776488756456084 0)
"cameras" SET Transform eulerAngles (9.792957158909058 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5844028911036632
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.254230623949443
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3999231840259105
"cameras/drone/drone0" SET Transform localPosition (-0.0545230809659174 0.5192254453686589 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1044165669949166 1.1237702464238732 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -18 13)
"cameras/drone/drone0" SET Transform localScale (0.9177801754049357 0.9177801754049357 0.9177801754049357)
"cameras/drone/drone1" SET Transform localEulerAngles (7 8 -2)
"cameras/drone/drone1" SET Transform localScale (0.7516961879703296 0.7516961879703296 0.7516961879703296)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.473873648872904 0)
"cameras" SET Transform eulerAngles (18.78467405191298 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7396690302937678
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5778378065976053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25659344888139785
"cameras/drone/drone0" SET Transform localPosition (-1.18311835528387 0.6413224315887089 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.624458164415733 1.1140440218427978 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 5 5)
"cameras/drone/drone0" SET Transform localScale (1.3278098714917546 1.3278098714917546 1.3278098714917546)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -6 -17)
"cameras/drone/drone1" SET Transform localScale (0.9599617098668074 0.9599617098668074 0.9599617098668074)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.262136739797352 0)
"cameras" SET Transform eulerAngles (-16.2856276441072 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7211881056597826
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9730369635364191
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2395708420532422
"cameras/drone/drone0" SET Transform localPosition (0.3674460148690435 -0.18407827318364217 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.05334148073259182 1.179475137967632 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -13 0)
"cameras/drone/drone0" SET Transform localScale (1.1129714280811813 1.1129714280811813 1.1129714280811813)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -1 15)
"cameras/drone/drone1" SET Transform localScale (1.0184708338889104 1.0184708338889104 1.0184708338889104)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.788045648598239 0)
"cameras" SET Transform eulerAngles (17.03722920680778 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4921918471860041
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0497024723206225
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.290508356251778
"cameras/drone/drone0" SET Transform localPosition (-0.08670287229023632 0.13457847158582342 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7290956440428122 1.026062412061702 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 20 -10)
"cameras/drone/drone0" SET Transform localScale (1.0388522704030725 1.0388522704030725 1.0388522704030725)
"cameras/drone/drone1" SET Transform localEulerAngles (20 16 -6)
"cameras/drone/drone1" SET Transform localScale (0.660097954920412 0.660097954920412 0.660097954920412)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.712942084350997 0)
"cameras" SET Transform eulerAngles (9.070355231805497 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.452587104320354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7094571756316863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10070332125264221
"cameras/drone/drone0" SET Transform localPosition (-0.9637867745690463 0.11752051639018363 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8601541866827882 0.9004413578360458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 7 5)
"cameras/drone/drone0" SET Transform localScale (1.260747014794064 1.260747014794064 1.260747014794064)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -2 -12)
"cameras/drone/drone1" SET Transform localScale (0.9303406615105179 0.9303406615105179 0.9303406615105179)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.094835724849569 0)
"cameras" SET Transform eulerAngles (17.25346532522952 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8170351190453058
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3387999700313156
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2764670961270027
"cameras/drone/drone0" SET Transform localPosition (0.9801595986871454 -0.22239321305358456 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.841615467518487 1.0767336417436852 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 18 -5)
"cameras/drone/drone0" SET Transform localScale (1.088042331010027 1.088042331010027 1.088042331010027)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 14 1)
"cameras/drone/drone1" SET Transform localScale (1.0408854834948853 1.0408854834948853 1.0408854834948853)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.337100324037574 0)
"cameras" SET Transform eulerAngles (19.580128221942886 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7458520423223036
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2457121281055525
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3870871925179853
"cameras/drone/drone0" SET Transform localPosition (0.2745861492307555 -0.1565506961156496 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6015152838553719 0.825821480955781 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 13 12)
"cameras/drone/drone0" SET Transform localScale (1.4583723801808972 1.4583723801808972 1.4583723801808972)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -15 11)
"cameras/drone/drone1" SET Transform localScale (0.852059811281932 0.852059811281932 0.852059811281932)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.841485664655455 0)
"cameras" SET Transform eulerAngles (-19.864479575291256 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.319054845557624
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7889130956334198
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14874150121578752
"cameras/drone/drone0" SET Transform localPosition (-0.6861928213525644 0.25740157131733005 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5943493680252061 1.2109000497713234 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -16 13)
"cameras/drone/drone0" SET Transform localScale (1.044340352937231 1.044340352937231 1.044340352937231)
"cameras/drone/drone1" SET Transform localEulerAngles (6 14 -19)
"cameras/drone/drone1" SET Transform localScale (1.3457421943132142 1.3457421943132142 1.3457421943132142)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.889383503177163 0)
"cameras" SET Transform eulerAngles (17.766899688545095 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8975466320709191
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3512240971640548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3882976582146237
"cameras/drone/drone0" SET Transform localPosition (-0.09467010112838481 0.6477706997738208 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2446005845505943 1.1336869159113059 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -4 -6)
"cameras/drone/drone0" SET Transform localScale (1.161227337668321 1.161227337668321 1.161227337668321)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -16 4)
"cameras/drone/drone1" SET Transform localScale (0.613082985929152 0.613082985929152 0.613082985929152)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1687044875983634 0)
"cameras" SET Transform eulerAngles (15.743528427768737 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6382493413070223
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0408788182729047
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38843123642968397
"cameras/drone/drone0" SET Transform localPosition (-1.160048586712879 0.5566151197865545 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6074439804953 0.829946293290291 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 3 20)
"cameras/drone/drone0" SET Transform localScale (1.1160055345327708 1.1160055345327708 1.1160055345327708)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 5 -19)
"cameras/drone/drone1" SET Transform localScale (0.7878344378057011 0.7878344378057011 0.7878344378057011)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9633919437283636 0)
"cameras" SET Transform eulerAngles (8.974818954020265 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.02970432267371
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5466019014026062
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3639796169720492
"cameras/drone/drone0" SET Transform localPosition (-1.1807806647112213 0.48069803637390845 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.007316088648940733 0.9974421102495523 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -13 -4)
"cameras/drone/drone0" SET Transform localScale (0.8452036149274327 0.8452036149274327 0.8452036149274327)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -16 -4)
"cameras/drone/drone1" SET Transform localScale (0.7125234752182602 0.7125234752182602 0.7125234752182602)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.120416873008598 0)
"cameras" SET Transform eulerAngles (9.487348322742129 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1402102596348849
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2224598982222348
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.061791283179807935
"cameras/drone/drone0" SET Transform localPosition (0.7517339834466801 0.21165541942185956 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4212754077183327 1.2663003691365702 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 15 5)
"cameras/drone/drone0" SET Transform localScale (1.2494471279869677 1.2494471279869677 1.2494471279869677)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 8 -18)
"cameras/drone/drone1" SET Transform localScale (1.3848541057605837 1.3848541057605837 1.3848541057605837)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6952232761286234 0)
"cameras" SET Transform eulerAngles (8.70820740325929 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.868865688009512
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.866438999796387
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3420982623368889
"cameras/drone/drone0" SET Transform localPosition (0.8547804460685209 -0.09426404654655623 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.48148404394920785 1.2164817742120981 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 7 9)
"cameras/drone/drone0" SET Transform localScale (0.9808221821839738 0.9808221821839738 0.9808221821839738)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -1 -5)
"cameras/drone/drone1" SET Transform localScale (1.346727549346536 1.346727549346536 1.346727549346536)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.813929921523671 0)
"cameras" SET Transform eulerAngles (0.5311488686748476 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7622143358064482
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4878510952478325
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0894758977455473
"cameras/drone/drone0" SET Transform localPosition (-1.0114913919479995 0.09259045768808943 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.031929577053992 1.0802285345009797 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -3 17)
"cameras/drone/drone0" SET Transform localScale (1.2265858987965026 1.2265858987965026 1.2265858987965026)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -11 -7)
"cameras/drone/drone1" SET Transform localScale (0.6535284852120373 0.6535284852120373 0.6535284852120373)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9869876259943213 0)
"cameras" SET Transform eulerAngles (-6.772056472609528 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9787027754566182
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1025296805442983
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28739021246658225
"cameras/drone/drone0" SET Transform localPosition (0.8852855650704698 0.34284801553287453 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5672800977573904 1.1366471940440819 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -9 -2)
"cameras/drone/drone0" SET Transform localScale (1.2534081298343227 1.2534081298343227 1.2534081298343227)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -1 -10)
"cameras/drone/drone1" SET Transform localScale (1.1095382997139325 1.1095382997139325 1.1095382997139325)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6731488989692878 0)
"cameras" SET Transform eulerAngles (-13.31427019986554 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1619320975962444
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.703796740705649
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21837055366344782
"cameras/drone/drone0" SET Transform localPosition (0.7472496707953418 0.6385785390198906 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16507169267552113 1.0625674119314024 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 0 6)
"cameras/drone/drone0" SET Transform localScale (1.255690540174533 1.255690540174533 1.255690540174533)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -14 -1)
"cameras/drone/drone1" SET Transform localScale (1.0267641627377286 1.0267641627377286 1.0267641627377286)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.082911118723535 0)
"cameras" SET Transform eulerAngles (5.682005687903878 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4783259194070623
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3645942404411908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27889543279800716
"cameras/drone/drone0" SET Transform localPosition (0.8241810743127742 -0.20041952922984313 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9621439135361012 1.0386300831964395 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -12 4)
"cameras/drone/drone0" SET Transform localScale (1.0401894189810563 1.0401894189810563 1.0401894189810563)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -10 16)
"cameras/drone/drone1" SET Transform localScale (0.7502436322019168 0.7502436322019168 0.7502436322019168)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.139899052180523 0)
"cameras" SET Transform eulerAngles (19.203256768341042 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8082856921146043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3001976169721603
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23703809767330394
"cameras/drone/drone0" SET Transform localPosition (1.0044984882503682 -0.19069802558152898 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6319991393689279 0.9703492295166753 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -14 -20)
"cameras/drone/drone0" SET Transform localScale (0.6505595931338573 0.6505595931338573 0.6505595931338573)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 3 5)
"cameras/drone/drone1" SET Transform localScale (1.4514491369531837 1.4514491369531837 1.4514491369531837)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.629046546200226 0)
"cameras" SET Transform eulerAngles (-15.681391789553034 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0901787972596162
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3845803297257389
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32389076926347354
"cameras/drone/drone0" SET Transform localPosition (0.16127841599019588 0.2697384755380399 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5483133839134823 1.213432233866878 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 15 7)
"cameras/drone/drone0" SET Transform localScale (1.2487908754271575 1.2487908754271575 1.2487908754271575)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 10 13)
"cameras/drone/drone1" SET Transform localScale (1.3891568738468965 1.3891568738468965 1.3891568738468965)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4717749644127127 0)
"cameras" SET Transform eulerAngles (-16.724072399699526 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5920613053406583
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.012098791458938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39306337800391494
"cameras/drone/drone0" SET Transform localPosition (0.1731614410907063 0.09577642839149186 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0619168076977912 0.8058864541854748 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -8 13)
"cameras/drone/drone0" SET Transform localScale (0.855004776294664 0.855004776294664 0.855004776294664)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -8 -9)
"cameras/drone/drone1" SET Transform localScale (0.74482125292969 0.74482125292969 0.74482125292969)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.63156455422112 0)
"cameras" SET Transform eulerAngles (8.763023558811089 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3586889976112166
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7584476744558564
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3618679309268284
"cameras/drone/drone0" SET Transform localPosition (-0.5936130423200873 -0.23210382574820604 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2466516180527537 0.8056783371916645 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 18 2)
"cameras/drone/drone0" SET Transform localScale (0.7076340381006846 0.7076340381006846 0.7076340381006846)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -4 9)
"cameras/drone/drone1" SET Transform localScale (0.8168499960708272 0.8168499960708272 0.8168499960708272)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.992383164264209 0)
"cameras" SET Transform eulerAngles (3.131057678581726 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4682481936974413
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.073761741769861
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03632055748049497
"cameras/drone/drone0" SET Transform localPosition (-0.4594092422586765 0.05056076570936524 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8979779653082932 1.2358260263019258 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 6 9)
"cameras/drone/drone0" SET Transform localScale (1.465084325968394 1.465084325968394 1.465084325968394)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -10 -6)
"cameras/drone/drone1" SET Transform localScale (0.7166456982461751 0.7166456982461751 0.7166456982461751)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.65259196146392 0)
"cameras" SET Transform eulerAngles (-4.920357026288542 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2227853911111102
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3740616737187885
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22237527315758882
"cameras/drone/drone0" SET Transform localPosition (-0.4413696255403218 0.34800131922298955 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37834375021505207 0.8150335208625767 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -1 0)
"cameras/drone/drone0" SET Transform localScale (1.3781637350498472 1.3781637350498472 1.3781637350498472)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -1 14)
"cameras/drone/drone1" SET Transform localScale (1.0679741612016302 1.0679741612016302 1.0679741612016302)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4940366678503962 0)
"cameras" SET Transform eulerAngles (-19.502604098789153 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0094261231693555
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7508816892766905
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34276471201570596
"cameras/drone/drone0" SET Transform localPosition (-1.1686382420334394 0.6505416971196831 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8483851239022726 1.0318606634039962 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 13 -12)
"cameras/drone/drone0" SET Transform localScale (1.1373354696548392 1.1373354696548392 1.1373354696548392)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 17 -14)
"cameras/drone/drone1" SET Transform localScale (1.194634809054427 1.194634809054427 1.194634809054427)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9182641153993174 0)
"cameras" SET Transform eulerAngles (9.955285892766348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4612320755483043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.266507473721782
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07389589865276958
"cameras/drone/drone0" SET Transform localPosition (-0.6306000549259564 0.013716821401635937 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.02186500323537066 0.8987982547905623 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 1 -13)
"cameras/drone/drone0" SET Transform localScale (1.472145192597701 1.472145192597701 1.472145192597701)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 6 -18)
"cameras/drone/drone1" SET Transform localScale (0.8622895968120197 0.8622895968120197 0.8622895968120197)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1318252104598328 0)
"cameras" SET Transform eulerAngles (-8.218973969376089 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4867915262306011
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6685475013530593
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.040187039882381065
"cameras/drone/drone0" SET Transform localPosition (0.851309907436544 0.5678816116194993 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1736725804692199 0.8597770554753286 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 16 -13)
"cameras/drone/drone0" SET Transform localScale (1.0867245574068254 1.0867245574068254 1.0867245574068254)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -16 12)
"cameras/drone/drone1" SET Transform localScale (1.0373992890550274 1.0373992890550274 1.0373992890550274)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.486646415966706 0)
"cameras" SET Transform eulerAngles (1.1780550164541808 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5976302184916031
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0812567312936616
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32016740533084126
"cameras/drone/drone0" SET Transform localPosition (-1.1781514799794515 0.5028643548437444 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.18056167471863 1.026027801823159 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -3 14)
"cameras/drone/drone0" SET Transform localScale (1.495080112566686 1.495080112566686 1.495080112566686)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 4 3)
"cameras/drone/drone1" SET Transform localScale (1.1141582612307404 1.1141582612307404 1.1141582612307404)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.615841882266709 0)
"cameras" SET Transform eulerAngles (2.674064808626934 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8183689875843679
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3140150897691967
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23308094599872087
"cameras/drone/drone0" SET Transform localPosition (-0.838414679230317 0.3783535888857758 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8404002068634564 1.204107008880671 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -9 14)
"cameras/drone/drone0" SET Transform localScale (1.0820025018867776 1.0820025018867776 1.0820025018867776)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 11 -14)
"cameras/drone/drone1" SET Transform localScale (1.0995344151653157 1.0995344151653157 1.0995344151653157)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.763634881852786 0)
"cameras" SET Transform eulerAngles (11.515498294136442 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.575347053541138
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9605826847726723
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20060512925347607
"cameras/drone/drone0" SET Transform localPosition (-0.4505014654279572 0.02117845624897624 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10379113574420096 1.142284432202279 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -20 14)
"cameras/drone/drone0" SET Transform localScale (1.0603190690706783 1.0603190690706783 1.0603190690706783)
"cameras/drone/drone1" SET Transform localEulerAngles (4 8 -13)
"cameras/drone/drone1" SET Transform localScale (0.8894283634795256 0.8894283634795256 0.8894283634795256)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.006753314703729 0)
"cameras" SET Transform eulerAngles (-9.740150670216941 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8802833543462705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3939798097863687
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08817912973858855
"cameras/drone/drone0" SET Transform localPosition (0.7593828873388391 0.2977042824314559 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1643632559475539 1.2584029045428773 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -10 -18)
"cameras/drone/drone0" SET Transform localScale (0.7128508616358934 0.7128508616358934 0.7128508616358934)
"cameras/drone/drone1" SET Transform localEulerAngles (20 6 0)
"cameras/drone/drone1" SET Transform localScale (0.806491848274377 0.806491848274377 0.806491848274377)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.04758928822592 0)
"cameras" SET Transform eulerAngles (6.472859435700407 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49038026185484657
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.114195108815201
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0020169421723980284
"cameras/drone/drone0" SET Transform localPosition (-0.34227111711274794 0.619299797125338 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1467797072951531 0.8136277130054643 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 5 18)
"cameras/drone/drone0" SET Transform localScale (1.100476065615712 1.100476065615712 1.100476065615712)
"cameras/drone/drone1" SET Transform localEulerAngles (16 17 17)
"cameras/drone/drone1" SET Transform localScale (0.7261081395857767 0.7261081395857767 0.7261081395857767)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.822710466910604 0)
"cameras" SET Transform eulerAngles (4.823665010069696 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4391544433334915
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6832336038527402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3666865628629119
"cameras/drone/drone0" SET Transform localPosition (-0.19001884849291462 0.07889417851272812 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1612599599182212 1.2455633311365806 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 12 -4)
"cameras/drone/drone0" SET Transform localScale (1.139457812711645 1.139457812711645 1.139457812711645)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 9 20)
"cameras/drone/drone1" SET Transform localScale (1.1534897620211917 1.1534897620211917 1.1534897620211917)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.962599641666569 0)
"cameras" SET Transform eulerAngles (12.46423785018591 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.813941708787511
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.125533598912703
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20916755132278883
"cameras/drone/drone0" SET Transform localPosition (0.8027807057740899 -0.15513047549609932 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4489698265135891 1.117033195072937 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 13 -4)
"cameras/drone/drone0" SET Transform localScale (0.8300067893306571 0.8300067893306571 0.8300067893306571)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 14 14)
"cameras/drone/drone1" SET Transform localScale (1.4326061054581083 1.4326061054581083 1.4326061054581083)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.756310253489705 0)
"cameras" SET Transform eulerAngles (0.8287891627757595 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3321482447970205
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5549852304401832
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06914812041454202
"cameras/drone/drone0" SET Transform localPosition (-1.1488356627252754 -0.06503962195170981 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.600265943679665 0.8425178547243237 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 9 10)
"cameras/drone/drone0" SET Transform localScale (1.2760783795397734 1.2760783795397734 1.2760783795397734)
"cameras/drone/drone1" SET Transform localEulerAngles (4 15 15)
"cameras/drone/drone1" SET Transform localScale (1.4196330972012499 1.4196330972012499 1.4196330972012499)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.722983981844342 0)
"cameras" SET Transform eulerAngles (10.56944954420132 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6179985121338688
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9111698235086783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20089686850294944
"cameras/drone/drone0" SET Transform localPosition (-0.3430661273091379 0.6475515002690719 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9304805550603878 0.9805181087363317 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 11 -20)
"cameras/drone/drone0" SET Transform localScale (0.6646688919037199 0.6646688919037199 0.6646688919037199)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 19 20)
"cameras/drone/drone1" SET Transform localScale (1.0279169451302428 1.0279169451302428 1.0279169451302428)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2641492493708633 0)
"cameras" SET Transform eulerAngles (18.717682727985398 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3561202436719966
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0193078876241484
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34445964904358983
"cameras/drone/drone0" SET Transform localPosition (0.523475213366156 -0.04438616659246669 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5953489813563138 1.103327696723136 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -3 15)
"cameras/drone/drone0" SET Transform localScale (0.8052903289358074 0.8052903289358074 0.8052903289358074)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -2 -17)
"cameras/drone/drone1" SET Transform localScale (0.7651478588863669 0.7651478588863669 0.7651478588863669)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.184884966067739 0)
"cameras" SET Transform eulerAngles (12.067746435688996 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4174951815410024
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2823634173831253
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2864389122762021
"cameras/drone/drone0" SET Transform localPosition (-0.6262308688090481 0.32448029101625014 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1736157184026843 1.2737115262089562 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -15 10)
"cameras/drone/drone0" SET Transform localScale (0.7021632791381232 0.7021632791381232 0.7021632791381232)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -11 -15)
"cameras/drone/drone1" SET Transform localScale (0.8666400926660003 0.8666400926660003 0.8666400926660003)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.436819408593328 0)
"cameras" SET Transform eulerAngles (7.741833504584555 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4557964836494061
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6321042105915855
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28117719567908983
"cameras/drone/drone0" SET Transform localPosition (-0.24658444011694258 0.06471829250806721 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0508408268002447 1.1095369212715165 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 5 8)
"cameras/drone/drone0" SET Transform localScale (1.2493844319698835 1.2493844319698835 1.2493844319698835)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -12 -13)
"cameras/drone/drone1" SET Transform localScale (0.785120296866196 0.785120296866196 0.785120296866196)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.160104188315733 0)
"cameras" SET Transform eulerAngles (-7.878410220040282 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2556834547633422
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6742988890952533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25250955132170544
"cameras/drone/drone0" SET Transform localPosition (-0.16589581791307872 0.011849716731144377 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1660428972682091 0.9566069632433122 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 5 2)
"cameras/drone/drone0" SET Transform localScale (1.3120656400729942 1.3120656400729942 1.3120656400729942)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -1 -12)
"cameras/drone/drone1" SET Transform localScale (0.9664492949985267 0.9664492949985267 0.9664492949985267)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.972413506150082 0)
"cameras" SET Transform eulerAngles (0.08989777338175742 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2841454226023385
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9420553927898547
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3315385179772643
"cameras/drone/drone0" SET Transform localPosition (0.2497147277164986 0.46648207030771177 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.30557254909371656 0.8499926292841089 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 13 17)
"cameras/drone/drone0" SET Transform localScale (1.4055699803864634 1.4055699803864634 1.4055699803864634)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -7 6)
"cameras/drone/drone1" SET Transform localScale (1.0239672621444977 1.0239672621444977 1.0239672621444977)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.373341892979637 0)
"cameras" SET Transform eulerAngles (-4.7030162363461905 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0247993025083488
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9273315340355682
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3619966453042296
"cameras/drone/drone0" SET Transform localPosition (0.0855706965896752 0.12480419564992268 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7942914151511069 1.158040679153555 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -20 10)
"cameras/drone/drone0" SET Transform localScale (0.982047497122837 0.982047497122837 0.982047497122837)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -20 -14)
"cameras/drone/drone1" SET Transform localScale (1.0456414858757324 1.0456414858757324 1.0456414858757324)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.950941501223637 0)
"cameras" SET Transform eulerAngles (2.5964872816136264 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6394785408400743
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4351372197423529
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23241919682003123
"cameras/drone/drone0" SET Transform localPosition (-0.9558492431564471 0.6563000684117517 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.44721936810096863 0.8875951593105096 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 14 -11)
"cameras/drone/drone0" SET Transform localScale (1.2146877053008003 1.2146877053008003 1.2146877053008003)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -1 -2)
"cameras/drone/drone1" SET Transform localScale (0.7254973836077826 0.7254973836077826 0.7254973836077826)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.927875611347054 0)
"cameras" SET Transform eulerAngles (8.396648490522093 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.474146176224461
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7063200080152425
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30203153158394447
"cameras/drone/drone0" SET Transform localPosition (-0.733798811673694 0.06288752706426853 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.24181652599783932 1.0015433970103582 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 9 11)
"cameras/drone/drone0" SET Transform localScale (0.6512635572201713 0.6512635572201713 0.6512635572201713)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -12 15)
"cameras/drone/drone1" SET Transform localScale (1.4799355290199565 1.4799355290199565 1.4799355290199565)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.823350225054128 0)
"cameras" SET Transform eulerAngles (10.893886778598699 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1857169081302463
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.038242580429565
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17414659813766709
"cameras/drone/drone0" SET Transform localPosition (0.23843284030810086 0.4878057185756956 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5715917884679038 1.2300482907056802 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -20 -13)
"cameras/drone/drone0" SET Transform localScale (0.736990081989007 0.736990081989007 0.736990081989007)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -9 -1)
"cameras/drone/drone1" SET Transform localScale (1.4384566675273562 1.4384566675273562 1.4384566675273562)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1255682158823035 0)
"cameras" SET Transform eulerAngles (-11.841743189196512 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4582890709716786
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9539890325219754
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34666654170444433
"cameras/drone/drone0" SET Transform localPosition (0.1538819912813676 0.6691290335260787 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.434490399425876 1.1831205803362412 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -20 -3)
"cameras/drone/drone0" SET Transform localScale (0.8536227904516529 0.8536227904516529 0.8536227904516529)
"cameras/drone/drone1" SET Transform localEulerAngles (11 8 9)
"cameras/drone/drone1" SET Transform localScale (0.7265420213762681 0.7265420213762681 0.7265420213762681)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7927600248589535 0)
"cameras" SET Transform eulerAngles (1.7728992165752153 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2871008595962086
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9112376422598278
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11466211833449554
"cameras/drone/drone0" SET Transform localPosition (0.27904857166697794 -0.1916940640826557 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.01835535975065561 1.087008745539473 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 14 14)
"cameras/drone/drone0" SET Transform localScale (1.3264458077775525 1.3264458077775525 1.3264458077775525)
"cameras/drone/drone1" SET Transform localEulerAngles (17 13 8)
"cameras/drone/drone1" SET Transform localScale (1.484069328495819 1.484069328495819 1.484069328495819)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.874102712141299 0)
"cameras" SET Transform eulerAngles (6.95202509456513 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1799920008135483
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1755339253236965
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3139016332235293
"cameras/drone/drone0" SET Transform localPosition (1.1658400275070646 -0.03405528446617173 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0641489000690598 1.0463154417311444 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -2 -7)
"cameras/drone/drone0" SET Transform localScale (0.6494978018651666 0.6494978018651666 0.6494978018651666)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -11 -1)
"cameras/drone/drone1" SET Transform localScale (0.9073261889303194 0.9073261889303194 0.9073261889303194)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.619560978228991 0)
"cameras" SET Transform eulerAngles (5.214311244755756 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6397411851885615
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8901199107408446
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13956810263271754
"cameras/drone/drone0" SET Transform localPosition (1.0025740039910185 -0.01068474253159607 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3180641459538538 0.9857126991387049 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -14 -3)
"cameras/drone/drone0" SET Transform localScale (1.4405620936776042 1.4405620936776042 1.4405620936776042)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -4 4)
"cameras/drone/drone1" SET Transform localScale (1.2471022239725662 1.2471022239725662 1.2471022239725662)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.827689593404004 0)
"cameras" SET Transform eulerAngles (-4.424953257344892 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.193538841621958
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0625105024175672
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02272197168534498
"cameras/drone/drone0" SET Transform localPosition (-0.5400889597595169 -0.02096977478224199 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17928631482300683 1.1631507992971422 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -19 16)
"cameras/drone/drone0" SET Transform localScale (1.1376888383399368 1.1376888383399368 1.1376888383399368)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 4 -11)
"cameras/drone/drone1" SET Transform localScale (1.3266212091125733 1.3266212091125733 1.3266212091125733)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.624736109865158 0)
"cameras" SET Transform eulerAngles (-4.537903556762144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5655849182600399
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9414497846308894
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02524825262491133
"cameras/drone/drone0" SET Transform localPosition (0.8729672324957585 -0.1952820934389327 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5758271354318721 1.217271331430328 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 18 -11)
"cameras/drone/drone0" SET Transform localScale (0.9793975981392594 0.9793975981392594 0.9793975981392594)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -11 -18)
"cameras/drone/drone1" SET Transform localScale (0.9412360378810495 0.9412360378810495 0.9412360378810495)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.404817104269934 0)
"cameras" SET Transform eulerAngles (-15.637567299838313 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1134162829430043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3142037740982808
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.006765729665519471
"cameras/drone/drone0" SET Transform localPosition (0.10372435860088669 -0.003132111018868955 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0338723093135604 1.0076779406296867 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 14 18)
"cameras/drone/drone0" SET Transform localScale (0.646423003413317 0.646423003413317 0.646423003413317)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -9 -17)
"cameras/drone/drone1" SET Transform localScale (1.2590231854695757 1.2590231854695757 1.2590231854695757)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.485359453228131 0)
"cameras" SET Transform eulerAngles (-12.890748550813589 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7046802068471318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3764879278355018
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07919570087900896
"cameras/drone/drone0" SET Transform localPosition (0.735166172229706 -0.2604847659690683 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1253050298671015 0.8987031912743753 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -15 -8)
"cameras/drone/drone0" SET Transform localScale (1.2636701750576456 1.2636701750576456 1.2636701750576456)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -4 -1)
"cameras/drone/drone1" SET Transform localScale (0.8598547425960441 0.8598547425960441 0.8598547425960441)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.045578279116384 0)
"cameras" SET Transform eulerAngles (16.212720931003133 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.795610850591594
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.937656162430828
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.007528183535250976
"cameras/drone/drone0" SET Transform localPosition (1.1388708723848 0.3674516858953733 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.49473831257297196 1.1586975070119714 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 6 5)
"cameras/drone/drone0" SET Transform localScale (0.8685797912810628 0.8685797912810628 0.8685797912810628)
"cameras/drone/drone1" SET Transform localEulerAngles (20 15 -10)
"cameras/drone/drone1" SET Transform localScale (1.0159203428707528 1.0159203428707528 1.0159203428707528)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.689478777082968 0)
"cameras" SET Transform eulerAngles (-3.5126558846943325 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3200238713050685
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9054689770108926
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09714955046188045
"cameras/drone/drone0" SET Transform localPosition (0.8419566493649768 0.6347169272048783 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4575137885075121 1.1871250608231823 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 2 -3)
"cameras/drone/drone0" SET Transform localScale (1.340240555049835 1.340240555049835 1.340240555049835)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -1 -15)
"cameras/drone/drone1" SET Transform localScale (0.6547622153267465 0.6547622153267465 0.6547622153267465)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.426741350816664 0)
"cameras" SET Transform eulerAngles (-11.541591456485992 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.58481633252844
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9260189445919553
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2839510975100798
"cameras/drone/drone0" SET Transform localPosition (0.7463828823475323 -0.05254733561555319 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5178324705477002 1.0631080221761875 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -17 -1)
"cameras/drone/drone0" SET Transform localScale (0.9492473120697618 0.9492473120697618 0.9492473120697618)
"cameras/drone/drone1" SET Transform localEulerAngles (8 11 2)
"cameras/drone/drone1" SET Transform localScale (1.3934731278121273 1.3934731278121273 1.3934731278121273)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.517848974623838 0)
"cameras" SET Transform eulerAngles (10.818763235907703 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5238763205438626
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.353108718547846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.035799216476673744
"cameras/drone/drone0" SET Transform localPosition (-0.28997852209120245 -0.22105152764823438 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0362173524159806 1.1472113002830175 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 11 -6)
"cameras/drone/drone0" SET Transform localScale (1.4397911652663844 1.4397911652663844 1.4397911652663844)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -7 13)
"cameras/drone/drone1" SET Transform localScale (1.3628324673516408 1.3628324673516408 1.3628324673516408)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.400869860433245 0)
"cameras" SET Transform eulerAngles (-19.181682446600167 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6225850905172589
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8071401005109524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17935944501658702
"cameras/drone/drone0" SET Transform localPosition (-0.9125446790215923 0.3979809215166617 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9556292907908241 0.8933758092191768 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -11 -3)
"cameras/drone/drone0" SET Transform localScale (1.1520140328294919 1.1520140328294919 1.1520140328294919)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -19 -3)
"cameras/drone/drone1" SET Transform localScale (0.9011341594677729 0.9011341594677729 0.9011341594677729)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.910644968115493 0)
"cameras" SET Transform eulerAngles (1.3442687263274564 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8068419588678641
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.577522802082112
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02956645307291428
"cameras/drone/drone0" SET Transform localPosition (0.6506509053125713 -0.2733292872118101 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2748831775985644 1.0760300154092874 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 17 -11)
"cameras/drone/drone0" SET Transform localScale (1.3224996207804465 1.3224996207804465 1.3224996207804465)
"cameras/drone/drone1" SET Transform localEulerAngles (14 11 10)
"cameras/drone/drone1" SET Transform localScale (0.9567147442521597 0.9567147442521597 0.9567147442521597)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3953472488583483 0)
"cameras" SET Transform eulerAngles (-7.817251275878213 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2126547517426869
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6235476225379921
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12789119312445305
"cameras/drone/drone0" SET Transform localPosition (-0.8935435384671941 0.6154349783355599 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8024919909428363 1.161618162464986 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -7 -14)
"cameras/drone/drone0" SET Transform localScale (1.0479345948273648 1.0479345948273648 1.0479345948273648)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -15 11)
"cameras/drone/drone1" SET Transform localScale (1.1866675593747718 1.1866675593747718 1.1866675593747718)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1078908804551855 0)
"cameras" SET Transform eulerAngles (3.7330339743608576 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7768004666087003
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.638367402332721
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3984683392368687
"cameras/drone/drone0" SET Transform localPosition (0.44074672389632275 0.08045183623253244 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6295471435873249 1.2531284692401146 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 20 -18)
"cameras/drone/drone0" SET Transform localScale (1.3470344832903463 1.3470344832903463 1.3470344832903463)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -4 3)
"cameras/drone/drone1" SET Transform localScale (1.468723242924511 1.468723242924511 1.468723242924511)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5260684994272653 0)
"cameras" SET Transform eulerAngles (-8.063466731469493 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0665022260979313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4093363097977276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09291457198050677
"cameras/drone/drone0" SET Transform localPosition (-0.6856667200186652 0.5524695143165863 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7382270749769024 0.9744983090964476 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 15 -20)
"cameras/drone/drone0" SET Transform localScale (1.0547925646700254 1.0547925646700254 1.0547925646700254)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -3 0)
"cameras/drone/drone1" SET Transform localScale (1.085437369130803 1.085437369130803 1.085437369130803)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4212168772102762 0)
"cameras" SET Transform eulerAngles (-9.619453204589071 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.070962240771327
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6358405913047989
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1339122879009445
"cameras/drone/drone0" SET Transform localPosition (-0.24626193742168323 0.6723580637932236 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5670150775412051 0.8498587792005885 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 19 -13)
"cameras/drone/drone0" SET Transform localScale (1.386274146773817 1.386274146773817 1.386274146773817)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -7 -15)
"cameras/drone/drone1" SET Transform localScale (1.031765402478251 1.031765402478251 1.031765402478251)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3608602019507785 0)
"cameras" SET Transform eulerAngles (-2.0773000411022515 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9304829697142587
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2913177833376328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1494178186794545
"cameras/drone/drone0" SET Transform localPosition (-0.4833654231991146 -0.1812782072463704 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2814383874122678 0.954922665854611 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 15 13)
"cameras/drone/drone0" SET Transform localScale (0.8763519765472916 0.8763519765472916 0.8763519765472916)
"cameras/drone/drone1" SET Transform localEulerAngles (13 13 19)
"cameras/drone/drone1" SET Transform localScale (0.6892374976758455 0.6892374976758455 0.6892374976758455)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.501005018754061 0)
"cameras" SET Transform eulerAngles (2.3882248285286636 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5346378284468535
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5097688372401277
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1983115886913278
"cameras/drone/drone0" SET Transform localPosition (-0.595396477016919 -0.08799595912813146 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4109703397545512 1.2683575998125936 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -17 -16)
"cameras/drone/drone0" SET Transform localScale (0.75459367639808 0.75459367639808 0.75459367639808)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -4 -16)
"cameras/drone/drone1" SET Transform localScale (1.1817677061771874 1.1817677061771874 1.1817677061771874)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.64242768682486 0)
"cameras" SET Transform eulerAngles (12.030649341885649 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3511797065905777
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7547460515081539
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29196894091317843
"cameras/drone/drone0" SET Transform localPosition (-0.4396706712231314 -0.013533470282859505 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5229457724022177 0.9150249966695057 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -16 -12)
"cameras/drone/drone0" SET Transform localScale (1.1886770898236199 1.1886770898236199 1.1886770898236199)
"cameras/drone/drone1" SET Transform localEulerAngles (20 10 20)
"cameras/drone/drone1" SET Transform localScale (0.7765278851977749 0.7765278851977749 0.7765278851977749)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.482585641184019 0)
"cameras" SET Transform eulerAngles (-14.021277166790505 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2404205013693042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3733140442140876
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09356367289421291
"cameras/drone/drone0" SET Transform localPosition (-0.776474753888301 -0.2910419185619843 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10858093089184462 0.9872960902629744 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -14 8)
"cameras/drone/drone0" SET Transform localScale (0.6538452294630283 0.6538452294630283 0.6538452294630283)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 16 10)
"cameras/drone/drone1" SET Transform localScale (1.3664582369818679 1.3664582369818679 1.3664582369818679)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.63363893402532 0)
"cameras" SET Transform eulerAngles (-16.46299001742326 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3734108881926699
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2174831226641487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3136161705656635
"cameras/drone/drone0" SET Transform localPosition (-0.15087586998213576 0.6132034048028125 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5751673838546936 0.8732318881823573 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 6 5)
"cameras/drone/drone0" SET Transform localScale (0.8912238853492116 0.8912238853492116 0.8912238853492116)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 3 12)
"cameras/drone/drone1" SET Transform localScale (1.4827811875112418 1.4827811875112418 1.4827811875112418)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6304234633797994 0)
"cameras" SET Transform eulerAngles (18.46337747039975 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7102615834731363
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6654955538792913
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2598063209092938
"cameras/drone/drone0" SET Transform localPosition (0.8819958750152075 0.18409886346347043 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7074598651887927 0.8123018355035541 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -17 19)
"cameras/drone/drone0" SET Transform localScale (1.2078992169757505 1.2078992169757505 1.2078992169757505)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 11 -17)
"cameras/drone/drone1" SET Transform localScale (1.3908851490070118 1.3908851490070118 1.3908851490070118)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4828509559953913 0)
"cameras" SET Transform eulerAngles (0.30135117717889415 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.415763982317675
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1171928539173772
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22889128035044523
"cameras/drone/drone0" SET Transform localPosition (-1.1841857029768694 -0.10652923701753308 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.051664634321305636 0.8676665828444756 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 19 19)
"cameras/drone/drone0" SET Transform localScale (0.6928414750108002 0.6928414750108002 0.6928414750108002)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -7 4)
"cameras/drone/drone1" SET Transform localScale (1.383712814874454 1.383712814874454 1.383712814874454)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.989639278611497 0)
"cameras" SET Transform eulerAngles (9.46429493414804 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.498703682020413
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9993399756135097
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07608802588752868
"cameras/drone/drone0" SET Transform localPosition (-0.8296089574527801 0.26990179886268423 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7083123566172824 0.911098625441513 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 3 -11)
"cameras/drone/drone0" SET Transform localScale (1.4379472729954208 1.4379472729954208 1.4379472729954208)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -2 -7)
"cameras/drone/drone1" SET Transform localScale (0.6526800617627179 0.6526800617627179 0.6526800617627179)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.159505717717438 0)
"cameras" SET Transform eulerAngles (-3.6715830093652677 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40561968699976153
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8988372300676941
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18755901689832905
"cameras/drone/drone0" SET Transform localPosition (-0.3070496491852569 0.025044929791077586 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.13993927141745655 1.1939854748015994 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -16 -18)
"cameras/drone/drone0" SET Transform localScale (1.0016873746874126 1.0016873746874126 1.0016873746874126)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -17 -15)
"cameras/drone/drone1" SET Transform localScale (1.475960796395888 1.475960796395888 1.475960796395888)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3153528903834397 0)
"cameras" SET Transform eulerAngles (-17.210353718821295 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5557997997527715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9491031627800549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.00024598651298690655
"cameras/drone/drone0" SET Transform localPosition (-0.41430953374468393 -0.12586056128115214 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1736417509415762 0.964275317289315 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 17 -8)
"cameras/drone/drone0" SET Transform localScale (0.8780016394628682 0.8780016394628682 0.8780016394628682)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -4 16)
"cameras/drone/drone1" SET Transform localScale (1.1452392353742178 1.1452392353742178 1.1452392353742178)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.332006821075003 0)
"cameras" SET Transform eulerAngles (7.4334896771068095 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.839977366346065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3653287177475655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3708549195774296
"cameras/drone/drone0" SET Transform localPosition (-0.12714794644062444 0.5798240430801256 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2308350901090379 1.1895016813071158 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 2 11)
"cameras/drone/drone0" SET Transform localScale (0.9725505437781002 0.9725505437781002 0.9725505437781002)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -16 -20)
"cameras/drone/drone1" SET Transform localScale (1.2866807797632218 1.2866807797632218 1.2866807797632218)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3542149355870166 0)
"cameras" SET Transform eulerAngles (1.4973749513426782 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6404131397689399
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9495807240098776
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33106774988699855
"cameras/drone/drone0" SET Transform localPosition (0.20072623569769799 -0.07867021386583878 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4312049376631002 0.8090797078485086 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -5 6)
"cameras/drone/drone0" SET Transform localScale (0.7815976416593539 0.7815976416593539 0.7815976416593539)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -10 12)
"cameras/drone/drone1" SET Transform localScale (1.499232828344769 1.499232828344769 1.499232828344769)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.330350377330282 0)
"cameras" SET Transform eulerAngles (0.32010987380220257 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5524646648942717
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4206468216994663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03315621333683012
"cameras/drone/drone0" SET Transform localPosition (-1.1065582871798578 0.3559471838558977 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.48932753931245765 1.0169213688667575 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 12 -1)
"cameras/drone/drone0" SET Transform localScale (0.9137390922031113 0.9137390922031113 0.9137390922031113)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -11 2)
"cameras/drone/drone1" SET Transform localScale (0.6648532530949318 0.6648532530949318 0.6648532530949318)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.596984828492835 0)
"cameras" SET Transform eulerAngles (13.868826268161747 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0872883613352413
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2882850554055245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24647740659678
"cameras/drone/drone0" SET Transform localPosition (-0.4625958602775567 -0.09264284788506078 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.026083746272888675 0.82233563622981 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 10 17)
"cameras/drone/drone0" SET Transform localScale (1.4714420832490327 1.4714420832490327 1.4714420832490327)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -5 12)
"cameras/drone/drone1" SET Transform localScale (0.9489948991244905 0.9489948991244905 0.9489948991244905)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6195656177294637 0)
"cameras" SET Transform eulerAngles (-2.409609604030365 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5803561600815551
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4002625532184796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31696393321000915
"cameras/drone/drone0" SET Transform localPosition (-0.4638058992163445 0.09574776449516681 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.42136900006275946 1.2872421828988372 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -14 -16)
"cameras/drone/drone0" SET Transform localScale (1.3092014975747759 1.3092014975747759 1.3092014975747759)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -11 9)
"cameras/drone/drone1" SET Transform localScale (1.237436790475893 1.237436790475893 1.237436790475893)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.258623470319179 0)
"cameras" SET Transform eulerAngles (14.946104151067125 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8008849984554474
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7696481569720097
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31713111412220996
"cameras/drone/drone0" SET Transform localPosition (-0.9394582084234055 0.2741403712048796 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.423040896989369 1.1223677842544397 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 14 -20)
"cameras/drone/drone0" SET Transform localScale (0.697667645176438 0.697667645176438 0.697667645176438)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -4 -7)
"cameras/drone/drone1" SET Transform localScale (1.47188816325129 1.47188816325129 1.47188816325129)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4607784566168007 0)
"cameras" SET Transform eulerAngles (1.3821460613860417 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3574552963704372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9549742446556493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3082798583472773
"cameras/drone/drone0" SET Transform localPosition (0.09879732031972388 0.4883075338600184 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8771348382989221 1.1598653908209617 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 1 6)
"cameras/drone/drone0" SET Transform localScale (1.2668487473086834 1.2668487473086834 1.2668487473086834)
"cameras/drone/drone1" SET Transform localEulerAngles (5 13 -6)
"cameras/drone/drone1" SET Transform localScale (1.2010054346298724 1.2010054346298724 1.2010054346298724)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.272402852279907 0)
"cameras" SET Transform eulerAngles (19.113660299037974 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46755903668777726
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9239129111484132
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08911449455499493
"cameras/drone/drone0" SET Transform localPosition (-0.692023566642285 0.05629353691237743 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24632309500617922 1.0323949599552922 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -18 20)
"cameras/drone/drone0" SET Transform localScale (1.4059622388304396 1.4059622388304396 1.4059622388304396)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -14 -17)
"cameras/drone/drone1" SET Transform localScale (1.4981104775599516 1.4981104775599516 1.4981104775599516)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3511539269115764 0)
"cameras" SET Transform eulerAngles (16.41817726953998 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5285285095821997
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2182050854053943
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36428633863923293
"cameras/drone/drone0" SET Transform localPosition (0.4477327288029165 0.38064896510499907 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3992597483425484 1.1450867424557032 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 8 -19)
"cameras/drone/drone0" SET Transform localScale (1.1956916479623585 1.1956916479623585 1.1956916479623585)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -8 -8)
"cameras/drone/drone1" SET Transform localScale (1.4357583379535757 1.4357583379535757 1.4357583379535757)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2688396608244936 0)
"cameras" SET Transform eulerAngles (17.22130021833221 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4969837003037538
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3447082475610361
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22981568443629247
"cameras/drone/drone0" SET Transform localPosition (0.8428800472896885 0.2714332804083119 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6794537743939644 0.9946625688275115 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -10 3)
"cameras/drone/drone0" SET Transform localScale (1.2318915393380965 1.2318915393380965 1.2318915393380965)
"cameras/drone/drone1" SET Transform localEulerAngles (4 14 -16)
"cameras/drone/drone1" SET Transform localScale (0.692996536760708 0.692996536760708 0.692996536760708)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.102447699963179 0)
"cameras" SET Transform eulerAngles (1.9063118563572914 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.073763393012285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.100346212093664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15872235552997171
"cameras/drone/drone0" SET Transform localPosition (0.8952986813557804 0.49932994029421046 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6438661513010986 0.9477011077100876 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 6 11)
"cameras/drone/drone0" SET Transform localScale (1.4251161297183474 1.4251161297183474 1.4251161297183474)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -9 18)
"cameras/drone/drone1" SET Transform localScale (1.1537557763571002 1.1537557763571002 1.1537557763571002)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.991016411591724 0)
"cameras" SET Transform eulerAngles (-4.777042481184623 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8576418857862079
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5311858650398964
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3306449397258378
"cameras/drone/drone0" SET Transform localPosition (-0.8083562876537344 0.5590342140131903 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9269822299652961 1.1083719146419755 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 0 11)
"cameras/drone/drone0" SET Transform localScale (1.2035547685544645 1.2035547685544645 1.2035547685544645)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 20 14)
"cameras/drone/drone1" SET Transform localScale (0.9205548460878455 0.9205548460878455 0.9205548460878455)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.675014972222716 0)
"cameras" SET Transform eulerAngles (-12.556687073157864 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.328790392470935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.08860080022074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.395007602739787
"cameras/drone/drone0" SET Transform localPosition (-0.2288217931526445 0.08163952519345036 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.16284270509415233 1.2457686547351199 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -15 -15)
"cameras/drone/drone0" SET Transform localScale (1.0885923570785045 1.0885923570785045 1.0885923570785045)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -10 -4)
"cameras/drone/drone1" SET Transform localScale (1.3102241371814167 1.3102241371814167 1.3102241371814167)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.256299601685525 0)
"cameras" SET Transform eulerAngles (-3.223580804085561 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9259502014499384
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6223128702444867
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19723718374814034
"cameras/drone/drone0" SET Transform localPosition (0.19246351947634843 -0.08820044411791489 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7054092928544482 0.8583288123519413 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -4 4)
"cameras/drone/drone0" SET Transform localScale (0.9765709276803833 0.9765709276803833 0.9765709276803833)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 9 6)
"cameras/drone/drone1" SET Transform localScale (1.4452028146893607 1.4452028146893607 1.4452028146893607)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
