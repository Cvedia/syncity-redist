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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 195 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 18 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 55 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 28 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-15.028291146341498 0 0)
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
"cameras" SET Transform position (0 4.234258640202178 0)
"cameras" SET Transform eulerAngles (7.89228943703845 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0448893301038145
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9931240453078987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36929663933073537
"cameras/drone/drone0" SET Transform localPosition (0.8626681062464769 0.4502249953758823 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7468497737521489 1.0315026012081014 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -10 -8)
"cameras/drone/drone0" SET Transform localScale (1.0922710945425416 1.0922710945425416 1.0922710945425416)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 20 18)
"cameras/drone/drone1" SET Transform localScale (1.4272619998754421 1.4272619998754421 1.4272619998754421)
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
"cameras" SET Transform position (0 3.5015481589636934 0)
"cameras" SET Transform eulerAngles (-2.1598858659389073 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5860406331352592
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0105231108635218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23816993438121947
"cameras/drone/drone0" SET Transform localPosition (0.6706378613265411 -0.14492945750976455 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.005417252658018 0.9748086341791182 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -15 16)
"cameras/drone/drone0" SET Transform localScale (1.4324669346627312 1.4324669346627312 1.4324669346627312)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 0 9)
"cameras/drone/drone1" SET Transform localScale (0.6019885380140162 0.6019885380140162 0.6019885380140162)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.896147996409204 0)
"cameras" SET Transform eulerAngles (18.404677596220104 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4809374861527895
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1242490597377568
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14974582041630688
"cameras/drone/drone0" SET Transform localPosition (-0.4609574685076795 0.4076491795079276 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5233760660107118 0.841488347125736 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 14 5)
"cameras/drone/drone0" SET Transform localScale (1.0261032852308067 1.0261032852308067 1.0261032852308067)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -14 2)
"cameras/drone/drone1" SET Transform localScale (0.88567269290396 0.88567269290396 0.88567269290396)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.715293071106473 0)
"cameras" SET Transform eulerAngles (16.948324405766698 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4687935177139613
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1769979453156216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37090283788923484
"cameras/drone/drone0" SET Transform localPosition (0.744211579526955 0.47641017191875984 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8104596328783054 1.0203287491610533 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 14 16)
"cameras/drone/drone0" SET Transform localScale (0.8422399996096783 0.8422399996096783 0.8422399996096783)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 3 -11)
"cameras/drone/drone1" SET Transform localScale (0.670565653798335 0.670565653798335 0.670565653798335)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.590711601202074 0)
"cameras" SET Transform eulerAngles (-7.133017681149237 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7853493032411019
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9399877395728113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.008969830028454018
"cameras/drone/drone0" SET Transform localPosition (0.9991721422910562 -0.18323816644328633 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23885896597261347 0.9432857103242868 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 14 -19)
"cameras/drone/drone0" SET Transform localScale (0.8014232020685019 0.8014232020685019 0.8014232020685019)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 2 -13)
"cameras/drone/drone1" SET Transform localScale (0.6636276080442752 0.6636276080442752 0.6636276080442752)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2425740832663243 0)
"cameras" SET Transform eulerAngles (-18.688507214704508 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5476231188573961
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1750195199147944
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06930159496356865
"cameras/drone/drone0" SET Transform localPosition (0.6182156766339559 -0.16359635004750855 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7106070476922464 0.8478495020407972 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 14 16)
"cameras/drone/drone0" SET Transform localScale (1.1912599031370594 1.1912599031370594 1.1912599031370594)
"cameras/drone/drone1" SET Transform localEulerAngles (1 15 20)
"cameras/drone/drone1" SET Transform localScale (1.049781404323838 1.049781404323838 1.049781404323838)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.877524593386625 0)
"cameras" SET Transform eulerAngles (10.495379331675046 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6300651148628833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4280772277873783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2816356453488164
"cameras/drone/drone0" SET Transform localPosition (-0.19711160935098704 0.03585974750488047 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18554374067888402 1.1594757135957279 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 16 -1)
"cameras/drone/drone0" SET Transform localScale (1.2173891166716255 1.2173891166716255 1.2173891166716255)
"cameras/drone/drone1" SET Transform localEulerAngles (10 10 -16)
"cameras/drone/drone1" SET Transform localScale (1.476351573963346 1.476351573963346 1.476351573963346)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.173556859079132 0)
"cameras" SET Transform eulerAngles (1.6887790477698061 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7248381942336266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.560615102299041
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15613133395477555
"cameras/drone/drone0" SET Transform localPosition (0.05248610218995964 0.6797524594825048 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6574264567503774 0.8265856755599132 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -8 -20)
"cameras/drone/drone0" SET Transform localScale (1.3736630155826188 1.3736630155826188 1.3736630155826188)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 5 16)
"cameras/drone/drone1" SET Transform localScale (0.6948026410760009 0.6948026410760009 0.6948026410760009)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.924478035279778 0)
"cameras" SET Transform eulerAngles (8.744631592351595 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4091556120263879
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.497044617927068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10459601596096922
"cameras/drone/drone0" SET Transform localPosition (-1.066526703064298 0.6437200426462057 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5894397573873397 0.8694183089624352 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -3 -20)
"cameras/drone/drone0" SET Transform localScale (0.9635165097388876 0.9635165097388876 0.9635165097388876)
"cameras/drone/drone1" SET Transform localEulerAngles (1 11 -10)
"cameras/drone/drone1" SET Transform localScale (0.6869328238154009 0.6869328238154009 0.6869328238154009)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.29558589708524 0)
"cameras" SET Transform eulerAngles (-6.116545415737452 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.54723346837581
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7693021984476274
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2742155206424239
"cameras/drone/drone0" SET Transform localPosition (1.0203935505022612 0.5295175718868153 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.37287841837589863 1.1641998465005505 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 8 6)
"cameras/drone/drone0" SET Transform localScale (1.4085849136344715 1.4085849136344715 1.4085849136344715)
"cameras/drone/drone1" SET Transform localEulerAngles (12 11 14)
"cameras/drone/drone1" SET Transform localScale (1.0899475440668436 1.0899475440668436 1.0899475440668436)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4091535217122226 0)
"cameras" SET Transform eulerAngles (12.812190798721048 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5231679327643048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4451008112028232
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.044595824612261706
"cameras/drone/drone0" SET Transform localPosition (-0.13626582081101235 0.2282365723151461 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6623931296665152 1.2792806981134224 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 20 -3)
"cameras/drone/drone0" SET Transform localScale (1.3632934024561196 1.3632934024561196 1.3632934024561196)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -18 -16)
"cameras/drone/drone1" SET Transform localScale (0.9009870438926024 0.9009870438926024 0.9009870438926024)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.226601034840478 0)
"cameras" SET Transform eulerAngles (-5.410591192514351 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0561299996362248
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9777350052346642
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15015880261289932
"cameras/drone/drone0" SET Transform localPosition (-0.5646944475499414 0.6553679654738664 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3920704470048597 1.0626808931117386 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -4 9)
"cameras/drone/drone0" SET Transform localScale (1.3488406377545337 1.3488406377545337 1.3488406377545337)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 12 11)
"cameras/drone/drone1" SET Transform localScale (1.1151386261393905 1.1151386261393905 1.1151386261393905)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.623676881412209 0)
"cameras" SET Transform eulerAngles (0.5792384527052263 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.164208450432404
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.302064752902171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0067565316713746
"cameras/drone/drone0" SET Transform localPosition (0.26161689029156876 0.22781597062499265 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3721131558076677 0.9415748822476224 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 0 -2)
"cameras/drone/drone0" SET Transform localScale (1.3659049544310542 1.3659049544310542 1.3659049544310542)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 0 3)
"cameras/drone/drone1" SET Transform localScale (1.0107887030995077 1.0107887030995077 1.0107887030995077)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.603358978420916 0)
"cameras" SET Transform eulerAngles (13.526815546108516 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.298940297453688
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1275952224515622
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33277330220312046
"cameras/drone/drone0" SET Transform localPosition (0.18063740409484264 0.6225122768782791 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3567510849628306 0.88917383255613 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -7 14)
"cameras/drone/drone0" SET Transform localScale (1.3902579458062259 1.3902579458062259 1.3902579458062259)
"cameras/drone/drone1" SET Transform localEulerAngles (10 8 -11)
"cameras/drone/drone1" SET Transform localScale (0.6047733134283926 0.6047733134283926 0.6047733134283926)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.668578563426059 0)
"cameras" SET Transform eulerAngles (7.246027481113092 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4553535885211634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.686428748204865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3259476672995732
"cameras/drone/drone0" SET Transform localPosition (0.5453998059476606 0.4023440176872462 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8007825491431955 1.136027497802721 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -3 1)
"cameras/drone/drone0" SET Transform localScale (0.8340023644593231 0.8340023644593231 0.8340023644593231)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -17 -13)
"cameras/drone/drone1" SET Transform localScale (1.2093272139114206 1.2093272139114206 1.2093272139114206)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2611094365224558 0)
"cameras" SET Transform eulerAngles (13.857146474368513 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8749857255238601
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4353138388152924
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36194709670413805
"cameras/drone/drone0" SET Transform localPosition (0.5918329516808165 0.32327957725766493 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37211142134619934 1.2969078794481528 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 20 20)
"cameras/drone/drone0" SET Transform localScale (1.248202191431907 1.248202191431907 1.248202191431907)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 16 -1)
"cameras/drone/drone1" SET Transform localScale (1.4195991029053872 1.4195991029053872 1.4195991029053872)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.597673555272715 0)
"cameras" SET Transform eulerAngles (13.690879562809805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1342555550967948
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.026259959057441
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26206775861924514
"cameras/drone/drone0" SET Transform localPosition (0.2931337776879419 0.4470546193918647 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.386090861072078 1.142658050245928 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -8 -4)
"cameras/drone/drone0" SET Transform localScale (1.015840058772358 1.015840058772358 1.015840058772358)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 5 13)
"cameras/drone/drone1" SET Transform localScale (0.6294892856964273 0.6294892856964273 0.6294892856964273)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.825884712584441 0)
"cameras" SET Transform eulerAngles (-10.084618739107327 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9949239885726862
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0176184967529185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3057512924378645
"cameras/drone/drone0" SET Transform localPosition (-0.7058344360753586 0.0015999232307562505 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.38434776872182796 1.2407798908475498 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 5 -9)
"cameras/drone/drone0" SET Transform localScale (1.3904856892805715 1.3904856892805715 1.3904856892805715)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -1 4)
"cameras/drone/drone1" SET Transform localScale (0.6119920196467397 0.6119920196467397 0.6119920196467397)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.821054918677561 0)
"cameras" SET Transform eulerAngles (11.065465676529126 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0811305169645014
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.245451928248343
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07579677697991186
"cameras/drone/drone0" SET Transform localPosition (-0.8388972794065681 0.5396405775707815 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8821803724036681 0.9591090497217766 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 7 -10)
"cameras/drone/drone0" SET Transform localScale (0.8862323855639992 0.8862323855639992 0.8862323855639992)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 20 5)
"cameras/drone/drone1" SET Transform localScale (1.2742356355995441 1.2742356355995441 1.2742356355995441)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.176713983815259 0)
"cameras" SET Transform eulerAngles (13.917658702770602 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7679951226015163
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5253306407002416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20832280620500426
"cameras/drone/drone0" SET Transform localPosition (-0.8277323213577148 0.004645176102381521 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08925854449925175 1.0435970366663532 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -18 9)
"cameras/drone/drone0" SET Transform localScale (1.1062821911887712 1.1062821911887712 1.1062821911887712)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 15 8)
"cameras/drone/drone1" SET Transform localScale (1.2289699010656876 1.2289699010656876 1.2289699010656876)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.863304627320492 0)
"cameras" SET Transform eulerAngles (-18.33862918282172 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.350819062670881
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4260594418003758
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1624926200108966
"cameras/drone/drone0" SET Transform localPosition (-0.9653643277025278 0.5369555971779483 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28805336203853993 0.941834749746947 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 16 -3)
"cameras/drone/drone0" SET Transform localScale (1.4704985794323946 1.4704985794323946 1.4704985794323946)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -1 -19)
"cameras/drone/drone1" SET Transform localScale (0.6737830966411993 0.6737830966411993 0.6737830966411993)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4167370976344533 0)
"cameras" SET Transform eulerAngles (15.254934476446792 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3496074063790409
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6032908664723564
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3766717170016219
"cameras/drone/drone0" SET Transform localPosition (-0.09893766293276207 -0.21537267659746223 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.47331985968749124 0.9589385688837521 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -1 -19)
"cameras/drone/drone0" SET Transform localScale (0.8999859363376728 0.8999859363376728 0.8999859363376728)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 11 -11)
"cameras/drone/drone1" SET Transform localScale (1.3813918208360436 1.3813918208360436 1.3813918208360436)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6273744767129035 0)
"cameras" SET Transform eulerAngles (8.502168110207705 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4597218112757211
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.628067458813354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09874938303085448
"cameras/drone/drone0" SET Transform localPosition (0.41908684136153296 -0.1746115753213548 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4833054055534133 1.2730275063932641 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 19 19)
"cameras/drone/drone0" SET Transform localScale (0.7666708167000884 0.7666708167000884 0.7666708167000884)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -17 10)
"cameras/drone/drone1" SET Transform localScale (1.2267110685427551 1.2267110685427551 1.2267110685427551)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5681432559010515 0)
"cameras" SET Transform eulerAngles (19.622324140037918 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2147240636363748
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9529766521648845
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23937755485745527
"cameras/drone/drone0" SET Transform localPosition (0.14591404254634788 0.2632101875464801 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3226809633527188 1.0518105005382081 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -10 -14)
"cameras/drone/drone0" SET Transform localScale (0.9292792737777444 0.9292792737777444 0.9292792737777444)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -11 -3)
"cameras/drone/drone1" SET Transform localScale (1.0472004330557074 1.0472004330557074 1.0472004330557074)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5098171146783095 0)
"cameras" SET Transform eulerAngles (5.577544025203704 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5456918157819494
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1550897418591148
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2784083075513281
"cameras/drone/drone0" SET Transform localPosition (0.6129377238791962 -0.0077767186903938135 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0384227718019217 1.125346619653317 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -5 2)
"cameras/drone/drone0" SET Transform localScale (1.226820369639598 1.226820369639598 1.226820369639598)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -12 17)
"cameras/drone/drone1" SET Transform localScale (1.2758703120961283 1.2758703120961283 1.2758703120961283)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2123803729376545 0)
"cameras" SET Transform eulerAngles (-6.03258090521399 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1052776523467323
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.63361242023255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12014263942200915
"cameras/drone/drone0" SET Transform localPosition (-1.1737335864112222 0.09350488287285025 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5664340692336423 1.2391403450876026 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -10 13)
"cameras/drone/drone0" SET Transform localScale (1.3048794359665623 1.3048794359665623 1.3048794359665623)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 14 -5)
"cameras/drone/drone1" SET Transform localScale (0.7091363198281365 0.7091363198281365 0.7091363198281365)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.138912116621534 0)
"cameras" SET Transform eulerAngles (-6.77977421723028 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3466847217072666
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.301241307205085
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34001440061246313
"cameras/drone/drone0" SET Transform localPosition (0.32796064348505993 0.2812637429051886 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3379223677703522 1.0107597708098788 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -12 0)
"cameras/drone/drone0" SET Transform localScale (1.1195396334549208 1.1195396334549208 1.1195396334549208)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -6 -2)
"cameras/drone/drone1" SET Transform localScale (1.4632240309425684 1.4632240309425684 1.4632240309425684)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7817544361332933 0)
"cameras" SET Transform eulerAngles (9.462507712917226 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7578533351733352
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8637084591800073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.054454467073044646
"cameras/drone/drone0" SET Transform localPosition (1.1117233736694387 -0.1405970204320987 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9246309936624482 0.8693422361050139 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -3 -10)
"cameras/drone/drone0" SET Transform localScale (1.1220398248406278 1.1220398248406278 1.1220398248406278)
"cameras/drone/drone1" SET Transform localEulerAngles (1 13 -16)
"cameras/drone/drone1" SET Transform localScale (0.998792601512588 0.998792601512588 0.998792601512588)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.480177311420112 0)
"cameras" SET Transform eulerAngles (12.446730563852753 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.509448263736763
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1184127714607914
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2586461568501505
"cameras/drone/drone0" SET Transform localPosition (-0.1521920049974903 -0.2250133197525655 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6151005894338695 0.8909069173242108 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 17 14)
"cameras/drone/drone0" SET Transform localScale (1.4522850490401151 1.4522850490401151 1.4522850490401151)
"cameras/drone/drone1" SET Transform localEulerAngles (8 9 15)
"cameras/drone/drone1" SET Transform localScale (0.8610701866033721 0.8610701866033721 0.8610701866033721)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5625164781990133 0)
"cameras" SET Transform eulerAngles (-11.848310629827026 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9144600429579344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.647299793928238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27278329757447517
"cameras/drone/drone0" SET Transform localPosition (-0.9595195645331287 0.6215324497798769 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9286757531952803 1.2283934597413841 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 14 -19)
"cameras/drone/drone0" SET Transform localScale (0.8790614407747139 0.8790614407747139 0.8790614407747139)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -3 10)
"cameras/drone/drone1" SET Transform localScale (0.8413468224063838 0.8413468224063838 0.8413468224063838)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.249748064865303 0)
"cameras" SET Transform eulerAngles (-12.999336383531496 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2636875014647786
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9854448440036719
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12624858573133121
"cameras/drone/drone0" SET Transform localPosition (0.8364491392313769 0.4545621679907044 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5335288689835203 1.2889848371932418 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -20 -10)
"cameras/drone/drone0" SET Transform localScale (0.9199318136308525 0.9199318136308525 0.9199318136308525)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 13 12)
"cameras/drone/drone1" SET Transform localScale (1.0227049133258672 1.0227049133258672 1.0227049133258672)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9500075241938264 0)
"cameras" SET Transform eulerAngles (-2.051177533947577 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.515171908627178
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.590385341780524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23995196918559408
"cameras/drone/drone0" SET Transform localPosition (-0.7678846473276517 0.4219502798663604 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08202350328993013 1.2109789491796314 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -1 7)
"cameras/drone/drone0" SET Transform localScale (1.2080851203277523 1.2080851203277523 1.2080851203277523)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 5 -20)
"cameras/drone/drone1" SET Transform localScale (1.46899943932705 1.46899943932705 1.46899943932705)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.725192006457997 0)
"cameras" SET Transform eulerAngles (-1.2950038005841513 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7671618476362565
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3548404460841468
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09006113809852567
"cameras/drone/drone0" SET Transform localPosition (1.1929095776232372 0.4457516378083128 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7314906885860686 1.1891201630357053 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 8 7)
"cameras/drone/drone0" SET Transform localScale (0.8577231415527873 0.8577231415527873 0.8577231415527873)
"cameras/drone/drone1" SET Transform localEulerAngles (9 19 -19)
"cameras/drone/drone1" SET Transform localScale (1.0546498421737531 1.0546498421737531 1.0546498421737531)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.316813198941731 0)
"cameras" SET Transform eulerAngles (-1.4856731331343624 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7962938887020561
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1524873956932686
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19398364561715942
"cameras/drone/drone0" SET Transform localPosition (-0.18569442857426477 0.04747087532592048 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0603134746474059 1.0674166915906427 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 20 4)
"cameras/drone/drone0" SET Transform localScale (1.4155212285184022 1.4155212285184022 1.4155212285184022)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -11 5)
"cameras/drone/drone1" SET Transform localScale (1.3583134444423646 1.3583134444423646 1.3583134444423646)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.603008732302144 0)
"cameras" SET Transform eulerAngles (1.6116854301423729 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6684208160104729
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.404898586147001
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06596778105822186
"cameras/drone/drone0" SET Transform localPosition (-0.24270218127430176 0.1005441962787092 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.27915227571581136 0.9271485374251859 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -8 5)
"cameras/drone/drone0" SET Transform localScale (0.9343228161827342 0.9343228161827342 0.9343228161827342)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -4 15)
"cameras/drone/drone1" SET Transform localScale (0.6179744545381396 0.6179744545381396 0.6179744545381396)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.575388340920204 0)
"cameras" SET Transform eulerAngles (5.756417293272076 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9127506463579719
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9512218742564345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28554886840660765
"cameras/drone/drone0" SET Transform localPosition (0.6338866206019653 0.35361563418855807 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7545855573332414 0.9963507099022678 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -9 -20)
"cameras/drone/drone0" SET Transform localScale (1.0848561028111834 1.0848561028111834 1.0848561028111834)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -1 -9)
"cameras/drone/drone1" SET Transform localScale (1.0706532486815121 1.0706532486815121 1.0706532486815121)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6153682623318235 0)
"cameras" SET Transform eulerAngles (-6.7359025837212005 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8863106787987367
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2990714613954188
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.314095645682269
"cameras/drone/drone0" SET Transform localPosition (0.5771753343476447 0.194975301360575 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0849647787199743 0.8169560066630619 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 4 17)
"cameras/drone/drone0" SET Transform localScale (0.8732947364159929 0.8732947364159929 0.8732947364159929)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -17 5)
"cameras/drone/drone1" SET Transform localScale (1.3872166561195245 1.3872166561195245 1.3872166561195245)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.9469894935824215 0)
"cameras" SET Transform eulerAngles (-6.693317159520271 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0829797050932495
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0189185393085987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1950023811724838
"cameras/drone/drone0" SET Transform localPosition (-0.5467177481958166 0.16572991859935277 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.04066085387998042 1.2596406608561703 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 15 -4)
"cameras/drone/drone0" SET Transform localScale (0.6668529267689838 0.6668529267689838 0.6668529267689838)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -6 14)
"cameras/drone/drone1" SET Transform localScale (0.780712982817352 0.780712982817352 0.780712982817352)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.870913152736005 0)
"cameras" SET Transform eulerAngles (-14.855896201360942 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3549379907687924
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8534938577560272
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19296087316832589
"cameras/drone/drone0" SET Transform localPosition (-0.7443683704185488 0.5160480006890229 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20776050696568515 0.9414973788424497 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 5 13)
"cameras/drone/drone0" SET Transform localScale (1.0933068694279786 1.0933068694279786 1.0933068694279786)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -17 2)
"cameras/drone/drone1" SET Transform localScale (1.3184185588521533 1.3184185588521533 1.3184185588521533)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.102277082880941 0)
"cameras" SET Transform eulerAngles (-7.107673591631642 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5345321000803125
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.973586100932648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15393617883760174
"cameras/drone/drone0" SET Transform localPosition (0.9789077586347374 0.369572247447079 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7556465590704571 1.1498343236685318 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 20 11)
"cameras/drone/drone0" SET Transform localScale (0.958258056708744 0.958258056708744 0.958258056708744)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 6 -6)
"cameras/drone/drone1" SET Transform localScale (0.6654942641419784 0.6654942641419784 0.6654942641419784)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.630263024454575 0)
"cameras" SET Transform eulerAngles (7.963931271189875 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5596275953564618
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0127861070739643
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30133309088940546
"cameras/drone/drone0" SET Transform localPosition (-1.002936668218914 0.25951466490460234 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.41992819663596936 1.0768390431031605 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -13 -8)
"cameras/drone/drone0" SET Transform localScale (1.3520170266602352 1.3520170266602352 1.3520170266602352)
"cameras/drone/drone1" SET Transform localEulerAngles (16 10 20)
"cameras/drone/drone1" SET Transform localScale (1.102390987216493 1.102390987216493 1.102390987216493)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.264099931511506 0)
"cameras" SET Transform eulerAngles (2.2072709549678926 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0394915384917052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.148418479494823
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09062208431423309
"cameras/drone/drone0" SET Transform localPosition (0.7946324265693288 0.6884053673903385 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0596801257369595 1.0382961498498187 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -13 6)
"cameras/drone/drone0" SET Transform localScale (0.8614887498617135 0.8614887498617135 0.8614887498617135)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -11 6)
"cameras/drone/drone1" SET Transform localScale (1.194369171302879 1.194369171302879 1.194369171302879)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6668370318309824 0)
"cameras" SET Transform eulerAngles (5.1269362721080505 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6612308451551312
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3765634411188208
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16541251620941144
"cameras/drone/drone0" SET Transform localPosition (-0.2478418566296995 0.5821057869445134 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6515477416234854 1.1023757796674905 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 12 5)
"cameras/drone/drone0" SET Transform localScale (1.0969936416561898 1.0969936416561898 1.0969936416561898)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 4 15)
"cameras/drone/drone1" SET Transform localScale (1.2075156797861848 1.2075156797861848 1.2075156797861848)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.59650615548216 0)
"cameras" SET Transform eulerAngles (-6.844305098839381 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8627776864843376
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3633037683012335
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18646133271229456
"cameras/drone/drone0" SET Transform localPosition (-0.05917196685518755 0.4468189117742036 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1778066246172922 0.887968404844234 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -1 19)
"cameras/drone/drone0" SET Transform localScale (0.7787090810013979 0.7787090810013979 0.7787090810013979)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -18 1)
"cameras/drone/drone1" SET Transform localScale (0.6111351002269713 0.6111351002269713 0.6111351002269713)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.169828060876364 0)
"cameras" SET Transform eulerAngles (-9.6878522294928 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7479209858488183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5591167390842982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10309220964566626
"cameras/drone/drone0" SET Transform localPosition (-0.9938448303169541 0.21056040450960173 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0752084791653596 1.2267097513887908 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 12 14)
"cameras/drone/drone0" SET Transform localScale (0.6883811182810385 0.6883811182810385 0.6883811182810385)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -20 14)
"cameras/drone/drone1" SET Transform localScale (1.3617677728773074 1.3617677728773074 1.3617677728773074)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4441620162779154 0)
"cameras" SET Transform eulerAngles (-16.584312666370323 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.837435650743714
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4770288496674016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.013646760544912206
"cameras/drone/drone0" SET Transform localPosition (-0.6845926588110315 0.5978240452928767 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6502231245531228 1.130713372955367 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 4 5)
"cameras/drone/drone0" SET Transform localScale (1.257524408566454 1.257524408566454 1.257524408566454)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -14 9)
"cameras/drone/drone1" SET Transform localScale (0.8359195372205317 0.8359195372205317 0.8359195372205317)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.30780438829583 0)
"cameras" SET Transform eulerAngles (8.170748352716181 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3979255023302934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4242094306598045
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06248242628667758
"cameras/drone/drone0" SET Transform localPosition (-1.0001060805897009 0.6466132593184333 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3245679259844496 0.9886098669134366 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 14 19)
"cameras/drone/drone0" SET Transform localScale (1.015977032803149 1.015977032803149 1.015977032803149)
"cameras/drone/drone1" SET Transform localEulerAngles (0 5 15)
"cameras/drone/drone1" SET Transform localScale (1.3068893607576826 1.3068893607576826 1.3068893607576826)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.282296370596477 0)
"cameras" SET Transform eulerAngles (-3.9112124190158006 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6371491088164466
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9160008682935548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30009866256390416
"cameras/drone/drone0" SET Transform localPosition (0.6947501419023008 0.22792161240764924 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1292149596806638 0.8609975037790688 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -19 -11)
"cameras/drone/drone0" SET Transform localScale (0.8609134714233553 0.8609134714233553 0.8609134714233553)
"cameras/drone/drone1" SET Transform localEulerAngles (3 9 -15)
"cameras/drone/drone1" SET Transform localScale (1.1259372072795037 1.1259372072795037 1.1259372072795037)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.829590939043552 0)
"cameras" SET Transform eulerAngles (-0.44088913292528176 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5083447660789164
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4876844565704368
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13839780483243813
"cameras/drone/drone0" SET Transform localPosition (0.09437322019447292 0.5349715558409622 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5875330442754316 1.2571268805140878 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 0 -4)
"cameras/drone/drone0" SET Transform localScale (1.056252430909602 1.056252430909602 1.056252430909602)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -6 -1)
"cameras/drone/drone1" SET Transform localScale (1.0782645273163585 1.0782645273163585 1.0782645273163585)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.012885322530277 0)
"cameras" SET Transform eulerAngles (-1.3657276859937149 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.414079997251375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0850242474617717
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03974365026002289
"cameras/drone/drone0" SET Transform localPosition (-0.8569020713237112 -0.2671138825591162 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4913676184515938 0.867736714141686 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 15 -6)
"cameras/drone/drone0" SET Transform localScale (1.4475103145450907 1.4475103145450907 1.4475103145450907)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -3 -18)
"cameras/drone/drone1" SET Transform localScale (0.8502851002109805 0.8502851002109805 0.8502851002109805)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.227978537377494 0)
"cameras" SET Transform eulerAngles (1.890730135906157 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5912057850083212
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4333441546843526
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01535689782235421
"cameras/drone/drone0" SET Transform localPosition (0.8221293395404159 -0.19933260701840233 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9935174855256921 1.192359860592379 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -3 19)
"cameras/drone/drone0" SET Transform localScale (1.428922845645209 1.428922845645209 1.428922845645209)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -19 0)
"cameras/drone/drone1" SET Transform localScale (1.06550860165473 1.06550860165473 1.06550860165473)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9681228078885664 0)
"cameras" SET Transform eulerAngles (-12.724060468615104 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0566655397173328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4704795081851874
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.265025132475372
"cameras/drone/drone0" SET Transform localPosition (-0.36611713145720537 -0.07815953429619199 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9508623245838723 1.1015492724392892 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -1 15)
"cameras/drone/drone0" SET Transform localScale (1.3075943900265887 1.3075943900265887 1.3075943900265887)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 2 -11)
"cameras/drone/drone1" SET Transform localScale (0.9473948229275092 0.9473948229275092 0.9473948229275092)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2529467192939454 0)
"cameras" SET Transform eulerAngles (-9.011347800126742 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.438810385101713
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.004122556148978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2110624137927049
"cameras/drone/drone0" SET Transform localPosition (-0.34281890053847974 0.6969856118329258 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8643998619591271 1.1441173178639628 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 4 13)
"cameras/drone/drone0" SET Transform localScale (1.1293285806393225 1.1293285806393225 1.1293285806393225)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -18 20)
"cameras/drone/drone1" SET Transform localScale (0.623531183760811 0.623531183760811 0.623531183760811)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.096613162385838 0)
"cameras" SET Transform eulerAngles (-2.5496585888366 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.547119168032303
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6815693886074126
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3774544446948829
"cameras/drone/drone0" SET Transform localPosition (0.00936632749724442 0.30613060581088886 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06238454830537998 1.0810651190715292 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -3 1)
"cameras/drone/drone0" SET Transform localScale (1.0882112795354926 1.0882112795354926 1.0882112795354926)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -18 -17)
"cameras/drone/drone1" SET Transform localScale (1.0419607028415645 1.0419607028415645 1.0419607028415645)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6465984330792636 0)
"cameras" SET Transform eulerAngles (-19.308470093862287 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2451011436390012
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9823411550147347
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33295975431515135
"cameras/drone/drone0" SET Transform localPosition (0.8492648203221094 0.5292841679220286 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.330028695495756 0.9354691307428991 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 14 14)
"cameras/drone/drone0" SET Transform localScale (0.873241248708494 0.873241248708494 0.873241248708494)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 20 -15)
"cameras/drone/drone1" SET Transform localScale (1.358748752725037 1.358748752725037 1.358748752725037)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.420977613797582 0)
"cameras" SET Transform eulerAngles (-8.721417682066273 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3285120982652119
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5905203838991369
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36223161367234896
"cameras/drone/drone0" SET Transform localPosition (0.10695583362191652 0.3294401460518998 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.40743091846753543 1.1705715923678657 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 15 3)
"cameras/drone/drone0" SET Transform localScale (1.4376016448889084 1.4376016448889084 1.4376016448889084)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 7 -12)
"cameras/drone/drone1" SET Transform localScale (1.009701870778557 1.009701870778557 1.009701870778557)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.123462694974549 0)
"cameras" SET Transform eulerAngles (-16.09925702036122 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8404040963953393
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3676199361427317
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31482401848186625
"cameras/drone/drone0" SET Transform localPosition (-0.8059915666220248 0.22807592464661358 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0011345792789823 1.068093875384085 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 19 15)
"cameras/drone/drone0" SET Transform localScale (1.4389272107960411 1.4389272107960411 1.4389272107960411)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -16 2)
"cameras/drone/drone1" SET Transform localScale (0.7554358571813652 0.7554358571813652 0.7554358571813652)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.51904294752226 0)
"cameras" SET Transform eulerAngles (-3.8217804235977084 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6113704274946465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.82279944783707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19132230177446227
"cameras/drone/drone0" SET Transform localPosition (0.3042182096119912 -0.2795101715248312 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4360107507812301 0.8031078820260387 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 2 8)
"cameras/drone/drone0" SET Transform localScale (1.2433164939678476 1.2433164939678476 1.2433164939678476)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -18 -15)
"cameras/drone/drone1" SET Transform localScale (0.7700074766783288 0.7700074766783288 0.7700074766783288)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3960134826898605 0)
"cameras" SET Transform eulerAngles (15.943216309298826 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8885047544598149
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2376758812394595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09730989437731008
"cameras/drone/drone0" SET Transform localPosition (-0.3546915906798541 -0.25075896098158895 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7129799339516896 0.8459314687428239 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 19 3)
"cameras/drone/drone0" SET Transform localScale (1.3438939996935648 1.3438939996935648 1.3438939996935648)
"cameras/drone/drone1" SET Transform localEulerAngles (12 4 -7)
"cameras/drone/drone1" SET Transform localScale (0.622706897766939 0.622706897766939 0.622706897766939)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.363001068147158 0)
"cameras" SET Transform eulerAngles (-11.784822429808983 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5853170392790761
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5057581807936438
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.395620472582856
"cameras/drone/drone0" SET Transform localPosition (-0.018242124761121303 0.6169080027404796 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.194233731875177 1.2843276956899128 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 8 18)
"cameras/drone/drone0" SET Transform localScale (1.4077347527765407 1.4077347527765407 1.4077347527765407)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -11 -2)
"cameras/drone/drone1" SET Transform localScale (1.314824280382332 1.314824280382332 1.314824280382332)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.9324753543039055 0)
"cameras" SET Transform eulerAngles (-17.35613582232412 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0287622526728555
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3615467943386155
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.119114365430538
"cameras/drone/drone0" SET Transform localPosition (-0.4993076394073843 0.05544999811978529 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9252642286581925 1.2827636988638205 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -1 5)
"cameras/drone/drone0" SET Transform localScale (1.234981715001199 1.234981715001199 1.234981715001199)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -13 -12)
"cameras/drone/drone1" SET Transform localScale (0.7501159329010023 0.7501159329010023 0.7501159329010023)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3647717346005197 0)
"cameras" SET Transform eulerAngles (18.48967660172837 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7654848223206948
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.722126771053323
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21902328375845698
"cameras/drone/drone0" SET Transform localPosition (-1.139212349975296 0.17128177908845682 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5009850431127899 1.2829048918887271 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 4 -13)
"cameras/drone/drone0" SET Transform localScale (0.8899097438142572 0.8899097438142572 0.8899097438142572)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -3 17)
"cameras/drone/drone1" SET Transform localScale (1.438610443633571 1.438610443633571 1.438610443633571)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0403159197848617 0)
"cameras" SET Transform eulerAngles (-2.2148830409703457 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6278181002602283
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7720390450865793
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18182947060766344
"cameras/drone/drone0" SET Transform localPosition (1.1219288920270658 -0.0707441275405834 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9936959776397956 0.8315301334711133 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 6 2)
"cameras/drone/drone0" SET Transform localScale (1.02900541669417 1.02900541669417 1.02900541669417)
"cameras/drone/drone1" SET Transform localEulerAngles (4 3 -11)
"cameras/drone/drone1" SET Transform localScale (1.2729566512307477 1.2729566512307477 1.2729566512307477)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.559979563656445 0)
"cameras" SET Transform eulerAngles (17.334312269591734 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0416499673906154
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7518191516378905
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31325905336873106
"cameras/drone/drone0" SET Transform localPosition (-0.14164118676136295 0.21045878124147016 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1137369002743063 1.0966614744483687 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -2 15)
"cameras/drone/drone0" SET Transform localScale (1.0184271014501265 1.0184271014501265 1.0184271014501265)
"cameras/drone/drone1" SET Transform localEulerAngles (19 7 13)
"cameras/drone/drone1" SET Transform localScale (1.1319358960429948 1.1319358960429948 1.1319358960429948)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.089544042603574 0)
"cameras" SET Transform eulerAngles (11.882001841945119 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2028534516466198
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0269320497607386
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18873384015282513
"cameras/drone/drone0" SET Transform localPosition (-0.8233870961041365 0.35875939863416867 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.26018059818935235 0.887530744688743 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -13 2)
"cameras/drone/drone0" SET Transform localScale (1.4037771919521205 1.4037771919521205 1.4037771919521205)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -9 -15)
"cameras/drone/drone1" SET Transform localScale (1.0850414793775474 1.0850414793775474 1.0850414793775474)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1466347974306075 0)
"cameras" SET Transform eulerAngles (5.5095451357460306 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1984858317586427
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.277148642654714
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2974215834419273
"cameras/drone/drone0" SET Transform localPosition (0.29088581020391446 0.229948193683356 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.917410087868704 0.9563027989140429 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -9 20)
"cameras/drone/drone0" SET Transform localScale (1.496682573596222 1.496682573596222 1.496682573596222)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -16 17)
"cameras/drone/drone1" SET Transform localScale (1.3412902031538088 1.3412902031538088 1.3412902031538088)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.474447064361983 0)
"cameras" SET Transform eulerAngles (-12.939737265559618 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5028950863827406
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7800827299280504
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2692390173733326
"cameras/drone/drone0" SET Transform localPosition (-0.7276644584364237 0.223114256383185 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1835337043528935 0.8539725392369631 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -5 9)
"cameras/drone/drone0" SET Transform localScale (0.839605039421592 0.839605039421592 0.839605039421592)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -5 7)
"cameras/drone/drone1" SET Transform localScale (1.0865687751555808 1.0865687751555808 1.0865687751555808)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.915441413101375 0)
"cameras" SET Transform eulerAngles (5.487449764771327 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49394011769129853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3102583236761747
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.252326465985335
"cameras/drone/drone0" SET Transform localPosition (-0.4088371352553457 0.4536512008800047 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.384426372637351 1.1143397229512373 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 4 -11)
"cameras/drone/drone0" SET Transform localScale (1.2382779899740821 1.2382779899740821 1.2382779899740821)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 1 3)
"cameras/drone/drone1" SET Transform localScale (0.925049819733085 0.925049819733085 0.925049819733085)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.95517785230142 0)
"cameras" SET Transform eulerAngles (14.017738953930163 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6033053127419079
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7158186970068487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17611720390250754
"cameras/drone/drone0" SET Transform localPosition (-0.08387350688244766 0.5204709492973549 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04429961844438779 1.263020358958387 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 13 -2)
"cameras/drone/drone0" SET Transform localScale (1.0639132570252567 1.0639132570252567 1.0639132570252567)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -14 19)
"cameras/drone/drone1" SET Transform localScale (1.0386843708780222 1.0386843708780222 1.0386843708780222)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2771487619096344 0)
"cameras" SET Transform eulerAngles (17.878476043211734 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5899226487342255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9557351301851322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12906422561725517
"cameras/drone/drone0" SET Transform localPosition (0.6577974241407636 0.0788174348269482 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3097284496814555 1.0009205134686947 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 11 -7)
"cameras/drone/drone0" SET Transform localScale (0.9941818715756414 0.9941818715756414 0.9941818715756414)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -4 -1)
"cameras/drone/drone1" SET Transform localScale (1.3024902144378325 1.3024902144378325 1.3024902144378325)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.534043867357715 0)
"cameras" SET Transform eulerAngles (-11.820569003168302 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.034216609451637
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7094440778167532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.015223409577898429
"cameras/drone/drone0" SET Transform localPosition (0.4510679624248417 0.5549613837676057 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.02180168467455923 1.0256984731196988 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 7 5)
"cameras/drone/drone0" SET Transform localScale (1.4941284633081473 1.4941284633081473 1.4941284633081473)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -15 3)
"cameras/drone/drone1" SET Transform localScale (1.1867493641508537 1.1867493641508537 1.1867493641508537)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9305518085005136 0)
"cameras" SET Transform eulerAngles (-14.386797951522215 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7843960995234354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6873381928549143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16873078196375038
"cameras/drone/drone0" SET Transform localPosition (-0.21267609576461033 -0.27670338260089106 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3196615786540884 0.8467160200126144 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -5 2)
"cameras/drone/drone0" SET Transform localScale (1.1447025282974073 1.1447025282974073 1.1447025282974073)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 11 -1)
"cameras/drone/drone1" SET Transform localScale (0.9575824658430755 0.9575824658430755 0.9575824658430755)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.778346531126424 0)
"cameras" SET Transform eulerAngles (-18.107598951255536 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8060395531131381
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9862863225699474
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11797381480110453
"cameras/drone/drone0" SET Transform localPosition (-0.9169301805543904 0.08160269612953114 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3815886742946585 1.0720991583734545 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -13 -6)
"cameras/drone/drone0" SET Transform localScale (0.8263190906928152 0.8263190906928152 0.8263190906928152)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -18 -18)
"cameras/drone/drone1" SET Transform localScale (0.6790331354029339 0.6790331354029339 0.6790331354029339)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2309610322955273 0)
"cameras" SET Transform eulerAngles (-14.816889868428206 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4099128203431155
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.198857358518218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21372409457753583
"cameras/drone/drone0" SET Transform localPosition (0.7194148083581475 -0.1113578630135506 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6372747387540725 0.9037569630796403 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -6 12)
"cameras/drone/drone0" SET Transform localScale (1.4165282979990046 1.4165282979990046 1.4165282979990046)
"cameras/drone/drone1" SET Transform localEulerAngles (16 4 11)
"cameras/drone/drone1" SET Transform localScale (0.6410451146777814 0.6410451146777814 0.6410451146777814)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3558852449674728 0)
"cameras" SET Transform eulerAngles (-19.564000022555366 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1274794601379239
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7725235009313742
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2481473116477957
"cameras/drone/drone0" SET Transform localPosition (-0.523128361339028 0.15736125389313288 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6957404893261379 1.1645764270145331 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -12 7)
"cameras/drone/drone0" SET Transform localScale (0.9777570392800767 0.9777570392800767 0.9777570392800767)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -4 18)
"cameras/drone/drone1" SET Transform localScale (1.3027158694662926 1.3027158694662926 1.3027158694662926)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.941167856935609 0)
"cameras" SET Transform eulerAngles (8.437811658742973 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4984798718947645
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.648179974031894
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39782053347954643
"cameras/drone/drone0" SET Transform localPosition (-0.27891238116695116 -0.06823030787661882 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8430906731365273 1.169393455811816 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -14 18)
"cameras/drone/drone0" SET Transform localScale (1.28747893156463 1.28747893156463 1.28747893156463)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -4 -9)
"cameras/drone/drone1" SET Transform localScale (1.2820922895596036 1.2820922895596036 1.2820922895596036)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4079362735808125 0)
"cameras" SET Transform eulerAngles (-14.93541433306023 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8949822690902962
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9883256125893634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2641901875208195
"cameras/drone/drone0" SET Transform localPosition (0.29719516679199653 -0.23257588030987136 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.028923945564531373 1.1466531396203345 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 7 5)
"cameras/drone/drone0" SET Transform localScale (1.099150625836712 1.099150625836712 1.099150625836712)
"cameras/drone/drone1" SET Transform localEulerAngles (20 17 -7)
"cameras/drone/drone1" SET Transform localScale (0.6223266582586143 0.6223266582586143 0.6223266582586143)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.717273276897014 0)
"cameras" SET Transform eulerAngles (-9.844606618581228 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2255537970856767
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.197554168691996
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05390989100931263
"cameras/drone/drone0" SET Transform localPosition (0.49567280983104167 -0.02399770859656175 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6540916331853024 0.8493650364820085 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 1 -11)
"cameras/drone/drone0" SET Transform localScale (0.7659843748827685 0.7659843748827685 0.7659843748827685)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -6 -18)
"cameras/drone/drone1" SET Transform localScale (0.8559179373608807 0.8559179373608807 0.8559179373608807)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.643484072982155 0)
"cameras" SET Transform eulerAngles (-15.873656419087375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2510415216889235
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6486038003752017
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.020345918524186192
"cameras/drone/drone0" SET Transform localPosition (0.7194484868301141 0.26112717714993944 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5774274817420555 0.901011313426664 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -7 13)
"cameras/drone/drone0" SET Transform localScale (0.6456247467547985 0.6456247467547985 0.6456247467547985)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -16 17)
"cameras/drone/drone1" SET Transform localScale (1.0369048083803518 1.0369048083803518 1.0369048083803518)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.831057764815064 0)
"cameras" SET Transform eulerAngles (-4.738069472313695 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47030248508178574
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5955516666796634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3599482978636668
"cameras/drone/drone0" SET Transform localPosition (-0.06366472612499585 0.10761896663013054 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5655609694698767 0.8857656134932399 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 20 -6)
"cameras/drone/drone0" SET Transform localScale (0.7650283408442465 0.7650283408442465 0.7650283408442465)
"cameras/drone/drone1" SET Transform localEulerAngles (8 10 11)
"cameras/drone/drone1" SET Transform localScale (0.8065785796662075 0.8065785796662075 0.8065785796662075)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.590346209437182 0)
"cameras" SET Transform eulerAngles (-2.789124888069665 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2151342586221476
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2144213967681865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09374511215695623
"cameras/drone/drone0" SET Transform localPosition (0.10776910204753265 0.27734202685569337 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1520251830332469 1.1927035613134165 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 1 -17)
"cameras/drone/drone0" SET Transform localScale (1.1704892703756336 1.1704892703756336 1.1704892703756336)
"cameras/drone/drone1" SET Transform localEulerAngles (5 0 -12)
"cameras/drone/drone1" SET Transform localScale (0.6798908437978154 0.6798908437978154 0.6798908437978154)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5049679047447775 0)
"cameras" SET Transform eulerAngles (-6.361431963289004 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.214883425279805
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6643843910014564
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38807284611108606
"cameras/drone/drone0" SET Transform localPosition (0.7191113307240886 -0.22873314738928813 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2809210457924556 1.2842974030153085 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -17 -11)
"cameras/drone/drone0" SET Transform localScale (0.6519033313275877 0.6519033313275877 0.6519033313275877)
"cameras/drone/drone1" SET Transform localEulerAngles (14 13 -9)
"cameras/drone/drone1" SET Transform localScale (0.8474542686672846 0.8474542686672846 0.8474542686672846)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.595115143631675 0)
"cameras" SET Transform eulerAngles (-0.7654597890966919 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2706866276432147
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3886527841420064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3243663002073114
"cameras/drone/drone0" SET Transform localPosition (0.15737248450874275 -0.11870887449890216 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7610678630946047 0.8704633307380298 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 9 -10)
"cameras/drone/drone0" SET Transform localScale (1.3536908468033073 1.3536908468033073 1.3536908468033073)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -3 -8)
"cameras/drone/drone1" SET Transform localScale (1.4556622080391854 1.4556622080391854 1.4556622080391854)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.604062364076205 0)
"cameras" SET Transform eulerAngles (-18.026474187318424 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5434232973484137
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3572100886352785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2981146899226802
"cameras/drone/drone0" SET Transform localPosition (-0.3744657063694089 0.16922676597289893 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2442668463205624 1.1606891678679656 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -6 10)
"cameras/drone/drone0" SET Transform localScale (0.6526187697401491 0.6526187697401491 0.6526187697401491)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -18 -19)
"cameras/drone/drone1" SET Transform localScale (0.6039718719407857 0.6039718719407857 0.6039718719407857)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.089413536526994 0)
"cameras" SET Transform eulerAngles (3.389008503655326 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4092003091098309
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6163363047036794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17483837245861286
"cameras/drone/drone0" SET Transform localPosition (0.4476959618013381 0.3499380115796014 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8577215683567576 1.1826584480842675 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -3 -9)
"cameras/drone/drone0" SET Transform localScale (0.6438305369341418 0.6438305369341418 0.6438305369341418)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -14 8)
"cameras/drone/drone1" SET Transform localScale (0.6490572559620873 0.6490572559620873 0.6490572559620873)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1811295204402 0)
"cameras" SET Transform eulerAngles (16.161106559236337 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3995979213684748
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.45665881604353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06392991679717652
"cameras/drone/drone0" SET Transform localPosition (1.1701449206215473 0.5968473384433657 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1777273827239874 1.2039513946019613 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 6 -3)
"cameras/drone/drone0" SET Transform localScale (1.4445223622730885 1.4445223622730885 1.4445223622730885)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 7 15)
"cameras/drone/drone1" SET Transform localScale (1.3877056707877249 1.3877056707877249 1.3877056707877249)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.99874581757277 0)
"cameras" SET Transform eulerAngles (-10.204931942212866 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.331529261025689
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9678892373157847
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2771854520584132
"cameras/drone/drone0" SET Transform localPosition (-0.6412323252631689 0.32237651744791934 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6632031126570628 1.079163716410525 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 1 0)
"cameras/drone/drone0" SET Transform localScale (1.119090514413415 1.119090514413415 1.119090514413415)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -11 -19)
"cameras/drone/drone1" SET Transform localScale (1.4390230659538585 1.4390230659538585 1.4390230659538585)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.245123731327816 0)
"cameras" SET Transform eulerAngles (5.700113934622813 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8868397390708628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5910690780838324
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30414529522954287
"cameras/drone/drone0" SET Transform localPosition (0.2792965571447954 0.38262319584282295 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9783173727814147 1.094475349728656 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 0 -14)
"cameras/drone/drone0" SET Transform localScale (1.2365874443935014 1.2365874443935014 1.2365874443935014)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 20 -14)
"cameras/drone/drone1" SET Transform localScale (0.7230528276675543 0.7230528276675543 0.7230528276675543)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.413001112250383 0)
"cameras" SET Transform eulerAngles (8.816580009073618 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1697480680322112
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3484264926271992
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30754484370040275
"cameras/drone/drone0" SET Transform localPosition (1.0562579246520045 0.5513499019739607 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.028448724598586272 1.0920160787523014 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 14 -19)
"cameras/drone/drone0" SET Transform localScale (1.0963157135605588 1.0963157135605588 1.0963157135605588)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -15 1)
"cameras/drone/drone1" SET Transform localScale (0.9360919187137078 0.9360919187137078 0.9360919187137078)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3644726595283583 0)
"cameras" SET Transform eulerAngles (-8.25027030180506 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.054516117017472
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4444260553193602
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3866487663473893
"cameras/drone/drone0" SET Transform localPosition (0.6934072891298009 0.4780876984986944 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6140499118320717 1.205547446009774 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 19 10)
"cameras/drone/drone0" SET Transform localScale (0.6225503670816998 0.6225503670816998 0.6225503670816998)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 17 -15)
"cameras/drone/drone1" SET Transform localScale (0.6406959110188004 0.6406959110188004 0.6406959110188004)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.066626154700053 0)
"cameras" SET Transform eulerAngles (-16.63207507044274 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4040409574019619
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5632339997904983
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.034780911561063464
"cameras/drone/drone0" SET Transform localPosition (0.7772706977170067 0.5664623767756074 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9704520184891113 0.904151762785479 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 12 -20)
"cameras/drone/drone0" SET Transform localScale (1.3837419418621286 1.3837419418621286 1.3837419418621286)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 8 -20)
"cameras/drone/drone1" SET Transform localScale (0.9854174862355627 0.9854174862355627 0.9854174862355627)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5034863687987166 0)
"cameras" SET Transform eulerAngles (-0.54994056958623 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7373710342337144
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7754288185137572
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.023651892831704525
"cameras/drone/drone0" SET Transform localPosition (-1.051086221133728 0.414747052010864 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.058420786610151 1.2123844623695534 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 2 -9)
"cameras/drone/drone0" SET Transform localScale (1.0910534876350904 1.0910534876350904 1.0910534876350904)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -14 12)
"cameras/drone/drone1" SET Transform localScale (1.3616066555774649 1.3616066555774649 1.3616066555774649)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.71172743447966 0)
"cameras" SET Transform eulerAngles (7.888290059918628 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.164459434369969
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.923560362863824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32883236774921176
"cameras/drone/drone0" SET Transform localPosition (0.24491517127560525 0.24051424068762534 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9568826402589232 1.2424577485456667 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 8 -19)
"cameras/drone/drone0" SET Transform localScale (0.6346529131895905 0.6346529131895905 0.6346529131895905)
"cameras/drone/drone1" SET Transform localEulerAngles (20 6 -6)
"cameras/drone/drone1" SET Transform localScale (0.7523002867309121 0.7523002867309121 0.7523002867309121)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1736693080074385 0)
"cameras" SET Transform eulerAngles (-4.946007131663848 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0928878579984815
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.019157208147599
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28418247279701786
"cameras/drone/drone0" SET Transform localPosition (1.0642838535662633 -0.23857317875829248 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.043516571319712094 1.0522575331963848 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -4 12)
"cameras/drone/drone0" SET Transform localScale (1.4518922939303907 1.4518922939303907 1.4518922939303907)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 15 -1)
"cameras/drone/drone1" SET Transform localScale (0.9203618578025754 0.9203618578025754 0.9203618578025754)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.69283673612388 0)
"cameras" SET Transform eulerAngles (-18.189929389464897 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4060728511300873
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1789292010835268
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0664793455128939
"cameras/drone/drone0" SET Transform localPosition (-0.9474601565811022 -0.061071285743291404 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9297173476798626 0.8079036802559871 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 10 16)
"cameras/drone/drone0" SET Transform localScale (0.8752546868224111 0.8752546868224111 0.8752546868224111)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 4 9)
"cameras/drone/drone1" SET Transform localScale (0.6393111705830619 0.6393111705830619 0.6393111705830619)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2794010659248825 0)
"cameras" SET Transform eulerAngles (-3.541435582665848 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5582000311496625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9638135325810864
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1768429155416592
"cameras/drone/drone0" SET Transform localPosition (0.3547121750316391 0.6856506062075902 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6402026383908317 0.8716351682396871 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -8 14)
"cameras/drone/drone0" SET Transform localScale (0.7201949284732454 0.7201949284732454 0.7201949284732454)
"cameras/drone/drone1" SET Transform localEulerAngles (17 19 4)
"cameras/drone/drone1" SET Transform localScale (1.253677666493721 1.253677666493721 1.253677666493721)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7671431585729565 0)
"cameras" SET Transform eulerAngles (4.601917704679337 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.136140529710513
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3814419476476378
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1634420795811783
"cameras/drone/drone0" SET Transform localPosition (0.8542413428119315 -0.2569190674843413 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7071337561575042 1.100214388369719 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -3 -11)
"cameras/drone/drone0" SET Transform localScale (1.3219305641706125 1.3219305641706125 1.3219305641706125)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -13 11)
"cameras/drone/drone1" SET Transform localScale (1.1714187234044147 1.1714187234044147 1.1714187234044147)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0303162519686655 0)
"cameras" SET Transform eulerAngles (-19.020176659540112 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9348532939049926
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7787793846058206
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07094815144770798
"cameras/drone/drone0" SET Transform localPosition (-0.4899964467381356 -0.0809009537208874 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.291412131648483 1.2311599740655654 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 16 -18)
"cameras/drone/drone0" SET Transform localScale (0.9282806786188538 0.9282806786188538 0.9282806786188538)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 15 -3)
"cameras/drone/drone1" SET Transform localScale (1.3325543895110032 1.3325543895110032 1.3325543895110032)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.27723773393131 0)
"cameras" SET Transform eulerAngles (2.4482317872931105 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6919638275800206
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9947828501055902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23871178666235826
"cameras/drone/drone0" SET Transform localPosition (-0.5188054588531832 0.22906736842231296 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9854830100430159 0.9471833854330919 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -16 -16)
"cameras/drone/drone0" SET Transform localScale (0.6956513433649849 0.6956513433649849 0.6956513433649849)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 8 -20)
"cameras/drone/drone1" SET Transform localScale (1.2673561666641548 1.2673561666641548 1.2673561666641548)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.201306499690457 0)
"cameras" SET Transform eulerAngles (8.945387633877363 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4008157740443803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8506878125747666
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28242395405290993
"cameras/drone/drone0" SET Transform localPosition (-0.21648883037059807 0.6600949699295033 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.46978148094943173 1.1263209658384759 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 13 -6)
"cameras/drone/drone0" SET Transform localScale (1.4827998926595263 1.4827998926595263 1.4827998926595263)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -13 -16)
"cameras/drone/drone1" SET Transform localScale (0.9436280897963896 0.9436280897963896 0.9436280897963896)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
