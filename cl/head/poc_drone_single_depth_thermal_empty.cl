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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 159 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 35 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 69 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 67 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-5.942644116912854 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 55
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.886902388339119 0)
"cameras" SET Transform eulerAngles (0.7310786426264073 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.634046845034397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4229227555905344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19781243542906146
"cameras/drone/drone0" SET Transform localPosition (-0.8503365977470156 0.6038035816244953 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.02418463688116823 1.0950062983329993 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -20 -13)
"cameras/drone/drone0" SET Transform localScale (1.0718033862234648 1.0718033862234648 1.0718033862234648)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -13 20)
"cameras/drone/drone1" SET Transform localScale (0.6670806450752544 0.6670806450752544 0.6670806450752544)
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
"cameras" SET Transform position (0 3.640886326638518 0)
"cameras" SET Transform eulerAngles (15.444679340669495 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5352317563545801
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8261452946432808
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09917056535631744
"cameras/drone/drone0" SET Transform localPosition (0.8770941640463377 -0.06676569138991434 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05590698541512218 1.1848104681914091 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 19 -1)
"cameras/drone/drone0" SET Transform localScale (0.602231532129387 0.602231532129387 0.602231532129387)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -12 -13)
"cameras/drone/drone1" SET Transform localScale (1.1231507822482856 1.1231507822482856 1.1231507822482856)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.961759778674668 0)
"cameras" SET Transform eulerAngles (9.351145445651838 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8641019498022224
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3468182150371903
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13086818193223926
"cameras/drone/drone0" SET Transform localPosition (0.7094781111970827 -0.046041261287361024 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2120735460774794 1.2388659839402005 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -15 1)
"cameras/drone/drone0" SET Transform localScale (0.9732809621899424 0.9732809621899424 0.9732809621899424)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -19 -15)
"cameras/drone/drone1" SET Transform localScale (1.0596392626598812 1.0596392626598812 1.0596392626598812)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.444596561353595 0)
"cameras" SET Transform eulerAngles (11.68453390742037 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1887772509250623
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1200338335480922
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02175275927049274
"cameras/drone/drone0" SET Transform localPosition (-0.08229094196434295 -0.24453051886836424 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.13364359955821725 1.1881357411648992 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -8 -11)
"cameras/drone/drone0" SET Transform localScale (1.077545448559325 1.077545448559325 1.077545448559325)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -20 18)
"cameras/drone/drone1" SET Transform localScale (0.688808618089652 0.688808618089652 0.688808618089652)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.654999318172896 0)
"cameras" SET Transform eulerAngles (-18.53344005738604 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42146688172707664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5884170256789503
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3982091911262968
"cameras/drone/drone0" SET Transform localPosition (-1.0052788629156115 0.3563242388006654 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5871888887495929 1.1842584555852858 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 10 1)
"cameras/drone/drone0" SET Transform localScale (1.3122364214271094 1.3122364214271094 1.3122364214271094)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -16 -12)
"cameras/drone/drone1" SET Transform localScale (0.6030331968683036 0.6030331968683036 0.6030331968683036)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.089781849298223 0)
"cameras" SET Transform eulerAngles (-19.910293507208493 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7721441479496525
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2065370319977622
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23138994560521825
"cameras/drone/drone0" SET Transform localPosition (-0.2733649098957255 0.3667665447377951 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8686917021822858 1.019714566733739 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 14 -13)
"cameras/drone/drone0" SET Transform localScale (1.3892958794323635 1.3892958794323635 1.3892958794323635)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -18 -2)
"cameras/drone/drone1" SET Transform localScale (1.202819503132129 1.202819503132129 1.202819503132129)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.479604045692559 0)
"cameras" SET Transform eulerAngles (19.834134461256397 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3880755702456016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5139747046484902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17840713815381082
"cameras/drone/drone0" SET Transform localPosition (-0.5225478223069242 0.19847138943870984 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.37441432247003936 1.197115650151045 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 19 14)
"cameras/drone/drone0" SET Transform localScale (0.9711474760655445 0.9711474760655445 0.9711474760655445)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -3 13)
"cameras/drone/drone1" SET Transform localScale (1.4053991032105078 1.4053991032105078 1.4053991032105078)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.127127795849182 0)
"cameras" SET Transform eulerAngles (-18.2632820902935 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44663234276766256
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.436931336489304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2511129795858678
"cameras/drone/drone0" SET Transform localPosition (-0.023206658475438013 -0.1830753962282043 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0247694558075298 1.2881451316140464 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -5 12)
"cameras/drone/drone0" SET Transform localScale (1.3627527389467335 1.3627527389467335 1.3627527389467335)
"cameras/drone/drone1" SET Transform localEulerAngles (5 19 -15)
"cameras/drone/drone1" SET Transform localScale (1.0727242219685627 1.0727242219685627 1.0727242219685627)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1594877053588855 0)
"cameras" SET Transform eulerAngles (-17.417118683028953 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8534106925829108
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5173833591969368
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.008413942186030044
"cameras/drone/drone0" SET Transform localPosition (0.3180879430218875 0.5241302352529442 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.25514790566055234 0.9820201772170221 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -14 3)
"cameras/drone/drone0" SET Transform localScale (0.7863934347000259 0.7863934347000259 0.7863934347000259)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -4 14)
"cameras/drone/drone1" SET Transform localScale (0.6333942135911421 0.6333942135911421 0.6333942135911421)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.404304681967596 0)
"cameras" SET Transform eulerAngles (19.142581904005922 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.269450111999507
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6639210414150427
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09750950722942942
"cameras/drone/drone0" SET Transform localPosition (-0.2214985823281691 0.08950022993821577 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8524733957581925 1.0406470890267117 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 13 -7)
"cameras/drone/drone0" SET Transform localScale (0.9898659976924491 0.9898659976924491 0.9898659976924491)
"cameras/drone/drone1" SET Transform localEulerAngles (7 5 -11)
"cameras/drone/drone1" SET Transform localScale (0.618882284251454 0.618882284251454 0.618882284251454)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2137260770389187 0)
"cameras" SET Transform eulerAngles (2.7755139673781386 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5188866894878076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0881143216928906
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2745896612694259
"cameras/drone/drone0" SET Transform localPosition (0.004625428363756567 0.43375089193028754 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.38829767289027084 1.045450730622949 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -6 -10)
"cameras/drone/drone0" SET Transform localScale (1.0773102101122907 1.0773102101122907 1.0773102101122907)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 7 -9)
"cameras/drone/drone1" SET Transform localScale (0.7620394804403847 0.7620394804403847 0.7620394804403847)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.941745848532058 0)
"cameras" SET Transform eulerAngles (0.23225621911930716 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7041966593622029
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2824318169462883
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39692508008235133
"cameras/drone/drone0" SET Transform localPosition (0.7575044845430434 0.5598370771776662 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7548206243232767 0.9585985820409131 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -17 17)
"cameras/drone/drone0" SET Transform localScale (0.7642688431004897 0.7642688431004897 0.7642688431004897)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -11 -20)
"cameras/drone/drone1" SET Transform localScale (1.4683185031043648 1.4683185031043648 1.4683185031043648)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.60364243398575 0)
"cameras" SET Transform eulerAngles (14.512639326342295 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7216245301356784
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6766017995470945
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.007718014104760407
"cameras/drone/drone0" SET Transform localPosition (0.21325050526094902 0.29559060742957016 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5360335399162799 1.2312468325151578 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 10 -17)
"cameras/drone/drone0" SET Transform localScale (1.4957522450084046 1.4957522450084046 1.4957522450084046)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -1 -15)
"cameras/drone/drone1" SET Transform localScale (1.4486594926974024 1.4486594926974024 1.4486594926974024)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.739550214639355 0)
"cameras" SET Transform eulerAngles (15.819485545099027 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4862541267695086
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.250540725738903
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2940064325647311
"cameras/drone/drone0" SET Transform localPosition (-0.02368349266653924 0.048577199680211625 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.13408980662656478 1.0513421033826484 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -20 5)
"cameras/drone/drone0" SET Transform localScale (0.708638295817942 0.708638295817942 0.708638295817942)
"cameras/drone/drone1" SET Transform localEulerAngles (2 18 -19)
"cameras/drone/drone1" SET Transform localScale (0.8638471212164517 0.8638471212164517 0.8638471212164517)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.897125349413928 0)
"cameras" SET Transform eulerAngles (10.983715284380633 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.357420333770603
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1813937411651412
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14130240254362506
"cameras/drone/drone0" SET Transform localPosition (-0.975810228540621 0.6065198712922732 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5676117511775586 1.0067249941973406 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 18 9)
"cameras/drone/drone0" SET Transform localScale (1.094680002837541 1.094680002837541 1.094680002837541)
"cameras/drone/drone1" SET Transform localEulerAngles (4 14 7)
"cameras/drone/drone1" SET Transform localScale (1.1150716725735168 1.1150716725735168 1.1150716725735168)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2029086780643663 0)
"cameras" SET Transform eulerAngles (11.516344659908082 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2512485328087202
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8437655718365464
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08879541325405427
"cameras/drone/drone0" SET Transform localPosition (-0.5495298233971341 0.4792664307270978 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7439370565865719 0.8845240553981677 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -14 11)
"cameras/drone/drone0" SET Transform localScale (1.1871678911489454 1.1871678911489454 1.1871678911489454)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -5 -13)
"cameras/drone/drone1" SET Transform localScale (1.0584279851789877 1.0584279851789877 1.0584279851789877)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6399487734985527 0)
"cameras" SET Transform eulerAngles (10.097570143970987 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0430667828236966
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8350589493258327
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07116165727472375
"cameras/drone/drone0" SET Transform localPosition (0.40695466502833844 0.5064584879942897 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.36322456202444786 1.0915840950713085 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 14 -11)
"cameras/drone/drone0" SET Transform localScale (0.9967398568267434 0.9967398568267434 0.9967398568267434)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -8 0)
"cameras/drone/drone1" SET Transform localScale (1.0075038514919155 1.0075038514919155 1.0075038514919155)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5975895702766065 0)
"cameras" SET Transform eulerAngles (0.056210447457686996 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48812098081626626
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0311241002341214
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.017833101473801526
"cameras/drone/drone0" SET Transform localPosition (-0.6239300453667805 0.16978066040900835 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9162871870065672 0.9566767233691199 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -13 1)
"cameras/drone/drone0" SET Transform localScale (1.2427526801249773 1.2427526801249773 1.2427526801249773)
"cameras/drone/drone1" SET Transform localEulerAngles (14 7 9)
"cameras/drone/drone1" SET Transform localScale (1.1123914270382258 1.1123914270382258 1.1123914270382258)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.002135052858002 0)
"cameras" SET Transform eulerAngles (6.691193413799237 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2189827354658829
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4824546273804873
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14780919465010542
"cameras/drone/drone0" SET Transform localPosition (0.21986341589869762 0.0024877937020469365 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5861938552599906 1.2271301525762088 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -20 16)
"cameras/drone/drone0" SET Transform localScale (0.9410263688890894 0.9410263688890894 0.9410263688890894)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -10 1)
"cameras/drone/drone1" SET Transform localScale (0.8121467837422531 0.8121467837422531 0.8121467837422531)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.374809328077494 0)
"cameras" SET Transform eulerAngles (-11.868654128336615 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7539264034451724
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4043542881876383
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05636805805035277
"cameras/drone/drone0" SET Transform localPosition (-0.9615126160024209 -0.20683084425531945 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4570600532358551 1.276146261675041 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 0 -9)
"cameras/drone/drone0" SET Transform localScale (1.1482590135598647 1.1482590135598647 1.1482590135598647)
"cameras/drone/drone1" SET Transform localEulerAngles (12 13 13)
"cameras/drone/drone1" SET Transform localScale (0.9072929072256459 0.9072929072256459 0.9072929072256459)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.831713300646714 0)
"cameras" SET Transform eulerAngles (-3.9412465973734783 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9443451014763139
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1392818080892833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10365903220975375
"cameras/drone/drone0" SET Transform localPosition (0.5656209432490882 0.03814966471183939 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1742204508200644 1.2586486391650182 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -9 11)
"cameras/drone/drone0" SET Transform localScale (0.7629747002799918 0.7629747002799918 0.7629747002799918)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -19 17)
"cameras/drone/drone1" SET Transform localScale (0.6062325576560744 0.6062325576560744 0.6062325576560744)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.570668409046727 0)
"cameras" SET Transform eulerAngles (2.755299610771239 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5902814016155533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8333038746337964
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21755677359589473
"cameras/drone/drone0" SET Transform localPosition (0.1114372009246214 -0.13274480609822598 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.512254135397427 1.1644804268856026 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -1 -14)
"cameras/drone/drone0" SET Transform localScale (1.0727645930494032 1.0727645930494032 1.0727645930494032)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -3 -20)
"cameras/drone/drone1" SET Transform localScale (1.3680055493072216 1.3680055493072216 1.3680055493072216)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6934752011339165 0)
"cameras" SET Transform eulerAngles (-17.56837732942058 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4330031932770404
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8710978432273242
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34113006094761766
"cameras/drone/drone0" SET Transform localPosition (-0.8871327702918211 0.5657524264286171 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.11307257303487606 1.2514435384862772 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 15 -9)
"cameras/drone/drone0" SET Transform localScale (1.0309970762364302 1.0309970762364302 1.0309970762364302)
"cameras/drone/drone1" SET Transform localEulerAngles (4 11 14)
"cameras/drone/drone1" SET Transform localScale (1.0449794878741787 1.0449794878741787 1.0449794878741787)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.873414391153704 0)
"cameras" SET Transform eulerAngles (13.665483942856909 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.370113163617213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7833413316400653
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36170239518625136
"cameras/drone/drone0" SET Transform localPosition (-1.1137176898732069 -0.1706763997910296 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.53841589817869 1.1249574387247554 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 20 19)
"cameras/drone/drone0" SET Transform localScale (0.8747146200304781 0.8747146200304781 0.8747146200304781)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 13 5)
"cameras/drone/drone1" SET Transform localScale (0.9277870385440072 0.9277870385440072 0.9277870385440072)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2162333779144383 0)
"cameras" SET Transform eulerAngles (-12.853450246399248 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7767140789251921
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.19665178084171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.024451555319294993
"cameras/drone/drone0" SET Transform localPosition (-1.1080815100132158 -0.19133266480063765 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11671153977358961 1.1703737531811058 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 1 4)
"cameras/drone/drone0" SET Transform localScale (0.9464842507167117 0.9464842507167117 0.9464842507167117)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -17 -7)
"cameras/drone/drone1" SET Transform localScale (1.1162422931013747 1.1162422931013747 1.1162422931013747)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1019333807680374 0)
"cameras" SET Transform eulerAngles (-13.607476314911215 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5350251491557838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.043246549407266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09332317243521851
"cameras/drone/drone0" SET Transform localPosition (-0.6372486899525699 0.11510457520839651 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.01709203002208093 0.9299207536845997 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -8 11)
"cameras/drone/drone0" SET Transform localScale (1.302602775433479 1.302602775433479 1.302602775433479)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -18 15)
"cameras/drone/drone1" SET Transform localScale (1.2973328067834977 1.2973328067834977 1.2973328067834977)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.631178810715705 0)
"cameras" SET Transform eulerAngles (-1.677903021596208 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4245650625599992
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3067730099309591
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32839166690593413
"cameras/drone/drone0" SET Transform localPosition (-0.8628007814543368 -0.17729776930238655 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.022105777494207057 1.150720931668677 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 8 12)
"cameras/drone/drone0" SET Transform localScale (0.7592392791731212 0.7592392791731212 0.7592392791731212)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -9 -12)
"cameras/drone/drone1" SET Transform localScale (0.8714874078969872 0.8714874078969872 0.8714874078969872)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7199386337590727 0)
"cameras" SET Transform eulerAngles (16.972595671384006 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.079341946792243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3527144444710246
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2587472347370337
"cameras/drone/drone0" SET Transform localPosition (0.40267879854863264 0.22568354927383677 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.31122223587324527 0.9372763846056877 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 20 1)
"cameras/drone/drone0" SET Transform localScale (1.2988472336873813 1.2988472336873813 1.2988472336873813)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -6 5)
"cameras/drone/drone1" SET Transform localScale (1.3575614718047757 1.3575614718047757 1.3575614718047757)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.638167311015737 0)
"cameras" SET Transform eulerAngles (-13.490897109408353 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9862845853333694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3728638491975125
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26635090991549465
"cameras/drone/drone0" SET Transform localPosition (1.0326164378976272 0.5125095169177858 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5346888391067447 1.189532476238897 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -6 1)
"cameras/drone/drone0" SET Transform localScale (0.7792526709345104 0.7792526709345104 0.7792526709345104)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 17 -9)
"cameras/drone/drone1" SET Transform localScale (1.1652729270931879 1.1652729270931879 1.1652729270931879)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.470608900530894 0)
"cameras" SET Transform eulerAngles (13.736757992810269 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8969576885775914
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0959629158503683
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02858403186099259
"cameras/drone/drone0" SET Transform localPosition (-1.0527648537876333 0.35644131408000906 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5600174669266377 1.0621360573332241 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -17 -10)
"cameras/drone/drone0" SET Transform localScale (1.0669312493913545 1.0669312493913545 1.0669312493913545)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 14 -14)
"cameras/drone/drone1" SET Transform localScale (1.061633215032092 1.061633215032092 1.061633215032092)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8820931471004414 0)
"cameras" SET Transform eulerAngles (-19.527609129753003 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8020423286139504
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0726192784495057
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3068785562792246
"cameras/drone/drone0" SET Transform localPosition (0.9101380037109845 0.32946346069406346 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1508764821748312 1.1010762701119325 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 17 -6)
"cameras/drone/drone0" SET Transform localScale (0.996140377775813 0.996140377775813 0.996140377775813)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 3 -20)
"cameras/drone/drone1" SET Transform localScale (1.3127785250795871 1.3127785250795871 1.3127785250795871)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9312788207271256 0)
"cameras" SET Transform eulerAngles (14.61349405438353 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7140496923486911
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9742174618755448
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14198965826073315
"cameras/drone/drone0" SET Transform localPosition (0.27605476395690975 -0.24529295210175922 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7357838383535715 1.2695611965609197 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -10 -20)
"cameras/drone/drone0" SET Transform localScale (0.6904984595530561 0.6904984595530561 0.6904984595530561)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 2 17)
"cameras/drone/drone1" SET Transform localScale (0.688407796169886 0.688407796169886 0.688407796169886)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.755865062199598 0)
"cameras" SET Transform eulerAngles (1.9581455219968156 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6618580028885632
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2179101738572928
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13685397791338147
"cameras/drone/drone0" SET Transform localPosition (-0.26956990490940747 -0.032330968755723666 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1941881467245168 0.8611406784725435 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 9 12)
"cameras/drone/drone0" SET Transform localScale (1.1441387488450845 1.1441387488450845 1.1441387488450845)
"cameras/drone/drone1" SET Transform localEulerAngles (18 3 4)
"cameras/drone/drone1" SET Transform localScale (1.4632420954482477 1.4632420954482477 1.4632420954482477)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.712217726181688 0)
"cameras" SET Transform eulerAngles (-12.165784383427134 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.523339458131416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.047265606737288
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3709048210575925
"cameras/drone/drone0" SET Transform localPosition (0.09727800739834991 0.571371393107732 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5171666020989345 0.8929024241082815 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -7 16)
"cameras/drone/drone0" SET Transform localScale (1.1527380558919087 1.1527380558919087 1.1527380558919087)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -5 -5)
"cameras/drone/drone1" SET Transform localScale (1.1783916094372962 1.1783916094372962 1.1783916094372962)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.543817942299301 0)
"cameras" SET Transform eulerAngles (-7.768387177155116 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.901159743746324
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8274018222072033
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3181686790294615
"cameras/drone/drone0" SET Transform localPosition (0.5207947396392061 0.353508823194658 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4906054220261715 1.1428575734902489 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 0 -18)
"cameras/drone/drone0" SET Transform localScale (0.8945726188029184 0.8945726188029184 0.8945726188029184)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -16 -15)
"cameras/drone/drone1" SET Transform localScale (1.362181463604324 1.362181463604324 1.362181463604324)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.276650195118858 0)
"cameras" SET Transform eulerAngles (14.026067861350121 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5747879187676521
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9499034473833592
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27210255795316074
"cameras/drone/drone0" SET Transform localPosition (1.0649300273013156 0.04530535694571097 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.300522823862698 1.1619111061476697 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 12 -9)
"cameras/drone/drone0" SET Transform localScale (0.6834218045505459 0.6834218045505459 0.6834218045505459)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -20 3)
"cameras/drone/drone1" SET Transform localScale (1.4493297395214897 1.4493297395214897 1.4493297395214897)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.412748149089615 0)
"cameras" SET Transform eulerAngles (6.991457498206945 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7949249309516884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.079199082613245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09387618566908773
"cameras/drone/drone0" SET Transform localPosition (0.07313162057918365 0.6867826866319555 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9521199888104316 0.8864082899343729 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -10 13)
"cameras/drone/drone0" SET Transform localScale (1.3806491766920241 1.3806491766920241 1.3806491766920241)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 5 4)
"cameras/drone/drone1" SET Transform localScale (1.2544136132078685 1.2544136132078685 1.2544136132078685)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.88060395310582 0)
"cameras" SET Transform eulerAngles (5.2766516286210035 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1762475396327612
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1918916064398588
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2013677864482522
"cameras/drone/drone0" SET Transform localPosition (1.012093572101264 -0.20043123557024617 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09247959977790776 1.250089779618092 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -7 14)
"cameras/drone/drone0" SET Transform localScale (1.0581974175404718 1.0581974175404718 1.0581974175404718)
"cameras/drone/drone1" SET Transform localEulerAngles (1 13 13)
"cameras/drone/drone1" SET Transform localScale (0.6558247146929014 0.6558247146929014 0.6558247146929014)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.728144788283263 0)
"cameras" SET Transform eulerAngles (-8.857805149752354 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.057057726451296
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3659000978238218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22700009736413387
"cameras/drone/drone0" SET Transform localPosition (0.6373125733523415 0.6252199918367363 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2399491048210769 1.0488555085313052 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 14 -19)
"cameras/drone/drone0" SET Transform localScale (1.1443093445833314 1.1443093445833314 1.1443093445833314)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 18 5)
"cameras/drone/drone1" SET Transform localScale (0.8090768300493297 0.8090768300493297 0.8090768300493297)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.012885027621638 0)
"cameras" SET Transform eulerAngles (-0.015217573625939451 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.561118121726623
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6448300999258727
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23982395544691185
"cameras/drone/drone0" SET Transform localPosition (0.2678103752173586 0.621519435844911 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.510485378552612 1.110577176139497 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -3 -8)
"cameras/drone/drone0" SET Transform localScale (1.2114940835177959 1.2114940835177959 1.2114940835177959)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -9 -16)
"cameras/drone/drone1" SET Transform localScale (0.6638403784180527 0.6638403784180527 0.6638403784180527)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.797885333003551 0)
"cameras" SET Transform eulerAngles (-10.753488282832082 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0981101735900844
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9328910354644151
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20284164159937174
"cameras/drone/drone0" SET Transform localPosition (-1.1011264569137202 0.6450458141237738 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6332757667213031 1.2099854487165063 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 1 4)
"cameras/drone/drone0" SET Transform localScale (1.2620741657212848 1.2620741657212848 1.2620741657212848)
"cameras/drone/drone1" SET Transform localEulerAngles (13 12 -11)
"cameras/drone/drone1" SET Transform localScale (0.8201870249986901 0.8201870249986901 0.8201870249986901)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.885391594454434 0)
"cameras" SET Transform eulerAngles (2.477600033781002 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6164764061420481
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.644498713777799
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1439940139152077
"cameras/drone/drone0" SET Transform localPosition (1.164000079633195 0.46403572594458337 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1864612985339802 0.8595932257132696 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -17 -11)
"cameras/drone/drone0" SET Transform localScale (1.1058705352527323 1.1058705352527323 1.1058705352527323)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -6 13)
"cameras/drone/drone1" SET Transform localScale (0.9253394481222806 0.9253394481222806 0.9253394481222806)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4349918459826103 0)
"cameras" SET Transform eulerAngles (3.343831094638624 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5820536814923347
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.599556944417041
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26868702655448135
"cameras/drone/drone0" SET Transform localPosition (-1.0884749229273243 0.036439965985796186 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19982757013590402 1.2006974159324442 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 17 -17)
"cameras/drone/drone0" SET Transform localScale (0.6553891283921144 0.6553891283921144 0.6553891283921144)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -12 1)
"cameras/drone/drone1" SET Transform localScale (1.2323010502839662 1.2323010502839662 1.2323010502839662)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.248455639363838 0)
"cameras" SET Transform eulerAngles (-11.273550191394435 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.374587210536581
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4638238345961128
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3620954957190458
"cameras/drone/drone0" SET Transform localPosition (-0.729208183985935 0.043009313848176134 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.011818726391073 1.172885748363837 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -15 8)
"cameras/drone/drone0" SET Transform localScale (0.6175328086727987 0.6175328086727987 0.6175328086727987)
"cameras/drone/drone1" SET Transform localEulerAngles (9 5 -7)
"cameras/drone/drone1" SET Transform localScale (0.6002437940057126 0.6002437940057126 0.6002437940057126)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.100941287271527 0)
"cameras" SET Transform eulerAngles (13.287201696326271 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8576152560243882
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4914302926025895
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22422051584018177
"cameras/drone/drone0" SET Transform localPosition (-0.7722196157993853 0.3112238261816322 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9447728753348212 1.1912080836992922 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -14 7)
"cameras/drone/drone0" SET Transform localScale (1.0052822144565392 1.0052822144565392 1.0052822144565392)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -19 -12)
"cameras/drone/drone1" SET Transform localScale (0.6502822841595831 0.6502822841595831 0.6502822841595831)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.643673561127869 0)
"cameras" SET Transform eulerAngles (-16.59536935662548 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2715832855535592
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4724557044831135
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.296243287649723
"cameras/drone/drone0" SET Transform localPosition (0.1712142679057258 0.22343662420259297 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9142787723047661 1.1051433209626815 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 7 -18)
"cameras/drone/drone0" SET Transform localScale (1.1827721733652807 1.1827721733652807 1.1827721733652807)
"cameras/drone/drone1" SET Transform localEulerAngles (15 14 10)
"cameras/drone/drone1" SET Transform localScale (1.3790184418825815 1.3790184418825815 1.3790184418825815)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.139097208372455 0)
"cameras" SET Transform eulerAngles (-14.349287710216636 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7322519644387375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3623543163164102
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2368270914579268
"cameras/drone/drone0" SET Transform localPosition (1.1699380078347408 0.43914065915089734 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7535049006005238 0.934082068593415 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 19 1)
"cameras/drone/drone0" SET Transform localScale (1.4883228866672655 1.4883228866672655 1.4883228866672655)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 16 -19)
"cameras/drone/drone1" SET Transform localScale (1.2775131172902483 1.2775131172902483 1.2775131172902483)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.60908637517992 0)
"cameras" SET Transform eulerAngles (3.845005596592536 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6628180985224968
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3117627376805499
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37592020167959794
"cameras/drone/drone0" SET Transform localPosition (-1.0418276514625848 0.3252692589980635 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.11858946663813241 0.9148903934193923 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 10 13)
"cameras/drone/drone0" SET Transform localScale (0.8937859147215406 0.8937859147215406 0.8937859147215406)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -17 -19)
"cameras/drone/drone1" SET Transform localScale (1.1387917538878165 1.1387917538878165 1.1387917538878165)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.674993320797605 0)
"cameras" SET Transform eulerAngles (2.479043887364792 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2351976719732318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4009842447157212
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14405382297361982
"cameras/drone/drone0" SET Transform localPosition (0.4491819257578409 0.6353614976740363 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7961496890632402 1.2951079940590438 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -1 11)
"cameras/drone/drone0" SET Transform localScale (1.236104759788365 1.236104759788365 1.236104759788365)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -13 3)
"cameras/drone/drone1" SET Transform localScale (1.4728032765217036 1.4728032765217036 1.4728032765217036)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.684049572982844 0)
"cameras" SET Transform eulerAngles (18.576656502063408 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9363852820674151
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.665563400361074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.056116544103761795
"cameras/drone/drone0" SET Transform localPosition (-0.09270091303195893 -0.2079831372673417 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7231817722614335 0.8380283259606578 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 17 -13)
"cameras/drone/drone0" SET Transform localScale (0.77079754008448 0.77079754008448 0.77079754008448)
"cameras/drone/drone1" SET Transform localEulerAngles (0 15 -16)
"cameras/drone/drone1" SET Transform localScale (1.3768928190785075 1.3768928190785075 1.3768928190785075)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.321609764352734 0)
"cameras" SET Transform eulerAngles (-11.700803442664194 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2612678061876617
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.231848615722381
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2948353024386975
"cameras/drone/drone0" SET Transform localPosition (1.157362409873498 0.09364547888833813 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9057932445594397 1.0858350727226567 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -14 -5)
"cameras/drone/drone0" SET Transform localScale (0.8412143383228823 0.8412143383228823 0.8412143383228823)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -19 12)
"cameras/drone/drone1" SET Transform localScale (0.7572431271201234 0.7572431271201234 0.7572431271201234)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.621489417256242 0)
"cameras" SET Transform eulerAngles (-2.4624571061707776 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5024882734366689
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.406842899469797
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06400865355898407
"cameras/drone/drone0" SET Transform localPosition (-0.13416052596724093 0.41446301715171413 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04258979254681017 1.144754933205362 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 15 15)
"cameras/drone/drone0" SET Transform localScale (1.4032628980808082 1.4032628980808082 1.4032628980808082)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -10 -16)
"cameras/drone/drone1" SET Transform localScale (0.6778236535078549 0.6778236535078549 0.6778236535078549)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1431010954685625 0)
"cameras" SET Transform eulerAngles (10.283848636629006 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5921036055834934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0950159342074028
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1754468814421704
"cameras/drone/drone0" SET Transform localPosition (0.289678798254998 0.4240355342042523 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.49996236914751535 0.8143168689146798 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -8 3)
"cameras/drone/drone0" SET Transform localScale (1.0931148853123567 1.0931148853123567 1.0931148853123567)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -9 8)
"cameras/drone/drone1" SET Transform localScale (1.447744952416562 1.447744952416562 1.447744952416562)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.270892171529936 0)
"cameras" SET Transform eulerAngles (-6.034345464242525 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1268158650265598
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6200259469925107
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39989655314867645
"cameras/drone/drone0" SET Transform localPosition (-0.7556059854985337 0.6557768365563443 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8480989202594453 1.011475407014271 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -3 17)
"cameras/drone/drone0" SET Transform localScale (1.4744012120433485 1.4744012120433485 1.4744012120433485)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 12 0)
"cameras/drone/drone1" SET Transform localScale (0.8574789279396462 0.8574789279396462 0.8574789279396462)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.686017623354197 0)
"cameras" SET Transform eulerAngles (-15.730504107381034 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6884903075936748
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.015345551716821
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2820812560185852
"cameras/drone/drone0" SET Transform localPosition (-0.2675447899438551 0.03017641091575768 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8383149601354194 1.1431782336946055 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -16 -18)
"cameras/drone/drone0" SET Transform localScale (0.840023212173392 0.840023212173392 0.840023212173392)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 17 -7)
"cameras/drone/drone1" SET Transform localScale (0.7374793328903012 0.7374793328903012 0.7374793328903012)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4917682585986505 0)
"cameras" SET Transform eulerAngles (-6.769858965641333 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4912334839331227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.062272612148906
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.309668797628603
"cameras/drone/drone0" SET Transform localPosition (0.2872351257574628 0.5949582013638155 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.19319575351233276 1.2789971353898677 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 6 -6)
"cameras/drone/drone0" SET Transform localScale (1.270736850503675 1.270736850503675 1.270736850503675)
"cameras/drone/drone1" SET Transform localEulerAngles (4 1 8)
"cameras/drone/drone1" SET Transform localScale (1.224301250261757 1.224301250261757 1.224301250261757)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.945804957476251 0)
"cameras" SET Transform eulerAngles (17.129818298123034 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7271966876638285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0376334625910821
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13562493380408433
"cameras/drone/drone0" SET Transform localPosition (0.8207691489019913 -0.08550295644242228 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0080652324679014 1.2894827340294959 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 4 -11)
"cameras/drone/drone0" SET Transform localScale (1.0064790142860587 1.0064790142860587 1.0064790142860587)
"cameras/drone/drone1" SET Transform localEulerAngles (9 7 -20)
"cameras/drone/drone1" SET Transform localScale (0.875437924842993 0.875437924842993 0.875437924842993)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9788417826922786 0)
"cameras" SET Transform eulerAngles (1.3538480870086076 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.581562061410526
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.244783590869364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31734862015050325
"cameras/drone/drone0" SET Transform localPosition (0.18375080440051073 0.5054383142665848 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.827739944491859 1.1157782995813508 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -17 -18)
"cameras/drone/drone0" SET Transform localScale (1.1215895868270989 1.1215895868270989 1.1215895868270989)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -5 -4)
"cameras/drone/drone1" SET Transform localScale (0.9435812713526772 0.9435812713526772 0.9435812713526772)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.305785667441998 0)
"cameras" SET Transform eulerAngles (-15.155093319234872 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3657153709543328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.780790363492577
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19299064535525343
"cameras/drone/drone0" SET Transform localPosition (-0.5441120160482851 -0.21198099712149115 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5234665363286379 0.8364320574988569 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 20 -14)
"cameras/drone/drone0" SET Transform localScale (0.850922710710504 0.850922710710504 0.850922710710504)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -14 -7)
"cameras/drone/drone1" SET Transform localScale (0.6932556595742643 0.6932556595742643 0.6932556595742643)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8903232856288392 0)
"cameras" SET Transform eulerAngles (-16.136170541407118 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.453192977603634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9352149239411344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12416637008653982
"cameras/drone/drone0" SET Transform localPosition (0.08152081282501533 -0.26653655687179484 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5838971113300488 0.8627146024241861 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -8 15)
"cameras/drone/drone0" SET Transform localScale (1.3522301467925812 1.3522301467925812 1.3522301467925812)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 11 -7)
"cameras/drone/drone1" SET Transform localScale (0.7066112341573001 0.7066112341573001 0.7066112341573001)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.190859711014058 0)
"cameras" SET Transform eulerAngles (-2.1926563269110204 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.307223924591522
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4475608089594312
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2802733280061588
"cameras/drone/drone0" SET Transform localPosition (1.178369379965541 0.47280166229201287 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7177002426459489 1.1451643449038331 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 4 -17)
"cameras/drone/drone0" SET Transform localScale (1.1364534623193165 1.1364534623193165 1.1364534623193165)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 8 9)
"cameras/drone/drone1" SET Transform localScale (0.6936575881555217 0.6936575881555217 0.6936575881555217)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8628193446889725 0)
"cameras" SET Transform eulerAngles (4.160660123255596 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9408856870957046
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9725483322504758
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.012932537551600554
"cameras/drone/drone0" SET Transform localPosition (-0.550272561607701 0.32837242343205414 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4796506465326956 1.248505555443027 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 14 14)
"cameras/drone/drone0" SET Transform localScale (1.1348049020666644 1.1348049020666644 1.1348049020666644)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -9 13)
"cameras/drone/drone1" SET Transform localScale (1.4966724216723204 1.4966724216723204 1.4966724216723204)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1069570079284348 0)
"cameras" SET Transform eulerAngles (-17.4435280674801 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.694354605931115
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6701057869176528
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28162948657129866
"cameras/drone/drone0" SET Transform localPosition (0.09835080601858315 0.6753982780778967 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24067525924311983 0.9468794414248689 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -19 -14)
"cameras/drone/drone0" SET Transform localScale (1.0499476975720152 1.0499476975720152 1.0499476975720152)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 12 -12)
"cameras/drone/drone1" SET Transform localScale (1.2026495243514215 1.2026495243514215 1.2026495243514215)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.14176351003167 0)
"cameras" SET Transform eulerAngles (-13.51986525757229 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4060184546406571
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8138456741681261
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14336124765497635
"cameras/drone/drone0" SET Transform localPosition (0.09027485622059772 0.6625725931143072 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9606848337149128 0.8069732510007883 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 12 -8)
"cameras/drone/drone0" SET Transform localScale (1.490190874544688 1.490190874544688 1.490190874544688)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -6 -1)
"cameras/drone/drone1" SET Transform localScale (0.6255342296905666 0.6255342296905666 0.6255342296905666)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.852370296990939 0)
"cameras" SET Transform eulerAngles (-1.972415920668439 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2955617724023116
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8787418506306353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.041078017904794845
"cameras/drone/drone0" SET Transform localPosition (-0.34227810492822996 0.45174166021370504 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.898862122770945 1.2168569456224287 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 17 19)
"cameras/drone/drone0" SET Transform localScale (0.9576360432685307 0.9576360432685307 0.9576360432685307)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -10 -20)
"cameras/drone/drone1" SET Transform localScale (0.8224503972479467 0.8224503972479467 0.8224503972479467)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.876956915895873 0)
"cameras" SET Transform eulerAngles (-14.600221842782357 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0072444547389332
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.995179634064559
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3389341044457408
"cameras/drone/drone0" SET Transform localPosition (-0.2556987794449789 0.21287099317021324 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.26815360963762 1.020731490496777 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -4 0)
"cameras/drone/drone0" SET Transform localScale (1.113400650097408 1.113400650097408 1.113400650097408)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -6 19)
"cameras/drone/drone1" SET Transform localScale (0.6127373010121075 0.6127373010121075 0.6127373010121075)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.592443866123914 0)
"cameras" SET Transform eulerAngles (7.158405861570895 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1075757730627465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5839089416995036
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15712520698443844
"cameras/drone/drone0" SET Transform localPosition (-0.38836554671009715 0.43241391975980675 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6841136751254657 0.9172597959849633 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -17 -13)
"cameras/drone/drone0" SET Transform localScale (1.0688157485765117 1.0688157485765117 1.0688157485765117)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 4 9)
"cameras/drone/drone1" SET Transform localScale (1.323529799549886 1.323529799549886 1.323529799549886)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.721800017111122 0)
"cameras" SET Transform eulerAngles (-19.02760153010895 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2532701121214327
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.085377348964754
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14046712207999038
"cameras/drone/drone0" SET Transform localPosition (-0.5918700898806494 -0.22210166646408408 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0256055979496532 1.0536277742243905 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -17 -13)
"cameras/drone/drone0" SET Transform localScale (1.1475763505434582 1.1475763505434582 1.1475763505434582)
"cameras/drone/drone1" SET Transform localEulerAngles (10 9 -11)
"cameras/drone/drone1" SET Transform localScale (0.8297706531218034 0.8297706531218034 0.8297706531218034)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5599154169448584 0)
"cameras" SET Transform eulerAngles (-9.156675600682291 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7522720018724309
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8462954861526426
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30340049598581165
"cameras/drone/drone0" SET Transform localPosition (0.31686797665564814 0.45103332137529656 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0691204544220534 0.8944608697328728 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 15 13)
"cameras/drone/drone0" SET Transform localScale (1.1599951682020313 1.1599951682020313 1.1599951682020313)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -6 -11)
"cameras/drone/drone1" SET Transform localScale (1.1488414377449785 1.1488414377449785 1.1488414377449785)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5532766970617464 0)
"cameras" SET Transform eulerAngles (-8.096779105429812 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9858007366734548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.552269335580089
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25909408956335045
"cameras/drone/drone0" SET Transform localPosition (0.31784133648919477 0.6229107073921087 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5688179529685427 0.9518099699897802 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 13 6)
"cameras/drone/drone0" SET Transform localScale (0.7130267323148171 0.7130267323148171 0.7130267323148171)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -13 -19)
"cameras/drone/drone1" SET Transform localScale (1.2582096913825649 1.2582096913825649 1.2582096913825649)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.935102250286003 0)
"cameras" SET Transform eulerAngles (13.063878589329498 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6987752776615088
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.398565029948813
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0033445549795491306
"cameras/drone/drone0" SET Transform localPosition (0.159170912890918 0.5183333385507911 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.031243885670454663 0.9375863584224801 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 11 9)
"cameras/drone/drone0" SET Transform localScale (0.8360768622060744 0.8360768622060744 0.8360768622060744)
"cameras/drone/drone1" SET Transform localEulerAngles (19 1 -10)
"cameras/drone/drone1" SET Transform localScale (0.7641053430146831 0.7641053430146831 0.7641053430146831)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.25710058726171 0)
"cameras" SET Transform eulerAngles (6.933620216773747 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9549891805867124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0660032193469797
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37874439897055984
"cameras/drone/drone0" SET Transform localPosition (-0.8375900013621524 0.2025685945189905 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5370931789842881 0.9674064707200162 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -12 -6)
"cameras/drone/drone0" SET Transform localScale (0.691241398386575 0.691241398386575 0.691241398386575)
"cameras/drone/drone1" SET Transform localEulerAngles (4 8 -5)
"cameras/drone/drone1" SET Transform localScale (1.3659549180279091 1.3659549180279091 1.3659549180279091)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.688045151716995 0)
"cameras" SET Transform eulerAngles (11.587139635135173 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2681760493216703
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.072615891668717
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3495896170162989
"cameras/drone/drone0" SET Transform localPosition (-0.3434438309224347 -0.08210167807973762 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7416964781138996 1.2139124812422155 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -1 0)
"cameras/drone/drone0" SET Transform localScale (1.315152239911876 1.315152239911876 1.315152239911876)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -18 11)
"cameras/drone/drone1" SET Transform localScale (1.120734016705482 1.120734016705482 1.120734016705482)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.861368106490705 0)
"cameras" SET Transform eulerAngles (-3.3175363435600502 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0372078903025612
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9143442623287446
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.009690961109421492
"cameras/drone/drone0" SET Transform localPosition (-0.4804443876488489 0.052916704281242566 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5842332437636817 1.1863695565493457 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -15 11)
"cameras/drone/drone0" SET Transform localScale (1.2277902786436825 1.2277902786436825 1.2277902786436825)
"cameras/drone/drone1" SET Transform localEulerAngles (3 5 -7)
"cameras/drone/drone1" SET Transform localScale (0.8196072503367582 0.8196072503367582 0.8196072503367582)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.500788306380311 0)
"cameras" SET Transform eulerAngles (12.144058724895423 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6713450817703834
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1899099361018042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.021999444989311546
"cameras/drone/drone0" SET Transform localPosition (1.1411412932945166 0.6993584661813395 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8844490674379342 1.0462158247068778 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 4 -14)
"cameras/drone/drone0" SET Transform localScale (0.8162280185911646 0.8162280185911646 0.8162280185911646)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 16 -19)
"cameras/drone/drone1" SET Transform localScale (0.8403765957447558 0.8403765957447558 0.8403765957447558)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5261758441495985 0)
"cameras" SET Transform eulerAngles (-19.13183961942753 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1258569557850584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2900390933424914
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06487205033546006
"cameras/drone/drone0" SET Transform localPosition (-0.9648022727484127 -0.22615404695223412 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.15548797812936344 1.0560955193544754 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 17 -17)
"cameras/drone/drone0" SET Transform localScale (0.6042714666784718 0.6042714666784718 0.6042714666784718)
"cameras/drone/drone1" SET Transform localEulerAngles (4 12 -16)
"cameras/drone/drone1" SET Transform localScale (0.7080626541962041 0.7080626541962041 0.7080626541962041)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.727866172334348 0)
"cameras" SET Transform eulerAngles (-14.935244358556075 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6422606177520767
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9691819985826705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10990338839383776
"cameras/drone/drone0" SET Transform localPosition (0.673145253209658 0.31705984597624065 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03420194631184481 1.115078740792749 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 10 15)
"cameras/drone/drone0" SET Transform localScale (1.4340968116182546 1.4340968116182546 1.4340968116182546)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -18 12)
"cameras/drone/drone1" SET Transform localScale (1.0954067139957755 1.0954067139957755 1.0954067139957755)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.631038614293704 0)
"cameras" SET Transform eulerAngles (-5.5253478233453635 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0983990237944952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3419684109653718
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2778172396620951
"cameras/drone/drone0" SET Transform localPosition (-0.8291060753588114 0.12538286786452862 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.04738567267215843 1.2680719098364328 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -16 -20)
"cameras/drone/drone0" SET Transform localScale (0.7437116170452729 0.7437116170452729 0.7437116170452729)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 0 -2)
"cameras/drone/drone1" SET Transform localScale (1.0370024244474612 1.0370024244474612 1.0370024244474612)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5462407026446225 0)
"cameras" SET Transform eulerAngles (4.740642973566473 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.901011525570102
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9569497785327425
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32538167052274414
"cameras/drone/drone0" SET Transform localPosition (-0.31117729031201125 0.3297520142214803 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40841474999933136 1.282564371100377 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 4 -3)
"cameras/drone/drone0" SET Transform localScale (1.4240343295628184 1.4240343295628184 1.4240343295628184)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 13 -8)
"cameras/drone/drone1" SET Transform localScale (0.6987233408106888 0.6987233408106888 0.6987233408106888)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.461169261966458 0)
"cameras" SET Transform eulerAngles (-9.065995546900115 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4043076974562712
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.349358948642855
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3983899169084914
"cameras/drone/drone0" SET Transform localPosition (0.2783486318419617 0.25013694068640097 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6984487723011115 0.9304476590455274 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -10 -4)
"cameras/drone/drone0" SET Transform localScale (0.6754609877403266 0.6754609877403266 0.6754609877403266)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -1 -10)
"cameras/drone/drone1" SET Transform localScale (0.6551019373279149 0.6551019373279149 0.6551019373279149)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.827144555682351 0)
"cameras" SET Transform eulerAngles (-9.573023162927491 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2369967797400825
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0871710542082187
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3285742917645808
"cameras/drone/drone0" SET Transform localPosition (-0.01889576193317022 0.02949353585504183 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.39253566513096294 1.0741785323775555 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -14 8)
"cameras/drone/drone0" SET Transform localScale (0.9283941826852589 0.9283941826852589 0.9283941826852589)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -18 -18)
"cameras/drone/drone1" SET Transform localScale (1.4772710268152458 1.4772710268152458 1.4772710268152458)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5488966759267377 0)
"cameras" SET Transform eulerAngles (-18.07985298864175 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0149821973662654
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.937864871042064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19456814868119326
"cameras/drone/drone0" SET Transform localPosition (0.002871072020582899 0.12748771946976006 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03354944295474871 1.2470147251416726 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 13 -9)
"cameras/drone/drone0" SET Transform localScale (0.7662553636615062 0.7662553636615062 0.7662553636615062)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -15 -14)
"cameras/drone/drone1" SET Transform localScale (0.7849511573007831 0.7849511573007831 0.7849511573007831)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3563246730683476 0)
"cameras" SET Transform eulerAngles (7.703408758713714 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.565652050847886
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9604589182993646
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3168776931625394
"cameras/drone/drone0" SET Transform localPosition (0.24175563926527488 -0.2763379526358147 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9637903937192942 0.9170300015941222 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 4 14)
"cameras/drone/drone0" SET Transform localScale (1.2165515283946786 1.2165515283946786 1.2165515283946786)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 14 16)
"cameras/drone/drone1" SET Transform localScale (1.1310443839702822 1.1310443839702822 1.1310443839702822)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.836628439737358 0)
"cameras" SET Transform eulerAngles (1.0638273475597195 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1833503057695065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3850416898162516
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08500622784088843
"cameras/drone/drone0" SET Transform localPosition (-0.38747256030015287 -0.0058537421936201706 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.922317326401463 1.0006948103452302 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -13 2)
"cameras/drone/drone0" SET Transform localScale (0.6430781503285848 0.6430781503285848 0.6430781503285848)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -16 -15)
"cameras/drone/drone1" SET Transform localScale (0.7789127750001307 0.7789127750001307 0.7789127750001307)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.329420716725814 0)
"cameras" SET Transform eulerAngles (-2.1514366682963946 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7650453705107426
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3986638003712228
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07819954074742119
"cameras/drone/drone0" SET Transform localPosition (-0.4013012128443997 0.42246697616734813 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0038245804324497 1.0535664230155934 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -15 10)
"cameras/drone/drone0" SET Transform localScale (0.9042628370597119 0.9042628370597119 0.9042628370597119)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 6 0)
"cameras/drone/drone1" SET Transform localScale (1.1279397840448053 1.1279397840448053 1.1279397840448053)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8755319574086515 0)
"cameras" SET Transform eulerAngles (-4.847358880718771 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0327148055848785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9133445028810023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07400018698174952
"cameras/drone/drone0" SET Transform localPosition (-0.6533670792132348 0.15499453127788537 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7350064865302246 0.8056165720199615 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 3 13)
"cameras/drone/drone0" SET Transform localScale (0.777775071691776 0.777775071691776 0.777775071691776)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -19 13)
"cameras/drone/drone1" SET Transform localScale (0.9518292876064848 0.9518292876064848 0.9518292876064848)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.181378855911991 0)
"cameras" SET Transform eulerAngles (5.947683001846855 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7635706916488957
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3125395927352796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3138158514376621
"cameras/drone/drone0" SET Transform localPosition (-0.6224547495213889 0.07007654912404676 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7540257441992426 0.9156653874967597 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 15 11)
"cameras/drone/drone0" SET Transform localScale (1.389938428832298 1.389938428832298 1.389938428832298)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 2 -20)
"cameras/drone/drone1" SET Transform localScale (1.4078219808849601 1.4078219808849601 1.4078219808849601)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.582287004234825 0)
"cameras" SET Transform eulerAngles (13.300552708517003 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.450757537770008
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.376054032502843
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.004232965492835561
"cameras/drone/drone0" SET Transform localPosition (-0.18932468430442984 0.4336306397892851 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7451534665277175 0.939569680337853 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 18 -5)
"cameras/drone/drone0" SET Transform localScale (1.4121688757146296 1.4121688757146296 1.4121688757146296)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 1 -9)
"cameras/drone/drone1" SET Transform localScale (0.7115322963154083 0.7115322963154083 0.7115322963154083)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.073078091525302 0)
"cameras" SET Transform eulerAngles (-6.33837936949301 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.391905928590546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5960622398980238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26311707863663547
"cameras/drone/drone0" SET Transform localPosition (0.2237855338513841 0.13244947580133642 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6034917692775715 1.2357530473095584 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -17 -4)
"cameras/drone/drone0" SET Transform localScale (0.642917258010117 0.642917258010117 0.642917258010117)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 8 13)
"cameras/drone/drone1" SET Transform localScale (1.3889896434397513 1.3889896434397513 1.3889896434397513)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.392615030203277 0)
"cameras" SET Transform eulerAngles (-3.077351773263377 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8069554397255883
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.222200453758975
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19376121854850822
"cameras/drone/drone0" SET Transform localPosition (-1.1432703238389543 -0.2601011341091311 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3802386905081985 0.9694915207313487 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 9 -5)
"cameras/drone/drone0" SET Transform localScale (0.7695886574156239 0.7695886574156239 0.7695886574156239)
"cameras/drone/drone1" SET Transform localEulerAngles (11 12 13)
"cameras/drone/drone1" SET Transform localScale (1.183088578380835 1.183088578380835 1.183088578380835)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.151335155194992 0)
"cameras" SET Transform eulerAngles (-0.10771538899925659 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8531315011242073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9606916114722903
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12319909717667171
"cameras/drone/drone0" SET Transform localPosition (-0.763205642084164 -0.26810692758553795 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8107512247496145 1.2012332900261724 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -17 -11)
"cameras/drone/drone0" SET Transform localScale (0.7732864900752897 0.7732864900752897 0.7732864900752897)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -20 18)
"cameras/drone/drone1" SET Transform localScale (1.432933077203834 1.432933077203834 1.432933077203834)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.446317886328729 0)
"cameras" SET Transform eulerAngles (15.011234868169325 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.439347166423738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4640251507889201
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3096901823014109
"cameras/drone/drone0" SET Transform localPosition (-0.9941428023465005 0.6253871281812746 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4814145171946549 0.9209299358167231 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 10 -8)
"cameras/drone/drone0" SET Transform localScale (0.9491790751703479 0.9491790751703479 0.9491790751703479)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -8 -3)
"cameras/drone/drone1" SET Transform localScale (1.1114815819943271 1.1114815819943271 1.1114815819943271)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8919911219927528 0)
"cameras" SET Transform eulerAngles (14.056870421402976 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6935085561556802
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.201607831953816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.023924361137613738
"cameras/drone/drone0" SET Transform localPosition (0.6720332604962072 -0.1288343442783068 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0064830918640835 0.8571762571438497 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 18 13)
"cameras/drone/drone0" SET Transform localScale (1.364615306564075 1.364615306564075 1.364615306564075)
"cameras/drone/drone1" SET Transform localEulerAngles (15 2 -8)
"cameras/drone/drone1" SET Transform localScale (1.323611271832919 1.323611271832919 1.323611271832919)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.406561706020256 0)
"cameras" SET Transform eulerAngles (9.294275490157588 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5630362120566687
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2949079033253559
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.312940554280282
"cameras/drone/drone0" SET Transform localPosition (0.7936601193425779 0.046862181778754175 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0239907639334813 0.8506552577576503 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -17 13)
"cameras/drone/drone0" SET Transform localScale (1.3348767158004093 1.3348767158004093 1.3348767158004093)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 8 -2)
"cameras/drone/drone1" SET Transform localScale (1.4514371740457004 1.4514371740457004 1.4514371740457004)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.620315299228996 0)
"cameras" SET Transform eulerAngles (-16.22851073654691 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.457312586315817
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7512765311210077
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09059107026767205
"cameras/drone/drone0" SET Transform localPosition (0.8619488146299445 -0.010791031974417498 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1111523148326639 0.8321558400144289 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -20 3)
"cameras/drone/drone0" SET Transform localScale (1.4186584264261133 1.4186584264261133 1.4186584264261133)
"cameras/drone/drone1" SET Transform localEulerAngles (6 5 13)
"cameras/drone/drone1" SET Transform localScale (1.4560944147220738 1.4560944147220738 1.4560944147220738)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.898653621557432 0)
"cameras" SET Transform eulerAngles (-6.083737056793716 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2785010154710412
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2111483155329088
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2800249640635279
"cameras/drone/drone0" SET Transform localPosition (0.502524079064145 0.5849206065970405 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.89205015651671 1.294956698726286 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -2 3)
"cameras/drone/drone0" SET Transform localScale (1.4272696128503743 1.4272696128503743 1.4272696128503743)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -1 -12)
"cameras/drone/drone1" SET Transform localScale (0.9968269765798361 0.9968269765798361 0.9968269765798361)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8264783816203343 0)
"cameras" SET Transform eulerAngles (-5.424402383275741 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.475327295826098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1931468164847565
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05753925260879709
"cameras/drone/drone0" SET Transform localPosition (-0.08276235902132223 -0.03905249352742762 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1617973880036112 0.9521846867881942 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -12 6)
"cameras/drone/drone0" SET Transform localScale (0.6563255773355717 0.6563255773355717 0.6563255773355717)
"cameras/drone/drone1" SET Transform localEulerAngles (10 10 1)
"cameras/drone/drone1" SET Transform localScale (1.3571487984736197 1.3571487984736197 1.3571487984736197)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8497027870815828 0)
"cameras" SET Transform eulerAngles (2.3510881276863245 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4229332108937554
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5853788345148427
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11006408746511408
"cameras/drone/drone0" SET Transform localPosition (-0.44192358527216613 0.12235172225517948 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.114520920154405 1.2070275400135175 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 2 19)
"cameras/drone/drone0" SET Transform localScale (1.0860608321855842 1.0860608321855842 1.0860608321855842)
"cameras/drone/drone1" SET Transform localEulerAngles (1 9 -19)
"cameras/drone/drone1" SET Transform localScale (0.7834939623828182 0.7834939623828182 0.7834939623828182)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.953176719229669 0)
"cameras" SET Transform eulerAngles (-5.377514689985228 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8994256151669047
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9679880383321393
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08813621596016055
"cameras/drone/drone0" SET Transform localPosition (-1.0119886769826394 0.12937915843489062 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.005265414354146625 0.9304635121800111 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -17 -17)
"cameras/drone/drone0" SET Transform localScale (1.258724976228115 1.258724976228115 1.258724976228115)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -7 8)
"cameras/drone/drone1" SET Transform localScale (0.9678583559509577 0.9678583559509577 0.9678583559509577)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0346503322565237 0)
"cameras" SET Transform eulerAngles (-6.255414366895478 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8367866442400874
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.684081648418263
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37854819316778715
"cameras/drone/drone0" SET Transform localPosition (-0.18313919512842958 0.056622995811333954 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5979404813383882 1.0946247764040176 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 18 13)
"cameras/drone/drone0" SET Transform localScale (0.8952766371293488 0.8952766371293488 0.8952766371293488)
"cameras/drone/drone1" SET Transform localEulerAngles (11 13 11)
"cameras/drone/drone1" SET Transform localScale (1.2053704499750708 1.2053704499750708 1.2053704499750708)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
