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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 24 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 47 collisionCheck true stickToGround false 
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
"cameras" SET Transform eulerAngles (-15.10634456836125 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 93
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.950795555989281 0)
"cameras" SET Transform eulerAngles (-3.974172693072923 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4124982074175636
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.96498148694377
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24498912781683846
"cameras/drone/drone0" SET Transform localPosition (-0.1240127918583167 0.015954022261658152 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0959686105747959 1.0341524713135444 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 19 1)
"cameras/drone/drone0" SET Transform localScale (0.9551905364413041 0.9551905364413041 0.9551905364413041)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -1 4)
"cameras/drone/drone1" SET Transform localScale (1.4300471855552972 1.4300471855552972 1.4300471855552972)
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
"cameras" SET Transform position (0 4.745362837914854 0)
"cameras" SET Transform eulerAngles (-4.990238732358661 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1514745512561133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1875611977924354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3015078977115439
"cameras/drone/drone0" SET Transform localPosition (-1.087650550627839 -0.09279723597779982 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4348680280091073 0.8668657459556685 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -7 6)
"cameras/drone/drone0" SET Transform localScale (0.8831252807743795 0.8831252807743795 0.8831252807743795)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 15 13)
"cameras/drone/drone1" SET Transform localScale (0.8900152134660708 0.8900152134660708 0.8900152134660708)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.779487983552492 0)
"cameras" SET Transform eulerAngles (15.921348017727802 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3244739713047218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6566891141105837
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.013239478335484379
"cameras/drone/drone0" SET Transform localPosition (-1.0589678177933204 0.5942350766882192 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7613124873685084 1.0012720637867192 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -9 2)
"cameras/drone/drone0" SET Transform localScale (1.3563840774293119 1.3563840774293119 1.3563840774293119)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -17 15)
"cameras/drone/drone1" SET Transform localScale (0.9422980644440353 0.9422980644440353 0.9422980644440353)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2050257376266287 0)
"cameras" SET Transform eulerAngles (15.585753985740233 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5659654048106497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8638779747049439
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22912160342165244
"cameras/drone/drone0" SET Transform localPosition (-0.4405456378109667 0.37506242852939903 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.144991701037065 1.1902551542500373 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 15 12)
"cameras/drone/drone0" SET Transform localScale (0.827892612618016 0.827892612618016 0.827892612618016)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -3 0)
"cameras/drone/drone1" SET Transform localScale (1.0224004375772455 1.0224004375772455 1.0224004375772455)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.992689924316944 0)
"cameras" SET Transform eulerAngles (2.2457579333572433 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.780111493947469
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6232891417477846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03157360019772084
"cameras/drone/drone0" SET Transform localPosition (-0.7462509469849246 0.4359658093897583 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9638095913143003 1.2267694491194454 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 14 -1)
"cameras/drone/drone0" SET Transform localScale (0.8996502185371287 0.8996502185371287 0.8996502185371287)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 4 -12)
"cameras/drone/drone1" SET Transform localScale (1.2018987525533364 1.2018987525533364 1.2018987525533364)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6270671712977514 0)
"cameras" SET Transform eulerAngles (13.044256852947747 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.585368468823174
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3543370574418914
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12810993616166932
"cameras/drone/drone0" SET Transform localPosition (-1.088634506595996 -0.28369805715381974 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5119160686064173 0.9965561559846466 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -13 -15)
"cameras/drone/drone0" SET Transform localScale (1.371097347684298 1.371097347684298 1.371097347684298)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -7 -13)
"cameras/drone/drone1" SET Transform localScale (0.6676991884950297 0.6676991884950297 0.6676991884950297)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.664302274590682 0)
"cameras" SET Transform eulerAngles (-2.8285067070569347 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.752825570787927
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6840662443137075
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.017635953427034414
"cameras/drone/drone0" SET Transform localPosition (-0.21093475190112165 0.3647900697887731 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3772627084583031 1.017699581316189 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -16 8)
"cameras/drone/drone0" SET Transform localScale (1.2050243490241692 1.2050243490241692 1.2050243490241692)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -9 -5)
"cameras/drone/drone1" SET Transform localScale (1.3903712196923776 1.3903712196923776 1.3903712196923776)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.857810445541013 0)
"cameras" SET Transform eulerAngles (5.256553837385518 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5178238549271983
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0713743374313411
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06932066121522742
"cameras/drone/drone0" SET Transform localPosition (-0.15302375449664707 0.5661572093892508 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9105376597253516 1.2616481513316307 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 17 11)
"cameras/drone/drone0" SET Transform localScale (1.489257933141751 1.489257933141751 1.489257933141751)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 14 -20)
"cameras/drone/drone1" SET Transform localScale (0.6555354088337744 0.6555354088337744 0.6555354088337744)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.781554762315297 0)
"cameras" SET Transform eulerAngles (18.682350525980162 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.99248481995839
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3603052632326067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11979040203981538
"cameras/drone/drone0" SET Transform localPosition (-0.8463297313516265 -0.11339594968886663 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1209050279446575 1.1018572223231535 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -17 10)
"cameras/drone/drone0" SET Transform localScale (1.1705231428820908 1.1705231428820908 1.1705231428820908)
"cameras/drone/drone1" SET Transform localEulerAngles (18 5 -2)
"cameras/drone/drone1" SET Transform localScale (1.147488370501575 1.147488370501575 1.147488370501575)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9191085042939884 0)
"cameras" SET Transform eulerAngles (-7.96236070906132 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9006700715422291
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8929080188970886
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20629768992521128
"cameras/drone/drone0" SET Transform localPosition (-0.6806564171510145 0.562275883951149 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9791526622499549 1.2227812634440154 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -16 -4)
"cameras/drone/drone0" SET Transform localScale (0.7433784043780229 0.7433784043780229 0.7433784043780229)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -12 9)
"cameras/drone/drone1" SET Transform localScale (1.0339260106999522 1.0339260106999522 1.0339260106999522)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.650579947118283 0)
"cameras" SET Transform eulerAngles (-5.090881972614092 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5259525576348183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2186487675135176
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26262014793423716
"cameras/drone/drone0" SET Transform localPosition (-0.9431249656071208 -0.06600343110322965 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5041658230919754 1.053606967674861 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -3 -14)
"cameras/drone/drone0" SET Transform localScale (0.641019879153855 0.641019879153855 0.641019879153855)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -19 -19)
"cameras/drone/drone1" SET Transform localScale (1.1669576295276038 1.1669576295276038 1.1669576295276038)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.006175453485492 0)
"cameras" SET Transform eulerAngles (-3.5876656079116387 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5401037132311529
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.00791922942835
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1637990685375252
"cameras/drone/drone0" SET Transform localPosition (-0.5418475725093087 0.413139111239132 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1558332564804845 1.2755126697142156 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -10 -19)
"cameras/drone/drone0" SET Transform localScale (1.1988283141520553 1.1988283141520553 1.1988283141520553)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 5 4)
"cameras/drone/drone1" SET Transform localScale (1.3278995947553707 1.3278995947553707 1.3278995947553707)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.500823936691626 0)
"cameras" SET Transform eulerAngles (-9.001453021477527 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0992537842245649
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7402578910379018
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2301212090962339
"cameras/drone/drone0" SET Transform localPosition (-0.8922980874810069 0.26226569091769575 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2722166408970721 1.1920907638846836 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 3 -9)
"cameras/drone/drone0" SET Transform localScale (1.2965486257485277 1.2965486257485277 1.2965486257485277)
"cameras/drone/drone1" SET Transform localEulerAngles (10 10 -12)
"cameras/drone/drone1" SET Transform localScale (1.0058687706628966 1.0058687706628966 1.0058687706628966)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.075265090195699 0)
"cameras" SET Transform eulerAngles (9.679241712171493 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0526371338314164
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.260828807636386
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11647388957118032
"cameras/drone/drone0" SET Transform localPosition (-0.4345354004658688 -0.10147811621734065 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2311279752132127 1.1205229545481379 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -3 -17)
"cameras/drone/drone0" SET Transform localScale (0.9748402011213726 0.9748402011213726 0.9748402011213726)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -17 -16)
"cameras/drone/drone1" SET Transform localScale (0.8016377702112288 0.8016377702112288 0.8016377702112288)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.403366098694084 0)
"cameras" SET Transform eulerAngles (-19.283032980460465 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9882697903726763
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.298410894435757
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3604327818158978
"cameras/drone/drone0" SET Transform localPosition (-0.63558117925604 -0.2988971865111127 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.073901494660499 1.2307960960214592 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -1 5)
"cameras/drone/drone0" SET Transform localScale (1.3724229728517432 1.3724229728517432 1.3724229728517432)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -6 -19)
"cameras/drone/drone1" SET Transform localScale (1.1632328344294252 1.1632328344294252 1.1632328344294252)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7636107342070915 0)
"cameras" SET Transform eulerAngles (-10.03391083099405 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5799901809947673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.858019275208477
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11853447736251575
"cameras/drone/drone0" SET Transform localPosition (0.6619650725510857 0.3765844147115683 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.30492715160696937 1.2260035835155942 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -4 1)
"cameras/drone/drone0" SET Transform localScale (0.7336882099303431 0.7336882099303431 0.7336882099303431)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 13 18)
"cameras/drone/drone1" SET Transform localScale (1.3160578292035738 1.3160578292035738 1.3160578292035738)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5934185075636957 0)
"cameras" SET Transform eulerAngles (-18.15472993590967 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3779002409965053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1551972890143336
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06461095006494322
"cameras/drone/drone0" SET Transform localPosition (0.39622880429290586 0.6094344242532332 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1957687148260099 1.1828513851601237 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 13 0)
"cameras/drone/drone0" SET Transform localScale (0.6317712121722342 0.6317712121722342 0.6317712121722342)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 3 -4)
"cameras/drone/drone1" SET Transform localScale (0.663515093682133 0.663515093682133 0.663515093682133)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.811448707246969 0)
"cameras" SET Transform eulerAngles (15.854313217798826 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5602083307588912
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3078613603845752
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1504711796971655
"cameras/drone/drone0" SET Transform localPosition (-0.7126556290148751 0.45188205294874634 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.33513926788543047 1.2117290618641057 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 1 0)
"cameras/drone/drone0" SET Transform localScale (1.2308840740947606 1.2308840740947606 1.2308840740947606)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -5 -3)
"cameras/drone/drone1" SET Transform localScale (1.0852439266145961 1.0852439266145961 1.0852439266145961)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.553443585976213 0)
"cameras" SET Transform eulerAngles (-4.609632201114632 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5562098826533597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5289711620634763
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16914873329789556
"cameras/drone/drone0" SET Transform localPosition (-0.6280036950517692 0.28212164978046644 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1988849446104235 1.291141404622374 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -4 -12)
"cameras/drone/drone0" SET Transform localScale (0.6314007433546563 0.6314007433546563 0.6314007433546563)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -9 -9)
"cameras/drone/drone1" SET Transform localScale (1.476175480592738 1.476175480592738 1.476175480592738)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.129496126828004 0)
"cameras" SET Transform eulerAngles (6.537934895021266 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.455505202547899
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2672477001953926
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37971335167206893
"cameras/drone/drone0" SET Transform localPosition (-0.1408431391058118 0.6697713725958918 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.10226807932443105 0.8279721989264542 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 15 -19)
"cameras/drone/drone0" SET Transform localScale (1.1747854433811635 1.1747854433811635 1.1747854433811635)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -19 -13)
"cameras/drone/drone1" SET Transform localScale (1.4893124453880038 1.4893124453880038 1.4893124453880038)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.999083489025071 0)
"cameras" SET Transform eulerAngles (-11.683704161010727 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7875753376750134
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6287610564344424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16037957754126944
"cameras/drone/drone0" SET Transform localPosition (-0.32283184860492575 0.49357656326425986 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1826395971536698 1.1473054577457114 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 3 -8)
"cameras/drone/drone0" SET Transform localScale (0.8140153865239149 0.8140153865239149 0.8140153865239149)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -10 -1)
"cameras/drone/drone1" SET Transform localScale (0.7665721571231067 0.7665721571231067 0.7665721571231067)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7923856411506325 0)
"cameras" SET Transform eulerAngles (-5.6851234422795205 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5918398303331496
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6452447160975043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3218349705217159
"cameras/drone/drone0" SET Transform localPosition (-0.7862503409805641 0.2531598507227845 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1859701264191969 0.8576437351606242 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 20 1)
"cameras/drone/drone0" SET Transform localScale (1.371973668213725 1.371973668213725 1.371973668213725)
"cameras/drone/drone1" SET Transform localEulerAngles (15 1 -8)
"cameras/drone/drone1" SET Transform localScale (1.4005652881960036 1.4005652881960036 1.4005652881960036)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.670819562526498 0)
"cameras" SET Transform eulerAngles (-6.221596455389658 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8574326771401006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4543709598320098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25280318640442856
"cameras/drone/drone0" SET Transform localPosition (0.8993790934230856 -0.024610704592840704 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6736909479781981 1.2395176754181385 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 12 8)
"cameras/drone/drone0" SET Transform localScale (1.3541305376270598 1.3541305376270598 1.3541305376270598)
"cameras/drone/drone1" SET Transform localEulerAngles (6 7 7)
"cameras/drone/drone1" SET Transform localScale (1.1867587319112096 1.1867587319112096 1.1867587319112096)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.642602572381266 0)
"cameras" SET Transform eulerAngles (-12.655087836455486 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1763724922245637
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3467401338697862
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19331383298667282
"cameras/drone/drone0" SET Transform localPosition (0.26549783574758234 0.034171221058662715 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.028045967149049833 1.0752893824822962 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 12 14)
"cameras/drone/drone0" SET Transform localScale (0.6327113568093631 0.6327113568093631 0.6327113568093631)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 16 -7)
"cameras/drone/drone1" SET Transform localScale (1.1002916992998524 1.1002916992998524 1.1002916992998524)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7611836166733728 0)
"cameras" SET Transform eulerAngles (4.0081425305358955 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.391758310570748
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.113130194580454
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.009329733888350589
"cameras/drone/drone0" SET Transform localPosition (0.03163318639527013 0.553513247531112 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2573461742434613 1.2247476467620193 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -4 5)
"cameras/drone/drone0" SET Transform localScale (1.3365678794122815 1.3365678794122815 1.3365678794122815)
"cameras/drone/drone1" SET Transform localEulerAngles (18 16 16)
"cameras/drone/drone1" SET Transform localScale (1.306164120387971 1.306164120387971 1.306164120387971)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.147786009020158 0)
"cameras" SET Transform eulerAngles (-5.489316990288806 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5478756574013128
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6293677383573661
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.055044890353814505
"cameras/drone/drone0" SET Transform localPosition (-0.9381693262847922 0.5430592601450199 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6562630660741634 0.9131481627247777 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -9 1)
"cameras/drone/drone0" SET Transform localScale (1.4259130985157704 1.4259130985157704 1.4259130985157704)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -2 -3)
"cameras/drone/drone1" SET Transform localScale (0.9290854972060782 0.9290854972060782 0.9290854972060782)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9054874610149612 0)
"cameras" SET Transform eulerAngles (11.591209050488843 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3428852258071
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7058987487670163
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23349008089056547
"cameras/drone/drone0" SET Transform localPosition (-1.0372965504651728 0.548309824950939 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3570178588448486 1.01014492173134 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -8 14)
"cameras/drone/drone0" SET Transform localScale (0.7501609301462764 0.7501609301462764 0.7501609301462764)
"cameras/drone/drone1" SET Transform localEulerAngles (13 11 -12)
"cameras/drone/drone1" SET Transform localScale (1.013013469458119 1.013013469458119 1.013013469458119)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.318264469717939 0)
"cameras" SET Transform eulerAngles (-4.88955047755416 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4765716820619739
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9676979409253492
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03996396593248282
"cameras/drone/drone0" SET Transform localPosition (-1.145265535542825 -0.261399255929836 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7451158705766552 1.127339154109646 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 12 -9)
"cameras/drone/drone0" SET Transform localScale (1.415576018942731 1.415576018942731 1.415576018942731)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -8 -11)
"cameras/drone/drone1" SET Transform localScale (0.7926715454826675 0.7926715454826675 0.7926715454826675)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8200936730107546 0)
"cameras" SET Transform eulerAngles (-17.962128980917228 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1084083039084778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2907374041759971
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23016316022252448
"cameras/drone/drone0" SET Transform localPosition (-1.1150689369985456 0.6226630380506954 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.245117625940666 0.8845730162742278 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -20 5)
"cameras/drone/drone0" SET Transform localScale (1.319514322240003 1.319514322240003 1.319514322240003)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -13 -17)
"cameras/drone/drone1" SET Transform localScale (0.7754266165839373 0.7754266165839373 0.7754266165839373)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2998828413070305 0)
"cameras" SET Transform eulerAngles (-10.929591984514158 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1498006993863406
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2164484704088039
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20637259153367019
"cameras/drone/drone0" SET Transform localPosition (-0.5702572178370183 0.36081898575187993 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2220379955901839 1.1169171192944385 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -19 -17)
"cameras/drone/drone0" SET Transform localScale (1.2970016147469265 1.2970016147469265 1.2970016147469265)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -4 4)
"cameras/drone/drone1" SET Transform localScale (0.802172854195412 0.802172854195412 0.802172854195412)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0989348443342513 0)
"cameras" SET Transform eulerAngles (-7.268347189435595 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.214320945068783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9492336410544144
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3976581312406835
"cameras/drone/drone0" SET Transform localPosition (0.5317899521517921 0.24405994200943243 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3452277161123787 0.861692992400033 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 15 1)
"cameras/drone/drone0" SET Transform localScale (1.4407766048298183 1.4407766048298183 1.4407766048298183)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -5 -5)
"cameras/drone/drone1" SET Transform localScale (0.7155612428555959 0.7155612428555959 0.7155612428555959)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.085208505611619 0)
"cameras" SET Transform eulerAngles (4.962876340080889 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4979748904334245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1021019262338025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1918017852507029
"cameras/drone/drone0" SET Transform localPosition (-0.16471011401696867 0.5777328161498496 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8231552824552544 0.8801511407524693 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -11 -9)
"cameras/drone/drone0" SET Transform localScale (0.784904771008882 0.784904771008882 0.784904771008882)
"cameras/drone/drone1" SET Transform localEulerAngles (15 19 5)
"cameras/drone/drone1" SET Transform localScale (1.312634970241314 1.312634970241314 1.312634970241314)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.356012203955471 0)
"cameras" SET Transform eulerAngles (-19.189355324644097 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4326663682220149
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.266259672115739
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1067023393072759
"cameras/drone/drone0" SET Transform localPosition (0.40339096229474736 0.22335800548705714 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.15708221986833637 0.826310831892754 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 2 10)
"cameras/drone/drone0" SET Transform localScale (1.151450910007755 1.151450910007755 1.151450910007755)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 5 12)
"cameras/drone/drone1" SET Transform localScale (1.040224722139085 1.040224722139085 1.040224722139085)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.739862797013253 0)
"cameras" SET Transform eulerAngles (-16.71146972955659 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3496242552076727
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.365654472132456
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22006073880115762
"cameras/drone/drone0" SET Transform localPosition (-0.5635454394199972 0.4078630415375892 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1517411360991241 1.1420665618238612 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 0 -15)
"cameras/drone/drone0" SET Transform localScale (1.3580938745517321 1.3580938745517321 1.3580938745517321)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -13 -14)
"cameras/drone/drone1" SET Transform localScale (1.3738339040094067 1.3738339040094067 1.3738339040094067)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0214663786690554 0)
"cameras" SET Transform eulerAngles (17.865861358051404 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0731815172887025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9183182098313877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09804033177970761
"cameras/drone/drone0" SET Transform localPosition (-0.8888235393092017 0.5482494257789272 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0417014812537326 1.2182643553569146 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 7 -12)
"cameras/drone/drone0" SET Transform localScale (1.492524325926409 1.492524325926409 1.492524325926409)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -13 -5)
"cameras/drone/drone1" SET Transform localScale (1.0016940680499224 1.0016940680499224 1.0016940680499224)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9996937079499544 0)
"cameras" SET Transform eulerAngles (-4.94196416883562 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9838675433974257
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2699571408451549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25914526163014545
"cameras/drone/drone0" SET Transform localPosition (-0.7250786879877852 0.21656517849245466 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7272990656915665 1.1104996605948776 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 9 16)
"cameras/drone/drone0" SET Transform localScale (0.6059574782041611 0.6059574782041611 0.6059574782041611)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -2 2)
"cameras/drone/drone1" SET Transform localScale (0.965388660232896 0.965388660232896 0.965388660232896)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.67470405799976 0)
"cameras" SET Transform eulerAngles (-16.92478226931375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9631673233529517
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2519109508150024
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09495277833350024
"cameras/drone/drone0" SET Transform localPosition (-0.31709798335269357 -0.1554428090659275 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0800476526488989 1.2821142964578705 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -2 0)
"cameras/drone/drone0" SET Transform localScale (1.2630319469578906 1.2630319469578906 1.2630319469578906)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 0 -6)
"cameras/drone/drone1" SET Transform localScale (1.396316965733872 1.396316965733872 1.396316965733872)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3698747216611045 0)
"cameras" SET Transform eulerAngles (-5.816203378655462 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0904450580770113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2892995899156354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29571652890923755
"cameras/drone/drone0" SET Transform localPosition (-0.7402935519950162 0.177931162180693 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9964247443615823 1.1090351456728456 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -4 1)
"cameras/drone/drone0" SET Transform localScale (1.2747666758530514 1.2747666758530514 1.2747666758530514)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -9 -7)
"cameras/drone/drone1" SET Transform localScale (0.883151895826324 0.883151895826324 0.883151895826324)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0245912913447155 0)
"cameras" SET Transform eulerAngles (-12.623721856494598 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5706109199914856
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0627111124503166
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3086964486056932
"cameras/drone/drone0" SET Transform localPosition (-0.22412216388714312 0.33461115892304055 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.067264569513137 0.882641673741031 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 20 16)
"cameras/drone/drone0" SET Transform localScale (0.875671069199454 0.875671069199454 0.875671069199454)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -7 1)
"cameras/drone/drone1" SET Transform localScale (0.8301765262546249 0.8301765262546249 0.8301765262546249)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7018547037704677 0)
"cameras" SET Transform eulerAngles (-10.480651789881472 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5521071293678341
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.106037481371499
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.008643278854553583
"cameras/drone/drone0" SET Transform localPosition (-0.777105312467929 0.05264251505515388 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2839353357314771 0.8906013707260949 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -17 16)
"cameras/drone/drone0" SET Transform localScale (1.0230284936213319 1.0230284936213319 1.0230284936213319)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 19 12)
"cameras/drone/drone1" SET Transform localScale (0.8315085564871083 0.8315085564871083 0.8315085564871083)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6116593643962958 0)
"cameras" SET Transform eulerAngles (-8.209403912667517 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.456632849582563
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.412604223063872
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.040061974203874855
"cameras/drone/drone0" SET Transform localPosition (-1.1198577697791994 0.6493301022976401 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7595414042312603 1.040187791275885 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -5 -16)
"cameras/drone/drone0" SET Transform localScale (1.2194260669518413 1.2194260669518413 1.2194260669518413)
"cameras/drone/drone1" SET Transform localEulerAngles (18 2 -11)
"cameras/drone/drone1" SET Transform localScale (0.847977281231058 0.847977281231058 0.847977281231058)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6772512552410177 0)
"cameras" SET Transform eulerAngles (7.703966749970462 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4991848578319784
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0531233799563966
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14212700490728844
"cameras/drone/drone0" SET Transform localPosition (-0.2671043351475514 -0.11653806647745729 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6667022716583417 1.1793621235813272 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -9 -17)
"cameras/drone/drone0" SET Transform localScale (1.4049006350997444 1.4049006350997444 1.4049006350997444)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -8 18)
"cameras/drone/drone1" SET Transform localScale (1.486524051335066 1.486524051335066 1.486524051335066)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.739049489989877 0)
"cameras" SET Transform eulerAngles (10.896121518629055 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0549373864121487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7971137722077835
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14515835133813937
"cameras/drone/drone0" SET Transform localPosition (-0.5834599524939085 0.36617490366754607 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0018856120828914 1.07634924577886 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -2 2)
"cameras/drone/drone0" SET Transform localScale (0.646067269638838 0.646067269638838 0.646067269638838)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -11 20)
"cameras/drone/drone1" SET Transform localScale (0.7006366255155597 0.7006366255155597 0.7006366255155597)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6910084957819915 0)
"cameras" SET Transform eulerAngles (-3.5348038746771167 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.531245585496312
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2847907133777796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.004380022085816293
"cameras/drone/drone0" SET Transform localPosition (-0.4811063472238427 -0.14878923162466634 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.053103529209278744 0.9029788900587252 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -1 8)
"cameras/drone/drone0" SET Transform localScale (1.0004652021191573 1.0004652021191573 1.0004652021191573)
"cameras/drone/drone1" SET Transform localEulerAngles (3 13 2)
"cameras/drone/drone1" SET Transform localScale (0.6926537198559193 0.6926537198559193 0.6926537198559193)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.153225783012278 0)
"cameras" SET Transform eulerAngles (-3.5505541543288963 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0564535937801105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4922455685657594
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.033323105702672384
"cameras/drone/drone0" SET Transform localPosition (-0.8183316050638283 -0.08951507308728163 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.39840759601068987 1.0462746931058506 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 10 -8)
"cameras/drone/drone0" SET Transform localScale (0.6580877898746488 0.6580877898746488 0.6580877898746488)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -3 13)
"cameras/drone/drone1" SET Transform localScale (0.7727242827906899 0.7727242827906899 0.7727242827906899)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.728730426901227 0)
"cameras" SET Transform eulerAngles (2.301173439059742 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.740915738637761
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9054306009367264
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24891982969004461
"cameras/drone/drone0" SET Transform localPosition (0.6061121316053437 0.6327152468606114 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.02878486465315322 1.1934445417006447 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 13 6)
"cameras/drone/drone0" SET Transform localScale (1.1891538087018905 1.1891538087018905 1.1891538087018905)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 19 7)
"cameras/drone/drone1" SET Transform localScale (1.120348339798133 1.120348339798133 1.120348339798133)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.518762280109786 0)
"cameras" SET Transform eulerAngles (19.524764828192772 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7421673408250373
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9934913804285598
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18855269277713438
"cameras/drone/drone0" SET Transform localPosition (0.4162677294691104 -0.18862531066492422 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.41945612137362587 1.095980630209879 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -20 17)
"cameras/drone/drone0" SET Transform localScale (1.2519188174675806 1.2519188174675806 1.2519188174675806)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -15 5)
"cameras/drone/drone1" SET Transform localScale (1.2093174305901877 1.2093174305901877 1.2093174305901877)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.970845183294721 0)
"cameras" SET Transform eulerAngles (4.374781154395585 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0541298059403785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9582773708350416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37916776249857426
"cameras/drone/drone0" SET Transform localPosition (-0.5597811575613311 0.15158098036306328 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6666221098488487 1.132556429402523 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 1 -17)
"cameras/drone/drone0" SET Transform localScale (0.8451605992244917 0.8451605992244917 0.8451605992244917)
"cameras/drone/drone1" SET Transform localEulerAngles (20 19 -6)
"cameras/drone/drone1" SET Transform localScale (1.1857090338601899 1.1857090338601899 1.1857090338601899)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0853668129818335 0)
"cameras" SET Transform eulerAngles (-0.3766388065291508 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2565824634605445
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0741893052008575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.240066288833434
"cameras/drone/drone0" SET Transform localPosition (0.07108675495647843 0.276592956110524 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.171153725629789 0.8026395225636525 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -11 13)
"cameras/drone/drone0" SET Transform localScale (1.3084484598593216 1.3084484598593216 1.3084484598593216)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -2 9)
"cameras/drone/drone1" SET Transform localScale (1.0743356983330625 1.0743356983330625 1.0743356983330625)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.285306595777275 0)
"cameras" SET Transform eulerAngles (2.659878535960054 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5708268946150568
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3361987425344943
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2256116268329174
"cameras/drone/drone0" SET Transform localPosition (0.73758732730026 0.33702761213785776 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6425765604934002 0.8020099348566461 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 2 -18)
"cameras/drone/drone0" SET Transform localScale (1.296470926774385 1.296470926774385 1.296470926774385)
"cameras/drone/drone1" SET Transform localEulerAngles (6 10 5)
"cameras/drone/drone1" SET Transform localScale (0.7935221897717445 0.7935221897717445 0.7935221897717445)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.04785757431416 0)
"cameras" SET Transform eulerAngles (-14.498944341009675 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5982292559538304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4741269316101007
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21858695200999662
"cameras/drone/drone0" SET Transform localPosition (0.5952679680802255 0.22673781452374692 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8818191828603339 0.8139883160547041 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 20 -10)
"cameras/drone/drone0" SET Transform localScale (1.0037403188498775 1.0037403188498775 1.0037403188498775)
"cameras/drone/drone1" SET Transform localEulerAngles (2 13 19)
"cameras/drone/drone1" SET Transform localScale (1.3133847952277673 1.3133847952277673 1.3133847952277673)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1575526584543887 0)
"cameras" SET Transform eulerAngles (10.949880195638976 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4442053011655118
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5241639461379106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05047537057414373
"cameras/drone/drone0" SET Transform localPosition (0.3821862618262404 0.6484895804977568 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0129316253854086 1.2501440415353196 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 0 -10)
"cameras/drone/drone0" SET Transform localScale (0.7563688887650876 0.7563688887650876 0.7563688887650876)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 0 0)
"cameras/drone/drone1" SET Transform localScale (1.4475210459615795 1.4475210459615795 1.4475210459615795)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.839212731684283 0)
"cameras" SET Transform eulerAngles (-12.114076676212875 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3848488633144296
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0594800916576048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.047929865596411325
"cameras/drone/drone0" SET Transform localPosition (-0.5987776118211613 -0.09330477149171451 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5712699210165065 0.9279316337415138 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -4 -13)
"cameras/drone/drone0" SET Transform localScale (0.984044031127244 0.984044031127244 0.984044031127244)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -13 19)
"cameras/drone/drone1" SET Transform localScale (0.7442471065000968 0.7442471065000968 0.7442471065000968)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1005107867868595 0)
"cameras" SET Transform eulerAngles (17.115398298534494 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5715916526646014
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4727976324845686
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.271991147195395
"cameras/drone/drone0" SET Transform localPosition (-0.9573497192137719 0.31944305884087937 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1069916440791767 1.2067930420626172 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -6 -14)
"cameras/drone/drone0" SET Transform localScale (1.2877529031514738 1.2877529031514738 1.2877529031514738)
"cameras/drone/drone1" SET Transform localEulerAngles (8 10 7)
"cameras/drone/drone1" SET Transform localScale (0.745347247745484 0.745347247745484 0.745347247745484)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0023778941410066 0)
"cameras" SET Transform eulerAngles (-4.466173930859858 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6542155599430838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7357233013046902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14220886252184323
"cameras/drone/drone0" SET Transform localPosition (-0.5408643610273869 0.5822210931712188 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5502646225922669 1.1621340228911612 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -9 -14)
"cameras/drone/drone0" SET Transform localScale (1.154381508096277 1.154381508096277 1.154381508096277)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 19 -15)
"cameras/drone/drone1" SET Transform localScale (0.9623203922728631 0.9623203922728631 0.9623203922728631)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.097603399244374 0)
"cameras" SET Transform eulerAngles (-19.064843405359447 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6208298918442715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7583163924701704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37685647930854277
"cameras/drone/drone0" SET Transform localPosition (1.0332595510907103 0.17390996635116368 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.39806370953446546 0.8850064769540573 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -16 -6)
"cameras/drone/drone0" SET Transform localScale (0.6772254529212635 0.6772254529212635 0.6772254529212635)
"cameras/drone/drone1" SET Transform localEulerAngles (8 11 6)
"cameras/drone/drone1" SET Transform localScale (1.3728073726432743 1.3728073726432743 1.3728073726432743)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0027993136447515 0)
"cameras" SET Transform eulerAngles (-5.504745364185727 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5831855301120834
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0366408644687393
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2484223355450053
"cameras/drone/drone0" SET Transform localPosition (-0.5736107815768968 -0.13977166510635947 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8206791828132896 0.8559460706843516 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -11 -6)
"cameras/drone/drone0" SET Transform localScale (0.8480172261307821 0.8480172261307821 0.8480172261307821)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -17 15)
"cameras/drone/drone1" SET Transform localScale (0.8664894210134894 0.8664894210134894 0.8664894210134894)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.513373399890446 0)
"cameras" SET Transform eulerAngles (-12.607487078610365 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6124806784900994
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.080671098247259
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16647815389569903
"cameras/drone/drone0" SET Transform localPosition (-0.9007369138774506 0.45755705247220796 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9046087847434381 1.2089867260612204 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -2 12)
"cameras/drone/drone0" SET Transform localScale (0.6703811401415016 0.6703811401415016 0.6703811401415016)
"cameras/drone/drone1" SET Transform localEulerAngles (7 20 -10)
"cameras/drone/drone1" SET Transform localScale (0.6915026695615432 0.6915026695615432 0.6915026695615432)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.171275929447725 0)
"cameras" SET Transform eulerAngles (5.3552322186937005 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4431975610365947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.655838098516571
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24575792724239048
"cameras/drone/drone0" SET Transform localPosition (0.8602175952351419 -0.07056794032385788 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4295573185260244 1.1705091643303152 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -9 -13)
"cameras/drone/drone0" SET Transform localScale (1.1000184858206774 1.1000184858206774 1.1000184858206774)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -3 7)
"cameras/drone/drone1" SET Transform localScale (0.9531389839017661 0.9531389839017661 0.9531389839017661)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8354122679462543 0)
"cameras" SET Transform eulerAngles (-15.375596689162542 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4369225907055895
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5614317731952176
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04496803978605653
"cameras/drone/drone0" SET Transform localPosition (0.16987024083544933 0.40198533040040624 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8512641362921485 1.1451992417871617 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -10 8)
"cameras/drone/drone0" SET Transform localScale (1.3189117761717728 1.3189117761717728 1.3189117761717728)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -19 -14)
"cameras/drone/drone1" SET Transform localScale (0.9389153594241699 0.9389153594241699 0.9389153594241699)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.975732297947337 0)
"cameras" SET Transform eulerAngles (-12.388481492768882 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.029851864151213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9598624083298332
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2663118940070816
"cameras/drone/drone0" SET Transform localPosition (-0.6923868401426351 0.6244753982877023 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.017512949890075902 0.8011596938373897 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 13 9)
"cameras/drone/drone0" SET Transform localScale (0.997952528513788 0.997952528513788 0.997952528513788)
"cameras/drone/drone1" SET Transform localEulerAngles (3 2 0)
"cameras/drone/drone1" SET Transform localScale (0.765864400664953 0.765864400664953 0.765864400664953)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.381881695001866 0)
"cameras" SET Transform eulerAngles (10.654610531182275 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4930549999666387
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5360298247002437
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04453197287389248
"cameras/drone/drone0" SET Transform localPosition (0.7634747038296861 0.17703812897895738 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.14401422429726107 0.8647744231451416 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -18 -12)
"cameras/drone/drone0" SET Transform localScale (1.2355726739497748 1.2355726739497748 1.2355726739497748)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -8 -5)
"cameras/drone/drone1" SET Transform localScale (1.2833712397001156 1.2833712397001156 1.2833712397001156)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.096719263214342 0)
"cameras" SET Transform eulerAngles (-12.4347425015418 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4826862164044434
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9530300871591052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11660268029802073
"cameras/drone/drone0" SET Transform localPosition (0.29146623365020585 -0.1738161467980573 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1472331200797818 0.8452094797339218 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -13 -7)
"cameras/drone/drone0" SET Transform localScale (0.6323837972809009 0.6323837972809009 0.6323837972809009)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 12 -16)
"cameras/drone/drone1" SET Transform localScale (1.073611849686033 1.073611849686033 1.073611849686033)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.15395494976069 0)
"cameras" SET Transform eulerAngles (9.459170207623426 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6158540841012702
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2176970952104214
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04918523986768766
"cameras/drone/drone0" SET Transform localPosition (-0.7602222998763235 0.5471269102879108 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.48041964350898203 0.8860224573529262 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -18 10)
"cameras/drone/drone0" SET Transform localScale (1.086068297839814 1.086068297839814 1.086068297839814)
"cameras/drone/drone1" SET Transform localEulerAngles (10 0 -2)
"cameras/drone/drone1" SET Transform localScale (1.2553065414988214 1.2553065414988214 1.2553065414988214)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.825677032270573 0)
"cameras" SET Transform eulerAngles (3.7798411889548262 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.813053302580058
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9996419144696183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2634885596307805
"cameras/drone/drone0" SET Transform localPosition (-0.3463271461597569 0.23223019208165613 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7967292669899884 1.0925630517701046 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 20 15)
"cameras/drone/drone0" SET Transform localScale (0.9146536567163563 0.9146536567163563 0.9146536567163563)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -19 -17)
"cameras/drone/drone1" SET Transform localScale (0.6333424713974498 0.6333424713974498 0.6333424713974498)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.623938428102808 0)
"cameras" SET Transform eulerAngles (3.745370735475163 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5898964398520805
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1622108608695683
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2617340541693981
"cameras/drone/drone0" SET Transform localPosition (-0.7584964442710982 0.013835445439192406 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9778637362412261 0.8881152960399392 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -5 -11)
"cameras/drone/drone0" SET Transform localScale (1.0945517673707923 1.0945517673707923 1.0945517673707923)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -12 12)
"cameras/drone/drone1" SET Transform localScale (1.218961700758684 1.218961700758684 1.218961700758684)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7843076803802065 0)
"cameras" SET Transform eulerAngles (1.474872326290864 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3614841220615834
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7507236672799997
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06337992739540788
"cameras/drone/drone0" SET Transform localPosition (-0.2741342167059364 -0.057976671638048816 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1237478470162723 0.9574396633453954 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 9 13)
"cameras/drone/drone0" SET Transform localScale (0.7704987606313856 0.7704987606313856 0.7704987606313856)
"cameras/drone/drone1" SET Transform localEulerAngles (15 14 20)
"cameras/drone/drone1" SET Transform localScale (1.1316825866911149 1.1316825866911149 1.1316825866911149)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.265109752625085 0)
"cameras" SET Transform eulerAngles (13.855397158255947 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5461032466988005
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0543012598976924
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24112130374827132
"cameras/drone/drone0" SET Transform localPosition (0.4159946460384025 -0.20720210844204118 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.643717401089276 1.0070720807224793 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -15 5)
"cameras/drone/drone0" SET Transform localScale (1.1661992945969235 1.1661992945969235 1.1661992945969235)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 1 19)
"cameras/drone/drone1" SET Transform localScale (0.916661044530595 0.916661044530595 0.916661044530595)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.82674983015323 0)
"cameras" SET Transform eulerAngles (11.507447651180534 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7018760125890438
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.71609668560116
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30876123946916617
"cameras/drone/drone0" SET Transform localPosition (0.1730855953499657 0.6520192873764801 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0929794046632637 1.1695971320065932 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 3 13)
"cameras/drone/drone0" SET Transform localScale (0.6546096055060624 0.6546096055060624 0.6546096055060624)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -1 -19)
"cameras/drone/drone1" SET Transform localScale (0.6069211181610383 0.6069211181610383 0.6069211181610383)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.720930638072965 0)
"cameras" SET Transform eulerAngles (19.345278926393775 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8471446039268139
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4008244772771188
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36991500339887895
"cameras/drone/drone0" SET Transform localPosition (-1.1897247843409184 -0.05334587293450049 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9569436875468795 1.2549987769401976 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 0 16)
"cameras/drone/drone0" SET Transform localScale (1.1491366549838773 1.1491366549838773 1.1491366549838773)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -13 5)
"cameras/drone/drone1" SET Transform localScale (1.305843977353738 1.305843977353738 1.305843977353738)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.062030974375336 0)
"cameras" SET Transform eulerAngles (1.7044935462245334 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3935912365486987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4364962935713723
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3731876640347924
"cameras/drone/drone0" SET Transform localPosition (1.1903614754894882 0.2550236012248989 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5459200568185452 0.857950587955759 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -15 3)
"cameras/drone/drone0" SET Transform localScale (0.7214859417282855 0.7214859417282855 0.7214859417282855)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -18 -3)
"cameras/drone/drone1" SET Transform localScale (0.9289728511604762 0.9289728511604762 0.9289728511604762)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.533736999035111 0)
"cameras" SET Transform eulerAngles (2.586686083915133 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2442274624140897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7101316028469973
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26195345970477946
"cameras/drone/drone0" SET Transform localPosition (-0.2267438707157191 0.2462126468103219 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7198855791327332 0.8201775046874489 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 18 1)
"cameras/drone/drone0" SET Transform localScale (1.2976910231979955 1.2976910231979955 1.2976910231979955)
"cameras/drone/drone1" SET Transform localEulerAngles (17 5 -15)
"cameras/drone/drone1" SET Transform localScale (0.9022398006880274 0.9022398006880274 0.9022398006880274)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.09762595693984 0)
"cameras" SET Transform eulerAngles (-3.356003520821819 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0268758620252536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.906737869978787
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2923066683179838
"cameras/drone/drone0" SET Transform localPosition (-0.15422181081659403 0.25097302485878287 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0616471883475602 0.9800615487052056 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -14 20)
"cameras/drone/drone0" SET Transform localScale (1.1445087192306496 1.1445087192306496 1.1445087192306496)
"cameras/drone/drone1" SET Transform localEulerAngles (14 4 17)
"cameras/drone/drone1" SET Transform localScale (1.3607459479020214 1.3607459479020214 1.3607459479020214)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.299825018890666 0)
"cameras" SET Transform eulerAngles (8.500857087166192 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4275708535322667
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5930468591382694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2515637057027104
"cameras/drone/drone0" SET Transform localPosition (0.42629853308769494 0.11138734017636814 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0807355148381661 1.0477385483347688 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -3 -9)
"cameras/drone/drone0" SET Transform localScale (0.8961171258172311 0.8961171258172311 0.8961171258172311)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -8 18)
"cameras/drone/drone1" SET Transform localScale (1.0582484667895269 1.0582484667895269 1.0582484667895269)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2230788014956255 0)
"cameras" SET Transform eulerAngles (15.39061804978921 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48726710041311616
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5882445045064482
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12258380454737017
"cameras/drone/drone0" SET Transform localPosition (1.0492858073153088 0.14887423012792061 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6688557751159793 1.1552345497710887 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 6 -6)
"cameras/drone/drone0" SET Transform localScale (0.6573397088254676 0.6573397088254676 0.6573397088254676)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -2 1)
"cameras/drone/drone1" SET Transform localScale (1.1491679528882184 1.1491679528882184 1.1491679528882184)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2394385957730303 0)
"cameras" SET Transform eulerAngles (-17.688628989385663 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6020167701655738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4911245749099236
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36592382863882644
"cameras/drone/drone0" SET Transform localPosition (-0.47571302092566214 -0.2996139365880987 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0667669919871552 0.836014671729276 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -17 19)
"cameras/drone/drone0" SET Transform localScale (0.6916849790012856 0.6916849790012856 0.6916849790012856)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -9 -19)
"cameras/drone/drone1" SET Transform localScale (0.6699195525991857 0.6699195525991857 0.6699195525991857)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.162723376220084 0)
"cameras" SET Transform eulerAngles (-10.403371479836618 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7123188191294842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4546649962493823
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2589953754479728
"cameras/drone/drone0" SET Transform localPosition (1.0378192371596533 0.4980518627819635 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6506201774959725 0.9233981091867298 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 2 2)
"cameras/drone/drone0" SET Transform localScale (0.6015554139999234 0.6015554139999234 0.6015554139999234)
"cameras/drone/drone1" SET Transform localEulerAngles (7 14 14)
"cameras/drone/drone1" SET Transform localScale (0.858160102025012 0.858160102025012 0.858160102025012)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.609512864521016 0)
"cameras" SET Transform eulerAngles (15.982799125764622 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45524118841780226
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8379090057430343
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18283480685751063
"cameras/drone/drone0" SET Transform localPosition (-0.4097096156816038 0.6173180863705447 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.46284670531510996 0.9358092430924891 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 0 -6)
"cameras/drone/drone0" SET Transform localScale (1.2372160706493378 1.2372160706493378 1.2372160706493378)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -14 8)
"cameras/drone/drone1" SET Transform localScale (0.7499294070123445 0.7499294070123445 0.7499294070123445)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.141046189167065 0)
"cameras" SET Transform eulerAngles (-13.021995974987973 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.323410089184133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3961960710368169
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2732686604072636
"cameras/drone/drone0" SET Transform localPosition (0.31875988447742687 0.6335545594380965 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7818862368709341 1.0854381265470623 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -1 19)
"cameras/drone/drone0" SET Transform localScale (0.7930178583335096 0.7930178583335096 0.7930178583335096)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -20 15)
"cameras/drone/drone1" SET Transform localScale (1.0933770852824911 1.0933770852824911 1.0933770852824911)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.038157985683243 0)
"cameras" SET Transform eulerAngles (-7.538983961667999 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.593132544109496
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7850215912167524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1928498049874317
"cameras/drone/drone0" SET Transform localPosition (0.40064123692869336 -0.004587659906818697 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8172508531953947 1.2397967854786227 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 9 6)
"cameras/drone/drone0" SET Transform localScale (1.3842738621752844 1.3842738621752844 1.3842738621752844)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -14 -10)
"cameras/drone/drone1" SET Transform localScale (0.9440670767443526 0.9440670767443526 0.9440670767443526)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.040663557284063 0)
"cameras" SET Transform eulerAngles (18.3230873873189 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9319125499631296
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9570734899329696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13990055431352597
"cameras/drone/drone0" SET Transform localPosition (-0.8907949445687586 0.3784900924522187 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8655810847179681 1.0329976820541602 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -10 -16)
"cameras/drone/drone0" SET Transform localScale (0.7738650063373173 0.7738650063373173 0.7738650063373173)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -12 -9)
"cameras/drone/drone1" SET Transform localScale (0.8910497937259143 0.8910497937259143 0.8910497937259143)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1106366095186937 0)
"cameras" SET Transform eulerAngles (13.851444530059666 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9558459010649264
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6084478556280466
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25051497084546787
"cameras/drone/drone0" SET Transform localPosition (0.4421944065709771 0.4646219359819201 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7878225272083703 0.9918043939543604 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 9 14)
"cameras/drone/drone0" SET Transform localScale (0.6022959368561822 0.6022959368561822 0.6022959368561822)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -1 3)
"cameras/drone/drone1" SET Transform localScale (0.6764472766073125 0.6764472766073125 0.6764472766073125)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.156625644246452 0)
"cameras" SET Transform eulerAngles (-8.220173689784902 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6634366442745252
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4698857692134104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3095067381763945
"cameras/drone/drone0" SET Transform localPosition (0.7892701622628897 0.41532777334815 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2985515419631053 1.1192012731796432 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -5 -4)
"cameras/drone/drone0" SET Transform localScale (1.2564816272875823 1.2564816272875823 1.2564816272875823)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -14 -2)
"cameras/drone/drone1" SET Transform localScale (1.3668704138793 1.3668704138793 1.3668704138793)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.719330566783271 0)
"cameras" SET Transform eulerAngles (14.654164007794044 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9195152471329597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6464941873495362
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15650052446986373
"cameras/drone/drone0" SET Transform localPosition (-0.6071958112188719 0.10668381611793892 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0843261637395496 1.064872818167649 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 11 -14)
"cameras/drone/drone0" SET Transform localScale (1.4451085150298888 1.4451085150298888 1.4451085150298888)
"cameras/drone/drone1" SET Transform localEulerAngles (20 3 -7)
"cameras/drone/drone1" SET Transform localScale (1.0020066630981275 1.0020066630981275 1.0020066630981275)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.683823743881215 0)
"cameras" SET Transform eulerAngles (-15.134598168119911 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9628382696323958
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.291487614679403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3941637682938543
"cameras/drone/drone0" SET Transform localPosition (-0.8651019490195928 0.07420901654273387 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9293897498800059 1.096532798007224 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 1 1)
"cameras/drone/drone0" SET Transform localScale (0.6372974168616011 0.6372974168616011 0.6372974168616011)
"cameras/drone/drone1" SET Transform localEulerAngles (18 10 -18)
"cameras/drone/drone1" SET Transform localScale (0.8884626508862046 0.8884626508862046 0.8884626508862046)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8454026266658294 0)
"cameras" SET Transform eulerAngles (10.816260645793704 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8851712542276825
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.80236563614284
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2952010911751143
"cameras/drone/drone0" SET Transform localPosition (-0.373726115645832 0.4771686008835407 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2632246162815073 0.8642264502529464 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -19 -11)
"cameras/drone/drone0" SET Transform localScale (1.0625774568932655 1.0625774568932655 1.0625774568932655)
"cameras/drone/drone1" SET Transform localEulerAngles (5 5 3)
"cameras/drone/drone1" SET Transform localScale (0.8938699983370928 0.8938699983370928 0.8938699983370928)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.711405472470489 0)
"cameras" SET Transform eulerAngles (10.892477114962134 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8248472253732856
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9639568887531302
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30866929746825944
"cameras/drone/drone0" SET Transform localPosition (-1.1451666047157365 -0.26326623616786954 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.34764492323871965 1.230524971284559 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 10 19)
"cameras/drone/drone0" SET Transform localScale (0.8101417509678495 0.8101417509678495 0.8101417509678495)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 1 9)
"cameras/drone/drone1" SET Transform localScale (0.8130773776996054 0.8130773776996054 0.8130773776996054)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.975186194952602 0)
"cameras" SET Transform eulerAngles (0.8146198028706699 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.639999194377293
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3446077930054923
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3288188803713521
"cameras/drone/drone0" SET Transform localPosition (1.0935220801837742 0.006534567191327889 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3144263285118045 0.9398072675338314 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 8 14)
"cameras/drone/drone0" SET Transform localScale (0.7444053473147583 0.7444053473147583 0.7444053473147583)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -15 12)
"cameras/drone/drone1" SET Transform localScale (0.7718930112511871 0.7718930112511871 0.7718930112511871)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.526484557623286 0)
"cameras" SET Transform eulerAngles (-10.329471034732673 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9926314926255335
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5818358717579246
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3055959639557423
"cameras/drone/drone0" SET Transform localPosition (-0.7615863709263984 0.5548545090801094 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9149814366561997 0.9406374027189586 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 15 -4)
"cameras/drone/drone0" SET Transform localScale (0.9271428376024244 0.9271428376024244 0.9271428376024244)
"cameras/drone/drone1" SET Transform localEulerAngles (4 5 -19)
"cameras/drone/drone1" SET Transform localScale (0.6143683301592895 0.6143683301592895 0.6143683301592895)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.73750000650742 0)
"cameras" SET Transform eulerAngles (-4.783592101591086 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6378024310753536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8655669313155159
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.020641982994088662
"cameras/drone/drone0" SET Transform localPosition (0.1428843735587677 0.04075430689483733 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7279922104615195 1.1488000671539464 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -19 4)
"cameras/drone/drone0" SET Transform localScale (1.2191888149661585 1.2191888149661585 1.2191888149661585)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -10 20)
"cameras/drone/drone1" SET Transform localScale (0.791815689112514 0.791815689112514 0.791815689112514)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.08381082484667 0)
"cameras" SET Transform eulerAngles (8.30419325792247 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.309753903134763
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4360164805536082
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20590482560888013
"cameras/drone/drone0" SET Transform localPosition (-0.04429958606254503 0.6935908846774406 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1823773908896817 1.2913133822078982 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 16 -17)
"cameras/drone/drone0" SET Transform localScale (0.7283969586084982 0.7283969586084982 0.7283969586084982)
"cameras/drone/drone1" SET Transform localEulerAngles (17 2 -11)
"cameras/drone/drone1" SET Transform localScale (0.9821440445668612 0.9821440445668612 0.9821440445668612)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.130683424086065 0)
"cameras" SET Transform eulerAngles (17.61274061568202 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8330970915859126
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9876614439807307
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09042466855026349
"cameras/drone/drone0" SET Transform localPosition (0.7702037604636962 0.44005820674235446 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1518584357246093 1.2872915823204818 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -19 -11)
"cameras/drone/drone0" SET Transform localScale (1.0691918340449436 1.0691918340449436 1.0691918340449436)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -17 16)
"cameras/drone/drone1" SET Transform localScale (0.8352704720764468 0.8352704720764468 0.8352704720764468)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7351465773195027 0)
"cameras" SET Transform eulerAngles (-13.727973560558313 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6789435838792774
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.868069418795991
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.015378935021872042
"cameras/drone/drone0" SET Transform localPosition (0.8347175539516154 -0.22768548670946548 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7085309416602872 0.9404759974380257 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -6 5)
"cameras/drone/drone0" SET Transform localScale (1.4287433557167717 1.4287433557167717 1.4287433557167717)
"cameras/drone/drone1" SET Transform localEulerAngles (5 12 2)
"cameras/drone/drone1" SET Transform localScale (0.6742440628549327 0.6742440628549327 0.6742440628549327)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.504012542633744 0)
"cameras" SET Transform eulerAngles (-7.250991650904396 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5189989885820163
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4202076183165842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33371997541897713
"cameras/drone/drone0" SET Transform localPosition (0.49985433924763667 0.5591130714439114 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1585764999211703 1.0701040068033731 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 20 -11)
"cameras/drone/drone0" SET Transform localScale (0.8517756133041432 0.8517756133041432 0.8517756133041432)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -7 -11)
"cameras/drone/drone1" SET Transform localScale (0.7559793254072509 0.7559793254072509 0.7559793254072509)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.015721034515533 0)
"cameras" SET Transform eulerAngles (8.929361403122627 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5801214262994308
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.788512425438515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.009044072041097584
"cameras/drone/drone0" SET Transform localPosition (-0.5961889096701857 -0.07024358142674197 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6811095576233888 1.1647739088047753 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 18 -16)
"cameras/drone/drone0" SET Transform localScale (0.7830895386593602 0.7830895386593602 0.7830895386593602)
"cameras/drone/drone1" SET Transform localEulerAngles (9 9 -11)
"cameras/drone/drone1" SET Transform localScale (0.6537068674143754 0.6537068674143754 0.6537068674143754)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.171883501616925 0)
"cameras" SET Transform eulerAngles (3.3698008466936713 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6086781823301686
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7408920762628846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10862169528661321
"cameras/drone/drone0" SET Transform localPosition (-0.7891867366613283 0.09132818642578716 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1320816312185198 1.1407702404396591 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -1 -17)
"cameras/drone/drone0" SET Transform localScale (0.663651796083129 0.663651796083129 0.663651796083129)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -15 -7)
"cameras/drone/drone1" SET Transform localScale (0.994790139598662 0.994790139598662 0.994790139598662)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.923179975241486 0)
"cameras" SET Transform eulerAngles (1.4525538964372018 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7121989294364539
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2527452343207972
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18427718509282484
"cameras/drone/drone0" SET Transform localPosition (-0.13147506965296119 0.20904329416895356 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.015590961207257559 1.0993042050779605 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -4 7)
"cameras/drone/drone0" SET Transform localScale (0.6425263794158433 0.6425263794158433 0.6425263794158433)
"cameras/drone/drone1" SET Transform localEulerAngles (10 6 6)
"cameras/drone/drone1" SET Transform localScale (0.8752154716096125 0.8752154716096125 0.8752154716096125)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.75449176277411 0)
"cameras" SET Transform eulerAngles (-16.44842824951948 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1784275212386328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5989231760520197
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05855032457727863
"cameras/drone/drone0" SET Transform localPosition (-0.25401958137756364 -0.21797130161659634 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24367651265056356 1.1017983220795364 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -20 15)
"cameras/drone/drone0" SET Transform localScale (1.0398124141354272 1.0398124141354272 1.0398124141354272)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -8 -2)
"cameras/drone/drone1" SET Transform localScale (0.9864383574881495 0.9864383574881495 0.9864383574881495)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4147009075671226 0)
"cameras" SET Transform eulerAngles (5.096355700236256 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0646473827352994
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8648396533662166
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37115946990773585
"cameras/drone/drone0" SET Transform localPosition (-0.02527983899243602 -0.05702314664696434 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8979030299279864 0.873655042241426 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 18 8)
"cameras/drone/drone0" SET Transform localScale (1.3128393732635166 1.3128393732635166 1.3128393732635166)
"cameras/drone/drone1" SET Transform localEulerAngles (8 0 13)
"cameras/drone/drone1" SET Transform localScale (1.4582526432245935 1.4582526432245935 1.4582526432245935)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.252953585282949 0)
"cameras" SET Transform eulerAngles (-4.524404150325179 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2137605029454568
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.585454209116612
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3238382037265557
"cameras/drone/drone0" SET Transform localPosition (0.9824678925611765 -0.01288782070971256 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7716589660224211 0.9997682224925096 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -17 20)
"cameras/drone/drone0" SET Transform localScale (0.9095760939333148 0.9095760939333148 0.9095760939333148)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -11 9)
"cameras/drone/drone1" SET Transform localScale (1.2056593410702754 1.2056593410702754 1.2056593410702754)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
