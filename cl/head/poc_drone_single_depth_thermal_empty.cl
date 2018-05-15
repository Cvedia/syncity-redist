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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 186 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 19 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 93 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 73 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-8.304626809486042 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 89
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.22030593357304 0)
"cameras" SET Transform eulerAngles (-4.376062997802087 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.876122051416941
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.056203882226349
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13549634602379507
"cameras/drone/drone0" SET Transform localPosition (0.42254985821544766 0.6760142598444323 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9144124288328614 1.0515331888790003 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -19 17)
"cameras/drone/drone0" SET Transform localScale (1.0611801024341176 1.0611801024341176 1.0611801024341176)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -15 8)
"cameras/drone/drone1" SET Transform localScale (1.058905692123606 1.058905692123606 1.058905692123606)
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
"cameras" SET Transform position (0 3.5591771124233897 0)
"cameras" SET Transform eulerAngles (1.2141142019574076 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4113238759498725
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2802957432106772
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2126134242679949
"cameras/drone/drone0" SET Transform localPosition (0.10434978165554565 0.6935155652202689 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.44296352859031485 1.217553125522524 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -8 0)
"cameras/drone/drone0" SET Transform localScale (1.4427031583280638 1.4427031583280638 1.4427031583280638)
"cameras/drone/drone1" SET Transform localEulerAngles (3 5 1)
"cameras/drone/drone1" SET Transform localScale (0.7931585552039091 0.7931585552039091 0.7931585552039091)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.162112462253693 0)
"cameras" SET Transform eulerAngles (14.35147156283599 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0498035191392632
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.661918690834482
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025862377989554555
"cameras/drone/drone0" SET Transform localPosition (0.16791397815197828 0.3534269720504311 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8319272430095765 1.0709337424069476 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 2 -19)
"cameras/drone/drone0" SET Transform localScale (1.4659548750417575 1.4659548750417575 1.4659548750417575)
"cameras/drone/drone1" SET Transform localEulerAngles (8 18 6)
"cameras/drone/drone1" SET Transform localScale (1.0124074799933673 1.0124074799933673 1.0124074799933673)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.228589640136808 0)
"cameras" SET Transform eulerAngles (-16.02570839773403 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.184428048154935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4940025679542241
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15209011514454107
"cameras/drone/drone0" SET Transform localPosition (0.9747069944446449 0.5798520902546143 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.554330698177498 0.8878184809419453 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -11 8)
"cameras/drone/drone0" SET Transform localScale (0.7526258251586672 0.7526258251586672 0.7526258251586672)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -14 -10)
"cameras/drone/drone1" SET Transform localScale (1.324211249433099 1.324211249433099 1.324211249433099)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.70585601814399 0)
"cameras" SET Transform eulerAngles (-2.6533886522750123 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.404255690644042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9309758206067904
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.322143918171966
"cameras/drone/drone0" SET Transform localPosition (-0.2544980693214809 0.5785062726915431 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.05321911506717525 0.9596398335530318 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -10 3)
"cameras/drone/drone0" SET Transform localScale (1.241980709726047 1.241980709726047 1.241980709726047)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 19 15)
"cameras/drone/drone1" SET Transform localScale (0.8386804240849732 0.8386804240849732 0.8386804240849732)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.836090851451967 0)
"cameras" SET Transform eulerAngles (-16.680114579854042 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.077912583758417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4969500069121366
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3111659448442162
"cameras/drone/drone0" SET Transform localPosition (-0.5953775887176894 -0.0068313788466131675 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12698554733982936 1.0234097769905341 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -19 14)
"cameras/drone/drone0" SET Transform localScale (0.7643519241414263 0.7643519241414263 0.7643519241414263)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 7 14)
"cameras/drone/drone1" SET Transform localScale (1.200369619777904 1.200369619777904 1.200369619777904)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.295001522117911 0)
"cameras" SET Transform eulerAngles (-17.378079796176547 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9283836680247552
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9980964156621356
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11562935260988168
"cameras/drone/drone0" SET Transform localPosition (-1.1377608011447353 0.1895471998795893 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1764298090128504 1.2638130607397131 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 18 19)
"cameras/drone/drone0" SET Transform localScale (1.1761575021794302 1.1761575021794302 1.1761575021794302)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -6 13)
"cameras/drone/drone1" SET Transform localScale (1.287663198389654 1.287663198389654 1.287663198389654)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.87456955860904 0)
"cameras" SET Transform eulerAngles (-14.350427054632512 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0107653155731016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.198243786951822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14484324156767192
"cameras/drone/drone0" SET Transform localPosition (-0.6356257905512728 0.38038435330311954 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.15925612233730546 0.97380910660255 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 5 -5)
"cameras/drone/drone0" SET Transform localScale (0.659400202800688 0.659400202800688 0.659400202800688)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 0 11)
"cameras/drone/drone1" SET Transform localScale (0.7673847189808729 0.7673847189808729 0.7673847189808729)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5675885452056475 0)
"cameras" SET Transform eulerAngles (-13.626690242664306 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6331248845938698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2235214137225308
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2267866768793476
"cameras/drone/drone0" SET Transform localPosition (0.31928930742869066 0.5946336372854626 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.049822431656729 0.9546890628354123 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -12 -8)
"cameras/drone/drone0" SET Transform localScale (1.497340389733588 1.497340389733588 1.497340389733588)
"cameras/drone/drone1" SET Transform localEulerAngles (2 9 -11)
"cameras/drone/drone1" SET Transform localScale (0.7598026470366336 0.7598026470366336 0.7598026470366336)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.857527117913198 0)
"cameras" SET Transform eulerAngles (-16.767659374484076 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8456599089992839
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.900447876161171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09321835484388591
"cameras/drone/drone0" SET Transform localPosition (-0.1048610343285672 -0.2662106475625667 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12825782100310357 1.2833615998560166 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -19 -16)
"cameras/drone/drone0" SET Transform localScale (0.8927090889304257 0.8927090889304257 0.8927090889304257)
"cameras/drone/drone1" SET Transform localEulerAngles (0 1 -14)
"cameras/drone/drone1" SET Transform localScale (0.6332840743377445 0.6332840743377445 0.6332840743377445)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.644561363688608 0)
"cameras" SET Transform eulerAngles (19.863387875598193 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9985907147530734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.047477841558929
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35672046766030296
"cameras/drone/drone0" SET Transform localPosition (0.9684705603990558 -0.0844784691033284 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.34955072960417477 1.2572443730586385 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -17 6)
"cameras/drone/drone0" SET Transform localScale (0.9975008774313971 0.9975008774313971 0.9975008774313971)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -4 3)
"cameras/drone/drone1" SET Transform localScale (0.819144839947095 0.819144839947095 0.819144839947095)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.891391272870031 0)
"cameras" SET Transform eulerAngles (-15.503442332818826 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.750313838639098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4024320004686681
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14208077463378377
"cameras/drone/drone0" SET Transform localPosition (0.6768875523942404 -0.2723196809026786 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.22191717543400113 1.0469722982838516 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 15 7)
"cameras/drone/drone0" SET Transform localScale (1.0177306308650582 1.0177306308650582 1.0177306308650582)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -11 12)
"cameras/drone/drone1" SET Transform localScale (0.8765975961854586 0.8765975961854586 0.8765975961854586)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.834229050965439 0)
"cameras" SET Transform eulerAngles (-19.841988124217814 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.426113621094399
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2944750236575548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15443895494049031
"cameras/drone/drone0" SET Transform localPosition (0.0025034106912529275 0.20684613638873134 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.38105492201157076 1.031775158188182 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 16 7)
"cameras/drone/drone0" SET Transform localScale (1.3585908306326122 1.3585908306326122 1.3585908306326122)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -10 -7)
"cameras/drone/drone1" SET Transform localScale (1.4252078718828463 1.4252078718828463 1.4252078718828463)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4430185935299242 0)
"cameras" SET Transform eulerAngles (1.772885053784563 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6383063321258572
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3577518581239225
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2798010113475653
"cameras/drone/drone0" SET Transform localPosition (-0.6673154236650978 0.16054770141283664 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0401677701093333 0.9975496981027225 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 14 15)
"cameras/drone/drone0" SET Transform localScale (1.2912242989799736 1.2912242989799736 1.2912242989799736)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 5 -13)
"cameras/drone/drone1" SET Transform localScale (1.3142167014062873 1.3142167014062873 1.3142167014062873)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1145116307961738 0)
"cameras" SET Transform eulerAngles (-15.852848221676123 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1902334754713855
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5160859067484256
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31828282783153367
"cameras/drone/drone0" SET Transform localPosition (0.626644679645666 0.5820182574756403 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9071054969578544 1.0595155543715378 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 2 -6)
"cameras/drone/drone0" SET Transform localScale (0.8911183836610979 0.8911183836610979 0.8911183836610979)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -18 0)
"cameras/drone/drone1" SET Transform localScale (0.7403908244789572 0.7403908244789572 0.7403908244789572)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.819314999608103 0)
"cameras" SET Transform eulerAngles (-0.6431420132616203 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8264120724407158
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3406289624565084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07019072451072561
"cameras/drone/drone0" SET Transform localPosition (0.40665500263097387 0.4644539686415781 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.946102270259191 0.8575635717938048 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 10 13)
"cameras/drone/drone0" SET Transform localScale (0.6342137878827523 0.6342137878827523 0.6342137878827523)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 13 18)
"cameras/drone/drone1" SET Transform localScale (0.893923244424907 0.893923244424907 0.893923244424907)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.308279664770495 0)
"cameras" SET Transform eulerAngles (8.707642260428486 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6414448094863822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8262998138396347
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32941393017349374
"cameras/drone/drone0" SET Transform localPosition (0.12406200155504021 0.0040422167192333824 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7037357644523399 0.8301513734458388 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 15 -9)
"cameras/drone/drone0" SET Transform localScale (0.9563458804001514 0.9563458804001514 0.9563458804001514)
"cameras/drone/drone1" SET Transform localEulerAngles (13 1 -3)
"cameras/drone/drone1" SET Transform localScale (1.078667947119834 1.078667947119834 1.078667947119834)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.064142032387136 0)
"cameras" SET Transform eulerAngles (15.1344711489442 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.700130019890802
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5482675659393839
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23063994151779166
"cameras/drone/drone0" SET Transform localPosition (-0.646102219252617 0.35944001469593373 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.10288350222080656 1.1640957559497966 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -12 -19)
"cameras/drone/drone0" SET Transform localScale (1.3157513797374878 1.3157513797374878 1.3157513797374878)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -20 15)
"cameras/drone/drone1" SET Transform localScale (0.6933912508670814 0.6933912508670814 0.6933912508670814)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8293126153316104 0)
"cameras" SET Transform eulerAngles (-0.2563469827358773 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0509264340909286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1403279791771217
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.297295501939857
"cameras/drone/drone0" SET Transform localPosition (-0.21229886015483368 0.3068176715172812 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5831422085166302 0.9784802168314802 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 5 -11)
"cameras/drone/drone0" SET Transform localScale (1.2561207976883084 1.2561207976883084 1.2561207976883084)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 8 -7)
"cameras/drone/drone1" SET Transform localScale (0.6033041900840977 0.6033041900840977 0.6033041900840977)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.567381023585963 0)
"cameras" SET Transform eulerAngles (-7.1953442030958925 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5717306139883986
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5231605589634616
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09914949443622306
"cameras/drone/drone0" SET Transform localPosition (-0.35433442732610887 0.29779315602011464 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.13237033406612553 0.8393928127570682 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -14 13)
"cameras/drone/drone0" SET Transform localScale (0.6298919001876865 0.6298919001876865 0.6298919001876865)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -4 4)
"cameras/drone/drone1" SET Transform localScale (1.2200108660851403 1.2200108660851403 1.2200108660851403)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6567591029280013 0)
"cameras" SET Transform eulerAngles (5.525398158084215 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4060909482147252
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.859964601506093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04794591527365926
"cameras/drone/drone0" SET Transform localPosition (-0.6424584670979712 0.2652238082527984 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8162869985477157 1.2242124075534315 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 17 -13)
"cameras/drone/drone0" SET Transform localScale (0.8434128824700771 0.8434128824700771 0.8434128824700771)
"cameras/drone/drone1" SET Transform localEulerAngles (4 16 -5)
"cameras/drone/drone1" SET Transform localScale (0.9970607905930144 0.9970607905930144 0.9970607905930144)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3470417396502405 0)
"cameras" SET Transform eulerAngles (14.252478761973805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7267946646176808
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2644916123481402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11326423021422688
"cameras/drone/drone0" SET Transform localPosition (-0.4433507597578189 0.2771048253341594 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1525809186412965 0.8554843130894006 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -15 3)
"cameras/drone/drone0" SET Transform localScale (1.411560661627759 1.411560661627759 1.411560661627759)
"cameras/drone/drone1" SET Transform localEulerAngles (7 10 19)
"cameras/drone/drone1" SET Transform localScale (0.9082413562271406 0.9082413562271406 0.9082413562271406)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0494047743567054 0)
"cameras" SET Transform eulerAngles (-0.7956171185838166 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.454528657671894
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.561113856408656
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0033293855920256913
"cameras/drone/drone0" SET Transform localPosition (-0.6761754914667141 0.24189308317241948 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7384436768044139 1.1229597377400373 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 7 10)
"cameras/drone/drone0" SET Transform localScale (1.4453496016573775 1.4453496016573775 1.4453496016573775)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -19 13)
"cameras/drone/drone1" SET Transform localScale (0.9211356076171535 0.9211356076171535 0.9211356076171535)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4118600653438294 0)
"cameras" SET Transform eulerAngles (4.55671560708733 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0504483038639578
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8848743142847124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26395741150068663
"cameras/drone/drone0" SET Transform localPosition (0.1451044538740931 0.6974605638230944 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.31045591844765297 1.2991278326507376 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 17 4)
"cameras/drone/drone0" SET Transform localScale (0.7074170240795844 0.7074170240795844 0.7074170240795844)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -4 6)
"cameras/drone/drone1" SET Transform localScale (1.2111709825672112 1.2111709825672112 1.2111709825672112)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.92030939192559 0)
"cameras" SET Transform eulerAngles (0.28723156164190655 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1609484275658661
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.995438772918647
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24105512382566496
"cameras/drone/drone0" SET Transform localPosition (-0.31962301464087384 0.307030592987446 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4123058583928346 1.183021592997384 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -13 -7)
"cameras/drone/drone0" SET Transform localScale (0.746927825874852 0.746927825874852 0.746927825874852)
"cameras/drone/drone1" SET Transform localEulerAngles (9 11 -18)
"cameras/drone/drone1" SET Transform localScale (0.7943311848522182 0.7943311848522182 0.7943311848522182)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4095960005683414 0)
"cameras" SET Transform eulerAngles (-13.444357552162893 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1160757826803631
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8614537349091425
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2515461859347824
"cameras/drone/drone0" SET Transform localPosition (-0.5489911810044497 -0.1665356628357278 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.15550945962433516 1.062743585741353 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -20 -15)
"cameras/drone/drone0" SET Transform localScale (0.8832529965217775 0.8832529965217775 0.8832529965217775)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -4 -1)
"cameras/drone/drone1" SET Transform localScale (1.469541634502526 1.469541634502526 1.469541634502526)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.034815541762351 0)
"cameras" SET Transform eulerAngles (6.21705448422993 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6380149530448169
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.298708156865494
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2089301053201641
"cameras/drone/drone0" SET Transform localPosition (-0.27625788800146966 0.10994782342426807 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1427693522645832 0.8166201436875808 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 17 15)
"cameras/drone/drone0" SET Transform localScale (1.2178882586022903 1.2178882586022903 1.2178882586022903)
"cameras/drone/drone1" SET Transform localEulerAngles (3 4 -13)
"cameras/drone/drone1" SET Transform localScale (1.1887644557195343 1.1887644557195343 1.1887644557195343)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.977997248304386 0)
"cameras" SET Transform eulerAngles (1.4365257793121344 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.584354171238856
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2947435044786884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23991061899981286
"cameras/drone/drone0" SET Transform localPosition (-0.3687774293665904 0.052966948643001055 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3296685924687345 1.1560737102284495 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 18 -6)
"cameras/drone/drone0" SET Transform localScale (0.6273322568000725 0.6273322568000725 0.6273322568000725)
"cameras/drone/drone1" SET Transform localEulerAngles (4 9 -16)
"cameras/drone/drone1" SET Transform localScale (0.8939747973361598 0.8939747973361598 0.8939747973361598)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.372493425697041 0)
"cameras" SET Transform eulerAngles (13.208510797558574 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0136944040230915
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2949771607101561
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3902333377907762
"cameras/drone/drone0" SET Transform localPosition (0.7005466833744154 0.14451312019644708 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1740394116904043 1.0275380662545746 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 15 -3)
"cameras/drone/drone0" SET Transform localScale (0.8252494232677428 0.8252494232677428 0.8252494232677428)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -10 -17)
"cameras/drone/drone1" SET Transform localScale (1.4174609155066453 1.4174609155066453 1.4174609155066453)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4047639120969597 0)
"cameras" SET Transform eulerAngles (-19.328606239918727 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4225219848690482
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4068537303896864
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27746323091597197
"cameras/drone/drone0" SET Transform localPosition (-0.24224732694222517 0.30251521728946545 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1407251371373366 0.8319927262738971 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 12 -18)
"cameras/drone/drone0" SET Transform localScale (1.1064381191185755 1.1064381191185755 1.1064381191185755)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -10 -7)
"cameras/drone/drone1" SET Transform localScale (0.7910471057475474 0.7910471057475474 0.7910471057475474)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.954687109284528 0)
"cameras" SET Transform eulerAngles (-18.17402301079847 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.533065737258717
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9923461661589279
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04440962585571384
"cameras/drone/drone0" SET Transform localPosition (0.48530299743968763 -0.23508282114353846 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6424421839974153 0.8283962088901045 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 17 3)
"cameras/drone/drone0" SET Transform localScale (1.2918766726569397 1.2918766726569397 1.2918766726569397)
"cameras/drone/drone1" SET Transform localEulerAngles (5 5 -18)
"cameras/drone/drone1" SET Transform localScale (1.2470395390442999 1.2470395390442999 1.2470395390442999)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.742578370889031 0)
"cameras" SET Transform eulerAngles (12.759472935389255 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0392680706699684
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.959843295643127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0100313842188966
"cameras/drone/drone0" SET Transform localPosition (0.23392920039841014 -0.07409887643303831 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.33988788866955844 1.2470807745579022 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 2 1)
"cameras/drone/drone0" SET Transform localScale (0.8255277611837367 0.8255277611837367 0.8255277611837367)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -11 -15)
"cameras/drone/drone1" SET Transform localScale (1.1076951256184695 1.1076951256184695 1.1076951256184695)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8819353804391175 0)
"cameras" SET Transform eulerAngles (-7.479570465731786 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.418742784338921
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2361590405446825
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14381840410425858
"cameras/drone/drone0" SET Transform localPosition (-0.30266759759923834 0.5766972326289537 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9643705194057832 1.2898509876544781 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -11 -14)
"cameras/drone/drone0" SET Transform localScale (1.0879673452097558 1.0879673452097558 1.0879673452097558)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 8 14)
"cameras/drone/drone1" SET Transform localScale (0.8882307920557444 0.8882307920557444 0.8882307920557444)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9919038260604864 0)
"cameras" SET Transform eulerAngles (-16.439445360146333 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7533028397530233
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9806965642774346
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30382445693889226
"cameras/drone/drone0" SET Transform localPosition (0.5579640387019862 0.3594900713432538 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.158816537165834 1.1947472102145262 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 2 -19)
"cameras/drone/drone0" SET Transform localScale (0.7079609489801463 0.7079609489801463 0.7079609489801463)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 11 16)
"cameras/drone/drone1" SET Transform localScale (0.7751356440217874 0.7751356440217874 0.7751356440217874)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.353779790490587 0)
"cameras" SET Transform eulerAngles (12.490012825907648 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2676998138229947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6792177098158227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12450430874610174
"cameras/drone/drone0" SET Transform localPosition (-0.13121951033310508 0.3981575631617958 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5563201916487992 1.0362433185973412 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 7 13)
"cameras/drone/drone0" SET Transform localScale (1.2741628227637303 1.2741628227637303 1.2741628227637303)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -17 -17)
"cameras/drone/drone1" SET Transform localScale (1.000953083120443 1.000953083120443 1.000953083120443)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4135127188928243 0)
"cameras" SET Transform eulerAngles (-8.081057313268003 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.976277364755628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0422314404939172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12062255125503962
"cameras/drone/drone0" SET Transform localPosition (-0.4885298423240627 0.47019436032660294 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.297708245600814 0.9161940170946652 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 8 -11)
"cameras/drone/drone0" SET Transform localScale (0.669403673785748 0.669403673785748 0.669403673785748)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -9 -10)
"cameras/drone/drone1" SET Transform localScale (0.6449695886440135 0.6449695886440135 0.6449695886440135)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5442431094602638 0)
"cameras" SET Transform eulerAngles (-0.8429050252068784 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6147549449933808
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8883755112840932
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1732791324941029
"cameras/drone/drone0" SET Transform localPosition (0.9409793856587882 0.20083357846944466 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6014495705820203 1.17199597970286 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 2 -16)
"cameras/drone/drone0" SET Transform localScale (0.8962973282125659 0.8962973282125659 0.8962973282125659)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 5 16)
"cameras/drone/drone1" SET Transform localScale (0.879600698734347 0.879600698734347 0.879600698734347)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2085490399664702 0)
"cameras" SET Transform eulerAngles (7.877943841362772 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42794033592147585
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8680043600225698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2422634925933207
"cameras/drone/drone0" SET Transform localPosition (-1.1676644633680928 0.34947046180972813 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2697768221087 1.0555463955830056 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 11 12)
"cameras/drone/drone0" SET Transform localScale (0.8108601548250047 0.8108601548250047 0.8108601548250047)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 7 19)
"cameras/drone/drone1" SET Transform localScale (0.7823414666204906 0.7823414666204906 0.7823414666204906)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.815494604300052 0)
"cameras" SET Transform eulerAngles (-16.255594939479177 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6370280200143278
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8025755095793947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2815794877614271
"cameras/drone/drone0" SET Transform localPosition (-0.1284684348385703 -0.2794997623890387 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1237087229953395 0.8298513536641212 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -11 -4)
"cameras/drone/drone0" SET Transform localScale (1.112702309895809 1.112702309895809 1.112702309895809)
"cameras/drone/drone1" SET Transform localEulerAngles (6 13 15)
"cameras/drone/drone1" SET Transform localScale (1.0148403459454824 1.0148403459454824 1.0148403459454824)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.738567803798722 0)
"cameras" SET Transform eulerAngles (18.859201217407424 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.084152238048607
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9861195595138357
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31003934501780145
"cameras/drone/drone0" SET Transform localPosition (-0.20437894415829683 0.3879248072505132 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2243031064784845 1.0495210389043048 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 12 -17)
"cameras/drone/drone0" SET Transform localScale (0.8970196322726325 0.8970196322726325 0.8970196322726325)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -3 2)
"cameras/drone/drone1" SET Transform localScale (0.8555972959286163 0.8555972959286163 0.8555972959286163)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.894904262005645 0)
"cameras" SET Transform eulerAngles (11.945849605371492 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0865896107040605
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6149231382675935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3480520497247476
"cameras/drone/drone0" SET Transform localPosition (1.0040907854341 -0.28946280050972645 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7774029695054598 1.231373137528554 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -4 -14)
"cameras/drone/drone0" SET Transform localScale (1.3443319834792997 1.3443319834792997 1.3443319834792997)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 13 19)
"cameras/drone/drone1" SET Transform localScale (1.0089351755008993 1.0089351755008993 1.0089351755008993)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2914041263750695 0)
"cameras" SET Transform eulerAngles (7.240604530431526 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2179995870111047
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.974454391858937
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2908285771520136
"cameras/drone/drone0" SET Transform localPosition (-0.8200102681201316 0.008462336947252458 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.35751169391924753 1.1123710944951577 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 6 -12)
"cameras/drone/drone0" SET Transform localScale (0.6386247816225302 0.6386247816225302 0.6386247816225302)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -7 11)
"cameras/drone/drone1" SET Transform localScale (1.3204208213005486 1.3204208213005486 1.3204208213005486)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1827667630691034 0)
"cameras" SET Transform eulerAngles (19.029037840820706 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5535337876110821
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0206467965696242
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.057461553949755696
"cameras/drone/drone0" SET Transform localPosition (-0.12333372687136146 0.057952826283008185 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.32193328532133847 1.274194971659956 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 1 20)
"cameras/drone/drone0" SET Transform localScale (0.9405827328258107 0.9405827328258107 0.9405827328258107)
"cameras/drone/drone1" SET Transform localEulerAngles (1 0 -8)
"cameras/drone/drone1" SET Transform localScale (1.1809588127501502 1.1809588127501502 1.1809588127501502)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.692024454484786 0)
"cameras" SET Transform eulerAngles (-4.679557890589162 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3421444590195262
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3362727572355984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11861708908647023
"cameras/drone/drone0" SET Transform localPosition (0.8900509973605903 0.5880304874415494 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9584434357055278 1.2821339344495541 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 2 -1)
"cameras/drone/drone0" SET Transform localScale (0.6139898350287305 0.6139898350287305 0.6139898350287305)
"cameras/drone/drone1" SET Transform localEulerAngles (8 9 4)
"cameras/drone/drone1" SET Transform localScale (1.3431356689432772 1.3431356689432772 1.3431356689432772)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9416575244042216 0)
"cameras" SET Transform eulerAngles (-10.110830021846757 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47460811586965373
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9394357435865416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1920706081537591
"cameras/drone/drone0" SET Transform localPosition (0.3141540200877233 0.42021420721639974 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6147867442965327 1.0517725928953667 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -17 7)
"cameras/drone/drone0" SET Transform localScale (1.0831210145370331 1.0831210145370331 1.0831210145370331)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -14 6)
"cameras/drone/drone1" SET Transform localScale (0.744034085975141 0.744034085975141 0.744034085975141)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.455463584293827 0)
"cameras" SET Transform eulerAngles (-9.086604641007892 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7672449333183258
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1306775178766866
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36625535555024125
"cameras/drone/drone0" SET Transform localPosition (0.5900002873796297 0.12558905457343733 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1796375842520785 1.009729816073443 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 1 -6)
"cameras/drone/drone0" SET Transform localScale (1.0976258507892613 1.0976258507892613 1.0976258507892613)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -13 0)
"cameras/drone/drone1" SET Transform localScale (1.0601368131838815 1.0601368131838815 1.0601368131838815)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.371694234982626 0)
"cameras" SET Transform eulerAngles (-4.127658910695127 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5098353796445487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8508280248450348
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3097677751899484
"cameras/drone/drone0" SET Transform localPosition (0.6746341356870353 0.1879113781247645 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5180709656857523 0.832506968234558 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -14 5)
"cameras/drone/drone0" SET Transform localScale (1.0888947524027799 1.0888947524027799 1.0888947524027799)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -11 4)
"cameras/drone/drone1" SET Transform localScale (1.0736652928194321 1.0736652928194321 1.0736652928194321)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.68926420510576 0)
"cameras" SET Transform eulerAngles (5.908331344659242 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.707860630709017
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2059012189224485
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10018061660903972
"cameras/drone/drone0" SET Transform localPosition (0.6867711822517579 0.6220863062911701 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2761174085026835 1.0632991809017285 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -14 -12)
"cameras/drone/drone0" SET Transform localScale (0.988610899930621 0.988610899930621 0.988610899930621)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 14 -7)
"cameras/drone/drone1" SET Transform localScale (0.7001154476640576 0.7001154476640576 0.7001154476640576)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.904035359118532 0)
"cameras" SET Transform eulerAngles (-13.119489410723935 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0957587709786918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6890734360318747
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32694188055776374
"cameras/drone/drone0" SET Transform localPosition (-1.0326486656264307 -0.04169806398427717 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7291132069040056 0.9500337763946083 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 4 -17)
"cameras/drone/drone0" SET Transform localScale (0.7359520084527351 0.7359520084527351 0.7359520084527351)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 16 -3)
"cameras/drone/drone1" SET Transform localScale (1.2480735820645932 1.2480735820645932 1.2480735820645932)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.933991239082352 0)
"cameras" SET Transform eulerAngles (1.2081583520154666 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8002659630270339
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6862884611977984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05140427189544492
"cameras/drone/drone0" SET Transform localPosition (0.09029689084465664 0.2532210604773328 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0311478355690127 0.9662731692813771 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 5 3)
"cameras/drone/drone0" SET Transform localScale (1.3655166663483058 1.3655166663483058 1.3655166663483058)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -16 18)
"cameras/drone/drone1" SET Transform localScale (1.4179985564883006 1.4179985564883006 1.4179985564883006)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.857353575887922 0)
"cameras" SET Transform eulerAngles (9.166790633826064 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4882578640703775
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.060641524837286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08714032685386403
"cameras/drone/drone0" SET Transform localPosition (-0.8426763108903197 0.5424450550125324 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9524738465514723 1.1350145697784604 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 2 -19)
"cameras/drone/drone0" SET Transform localScale (0.6223118497558282 0.6223118497558282 0.6223118497558282)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 7 3)
"cameras/drone/drone1" SET Transform localScale (1.2147301765872598 1.2147301765872598 1.2147301765872598)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0256041799150095 0)
"cameras" SET Transform eulerAngles (19.106078604272547 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6133840564047935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.013726660213648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35654455655429484
"cameras/drone/drone0" SET Transform localPosition (0.0622120154776451 0.006728151750143685 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.114697298794894 1.1853834879140437 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -7 -17)
"cameras/drone/drone0" SET Transform localScale (0.7905197571432998 0.7905197571432998 0.7905197571432998)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -4 3)
"cameras/drone/drone1" SET Transform localScale (1.3607985115156342 1.3607985115156342 1.3607985115156342)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.314145914954217 0)
"cameras" SET Transform eulerAngles (10.17314846720462 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2621350336474433
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8672981959944748
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2313521340936888
"cameras/drone/drone0" SET Transform localPosition (1.1698765129913828 0.08659883337945368 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6657589512753332 1.1833391177056192 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -14 -12)
"cameras/drone/drone0" SET Transform localScale (1.2479066750625614 1.2479066750625614 1.2479066750625614)
"cameras/drone/drone1" SET Transform localEulerAngles (2 13 11)
"cameras/drone/drone1" SET Transform localScale (1.3447802775728221 1.3447802775728221 1.3447802775728221)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.176849563195831 0)
"cameras" SET Transform eulerAngles (-11.202637152446773 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4699097681417477
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4886386241755951
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11574735443031048
"cameras/drone/drone0" SET Transform localPosition (0.7827696699947 0.17262186231330484 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8474477472146311 1.2845444860217459 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -9 -7)
"cameras/drone/drone0" SET Transform localScale (1.1713920826299922 1.1713920826299922 1.1713920826299922)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 11 -19)
"cameras/drone/drone1" SET Transform localScale (0.7625144176462463 0.7625144176462463 0.7625144176462463)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.01279345819523 0)
"cameras" SET Transform eulerAngles (-8.914970011844371 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5202389824195137
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8500618544560954
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18248602936915478
"cameras/drone/drone0" SET Transform localPosition (0.14829648009419527 0.04493753845962639 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.36473701213632714 1.1525244247059148 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 16 -18)
"cameras/drone/drone0" SET Transform localScale (0.7543547167773492 0.7543547167773492 0.7543547167773492)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -10 1)
"cameras/drone/drone1" SET Transform localScale (0.944131681872415 0.944131681872415 0.944131681872415)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.359770739526036 0)
"cameras" SET Transform eulerAngles (-6.008872406620398 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1812605431233387
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.343138377508096
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3237265104769138
"cameras/drone/drone0" SET Transform localPosition (-0.010854552657023397 0.3146613576564649 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5758633468608769 1.089630467012546 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -6 8)
"cameras/drone/drone0" SET Transform localScale (0.6856596541498032 0.6856596541498032 0.6856596541498032)
"cameras/drone/drone1" SET Transform localEulerAngles (7 3 7)
"cameras/drone/drone1" SET Transform localScale (1.0930386838994433 1.0930386838994433 1.0930386838994433)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5202626047012697 0)
"cameras" SET Transform eulerAngles (4.910399426939243 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5718590709344467
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3169489794772602
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02559072536697049
"cameras/drone/drone0" SET Transform localPosition (0.9498255079132483 0.075804600714731 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8684637764704755 1.035510389316412 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 13 4)
"cameras/drone/drone0" SET Transform localScale (0.9675459541405171 0.9675459541405171 0.9675459541405171)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -7 -10)
"cameras/drone/drone1" SET Transform localScale (0.8281184171368583 0.8281184171368583 0.8281184171368583)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4516270784679435 0)
"cameras" SET Transform eulerAngles (-14.616552825003843 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4720729436989794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7846213212819635
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24497874598746897
"cameras/drone/drone0" SET Transform localPosition (0.13057395407671835 -0.11616080623647579 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9444583744532369 0.9998199374396826 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -2 18)
"cameras/drone/drone0" SET Transform localScale (0.9616952516827144 0.9616952516827144 0.9616952516827144)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -11 15)
"cameras/drone/drone1" SET Transform localScale (1.1968044309584216 1.1968044309584216 1.1968044309584216)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8551149852141573 0)
"cameras" SET Transform eulerAngles (-7.19781851910648 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8877943852685857
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.437423973162949
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.016324489053324908
"cameras/drone/drone0" SET Transform localPosition (-0.22326413245948162 -0.07090786210048189 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1824596321312535 0.9513304901030324 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 11 -16)
"cameras/drone/drone0" SET Transform localScale (1.040353009335544 1.040353009335544 1.040353009335544)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -14 -16)
"cameras/drone/drone1" SET Transform localScale (1.1634837219518759 1.1634837219518759 1.1634837219518759)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.635063435448455 0)
"cameras" SET Transform eulerAngles (-4.3993486029834905 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3616348779725826
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.016364273855627
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20220525258893574
"cameras/drone/drone0" SET Transform localPosition (0.01682361955040923 0.3577172786180059 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.32464608655761196 1.1741607986865505 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -7 -11)
"cameras/drone/drone0" SET Transform localScale (1.445904978367249 1.445904978367249 1.445904978367249)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -20 8)
"cameras/drone/drone1" SET Transform localScale (1.489675294370188 1.489675294370188 1.489675294370188)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.102066513678594 0)
"cameras" SET Transform eulerAngles (12.543332009030223 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1541477910963989
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9670170582141122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21066488898275693
"cameras/drone/drone0" SET Transform localPosition (-1.1115992846756402 0.3988736536940007 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1489915435197966 1.0835195342740633 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 9 -15)
"cameras/drone/drone0" SET Transform localScale (0.9207795246223093 0.9207795246223093 0.9207795246223093)
"cameras/drone/drone1" SET Transform localEulerAngles (12 20 -11)
"cameras/drone/drone1" SET Transform localScale (1.0620027860068846 1.0620027860068846 1.0620027860068846)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.625550219653652 0)
"cameras" SET Transform eulerAngles (-0.07895170383600103 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9237900946344929
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9599456550306762
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30825924757404227
"cameras/drone/drone0" SET Transform localPosition (0.32586744415230684 0.5347477766657158 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2596861421007448 1.0157784880334075 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 7 -1)
"cameras/drone/drone0" SET Transform localScale (1.3918555171518823 1.3918555171518823 1.3918555171518823)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -15 -4)
"cameras/drone/drone1" SET Transform localScale (0.94874335506969 0.94874335506969 0.94874335506969)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.044910044158696 0)
"cameras" SET Transform eulerAngles (13.69718430954422 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8290044865331966
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2209714281454889
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16699720219043607
"cameras/drone/drone0" SET Transform localPosition (-0.2938895356240945 0.23168935804965635 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.14836645643856428 0.8306862926662807 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 11 -12)
"cameras/drone/drone0" SET Transform localScale (0.9563916987734757 0.9563916987734757 0.9563916987734757)
"cameras/drone/drone1" SET Transform localEulerAngles (6 5 -9)
"cameras/drone/drone1" SET Transform localScale (1.0193908421406863 1.0193908421406863 1.0193908421406863)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6506124242903777 0)
"cameras" SET Transform eulerAngles (16.44213574818952 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9851137565781012
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9971059515244338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30428351293666
"cameras/drone/drone0" SET Transform localPosition (-0.6779131710214402 0.4796571740512248 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1136477519117303 0.9235129004063363 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 0 15)
"cameras/drone/drone0" SET Transform localScale (0.8775961089053244 0.8775961089053244 0.8775961089053244)
"cameras/drone/drone1" SET Transform localEulerAngles (15 6 14)
"cameras/drone/drone1" SET Transform localScale (1.262672612936552 1.262672612936552 1.262672612936552)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.064534281578409 0)
"cameras" SET Transform eulerAngles (6.321968054127396 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.929460317023575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.040397691016295
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14059229201445125
"cameras/drone/drone0" SET Transform localPosition (-1.0047819802840865 0.4761777607005297 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7071433675141547 1.2751005983611536 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 8 -16)
"cameras/drone/drone0" SET Transform localScale (1.1519265955221476 1.1519265955221476 1.1519265955221476)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -1 -8)
"cameras/drone/drone1" SET Transform localScale (1.443734461946888 1.443734461946888 1.443734461946888)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.435404181389893 0)
"cameras" SET Transform eulerAngles (-5.160220655011409 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4841206816461185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3145614855077719
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20342847932571217
"cameras/drone/drone0" SET Transform localPosition (-0.3236570669061918 -0.02044770015912528 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6954346419791049 1.1714248012813315 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -5 -5)
"cameras/drone/drone0" SET Transform localScale (0.8157560416747122 0.8157560416747122 0.8157560416747122)
"cameras/drone/drone1" SET Transform localEulerAngles (19 4 -12)
"cameras/drone/drone1" SET Transform localScale (1.0896976384889243 1.0896976384889243 1.0896976384889243)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.435488271205073 0)
"cameras" SET Transform eulerAngles (-0.38361587865777835 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6414645005667108
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4613625460108455
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11816816768168584
"cameras/drone/drone0" SET Transform localPosition (0.9470007960657696 0.011305617688507963 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.15763662640488407 1.119277935305278 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -12 20)
"cameras/drone/drone0" SET Transform localScale (1.0374424805511144 1.0374424805511144 1.0374424805511144)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -20 12)
"cameras/drone/drone1" SET Transform localScale (0.709233268410497 0.709233268410497 0.709233268410497)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.791922414660376 0)
"cameras" SET Transform eulerAngles (9.298958203070654 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6229019728557752
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4551663330408924
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35266475625583665
"cameras/drone/drone0" SET Transform localPosition (0.29663663584735556 0.2867958425413057 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6004190342575375 1.163418122435282 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 9 -16)
"cameras/drone/drone0" SET Transform localScale (1.2984213934368043 1.2984213934368043 1.2984213934368043)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -17 7)
"cameras/drone/drone1" SET Transform localScale (1.2685982462997174 1.2685982462997174 1.2685982462997174)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.515646666641485 0)
"cameras" SET Transform eulerAngles (0.6745627981909337 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4339117934954505
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7124323798856507
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07512057710683467
"cameras/drone/drone0" SET Transform localPosition (-0.7605204626643776 0.5001353110377142 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.36579641040330113 1.0028224314143914 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 20 -8)
"cameras/drone/drone0" SET Transform localScale (0.8218818115515913 0.8218818115515913 0.8218818115515913)
"cameras/drone/drone1" SET Transform localEulerAngles (1 7 -4)
"cameras/drone/drone1" SET Transform localScale (1.2212113390757828 1.2212113390757828 1.2212113390757828)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2702672270186874 0)
"cameras" SET Transform eulerAngles (-17.263308088928774 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1056843750109648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.980565865007828
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07371679479679005
"cameras/drone/drone0" SET Transform localPosition (1.1179589254039108 0.09180110209483189 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3560453433196923 0.8932036428003269 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 4 2)
"cameras/drone/drone0" SET Transform localScale (0.6977676517395234 0.6977676517395234 0.6977676517395234)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 14 -4)
"cameras/drone/drone1" SET Transform localScale (1.412554397365019 1.412554397365019 1.412554397365019)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2830038971282063 0)
"cameras" SET Transform eulerAngles (7.403028287027279 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0319072412457766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9315823459770606
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3259022352392878
"cameras/drone/drone0" SET Transform localPosition (0.5450885016700255 -0.07315918277778383 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1240011618795414 1.1395601879094497 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -5 0)
"cameras/drone/drone0" SET Transform localScale (0.8788281371513011 0.8788281371513011 0.8788281371513011)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 16 9)
"cameras/drone/drone1" SET Transform localScale (0.944093974093755 0.944093974093755 0.944093974093755)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.902364656880234 0)
"cameras" SET Transform eulerAngles (11.485292337144926 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.693893558264802
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.612605262273294
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30075100744017047
"cameras/drone/drone0" SET Transform localPosition (0.049209483262163456 -0.11691833388723588 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.014549325378651279 1.185637431516729 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 13 14)
"cameras/drone/drone0" SET Transform localScale (1.0411232433564794 1.0411232433564794 1.0411232433564794)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 0 -11)
"cameras/drone/drone1" SET Transform localScale (1.206524906128807 1.206524906128807 1.206524906128807)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5023873587574856 0)
"cameras" SET Transform eulerAngles (-1.1713671240873147 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9975460438590668
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.717573999765337
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31715039837222947
"cameras/drone/drone0" SET Transform localPosition (-0.8315999567320764 0.02991553173683076 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6179514177217316 0.9750581324896339 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 15 13)
"cameras/drone/drone0" SET Transform localScale (0.7711039442616374 0.7711039442616374 0.7711039442616374)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -7 -16)
"cameras/drone/drone1" SET Transform localScale (0.6413728979318444 0.6413728979318444 0.6413728979318444)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.654213687289994 0)
"cameras" SET Transform eulerAngles (7.281303486534814 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9720327243152829
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3769339741857949
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1358464588269722
"cameras/drone/drone0" SET Transform localPosition (0.6700213620411535 0.6613706725484634 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.54298315616153 1.2384254048083376 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -1 8)
"cameras/drone/drone0" SET Transform localScale (0.8744388775734907 0.8744388775734907 0.8744388775734907)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -18 3)
"cameras/drone/drone1" SET Transform localScale (1.4871541037407225 1.4871541037407225 1.4871541037407225)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.126557333803102 0)
"cameras" SET Transform eulerAngles (8.150282425093508 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.556024590655745
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.358379208343912
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3341133116804173
"cameras/drone/drone0" SET Transform localPosition (0.6600982817986081 0.2819110564540573 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1812314182953898 1.1035386782480296 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -7 12)
"cameras/drone/drone0" SET Transform localScale (1.1303739753299282 1.1303739753299282 1.1303739753299282)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -15 5)
"cameras/drone/drone1" SET Transform localScale (0.8055778831748234 0.8055778831748234 0.8055778831748234)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.523393688774537 0)
"cameras" SET Transform eulerAngles (-8.646604209570029 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0324048430388415
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1430564361134254
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37550007015633774
"cameras/drone/drone0" SET Transform localPosition (-1.0930688052768776 0.14119511020718784 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8338884425078772 1.2346533319707989 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 10 12)
"cameras/drone/drone0" SET Transform localScale (0.8556569982991062 0.8556569982991062 0.8556569982991062)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -8 -9)
"cameras/drone/drone1" SET Transform localScale (0.7040284792822791 0.7040284792822791 0.7040284792822791)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.635280879549566 0)
"cameras" SET Transform eulerAngles (-14.094474357586204 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5548885997539151
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9187430309949463
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10269903126745922
"cameras/drone/drone0" SET Transform localPosition (0.8537086978673332 0.19778107796872774 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1226014181418849 1.0271099324174955 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -2 9)
"cameras/drone/drone0" SET Transform localScale (0.641840045193347 0.641840045193347 0.641840045193347)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 10 5)
"cameras/drone/drone1" SET Transform localScale (1.3418942279235433 1.3418942279235433 1.3418942279235433)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.319391003587943 0)
"cameras" SET Transform eulerAngles (-16.21558330600875 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5716275704094937
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.726471841097333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39555487878062223
"cameras/drone/drone0" SET Transform localPosition (-0.5789817803869212 0.20647774256984525 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.835907734515031 0.815528705502409 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -8 -15)
"cameras/drone/drone0" SET Transform localScale (0.6608245868240048 0.6608245868240048 0.6608245868240048)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -12 16)
"cameras/drone/drone1" SET Transform localScale (1.2421510154271882 1.2421510154271882 1.2421510154271882)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.835201331137772 0)
"cameras" SET Transform eulerAngles (8.593477172680181 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0442672695875217
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7299123128912113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3773493514418291
"cameras/drone/drone0" SET Transform localPosition (1.1047126799035116 0.035690493043537386 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6927332274805931 0.9007620975237773 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -7 -20)
"cameras/drone/drone0" SET Transform localScale (0.7417220217783695 0.7417220217783695 0.7417220217783695)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -11 16)
"cameras/drone/drone1" SET Transform localScale (1.3290795691471398 1.3290795691471398 1.3290795691471398)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.950908977591423 0)
"cameras" SET Transform eulerAngles (-18.18273037045109 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4269317569446334
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8719422057508313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.143973587913532
"cameras/drone/drone0" SET Transform localPosition (-0.922842308658156 0.5895243777224268 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6790073156902057 0.9343200442037468 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 9 -11)
"cameras/drone/drone0" SET Transform localScale (1.2103991101109772 1.2103991101109772 1.2103991101109772)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 4 -20)
"cameras/drone/drone1" SET Transform localScale (1.0274394339437327 1.0274394339437327 1.0274394339437327)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.770338625156362 0)
"cameras" SET Transform eulerAngles (17.93379273481594 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3584893031778162
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7300116329942057
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.014064681508421684
"cameras/drone/drone0" SET Transform localPosition (-0.8919131771333293 0.333967648134686 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5569440439644039 1.0376424268375923 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 9 0)
"cameras/drone/drone0" SET Transform localScale (1.3954735377451715 1.3954735377451715 1.3954735377451715)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -18 2)
"cameras/drone/drone1" SET Transform localScale (1.1539780618658615 1.1539780618658615 1.1539780618658615)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.945689100422964 0)
"cameras" SET Transform eulerAngles (5.265524052189733 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.096594015783601
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9802264083317018
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07127867279380094
"cameras/drone/drone0" SET Transform localPosition (-0.12955648868123149 -0.17729004810987686 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1392772244066784 0.8987017185531101 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 3 -5)
"cameras/drone/drone0" SET Transform localScale (1.0381765735663508 1.0381765735663508 1.0381765735663508)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -6 18)
"cameras/drone/drone1" SET Transform localScale (0.934987723535086 0.934987723535086 0.934987723535086)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.106650362955399 0)
"cameras" SET Transform eulerAngles (-19.143158731510447 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9675857066958159
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0557086420736348
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2907133348897457
"cameras/drone/drone0" SET Transform localPosition (0.016179740156102573 0.2920616956110393 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8777000437756814 0.9401046201702488 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 16 -1)
"cameras/drone/drone0" SET Transform localScale (1.4467929762062783 1.4467929762062783 1.4467929762062783)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 8 14)
"cameras/drone/drone1" SET Transform localScale (0.8183502544645527 0.8183502544645527 0.8183502544645527)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.052362595355108 0)
"cameras" SET Transform eulerAngles (12.67824563618538 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5555181868544117
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9927180848872221
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02534847584563904
"cameras/drone/drone0" SET Transform localPosition (-0.3317590083608617 0.22323680236902915 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09781944624950945 1.130600330384094 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -2 -5)
"cameras/drone/drone0" SET Transform localScale (0.8894877760610492 0.8894877760610492 0.8894877760610492)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -10 20)
"cameras/drone/drone1" SET Transform localScale (1.468598437681337 1.468598437681337 1.468598437681337)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.70389612362963 0)
"cameras" SET Transform eulerAngles (16.378986451017575 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2868080089480158
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9436423510151961
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0804425640406516
"cameras/drone/drone0" SET Transform localPosition (0.4721173195330839 -0.2531850869920023 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7177549517227353 0.9585441654772922 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -4 -19)
"cameras/drone/drone0" SET Transform localScale (1.3717866713229534 1.3717866713229534 1.3717866713229534)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -17 20)
"cameras/drone/drone1" SET Transform localScale (0.6220615099722003 0.6220615099722003 0.6220615099722003)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7620985669623224 0)
"cameras" SET Transform eulerAngles (12.577763026322039 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1975110759662817
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0154636378289743
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03937076880620776
"cameras/drone/drone0" SET Transform localPosition (0.8639626467792942 -0.044390181272254414 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3793110556500099 1.0545421250023117 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -10 -15)
"cameras/drone/drone0" SET Transform localScale (0.6664573662785007 0.6664573662785007 0.6664573662785007)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -8 -9)
"cameras/drone/drone1" SET Transform localScale (1.1055157712782404 1.1055157712782404 1.1055157712782404)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.518001400795233 0)
"cameras" SET Transform eulerAngles (-0.7056522928208011 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5098266685311696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6756912477372583
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1512838958459687
"cameras/drone/drone0" SET Transform localPosition (0.671958684325654 0.09493151484482881 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.24697329711169647 1.186704399692737 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 4 -12)
"cameras/drone/drone0" SET Transform localScale (0.8560409032639414 0.8560409032639414 0.8560409032639414)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -20 -11)
"cameras/drone/drone1" SET Transform localScale (1.211505387304428 1.211505387304428 1.211505387304428)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.361785234197068 0)
"cameras" SET Transform eulerAngles (19.110989573220067 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5617538444657302
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1273873650687023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17279059078754538
"cameras/drone/drone0" SET Transform localPosition (0.7856086841189802 0.6684794407648258 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8981615999811754 1.1049619259393628 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -17 3)
"cameras/drone/drone0" SET Transform localScale (0.8337121403659286 0.8337121403659286 0.8337121403659286)
"cameras/drone/drone1" SET Transform localEulerAngles (20 4 4)
"cameras/drone/drone1" SET Transform localScale (1.3803726494011377 1.3803726494011377 1.3803726494011377)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.188279329157808 0)
"cameras" SET Transform eulerAngles (17.381978348776464 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6144157069758613
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7662232831767195
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20248871624633324
"cameras/drone/drone0" SET Transform localPosition (-1.1684791592979775 0.13886684190191795 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7415525027237935 0.8753886281931673 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 18 3)
"cameras/drone/drone0" SET Transform localScale (1.366888930625028 1.366888930625028 1.366888930625028)
"cameras/drone/drone1" SET Transform localEulerAngles (6 18 13)
"cameras/drone/drone1" SET Transform localScale (1.1249918547769746 1.1249918547769746 1.1249918547769746)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3535698374452325 0)
"cameras" SET Transform eulerAngles (16.040923750911993 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2723041605817238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6347751714344232
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29035656182826125
"cameras/drone/drone0" SET Transform localPosition (-0.12603608621473938 0.43568578033956756 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.896812165690146 1.2846313050297757 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -19 -9)
"cameras/drone/drone0" SET Transform localScale (0.8521190206713387 0.8521190206713387 0.8521190206713387)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -15 14)
"cameras/drone/drone1" SET Transform localScale (0.8244263325606757 0.8244263325606757 0.8244263325606757)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.570843723123596 0)
"cameras" SET Transform eulerAngles (7.590173057620504 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2279597455371536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.469135541819921
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.012586567108571069
"cameras/drone/drone0" SET Transform localPosition (-0.1171922827109051 0.17054262253494573 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5797904078394175 1.0504280553544598 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 3 -20)
"cameras/drone/drone0" SET Transform localScale (1.3238110446867792 1.3238110446867792 1.3238110446867792)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -11 6)
"cameras/drone/drone1" SET Transform localScale (1.396988918341627 1.396988918341627 1.396988918341627)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.085830130141779 0)
"cameras" SET Transform eulerAngles (10.105605738371768 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.435597456893908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3639495030678843
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2945835437633956
"cameras/drone/drone0" SET Transform localPosition (1.0728760909653887 -0.11560384511920746 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.16633965020157682 0.8367204113254186 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 16 -12)
"cameras/drone/drone0" SET Transform localScale (1.348088596552401 1.348088596552401 1.348088596552401)
"cameras/drone/drone1" SET Transform localEulerAngles (11 10 -9)
"cameras/drone/drone1" SET Transform localScale (0.8317194289675152 0.8317194289675152 0.8317194289675152)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.098900453334267 0)
"cameras" SET Transform eulerAngles (-5.48557119088759 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7722157133556857
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.336433715841551
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0998048891675075
"cameras/drone/drone0" SET Transform localPosition (0.8732587351462622 0.5163721165432111 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32933262530581087 1.213529915649007 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -9 -1)
"cameras/drone/drone0" SET Transform localScale (1.497347960486583 1.497347960486583 1.497347960486583)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -11 -12)
"cameras/drone/drone1" SET Transform localScale (0.6802089104767548 0.6802089104767548 0.6802089104767548)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0578515147406886 0)
"cameras" SET Transform eulerAngles (12.53352932767514 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2284075341804548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.642997128299712
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15438688826882585
"cameras/drone/drone0" SET Transform localPosition (-0.7450448716642528 -0.15811961002298652 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.27737981171001014 0.9612691266161366 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -4 -9)
"cameras/drone/drone0" SET Transform localScale (1.006503977343056 1.006503977343056 1.006503977343056)
"cameras/drone/drone1" SET Transform localEulerAngles (17 20 16)
"cameras/drone/drone1" SET Transform localScale (0.7827797037446559 0.7827797037446559 0.7827797037446559)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.218756198999765 0)
"cameras" SET Transform eulerAngles (16.288518183280033 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4335136308940757
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0277552654743798
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24472454490372392
"cameras/drone/drone0" SET Transform localPosition (-0.7754226789496965 -0.12366305451285747 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.90783459743487 1.1614842090056676 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 12 17)
"cameras/drone/drone0" SET Transform localScale (1.231919032918531 1.231919032918531 1.231919032918531)
"cameras/drone/drone1" SET Transform localEulerAngles (10 20 5)
"cameras/drone/drone1" SET Transform localScale (1.1975385769595979 1.1975385769595979 1.1975385769595979)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.317690352239433 0)
"cameras" SET Transform eulerAngles (7.72263882421251 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.53489721140167
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.92301369991679
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14006120114342907
"cameras/drone/drone0" SET Transform localPosition (-1.0266966304752791 0.4468201125194888 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.19322512891892263 0.811702256471486 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 9 1)
"cameras/drone/drone0" SET Transform localScale (0.9495253057275342 0.9495253057275342 0.9495253057275342)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 18 20)
"cameras/drone/drone1" SET Transform localScale (1.3476142570175302 1.3476142570175302 1.3476142570175302)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.997314254019698 0)
"cameras" SET Transform eulerAngles (3.859563803217057 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8915757205224899
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3755878457798636
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15851602903776604
"cameras/drone/drone0" SET Transform localPosition (-0.6046886299951436 0.028533693345887567 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6008493086926646 1.255021104005076 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -13 -13)
"cameras/drone/drone0" SET Transform localScale (1.3407949052865478 1.3407949052865478 1.3407949052865478)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 8 10)
"cameras/drone/drone1" SET Transform localScale (1.4024002948879697 1.4024002948879697 1.4024002948879697)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.844608310643919 0)
"cameras" SET Transform eulerAngles (-6.692889905861703 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5804312753540493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9772588306531779
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0599115113486298
"cameras/drone/drone0" SET Transform localPosition (-0.156818001071789 0.679210674294908 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.460006402423503 1.294905801665999 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -6 -4)
"cameras/drone/drone0" SET Transform localScale (1.1832523579604812 1.1832523579604812 1.1832523579604812)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -15 6)
"cameras/drone/drone1" SET Transform localScale (1.196489476549052 1.196489476549052 1.196489476549052)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2444114110963715 0)
"cameras" SET Transform eulerAngles (6.486778304679785 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.350070476584456
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.660103297556243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38400693715032386
"cameras/drone/drone0" SET Transform localPosition (0.5709593126673511 -0.2178989882084555 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6280640079437874 1.2966208335916989 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -17 11)
"cameras/drone/drone0" SET Transform localScale (0.7633028004415203 0.7633028004415203 0.7633028004415203)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 2 -20)
"cameras/drone/drone1" SET Transform localScale (1.159439404447929 1.159439404447929 1.159439404447929)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.852746744617685 0)
"cameras" SET Transform eulerAngles (2.368505304836056 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.332506354009419
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8859571426343962
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2870661314105023
"cameras/drone/drone0" SET Transform localPosition (-0.08359018343351332 0.5261136995545259 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4488454534266024 0.9730546854571315 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 18 10)
"cameras/drone/drone0" SET Transform localScale (0.7344977911127208 0.7344977911127208 0.7344977911127208)
"cameras/drone/drone1" SET Transform localEulerAngles (16 7 6)
"cameras/drone/drone1" SET Transform localScale (0.6844950207776548 0.6844950207776548 0.6844950207776548)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
