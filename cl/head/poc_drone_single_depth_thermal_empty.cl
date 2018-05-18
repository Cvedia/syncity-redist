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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 198 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 38 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 79 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET Transform position (0 80 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-16.72221733076729 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 38
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.822162179802542 0)
"cameras" SET Transform eulerAngles (16.69159125795489 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9188153576883576
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.977607450028918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05390960778832157
"cameras/drone/drone0" SET Transform localPosition (-0.16139890435427162 0.1555925891338354 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8628884928971061 1.0689697905231572 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 0 2)
"cameras/drone/drone0" SET Transform localScale (1.4772631780654062 1.4772631780654062 1.4772631780654062)
"cameras/drone/drone1" SET Transform localEulerAngles (11 12 10)
"cameras/drone/drone1" SET Transform localScale (0.7927665435595231 0.7927665435595231 0.7927665435595231)
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
"cameras" SET Transform position (0 4.875637015825546 0)
"cameras" SET Transform eulerAngles (-2.089948210026048 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.460860965715375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.003590353432353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2597592502559823
"cameras/drone/drone0" SET Transform localPosition (0.16443239847965252 0.37322064474389677 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0993893240140928 1.0485790882015884 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -10 -7)
"cameras/drone/drone0" SET Transform localScale (1.297508111031643 1.297508111031643 1.297508111031643)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 14 -8)
"cameras/drone/drone1" SET Transform localScale (1.3214985051774475 1.3214985051774475 1.3214985051774475)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9800928824562254 0)
"cameras" SET Transform eulerAngles (-11.100033564394746 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3743071653592698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3468196637382195
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11969901958278412
"cameras/drone/drone0" SET Transform localPosition (-0.7627537981045902 0.5879290424468366 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6538466997312913 0.9044363547778659 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 12 4)
"cameras/drone/drone0" SET Transform localScale (0.6747818830406787 0.6747818830406787 0.6747818830406787)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 14 -14)
"cameras/drone/drone1" SET Transform localScale (0.6161886785380964 0.6161886785380964 0.6161886785380964)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.251401945907479 0)
"cameras" SET Transform eulerAngles (-7.136231459743843 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1143012602380982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4220690505791684
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29630875010846247
"cameras/drone/drone0" SET Transform localPosition (0.9920009711955664 0.16563511374963896 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24987147388374575 0.8261271054189991 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -19 -20)
"cameras/drone/drone0" SET Transform localScale (1.4434810493984602 1.4434810493984602 1.4434810493984602)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -16 -16)
"cameras/drone/drone1" SET Transform localScale (0.9120156927925329 0.9120156927925329 0.9120156927925329)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4636844654399503 0)
"cameras" SET Transform eulerAngles (-9.80883128309063 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6680284672880803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0432476727026136
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09874918860940728
"cameras/drone/drone0" SET Transform localPosition (-0.5383793499891975 0.6239292252973736 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.43569132285123424 1.1223158573806038 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -18 -15)
"cameras/drone/drone0" SET Transform localScale (1.2063900531413707 1.2063900531413707 1.2063900531413707)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -16 6)
"cameras/drone/drone1" SET Transform localScale (1.2947191938488207 1.2947191938488207 1.2947191938488207)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9874264703482822 0)
"cameras" SET Transform eulerAngles (5.288263786477611 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4107519658562953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3323606477155046
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.010769577932327268
"cameras/drone/drone0" SET Transform localPosition (-0.8220971425563659 -0.14803480330542124 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8692296996383886 1.1287046387347994 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 15 1)
"cameras/drone/drone0" SET Transform localScale (1.4916138756726884 1.4916138756726884 1.4916138756726884)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -5 10)
"cameras/drone/drone1" SET Transform localScale (1.339554179693789 1.339554179693789 1.339554179693789)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4798981907736923 0)
"cameras" SET Transform eulerAngles (-9.442691288501251 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8697908458576409
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5565964605084424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.017166642436693857
"cameras/drone/drone0" SET Transform localPosition (1.1424032438565195 0.5312106449412632 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.34193534341559073 0.8903530103873516 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 3 13)
"cameras/drone/drone0" SET Transform localScale (0.8367513102224853 0.8367513102224853 0.8367513102224853)
"cameras/drone/drone1" SET Transform localEulerAngles (14 17 20)
"cameras/drone/drone1" SET Transform localScale (0.9595748885604639 0.9595748885604639 0.9595748885604639)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0507466268902785 0)
"cameras" SET Transform eulerAngles (11.649027774787186 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6973997054863836
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5161967667324405
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1661063256537807
"cameras/drone/drone0" SET Transform localPosition (-0.9838496823385627 -0.2859674348996139 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0946700936360394 1.079892668851336 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -8 -5)
"cameras/drone/drone0" SET Transform localScale (1.0825834157925722 1.0825834157925722 1.0825834157925722)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -2 -10)
"cameras/drone/drone1" SET Transform localScale (1.2611225320527133 1.2611225320527133 1.2611225320527133)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7296249166054034 0)
"cameras" SET Transform eulerAngles (-2.232144067093536 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5120893223903638
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.244670445145704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01428510596600976
"cameras/drone/drone0" SET Transform localPosition (-0.4796462228190248 0.45530474725065656 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6187194815621884 1.2907784869777001 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -17 14)
"cameras/drone/drone0" SET Transform localScale (1.0969042085632121 1.0969042085632121 1.0969042085632121)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -8 -9)
"cameras/drone/drone1" SET Transform localScale (1.100888678112594 1.100888678112594 1.100888678112594)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.34893120819219 0)
"cameras" SET Transform eulerAngles (6.248223830009934 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8370158654946209
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5782812962311277
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15649473728866792
"cameras/drone/drone0" SET Transform localPosition (1.0664384536562423 0.0972982935339956 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08556557461512626 1.1234230135761007 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -20 14)
"cameras/drone/drone0" SET Transform localScale (1.2982393748240533 1.2982393748240533 1.2982393748240533)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 5 -11)
"cameras/drone/drone1" SET Transform localScale (0.8618653927198889 0.8618653927198889 0.8618653927198889)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1454570354332274 0)
"cameras" SET Transform eulerAngles (-0.6020981197656816 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6621073355901309
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3395529833688027
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.022025639538069176
"cameras/drone/drone0" SET Transform localPosition (-0.13528138774077036 0.6904598795199259 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.45540421516923546 1.2916611710026942 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 11 -8)
"cameras/drone/drone0" SET Transform localScale (1.0785780794504456 1.0785780794504456 1.0785780794504456)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -18 19)
"cameras/drone/drone1" SET Transform localScale (1.2254018992475841 1.2254018992475841 1.2254018992475841)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.933928252562653 0)
"cameras" SET Transform eulerAngles (-3.189317969762797 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9515389580282817
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4205187188321218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14197230332580402
"cameras/drone/drone0" SET Transform localPosition (0.1805500609553914 0.09316682300096263 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05688271419896607 1.0428674505821154 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -14 -20)
"cameras/drone/drone0" SET Transform localScale (0.791358303746823 0.791358303746823 0.791358303746823)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -6 13)
"cameras/drone/drone1" SET Transform localScale (0.6561863146332367 0.6561863146332367 0.6561863146332367)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.848843795193227 0)
"cameras" SET Transform eulerAngles (-5.5805869479282 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.432981706785013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0797159827454104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1254654029439403
"cameras/drone/drone0" SET Transform localPosition (-1.144838730575514 0.1515384079042848 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1327918219118858 1.2169510410573823 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 8 -4)
"cameras/drone/drone0" SET Transform localScale (0.9788114613158785 0.9788114613158785 0.9788114613158785)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -5 13)
"cameras/drone/drone1" SET Transform localScale (1.1437827556504712 1.1437827556504712 1.1437827556504712)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8803541355418307 0)
"cameras" SET Transform eulerAngles (17.67376769029302 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8540434378996249
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0828273564869493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.051574648537415606
"cameras/drone/drone0" SET Transform localPosition (-0.28449480426031537 0.6180189579777542 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.017787955814469 1.2182888797796412 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 2 0)
"cameras/drone/drone0" SET Transform localScale (1.2316145282625652 1.2316145282625652 1.2316145282625652)
"cameras/drone/drone1" SET Transform localEulerAngles (7 0 -16)
"cameras/drone/drone1" SET Transform localScale (0.7093470075521529 0.7093470075521529 0.7093470075521529)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.522015392996767 0)
"cameras" SET Transform eulerAngles (-13.70147417081757 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.780735390149675
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.908228376532311
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2853431801461706
"cameras/drone/drone0" SET Transform localPosition (0.3730355030694734 -0.24243967927632898 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5335055793452858 0.945382352096209 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -11 -18)
"cameras/drone/drone0" SET Transform localScale (0.9106581451129745 0.9106581451129745 0.9106581451129745)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -1 5)
"cameras/drone/drone1" SET Transform localScale (1.3304405730080553 1.3304405730080553 1.3304405730080553)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8700120809003584 0)
"cameras" SET Transform eulerAngles (-4.666637115967841 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.17903580216384
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.079841865421464
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16967254630778067
"cameras/drone/drone0" SET Transform localPosition (-0.3234998707973298 0.15960954271126698 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12111539833237517 1.2321190735818552 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -12 2)
"cameras/drone/drone0" SET Transform localScale (1.1112850622440362 1.1112850622440362 1.1112850622440362)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -12 4)
"cameras/drone/drone1" SET Transform localScale (0.9926285215606743 0.9926285215606743 0.9926285215606743)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0178657481427313 0)
"cameras" SET Transform eulerAngles (15.64215944394627 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5718261404868934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6383819921719562
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1584973861520231
"cameras/drone/drone0" SET Transform localPosition (-0.22563981804733846 -0.26528058809493443 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1911964440159999 1.0614441822641367 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -15 10)
"cameras/drone/drone0" SET Transform localScale (1.4287774813182708 1.4287774813182708 1.4287774813182708)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 15 4)
"cameras/drone/drone1" SET Transform localScale (0.9188625620259492 0.9188625620259492 0.9188625620259492)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.012365826437445 0)
"cameras" SET Transform eulerAngles (10.901855558219054 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1516491808469858
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1691502348746663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.289070153684424
"cameras/drone/drone0" SET Transform localPosition (0.088085338959623 0.40616978232435125 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.127075405900302 0.9919802892461653 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -12 13)
"cameras/drone/drone0" SET Transform localScale (0.9503993296627544 0.9503993296627544 0.9503993296627544)
"cameras/drone/drone1" SET Transform localEulerAngles (12 3 -3)
"cameras/drone/drone1" SET Transform localScale (1.4746025019442288 1.4746025019442288 1.4746025019442288)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.503728045907783 0)
"cameras" SET Transform eulerAngles (18.466542768740787 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6986962980631573
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2375721535568294
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36373416037972267
"cameras/drone/drone0" SET Transform localPosition (0.2606896032756396 0.0897989276858095 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1876457441249826 1.2558039948665292 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 12 -5)
"cameras/drone/drone0" SET Transform localScale (1.4182693985200188 1.4182693985200188 1.4182693985200188)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -10 6)
"cameras/drone/drone1" SET Transform localScale (1.3873709131655119 1.3873709131655119 1.3873709131655119)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5183487229112673 0)
"cameras" SET Transform eulerAngles (6.394840951963765 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.644750075510051
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5810760246795528
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1942640896373019
"cameras/drone/drone0" SET Transform localPosition (0.6228340707868796 0.47777286983663486 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4405248255267339 1.2077478945602877 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -9 11)
"cameras/drone/drone0" SET Transform localScale (0.8995157391412956 0.8995157391412956 0.8995157391412956)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -19 4)
"cameras/drone/drone1" SET Transform localScale (0.9091568767047516 0.9091568767047516 0.9091568767047516)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.419078232891806 0)
"cameras" SET Transform eulerAngles (-10.833885786894445 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6705096928053187
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4920935203202434
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2853562146169104
"cameras/drone/drone0" SET Transform localPosition (0.899661656908928 0.686064625269164 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5541661268743382 0.9016838383690895 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -13 5)
"cameras/drone/drone0" SET Transform localScale (0.8961250220966548 0.8961250220966548 0.8961250220966548)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -15 -5)
"cameras/drone/drone1" SET Transform localScale (1.0215187249591613 1.0215187249591613 1.0215187249591613)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3978620973958895 0)
"cameras" SET Transform eulerAngles (13.342523920746686 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3360553800019375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4258235244494006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.022375109305766652
"cameras/drone/drone0" SET Transform localPosition (-0.2255149281788409 0.04277690980331411 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2566874184253636 1.2997058408836524 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 18 -5)
"cameras/drone/drone0" SET Transform localScale (1.46884137645407 1.46884137645407 1.46884137645407)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -3 14)
"cameras/drone/drone1" SET Transform localScale (0.7947244508807466 0.7947244508807466 0.7947244508807466)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.846695274858561 0)
"cameras" SET Transform eulerAngles (11.615699130097443 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9599106240298576
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0578714721885885
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1453361991850903
"cameras/drone/drone0" SET Transform localPosition (-0.8669274748668245 -0.0718688222530453 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8852629490105659 1.2303985887144084 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 10 -2)
"cameras/drone/drone0" SET Transform localScale (0.7440631749021474 0.7440631749021474 0.7440631749021474)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -14 19)
"cameras/drone/drone1" SET Transform localScale (0.730296864919151 0.730296864919151 0.730296864919151)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9348926937208217 0)
"cameras" SET Transform eulerAngles (-12.36449427512753 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3206684541424356
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1860714472358866
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.018497684620851284
"cameras/drone/drone0" SET Transform localPosition (0.15221817770043633 -0.07024965135655187 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8754791185260276 1.0238832367491295 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 16 13)
"cameras/drone/drone0" SET Transform localScale (0.6843804639006625 0.6843804639006625 0.6843804639006625)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -8 -1)
"cameras/drone/drone1" SET Transform localScale (0.875883986740734 0.875883986740734 0.875883986740734)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.54483124868332 0)
"cameras" SET Transform eulerAngles (-2.1298849043906927 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6537447387326417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3890192833372328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3513175401773364
"cameras/drone/drone0" SET Transform localPosition (1.0146307818586966 0.054142983623945706 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5359437488807669 1.2024412234333055 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -15 -10)
"cameras/drone/drone0" SET Transform localScale (0.9292413375653568 0.9292413375653568 0.9292413375653568)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -1 13)
"cameras/drone/drone1" SET Transform localScale (1.0849895211765257 1.0849895211765257 1.0849895211765257)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.813065740998253 0)
"cameras" SET Transform eulerAngles (-10.785977928384272 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7946869948331761
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.076147012951887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.030818657574263587
"cameras/drone/drone0" SET Transform localPosition (1.1245266043245923 -0.2849053767386845 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6721802387423386 0.8721239811678438 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 2 -10)
"cameras/drone/drone0" SET Transform localScale (1.1933220691428104 1.1933220691428104 1.1933220691428104)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -6 -7)
"cameras/drone/drone1" SET Transform localScale (0.9792095531007868 0.9792095531007868 0.9792095531007868)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5158641547276046 0)
"cameras" SET Transform eulerAngles (-10.848361660007203 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.763051523749904
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5728108685675295
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23627002776779205
"cameras/drone/drone0" SET Transform localPosition (-0.9649729532683742 0.6988776927023184 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6098005265256452 1.0276875732281945 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -12 -20)
"cameras/drone/drone0" SET Transform localScale (0.685956278575045 0.685956278575045 0.685956278575045)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 8 9)
"cameras/drone/drone1" SET Transform localScale (1.1224476144540048 1.1224476144540048 1.1224476144540048)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.804288578163739 0)
"cameras" SET Transform eulerAngles (-4.566376089083484 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4230630365001395
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6941924365686587
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3799943295199763
"cameras/drone/drone0" SET Transform localPosition (0.2302530108719032 0.3099945830476754 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9311435197581341 0.8035094368598527 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -11 -5)
"cameras/drone/drone0" SET Transform localScale (0.8408986190268442 0.8408986190268442 0.8408986190268442)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 11 12)
"cameras/drone/drone1" SET Transform localScale (0.9838806667033029 0.9838806667033029 0.9838806667033029)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.07189713353551 0)
"cameras" SET Transform eulerAngles (-0.028456356793100213 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1751442065862667
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.953450986982364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21794349659795037
"cameras/drone/drone0" SET Transform localPosition (-0.45367542744258504 0.1873385100300668 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9428455705670491 1.2680837081148075 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 14 -9)
"cameras/drone/drone0" SET Transform localScale (1.056613702208934 1.056613702208934 1.056613702208934)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 0 2)
"cameras/drone/drone1" SET Transform localScale (0.8699741809574237 0.8699741809574237 0.8699741809574237)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2817736359456324 0)
"cameras" SET Transform eulerAngles (-4.8374761010631 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7708345209803023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8080854311930168
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2406070045520267
"cameras/drone/drone0" SET Transform localPosition (-1.065827337273887 -0.0035451623620895156 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7163996233559855 0.9638719318094372 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 14 8)
"cameras/drone/drone0" SET Transform localScale (0.812254784007036 0.812254784007036 0.812254784007036)
"cameras/drone/drone1" SET Transform localEulerAngles (0 12 4)
"cameras/drone/drone1" SET Transform localScale (1.3914246583285026 1.3914246583285026 1.3914246583285026)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.398818452914373 0)
"cameras" SET Transform eulerAngles (13.727078156703492 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.429414389223088
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4517160510367542
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09636142790458241
"cameras/drone/drone0" SET Transform localPosition (0.0024366891471654384 -0.1413213385962509 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07421193859525399 1.019871340854875 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 19 19)
"cameras/drone/drone0" SET Transform localScale (0.7555669592130879 0.7555669592130879 0.7555669592130879)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 0 -16)
"cameras/drone/drone1" SET Transform localScale (1.1102342429495113 1.1102342429495113 1.1102342429495113)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4247907291993185 0)
"cameras" SET Transform eulerAngles (-5.7507041076259355 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5296461324636141
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7277993413234884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.022656330894193968
"cameras/drone/drone0" SET Transform localPosition (-0.023244513405052958 0.6052624228591423 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.01871799556919318 0.8484502953346796 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -11 5)
"cameras/drone/drone0" SET Transform localScale (1.4208541281974791 1.4208541281974791 1.4208541281974791)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 17 13)
"cameras/drone/drone1" SET Transform localScale (0.6091367018332695 0.6091367018332695 0.6091367018332695)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.450031985295685 0)
"cameras" SET Transform eulerAngles (19.484934124318528 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8596504987362352
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4230217691618172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3052586702194789
"cameras/drone/drone0" SET Transform localPosition (0.49377529010562826 -0.102664616343835 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5253767467600237 1.2284897490575108 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 9 -1)
"cameras/drone/drone0" SET Transform localScale (1.2995389397625492 1.2995389397625492 1.2995389397625492)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -13 -19)
"cameras/drone/drone1" SET Transform localScale (0.9918565748447552 0.9918565748447552 0.9918565748447552)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0838055381795395 0)
"cameras" SET Transform eulerAngles (-8.988716191508992 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.043770488655016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9714224547661177
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03368778464989055
"cameras/drone/drone0" SET Transform localPosition (-0.01744261217680676 0.5948997960374427 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.39410783574327013 0.8177826971045403 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -14 18)
"cameras/drone/drone0" SET Transform localScale (1.1666345140040337 1.1666345140040337 1.1666345140040337)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -13 -5)
"cameras/drone/drone1" SET Transform localScale (1.259702544681153 1.259702544681153 1.259702544681153)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.390080573714811 0)
"cameras" SET Transform eulerAngles (15.450897600912946 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.512336039112891
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0500963838301256
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1079925243051771
"cameras/drone/drone0" SET Transform localPosition (1.1332298503149347 -0.07733502154506428 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5848097215511423 1.2814606408380567 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -12 -10)
"cameras/drone/drone0" SET Transform localScale (1.0693555625951627 1.0693555625951627 1.0693555625951627)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 0 11)
"cameras/drone/drone1" SET Transform localScale (1.1534148070147943 1.1534148070147943 1.1534148070147943)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.359793767788593 0)
"cameras" SET Transform eulerAngles (1.4245726172312523 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5874123112718107
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9671111765879186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12555315755176907
"cameras/drone/drone0" SET Transform localPosition (-0.5045556348496728 0.24603339529759277 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3501336789978825 1.0676654218844952 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 8 0)
"cameras/drone/drone0" SET Transform localScale (1.4647055840913858 1.4647055840913858 1.4647055840913858)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -7 19)
"cameras/drone/drone1" SET Transform localScale (1.266928335301496 1.266928335301496 1.266928335301496)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.58336718364472 0)
"cameras" SET Transform eulerAngles (-18.432174652061356 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9762884169100409
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7798330722207938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13532500641528317
"cameras/drone/drone0" SET Transform localPosition (-0.8791339260125461 0.040128117259993046 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8233707691397889 1.277501135843841 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -14 19)
"cameras/drone/drone0" SET Transform localScale (0.6808378206141074 0.6808378206141074 0.6808378206141074)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -9 14)
"cameras/drone/drone1" SET Transform localScale (0.8677218900707512 0.8677218900707512 0.8677218900707512)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.522086754938695 0)
"cameras" SET Transform eulerAngles (-15.453655349320208 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1860232421764043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3242205610968696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34911539853134843
"cameras/drone/drone0" SET Transform localPosition (-0.8681191550177524 0.020960240659624374 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7932698555673283 0.8898184323125049 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -16 -19)
"cameras/drone/drone0" SET Transform localScale (1.4383556936182735 1.4383556936182735 1.4383556936182735)
"cameras/drone/drone1" SET Transform localEulerAngles (6 0 -14)
"cameras/drone/drone1" SET Transform localScale (0.7970004016862726 0.7970004016862726 0.7970004016862726)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.803530282249773 0)
"cameras" SET Transform eulerAngles (-15.40391567290905 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9816068608936052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9249844799261571
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19405666283090783
"cameras/drone/drone0" SET Transform localPosition (-0.9325386743273979 0.07526244482231809 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2379274660115127 0.9647712086449771 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -3 6)
"cameras/drone/drone0" SET Transform localScale (1.276949032002476 1.276949032002476 1.276949032002476)
"cameras/drone/drone1" SET Transform localEulerAngles (13 1 15)
"cameras/drone/drone1" SET Transform localScale (0.879563506480543 0.879563506480543 0.879563506480543)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4170288932819455 0)
"cameras" SET Transform eulerAngles (-14.825439177378206 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7307123948038573
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.912495204791659
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0846186378882881
"cameras/drone/drone0" SET Transform localPosition (0.22994277079776237 0.2968590244818376 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0390759780771164 1.2438332116729238 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -14 13)
"cameras/drone/drone0" SET Transform localScale (0.6247966603369315 0.6247966603369315 0.6247966603369315)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 10 -7)
"cameras/drone/drone1" SET Transform localScale (1.3854223731293316 1.3854223731293316 1.3854223731293316)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.332331833670869 0)
"cameras" SET Transform eulerAngles (-4.749135355481023 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9275633183765666
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0693378807636498
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10334127968301408
"cameras/drone/drone0" SET Transform localPosition (0.5222612467581826 -0.013524989392742992 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2252346920480215 0.9265640623268949 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 8 -4)
"cameras/drone/drone0" SET Transform localScale (1.2096667331372182 1.2096667331372182 1.2096667331372182)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 13 -11)
"cameras/drone/drone1" SET Transform localScale (0.6256783725529806 0.6256783725529806 0.6256783725529806)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7974786350249508 0)
"cameras" SET Transform eulerAngles (-12.383395695063374 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.034016264350556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.536339545081987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11453076207396894
"cameras/drone/drone0" SET Transform localPosition (-0.6392600159105444 0.5851979959864246 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.45336799446059883 1.1634943206179165 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 12 -15)
"cameras/drone/drone0" SET Transform localScale (0.7983859257256157 0.7983859257256157 0.7983859257256157)
"cameras/drone/drone1" SET Transform localEulerAngles (9 3 -14)
"cameras/drone/drone1" SET Transform localScale (1.4989544274747293 1.4989544274747293 1.4989544274747293)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.485388730534261 0)
"cameras" SET Transform eulerAngles (12.182220506055792 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7582612890378224
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6860142103101947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1820322626230384
"cameras/drone/drone0" SET Transform localPosition (-0.35203181447959697 0.652507104753137 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.06114777650993175 1.1136579056377487 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 3 9)
"cameras/drone/drone0" SET Transform localScale (0.687196809710128 0.687196809710128 0.687196809710128)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -11 17)
"cameras/drone/drone1" SET Transform localScale (1.2841405998332887 1.2841405998332887 1.2841405998332887)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.871864010726453 0)
"cameras" SET Transform eulerAngles (-3.7401161777362866 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5441303749849639
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.010586960567148
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11919830544243744
"cameras/drone/drone0" SET Transform localPosition (0.39443842805689866 0.2338893490780038 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1044201292746636 0.8552259820102924 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -1 0)
"cameras/drone/drone0" SET Transform localScale (0.6313132082873926 0.6313132082873926 0.6313132082873926)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -9 -3)
"cameras/drone/drone1" SET Transform localScale (0.738898161129583 0.738898161129583 0.738898161129583)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.266589656006124 0)
"cameras" SET Transform eulerAngles (-13.3975450294156 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8718544158375142
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4420142860686893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0917519420557841
"cameras/drone/drone0" SET Transform localPosition (-0.17078309316405682 0.004703342479496719 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0047072974805225 1.2070907784239555 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -14 -15)
"cameras/drone/drone0" SET Transform localScale (0.8442174782705857 0.8442174782705857 0.8442174782705857)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -5 -14)
"cameras/drone/drone1" SET Transform localScale (1.4418079977232536 1.4418079977232536 1.4418079977232536)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.015509222941926 0)
"cameras" SET Transform eulerAngles (-9.35246307099337 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.36845352798384
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.017187397291079
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25955019370808774
"cameras/drone/drone0" SET Transform localPosition (-1.0202714198760519 -0.10188971820551879 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0026633385656236186 1.2474130166185933 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 8 -8)
"cameras/drone/drone0" SET Transform localScale (1.3957585533662509 1.3957585533662509 1.3957585533662509)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -13 3)
"cameras/drone/drone1" SET Transform localScale (1.2441238126027456 1.2441238126027456 1.2441238126027456)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.36538165908359 0)
"cameras" SET Transform eulerAngles (-3.4256230282126587 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6816353779836202
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.521995173803526
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2542479974500467
"cameras/drone/drone0" SET Transform localPosition (0.49083513487482233 0.24818249332572134 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0058647814136707 0.8687401354126807 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -9 10)
"cameras/drone/drone0" SET Transform localScale (1.4735704537223828 1.4735704537223828 1.4735704537223828)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 9 -12)
"cameras/drone/drone1" SET Transform localScale (0.7520338247133904 0.7520338247133904 0.7520338247133904)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.548497086232209 0)
"cameras" SET Transform eulerAngles (-16.93115983739286 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5755477619391358
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5163060584391783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3360994208788651
"cameras/drone/drone0" SET Transform localPosition (0.013267757188683671 0.43663401617680847 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0487502354427478 0.9759032982335827 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 6 -2)
"cameras/drone/drone0" SET Transform localScale (1.3669621926493252 1.3669621926493252 1.3669621926493252)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 4 -7)
"cameras/drone/drone1" SET Transform localScale (0.7609784833796683 0.7609784833796683 0.7609784833796683)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.794054749847528 0)
"cameras" SET Transform eulerAngles (1.6644595760989276 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.429308573115236
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2754558372720606
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3931331172688538
"cameras/drone/drone0" SET Transform localPosition (-0.07546929561462634 -0.008619400306485392 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.33040440616870037 1.0936208305447068 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -17 0)
"cameras/drone/drone0" SET Transform localScale (0.6763585375336287 0.6763585375336287 0.6763585375336287)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 19 -19)
"cameras/drone/drone1" SET Transform localScale (0.6870622352935573 0.6870622352935573 0.6870622352935573)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.406245017960557 0)
"cameras" SET Transform eulerAngles (-17.588940724907637 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3171078428396719
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2510579892031597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.007868574941838836
"cameras/drone/drone0" SET Transform localPosition (-0.2354687043545518 0.602575626248929 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0867152703451883 0.8116315346843264 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -2 -15)
"cameras/drone/drone0" SET Transform localScale (1.4834782464656389 1.4834782464656389 1.4834782464656389)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -9 1)
"cameras/drone/drone1" SET Transform localScale (1.3505533895408237 1.3505533895408237 1.3505533895408237)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.232847247291495 0)
"cameras" SET Transform eulerAngles (-10.569100057329068 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5341663743347538
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9888622315125775
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22352844435922067
"cameras/drone/drone0" SET Transform localPosition (0.6138381013628043 -0.18912493250099033 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7880798922985592 1.2152126761531425 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 7 12)
"cameras/drone/drone0" SET Transform localScale (0.6720868702768916 0.6720868702768916 0.6720868702768916)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 15 -14)
"cameras/drone/drone1" SET Transform localScale (1.1930342976740773 1.1930342976740773 1.1930342976740773)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2650811807517206 0)
"cameras" SET Transform eulerAngles (-7.81209815555998 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43427978961378033
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.352153576418854
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08895172997346129
"cameras/drone/drone0" SET Transform localPosition (-0.563012209140913 -0.2104812505105364 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5535187041172693 0.9321315894872066 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 11 -14)
"cameras/drone/drone0" SET Transform localScale (1.0617976618523324 1.0617976618523324 1.0617976618523324)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -14 -2)
"cameras/drone/drone1" SET Transform localScale (0.8058513628807273 0.8058513628807273 0.8058513628807273)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.981829157507704 0)
"cameras" SET Transform eulerAngles (2.412161175496699 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4361564841541554
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9014123995895682
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.021360144178900954
"cameras/drone/drone0" SET Transform localPosition (0.29716440085021145 0.28447252671953344 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4412525993799301 1.202076350245899 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -15 -9)
"cameras/drone/drone0" SET Transform localScale (1.1129209380441332 1.1129209380441332 1.1129209380441332)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -6 -20)
"cameras/drone/drone1" SET Transform localScale (0.6383494020345276 0.6383494020345276 0.6383494020345276)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0557260109107025 0)
"cameras" SET Transform eulerAngles (19.146624983796208 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.481664316378942
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9786183924717626
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.324938087735481
"cameras/drone/drone0" SET Transform localPosition (1.0592593742001972 0.3238116440481282 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6438350413920173 0.9355928478657076 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 7 11)
"cameras/drone/drone0" SET Transform localScale (1.0426923698691126 1.0426923698691126 1.0426923698691126)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 2 13)
"cameras/drone/drone1" SET Transform localScale (1.4707673882099705 1.4707673882099705 1.4707673882099705)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9151374354514212 0)
"cameras" SET Transform eulerAngles (-16.96107603398785 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4815376113897036
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.806031216025914
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31931961090625033
"cameras/drone/drone0" SET Transform localPosition (0.10423214104918443 0.5626218749893952 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9339064742041356 1.16207882701796 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 12 -12)
"cameras/drone/drone0" SET Transform localScale (1.1985579439616698 1.1985579439616698 1.1985579439616698)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -19 10)
"cameras/drone/drone1" SET Transform localScale (0.6024283011401635 0.6024283011401635 0.6024283011401635)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8940220311664158 0)
"cameras" SET Transform eulerAngles (14.364821246664562 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.302981175038902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7801688141154282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39085874663968817
"cameras/drone/drone0" SET Transform localPosition (1.0069868066461336 0.6849229142215318 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9879192480261969 0.8438392493944364 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -3 2)
"cameras/drone/drone0" SET Transform localScale (1.347168306851616 1.347168306851616 1.347168306851616)
"cameras/drone/drone1" SET Transform localEulerAngles (4 3 13)
"cameras/drone/drone1" SET Transform localScale (1.2954596350561003 1.2954596350561003 1.2954596350561003)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.254525689578518 0)
"cameras" SET Transform eulerAngles (8.135324063475636 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1443610189109976
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.320568273986656
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.051151839042764505
"cameras/drone/drone0" SET Transform localPosition (0.7874764483924634 0.13045708723609 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04665967150759931 1.122317781179553 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 15 -16)
"cameras/drone/drone0" SET Transform localScale (0.8681180936353736 0.8681180936353736 0.8681180936353736)
"cameras/drone/drone1" SET Transform localEulerAngles (10 2 10)
"cameras/drone/drone1" SET Transform localScale (1.0475977688820273 1.0475977688820273 1.0475977688820273)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6495334586358887 0)
"cameras" SET Transform eulerAngles (-6.6989927957702555 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6394952334233447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.580358575264703
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04647379923437276
"cameras/drone/drone0" SET Transform localPosition (0.7205945157456626 -0.17763153571142293 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8853534668060525 1.170846524643148 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -4 13)
"cameras/drone/drone0" SET Transform localScale (0.6187165118753173 0.6187165118753173 0.6187165118753173)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -20 2)
"cameras/drone/drone1" SET Transform localScale (1.1407030585293132 1.1407030585293132 1.1407030585293132)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8799393261867587 0)
"cameras" SET Transform eulerAngles (8.847125998144008 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5153318281091408
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0667772230119552
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37923567364250177
"cameras/drone/drone0" SET Transform localPosition (-0.6540627959937148 0.66048509489456 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6403035279586533 0.8421332587532164 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -16 -1)
"cameras/drone/drone0" SET Transform localScale (0.7326318346365795 0.7326318346365795 0.7326318346365795)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -16 4)
"cameras/drone/drone1" SET Transform localScale (1.2085147164469734 1.2085147164469734 1.2085147164469734)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.156291189139286 0)
"cameras" SET Transform eulerAngles (18.69016097544541 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8938052954536098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.721306905189927
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06796030520779715
"cameras/drone/drone0" SET Transform localPosition (-0.7204271572545529 0.29401005491102267 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4500105678646713 1.0384380761272927 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -19 7)
"cameras/drone/drone0" SET Transform localScale (1.183394860864911 1.183394860864911 1.183394860864911)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -17 3)
"cameras/drone/drone1" SET Transform localScale (1.2778744069244992 1.2778744069244992 1.2778744069244992)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.600638413831986 0)
"cameras" SET Transform eulerAngles (13.668955812804306 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7988750992802283
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2354801301270402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05595714420726936
"cameras/drone/drone0" SET Transform localPosition (-1.167221775098781 0.3614550325632692 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.21525734121432083 1.009811378605383 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -10 -8)
"cameras/drone/drone0" SET Transform localScale (0.9745881901993971 0.9745881901993971 0.9745881901993971)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -10 -2)
"cameras/drone/drone1" SET Transform localScale (1.4466708533618229 1.4466708533618229 1.4466708533618229)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.247596900239632 0)
"cameras" SET Transform eulerAngles (1.7378243776694902 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5476978590958139
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9306507499532013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13276121155752027
"cameras/drone/drone0" SET Transform localPosition (-0.6987175274509126 0.07666727833866932 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6636034226784573 0.8231938037303461 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 14 -17)
"cameras/drone/drone0" SET Transform localScale (0.602726778556596 0.602726778556596 0.602726778556596)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -14 -20)
"cameras/drone/drone1" SET Transform localScale (0.8623044575352936 0.8623044575352936 0.8623044575352936)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.498276753702543 0)
"cameras" SET Transform eulerAngles (7.891441635062581 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9381852329885375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.241948397349426
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3871138404525761
"cameras/drone/drone0" SET Transform localPosition (-0.6165111871193619 0.15288340162730824 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.674538374858345 0.9709096871920794 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -7 2)
"cameras/drone/drone0" SET Transform localScale (1.1393106271952473 1.1393106271952473 1.1393106271952473)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -7 14)
"cameras/drone/drone1" SET Transform localScale (0.8619719407652904 0.8619719407652904 0.8619719407652904)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.705553592721822 0)
"cameras" SET Transform eulerAngles (1.9531781637438002 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7213390674050413
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9436553601247271
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21046744157219674
"cameras/drone/drone0" SET Transform localPosition (-0.6141467002249228 0.024740988936103492 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1455303054210637 0.9254880503502185 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -6 -1)
"cameras/drone/drone0" SET Transform localScale (0.6819030885062043 0.6819030885062043 0.6819030885062043)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 4 13)
"cameras/drone/drone1" SET Transform localScale (0.8716445633234107 0.8716445633234107 0.8716445633234107)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.409837971024059 0)
"cameras" SET Transform eulerAngles (-18.426734674400876 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6351275463675863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6807409758216794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09544134440163005
"cameras/drone/drone0" SET Transform localPosition (-1.0792014372694412 0.31841380173307293 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6586186036776185 1.207011565178 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -10 -14)
"cameras/drone/drone0" SET Transform localScale (0.9676797124525836 0.9676797124525836 0.9676797124525836)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 12 10)
"cameras/drone/drone1" SET Transform localScale (0.6853745078844976 0.6853745078844976 0.6853745078844976)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.808689779105655 0)
"cameras" SET Transform eulerAngles (11.343807887305864 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1636691860696067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.546712480731426
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12158906160060257
"cameras/drone/drone0" SET Transform localPosition (1.1394990802024776 0.14592818359551946 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1240491388101217 1.2772309461848161 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -15 -14)
"cameras/drone/drone0" SET Transform localScale (0.7499454999167331 0.7499454999167331 0.7499454999167331)
"cameras/drone/drone1" SET Transform localEulerAngles (1 10 7)
"cameras/drone/drone1" SET Transform localScale (0.6616317674721742 0.6616317674721742 0.6616317674721742)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.55517008580771 0)
"cameras" SET Transform eulerAngles (-0.22183330719904504 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.717910599749369
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.977595287658712
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27968089106483507
"cameras/drone/drone0" SET Transform localPosition (0.20167945133353626 0.36117700114104695 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0534329358160017 1.2063774296794607 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -7 -16)
"cameras/drone/drone0" SET Transform localScale (0.98492736688502 0.98492736688502 0.98492736688502)
"cameras/drone/drone1" SET Transform localEulerAngles (3 1 4)
"cameras/drone/drone1" SET Transform localScale (1.1802599960426807 1.1802599960426807 1.1802599960426807)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8252390122089457 0)
"cameras" SET Transform eulerAngles (5.278411554984821 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44216430843739984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0942123655208038
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.352982253134252
"cameras/drone/drone0" SET Transform localPosition (0.9078145900637737 0.48950486188376435 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07535233069316871 1.1864273572233075 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -13 -20)
"cameras/drone/drone0" SET Transform localScale (0.9074223807821595 0.9074223807821595 0.9074223807821595)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 18 9)
"cameras/drone/drone1" SET Transform localScale (1.3608436050496717 1.3608436050496717 1.3608436050496717)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.244615595100753 0)
"cameras" SET Transform eulerAngles (0.32509998613409863 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2680679818554363
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8249075810494895
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0096733385191917
"cameras/drone/drone0" SET Transform localPosition (-0.6873463792414666 0.4948504068601561 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19810407038247546 0.8502692050170289 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -17 5)
"cameras/drone/drone0" SET Transform localScale (1.223004753060159 1.223004753060159 1.223004753060159)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 8 -6)
"cameras/drone/drone1" SET Transform localScale (1.0405210349738372 1.0405210349738372 1.0405210349738372)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0265480949715196 0)
"cameras" SET Transform eulerAngles (3.014492724743377 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5303207877187543
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.735683199892899
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2709110103306345
"cameras/drone/drone0" SET Transform localPosition (0.28226177480441317 0.24582339193924446 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8702266668566523 1.218534216406598 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 13 19)
"cameras/drone/drone0" SET Transform localScale (1.378148019376787 1.378148019376787 1.378148019376787)
"cameras/drone/drone1" SET Transform localEulerAngles (15 19 15)
"cameras/drone/drone1" SET Transform localScale (0.6573156551273187 0.6573156551273187 0.6573156551273187)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.725948108745666 0)
"cameras" SET Transform eulerAngles (-14.038543244864897 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6279553013513786
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4132204827559893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2802799031181675
"cameras/drone/drone0" SET Transform localPosition (0.9436568999365742 0.5677902514319044 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18758075326936896 1.2573027670042969 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 12 -2)
"cameras/drone/drone0" SET Transform localScale (0.8191058749943095 0.8191058749943095 0.8191058749943095)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -17 5)
"cameras/drone/drone1" SET Transform localScale (0.9359065138907894 0.9359065138907894 0.9359065138907894)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.995725099717802 0)
"cameras" SET Transform eulerAngles (12.583064745648336 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6598755599961628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5077741448166004
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10295219874349618
"cameras/drone/drone0" SET Transform localPosition (0.9433200126794976 -0.18310973667770208 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.23004444433656857 1.0887600410699456 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -19 -7)
"cameras/drone/drone0" SET Transform localScale (0.8399172981037507 0.8399172981037507 0.8399172981037507)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 5 -11)
"cameras/drone/drone1" SET Transform localScale (1.2218309694396874 1.2218309694396874 1.2218309694396874)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3278061824060794 0)
"cameras" SET Transform eulerAngles (-1.9542883711689427 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8758950857645548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2272284357742431
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.028244274368959845
"cameras/drone/drone0" SET Transform localPosition (0.09315736233890837 0.00200809400120322 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5050137895424635 1.2075939324302838 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -17 16)
"cameras/drone/drone0" SET Transform localScale (0.7568110589734961 0.7568110589734961 0.7568110589734961)
"cameras/drone/drone1" SET Transform localEulerAngles (18 1 -4)
"cameras/drone/drone1" SET Transform localScale (1.1791062840704534 1.1791062840704534 1.1791062840704534)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.746586018266515 0)
"cameras" SET Transform eulerAngles (1.1312150901374096 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9061213201962668
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5595320562462118
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.175265589386869
"cameras/drone/drone0" SET Transform localPosition (0.43833152928186014 0.4217352346795252 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.810454023855236 1.2439174886188207 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 13 7)
"cameras/drone/drone0" SET Transform localScale (0.9376147783687556 0.9376147783687556 0.9376147783687556)
"cameras/drone/drone1" SET Transform localEulerAngles (20 19 20)
"cameras/drone/drone1" SET Transform localScale (1.4388717059912082 1.4388717059912082 1.4388717059912082)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.257396205098146 0)
"cameras" SET Transform eulerAngles (-16.64143786285457 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8185375935723049
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.137767636891675
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11726119357718874
"cameras/drone/drone0" SET Transform localPosition (0.07184115690793691 0.18127254742882698 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2335964893978344 1.0784214272439203 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -5 9)
"cameras/drone/drone0" SET Transform localScale (0.823587431182632 0.823587431182632 0.823587431182632)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 0 16)
"cameras/drone/drone1" SET Transform localScale (1.1496426813610532 1.1496426813610532 1.1496426813610532)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.29519709066162 0)
"cameras" SET Transform eulerAngles (-13.37285857690103 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47841754870101266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9195629797931533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02347082475047726
"cameras/drone/drone0" SET Transform localPosition (-0.5126038558322336 -0.015661102577513353 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5392409912578989 1.2194765238564285 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 18 -15)
"cameras/drone/drone0" SET Transform localScale (1.0168659790026906 1.0168659790026906 1.0168659790026906)
"cameras/drone/drone1" SET Transform localEulerAngles (0 17 12)
"cameras/drone/drone1" SET Transform localScale (0.9411502296737191 0.9411502296737191 0.9411502296737191)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5090619403667285 0)
"cameras" SET Transform eulerAngles (-7.84427052226707 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6442414579095457
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1612595274757629
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05307468719967981
"cameras/drone/drone0" SET Transform localPosition (0.36647411233832994 -0.05749451928196575 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0835160607939571 1.0456295314217499 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -19 -4)
"cameras/drone/drone0" SET Transform localScale (0.7841818693788972 0.7841818693788972 0.7841818693788972)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -17 -15)
"cameras/drone/drone1" SET Transform localScale (0.8334186428916929 0.8334186428916929 0.8334186428916929)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.126585898656693 0)
"cameras" SET Transform eulerAngles (-15.31311960735836 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.363373288639122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5778586969381663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09224704387223032
"cameras/drone/drone0" SET Transform localPosition (0.1086861663782408 0.6115862647073811 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.418555990558962 1.1046335958248281 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 10 -8)
"cameras/drone/drone0" SET Transform localScale (0.8628883072091378 0.8628883072091378 0.8628883072091378)
"cameras/drone/drone1" SET Transform localEulerAngles (19 9 -6)
"cameras/drone/drone1" SET Transform localScale (1.395169203710639 1.395169203710639 1.395169203710639)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.871339164104007 0)
"cameras" SET Transform eulerAngles (-10.666457407456607 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1283614130480752
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.427723157101022
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2981986673762974
"cameras/drone/drone0" SET Transform localPosition (-1.0938347283988747 -0.1021951508168159 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09207258363402104 0.9060162964804617 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -4 16)
"cameras/drone/drone0" SET Transform localScale (1.0066610817807573 1.0066610817807573 1.0066610817807573)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -4 2)
"cameras/drone/drone1" SET Transform localScale (1.4577053275398129 1.4577053275398129 1.4577053275398129)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.161739216761867 0)
"cameras" SET Transform eulerAngles (3.805893266472573 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5240773407664059
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5974737695314678
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3068066361078281
"cameras/drone/drone0" SET Transform localPosition (-0.10826704468655679 0.29685834615648204 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.766193062539928 1.1824000517280218 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 18 0)
"cameras/drone/drone0" SET Transform localScale (0.7525007040152849 0.7525007040152849 0.7525007040152849)
"cameras/drone/drone1" SET Transform localEulerAngles (18 12 -5)
"cameras/drone/drone1" SET Transform localScale (0.8822764191277149 0.8822764191277149 0.8822764191277149)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.702675939794152 0)
"cameras" SET Transform eulerAngles (10.742185258588783 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7089549333788415
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7844229155020912
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29362843177633147
"cameras/drone/drone0" SET Transform localPosition (0.38354783175149376 0.05658662368760531 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07483467747004946 1.2680079181725716 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 15 10)
"cameras/drone/drone0" SET Transform localScale (0.6014891111955423 0.6014891111955423 0.6014891111955423)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -13 9)
"cameras/drone/drone1" SET Transform localScale (0.8717568585525046 0.8717568585525046 0.8717568585525046)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7211149658013873 0)
"cameras" SET Transform eulerAngles (-4.5646033154222465 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4214213586293263
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.373126384840861
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05404001607130807
"cameras/drone/drone0" SET Transform localPosition (-0.17430582117769244 0.01641398436091629 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10383705127408893 1.1734745970492482 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -16 -13)
"cameras/drone/drone0" SET Transform localScale (0.9484472163694593 0.9484472163694593 0.9484472163694593)
"cameras/drone/drone1" SET Transform localEulerAngles (9 14 18)
"cameras/drone/drone1" SET Transform localScale (1.0522689950834931 1.0522689950834931 1.0522689950834931)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.297578328640462 0)
"cameras" SET Transform eulerAngles (14.299294956355844 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4197856543308398
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0969407156385702
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24582671275451096
"cameras/drone/drone0" SET Transform localPosition (-0.03171240626712124 0.2978658038235798 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1494433142676634 0.9818295585281994 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -8 1)
"cameras/drone/drone0" SET Transform localScale (0.85408248289641 0.85408248289641 0.85408248289641)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -1 9)
"cameras/drone/drone1" SET Transform localScale (0.6817175937057017 0.6817175937057017 0.6817175937057017)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.352468529050462 0)
"cameras" SET Transform eulerAngles (7.375914043193539 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9466354470792866
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5315556088126416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37377501481639475
"cameras/drone/drone0" SET Transform localPosition (1.0566672048516648 -0.2843297389424046 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8810421472912118 0.9076293133714451 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -7 6)
"cameras/drone/drone0" SET Transform localScale (1.0781910919593456 1.0781910919593456 1.0781910919593456)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -11 16)
"cameras/drone/drone1" SET Transform localScale (0.6431822159183238 0.6431822159183238 0.6431822159183238)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4840789452272958 0)
"cameras" SET Transform eulerAngles (-17.927551549495103 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4406466501888109
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7249261169185992
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11245862074198879
"cameras/drone/drone0" SET Transform localPosition (0.08263927281654349 0.4033040252788784 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5989928975884732 1.1353512045260072 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 5 -10)
"cameras/drone/drone0" SET Transform localScale (1.3681857296780429 1.3681857296780429 1.3681857296780429)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -7 -5)
"cameras/drone/drone1" SET Transform localScale (0.7713938866417588 0.7713938866417588 0.7713938866417588)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1327530530735124 0)
"cameras" SET Transform eulerAngles (-3.364612197522323 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5160389049798627
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3715015460904199
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0690299185107841
"cameras/drone/drone0" SET Transform localPosition (0.19911120409532668 -0.23575700556926577 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5920415311721614 1.2889793026131984 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -8 15)
"cameras/drone/drone0" SET Transform localScale (0.9411629961583818 0.9411629961583818 0.9411629961583818)
"cameras/drone/drone1" SET Transform localEulerAngles (13 4 15)
"cameras/drone/drone1" SET Transform localScale (0.7644260418154739 0.7644260418154739 0.7644260418154739)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.267436579317568 0)
"cameras" SET Transform eulerAngles (7.862454837817836 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2626793026498149
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6044128296203868
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.012673898466644086
"cameras/drone/drone0" SET Transform localPosition (0.7617087702154974 0.08259507231256152 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.89983884577076 1.0114916849074804 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -4 -15)
"cameras/drone/drone0" SET Transform localScale (1.4187542042987666 1.4187542042987666 1.4187542042987666)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -4 -3)
"cameras/drone/drone1" SET Transform localScale (0.6970221880698453 0.6970221880698453 0.6970221880698453)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.450327747619509 0)
"cameras" SET Transform eulerAngles (-10.699079361107842 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6580748406105439
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5011165721120778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15609272863322965
"cameras/drone/drone0" SET Transform localPosition (0.5274133343785707 0.6176101339733591 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1534572885848735 0.811068185919504 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 11 1)
"cameras/drone/drone0" SET Transform localScale (1.0403154589806447 1.0403154589806447 1.0403154589806447)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -10 -1)
"cameras/drone/drone1" SET Transform localScale (0.894699897311839 0.894699897311839 0.894699897311839)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1431928385307515 0)
"cameras" SET Transform eulerAngles (4.567449946323379 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6908883917037898
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9756403956748207
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37633778682550206
"cameras/drone/drone0" SET Transform localPosition (-0.5742938089005946 0.607388029218241 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22310443677597602 1.14511034943124 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 7 18)
"cameras/drone/drone0" SET Transform localScale (1.142229111054215 1.142229111054215 1.142229111054215)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 1 1)
"cameras/drone/drone1" SET Transform localScale (1.3501596296756462 1.3501596296756462 1.3501596296756462)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7262305220549967 0)
"cameras" SET Transform eulerAngles (-0.07867826512127252 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6338989549832891
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1776875491826173
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08618500325011175
"cameras/drone/drone0" SET Transform localPosition (-0.6086974050859941 0.24342538630920357 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0284987032933006 1.0505787874941483 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 17 10)
"cameras/drone/drone0" SET Transform localScale (0.8886160546640995 0.8886160546640995 0.8886160546640995)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -11 -5)
"cameras/drone/drone1" SET Transform localScale (1.1392820264214178 1.1392820264214178 1.1392820264214178)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.283114254796447 0)
"cameras" SET Transform eulerAngles (13.571644866538456 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4324311057767801
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0699319333347097
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35614238280765326
"cameras/drone/drone0" SET Transform localPosition (0.2016021058658073 -0.25905813362111424 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7277258162857387 1.1967040365467452 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 18 0)
"cameras/drone/drone0" SET Transform localScale (0.8486942704115691 0.8486942704115691 0.8486942704115691)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 8 16)
"cameras/drone/drone1" SET Transform localScale (0.8143317974072427 0.8143317974072427 0.8143317974072427)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6358903062514916 0)
"cameras" SET Transform eulerAngles (-1.638937647856146 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5431054267743163
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5763785242232142
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21767654147653992
"cameras/drone/drone0" SET Transform localPosition (0.4689055403176525 0.608051810814592 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2725113747567458 1.293479608590791 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -15 16)
"cameras/drone/drone0" SET Transform localScale (1.4167934994107467 1.4167934994107467 1.4167934994107467)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 10 9)
"cameras/drone/drone1" SET Transform localScale (1.1402389550966388 1.1402389550966388 1.1402389550966388)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.803049203496755 0)
"cameras" SET Transform eulerAngles (-10.49726165155076 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3289489487861617
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6855182131437134
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12239010891178732
"cameras/drone/drone0" SET Transform localPosition (0.7536015729894849 0.6589714263468798 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.23068679530765623 1.2785786843224007 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 4 -12)
"cameras/drone/drone0" SET Transform localScale (0.95348938862449 0.95348938862449 0.95348938862449)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -4 -17)
"cameras/drone/drone1" SET Transform localScale (0.7885402895434628 0.7885402895434628 0.7885402895434628)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7706651190105305 0)
"cameras" SET Transform eulerAngles (-13.16437744985263 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5690210086311387
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9633474849087094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32507155424183953
"cameras/drone/drone0" SET Transform localPosition (-0.2630831434840204 -0.14091970187081954 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0633599018493587 1.1171606048100284 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 2 10)
"cameras/drone/drone0" SET Transform localScale (0.9242009001836886 0.9242009001836886 0.9242009001836886)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -11 -20)
"cameras/drone/drone1" SET Transform localScale (0.98671995301865 0.98671995301865 0.98671995301865)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6045768067099715 0)
"cameras" SET Transform eulerAngles (-19.081802268991922 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1652653186936304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9078685677753366
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3226598054103845
"cameras/drone/drone0" SET Transform localPosition (-0.7428527623037756 0.08336792028586376 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.052705773199650086 0.9626442292360501 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 13 11)
"cameras/drone/drone0" SET Transform localScale (1.4303262250728508 1.4303262250728508 1.4303262250728508)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -16 1)
"cameras/drone/drone1" SET Transform localScale (1.4494100047621905 1.4494100047621905 1.4494100047621905)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.66099104591147 0)
"cameras" SET Transform eulerAngles (-15.652639967975919 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2352225734501816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4606163180763656
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08477855275918894
"cameras/drone/drone0" SET Transform localPosition (-0.7294008093308568 0.44151308187913235 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6743868812065676 0.907446528272424 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 7 5)
"cameras/drone/drone0" SET Transform localScale (1.039033268626029 1.039033268626029 1.039033268626029)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -11 0)
"cameras/drone/drone1" SET Transform localScale (1.1546294266331278 1.1546294266331278 1.1546294266331278)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5336008529779956 0)
"cameras" SET Transform eulerAngles (-16.941697401072 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7148028862435651
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2466572156571973
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.019944840583734937
"cameras/drone/drone0" SET Transform localPosition (-0.9697986865305755 0.5981567444446418 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9868368566460648 1.1956576151915403 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -13 9)
"cameras/drone/drone0" SET Transform localScale (0.8251638568719221 0.8251638568719221 0.8251638568719221)
"cameras/drone/drone1" SET Transform localEulerAngles (9 11 1)
"cameras/drone/drone1" SET Transform localScale (1.4175782974738231 1.4175782974738231 1.4175782974738231)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.514362984333127 0)
"cameras" SET Transform eulerAngles (-1.3271926124794255 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7308947182534327
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3849014976989722
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16815539440498375
"cameras/drone/drone0" SET Transform localPosition (0.12200203584623859 0.31393797483811764 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17955113631562636 0.9419268854315189 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -16 11)
"cameras/drone/drone0" SET Transform localScale (0.9603533438037538 0.9603533438037538 0.9603533438037538)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -6 16)
"cameras/drone/drone1" SET Transform localScale (0.6254893231707987 0.6254893231707987 0.6254893231707987)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7407977809854 0)
"cameras" SET Transform eulerAngles (-13.857421818893272 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2298585364498646
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4863184044296358
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0973515859912284
"cameras/drone/drone0" SET Transform localPosition (0.6273732395120704 0.1320629701864196 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0933568914173548 0.8637224455738721 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -15 9)
"cameras/drone/drone0" SET Transform localScale (0.9822768001786316 0.9822768001786316 0.9822768001786316)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 19 -5)
"cameras/drone/drone1" SET Transform localScale (1.3423108176247938 1.3423108176247938 1.3423108176247938)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.26338189436254 0)
"cameras" SET Transform eulerAngles (-2.7084463610852367 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9022659353467142
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.896420777902473
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3620439938319062
"cameras/drone/drone0" SET Transform localPosition (-0.8887595849683609 -0.1278902902361057 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1964346244167412 0.908494755850555 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 5 1)
"cameras/drone/drone0" SET Transform localScale (1.4727532955579374 1.4727532955579374 1.4727532955579374)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -10 -6)
"cameras/drone/drone1" SET Transform localScale (1.3302976627847243 1.3302976627847243 1.3302976627847243)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
