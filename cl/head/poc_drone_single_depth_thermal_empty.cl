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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 171 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 25 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 86 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 63 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-18.429215840433915 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 86
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.355405633424738 0)
"cameras" SET Transform eulerAngles (1.0224169992367962 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5061850650792514
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8415145058366853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34272085832028415
"cameras/drone/drone0" SET Transform localPosition (0.16760278376434834 -0.14152321175680532 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7709550643037537 1.2023686676063605 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -20 13)
"cameras/drone/drone0" SET Transform localScale (0.7830848896110701 0.7830848896110701 0.7830848896110701)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -18 -1)
"cameras/drone/drone1" SET Transform localScale (1.4961820413747287 1.4961820413747287 1.4961820413747287)
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
"cameras" SET Transform position (0 3.7170839084859786 0)
"cameras" SET Transform eulerAngles (-17.28372914471016 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9063852751540381
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.540861177125159
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3259588965662731
"cameras/drone/drone0" SET Transform localPosition (0.38232791794439747 0.331906348097656 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3730354148331405 0.8584727255042112 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 18 20)
"cameras/drone/drone0" SET Transform localScale (1.208594102331207 1.208594102331207 1.208594102331207)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 9 8)
"cameras/drone/drone1" SET Transform localScale (0.7256232949675336 0.7256232949675336 0.7256232949675336)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.522058575558665 0)
"cameras" SET Transform eulerAngles (-10.117373256316453 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5453874624579922
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5205997457109013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19340422213978645
"cameras/drone/drone0" SET Transform localPosition (-0.54644846829184 -0.087085334789401 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.42114372636842434 1.2539969244328373 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -18 15)
"cameras/drone/drone0" SET Transform localScale (1.2475565528815795 1.2475565528815795 1.2475565528815795)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -18 -5)
"cameras/drone/drone1" SET Transform localScale (0.7987389985109368 0.7987389985109368 0.7987389985109368)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.427160752572643 0)
"cameras" SET Transform eulerAngles (-16.414395487962572 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4328164089132507
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3354614857248486
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2522956674779633
"cameras/drone/drone0" SET Transform localPosition (1.0993940824224822 -0.16373810765818902 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9619883238016871 1.184498567956441 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -15 16)
"cameras/drone/drone0" SET Transform localScale (1.3376990042940635 1.3376990042940635 1.3376990042940635)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -14 5)
"cameras/drone/drone1" SET Transform localScale (1.4104378189327065 1.4104378189327065 1.4104378189327065)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2050088764781615 0)
"cameras" SET Transform eulerAngles (3.615635221751159 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3149544946891023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2570920735875881
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3450856269449174
"cameras/drone/drone0" SET Transform localPosition (-0.519073033442663 0.2293068731704226 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.022999742809373558 1.2635814664041645 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 2 -19)
"cameras/drone/drone0" SET Transform localScale (0.8381396319880524 0.8381396319880524 0.8381396319880524)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -7 -8)
"cameras/drone/drone1" SET Transform localScale (0.9290822077506329 0.9290822077506329 0.9290822077506329)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6561956347032867 0)
"cameras" SET Transform eulerAngles (-12.830204450497792 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2585514165821932
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7805861206319484
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2259878649486614
"cameras/drone/drone0" SET Transform localPosition (-0.6188666574848859 0.3432148144422595 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.057185144581177 1.284715786588684 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 11 19)
"cameras/drone/drone0" SET Transform localScale (1.1481742905353067 1.1481742905353067 1.1481742905353067)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -5 2)
"cameras/drone/drone1" SET Transform localScale (1.4780137901123394 1.4780137901123394 1.4780137901123394)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.785602808760098 0)
"cameras" SET Transform eulerAngles (-4.177790034512633 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2809241146015258
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9151420764863252
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3613160146988309
"cameras/drone/drone0" SET Transform localPosition (0.5961817318044085 0.31236106140584224 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5959065876136294 1.1980042096777948 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -11 -12)
"cameras/drone/drone0" SET Transform localScale (0.6466199886239689 0.6466199886239689 0.6466199886239689)
"cameras/drone/drone1" SET Transform localEulerAngles (20 0 10)
"cameras/drone/drone1" SET Transform localScale (1.1994459433618587 1.1994459433618587 1.1994459433618587)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.677603944525106 0)
"cameras" SET Transform eulerAngles (2.5575895500892223 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.934084535377345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2394813272181224
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17797154066375828
"cameras/drone/drone0" SET Transform localPosition (0.2390533596358606 -0.12338632747774986 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.845994424631384 1.0208750018070556 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -14 6)
"cameras/drone/drone0" SET Transform localScale (1.1476333134648513 1.1476333134648513 1.1476333134648513)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 2 -3)
"cameras/drone/drone1" SET Transform localScale (0.7181163279165883 0.7181163279165883 0.7181163279165883)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.446603312400851 0)
"cameras" SET Transform eulerAngles (18.75467674811751 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4102676380588328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2319657716833725
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2882489660339
"cameras/drone/drone0" SET Transform localPosition (-0.6516597716843555 -0.08057399959725903 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4251493841095806 1.1596660168066082 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -6 6)
"cameras/drone/drone0" SET Transform localScale (0.9736651834654453 0.9736651834654453 0.9736651834654453)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -4 20)
"cameras/drone/drone1" SET Transform localScale (1.3153455158174463 1.3153455158174463 1.3153455158174463)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.240519974042434 0)
"cameras" SET Transform eulerAngles (19.99017474548247 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3735568753244194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5177434951758781
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02614704415138727
"cameras/drone/drone0" SET Transform localPosition (-0.04276927805673236 0.1560367179133582 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8734589198233618 1.0590636545275236 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 19 -5)
"cameras/drone/drone0" SET Transform localScale (1.270885903577171 1.270885903577171 1.270885903577171)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 9 1)
"cameras/drone/drone1" SET Transform localScale (0.9182590666788781 0.9182590666788781 0.9182590666788781)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.205460282134387 0)
"cameras" SET Transform eulerAngles (8.79771953365228 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7565610352483803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7535023165811077
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30049932989360867
"cameras/drone/drone0" SET Transform localPosition (0.2156689901303217 0.33479490974583975 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.130348088899387 1.1003294692832375 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 10 17)
"cameras/drone/drone0" SET Transform localScale (0.8199838848873054 0.8199838848873054 0.8199838848873054)
"cameras/drone/drone1" SET Transform localEulerAngles (12 14 -4)
"cameras/drone/drone1" SET Transform localScale (1.0132860784037878 1.0132860784037878 1.0132860784037878)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.285425547508448 0)
"cameras" SET Transform eulerAngles (-15.000636373834219 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5711780703897285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8404230292511499
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3813268802515002
"cameras/drone/drone0" SET Transform localPosition (-0.3205261785449235 0.30101369017616114 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3150053388163807 1.0759142290431887 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 11 -1)
"cameras/drone/drone0" SET Transform localScale (1.4726098215427172 1.4726098215427172 1.4726098215427172)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -2 17)
"cameras/drone/drone1" SET Transform localScale (0.8523754624069488 0.8523754624069488 0.8523754624069488)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.587524683848005 0)
"cameras" SET Transform eulerAngles (5.89720367559196 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0649588131012342
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0577640521829077
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31877962563075246
"cameras/drone/drone0" SET Transform localPosition (-0.1400880486563043 -0.08189946378003449 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5123495466273877 1.0919597865562447 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -5 -5)
"cameras/drone/drone0" SET Transform localScale (1.0695214746800386 1.0695214746800386 1.0695214746800386)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -5 19)
"cameras/drone/drone1" SET Transform localScale (0.9110683014714025 0.9110683014714025 0.9110683014714025)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.337482924084902 0)
"cameras" SET Transform eulerAngles (19.83595159964294 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5473714594866124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3696273125674012
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19033762304512028
"cameras/drone/drone0" SET Transform localPosition (-0.27691679973437755 -0.11207393282422745 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.153836592627478 0.9465465674577435 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -13 17)
"cameras/drone/drone0" SET Transform localScale (1.3198864340683105 1.3198864340683105 1.3198864340683105)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -3 12)
"cameras/drone/drone1" SET Transform localScale (1.2236142644308345 1.2236142644308345 1.2236142644308345)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.311770812971387 0)
"cameras" SET Transform eulerAngles (0.5155801217795073 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.722488789262805
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8497635018576113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22987032588660916
"cameras/drone/drone0" SET Transform localPosition (0.8320485934865121 0.5459372089823729 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.050200386254069 1.0489513172573635 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -9 -12)
"cameras/drone/drone0" SET Transform localScale (1.4067472707701278 1.4067472707701278 1.4067472707701278)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 18 14)
"cameras/drone/drone1" SET Transform localScale (0.6106442149918752 0.6106442149918752 0.6106442149918752)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.131402385764544 0)
"cameras" SET Transform eulerAngles (-14.724926876140213 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4343928992353533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1673505843244487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.030220594526994528
"cameras/drone/drone0" SET Transform localPosition (1.06996392872818 0.4942686473415768 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9328465638459702 1.0746828237540142 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 3 -1)
"cameras/drone/drone0" SET Transform localScale (0.8006014887375026 0.8006014887375026 0.8006014887375026)
"cameras/drone/drone1" SET Transform localEulerAngles (4 13 11)
"cameras/drone/drone1" SET Transform localScale (1.3453557895042312 1.3453557895042312 1.3453557895042312)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4162493634954725 0)
"cameras" SET Transform eulerAngles (1.3194608036195241 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6478634458499721
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8931793929221912
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.00701350018055611
"cameras/drone/drone0" SET Transform localPosition (1.0186687695798178 0.17228624317481928 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7024059846718187 1.219948539277143 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 0 -7)
"cameras/drone/drone0" SET Transform localScale (1.2048716197080096 1.2048716197080096 1.2048716197080096)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -11 -18)
"cameras/drone/drone1" SET Transform localScale (0.704769553032236 0.704769553032236 0.704769553032236)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.274509014951567 0)
"cameras" SET Transform eulerAngles (-19.568602565606483 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2867968340477958
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4391545278936615
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20562801580407997
"cameras/drone/drone0" SET Transform localPosition (-0.4570113915890166 0.5271863573546802 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4128024704556639 1.2527167999144195 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 1 -9)
"cameras/drone/drone0" SET Transform localScale (0.7196918599391493 0.7196918599391493 0.7196918599391493)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 3 15)
"cameras/drone/drone1" SET Transform localScale (1.076145761865444 1.076145761865444 1.076145761865444)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.419749303257353 0)
"cameras" SET Transform eulerAngles (-13.926880782001753 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8843261778156342
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.660416432086918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3843087142308953
"cameras/drone/drone0" SET Transform localPosition (-0.49166869799918944 -0.15253594580964674 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17240950300053437 1.1899249236247953 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 2 -10)
"cameras/drone/drone0" SET Transform localScale (1.3377358533326378 1.3377358533326378 1.3377358533326378)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -12 4)
"cameras/drone/drone1" SET Transform localScale (1.3335645615171017 1.3335645615171017 1.3335645615171017)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.025641116955641 0)
"cameras" SET Transform eulerAngles (-11.588997491353844 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4891690302581352
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1630536145908796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025011177426104727
"cameras/drone/drone0" SET Transform localPosition (0.5058019163210847 0.16968313922987005 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11833029075608392 0.8652553083261829 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -9 -4)
"cameras/drone/drone0" SET Transform localScale (1.2154962108698557 1.2154962108698557 1.2154962108698557)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 4 -11)
"cameras/drone/drone1" SET Transform localScale (1.4678995340801992 1.4678995340801992 1.4678995340801992)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.924244171450201 0)
"cameras" SET Transform eulerAngles (3.7606238488856434 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.919864076903648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4071086306672327
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06015728704854628
"cameras/drone/drone0" SET Transform localPosition (0.18981753979272176 0.44053414666267704 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.16971782316023454 1.2996112992048254 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 7 11)
"cameras/drone/drone0" SET Transform localScale (1.4853189009357677 1.4853189009357677 1.4853189009357677)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -3 20)
"cameras/drone/drone1" SET Transform localScale (0.6020036051982456 0.6020036051982456 0.6020036051982456)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.904782618152772 0)
"cameras" SET Transform eulerAngles (0.9061413148539579 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3054096887108226
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9548633758448783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24134762950997307
"cameras/drone/drone0" SET Transform localPosition (-1.0915469334088508 0.2796463124629483 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5000952946335008 1.0247513136023767 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 19 -8)
"cameras/drone/drone0" SET Transform localScale (1.3229744446150273 1.3229744446150273 1.3229744446150273)
"cameras/drone/drone1" SET Transform localEulerAngles (1 15 8)
"cameras/drone/drone1" SET Transform localScale (0.8233540812475639 0.8233540812475639 0.8233540812475639)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.315196543280603 0)
"cameras" SET Transform eulerAngles (-12.83497866997351 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0088586575518916
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.343075466272509
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33366534420631333
"cameras/drone/drone0" SET Transform localPosition (-0.5119637113463256 0.42020030484289467 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4678611960121648 0.8425670465298143 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 11 17)
"cameras/drone/drone0" SET Transform localScale (1.4936268274770672 1.4936268274770672 1.4936268274770672)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -1 20)
"cameras/drone/drone1" SET Transform localScale (0.9704743215274074 0.9704743215274074 0.9704743215274074)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5052661533762475 0)
"cameras" SET Transform eulerAngles (15.147245375852386 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.189621621438547
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1240676953202389
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1857498116054823
"cameras/drone/drone0" SET Transform localPosition (0.35100737443505237 0.5933081668817408 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08702133542271895 0.9668783201007052 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -11 10)
"cameras/drone/drone0" SET Transform localScale (0.9948281645040397 0.9948281645040397 0.9948281645040397)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -2 -18)
"cameras/drone/drone1" SET Transform localScale (0.6576327005139748 0.6576327005139748 0.6576327005139748)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1089423458079555 0)
"cameras" SET Transform eulerAngles (3.63103260355863 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7983782276224831
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2421326592690185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09895936441230697
"cameras/drone/drone0" SET Transform localPosition (0.7323307892225133 0.07578194050975368 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03286222410954753 0.9492372801434995 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -18 -1)
"cameras/drone/drone0" SET Transform localScale (0.917611707959603 0.917611707959603 0.917611707959603)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -6 -10)
"cameras/drone/drone1" SET Transform localScale (1.1852845134532517 1.1852845134532517 1.1852845134532517)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.750909710439959 0)
"cameras" SET Transform eulerAngles (8.124636792161468 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.220300157782292
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6232724632913047
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1353355871862592
"cameras/drone/drone0" SET Transform localPosition (0.9601536870729304 0.22508534880205128 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8968042531760719 1.2573008845585059 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 16 -13)
"cameras/drone/drone0" SET Transform localScale (0.8865528853986187 0.8865528853986187 0.8865528853986187)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -6 -20)
"cameras/drone/drone1" SET Transform localScale (1.1873080278118975 1.1873080278118975 1.1873080278118975)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.588444591487056 0)
"cameras" SET Transform eulerAngles (11.333366627898531 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5828650625227132
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.066885995681738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.049492420147549426
"cameras/drone/drone0" SET Transform localPosition (1.1871293777867076 -0.08659361574108532 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16962417946206187 0.922847002418934 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 12 4)
"cameras/drone/drone0" SET Transform localScale (0.9715526997546617 0.9715526997546617 0.9715526997546617)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -16 16)
"cameras/drone/drone1" SET Transform localScale (0.7768743540042494 0.7768743540042494 0.7768743540042494)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.808321796462431 0)
"cameras" SET Transform eulerAngles (-18.651416002766123 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0218530158564345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7921442659532565
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25257270593590414
"cameras/drone/drone0" SET Transform localPosition (0.4826330873445215 0.48299574895185443 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9035165552138689 0.8831774459623442 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 19 4)
"cameras/drone/drone0" SET Transform localScale (1.4461882733182394 1.4461882733182394 1.4461882733182394)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 12 -8)
"cameras/drone/drone1" SET Transform localScale (0.6879209980185588 0.6879209980185588 0.6879209980185588)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.471314505112643 0)
"cameras" SET Transform eulerAngles (-1.035214260364409 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.064656942900545
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.133122369132239
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34481278265388043
"cameras/drone/drone0" SET Transform localPosition (-1.1642459077501937 0.07421004783380475 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1064185941990079 0.8242301260129731 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 11 -4)
"cameras/drone/drone0" SET Transform localScale (1.20597529786467 1.20597529786467 1.20597529786467)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -14 9)
"cameras/drone/drone1" SET Transform localScale (1.1259463568017707 1.1259463568017707 1.1259463568017707)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.736518233895318 0)
"cameras" SET Transform eulerAngles (-15.64018592619085 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.72831308980727
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2744792367538094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2161376075709851
"cameras/drone/drone0" SET Transform localPosition (1.189731596075941 0.4929066405565861 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3110886608791761 0.8766346140861696 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 12 3)
"cameras/drone/drone0" SET Transform localScale (1.0610543204362892 1.0610543204362892 1.0610543204362892)
"cameras/drone/drone1" SET Transform localEulerAngles (20 17 -16)
"cameras/drone/drone1" SET Transform localScale (1.269381447524009 1.269381447524009 1.269381447524009)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2023255111837106 0)
"cameras" SET Transform eulerAngles (3.367521141000953 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4103662739403333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2178738318529194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2982389992110686
"cameras/drone/drone0" SET Transform localPosition (0.47615155188564495 0.26442406152830505 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05702273100036748 1.0017349515719425 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 5 -15)
"cameras/drone/drone0" SET Transform localScale (1.098010752937571 1.098010752937571 1.098010752937571)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -1 -1)
"cameras/drone/drone1" SET Transform localScale (1.212199254849967 1.212199254849967 1.212199254849967)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7502189377205 0)
"cameras" SET Transform eulerAngles (1.4650386133260938 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41795125909414943
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.425703627573351
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2289947505507287
"cameras/drone/drone0" SET Transform localPosition (0.7212166016239381 0.21299436074375339 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6949974700575736 0.9641285211667115 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 8 17)
"cameras/drone/drone0" SET Transform localScale (1.443909472476471 1.443909472476471 1.443909472476471)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -9 7)
"cameras/drone/drone1" SET Transform localScale (0.7637653471333875 0.7637653471333875 0.7637653471333875)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.338923303526099 0)
"cameras" SET Transform eulerAngles (-10.084017097987982 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47757508805476573
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8159205606821067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22939243453917524
"cameras/drone/drone0" SET Transform localPosition (-1.1296461025720035 0.4616282474999079 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5530911915746409 0.8541858130035844 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 12 4)
"cameras/drone/drone0" SET Transform localScale (0.9670205546159867 0.9670205546159867 0.9670205546159867)
"cameras/drone/drone1" SET Transform localEulerAngles (11 12 13)
"cameras/drone/drone1" SET Transform localScale (0.9551523537781872 0.9551523537781872 0.9551523537781872)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9085159978436086 0)
"cameras" SET Transform eulerAngles (-6.296769000200708 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5883216823098714
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5766551543142022
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15359471735658126
"cameras/drone/drone0" SET Transform localPosition (0.9291790571613909 -0.07117742337576832 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.33735824663279346 0.9259874171963629 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 18 6)
"cameras/drone/drone0" SET Transform localScale (1.2690041332264919 1.2690041332264919 1.2690041332264919)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -3 9)
"cameras/drone/drone1" SET Transform localScale (0.6521343717261309 0.6521343717261309 0.6521343717261309)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.981555321887904 0)
"cameras" SET Transform eulerAngles (14.030399989822747 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4622862925230824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5429244245603095
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.008854159715910193
"cameras/drone/drone0" SET Transform localPosition (0.09731921132728028 -0.005263031971764753 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8873803106246851 0.8737104321829516 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 16 -8)
"cameras/drone/drone0" SET Transform localScale (1.1039323637806089 1.1039323637806089 1.1039323637806089)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -15 -3)
"cameras/drone/drone1" SET Transform localScale (1.3001391084609542 1.3001391084609542 1.3001391084609542)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5444862157612684 0)
"cameras" SET Transform eulerAngles (-14.370052793750405 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.267186988666991
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.893321067352983
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3147667999669618
"cameras/drone/drone0" SET Transform localPosition (0.7115822515066628 0.34195559165531714 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1969059855707458 0.9034012542368883 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 5 -3)
"cameras/drone/drone0" SET Transform localScale (1.2696920563746166 1.2696920563746166 1.2696920563746166)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -4 2)
"cameras/drone/drone1" SET Transform localScale (0.8367624287529691 0.8367624287529691 0.8367624287529691)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9201608670004813 0)
"cameras" SET Transform eulerAngles (-18.412488055458176 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9641986029200601
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4246906826469397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0389334189966621
"cameras/drone/drone0" SET Transform localPosition (-0.4980656339010757 0.6770342872831698 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.02956188750041 1.0646422488523788 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 14 -2)
"cameras/drone/drone0" SET Transform localScale (0.9932556137781076 0.9932556137781076 0.9932556137781076)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -4 -5)
"cameras/drone/drone1" SET Transform localScale (1.2262256978819743 1.2262256978819743 1.2262256978819743)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0502201584217286 0)
"cameras" SET Transform eulerAngles (1.9760383715480998 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5943588861585445
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9093365053445366
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1224742906502311
"cameras/drone/drone0" SET Transform localPosition (0.5017525165901742 0.08383106992003225 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5892155275029529 1.150653843571054 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 1 2)
"cameras/drone/drone0" SET Transform localScale (0.8949017886138031 0.8949017886138031 0.8949017886138031)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 2 6)
"cameras/drone/drone1" SET Transform localScale (1.0334986505538215 1.0334986505538215 1.0334986505538215)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.636667260316068 0)
"cameras" SET Transform eulerAngles (-16.383699714324894 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9626738571230363
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1757407157994402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3219379402582827
"cameras/drone/drone0" SET Transform localPosition (0.4736596855651216 0.16344022926912644 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8579941613860451 1.0295702096234394 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -10 -20)
"cameras/drone/drone0" SET Transform localScale (0.9103568590027327 0.9103568590027327 0.9103568590027327)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -7 -3)
"cameras/drone/drone1" SET Transform localScale (1.2450362240038286 1.2450362240038286 1.2450362240038286)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.654013868637859 0)
"cameras" SET Transform eulerAngles (-8.143688396592763 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9665951982496322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8068680109355006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.043058970037467774
"cameras/drone/drone0" SET Transform localPosition (-0.36257406626244315 -0.1538317174523786 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6022752681870612 1.0847862151698586 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 13 -8)
"cameras/drone/drone0" SET Transform localScale (1.4085294535589035 1.4085294535589035 1.4085294535589035)
"cameras/drone/drone1" SET Transform localEulerAngles (10 15 0)
"cameras/drone/drone1" SET Transform localScale (0.889266108844917 0.889266108844917 0.889266108844917)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.639716267764242 0)
"cameras" SET Transform eulerAngles (-2.9634059135645217 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5462035009586024
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4988958622787911
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3668209002162535
"cameras/drone/drone0" SET Transform localPosition (0.27765265104065406 0.0809617780989374 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08197391590089187 1.277978910131541 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 8 17)
"cameras/drone/drone0" SET Transform localScale (0.7338713105301065 0.7338713105301065 0.7338713105301065)
"cameras/drone/drone1" SET Transform localEulerAngles (10 4 19)
"cameras/drone/drone1" SET Transform localScale (1.3609311596344722 1.3609311596344722 1.3609311596344722)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.783489189702865 0)
"cameras" SET Transform eulerAngles (15.31946904089915 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3276556094797614
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8304038357846526
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11368453749694162
"cameras/drone/drone0" SET Transform localPosition (0.8153977228880345 -0.12044992985324515 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0592239778066237 0.9137908753617928 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 12 -15)
"cameras/drone/drone0" SET Transform localScale (0.8220254404952433 0.8220254404952433 0.8220254404952433)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 9 -14)
"cameras/drone/drone1" SET Transform localScale (1.478541207493873 1.478541207493873 1.478541207493873)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1710820328886484 0)
"cameras" SET Transform eulerAngles (-3.887307037355349 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8547105130733114
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.04525063014928
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.00014571604359416845
"cameras/drone/drone0" SET Transform localPosition (-0.49925183747409363 0.5093771178045781 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9756166116905912 0.9883765137648672 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -4 -13)
"cameras/drone/drone0" SET Transform localScale (1.2978698923260192 1.2978698923260192 1.2978698923260192)
"cameras/drone/drone1" SET Transform localEulerAngles (1 16 18)
"cameras/drone/drone1" SET Transform localScale (1.3836854878410105 1.3836854878410105 1.3836854878410105)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.582112982357056 0)
"cameras" SET Transform eulerAngles (10.874412411418312 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0743835396248216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.518456252177241
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04008086096925565
"cameras/drone/drone0" SET Transform localPosition (-0.5276520625332717 0.42019588243528166 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5596544440048211 0.800051039151928 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -10 3)
"cameras/drone/drone0" SET Transform localScale (0.9100618314689316 0.9100618314689316 0.9100618314689316)
"cameras/drone/drone1" SET Transform localEulerAngles (12 7 -15)
"cameras/drone/drone1" SET Transform localScale (0.6404262477545054 0.6404262477545054 0.6404262477545054)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9286090061200905 0)
"cameras" SET Transform eulerAngles (17.651664024372174 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46044713359497436
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7949222070678048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3148931725309852
"cameras/drone/drone0" SET Transform localPosition (-0.6654472993831747 0.689331868042449 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3974066825634843 1.1744295691464268 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 4 8)
"cameras/drone/drone0" SET Transform localScale (0.6775502451026928 0.6775502451026928 0.6775502451026928)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 6 16)
"cameras/drone/drone1" SET Transform localScale (0.6568489492937502 0.6568489492937502 0.6568489492937502)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.431656814349446 0)
"cameras" SET Transform eulerAngles (-4.331236691459566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2991730477173196
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1566894357004291
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11375254465806837
"cameras/drone/drone0" SET Transform localPosition (0.5538781543236662 0.18055535416243512 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5870034433661231 1.2678211033167424 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 14 -16)
"cameras/drone/drone0" SET Transform localScale (1.129517423997986 1.129517423997986 1.129517423997986)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -15 2)
"cameras/drone/drone1" SET Transform localScale (0.6461927292573394 0.6461927292573394 0.6461927292573394)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.435235336472562 0)
"cameras" SET Transform eulerAngles (1.3233610093872237 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7656456815803829
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.340451874129105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13937304544403736
"cameras/drone/drone0" SET Transform localPosition (0.501751192829542 0.5788440574219638 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6615608280586576 1.169759559564013 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -2 -11)
"cameras/drone/drone0" SET Transform localScale (0.9990183690050289 0.9990183690050289 0.9990183690050289)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -8 -12)
"cameras/drone/drone1" SET Transform localScale (0.8008569244704961 0.8008569244704961 0.8008569244704961)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.142798832079579 0)
"cameras" SET Transform eulerAngles (-11.462558243873428 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8184577988622999
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8066867828063686
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37388532774831407
"cameras/drone/drone0" SET Transform localPosition (-0.2413211426685875 0.10333797320045085 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5437899814709808 1.1780183609352644 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -14 -1)
"cameras/drone/drone0" SET Transform localScale (1.0364574378353146 1.0364574378353146 1.0364574378353146)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 0 -13)
"cameras/drone/drone1" SET Transform localScale (0.693334716404465 0.693334716404465 0.693334716404465)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.923652407553009 0)
"cameras" SET Transform eulerAngles (15.541977462133232 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9009811762496276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7162655033808387
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26985001433078104
"cameras/drone/drone0" SET Transform localPosition (-0.09909659223622924 0.3660118175928599 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9463412026465181 1.085188602861102 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 20 -4)
"cameras/drone/drone0" SET Transform localScale (0.9100422582204323 0.9100422582204323 0.9100422582204323)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -3 -17)
"cameras/drone/drone1" SET Transform localScale (0.8159033952757646 0.8159033952757646 0.8159033952757646)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.978942350332564 0)
"cameras" SET Transform eulerAngles (4.9232793617719395 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.857166799617003
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8584803743177858
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25856600737535745
"cameras/drone/drone0" SET Transform localPosition (0.6759304133226565 0.5191811538194155 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.698893710103174 1.2146405904187954 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 2 -18)
"cameras/drone/drone0" SET Transform localScale (1.2978487743842027 1.2978487743842027 1.2978487743842027)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -1 4)
"cameras/drone/drone1" SET Transform localScale (0.7953020077238504 0.7953020077238504 0.7953020077238504)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3413915787459745 0)
"cameras" SET Transform eulerAngles (-8.52004038787674 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0567510239920401
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0000212625129512
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.059414220313158905
"cameras/drone/drone0" SET Transform localPosition (0.4684907296288121 0.5187455608580838 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.024402930571729486 0.8050243739041918 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -8 15)
"cameras/drone/drone0" SET Transform localScale (0.8834446959330496 0.8834446959330496 0.8834446959330496)
"cameras/drone/drone1" SET Transform localEulerAngles (18 1 -20)
"cameras/drone/drone1" SET Transform localScale (0.8766153201839703 0.8766153201839703 0.8766153201839703)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1515703858196913 0)
"cameras" SET Transform eulerAngles (-0.6335542093295068 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.513206873045216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5995572445945268
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04954241368935217
"cameras/drone/drone0" SET Transform localPosition (0.8255983382947221 0.6491215458653912 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9086703539754357 1.2940882605232527 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 10 9)
"cameras/drone/drone0" SET Transform localScale (0.8821816346741255 0.8821816346741255 0.8821816346741255)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 15 -20)
"cameras/drone/drone1" SET Transform localScale (0.7447794188689656 0.7447794188689656 0.7447794188689656)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4284644926329952 0)
"cameras" SET Transform eulerAngles (-9.701200485632224 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7953974470382237
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2151260800374222
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25463478945896395
"cameras/drone/drone0" SET Transform localPosition (-0.49994100609717995 0.3345865880917 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.31345225124589726 1.1038266198639979 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 5 19)
"cameras/drone/drone0" SET Transform localScale (1.4839855616929372 1.4839855616929372 1.4839855616929372)
"cameras/drone/drone1" SET Transform localEulerAngles (20 11 -6)
"cameras/drone/drone1" SET Transform localScale (1.0281532511690623 1.0281532511690623 1.0281532511690623)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.449825557343202 0)
"cameras" SET Transform eulerAngles (-8.945028282926014 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1465873511373417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4640083519432414
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22039595913168936
"cameras/drone/drone0" SET Transform localPosition (-0.24755337271620026 0.5202574337982859 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0370862695565524 1.1085632521926376 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -11 -16)
"cameras/drone/drone0" SET Transform localScale (1.218772707538431 1.218772707538431 1.218772707538431)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 3 4)
"cameras/drone/drone1" SET Transform localScale (0.6299079238557546 0.6299079238557546 0.6299079238557546)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4843333819760356 0)
"cameras" SET Transform eulerAngles (-15.799676999165172 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5421576651862008
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9508189902351212
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02058130870451045
"cameras/drone/drone0" SET Transform localPosition (0.3798712531260491 0.1238019561236588 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04138028092420698 0.9030980514775089 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 1 -17)
"cameras/drone/drone0" SET Transform localScale (1.4953324694044277 1.4953324694044277 1.4953324694044277)
"cameras/drone/drone1" SET Transform localEulerAngles (15 16 -15)
"cameras/drone/drone1" SET Transform localScale (0.613147128014425 0.613147128014425 0.613147128014425)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.693347641995633 0)
"cameras" SET Transform eulerAngles (3.0034357757195878 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2218130128564282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7411849828001442
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04203092143824745
"cameras/drone/drone0" SET Transform localPosition (-0.827133289695763 0.19041948219032984 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.21274527187945846 1.19655934332966 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 10 -1)
"cameras/drone/drone0" SET Transform localScale (0.6257721609340517 0.6257721609340517 0.6257721609340517)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -12 -3)
"cameras/drone/drone1" SET Transform localScale (0.6010052773717988 0.6010052773717988 0.6010052773717988)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.409616116873533 0)
"cameras" SET Transform eulerAngles (6.372491873532795 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2428120391969006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2832830711763445
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.370910182456425
"cameras/drone/drone0" SET Transform localPosition (-0.9085724644348918 0.1550632468462108 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.04945289653836582 0.8648034594621361 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 2 2)
"cameras/drone/drone0" SET Transform localScale (1.343634267628322 1.343634267628322 1.343634267628322)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -13 10)
"cameras/drone/drone1" SET Transform localScale (0.747269040089965 0.747269040089965 0.747269040089965)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.853213785532602 0)
"cameras" SET Transform eulerAngles (-7.126814438973348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.839702554301862
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6122931948015333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3793378953474495
"cameras/drone/drone0" SET Transform localPosition (1.1450724526601286 -0.29757679681499044 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.019039710946781 1.0425019746603943 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 9 19)
"cameras/drone/drone0" SET Transform localScale (1.391131229546846 1.391131229546846 1.391131229546846)
"cameras/drone/drone1" SET Transform localEulerAngles (15 5 6)
"cameras/drone/drone1" SET Transform localScale (0.6588332931676255 0.6588332931676255 0.6588332931676255)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4801128923418707 0)
"cameras" SET Transform eulerAngles (4.314606110549832 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9789619909334175
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0831390652035329
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2231815332225766
"cameras/drone/drone0" SET Transform localPosition (-0.1579877844075357 0.08021534932111557 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9463905840050362 1.2110536810670323 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 6 11)
"cameras/drone/drone0" SET Transform localScale (0.9987716128522672 0.9987716128522672 0.9987716128522672)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -11 -10)
"cameras/drone/drone1" SET Transform localScale (1.308076430081957 1.308076430081957 1.308076430081957)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.961156381330074 0)
"cameras" SET Transform eulerAngles (-6.42518370400424 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.245422969324411
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9449435264821204
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38358051529754134
"cameras/drone/drone0" SET Transform localPosition (-0.14493263219303243 -0.16503711381097413 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.39700790793129714 1.0680948352101851 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -9 9)
"cameras/drone/drone0" SET Transform localScale (0.8658491108166722 0.8658491108166722 0.8658491108166722)
"cameras/drone/drone1" SET Transform localEulerAngles (9 0 0)
"cameras/drone/drone1" SET Transform localScale (1.1932277009849668 1.1932277009849668 1.1932277009849668)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.704621006438806 0)
"cameras" SET Transform eulerAngles (-2.165166864866986 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7908503999557506
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6876776940493394
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28446362601838193
"cameras/drone/drone0" SET Transform localPosition (0.6048073838391459 0.09050625846950838 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1932292275535974 1.257703120170242 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -12 15)
"cameras/drone/drone0" SET Transform localScale (0.6364124328902898 0.6364124328902898 0.6364124328902898)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 0 20)
"cameras/drone/drone1" SET Transform localScale (0.8154753741000669 0.8154753741000669 0.8154753741000669)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1852329923812914 0)
"cameras" SET Transform eulerAngles (-3.7434809447412505 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7456140245876309
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4248154146314413
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25249661418200614
"cameras/drone/drone0" SET Transform localPosition (0.5529665127075096 0.3640355242783398 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3425383540154039 1.1696524947338947 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 11 9)
"cameras/drone/drone0" SET Transform localScale (1.1176889882227503 1.1176889882227503 1.1176889882227503)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -4 -3)
"cameras/drone/drone1" SET Transform localScale (1.3662627255719357 1.3662627255719357 1.3662627255719357)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.732824928355074 0)
"cameras" SET Transform eulerAngles (17.704313072163693 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9068915119539167
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1202190926394213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14291235168685087
"cameras/drone/drone0" SET Transform localPosition (0.2781898388333295 0.08866188180046236 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8781603599550876 1.0892672164304826 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -14 5)
"cameras/drone/drone0" SET Transform localScale (0.9865407004091449 0.9865407004091449 0.9865407004091449)
"cameras/drone/drone1" SET Transform localEulerAngles (10 18 -7)
"cameras/drone/drone1" SET Transform localScale (1.0474716367209862 1.0474716367209862 1.0474716367209862)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.13346191373627 0)
"cameras" SET Transform eulerAngles (10.299251038731647 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1697304383304272
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1206237689283483
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33081017268734697
"cameras/drone/drone0" SET Transform localPosition (0.8517863434200696 0.08332260402176744 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.199196155708662 0.9757311290938285 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 14 -15)
"cameras/drone/drone0" SET Transform localScale (1.2860766113587547 1.2860766113587547 1.2860766113587547)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -17 -4)
"cameras/drone/drone1" SET Transform localScale (1.4199205559473946 1.4199205559473946 1.4199205559473946)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2278269155000525 0)
"cameras" SET Transform eulerAngles (19.012168903952194 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4656266391029593
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9196228625673197
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2403596274943913
"cameras/drone/drone0" SET Transform localPosition (1.1789323476745357 -0.01422633813520574 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5409864722414968 1.2531726378418897 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 18 -11)
"cameras/drone/drone0" SET Transform localScale (0.6711175847783649 0.6711175847783649 0.6711175847783649)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -17 -20)
"cameras/drone/drone1" SET Transform localScale (1.0757760333826074 1.0757760333826074 1.0757760333826074)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.93035233278591 0)
"cameras" SET Transform eulerAngles (-4.509076417073796 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7684504795809655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3409701586225582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1922785382144091
"cameras/drone/drone0" SET Transform localPosition (-1.0535878532292846 -0.2752424194141783 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8486034789166497 1.0692727896870016 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -18 -18)
"cameras/drone/drone0" SET Transform localScale (0.6665070072155861 0.6665070072155861 0.6665070072155861)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -15 16)
"cameras/drone/drone1" SET Transform localScale (0.658570446364769 0.658570446364769 0.658570446364769)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.329157505101695 0)
"cameras" SET Transform eulerAngles (11.996733308664929 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9663807212872904
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.450814704806484
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20484335879904006
"cameras/drone/drone0" SET Transform localPosition (0.7121197571229916 -0.017510527938721043 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1763525710046039 1.1118921246724036 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 6 3)
"cameras/drone/drone0" SET Transform localScale (0.9349851443590789 0.9349851443590789 0.9349851443590789)
"cameras/drone/drone1" SET Transform localEulerAngles (16 8 9)
"cameras/drone/drone1" SET Transform localScale (1.150746256146741 1.150746256146741 1.150746256146741)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.86775131084744 0)
"cameras" SET Transform eulerAngles (18.313824804985003 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0938090413247696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.174724461399482
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.055361602322326856
"cameras/drone/drone0" SET Transform localPosition (1.1409178238649684 0.22518275748806932 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5086012925521115 1.28968227627827 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -10 7)
"cameras/drone/drone0" SET Transform localScale (1.1738433153794827 1.1738433153794827 1.1738433153794827)
"cameras/drone/drone1" SET Transform localEulerAngles (3 19 -19)
"cameras/drone/drone1" SET Transform localScale (1.3498380259994622 1.3498380259994622 1.3498380259994622)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.412743745110249 0)
"cameras" SET Transform eulerAngles (19.66559634221364 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0910351349097862
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0210884059161223
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18657748000127566
"cameras/drone/drone0" SET Transform localPosition (0.47187833037694316 0.39191190788775404 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6518702915156551 1.0914211979548176 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 16 -16)
"cameras/drone/drone0" SET Transform localScale (1.446667698115638 1.446667698115638 1.446667698115638)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -4 0)
"cameras/drone/drone1" SET Transform localScale (0.9253192655028957 0.9253192655028957 0.9253192655028957)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1936369715471007 0)
"cameras" SET Transform eulerAngles (8.737749951678172 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.693040633005708
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.182223463508338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0007767406831983959
"cameras/drone/drone0" SET Transform localPosition (-0.168928737919666 0.3291722859154383 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1025046061649866 1.020280675270719 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -1 -16)
"cameras/drone/drone0" SET Transform localScale (1.180983461005395 1.180983461005395 1.180983461005395)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 7 -11)
"cameras/drone/drone1" SET Transform localScale (0.7754897832509491 0.7754897832509491 0.7754897832509491)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1796417917343294 0)
"cameras" SET Transform eulerAngles (17.52891882975939 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6406540823051856
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8017531362409867
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18861339265595137
"cameras/drone/drone0" SET Transform localPosition (-0.7806212539871743 0.014965714129742624 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6384356155617864 1.0943169631025027 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 17 7)
"cameras/drone/drone0" SET Transform localScale (1.0394763087126944 1.0394763087126944 1.0394763087126944)
"cameras/drone/drone1" SET Transform localEulerAngles (1 1 0)
"cameras/drone/drone1" SET Transform localScale (1.4040050636271846 1.4040050636271846 1.4040050636271846)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8749100798630742 0)
"cameras" SET Transform eulerAngles (18.79293687293763 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5478044356029165
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9204209237578425
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.158132788436561
"cameras/drone/drone0" SET Transform localPosition (-0.25914188335193267 -0.1565138166404218 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17256870033747163 1.197823612071301 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 11 11)
"cameras/drone/drone0" SET Transform localScale (0.9935926881732622 0.9935926881732622 0.9935926881732622)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -3 -19)
"cameras/drone/drone1" SET Transform localScale (1.1977974687858877 1.1977974687858877 1.1977974687858877)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.487453054031317 0)
"cameras" SET Transform eulerAngles (-11.038205643194594 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3001793627401064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5098398101254935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.030889165752419203
"cameras/drone/drone0" SET Transform localPosition (0.701395253350505 0.47013555173315086 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.16661238422208258 1.0946834065970645 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -2 -18)
"cameras/drone/drone0" SET Transform localScale (1.0550756535795964 1.0550756535795964 1.0550756535795964)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -9 -16)
"cameras/drone/drone1" SET Transform localScale (1.3538696372682095 1.3538696372682095 1.3538696372682095)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2011627448294835 0)
"cameras" SET Transform eulerAngles (-19.005146473846494 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5204586898659473
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9463954394300672
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3133267339515492
"cameras/drone/drone0" SET Transform localPosition (1.1607434878410914 -0.10971767233337687 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5440026870089221 1.0787709060735373 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 6 -11)
"cameras/drone/drone0" SET Transform localScale (1.4763150513447219 1.4763150513447219 1.4763150513447219)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 2 3)
"cameras/drone/drone1" SET Transform localScale (0.9853989508765442 0.9853989508765442 0.9853989508765442)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.466496911032377 0)
"cameras" SET Transform eulerAngles (-6.930668103533062 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2365861650438474
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.522610251538084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16779621400104514
"cameras/drone/drone0" SET Transform localPosition (-0.6787673258149438 -0.20648299808241993 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.06719154090472923 1.0861455917474208 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -17 10)
"cameras/drone/drone0" SET Transform localScale (0.6944652429113147 0.6944652429113147 0.6944652429113147)
"cameras/drone/drone1" SET Transform localEulerAngles (1 18 5)
"cameras/drone/drone1" SET Transform localScale (1.086906018637696 1.086906018637696 1.086906018637696)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9710434949244915 0)
"cameras" SET Transform eulerAngles (-19.00280367536586 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3251519356999073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.85776877399397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29564778465551117
"cameras/drone/drone0" SET Transform localPosition (0.763845125595944 0.35036499837014584 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1395216794251295 1.1415639556830395 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -16 -3)
"cameras/drone/drone0" SET Transform localScale (1.2326559065890283 1.2326559065890283 1.2326559065890283)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 20 -20)
"cameras/drone/drone1" SET Transform localScale (0.668310617708224 0.668310617708224 0.668310617708224)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9410102106935048 0)
"cameras" SET Transform eulerAngles (-0.9346127116767207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9899965266486176
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2085892572885284
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.031010494694813054
"cameras/drone/drone0" SET Transform localPosition (-0.6951132084027324 -0.010683466739222658 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3997265555139755 0.860446389721518 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -20 -19)
"cameras/drone/drone0" SET Transform localScale (0.8131341289746872 0.8131341289746872 0.8131341289746872)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -20 9)
"cameras/drone/drone1" SET Transform localScale (0.9733975410686855 0.9733975410686855 0.9733975410686855)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.22527945677659 0)
"cameras" SET Transform eulerAngles (-12.575930798896803 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4694432102594908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1204455079576379
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3092638206199446
"cameras/drone/drone0" SET Transform localPosition (-0.367594771115039 -0.20096348094801547 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1552678998654893 0.9002005045417114 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -11 -8)
"cameras/drone/drone0" SET Transform localScale (1.4975152190341618 1.4975152190341618 1.4975152190341618)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -17 11)
"cameras/drone/drone1" SET Transform localScale (0.8385502712697885 0.8385502712697885 0.8385502712697885)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.704817660465223 0)
"cameras" SET Transform eulerAngles (7.224031084268169 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7255454891339592
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6778229984748296
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12647888016223982
"cameras/drone/drone0" SET Transform localPosition (0.8078743740939534 -0.24646172849030906 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9465141200293579 0.8790762092915392 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -8 12)
"cameras/drone/drone0" SET Transform localScale (0.6701363897199165 0.6701363897199165 0.6701363897199165)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -4 -9)
"cameras/drone/drone1" SET Transform localScale (1.3164885777222157 1.3164885777222157 1.3164885777222157)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3994105553728735 0)
"cameras" SET Transform eulerAngles (1.9388362245368604 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6660669067783227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4805936793014598
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3329608058220111
"cameras/drone/drone0" SET Transform localPosition (-1.035022951187454 0.18867919330006094 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6422832456790595 1.0588808855246243 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 12 -6)
"cameras/drone/drone0" SET Transform localScale (0.8148448134756291 0.8148448134756291 0.8148448134756291)
"cameras/drone/drone1" SET Transform localEulerAngles (10 19 -20)
"cameras/drone/drone1" SET Transform localScale (0.6069858986268749 0.6069858986268749 0.6069858986268749)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.784535188693183 0)
"cameras" SET Transform eulerAngles (8.878228544826541 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7432391153504909
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.816109106018937
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3523726417415748
"cameras/drone/drone0" SET Transform localPosition (1.0320998369119245 0.22094963326541855 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.43676211875457194 1.0566705730750376 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 14 13)
"cameras/drone/drone0" SET Transform localScale (0.9018644416883579 0.9018644416883579 0.9018644416883579)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -20 16)
"cameras/drone/drone1" SET Transform localScale (1.0305038543248175 1.0305038543248175 1.0305038543248175)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2983457116565624 0)
"cameras" SET Transform eulerAngles (-14.902216787603262 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8578480915701187
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0239455318423059
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24276770637225675
"cameras/drone/drone0" SET Transform localPosition (-0.8544588849859851 0.07230374520491595 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6948233670348345 1.2071680977234485 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -8 -5)
"cameras/drone/drone0" SET Transform localScale (0.8189356613415336 0.8189356613415336 0.8189356613415336)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 15 11)
"cameras/drone/drone1" SET Transform localScale (1.2426559634427292 1.2426559634427292 1.2426559634427292)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.928687018818733 0)
"cameras" SET Transform eulerAngles (-18.115189390893846 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2680534585334864
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4020950982144549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24895593015718967
"cameras/drone/drone0" SET Transform localPosition (-0.1255336373038174 0.5546919644727528 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.20820236656228963 1.1802863759237718 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -10 -14)
"cameras/drone/drone0" SET Transform localScale (0.9972255856783452 0.9972255856783452 0.9972255856783452)
"cameras/drone/drone1" SET Transform localEulerAngles (1 6 -16)
"cameras/drone/drone1" SET Transform localScale (1.2530281840881958 1.2530281840881958 1.2530281840881958)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0964930736658123 0)
"cameras" SET Transform eulerAngles (-8.814418149390608 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5491147893212805
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.939923527590918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.017378687183731988
"cameras/drone/drone0" SET Transform localPosition (0.4911963791851408 0.6065363602626295 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5439654493413792 0.8256874717334146 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -5 5)
"cameras/drone/drone0" SET Transform localScale (1.0689859819814436 1.0689859819814436 1.0689859819814436)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -7 3)
"cameras/drone/drone1" SET Transform localScale (0.6054733390768731 0.6054733390768731 0.6054733390768731)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3736316080456703 0)
"cameras" SET Transform eulerAngles (19.357509251708528 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7985520693827992
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5707503564669962
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20234075344024982
"cameras/drone/drone0" SET Transform localPosition (0.21452898227095107 0.4239445968885605 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5424258727973252 1.2971289969159219 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 19 2)
"cameras/drone/drone0" SET Transform localScale (0.9300751602340998 0.9300751602340998 0.9300751602340998)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -10 15)
"cameras/drone/drone1" SET Transform localScale (0.8275729157798076 0.8275729157798076 0.8275729157798076)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.432678425253698 0)
"cameras" SET Transform eulerAngles (-5.58912908749393 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1498434995224809
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.153982470347355
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19697252979506877
"cameras/drone/drone0" SET Transform localPosition (-0.6117786211753363 -0.2629337289910714 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9922321469289472 1.0747078325106225 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 12 -12)
"cameras/drone/drone0" SET Transform localScale (0.7800721113373922 0.7800721113373922 0.7800721113373922)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 13 10)
"cameras/drone/drone1" SET Transform localScale (1.4629110658062063 1.4629110658062063 1.4629110658062063)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.037333868481946 0)
"cameras" SET Transform eulerAngles (-8.183479510527473 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1214783248945905
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4251362366197404
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3162692197517886
"cameras/drone/drone0" SET Transform localPosition (-1.0142330574598994 0.1013404034326218 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06334300570176721 0.8549799277030089 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -4 -5)
"cameras/drone/drone0" SET Transform localScale (0.7900088266875338 0.7900088266875338 0.7900088266875338)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -3 -2)
"cameras/drone/drone1" SET Transform localScale (0.9169665025923116 0.9169665025923116 0.9169665025923116)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.15437912764614 0)
"cameras" SET Transform eulerAngles (19.51868440035406 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7473845623073183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9634465876398521
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12828580914362028
"cameras/drone/drone0" SET Transform localPosition (0.23325508985893273 -0.2517549300234821 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.25671605235886574 1.189183321430519 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 4 16)
"cameras/drone/drone0" SET Transform localScale (1.228448333555257 1.228448333555257 1.228448333555257)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -5 -15)
"cameras/drone/drone1" SET Transform localScale (1.4217683375373946 1.4217683375373946 1.4217683375373946)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.451063283098001 0)
"cameras" SET Transform eulerAngles (17.127572362033874 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3771573213184354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7085564671069489
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30978253176091913
"cameras/drone/drone0" SET Transform localPosition (-0.5377708913564553 0.09791792486222056 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9203538916500149 1.2587818421806638 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 7 -16)
"cameras/drone/drone0" SET Transform localScale (0.8757420730150911 0.8757420730150911 0.8757420730150911)
"cameras/drone/drone1" SET Transform localEulerAngles (15 11 -18)
"cameras/drone/drone1" SET Transform localScale (1.4305942816782233 1.4305942816782233 1.4305942816782233)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.556280311674559 0)
"cameras" SET Transform eulerAngles (3.4321713019530264 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5565211302722641
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7776665164083896
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2790569241121718
"cameras/drone/drone0" SET Transform localPosition (0.3604002371948454 0.33736301854811973 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6538299071977802 0.9853294836431181 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -8 7)
"cameras/drone/drone0" SET Transform localScale (1.1019331464535256 1.1019331464535256 1.1019331464535256)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -10 -12)
"cameras/drone/drone1" SET Transform localScale (0.6734681082475266 0.6734681082475266 0.6734681082475266)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.851235023858915 0)
"cameras" SET Transform eulerAngles (-5.691613705408184 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7765931094268586
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6764041698306422
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1743955456474265
"cameras/drone/drone0" SET Transform localPosition (1.0317652675668445 0.5039358755427827 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17851578832200898 1.2371485333363454 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -14 9)
"cameras/drone/drone0" SET Transform localScale (0.7379481836703271 0.7379481836703271 0.7379481836703271)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 7 -20)
"cameras/drone/drone1" SET Transform localScale (1.354278140729354 1.354278140729354 1.354278140729354)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5192548342373504 0)
"cameras" SET Transform eulerAngles (0.3567326583859831 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0925653861488995
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3548385594196204
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16469204330831055
"cameras/drone/drone0" SET Transform localPosition (0.16502541286106687 0.283940215784986 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.43099684824436 1.252800935228321 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 0 10)
"cameras/drone/drone0" SET Transform localScale (1.0774559156091201 1.0774559156091201 1.0774559156091201)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 9 -11)
"cameras/drone/drone1" SET Transform localScale (1.1542685042515033 1.1542685042515033 1.1542685042515033)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.84408058233264 0)
"cameras" SET Transform eulerAngles (-19.390293177324672 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5967326065819819
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3810462150735625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1459298718166079
"cameras/drone/drone0" SET Transform localPosition (0.4682317862422667 -0.2578196204968847 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.18883613490239526 0.8098356251983457 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -1 2)
"cameras/drone/drone0" SET Transform localScale (1.3798094247715322 1.3798094247715322 1.3798094247715322)
"cameras/drone/drone1" SET Transform localEulerAngles (20 0 -9)
"cameras/drone/drone1" SET Transform localScale (1.0399152035520514 1.0399152035520514 1.0399152035520514)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.895299713818555 0)
"cameras" SET Transform eulerAngles (3.9519891271195675 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2129264153625465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.932272264474567
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3378806639435571
"cameras/drone/drone0" SET Transform localPosition (0.05267840906314136 -0.13965162959529748 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6733975248960686 0.9974609231056926 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 6 0)
"cameras/drone/drone0" SET Transform localScale (1.0389169338535067 1.0389169338535067 1.0389169338535067)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 15 -5)
"cameras/drone/drone1" SET Transform localScale (0.8899395581092653 0.8899395581092653 0.8899395581092653)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.94742942948635 0)
"cameras" SET Transform eulerAngles (-13.301065748458708 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4476165967623293
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.021115855440524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24185632984205818
"cameras/drone/drone0" SET Transform localPosition (-1.1341335498801597 0.5125635247173379 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.41381216831669176 0.9599665885839854 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -6 7)
"cameras/drone/drone0" SET Transform localScale (0.6839741044541854 0.6839741044541854 0.6839741044541854)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 12 -3)
"cameras/drone/drone1" SET Transform localScale (0.6465738025373788 0.6465738025373788 0.6465738025373788)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.685527306124449 0)
"cameras" SET Transform eulerAngles (19.88621871718084 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43791993935126955
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7627765079606665
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2730467444995049
"cameras/drone/drone0" SET Transform localPosition (0.8616111190344238 0.05390083779343907 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4450945264994308 1.1913264723355552 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -15 13)
"cameras/drone/drone0" SET Transform localScale (0.9668016125772045 0.9668016125772045 0.9668016125772045)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 14 -17)
"cameras/drone/drone1" SET Transform localScale (1.245538825954229 1.245538825954229 1.245538825954229)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.718050020061213 0)
"cameras" SET Transform eulerAngles (3.7349956498959394 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.262836875749473
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1254390120985094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3465008964569695
"cameras/drone/drone0" SET Transform localPosition (0.8791815961582008 0.17729137767842879 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.21775405909074697 1.1659408650762628 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 4 -15)
"cameras/drone/drone0" SET Transform localScale (1.4951274871417166 1.4951274871417166 1.4951274871417166)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -12 19)
"cameras/drone/drone1" SET Transform localScale (1.0463827754411446 1.0463827754411446 1.0463827754411446)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.696868942583901 0)
"cameras" SET Transform eulerAngles (0.5959024447929586 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.525913406296966
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9067872513310467
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38681551133110004
"cameras/drone/drone0" SET Transform localPosition (-0.22230820899254777 -0.1617169406251609 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6587550050167877 0.9215348042689746 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -16 -4)
"cameras/drone/drone0" SET Transform localScale (0.6954335799164555 0.6954335799164555 0.6954335799164555)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 4 -1)
"cameras/drone/drone1" SET Transform localScale (0.9862600291986978 0.9862600291986978 0.9862600291986978)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.255794480309291 0)
"cameras" SET Transform eulerAngles (10.979036743530308 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7095361331222553
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5882692146820032
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3939792471730823
"cameras/drone/drone0" SET Transform localPosition (0.396044236010634 0.6254850629555795 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0693220842906439 1.273476778604355 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 15 -7)
"cameras/drone/drone0" SET Transform localScale (1.0010107528412373 1.0010107528412373 1.0010107528412373)
"cameras/drone/drone1" SET Transform localEulerAngles (7 14 -8)
"cameras/drone/drone1" SET Transform localScale (1.1515282233446058 1.1515282233446058 1.1515282233446058)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.685469417007864 0)
"cameras" SET Transform eulerAngles (19.584645056290697 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9853703541356603
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3554725073327407
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12231708945912506
"cameras/drone/drone0" SET Transform localPosition (-0.16190655057154824 0.33171426794894504 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1579836418978073 0.9703478417944523 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 17 15)
"cameras/drone/drone0" SET Transform localScale (0.6226973261905214 0.6226973261905214 0.6226973261905214)
"cameras/drone/drone1" SET Transform localEulerAngles (12 15 -8)
"cameras/drone/drone1" SET Transform localScale (1.18803840721138 1.18803840721138 1.18803840721138)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
