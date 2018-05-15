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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 168 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 23 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 74 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 29 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-4.38345408396134 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 50
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.559092377983235 0)
"cameras" SET Transform eulerAngles (-18.82530036826177 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.534825059665935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3296550804240501
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.00374027988203034
"cameras/drone/drone0" SET Transform localPosition (1.1111881009314708 0.20391155276786815 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1350568219853192 0.8123845175615984 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -5 -9)
"cameras/drone/drone0" SET Transform localScale (0.8181856282270934 0.8181856282270934 0.8181856282270934)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 9 20)
"cameras/drone/drone1" SET Transform localScale (1.4597539586454396 1.4597539586454396 1.4597539586454396)
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
"cameras" SET Transform position (0 3.658888253028651 0)
"cameras" SET Transform eulerAngles (2.9885417205869658 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.551103222844314
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9407327799398487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3926376414118178
"cameras/drone/drone0" SET Transform localPosition (0.4208719097621709 0.2177603137469038 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.18479281917874024 0.9830588351676176 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 20 5)
"cameras/drone/drone0" SET Transform localScale (1.037414418882362 1.037414418882362 1.037414418882362)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 13 12)
"cameras/drone/drone1" SET Transform localScale (1.0479497775902393 1.0479497775902393 1.0479497775902393)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7427855294425934 0)
"cameras" SET Transform eulerAngles (18.655373707337723 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7858527906775934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4395613734988595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07618563604743067
"cameras/drone/drone0" SET Transform localPosition (0.271166905527749 -0.18947059180527565 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5125045124476322 1.2695068838339756 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 0 3)
"cameras/drone/drone0" SET Transform localScale (1.2627056979722187 1.2627056979722187 1.2627056979722187)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 10 4)
"cameras/drone/drone1" SET Transform localScale (0.8330134864297355 0.8330134864297355 0.8330134864297355)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7547852436565394 0)
"cameras" SET Transform eulerAngles (6.262543806991733 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41372418282595663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0985528270196023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06075419126410245
"cameras/drone/drone0" SET Transform localPosition (0.2237926686492584 0.13731897254210018 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4794068066713263 1.2736346423618834 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 17 12)
"cameras/drone/drone0" SET Transform localScale (0.6414661427922242 0.6414661427922242 0.6414661427922242)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 0 7)
"cameras/drone/drone1" SET Transform localScale (1.1968994496817025 1.1968994496817025 1.1968994496817025)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4154638196008 0)
"cameras" SET Transform eulerAngles (15.327021499583388 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4109660977494072
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5422436909123065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2784920157614876
"cameras/drone/drone0" SET Transform localPosition (-0.8436076447775303 0.6869014002705689 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6678833702472183 1.211272322953963 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 3 17)
"cameras/drone/drone0" SET Transform localScale (1.2239324826377402 1.2239324826377402 1.2239324826377402)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -6 3)
"cameras/drone/drone1" SET Transform localScale (1.4841854102887067 1.4841854102887067 1.4841854102887067)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7318358591231284 0)
"cameras" SET Transform eulerAngles (-6.409790665505364 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.409651285253977
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.080297093886974
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.017956533152897202
"cameras/drone/drone0" SET Transform localPosition (-1.0784525440533692 -0.07524399506005014 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5986470110202216 1.2767771011323594 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 13 8)
"cameras/drone/drone0" SET Transform localScale (1.2508691085985835 1.2508691085985835 1.2508691085985835)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 1 7)
"cameras/drone/drone1" SET Transform localScale (1.4584570644373231 1.4584570644373231 1.4584570644373231)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2440504259977403 0)
"cameras" SET Transform eulerAngles (-8.322133976325684 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0741405406111373
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0512685565066873
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24660675975361232
"cameras/drone/drone0" SET Transform localPosition (0.40608170792538467 -0.24460668722473705 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6325901785654076 1.2532982250367943 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 3 16)
"cameras/drone/drone0" SET Transform localScale (0.9977359104074708 0.9977359104074708 0.9977359104074708)
"cameras/drone/drone1" SET Transform localEulerAngles (13 8 10)
"cameras/drone/drone1" SET Transform localScale (0.791983416487767 0.791983416487767 0.791983416487767)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.728122364371673 0)
"cameras" SET Transform eulerAngles (-4.118240083632671 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.080696860390022
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7666588114174844
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18109051088323974
"cameras/drone/drone0" SET Transform localPosition (-0.11552372142618839 0.6488561695572306 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5564165994846397 1.0806324814393369 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -1 -10)
"cameras/drone/drone0" SET Transform localScale (1.2842800552669762 1.2842800552669762 1.2842800552669762)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -5 -15)
"cameras/drone/drone1" SET Transform localScale (0.7571531224570894 0.7571531224570894 0.7571531224570894)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.55993697378322 0)
"cameras" SET Transform eulerAngles (9.743182958828207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.885709386724727
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1773262711038475
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07457049744086817
"cameras/drone/drone0" SET Transform localPosition (0.00652109406411272 0.33807984916489725 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.987369474349459 1.2841317936385386 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -7 -6)
"cameras/drone/drone0" SET Transform localScale (1.077229191414664 1.077229191414664 1.077229191414664)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -19 -16)
"cameras/drone/drone1" SET Transform localScale (0.8029912254385592 0.8029912254385592 0.8029912254385592)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.104546112648492 0)
"cameras" SET Transform eulerAngles (-2.747020944008508 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43941474227203375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.411476926623301
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2263797736650194
"cameras/drone/drone0" SET Transform localPosition (-0.4594780094409219 0.020335074338525383 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.37058315671101405 1.10877005431733 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 2 -14)
"cameras/drone/drone0" SET Transform localScale (1.3032109112135166 1.3032109112135166 1.3032109112135166)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -11 -13)
"cameras/drone/drone1" SET Transform localScale (0.9942609776539889 0.9942609776539889 0.9942609776539889)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.987887514887076 0)
"cameras" SET Transform eulerAngles (-2.1873386450881185 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1556760757413664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7731680030514636
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3864426814109141
"cameras/drone/drone0" SET Transform localPosition (-1.0598135404929703 -0.008238356201813846 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8133639303168967 1.2322620550671544 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 15 1)
"cameras/drone/drone0" SET Transform localScale (0.792877225202931 0.792877225202931 0.792877225202931)
"cameras/drone/drone1" SET Transform localEulerAngles (7 0 12)
"cameras/drone/drone1" SET Transform localScale (0.7190456690237172 0.7190456690237172 0.7190456690237172)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.001047758694095 0)
"cameras" SET Transform eulerAngles (-10.51290145494988 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4727946091756112
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0531199365899078
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2341457078467185
"cameras/drone/drone0" SET Transform localPosition (0.5771173743696345 -0.23527307027016248 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08569656705678197 1.0271857324529317 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -11 -6)
"cameras/drone/drone0" SET Transform localScale (0.8349793752602561 0.8349793752602561 0.8349793752602561)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 11 3)
"cameras/drone/drone1" SET Transform localScale (1.0478801485821725 1.0478801485821725 1.0478801485821725)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0994979058947365 0)
"cameras" SET Transform eulerAngles (18.8763863528118 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2041160920704945
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0705605293539209
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07193439598393954
"cameras/drone/drone0" SET Transform localPosition (-1.188235283026381 0.6802653419379696 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07723589012917031 1.2745496127437168 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 17 5)
"cameras/drone/drone0" SET Transform localScale (1.0680998797164452 1.0680998797164452 1.0680998797164452)
"cameras/drone/drone1" SET Transform localEulerAngles (15 18 -11)
"cameras/drone/drone1" SET Transform localScale (0.8750639678236384 0.8750639678236384 0.8750639678236384)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5427361198661025 0)
"cameras" SET Transform eulerAngles (2.265980142325759 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3348698552477647
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0439547483689817
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37062992358191
"cameras/drone/drone0" SET Transform localPosition (0.34847537876549994 -0.049822310954660665 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8432048697303481 1.0331799547876521 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 9 16)
"cameras/drone/drone0" SET Transform localScale (1.1834264300038173 1.1834264300038173 1.1834264300038173)
"cameras/drone/drone1" SET Transform localEulerAngles (4 0 20)
"cameras/drone/drone1" SET Transform localScale (1.3319657511186311 1.3319657511186311 1.3319657511186311)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.072031074974616 0)
"cameras" SET Transform eulerAngles (-6.298217705030535 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8089661345228478
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2918887552788103
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31529427385938347
"cameras/drone/drone0" SET Transform localPosition (-0.4772594108969118 -0.10448378625488836 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1517789738738973 0.9493773472813731 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 3 -20)
"cameras/drone/drone0" SET Transform localScale (1.0249210424385158 1.0249210424385158 1.0249210424385158)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -4 9)
"cameras/drone/drone1" SET Transform localScale (1.190357734508283 1.190357734508283 1.190357734508283)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.411588758584798 0)
"cameras" SET Transform eulerAngles (-14.760044793201583 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2303266698245992
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.111112962672899
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31685588359515854
"cameras/drone/drone0" SET Transform localPosition (0.29684186390911327 0.41546813195473825 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.959449898819567 0.8312178007529212 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 7 3)
"cameras/drone/drone0" SET Transform localScale (0.9576113054838619 0.9576113054838619 0.9576113054838619)
"cameras/drone/drone1" SET Transform localEulerAngles (15 19 9)
"cameras/drone/drone1" SET Transform localScale (0.670666381543778 0.670666381543778 0.670666381543778)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.698199530172868 0)
"cameras" SET Transform eulerAngles (0.7286933802196955 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6127692506053657
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.262286135908664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03218268502094812
"cameras/drone/drone0" SET Transform localPosition (-0.868456723901158 0.3001152581772069 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0226189903178928 0.8054492019720036 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -9 9)
"cameras/drone/drone0" SET Transform localScale (0.908349826054221 0.908349826054221 0.908349826054221)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -17 -12)
"cameras/drone/drone1" SET Transform localScale (1.458527498940529 1.458527498940529 1.458527498940529)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.488058387440824 0)
"cameras" SET Transform eulerAngles (2.006407071311294 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0835723483785364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1745380170791713
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3734105653306834
"cameras/drone/drone0" SET Transform localPosition (0.6017254905710725 0.23458779025637405 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4218845429094362 0.8438638025129368 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 2 13)
"cameras/drone/drone0" SET Transform localScale (1.044218907347045 1.044218907347045 1.044218907347045)
"cameras/drone/drone1" SET Transform localEulerAngles (4 9 7)
"cameras/drone/drone1" SET Transform localScale (0.7114557898964018 0.7114557898964018 0.7114557898964018)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.206698514334996 0)
"cameras" SET Transform eulerAngles (10.066827871635695 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.379561778891715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.659555279994993
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.011277021159825385
"cameras/drone/drone0" SET Transform localPosition (0.24497325260051062 0.543805534073788 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8078332570389175 1.020332192005826 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 18 -5)
"cameras/drone/drone0" SET Transform localScale (1.2350941830678814 1.2350941830678814 1.2350941830678814)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -11 -1)
"cameras/drone/drone1" SET Transform localScale (1.0193228106926393 1.0193228106926393 1.0193228106926393)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.418829329679197 0)
"cameras" SET Transform eulerAngles (13.697114961417604 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2828010119259856
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8339664514020266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38342218053103017
"cameras/drone/drone0" SET Transform localPosition (-0.574579991711189 0.3399324218645771 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9473909587699556 1.1388297281820647 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 9 -10)
"cameras/drone/drone0" SET Transform localScale (1.1483172204860819 1.1483172204860819 1.1483172204860819)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 14 -10)
"cameras/drone/drone1" SET Transform localScale (1.3908358980654336 1.3908358980654336 1.3908358980654336)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.152513471106708 0)
"cameras" SET Transform eulerAngles (-2.764948571716374 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1185191080097319
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2018379719789285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08068569079050875
"cameras/drone/drone0" SET Transform localPosition (0.7066126306250087 -0.1704773096870567 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5473312862747657 1.262283531409028 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 8 2)
"cameras/drone/drone0" SET Transform localScale (0.7767330438177918 0.7767330438177918 0.7767330438177918)
"cameras/drone/drone1" SET Transform localEulerAngles (19 11 3)
"cameras/drone/drone1" SET Transform localScale (0.9243932809369293 0.9243932809369293 0.9243932809369293)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.21676456741377 0)
"cameras" SET Transform eulerAngles (6.157586216073771 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.133442657696474
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1774006231848224
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3294239648116221
"cameras/drone/drone0" SET Transform localPosition (-0.6716080359813535 0.46525480950931436 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5350961200866149 1.2555557273648417 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 20 3)
"cameras/drone/drone0" SET Transform localScale (1.0691193868984026 1.0691193868984026 1.0691193868984026)
"cameras/drone/drone1" SET Transform localEulerAngles (16 7 -1)
"cameras/drone/drone1" SET Transform localScale (1.2056824318345085 1.2056824318345085 1.2056824318345085)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.028987015446516 0)
"cameras" SET Transform eulerAngles (16.633795053953797 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.819656982155638
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.196250819481547
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3695915277951655
"cameras/drone/drone0" SET Transform localPosition (0.023334729801125276 0.39607720518242523 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7842837661663413 1.2073871739627042 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -14 18)
"cameras/drone/drone0" SET Transform localScale (1.2473489648854819 1.2473489648854819 1.2473489648854819)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -7 -10)
"cameras/drone/drone1" SET Transform localScale (0.8506198286128344 0.8506198286128344 0.8506198286128344)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2389794829490466 0)
"cameras" SET Transform eulerAngles (18.203948622617702 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3575556113125495
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3025483760303582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22948253630509982
"cameras/drone/drone0" SET Transform localPosition (-0.1559707540845856 0.1990757385820467 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3879414025880621 0.824568057585683 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -4 17)
"cameras/drone/drone0" SET Transform localScale (1.3936465096964201 1.3936465096964201 1.3936465096964201)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -5 5)
"cameras/drone/drone1" SET Transform localScale (1.2977589524714472 1.2977589524714472 1.2977589524714472)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.152294901615825 0)
"cameras" SET Transform eulerAngles (15.373950682752323 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7177018035891174
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.799278140668014
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06181913486299462
"cameras/drone/drone0" SET Transform localPosition (0.01017308784043447 0.40857337311285463 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2819036687546461 1.2277228430582163 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -6 5)
"cameras/drone/drone0" SET Transform localScale (1.302467121820027 1.302467121820027 1.302467121820027)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -2 -3)
"cameras/drone/drone1" SET Transform localScale (1.3729024690849676 1.3729024690849676 1.3729024690849676)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2590409359688355 0)
"cameras" SET Transform eulerAngles (-1.8988287441810137 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5382137098222842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9235238195318969
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39165740383274983
"cameras/drone/drone0" SET Transform localPosition (-0.5584853089492171 0.18286427543780376 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6426893037039396 1.1663649126372007 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -17 12)
"cameras/drone/drone0" SET Transform localScale (1.2088273105930987 1.2088273105930987 1.2088273105930987)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 12 12)
"cameras/drone/drone1" SET Transform localScale (1.4195298759917292 1.4195298759917292 1.4195298759917292)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4670175543149613 0)
"cameras" SET Transform eulerAngles (1.6764659188688498 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3452177386181663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.663334970824378
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17774623254780497
"cameras/drone/drone0" SET Transform localPosition (0.7282533610619317 0.4931059232879043 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6257791628946002 1.2240499195677066 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -9 20)
"cameras/drone/drone0" SET Transform localScale (1.2688022974483193 1.2688022974483193 1.2688022974483193)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -19 16)
"cameras/drone/drone1" SET Transform localScale (1.0163592101479422 1.0163592101479422 1.0163592101479422)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.086938452350355 0)
"cameras" SET Transform eulerAngles (8.411305068311002 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.380519295125391
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2051258939127065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10763203159852211
"cameras/drone/drone0" SET Transform localPosition (-0.9820953837963352 0.004874965541960152 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19469708655389173 1.2084541216329545 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -18 -19)
"cameras/drone/drone0" SET Transform localScale (0.9790560644078564 0.9790560644078564 0.9790560644078564)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -15 2)
"cameras/drone/drone1" SET Transform localScale (0.6179426323902477 0.6179426323902477 0.6179426323902477)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5181668262841344 0)
"cameras" SET Transform eulerAngles (-15.075215089029289 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6395352068800877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3298568231113654
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05710227362251428
"cameras/drone/drone0" SET Transform localPosition (-0.9288620431316195 0.23770943000729344 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.25126912295069403 1.0798851996800458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -4 -14)
"cameras/drone/drone0" SET Transform localScale (0.9384746232854981 0.9384746232854981 0.9384746232854981)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -9 8)
"cameras/drone/drone1" SET Transform localScale (0.9030599663656351 0.9030599663656351 0.9030599663656351)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.176033368562215 0)
"cameras" SET Transform eulerAngles (15.418923229562445 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2164642544742919
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3105908064386367
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025637329909252493
"cameras/drone/drone0" SET Transform localPosition (-0.5274645417154846 0.40737677571022074 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.362140811596005 1.1357106482813137 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -18 20)
"cameras/drone/drone0" SET Transform localScale (0.7570336909271321 0.7570336909271321 0.7570336909271321)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -19 -14)
"cameras/drone/drone1" SET Transform localScale (0.8666086989181526 0.8666086989181526 0.8666086989181526)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5773699915128487 0)
"cameras" SET Transform eulerAngles (18.396151480412854 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4748868416170908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6922702589822447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08796247075334339
"cameras/drone/drone0" SET Transform localPosition (0.05106142028662686 0.5290701116273251 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16034443359673678 1.1067513327308713 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -7 11)
"cameras/drone/drone0" SET Transform localScale (1.3501263387458586 1.3501263387458586 1.3501263387458586)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 16 -9)
"cameras/drone/drone1" SET Transform localScale (1.2859421978198866 1.2859421978198866 1.2859421978198866)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.507622317463602 0)
"cameras" SET Transform eulerAngles (17.568670791738924 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4172360579815209
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3231811265922133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01762377448146375
"cameras/drone/drone0" SET Transform localPosition (0.9117812358171233 0.13474990411600246 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.622890982994595 1.0180925317819116 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -6 1)
"cameras/drone/drone0" SET Transform localScale (1.4439960440688715 1.4439960440688715 1.4439960440688715)
"cameras/drone/drone1" SET Transform localEulerAngles (7 19 -12)
"cameras/drone/drone1" SET Transform localScale (0.7043332378101128 0.7043332378101128 0.7043332378101128)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.42831307027819 0)
"cameras" SET Transform eulerAngles (0.9629666740081113 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.096063483716909
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6545136586638607
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3945820750319287
"cameras/drone/drone0" SET Transform localPosition (1.1334612665417187 -0.1326010242015751 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20198131940359487 0.8650811568262795 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -15 -19)
"cameras/drone/drone0" SET Transform localScale (1.4544820988328582 1.4544820988328582 1.4544820988328582)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -18 -1)
"cameras/drone/drone1" SET Transform localScale (1.0402052817535064 1.0402052817535064 1.0402052817535064)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.840820363773053 0)
"cameras" SET Transform eulerAngles (-5.866306840738984 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8510344991976817
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5435702486857972
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30846402898966596
"cameras/drone/drone0" SET Transform localPosition (0.4967006948895438 -0.08623631398659087 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0306289830402335 1.2910812757143029 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -11 -11)
"cameras/drone/drone0" SET Transform localScale (1.447433791345782 1.447433791345782 1.447433791345782)
"cameras/drone/drone1" SET Transform localEulerAngles (5 1 -16)
"cameras/drone/drone1" SET Transform localScale (0.685309266910137 0.685309266910137 0.685309266910137)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.797128464880993 0)
"cameras" SET Transform eulerAngles (-16.513477652991526 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8849553148533786
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.086670142488631
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16123753641307592
"cameras/drone/drone0" SET Transform localPosition (-0.6144834093757036 0.16346188597379335 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0948904206144465 1.2425197172164233 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 20 -18)
"cameras/drone/drone0" SET Transform localScale (0.8544486509208993 0.8544486509208993 0.8544486509208993)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -18 -7)
"cameras/drone/drone1" SET Transform localScale (1.372910992453419 1.372910992453419 1.372910992453419)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.029245145624139 0)
"cameras" SET Transform eulerAngles (-18.413381495279502 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4495916283465301
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0222490239374167
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3136887975217437
"cameras/drone/drone0" SET Transform localPosition (0.7291395361449822 0.6140628630789375 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9560888090732511 1.1974311959243953 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 4 -6)
"cameras/drone/drone0" SET Transform localScale (1.3764906619523383 1.3764906619523383 1.3764906619523383)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 4 12)
"cameras/drone/drone1" SET Transform localScale (1.3086421631717817 1.3086421631717817 1.3086421631717817)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1881752368488248 0)
"cameras" SET Transform eulerAngles (14.83510230376855 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4265444147227201
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0619282226647588
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10119858003183474
"cameras/drone/drone0" SET Transform localPosition (1.1928704298035002 0.5267252528200976 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7828746132815512 1.2863915065806382 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -19 -14)
"cameras/drone/drone0" SET Transform localScale (1.3750646917261304 1.3750646917261304 1.3750646917261304)
"cameras/drone/drone1" SET Transform localEulerAngles (14 6 -16)
"cameras/drone/drone1" SET Transform localScale (1.1393689074388456 1.1393689074388456 1.1393689074388456)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.043688376199265 0)
"cameras" SET Transform eulerAngles (1.6860801596485508 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6799492077547485
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.916573209669048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04795763012098693
"cameras/drone/drone0" SET Transform localPosition (-0.517786315423848 0.5822415754530232 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6353238119669409 1.233246781277336 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 17 8)
"cameras/drone/drone0" SET Transform localScale (1.293771107285563 1.293771107285563 1.293771107285563)
"cameras/drone/drone1" SET Transform localEulerAngles (2 12 -1)
"cameras/drone/drone1" SET Transform localScale (0.7405127886476359 0.7405127886476359 0.7405127886476359)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9337456485603304 0)
"cameras" SET Transform eulerAngles (19.718914416791613 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3234434782805016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.81700201012602
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25227169096023305
"cameras/drone/drone0" SET Transform localPosition (-0.0976514425596251 -0.0576364190044138 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5054901381654191 1.0484015636586872 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 18 5)
"cameras/drone/drone0" SET Transform localScale (1.139409650826917 1.139409650826917 1.139409650826917)
"cameras/drone/drone1" SET Transform localEulerAngles (14 17 14)
"cameras/drone/drone1" SET Transform localScale (0.9497544443378709 0.9497544443378709 0.9497544443378709)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3827431569088313 0)
"cameras" SET Transform eulerAngles (-5.332817243419793 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4959871403059468
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8561181497909418
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3288196744185467
"cameras/drone/drone0" SET Transform localPosition (-0.08241676421091704 -0.2494687708382261 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.96018291112865 1.0814689769858479 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -6 6)
"cameras/drone/drone0" SET Transform localScale (1.1771363966586552 1.1771363966586552 1.1771363966586552)
"cameras/drone/drone1" SET Transform localEulerAngles (6 4 -20)
"cameras/drone/drone1" SET Transform localScale (0.6590837618350397 0.6590837618350397 0.6590837618350397)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.710219412634158 0)
"cameras" SET Transform eulerAngles (11.447334191208807 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1540244348225355
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.816276289207169
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09619145472953905
"cameras/drone/drone0" SET Transform localPosition (0.5063489045453733 0.4234256662239994 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5692956022733253 1.1587197841105503 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -6 -9)
"cameras/drone/drone0" SET Transform localScale (1.4229519640220847 1.4229519640220847 1.4229519640220847)
"cameras/drone/drone1" SET Transform localEulerAngles (10 10 -20)
"cameras/drone/drone1" SET Transform localScale (0.6965477920073948 0.6965477920073948 0.6965477920073948)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.958857300015422 0)
"cameras" SET Transform eulerAngles (0.6980232415786567 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.725311398839773
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.258495486196494
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14874405436357163
"cameras/drone/drone0" SET Transform localPosition (0.8986905007360606 0.031841904027389234 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8565231318494295 1.1099586318571648 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 2 -3)
"cameras/drone/drone0" SET Transform localScale (1.2875087016552111 1.2875087016552111 1.2875087016552111)
"cameras/drone/drone1" SET Transform localEulerAngles (11 18 -7)
"cameras/drone/drone1" SET Transform localScale (1.4878344090979292 1.4878344090979292 1.4878344090979292)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.538742679770875 0)
"cameras" SET Transform eulerAngles (4.964555059936025 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5322201144402503
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.791733703192124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.009267671850085969
"cameras/drone/drone0" SET Transform localPosition (0.013453698646685996 0.4187530096527105 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.36360915264781246 1.1855646706376588 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -1 -9)
"cameras/drone/drone0" SET Transform localScale (1.4243540598614635 1.4243540598614635 1.4243540598614635)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 8 -19)
"cameras/drone/drone1" SET Transform localScale (1.0758625924334804 1.0758625924334804 1.0758625924334804)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1937040566044717 0)
"cameras" SET Transform eulerAngles (16.772341411799594 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.464259654989597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9808505031223298
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15307403215120072
"cameras/drone/drone0" SET Transform localPosition (0.7394244026969898 0.26193358801310734 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7725341025152404 1.265836751078814 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -14 -16)
"cameras/drone/drone0" SET Transform localScale (0.9204698320021554 0.9204698320021554 0.9204698320021554)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -3 -1)
"cameras/drone/drone1" SET Transform localScale (1.1354141058213965 1.1354141058213965 1.1354141058213965)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.185532390778425 0)
"cameras" SET Transform eulerAngles (-15.975587950483856 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1816817273183595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7031963862673063
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09330095883149259
"cameras/drone/drone0" SET Transform localPosition (1.0798948173503804 0.3392869618613748 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28423829443443616 1.1440975842373406 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -19 -7)
"cameras/drone/drone0" SET Transform localScale (1.2421725593952764 1.2421725593952764 1.2421725593952764)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 18 -1)
"cameras/drone/drone1" SET Transform localScale (1.4961792888773986 1.4961792888773986 1.4961792888773986)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.844084714811162 0)
"cameras" SET Transform eulerAngles (14.337436215588475 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1446191555290244
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3063710887325108
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3132520000884482
"cameras/drone/drone0" SET Transform localPosition (-0.9879750172223055 -0.13515590760279367 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9775485636943796 1.237734538054463 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 4 -18)
"cameras/drone/drone0" SET Transform localScale (1.0083010640533003 1.0083010640533003 1.0083010640533003)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 6 -18)
"cameras/drone/drone1" SET Transform localScale (1.098819435072827 1.098819435072827 1.098819435072827)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.372319693191468 0)
"cameras" SET Transform eulerAngles (-0.4621540304377767 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5677223978555451
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.24715038991592
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35485865866605204
"cameras/drone/drone0" SET Transform localPosition (0.0007272925198142932 0.29401225107736134 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8463109064559338 1.2919655146595281 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 13 -2)
"cameras/drone/drone0" SET Transform localScale (0.9695021364984436 0.9695021364984436 0.9695021364984436)
"cameras/drone/drone1" SET Transform localEulerAngles (6 6 8)
"cameras/drone/drone1" SET Transform localScale (1.158982381019864 1.158982381019864 1.158982381019864)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.198042323425774 0)
"cameras" SET Transform eulerAngles (3.6228569620250823 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0449597904260282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.583077817673842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10605553027682896
"cameras/drone/drone0" SET Transform localPosition (0.9459001831574934 0.46316942443542614 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.15387764925843772 1.0843833753508294 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 9 14)
"cameras/drone/drone0" SET Transform localScale (1.4110679964565773 1.4110679964565773 1.4110679964565773)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 4 -18)
"cameras/drone/drone1" SET Transform localScale (0.9593230128185357 0.9593230128185357 0.9593230128185357)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.109446850976815 0)
"cameras" SET Transform eulerAngles (-10.577331116016824 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5459539258460198
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1500770455424485
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34690585123959944
"cameras/drone/drone0" SET Transform localPosition (-0.8176364469344568 0.26679898433091515 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.05311326471695432 1.062204261166895 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -12 -4)
"cameras/drone/drone0" SET Transform localScale (0.7820461211598159 0.7820461211598159 0.7820461211598159)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 3 -14)
"cameras/drone/drone1" SET Transform localScale (1.3159288582902067 1.3159288582902067 1.3159288582902067)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.529893549244072 0)
"cameras" SET Transform eulerAngles (0.9791420085493385 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5610746668551168
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7035693330511552
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3120954667284295
"cameras/drone/drone0" SET Transform localPosition (0.342978792529514 0.5612492720598392 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5025314223360967 1.198079672315463 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -9 13)
"cameras/drone/drone0" SET Transform localScale (0.6565018517016199 0.6565018517016199 0.6565018517016199)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 0 9)
"cameras/drone/drone1" SET Transform localScale (1.2876614658091512 1.2876614658091512 1.2876614658091512)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.498295000022148 0)
"cameras" SET Transform eulerAngles (2.0565148251872643 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8799999112408546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4249890631208364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07435659254785253
"cameras/drone/drone0" SET Transform localPosition (-0.9065582137186676 0.5043124984814047 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.07236227498060077 1.0726141479650275 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -15 17)
"cameras/drone/drone0" SET Transform localScale (1.1800586876284425 1.1800586876284425 1.1800586876284425)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -12 13)
"cameras/drone/drone1" SET Transform localScale (1.1522106745116742 1.1522106745116742 1.1522106745116742)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.550311692648744 0)
"cameras" SET Transform eulerAngles (-11.658115306625238 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7603558524878256
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.491102583271194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.012514201384780411
"cameras/drone/drone0" SET Transform localPosition (0.5535973015064954 0.6931512978805594 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.010201578850268955 1.0031052660377884 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -16 3)
"cameras/drone/drone0" SET Transform localScale (1.041980917287866 1.041980917287866 1.041980917287866)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -5 15)
"cameras/drone/drone1" SET Transform localScale (1.2761953703257496 1.2761953703257496 1.2761953703257496)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5451228290516195 0)
"cameras" SET Transform eulerAngles (-7.641049993372594 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6368974162391741
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9887622049869504
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.024171759452249964
"cameras/drone/drone0" SET Transform localPosition (-0.7199870417651064 0.3039862447713862 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.26221706334660755 0.9207810925452129 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -5 15)
"cameras/drone/drone0" SET Transform localScale (0.8995841385924273 0.8995841385924273 0.8995841385924273)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -2 13)
"cameras/drone/drone1" SET Transform localScale (1.3513443400701375 1.3513443400701375 1.3513443400701375)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.40149091381582 0)
"cameras" SET Transform eulerAngles (-16.007307405891268 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.294219911370666
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1393064900692327
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35745780504255026
"cameras/drone/drone0" SET Transform localPosition (0.8864166799228543 0.4278459378361648 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8360557408830858 1.1897346285533135 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 6 3)
"cameras/drone/drone0" SET Transform localScale (1.4355877050847232 1.4355877050847232 1.4355877050847232)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -6 -18)
"cameras/drone/drone1" SET Transform localScale (0.9570995520305597 0.9570995520305597 0.9570995520305597)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.653316697428789 0)
"cameras" SET Transform eulerAngles (11.255211775127322 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4576425473447006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8058768602137718
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04978312971098489
"cameras/drone/drone0" SET Transform localPosition (-0.3368797850053853 0.10310909177683508 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6198000876802454 1.2895430828480823 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 20 0)
"cameras/drone/drone0" SET Transform localScale (0.6281433387570612 0.6281433387570612 0.6281433387570612)
"cameras/drone/drone1" SET Transform localEulerAngles (16 10 -12)
"cameras/drone/drone1" SET Transform localScale (0.8262859768046198 0.8262859768046198 0.8262859768046198)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.305070045657889 0)
"cameras" SET Transform eulerAngles (-16.492308659991647 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5885722682206757
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1285940936605745
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2529626680476756
"cameras/drone/drone0" SET Transform localPosition (1.0768960288420792 0.1942801425955561 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8937014545970057 0.8771325945029613 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 10 4)
"cameras/drone/drone0" SET Transform localScale (1.2469546776659366 1.2469546776659366 1.2469546776659366)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -4 -5)
"cameras/drone/drone1" SET Transform localScale (0.6404949004810766 0.6404949004810766 0.6404949004810766)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.395398522066099 0)
"cameras" SET Transform eulerAngles (-9.72544058754405 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7896788202169369
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2884522223962982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29908616056692167
"cameras/drone/drone0" SET Transform localPosition (-0.9449275159485586 0.1774993591013853 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6796390625812648 0.943875947983463 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 8 -10)
"cameras/drone/drone0" SET Transform localScale (1.00360605160057 1.00360605160057 1.00360605160057)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -3 -5)
"cameras/drone/drone1" SET Transform localScale (1.4346352102456237 1.4346352102456237 1.4346352102456237)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0741608137146805 0)
"cameras" SET Transform eulerAngles (6.840858848068898 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1700469443665313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6456368510386987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19344948047926952
"cameras/drone/drone0" SET Transform localPosition (-0.005643255524289348 0.49746131426776513 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11615908958314902 0.8737127824765418 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 12 4)
"cameras/drone/drone0" SET Transform localScale (1.2907497098309342 1.2907497098309342 1.2907497098309342)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 10 16)
"cameras/drone/drone1" SET Transform localScale (0.86009699060155 0.86009699060155 0.86009699060155)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.876043358198778 0)
"cameras" SET Transform eulerAngles (7.998966191680417 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5610880429447302
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8078830287376806
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1330022810509607
"cameras/drone/drone0" SET Transform localPosition (-0.7611130993489688 0.14113300059123252 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4626721016910076 0.8190256093405732 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 5 -14)
"cameras/drone/drone0" SET Transform localScale (1.107464192250346 1.107464192250346 1.107464192250346)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -12 -20)
"cameras/drone/drone1" SET Transform localScale (1.2372043935584465 1.2372043935584465 1.2372043935584465)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.238333078035538 0)
"cameras" SET Transform eulerAngles (-16.666464312871415 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2850031286753707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6720882370293864
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36161322570751636
"cameras/drone/drone0" SET Transform localPosition (1.0430459209713436 0.3506926861111043 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7146045397795708 1.2111959423393428 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 14 -16)
"cameras/drone/drone0" SET Transform localScale (1.4887197212546788 1.4887197212546788 1.4887197212546788)
"cameras/drone/drone1" SET Transform localEulerAngles (7 5 -5)
"cameras/drone/drone1" SET Transform localScale (1.0541778861657352 1.0541778861657352 1.0541778861657352)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0301691539122135 0)
"cameras" SET Transform eulerAngles (-7.967869522807934 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9303124024342535
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.59836563331811
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16093969684115092
"cameras/drone/drone0" SET Transform localPosition (-0.6201415595369202 -0.07676696214993367 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2555076884517269 0.9735466928393123 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -18 2)
"cameras/drone/drone0" SET Transform localScale (0.7020314568316893 0.7020314568316893 0.7020314568316893)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -7 6)
"cameras/drone/drone1" SET Transform localScale (1.05689930960032 1.05689930960032 1.05689930960032)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.683385315835666 0)
"cameras" SET Transform eulerAngles (-10.335914815424413 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0546405305801194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6955576974321995
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34722787341375816
"cameras/drone/drone0" SET Transform localPosition (-0.26563594328523377 0.45512838543423 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8689196305933684 0.983478124895512 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 1 -2)
"cameras/drone/drone0" SET Transform localScale (0.9507761398259267 0.9507761398259267 0.9507761398259267)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -2 0)
"cameras/drone/drone1" SET Transform localScale (0.6057809987383328 0.6057809987383328 0.6057809987383328)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.905913961873371 0)
"cameras" SET Transform eulerAngles (-12.848235042748307 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.607449695790062
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9127291489828225
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33849887869947265
"cameras/drone/drone0" SET Transform localPosition (0.908385089446895 0.5708005185435383 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1348468506906657 1.1417001815154852 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -10 -2)
"cameras/drone/drone0" SET Transform localScale (1.2337736467007838 1.2337736467007838 1.2337736467007838)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -3 6)
"cameras/drone/drone1" SET Transform localScale (0.7655772547926666 0.7655772547926666 0.7655772547926666)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.409047175699729 0)
"cameras" SET Transform eulerAngles (-17.259940192127186 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.09255419227439
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0338887359094757
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0205180022806156
"cameras/drone/drone0" SET Transform localPosition (0.621631934478555 -0.027669292893778452 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.47585003966529493 1.286114059015978 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 3 12)
"cameras/drone/drone0" SET Transform localScale (1.4414608393944697 1.4414608393944697 1.4414608393944697)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 19 -1)
"cameras/drone/drone1" SET Transform localScale (0.7771663965191422 0.7771663965191422 0.7771663965191422)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.492732632800383 0)
"cameras" SET Transform eulerAngles (-18.569475896499227 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0122989445115682
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4257827622543227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11676108526214089
"cameras/drone/drone0" SET Transform localPosition (-0.3101954364499242 0.24185972153861074 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0858545164218836 1.2276317684964584 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 0 14)
"cameras/drone/drone0" SET Transform localScale (0.6435686875376089 0.6435686875376089 0.6435686875376089)
"cameras/drone/drone1" SET Transform localEulerAngles (13 18 12)
"cameras/drone/drone1" SET Transform localScale (1.0864332698219004 1.0864332698219004 1.0864332698219004)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.880070517801321 0)
"cameras" SET Transform eulerAngles (18.577060544660945 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8687520053995174
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7038535953357825
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11392902992420809
"cameras/drone/drone0" SET Transform localPosition (0.5776967579465182 0.41580398319775486 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.44480264888684273 0.8655307483809227 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 4 -6)
"cameras/drone/drone0" SET Transform localScale (0.9167889269527258 0.9167889269527258 0.9167889269527258)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 3 19)
"cameras/drone/drone1" SET Transform localScale (1.1399867174311407 1.1399867174311407 1.1399867174311407)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4822974943406955 0)
"cameras" SET Transform eulerAngles (7.105723193125009 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9227541961572452
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0287571045187285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3540840874367674
"cameras/drone/drone0" SET Transform localPosition (-0.9357435705178403 0.4521041916792578 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9559454757165834 1.0884076748261993 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -18 -13)
"cameras/drone/drone0" SET Transform localScale (0.8554143508871248 0.8554143508871248 0.8554143508871248)
"cameras/drone/drone1" SET Transform localEulerAngles (5 1 2)
"cameras/drone/drone1" SET Transform localScale (0.6077184042243495 0.6077184042243495 0.6077184042243495)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.928683244748935 0)
"cameras" SET Transform eulerAngles (15.255721688412997 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2684287650324841
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7055922910569108
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05597105396446063
"cameras/drone/drone0" SET Transform localPosition (0.27875524086086445 0.15870197512440437 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4390721297213207 0.9138665347885813 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -16 -2)
"cameras/drone/drone0" SET Transform localScale (0.6774921215230427 0.6774921215230427 0.6774921215230427)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 8 -11)
"cameras/drone/drone1" SET Transform localScale (0.854048868149371 0.854048868149371 0.854048868149371)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8859635373058667 0)
"cameras" SET Transform eulerAngles (-16.177544942294908 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4530494952501694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5922183081394854
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.007457849900891489
"cameras/drone/drone0" SET Transform localPosition (-1.006643923504323 0.06578296393342037 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.13028689060815069 0.9057133443722614 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 2 6)
"cameras/drone/drone0" SET Transform localScale (0.9201681858719148 0.9201681858719148 0.9201681858719148)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -4 -11)
"cameras/drone/drone1" SET Transform localScale (0.8990619940787512 0.8990619940787512 0.8990619940787512)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.106564525441392 0)
"cameras" SET Transform eulerAngles (-4.957265992561526 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5628464313490742
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.38855204407596
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04652911058465042
"cameras/drone/drone0" SET Transform localPosition (1.0249065987651098 -0.018495727508276716 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5005237954385229 1.1765843815027326 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -4 17)
"cameras/drone/drone0" SET Transform localScale (1.053137666665559 1.053137666665559 1.053137666665559)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -18 10)
"cameras/drone/drone1" SET Transform localScale (0.8879861150686376 0.8879861150686376 0.8879861150686376)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6130072092748335 0)
"cameras" SET Transform eulerAngles (-3.800893948438304 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4410026838495654
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6609505877520259
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31711055587728426
"cameras/drone/drone0" SET Transform localPosition (-0.7969779817444371 0.6246518143236204 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5791332615931456 1.1396456114949538 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -6 -16)
"cameras/drone/drone0" SET Transform localScale (0.7642421839544943 0.7642421839544943 0.7642421839544943)
"cameras/drone/drone1" SET Transform localEulerAngles (20 1 -13)
"cameras/drone/drone1" SET Transform localScale (1.1658715536132593 1.1658715536132593 1.1658715536132593)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2553962569458355 0)
"cameras" SET Transform eulerAngles (-5.94619207471986 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5436988989887328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6017194344083132
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20084248447250858
"cameras/drone/drone0" SET Transform localPosition (0.9611739318080554 0.09735634830474799 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5533468358225455 0.840162476184372 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -5 -13)
"cameras/drone/drone0" SET Transform localScale (1.189980154240671 1.189980154240671 1.189980154240671)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -10 -3)
"cameras/drone/drone1" SET Transform localScale (1.3174775233442735 1.3174775233442735 1.3174775233442735)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.123119010377394 0)
"cameras" SET Transform eulerAngles (-5.568917947358312 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5507001791055273
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2178344870391706
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05932758497706336
"cameras/drone/drone0" SET Transform localPosition (-0.7804125602862155 -0.17786917950522513 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.34794651023502343 1.0012715625213913 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -16 4)
"cameras/drone/drone0" SET Transform localScale (1.47777833345821 1.47777833345821 1.47777833345821)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 19 -10)
"cameras/drone/drone1" SET Transform localScale (0.6494714606783576 0.6494714606783576 0.6494714606783576)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.008747453728984 0)
"cameras" SET Transform eulerAngles (9.864709346486205 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4101467340264066
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2783085086956725
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17809797724631715
"cameras/drone/drone0" SET Transform localPosition (1.1174306836122663 0.5662620692303693 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5333279864425875 0.8845565701619008 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 18 -13)
"cameras/drone/drone0" SET Transform localScale (0.6411974109949073 0.6411974109949073 0.6411974109949073)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -6 0)
"cameras/drone/drone1" SET Transform localScale (1.2911848703365298 1.2911848703365298 1.2911848703365298)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.35577511653751 0)
"cameras" SET Transform eulerAngles (-1.9473591643594546 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.460841882665581
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0575724476897257
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3521014415663677
"cameras/drone/drone0" SET Transform localPosition (-0.7248363733962385 0.16941870021346844 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.25271451966582326 1.0234888720537958 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -20 -1)
"cameras/drone/drone0" SET Transform localScale (0.7378833840494168 0.7378833840494168 0.7378833840494168)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -16 9)
"cameras/drone/drone1" SET Transform localScale (1.4020430103655797 1.4020430103655797 1.4020430103655797)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.28036471562859 0)
"cameras" SET Transform eulerAngles (4.170315189423654 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1711214339953282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0769077000506653
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05536714010497606
"cameras/drone/drone0" SET Transform localPosition (-0.33709346509930105 0.686723862103136 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.28067728781041157 1.048011797468692 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -16 -7)
"cameras/drone/drone0" SET Transform localScale (1.0450078439330512 1.0450078439330512 1.0450078439330512)
"cameras/drone/drone1" SET Transform localEulerAngles (18 18 12)
"cameras/drone/drone1" SET Transform localScale (1.3247577554901082 1.3247577554901082 1.3247577554901082)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.523494150346857 0)
"cameras" SET Transform eulerAngles (-18.591019605005737 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9383084578996913
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4771466132524291
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3028104448611306
"cameras/drone/drone0" SET Transform localPosition (0.031554037266422696 0.4658534182507417 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9887597276012381 0.8562348203833965 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 15 10)
"cameras/drone/drone0" SET Transform localScale (1.1659868547395433 1.1659868547395433 1.1659868547395433)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -20 -12)
"cameras/drone/drone1" SET Transform localScale (0.7141471132798438 0.7141471132798438 0.7141471132798438)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.143487618332265 0)
"cameras" SET Transform eulerAngles (19.176978090023354 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5850088163254519
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.620307232848058
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2533799008140991
"cameras/drone/drone0" SET Transform localPosition (-0.8377176409314602 -0.26764706874791305 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6010990527342374 1.215747472549487 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -3 -19)
"cameras/drone/drone0" SET Transform localScale (1.1476963600029528 1.1476963600029528 1.1476963600029528)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -13 10)
"cameras/drone/drone1" SET Transform localScale (0.6049861177891451 0.6049861177891451 0.6049861177891451)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.217653395130898 0)
"cameras" SET Transform eulerAngles (-9.199451300400575 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47452596962934257
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9379208597720043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2344843996211902
"cameras/drone/drone0" SET Transform localPosition (-0.9400620175272492 0.0075175895647141 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2634024252148057 0.960931702188518 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -18 14)
"cameras/drone/drone0" SET Transform localScale (0.8277480195764052 0.8277480195764052 0.8277480195764052)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -5 -12)
"cameras/drone/drone1" SET Transform localScale (0.7466719244807031 0.7466719244807031 0.7466719244807031)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.279253182513488 0)
"cameras" SET Transform eulerAngles (-15.795002426586002 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46425570448235204
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.078492540769668
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1509717246639226
"cameras/drone/drone0" SET Transform localPosition (-0.9399434898683305 -0.24247211302345445 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7712311439158734 0.909909738646657 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -4 -18)
"cameras/drone/drone0" SET Transform localScale (1.1178568841339687 1.1178568841339687 1.1178568841339687)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -15 -17)
"cameras/drone/drone1" SET Transform localScale (1.4962836418495291 1.4962836418495291 1.4962836418495291)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0060943328196394 0)
"cameras" SET Transform eulerAngles (16.83877093904983 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3580916806026502
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7167649282001436
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2809941363776977
"cameras/drone/drone0" SET Transform localPosition (0.7408526133984028 0.03344190590630186 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12494426806303038 1.01431474821505 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -3 -9)
"cameras/drone/drone0" SET Transform localScale (1.3450235962463881 1.3450235962463881 1.3450235962463881)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -15 5)
"cameras/drone/drone1" SET Transform localScale (1.4152341082964521 1.4152341082964521 1.4152341082964521)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6928365431078647 0)
"cameras" SET Transform eulerAngles (17.292494716065022 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9319582083414826
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.300776163870469
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2020892257878412
"cameras/drone/drone0" SET Transform localPosition (0.252309595363285 -0.030696533936761694 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18562721522741543 0.9591230111240998 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -11 -7)
"cameras/drone/drone0" SET Transform localScale (0.774744239670049 0.774744239670049 0.774744239670049)
"cameras/drone/drone1" SET Transform localEulerAngles (12 2 13)
"cameras/drone/drone1" SET Transform localScale (0.6934457706133655 0.6934457706133655 0.6934457706133655)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.405720687302102 0)
"cameras" SET Transform eulerAngles (-17.105091924719297 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5550656386300746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1111713538523302
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09620333218756275
"cameras/drone/drone0" SET Transform localPosition (-0.7088154407120564 0.4491619665564968 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0202567807840361 0.8020980858842987 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 13 13)
"cameras/drone/drone0" SET Transform localScale (0.8517129545046646 0.8517129545046646 0.8517129545046646)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -4 -14)
"cameras/drone/drone1" SET Transform localScale (1.3476986897629468 1.3476986897629468 1.3476986897629468)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.575840455254613 0)
"cameras" SET Transform eulerAngles (-15.188013272982683 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9436639452815326
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3192684150354606
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10443750912502776
"cameras/drone/drone0" SET Transform localPosition (-0.9237352881770502 0.6487430738801023 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.11725817133628014 1.1182468620187267 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -10 -19)
"cameras/drone/drone0" SET Transform localScale (1.2625381731738488 1.2625381731738488 1.2625381731738488)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -10 3)
"cameras/drone/drone1" SET Transform localScale (1.4933071245148186 1.4933071245148186 1.4933071245148186)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.762269366599372 0)
"cameras" SET Transform eulerAngles (-1.2454429961146332 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5660905765915705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.307907287394218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22650919378851958
"cameras/drone/drone0" SET Transform localPosition (0.6548130945936832 -0.010372681285630014 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0474502304672038 0.8675715155547821 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 0 10)
"cameras/drone/drone0" SET Transform localScale (0.8310461008077304 0.8310461008077304 0.8310461008077304)
"cameras/drone/drone1" SET Transform localEulerAngles (19 0 -15)
"cameras/drone/drone1" SET Transform localScale (0.7962808937438571 0.7962808937438571 0.7962808937438571)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.737716749145893 0)
"cameras" SET Transform eulerAngles (16.696359282377912 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9602862821526358
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.775475936194609
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13170973933542066
"cameras/drone/drone0" SET Transform localPosition (-0.933747870420991 0.48875829206936666 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.331273479133706 1.1640792025789661 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -20 6)
"cameras/drone/drone0" SET Transform localScale (1.0651471638939487 1.0651471638939487 1.0651471638939487)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 14 -6)
"cameras/drone/drone1" SET Transform localScale (0.7198191727341382 0.7198191727341382 0.7198191727341382)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2296195256614553 0)
"cameras" SET Transform eulerAngles (15.75401623302676 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5909802629608905
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7030625786465343
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3749504799600408
"cameras/drone/drone0" SET Transform localPosition (0.5971309354693652 0.09543077806897088 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.46957068940921354 0.899772250231641 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 14 1)
"cameras/drone/drone0" SET Transform localScale (1.2719063639802957 1.2719063639802957 1.2719063639802957)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -5 9)
"cameras/drone/drone1" SET Transform localScale (0.8768939309163807 0.8768939309163807 0.8768939309163807)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.781829301963255 0)
"cameras" SET Transform eulerAngles (-1.9542816650041814 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6157389279566456
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9112403984025184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.006404160441604701
"cameras/drone/drone0" SET Transform localPosition (0.006139387866465951 0.442083445044484 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.35654255563162207 1.2403559293833526 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -13 11)
"cameras/drone/drone0" SET Transform localScale (1.1506145206375433 1.1506145206375433 1.1506145206375433)
"cameras/drone/drone1" SET Transform localEulerAngles (2 18 12)
"cameras/drone/drone1" SET Transform localScale (1.0790774286558897 1.0790774286558897 1.0790774286558897)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5470114626274487 0)
"cameras" SET Transform eulerAngles (7.1239321198149455 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6353176883051487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3746644484921615
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3642818142466788
"cameras/drone/drone0" SET Transform localPosition (0.3500118546182034 0.48903449870810806 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0691129623792996 1.0202682861561168 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 2 -14)
"cameras/drone/drone0" SET Transform localScale (0.8717760361342806 0.8717760361342806 0.8717760361342806)
"cameras/drone/drone1" SET Transform localEulerAngles (6 5 -16)
"cameras/drone/drone1" SET Transform localScale (1.2168734405551431 1.2168734405551431 1.2168734405551431)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.591799398328712 0)
"cameras" SET Transform eulerAngles (4.586043634118319 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9450406785539429
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0496191740479506
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1332069367824802
"cameras/drone/drone0" SET Transform localPosition (0.09358792870656085 0.3004831646032698 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9261408335632394 1.2805273046872512 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -19 -2)
"cameras/drone/drone0" SET Transform localScale (1.2949343590930598 1.2949343590930598 1.2949343590930598)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 9 11)
"cameras/drone/drone1" SET Transform localScale (0.6780010102703719 0.6780010102703719 0.6780010102703719)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.716929607688659 0)
"cameras" SET Transform eulerAngles (-3.6039770460625 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1574672009747888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.820853206059511
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17033648026778409
"cameras/drone/drone0" SET Transform localPosition (-0.1590499733004611 0.2611559714927148 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9499761523069579 0.8052702979120638 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 19 13)
"cameras/drone/drone0" SET Transform localScale (1.4369479770287263 1.4369479770287263 1.4369479770287263)
"cameras/drone/drone1" SET Transform localEulerAngles (20 14 3)
"cameras/drone/drone1" SET Transform localScale (1.2402435148807305 1.2402435148807305 1.2402435148807305)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.581258048121937 0)
"cameras" SET Transform eulerAngles (9.453909054204953 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.41935145282069
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4832215780872018
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3115786586077084
"cameras/drone/drone0" SET Transform localPosition (-0.6561001191925071 0.1378873487647701 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.530335213963153 0.855104893664324 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -14 -13)
"cameras/drone/drone0" SET Transform localScale (0.8554235526371374 0.8554235526371374 0.8554235526371374)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -5 -15)
"cameras/drone/drone1" SET Transform localScale (0.6998966209422748 0.6998966209422748 0.6998966209422748)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.964434830118335 0)
"cameras" SET Transform eulerAngles (13.741393391355878 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0968581407759368
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.631547920055104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37773153784653174
"cameras/drone/drone0" SET Transform localPosition (-0.42598846930239465 0.00703294020828199 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6825210906227046 1.2824930482011283 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 4 -7)
"cameras/drone/drone0" SET Transform localScale (0.9962879754923987 0.9962879754923987 0.9962879754923987)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 14 -10)
"cameras/drone/drone1" SET Transform localScale (0.9274531500621475 0.9274531500621475 0.9274531500621475)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7300500534490624 0)
"cameras" SET Transform eulerAngles (-14.652163204638345 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.388680641846903
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7662285042437715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07937938312141997
"cameras/drone/drone0" SET Transform localPosition (0.14317043511938055 -0.22576489569169106 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.43710589270637557 0.8787514742973974 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 8 3)
"cameras/drone/drone0" SET Transform localScale (1.1122735945783933 1.1122735945783933 1.1122735945783933)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -10 1)
"cameras/drone/drone1" SET Transform localScale (1.431031471849916 1.431031471849916 1.431031471849916)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8364021019440475 0)
"cameras" SET Transform eulerAngles (-3.5929607865269517 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7413158912037392
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9295890802028532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3979451137116633
"cameras/drone/drone0" SET Transform localPosition (1.0032614315384085 -0.14654781435901792 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.50130757004892 1.0318681081032994 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 16 14)
"cameras/drone/drone0" SET Transform localScale (1.4543401889954932 1.4543401889954932 1.4543401889954932)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 2 11)
"cameras/drone/drone1" SET Transform localScale (1.0585412188995849 1.0585412188995849 1.0585412188995849)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.276466990777615 0)
"cameras" SET Transform eulerAngles (-3.639168926573774 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6087211574639072
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6820501633903422
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10164038804698149
"cameras/drone/drone0" SET Transform localPosition (-0.8885705385009428 0.48982544160210023 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8554191741386179 1.253041907639366 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 18 18)
"cameras/drone/drone0" SET Transform localScale (0.8162591184945431 0.8162591184945431 0.8162591184945431)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -2 -3)
"cameras/drone/drone1" SET Transform localScale (0.6151903277899916 0.6151903277899916 0.6151903277899916)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1927640380198934 0)
"cameras" SET Transform eulerAngles (17.77493221260673 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4793324159902204
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9149499304081167
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2879837131793767
"cameras/drone/drone0" SET Transform localPosition (-0.4649350057649514 0.6750248043156708 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4847146172845249 0.9202161147499774 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -6 -2)
"cameras/drone/drone0" SET Transform localScale (1.1498362835485567 1.1498362835485567 1.1498362835485567)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 2 2)
"cameras/drone/drone1" SET Transform localScale (1.3422866481839777 1.3422866481839777 1.3422866481839777)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.504680846223416 0)
"cameras" SET Transform eulerAngles (0.27827175216452105 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7602070158598053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1167671322293782
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11481581097659843
"cameras/drone/drone0" SET Transform localPosition (-0.5422611954215909 -0.22635867766283851 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5812066993476424 1.0866034583862054 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -9 -14)
"cameras/drone/drone0" SET Transform localScale (1.0371738622465698 1.0371738622465698 1.0371738622465698)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -5 -15)
"cameras/drone/drone1" SET Transform localScale (0.8726516694651246 0.8726516694651246 0.8726516694651246)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.999239712164734 0)
"cameras" SET Transform eulerAngles (13.00674801258571 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.53865875182548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.99396200309122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15824712878879954
"cameras/drone/drone0" SET Transform localPosition (0.33511454490385706 -0.24767739075175949 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9342035118634582 0.886293715822517 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -14 -1)
"cameras/drone/drone0" SET Transform localScale (1.0839281695209761 1.0839281695209761 1.0839281695209761)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 15 10)
"cameras/drone/drone1" SET Transform localScale (1.3680893174504307 1.3680893174504307 1.3680893174504307)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4754717163071867 0)
"cameras" SET Transform eulerAngles (-16.180664175210072 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.057973892143735
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1091174925295344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21535153787770717
"cameras/drone/drone0" SET Transform localPosition (0.7008390884105438 0.49745731924445574 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20189684256510265 1.127803361202693 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -2 12)
"cameras/drone/drone0" SET Transform localScale (0.8388416525505293 0.8388416525505293 0.8388416525505293)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -10 14)
"cameras/drone/drone1" SET Transform localScale (0.641018175907278 0.641018175907278 0.641018175907278)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
