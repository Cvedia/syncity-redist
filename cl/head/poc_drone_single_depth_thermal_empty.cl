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
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1536 1152 24 "ARGBFloat" "Default"
"cameras/segmentation" SET active true
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true 
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
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink outputType "CUSTOM" outputChannels 3 outputPixelSize 4 outputExtension "png"
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 46 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 90 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/birds/container" SET active true
"spawner/animals/birds" SET active true
CREATE "spawner/cars/container"
"spawner/cars/container" SET active false
"spawner/cars/container" ADD RandomProps.Torus
"spawner/cars/container" ADD RandomProps.PropArea
"spawner/cars/container" SET RandomProps.PropArea tags "car"
"spawner/cars/container" SET RandomProps.PropArea async false numberOfProps 14 collisionCheck false stickToGround false 
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
"cameras" SET Transform eulerAngles (-7.337399471317376 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 49
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.91069705007517 0)
"cameras" SET Transform eulerAngles (18.209551509248108 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.020771556388432
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8936011921667637
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.050318597992948494
"cameras/drone/drone0" SET Transform localPosition (1.1582825660375058 0.5986696473145097 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0131984448393003 1.089597793983184 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -18 -9)
"cameras/drone/drone0" SET Transform localScale (1.1597373674705458 1.1597373674705458 1.1597373674705458)
"cameras/drone/drone1" SET Transform localEulerAngles (6 13 -11)
"cameras/drone/drone1" SET Transform localScale (0.752166393668799 0.752166393668799 0.752166393668799)
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
"cameras" SET Transform position (0 3.6976413746357792 0)
"cameras" SET Transform eulerAngles (-7.962624464063444 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4778473706737096
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1268262620125487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29200743447583255
"cameras/drone/drone0" SET Transform localPosition (-0.5900688509177338 0.3778000203217468 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0901939536133611 0.8053230059127332 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 8 4)
"cameras/drone/drone0" SET Transform localScale (0.6586266570600453 0.6586266570600453 0.6586266570600453)
"cameras/drone/drone1" SET Transform localEulerAngles (10 18 11)
"cameras/drone/drone1" SET Transform localScale (0.8055276884452459 0.8055276884452459 0.8055276884452459)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3055808591011298 0)
"cameras" SET Transform eulerAngles (-0.44936020506413854 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.482799387386176
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6255746437725025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16526587394252937
"cameras/drone/drone0" SET Transform localPosition (-0.7321788460944123 0.4865175672420083 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3966788134139836 1.061662399345174 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -14 -1)
"cameras/drone/drone0" SET Transform localScale (1.4329138091316946 1.4329138091316946 1.4329138091316946)
"cameras/drone/drone1" SET Transform localEulerAngles (4 0 -20)
"cameras/drone/drone1" SET Transform localScale (0.7008402778759879 0.7008402778759879 0.7008402778759879)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.804101013418682 0)
"cameras" SET Transform eulerAngles (4.566985267546681 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5449005454735838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2096139112892232
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17349327439471837
"cameras/drone/drone0" SET Transform localPosition (0.5319649209397106 -0.21825119310150004 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7533144365484097 1.204197369709278 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -17 3)
"cameras/drone/drone0" SET Transform localScale (0.9554764284097796 0.9554764284097796 0.9554764284097796)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 10 10)
"cameras/drone/drone1" SET Transform localScale (0.6340265454104714 0.6340265454104714 0.6340265454104714)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2077568300663986 0)
"cameras" SET Transform eulerAngles (-9.238700483972742 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6091130316051059
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.979223504613279
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22269330588840633
"cameras/drone/drone0" SET Transform localPosition (0.8445568719246241 0.6131607453503618 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7637684300353134 1.0443456258029458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 8 -19)
"cameras/drone/drone0" SET Transform localScale (0.8616877762414856 0.8616877762414856 0.8616877762414856)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 15 -14)
"cameras/drone/drone1" SET Transform localScale (0.8502273187128409 0.8502273187128409 0.8502273187128409)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1532782307799843 0)
"cameras" SET Transform eulerAngles (-0.32094259197683783 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4784063078620432
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.284640105980796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15055384148632422
"cameras/drone/drone0" SET Transform localPosition (-0.24395994042807212 0.015950904549079825 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5751478525538702 1.024879491161674 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 1 -14)
"cameras/drone/drone0" SET Transform localScale (0.6514104774795242 0.6514104774795242 0.6514104774795242)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -1 -19)
"cameras/drone/drone1" SET Transform localScale (0.8046400489604364 0.8046400489604364 0.8046400489604364)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.337855191997018 0)
"cameras" SET Transform eulerAngles (-12.194121529945733 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4274068555789702
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2617607064130536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2904747987674899
"cameras/drone/drone0" SET Transform localPosition (0.7117246326313866 0.4073406228438374 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6961749719234507 0.836096127210529 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -4 17)
"cameras/drone/drone0" SET Transform localScale (1.2567857286037216 1.2567857286037216 1.2567857286037216)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -6 -8)
"cameras/drone/drone1" SET Transform localScale (0.7736427009738076 0.7736427009738076 0.7736427009738076)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.128059340849721 0)
"cameras" SET Transform eulerAngles (-18.621030290006505 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0861106518730028
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9480419919496289
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38498454211269445
"cameras/drone/drone0" SET Transform localPosition (0.9325674742651009 0.331436448610161 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.49986305053145297 1.1425982887742039 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -6 18)
"cameras/drone/drone0" SET Transform localScale (1.3247629168172752 1.3247629168172752 1.3247629168172752)
"cameras/drone/drone1" SET Transform localEulerAngles (1 0 13)
"cameras/drone/drone1" SET Transform localScale (1.4202194025740449 1.4202194025740449 1.4202194025740449)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9190312863835297 0)
"cameras" SET Transform eulerAngles (10.2191436179023 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9691426176359779
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5171990288311794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3252336148476971
"cameras/drone/drone0" SET Transform localPosition (0.871412626166334 0.14508242379714914 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1945917407481226 1.2258673244572946 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 15 1)
"cameras/drone/drone0" SET Transform localScale (0.9070565964346644 0.9070565964346644 0.9070565964346644)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 7 -17)
"cameras/drone/drone1" SET Transform localScale (0.7129542830861457 0.7129542830861457 0.7129542830861457)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.922487775546543 0)
"cameras" SET Transform eulerAngles (8.55278951251012 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.448582092352007
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0029294918254497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14815328905869682
"cameras/drone/drone0" SET Transform localPosition (-0.09756351221810111 -0.15421574136720656 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.038335879701333 0.8769659066498057 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 1 16)
"cameras/drone/drone0" SET Transform localScale (1.483175856963313 1.483175856963313 1.483175856963313)
"cameras/drone/drone1" SET Transform localEulerAngles (16 18 12)
"cameras/drone/drone1" SET Transform localScale (0.9592537158495273 0.9592537158495273 0.9592537158495273)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.920961656552578 0)
"cameras" SET Transform eulerAngles (4.4264470203832715 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5955983343531313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5083424072418228
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2150967341410029
"cameras/drone/drone0" SET Transform localPosition (0.25046406405975574 0.5326733724840726 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.17970693089015 0.9830493141952092 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -9 -6)
"cameras/drone/drone0" SET Transform localScale (0.7142507305725002 0.7142507305725002 0.7142507305725002)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -4 6)
"cameras/drone/drone1" SET Transform localScale (0.8680404884955085 0.8680404884955085 0.8680404884955085)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.427768447054504 0)
"cameras" SET Transform eulerAngles (-4.707359073970565 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7703098950510785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9575151941963367
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.054820971912783234
"cameras/drone/drone0" SET Transform localPosition (0.8800883063048046 0.5514725859653495 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9752342756903338 0.9361643203704078 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 17 14)
"cameras/drone/drone0" SET Transform localScale (1.1070611318873027 1.1070611318873027 1.1070611318873027)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -18 -10)
"cameras/drone/drone1" SET Transform localScale (0.8729905626555055 0.8729905626555055 0.8729905626555055)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.622888785762333 0)
"cameras" SET Transform eulerAngles (7.859712378236811 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.086013830989427
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8478582936382923
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3451475386059194
"cameras/drone/drone0" SET Transform localPosition (0.2711813889427759 0.24121685685109456 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.799732910221282 1.115069640091882 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -6 -20)
"cameras/drone/drone0" SET Transform localScale (1.1886930902267938 1.1886930902267938 1.1886930902267938)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -11 -1)
"cameras/drone/drone1" SET Transform localScale (1.3677885987990894 1.3677885987990894 1.3677885987990894)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.253689164413892 0)
"cameras" SET Transform eulerAngles (-17.964787658674414 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8532074848623038
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8299033801130182
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3767794154044095
"cameras/drone/drone0" SET Transform localPosition (-1.0340788800428027 0.5183317723825449 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7557232248809669 1.1331833922752845 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 9 10)
"cameras/drone/drone0" SET Transform localScale (1.4055698036489888 1.4055698036489888 1.4055698036489888)
"cameras/drone/drone1" SET Transform localEulerAngles (0 0 17)
"cameras/drone/drone1" SET Transform localScale (1.4624235765143077 1.4624235765143077 1.4624235765143077)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2608120278186012 0)
"cameras" SET Transform eulerAngles (1.792919087236605 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1189302141605788
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2825766865382786
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37404079884233177
"cameras/drone/drone0" SET Transform localPosition (-0.8489868033488737 0.2603840008775224 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.350728567653245 1.0209588498352313 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 14 12)
"cameras/drone/drone0" SET Transform localScale (0.8170861898090782 0.8170861898090782 0.8170861898090782)
"cameras/drone/drone1" SET Transform localEulerAngles (14 6 11)
"cameras/drone/drone1" SET Transform localScale (1.4229752348893872 1.4229752348893872 1.4229752348893872)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.700467966049906 0)
"cameras" SET Transform eulerAngles (-12.497492335472495 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49171508000101866
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9237332040851469
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3519914837317049
"cameras/drone/drone0" SET Transform localPosition (0.9125998510078979 0.0757714457654119 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6910079406922649 0.8226013653760871 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -20 10)
"cameras/drone/drone0" SET Transform localScale (1.2789191708814744 1.2789191708814744 1.2789191708814744)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 14 12)
"cameras/drone/drone1" SET Transform localScale (1.209073289568179 1.209073289568179 1.209073289568179)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4818088167503154 0)
"cameras" SET Transform eulerAngles (-8.431644099517733 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9191656140770066
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9638744772682775
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3888770107211343
"cameras/drone/drone0" SET Transform localPosition (-0.37792611788567343 -0.21960031441251765 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12748090521866762 0.8981578205540264 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -9 14)
"cameras/drone/drone0" SET Transform localScale (1.1362869948313068 1.1362869948313068 1.1362869948313068)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -12 -2)
"cameras/drone/drone1" SET Transform localScale (1.2160134279301003 1.2160134279301003 1.2160134279301003)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9831827220815343 0)
"cameras" SET Transform eulerAngles (17.81907398934966 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2608625938649514
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1938056885647597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3276625900408056
"cameras/drone/drone0" SET Transform localPosition (-0.8029924773161095 0.5473690460629066 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.27081412783839975 1.0126168360451784 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 6 18)
"cameras/drone/drone0" SET Transform localScale (0.8097530574926575 0.8097530574926575 0.8097530574926575)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 7 3)
"cameras/drone/drone1" SET Transform localScale (1.4477364322402382 1.4477364322402382 1.4477364322402382)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2996514290212304 0)
"cameras" SET Transform eulerAngles (14.048585973583783 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6542735797128134
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.673423932971923
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3169107550383517
"cameras/drone/drone0" SET Transform localPosition (-0.9317326046355907 -0.09056263298780537 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8828818650944485 1.1571395571006236 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 14 18)
"cameras/drone/drone0" SET Transform localScale (1.0926633486254085 1.0926633486254085 1.0926633486254085)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -12 11)
"cameras/drone/drone1" SET Transform localScale (1.0204189233986682 1.0204189233986682 1.0204189233986682)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.525232397763174 0)
"cameras" SET Transform eulerAngles (-18.786520503035 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6963940305888441
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9779605470002375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.017901496132692298
"cameras/drone/drone0" SET Transform localPosition (0.7185881315771911 0.10763261938732166 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5064008011668086 1.1845430155666037 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 8 20)
"cameras/drone/drone0" SET Transform localScale (1.1301306919921814 1.1301306919921814 1.1301306919921814)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 6 8)
"cameras/drone/drone1" SET Transform localScale (1.4651203325644913 1.4651203325644913 1.4651203325644913)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2138911239715897 0)
"cameras" SET Transform eulerAngles (17.518089335878336 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2415461276515058
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0076121122061186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23904816908696352
"cameras/drone/drone0" SET Transform localPosition (1.0741903943535627 -0.13652205989747151 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0315860125382585 1.2068330381354144 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 11 3)
"cameras/drone/drone0" SET Transform localScale (1.3274228661395404 1.3274228661395404 1.3274228661395404)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -9 3)
"cameras/drone/drone1" SET Transform localScale (0.6382727321991777 0.6382727321991777 0.6382727321991777)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.040631904936463 0)
"cameras" SET Transform eulerAngles (-8.199667597605442 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5985082514155889
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6468995219143754
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3048798929754142
"cameras/drone/drone0" SET Transform localPosition (0.8287269735498415 0.15542333381204382 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4819620835830756 0.8197302698482325 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 13 4)
"cameras/drone/drone0" SET Transform localScale (0.6828561526015888 0.6828561526015888 0.6828561526015888)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -20 -12)
"cameras/drone/drone1" SET Transform localScale (1.031533511168145 1.031533511168145 1.031533511168145)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6355648017288615 0)
"cameras" SET Transform eulerAngles (-18.74230805597953 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5396214469813533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3961439161525684
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1469819961126826
"cameras/drone/drone0" SET Transform localPosition (0.4343630234397222 0.11650676242366714 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1857579238268408 1.1924362964703321 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 17 6)
"cameras/drone/drone0" SET Transform localScale (0.725811636104209 0.725811636104209 0.725811636104209)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -5 7)
"cameras/drone/drone1" SET Transform localScale (1.0109296898744424 1.0109296898744424 1.0109296898744424)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.933416052751483 0)
"cameras" SET Transform eulerAngles (17.301801969463924 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5867557242201481
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6923181047013856
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16665403061199446
"cameras/drone/drone0" SET Transform localPosition (0.4365647733689526 0.6214781981303739 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8218523262751214 1.0325682126110625 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -13 -18)
"cameras/drone/drone0" SET Transform localScale (1.3759011682164881 1.3759011682164881 1.3759011682164881)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -6 -14)
"cameras/drone/drone1" SET Transform localScale (1.1398614084477945 1.1398614084477945 1.1398614084477945)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.824938169259585 0)
"cameras" SET Transform eulerAngles (-4.034586905435397 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5742288975557416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5683773300963042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2601376150638974
"cameras/drone/drone0" SET Transform localPosition (-0.11200725804303846 0.35141249246736855 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1165065888204577 0.9104876001441728 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -10 7)
"cameras/drone/drone0" SET Transform localScale (0.8958204472091658 0.8958204472091658 0.8958204472091658)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -18 -7)
"cameras/drone/drone1" SET Transform localScale (1.1655711823659072 1.1655711823659072 1.1655711823659072)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.594066894164893 0)
"cameras" SET Transform eulerAngles (-2.957764936912305 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0582895034065247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9985933475697278
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11494029935853832
"cameras/drone/drone0" SET Transform localPosition (-0.9708429513242377 0.21615005758605726 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.012861958815839 1.049213282284108 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -2 -11)
"cameras/drone/drone0" SET Transform localScale (0.6330785236606015 0.6330785236606015 0.6330785236606015)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -15 -3)
"cameras/drone/drone1" SET Transform localScale (1.150500694889907 1.150500694889907 1.150500694889907)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0818815930145047 0)
"cameras" SET Transform eulerAngles (0.6663581462636472 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5917821881479095
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.857678008218528
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2905101252483062
"cameras/drone/drone0" SET Transform localPosition (-0.4103667020824142 -0.17468844683004242 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7154710413811101 1.2699736967365483 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 15 11)
"cameras/drone/drone0" SET Transform localScale (1.3840148036753392 1.3840148036753392 1.3840148036753392)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -2 15)
"cameras/drone/drone1" SET Transform localScale (1.4416188610449123 1.4416188610449123 1.4416188610449123)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.281832929978044 0)
"cameras" SET Transform eulerAngles (16.784588783688854 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3051717276778854
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9235429219533744
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20789614635340878
"cameras/drone/drone0" SET Transform localPosition (-0.7649233230725531 0.6367543911180495 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5119738994569069 1.1815006622945816 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -12 4)
"cameras/drone/drone0" SET Transform localScale (0.9172432353703273 0.9172432353703273 0.9172432353703273)
"cameras/drone/drone1" SET Transform localEulerAngles (8 5 16)
"cameras/drone/drone1" SET Transform localScale (1.118239518390625 1.118239518390625 1.118239518390625)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.29194935410599 0)
"cameras" SET Transform eulerAngles (5.1037066416818 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4305582004029356
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0550010069372888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25967932760948353
"cameras/drone/drone0" SET Transform localPosition (0.5819077491773379 0.6110583849403031 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0846369255269936 0.9409976282976875 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 8 6)
"cameras/drone/drone0" SET Transform localScale (0.685468619468166 0.685468619468166 0.685468619468166)
"cameras/drone/drone1" SET Transform localEulerAngles (18 13 17)
"cameras/drone/drone1" SET Transform localScale (0.89960441387482 0.89960441387482 0.89960441387482)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.677954344098086 0)
"cameras" SET Transform eulerAngles (-14.255538593904804 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5157164947974725
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6804384268009338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22637981254152295
"cameras/drone/drone0" SET Transform localPosition (0.41287914561145644 -0.2993606347769326 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5755157830630667 0.9151820202998936 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 11 -14)
"cameras/drone/drone0" SET Transform localScale (1.3083950943109532 1.3083950943109532 1.3083950943109532)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -6 17)
"cameras/drone/drone1" SET Transform localScale (1.3914035696816107 1.3914035696816107 1.3914035696816107)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.353792964131721 0)
"cameras" SET Transform eulerAngles (-4.704341581246286 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4404170992420103
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3676882409222189
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3373738571858699
"cameras/drone/drone0" SET Transform localPosition (-1.086284838677887 0.3678140069750046 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6036414355447189 1.0190040534096698 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -20 -11)
"cameras/drone/drone0" SET Transform localScale (1.2300511997158887 1.2300511997158887 1.2300511997158887)
"cameras/drone/drone1" SET Transform localEulerAngles (7 13 12)
"cameras/drone/drone1" SET Transform localScale (1.2278942139171336 1.2278942139171336 1.2278942139171336)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.767651320830331 0)
"cameras" SET Transform eulerAngles (16.17003615901433 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3319478449618205
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.93284232831054
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37985021286171294
"cameras/drone/drone0" SET Transform localPosition (0.702559370140301 0.49172568091833063 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.05411380439609137 0.8840957857906642 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -19 10)
"cameras/drone/drone0" SET Transform localScale (0.8032418052596891 0.8032418052596891 0.8032418052596891)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -2 -14)
"cameras/drone/drone1" SET Transform localScale (0.8683943911209228 0.8683943911209228 0.8683943911209228)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.729959998714714 0)
"cameras" SET Transform eulerAngles (-5.289866235976305 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2461560149839601
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5775475192696076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04651247978504594
"cameras/drone/drone0" SET Transform localPosition (0.5874330534638621 0.3933502861846537 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9555098865417643 0.9783554513478829 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 3 -5)
"cameras/drone/drone0" SET Transform localScale (0.6719891585616837 0.6719891585616837 0.6719891585616837)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 8 -19)
"cameras/drone/drone1" SET Transform localScale (0.8986499103664597 0.8986499103664597 0.8986499103664597)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.399063654464001 0)
"cameras" SET Transform eulerAngles (8.510354290804663 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2898953859177458
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9531472409149183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.023107717262187234
"cameras/drone/drone0" SET Transform localPosition (-1.1203375827363733 0.12125169320916024 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6017098833895769 1.0492992667785592 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 6 15)
"cameras/drone/drone0" SET Transform localScale (1.187055400850535 1.187055400850535 1.187055400850535)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 9 1)
"cameras/drone/drone1" SET Transform localScale (1.302173819025607 1.302173819025607 1.302173819025607)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8009845656324823 0)
"cameras" SET Transform eulerAngles (-16.137160422554537 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8736802573995651
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4317145057582967
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21573160325045793
"cameras/drone/drone0" SET Transform localPosition (-0.035277490558458524 -0.13136785073624785 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6554443813072377 1.0590087655471794 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -9 13)
"cameras/drone/drone0" SET Transform localScale (0.8664565967599083 0.8664565967599083 0.8664565967599083)
"cameras/drone/drone1" SET Transform localEulerAngles (8 5 0)
"cameras/drone/drone1" SET Transform localScale (1.1646903885146034 1.1646903885146034 1.1646903885146034)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1216911941577274 0)
"cameras" SET Transform eulerAngles (-19.4674427909059 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4358680341178243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9163212125282465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26587450585019207
"cameras/drone/drone0" SET Transform localPosition (-0.31680133880525096 0.1127126003127123 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9604678700497036 0.9634697926700121 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -5 9)
"cameras/drone/drone0" SET Transform localScale (0.9283306931374232 0.9283306931374232 0.9283306931374232)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -13 0)
"cameras/drone/drone1" SET Transform localScale (1.4226342136494137 1.4226342136494137 1.4226342136494137)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.978650023052571 0)
"cameras" SET Transform eulerAngles (18.77445248424617 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6279432190561041
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0488603103373895
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2601479525455779
"cameras/drone/drone0" SET Transform localPosition (-0.9976975616316403 0.44886177544517586 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4062585007124775 1.1693492179924967 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -2 -17)
"cameras/drone/drone0" SET Transform localScale (1.314990680662604 1.314990680662604 1.314990680662604)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 16 17)
"cameras/drone/drone1" SET Transform localScale (1.4966329723415126 1.4966329723415126 1.4966329723415126)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8248280922559466 0)
"cameras" SET Transform eulerAngles (-10.801823831825978 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9945656468638616
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1598175882034347
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22517247724095185
"cameras/drone/drone0" SET Transform localPosition (0.7231048904430466 0.4317593162579681 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7290802469655973 0.9770474924815845 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -4 -16)
"cameras/drone/drone0" SET Transform localScale (1.058256981908769 1.058256981908769 1.058256981908769)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 11 -13)
"cameras/drone/drone1" SET Transform localScale (1.2423373652464127 1.2423373652464127 1.2423373652464127)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.151158460616359 0)
"cameras" SET Transform eulerAngles (17.017194714469305 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3915197918783273
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4983542479223582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2861651137735348
"cameras/drone/drone0" SET Transform localPosition (-0.05134141036931683 0.08992505961654135 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1042223311110493 0.958959250423616 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 6 10)
"cameras/drone/drone0" SET Transform localScale (1.1201749644604209 1.1201749644604209 1.1201749644604209)
"cameras/drone/drone1" SET Transform localEulerAngles (9 19 18)
"cameras/drone/drone1" SET Transform localScale (0.9828231362349336 0.9828231362349336 0.9828231362349336)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.641784403729558 0)
"cameras" SET Transform eulerAngles (3.078587538673627 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3268557991629888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.912974681361896
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.002739199895933098
"cameras/drone/drone0" SET Transform localPosition (1.0665727003999186 0.540154720816481 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1406985818257769 1.1667265595428264 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 15 -6)
"cameras/drone/drone0" SET Transform localScale (1.1730622251371328 1.1730622251371328 1.1730622251371328)
"cameras/drone/drone1" SET Transform localEulerAngles (19 17 -7)
"cameras/drone/drone1" SET Transform localScale (1.4002029461155887 1.4002029461155887 1.4002029461155887)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2746827969950605 0)
"cameras" SET Transform eulerAngles (17.656406782298014 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5946166874210239
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0165361759854605
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15584491812925225
"cameras/drone/drone0" SET Transform localPosition (0.5505316920916528 -0.166087845310177 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.34976756758693694 0.9595675877909975 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -20 -13)
"cameras/drone/drone0" SET Transform localScale (1.2225041972981057 1.2225041972981057 1.2225041972981057)
"cameras/drone/drone1" SET Transform localEulerAngles (2 10 -1)
"cameras/drone/drone1" SET Transform localScale (0.8376032941428051 0.8376032941428051 0.8376032941428051)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.846103806305627 0)
"cameras" SET Transform eulerAngles (-16.553157519343028 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.49838147192698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8787634224403424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08760980964698938
"cameras/drone/drone0" SET Transform localPosition (0.18217261790389716 -0.19587843677574296 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8123228043169667 1.0782933278616853 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 1 -16)
"cameras/drone/drone0" SET Transform localScale (1.3362252015827731 1.3362252015827731 1.3362252015827731)
"cameras/drone/drone1" SET Transform localEulerAngles (13 6 -4)
"cameras/drone/drone1" SET Transform localScale (0.9448591271488203 0.9448591271488203 0.9448591271488203)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.35555534562837 0)
"cameras" SET Transform eulerAngles (12.708011745938826 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5561775744264785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6079601085700421
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2669829815596683
"cameras/drone/drone0" SET Transform localPosition (0.9390387057783662 0.2212530129355474 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4966545264023172 0.8825878256164973 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 18 18)
"cameras/drone/drone0" SET Transform localScale (0.965800579309105 0.965800579309105 0.965800579309105)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 4 -19)
"cameras/drone/drone1" SET Transform localScale (0.9106905667563054 0.9106905667563054 0.9106905667563054)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5690671426737137 0)
"cameras" SET Transform eulerAngles (-9.500351267574656 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0779363108597027
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0844227484585487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34960751427776954
"cameras/drone/drone0" SET Transform localPosition (-0.7890959275744833 0.26549740242509073 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6945214063224194 0.8566354658659738 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 9 -20)
"cameras/drone/drone0" SET Transform localScale (1.1283291493386942 1.1283291493386942 1.1283291493386942)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 1 -16)
"cameras/drone/drone1" SET Transform localScale (1.0606346699100615 1.0606346699100615 1.0606346699100615)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.522658644312567 0)
"cameras" SET Transform eulerAngles (4.405194483446579 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6088629448600285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4234108386826783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18615960051320668
"cameras/drone/drone0" SET Transform localPosition (0.4791387508873335 0.5153244196756162 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9995243875331108 1.1854128270465565 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 20 13)
"cameras/drone/drone0" SET Transform localScale (0.6279598953273213 0.6279598953273213 0.6279598953273213)
"cameras/drone/drone1" SET Transform localEulerAngles (19 13 -20)
"cameras/drone/drone1" SET Transform localScale (0.9890474294681169 0.9890474294681169 0.9890474294681169)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.732166103095297 0)
"cameras" SET Transform eulerAngles (4.248211375299562 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9884213423122681
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0559045705426693
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3332615219931249
"cameras/drone/drone0" SET Transform localPosition (0.11898579814542942 -0.023413502795040564 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28726343638431673 0.8727681484015097 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 4 -12)
"cameras/drone/drone0" SET Transform localScale (1.0923899582336103 1.0923899582336103 1.0923899582336103)
"cameras/drone/drone1" SET Transform localEulerAngles (6 17 -11)
"cameras/drone/drone1" SET Transform localScale (0.6210927756222865 0.6210927756222865 0.6210927756222865)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1589288567498146 0)
"cameras" SET Transform eulerAngles (11.51930600644689 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.929944719005791
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2982643361448662
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0024277645985520293
"cameras/drone/drone0" SET Transform localPosition (-0.6344353363420188 0.3015128638699259 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7069783813341954 1.2266754871311008 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 8 19)
"cameras/drone/drone0" SET Transform localScale (0.9097330540669092 0.9097330540669092 0.9097330540669092)
"cameras/drone/drone1" SET Transform localEulerAngles (7 13 11)
"cameras/drone/drone1" SET Transform localScale (0.917174273114219 0.917174273114219 0.917174273114219)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.123027083133734 0)
"cameras" SET Transform eulerAngles (-2.163225080626404 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6132174641435995
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1134024874693993
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2524234620043299
"cameras/drone/drone0" SET Transform localPosition (-0.14995481885346718 0.21530350511572344 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.023880391078368035 0.808780336284374 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 13 12)
"cameras/drone/drone0" SET Transform localScale (1.1119526724024977 1.1119526724024977 1.1119526724024977)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -1 -4)
"cameras/drone/drone1" SET Transform localScale (0.913018134436963 0.913018134436963 0.913018134436963)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9497916161234996 0)
"cameras" SET Transform eulerAngles (-5.055088559593447 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6309271843629211
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8054329215949472
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23077587067200667
"cameras/drone/drone0" SET Transform localPosition (-0.8493426679498244 0.41587024993598737 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7484232206584011 0.8584271342749101 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -18 0)
"cameras/drone/drone0" SET Transform localScale (1.366328293838348 1.366328293838348 1.366328293838348)
"cameras/drone/drone1" SET Transform localEulerAngles (15 2 4)
"cameras/drone/drone1" SET Transform localScale (1.3627311234613388 1.3627311234613388 1.3627311234613388)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.948248059191337 0)
"cameras" SET Transform eulerAngles (-5.927495289727943 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8424128668939506
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7553514315049525
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1937730493553177
"cameras/drone/drone0" SET Transform localPosition (0.707215691684453 0.17505852173780806 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2999734758389865 0.8719629810544458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -2 12)
"cameras/drone/drone0" SET Transform localScale (1.020126141697109 1.020126141697109 1.020126141697109)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -5 -1)
"cameras/drone/drone1" SET Transform localScale (1.275482605580411 1.275482605580411 1.275482605580411)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.568359273034117 0)
"cameras" SET Transform eulerAngles (-2.52361575417574 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4033591414985878
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.967565452575981
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37686846266893526
"cameras/drone/drone0" SET Transform localPosition (0.5682195805256867 0.5451714779249912 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0032893903596978 1.0055962924329087 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 8 -6)
"cameras/drone/drone0" SET Transform localScale (1.4858617942107406 1.4858617942107406 1.4858617942107406)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -7 -9)
"cameras/drone/drone1" SET Transform localScale (1.0837870291801295 1.0837870291801295 1.0837870291801295)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.024310255442788 0)
"cameras" SET Transform eulerAngles (17.351427842422268 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8113653596214552
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8298940464817397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25639715052268147
"cameras/drone/drone0" SET Transform localPosition (-0.14413632467150994 0.5154120454235638 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9589992625220163 0.9788090444554545 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 6 -3)
"cameras/drone/drone0" SET Transform localScale (1.1259234024769929 1.1259234024769929 1.1259234024769929)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -12 14)
"cameras/drone/drone1" SET Transform localScale (1.1624846363013548 1.1624846363013548 1.1624846363013548)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.021044033569111 0)
"cameras" SET Transform eulerAngles (-9.75549954246102 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1126031385616515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1495929351639353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19779143463046853
"cameras/drone/drone0" SET Transform localPosition (-0.4208350428620494 0.03503098292519785 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2932413200321129 1.2566862321653522 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 3 -3)
"cameras/drone/drone0" SET Transform localScale (1.4457425923186442 1.4457425923186442 1.4457425923186442)
"cameras/drone/drone1" SET Transform localEulerAngles (17 2 3)
"cameras/drone/drone1" SET Transform localScale (1.047171829063518 1.047171829063518 1.047171829063518)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8202937198343596 0)
"cameras" SET Transform eulerAngles (-7.6070491756025405 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.055475106612374
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.900220163794331
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29791728588352967
"cameras/drone/drone0" SET Transform localPosition (-0.6584861280792899 0.2869655760443897 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.00019541161590996836 0.8224049514285912 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -15 2)
"cameras/drone/drone0" SET Transform localScale (0.8963672068602144 0.8963672068602144 0.8963672068602144)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -7 15)
"cameras/drone/drone1" SET Transform localScale (1.3117288069742639 1.3117288069742639 1.3117288069742639)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9626074656191257 0)
"cameras" SET Transform eulerAngles (-19.302732238753194 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2247664117552555
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6812044301041666
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38141147288527794
"cameras/drone/drone0" SET Transform localPosition (0.6891763392659167 0.020494323231167677 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08231190236638652 1.2258548578695596 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -19 7)
"cameras/drone/drone0" SET Transform localScale (1.1738708390239085 1.1738708390239085 1.1738708390239085)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 4 -16)
"cameras/drone/drone1" SET Transform localScale (0.9995547946475705 0.9995547946475705 0.9995547946475705)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8750408880884235 0)
"cameras" SET Transform eulerAngles (6.391558067714534 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43183961943361
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0171805568057826
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08389207413470429
"cameras/drone/drone0" SET Transform localPosition (0.5240974718702549 0.30514032310480016 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.23698811138437337 1.2706121388107063 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -12 3)
"cameras/drone/drone0" SET Transform localScale (1.194663491360977 1.194663491360977 1.194663491360977)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -12 -8)
"cameras/drone/drone1" SET Transform localScale (0.6657821923826102 0.6657821923826102 0.6657821923826102)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4953733282629385 0)
"cameras" SET Transform eulerAngles (1.474667827274132 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9907625937070828
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3602999882209568
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30939253940918027
"cameras/drone/drone0" SET Transform localPosition (-1.0508426170626473 -0.15544611485090648 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.19391909724243428 0.8492456383036836 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 2 -17)
"cameras/drone/drone0" SET Transform localScale (0.6769378164547755 0.6769378164547755 0.6769378164547755)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -8 -18)
"cameras/drone/drone1" SET Transform localScale (0.9142725557060314 0.9142725557060314 0.9142725557060314)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.695782597548921 0)
"cameras" SET Transform eulerAngles (-0.5315611082780514 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4953940362605023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8821309318405417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14570812488310944
"cameras/drone/drone0" SET Transform localPosition (-0.8858357400477538 0.10788545249559073 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.02015264614220036 1.0129389532110986 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 20 -3)
"cameras/drone/drone0" SET Transform localScale (0.8197945231881344 0.8197945231881344 0.8197945231881344)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -12 20)
"cameras/drone/drone1" SET Transform localScale (0.8617204710674813 0.8617204710674813 0.8617204710674813)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1372434697636695 0)
"cameras" SET Transform eulerAngles (8.40485128906499 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5312414392617621
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9158918485382093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.042396651136597054
"cameras/drone/drone0" SET Transform localPosition (-1.0130160275144975 0.3495156436140084 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1404820500747446 1.0070833962767962 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 8 18)
"cameras/drone/drone0" SET Transform localScale (1.0072674322815622 1.0072674322815622 1.0072674322815622)
"cameras/drone/drone1" SET Transform localEulerAngles (15 10 7)
"cameras/drone/drone1" SET Transform localScale (0.6689425955017833 0.6689425955017833 0.6689425955017833)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.084879742948796 0)
"cameras" SET Transform eulerAngles (-2.437056814355522 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5124271076087843
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9596613384994241
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3593115497037363
"cameras/drone/drone0" SET Transform localPosition (0.933787339434877 0.08830826068015879 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1462933353161366 0.9139932837746249 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -2 -8)
"cameras/drone/drone0" SET Transform localScale (0.864642883133095 0.864642883133095 0.864642883133095)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 20 18)
"cameras/drone/drone1" SET Transform localScale (1.1490656676239583 1.1490656676239583 1.1490656676239583)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.117754197690326 0)
"cameras" SET Transform eulerAngles (15.597696778888299 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5079781619762223
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0432835682323913
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11224189033926826
"cameras/drone/drone0" SET Transform localPosition (1.1261598457878 0.37827987800062707 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0002782377271038 0.8349567789735889 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 18 -1)
"cameras/drone/drone0" SET Transform localScale (1.0105111862096863 1.0105111862096863 1.0105111862096863)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -15 19)
"cameras/drone/drone1" SET Transform localScale (0.9335992900892609 0.9335992900892609 0.9335992900892609)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5671213002257955 0)
"cameras" SET Transform eulerAngles (0.31729049815767496 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.543036549067235
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6597771756673092
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28204698718978743
"cameras/drone/drone0" SET Transform localPosition (-0.21760185325229986 -0.05196330763926099 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.26873776348889344 1.2074545666651286 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -2 -2)
"cameras/drone/drone0" SET Transform localScale (1.2464501775931658 1.2464501775931658 1.2464501775931658)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -17 19)
"cameras/drone/drone1" SET Transform localScale (1.2622983711824163 1.2622983711824163 1.2622983711824163)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.169584217041992 0)
"cameras" SET Transform eulerAngles (0.8776354012393348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0145547376110469
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9934321096640872
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3168873752409296
"cameras/drone/drone0" SET Transform localPosition (0.8242921787646702 -0.0012905937430839898 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24546627816947408 1.106710047828844 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -4 12)
"cameras/drone/drone0" SET Transform localScale (0.8748834030590827 0.8748834030590827 0.8748834030590827)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -12 9)
"cameras/drone/drone1" SET Transform localScale (1.2536903839080817 1.2536903839080817 1.2536903839080817)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.287963103863037 0)
"cameras" SET Transform eulerAngles (11.180687232635371 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8138028915314901
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0466975350672039
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3547240561930407
"cameras/drone/drone0" SET Transform localPosition (-0.30050253626939805 0.4562101279051964 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.34220002668751537 0.9099808928787819 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 10 0)
"cameras/drone/drone0" SET Transform localScale (0.6446242298425033 0.6446242298425033 0.6446242298425033)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 18 -7)
"cameras/drone/drone1" SET Transform localScale (1.1449701415032467 1.1449701415032467 1.1449701415032467)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.876194594020788 0)
"cameras" SET Transform eulerAngles (7.871723684164614 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.632034364276913
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0190315017545915
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12016408988529835
"cameras/drone/drone0" SET Transform localPosition (0.756599154265067 -0.25802557316031144 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2857530659721488 0.8547295708693328 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 20 14)
"cameras/drone/drone0" SET Transform localScale (1.400148823695213 1.400148823695213 1.400148823695213)
"cameras/drone/drone1" SET Transform localEulerAngles (1 15 -5)
"cameras/drone/drone1" SET Transform localScale (1.2560549309944344 1.2560549309944344 1.2560549309944344)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4010377671580665 0)
"cameras" SET Transform eulerAngles (9.048245131847523 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3565177420976302
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.845621780637361
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.022389962110373897
"cameras/drone/drone0" SET Transform localPosition (-0.5257664744886011 0.35898755680466216 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1424541090183247 1.0279264446416057 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -11 16)
"cameras/drone/drone0" SET Transform localScale (1.0589335305740415 1.0589335305740415 1.0589335305740415)
"cameras/drone/drone1" SET Transform localEulerAngles (8 2 -3)
"cameras/drone/drone1" SET Transform localScale (0.7748618435879111 0.7748618435879111 0.7748618435879111)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0294250326927328 0)
"cameras" SET Transform eulerAngles (-10.29253454533556 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4809008346566395
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1797221417002595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1071472806918623
"cameras/drone/drone0" SET Transform localPosition (-0.0536075196731991 0.6914059942379431 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04546237849475898 1.019059605222864 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -16 17)
"cameras/drone/drone0" SET Transform localScale (0.9134841142875636 0.9134841142875636 0.9134841142875636)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 18 6)
"cameras/drone/drone1" SET Transform localScale (0.9763813702042146 0.9763813702042146 0.9763813702042146)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.736327083850399 0)
"cameras" SET Transform eulerAngles (-11.341262564693078 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.195326719785934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.336657704350117
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2885855097831942
"cameras/drone/drone0" SET Transform localPosition (0.6320190292811385 0.6681139083063041 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4168946016251984 0.8528482356486502 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -9 3)
"cameras/drone/drone0" SET Transform localScale (1.236724784456002 1.236724784456002 1.236724784456002)
"cameras/drone/drone1" SET Transform localEulerAngles (8 8 -13)
"cameras/drone/drone1" SET Transform localScale (1.1644703646171894 1.1644703646171894 1.1644703646171894)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.352851360501657 0)
"cameras" SET Transform eulerAngles (4.782773958591587 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3165296045381432
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9911294985561212
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07871859865279394
"cameras/drone/drone0" SET Transform localPosition (0.49353353934634514 0.23919734233601092 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1803697239843278 0.8959699177188171 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 0 -16)
"cameras/drone/drone0" SET Transform localScale (0.6209036176741757 0.6209036176741757 0.6209036176741757)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -9 -6)
"cameras/drone/drone1" SET Transform localScale (1.2105353062697226 1.2105353062697226 1.2105353062697226)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0458153241193155 0)
"cameras" SET Transform eulerAngles (-7.719778422723667 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.298518305628582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3173890765430578
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39475736260156724
"cameras/drone/drone0" SET Transform localPosition (0.23908764450780606 -0.16346739700387464 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7949029332314579 1.0028793118314583 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -1 -15)
"cameras/drone/drone0" SET Transform localScale (0.8263943106340153 0.8263943106340153 0.8263943106340153)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 5 19)
"cameras/drone/drone1" SET Transform localScale (0.8025189733904167 0.8025189733904167 0.8025189733904167)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6130807912187817 0)
"cameras" SET Transform eulerAngles (9.60934102575812 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9388769815360025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6398841760128837
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21367985328312084
"cameras/drone/drone0" SET Transform localPosition (0.3111928769990404 0.2434265182748379 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6107303943446427 1.1318474182171145 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 10 2)
"cameras/drone/drone0" SET Transform localScale (0.7268234078047886 0.7268234078047886 0.7268234078047886)
"cameras/drone/drone1" SET Transform localEulerAngles (14 20 -5)
"cameras/drone/drone1" SET Transform localScale (1.3728652075960337 1.3728652075960337 1.3728652075960337)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.71852133624765 0)
"cameras" SET Transform eulerAngles (-18.462564856406097 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6836374703210661
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3573242154031515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03553627835410076
"cameras/drone/drone0" SET Transform localPosition (-1.1551509850719952 0.650088007301989 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0296818882591292 1.2001321005247814 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 5 -11)
"cameras/drone/drone0" SET Transform localScale (1.2130676779296548 1.2130676779296548 1.2130676779296548)
"cameras/drone/drone1" SET Transform localEulerAngles (10 6 -10)
"cameras/drone/drone1" SET Transform localScale (1.0804719202615987 1.0804719202615987 1.0804719202615987)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.302173185489904 0)
"cameras" SET Transform eulerAngles (-9.267588120829382 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7003486105056468
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8061540597813792
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24410883990565005
"cameras/drone/drone0" SET Transform localPosition (-0.1244571873350635 0.5615029718335969 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.277991119969649 0.9688316114510087 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -6 -10)
"cameras/drone/drone0" SET Transform localScale (0.6416287485331169 0.6416287485331169 0.6416287485331169)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -10 15)
"cameras/drone/drone1" SET Transform localScale (1.465127786638901 1.465127786638901 1.465127786638901)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.117034567726723 0)
"cameras" SET Transform eulerAngles (19.447451273388616 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7169349301580354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.457058525610535
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3630260312669784
"cameras/drone/drone0" SET Transform localPosition (-0.9343134000881312 0.39587149762795165 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.45868940147767057 0.9862013774763089 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -18 18)
"cameras/drone/drone0" SET Transform localScale (1.1428322542891767 1.1428322542891767 1.1428322542891767)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -14 -1)
"cameras/drone/drone1" SET Transform localScale (1.4413066432749302 1.4413066432749302 1.4413066432749302)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1065228906073443 0)
"cameras" SET Transform eulerAngles (13.70130770827128 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1476073524262151
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9187458481148374
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3145398854441757
"cameras/drone/drone0" SET Transform localPosition (-0.8605330047026322 -0.07170021091492634 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2949016244677014 1.2338902351847638 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -14 13)
"cameras/drone/drone0" SET Transform localScale (1.1951572938874522 1.1951572938874522 1.1951572938874522)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 20 7)
"cameras/drone/drone1" SET Transform localScale (0.917678132907197 0.917678132907197 0.917678132907197)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.645162244077096 0)
"cameras" SET Transform eulerAngles (9.675328156783138 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5143544137093115
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8581118435460655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05427771225901817
"cameras/drone/drone0" SET Transform localPosition (-0.442564558537924 -0.22989049503242615 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0803401071604004 0.8998343057504036 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 1 18)
"cameras/drone/drone0" SET Transform localScale (1.254751017182239 1.254751017182239 1.254751017182239)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -15 -15)
"cameras/drone/drone1" SET Transform localScale (0.7240365769251835 0.7240365769251835 0.7240365769251835)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.040620087843218 0)
"cameras" SET Transform eulerAngles (13.742783163866505 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6200908351975403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2111219263546822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13679932472386716
"cameras/drone/drone0" SET Transform localPosition (0.8633571797445414 0.5546778187013444 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9175242569056692 1.2391278356011624 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -16 -9)
"cameras/drone/drone0" SET Transform localScale (0.7853420887072274 0.7853420887072274 0.7853420887072274)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -14 -13)
"cameras/drone/drone1" SET Transform localScale (1.350308425224632 1.350308425224632 1.350308425224632)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.185917909683641 0)
"cameras" SET Transform eulerAngles (8.203838416748688 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8786307141390446
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9520065885524742
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0365493353319136
"cameras/drone/drone0" SET Transform localPosition (-0.46897356672135837 -0.23557406418410348 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7270898935358904 1.230171492755363 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -16 -7)
"cameras/drone/drone0" SET Transform localScale (1.1646539025291474 1.1646539025291474 1.1646539025291474)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -1 -18)
"cameras/drone/drone1" SET Transform localScale (1.4278253330983652 1.4278253330983652 1.4278253330983652)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.942889164018582 0)
"cameras" SET Transform eulerAngles (-1.5098178189868605 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0844506085243988
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5860252226113385
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10550234167461664
"cameras/drone/drone0" SET Transform localPosition (1.1743219030027159 -0.13160092063332757 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40580101189468465 1.0212880705865546 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 18 -19)
"cameras/drone/drone0" SET Transform localScale (1.3405611887060267 1.3405611887060267 1.3405611887060267)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -19 -16)
"cameras/drone/drone1" SET Transform localScale (0.6094610123708691 0.6094610123708691 0.6094610123708691)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.940182058584549 0)
"cameras" SET Transform eulerAngles (-9.16968574297508 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4263131650829508
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9389364487669458
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08942250325320869
"cameras/drone/drone0" SET Transform localPosition (0.358054999937667 -0.10749194054595773 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9514882356851111 0.9574185630538582 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 16 -7)
"cameras/drone/drone0" SET Transform localScale (1.4801864340438677 1.4801864340438677 1.4801864340438677)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -6 6)
"cameras/drone/drone1" SET Transform localScale (0.6261006378996884 0.6261006378996884 0.6261006378996884)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.728662150360866 0)
"cameras" SET Transform eulerAngles (12.189077109621664 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2664926933977314
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1692088898959216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2629865640755271
"cameras/drone/drone0" SET Transform localPosition (-1.1264008832633203 -0.17481938470740338 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.30212099616957167 1.079604648488919 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 5 -7)
"cameras/drone/drone0" SET Transform localScale (1.064042676135573 1.064042676135573 1.064042676135573)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -16 19)
"cameras/drone/drone1" SET Transform localScale (1.1050259333255554 1.1050259333255554 1.1050259333255554)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.908180042210975 0)
"cameras" SET Transform eulerAngles (8.961768884310981 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5223800691066174
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2118777898680853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23458540823080054
"cameras/drone/drone0" SET Transform localPosition (0.4463409530882241 0.026054690746635523 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7484034077437574 0.9406719606176405 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 1 -1)
"cameras/drone/drone0" SET Transform localScale (0.6202294433476573 0.6202294433476573 0.6202294433476573)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 18 -10)
"cameras/drone/drone1" SET Transform localScale (0.7294377813458777 0.7294377813458777 0.7294377813458777)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.010487023998657 0)
"cameras" SET Transform eulerAngles (-7.5481919778656845 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5694344577209027
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4295914143120796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3645115355951652
"cameras/drone/drone0" SET Transform localPosition (-0.33322909471662077 0.09989523951688511 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.672041313801312 0.8311428749705922 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 14 19)
"cameras/drone/drone0" SET Transform localScale (0.9170213216008616 0.9170213216008616 0.9170213216008616)
"cameras/drone/drone1" SET Transform localEulerAngles (7 20 20)
"cameras/drone/drone1" SET Transform localScale (0.6893241524465497 0.6893241524465497 0.6893241524465497)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.947429437946168 0)
"cameras" SET Transform eulerAngles (2.190598875112208 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9289107493802433
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4970753374979746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.303810313826389
"cameras/drone/drone0" SET Transform localPosition (0.48014588574289263 0.4394286577422026 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.34464535798897167 1.0466487631436014 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -9 -6)
"cameras/drone/drone0" SET Transform localScale (0.9096518071924099 0.9096518071924099 0.9096518071924099)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 3 19)
"cameras/drone/drone1" SET Transform localScale (1.3135196414532355 1.3135196414532355 1.3135196414532355)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.906880373478502 0)
"cameras" SET Transform eulerAngles (5.068900419318073 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7921424248834232
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9083029960848616
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17532397408475028
"cameras/drone/drone0" SET Transform localPosition (0.40530823409136607 0.6275884235595421 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.19229058559065404 0.9404287520937014 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -15 4)
"cameras/drone/drone0" SET Transform localScale (0.9762033899618583 0.9762033899618583 0.9762033899618583)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -9 10)
"cameras/drone/drone1" SET Transform localScale (0.7722659542522373 0.7722659542522373 0.7722659542522373)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8759397265379905 0)
"cameras" SET Transform eulerAngles (10.333854853797817 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1435154023920158
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9007129460345475
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11911569429632914
"cameras/drone/drone0" SET Transform localPosition (-0.5887496885412067 -0.12518669348941208 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0211857709297492 0.8098270266474944 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 13 -4)
"cameras/drone/drone0" SET Transform localScale (0.6684853244517809 0.6684853244517809 0.6684853244517809)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 14 -7)
"cameras/drone/drone1" SET Transform localScale (1.4527953974856311 1.4527953974856311 1.4527953974856311)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.52724172847833 0)
"cameras" SET Transform eulerAngles (-2.0573732548422825 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.345858561703709
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.15148311754672
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23099100239859008
"cameras/drone/drone0" SET Transform localPosition (0.8065508188119235 0.4991351155734693 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0758612270084593 0.9966718138148665 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -4 16)
"cameras/drone/drone0" SET Transform localScale (1.463768569825233 1.463768569825233 1.463768569825233)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -16 -16)
"cameras/drone/drone1" SET Transform localScale (0.6692639057577333 0.6692639057577333 0.6692639057577333)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3608743774111876 0)
"cameras" SET Transform eulerAngles (6.006959415297175 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0690799948406453
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0494549837095501
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1517042587609473
"cameras/drone/drone0" SET Transform localPosition (1.140446483406292 -0.03332210410468056 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3080916878154023 0.9423372441855331 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 18 10)
"cameras/drone/drone0" SET Transform localScale (1.2382654133795392 1.2382654133795392 1.2382654133795392)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -12 19)
"cameras/drone/drone1" SET Transform localScale (0.9506595937858122 0.9506595937858122 0.9506595937858122)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.564420790708425 0)
"cameras" SET Transform eulerAngles (18.336277680971378 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0125684296911994
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4999463394771189
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13208609430930762
"cameras/drone/drone0" SET Transform localPosition (1.021378207329761 -0.2422533528697543 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4755942154059043 0.8782963324292234 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 10 -9)
"cameras/drone/drone0" SET Transform localScale (1.4822400241783225 1.4822400241783225 1.4822400241783225)
"cameras/drone/drone1" SET Transform localEulerAngles (5 12 -4)
"cameras/drone/drone1" SET Transform localScale (1.392071793014931 1.392071793014931 1.392071793014931)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.366156181056283 0)
"cameras" SET Transform eulerAngles (-6.2483082921855 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9103620721835527
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0423569549085427
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14718712798027364
"cameras/drone/drone0" SET Transform localPosition (-0.7323603988239371 0.4410662618342743 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4351965554222873 1.2730703780566934 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -14 -2)
"cameras/drone/drone0" SET Transform localScale (1.1744590822960723 1.1744590822960723 1.1744590822960723)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 5 -20)
"cameras/drone/drone1" SET Transform localScale (0.7294018300173881 0.7294018300173881 0.7294018300173881)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.587899019199028 0)
"cameras" SET Transform eulerAngles (10.056175159800475 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0194476372690215
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8652117789995792
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3163418617539813
"cameras/drone/drone0" SET Transform localPosition (1.164949693057123 -0.14545589335861625 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7234527888548125 1.0182706719334103 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 15 19)
"cameras/drone/drone0" SET Transform localScale (0.9909873077941931 0.9909873077941931 0.9909873077941931)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -7 -7)
"cameras/drone/drone1" SET Transform localScale (1.4231508175799323 1.4231508175799323 1.4231508175799323)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.990708535873967 0)
"cameras" SET Transform eulerAngles (-3.4328656761341314 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9826386259103602
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5374886278083455
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.049170166952024946
"cameras/drone/drone0" SET Transform localPosition (-0.5271614883356979 0.31390669561493584 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.019861947118628098 1.0509754841267467 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 7 13)
"cameras/drone/drone0" SET Transform localScale (1.0275225681177795 1.0275225681177795 1.0275225681177795)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -16 8)
"cameras/drone/drone1" SET Transform localScale (0.6211010697129729 0.6211010697129729 0.6211010697129729)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.873779710910027 0)
"cameras" SET Transform eulerAngles (6.1637327011417185 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6040592063404779
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8066496332587438
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06716933153372794
"cameras/drone/drone0" SET Transform localPosition (-0.9045237464737153 0.5626556193838421 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.071150629700927 0.8643092178137506 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -14 1)
"cameras/drone/drone0" SET Transform localScale (0.8162494810323738 0.8162494810323738 0.8162494810323738)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 10 -16)
"cameras/drone/drone1" SET Transform localScale (0.9353234361666365 0.9353234361666365 0.9353234361666365)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.778590171355494 0)
"cameras" SET Transform eulerAngles (-19.517948821182802 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45920859628236743
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1168960540230315
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1874543092698117
"cameras/drone/drone0" SET Transform localPosition (0.7799859758397398 -0.15306092576081481 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.019068886635014604 0.9132648110699724 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -14 -6)
"cameras/drone/drone0" SET Transform localScale (0.6165495416196313 0.6165495416196313 0.6165495416196313)
"cameras/drone/drone1" SET Transform localEulerAngles (15 19 11)
"cameras/drone/drone1" SET Transform localScale (0.8253030942503136 0.8253030942503136 0.8253030942503136)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.905869166486619 0)
"cameras" SET Transform eulerAngles (-0.677653602364483 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7131808491473779
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9563261187242982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03477904945153476
"cameras/drone/drone0" SET Transform localPosition (-0.08370096959897433 -0.2925824881015277 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8921564314148414 1.1118933264617232 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 9 -18)
"cameras/drone/drone0" SET Transform localScale (1.1347867954461872 1.1347867954461872 1.1347867954461872)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 11 0)
"cameras/drone/drone1" SET Transform localScale (1.07660376858095 1.07660376858095 1.07660376858095)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8236036642708737 0)
"cameras" SET Transform eulerAngles (2.218983916820143 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.887448184282318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3360761302114286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07203600046813655
"cameras/drone/drone0" SET Transform localPosition (0.7389983276959071 -0.07367717111227606 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.263812232172451 1.2820527792586434 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 5 -6)
"cameras/drone/drone0" SET Transform localScale (1.3831133898791483 1.3831133898791483 1.3831133898791483)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -1 -14)
"cameras/drone/drone1" SET Transform localScale (1.2055771520306515 1.2055771520306515 1.2055771520306515)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.838181878123505 0)
"cameras" SET Transform eulerAngles (0.2722302221920039 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.890873487246314
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0006928691018333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24657277304198522
"cameras/drone/drone0" SET Transform localPosition (0.08324450193376398 -0.08333560218975061 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6369731967550412 1.117484124933953 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -17 11)
"cameras/drone/drone0" SET Transform localScale (1.4338069698260574 1.4338069698260574 1.4338069698260574)
"cameras/drone/drone1" SET Transform localEulerAngles (9 15 -9)
"cameras/drone/drone1" SET Transform localScale (0.8478722858008128 0.8478722858008128 0.8478722858008128)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.272568737944471 0)
"cameras" SET Transform eulerAngles (6.132758557142029 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7446742943000348
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3020501476580448
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32149741253652525
"cameras/drone/drone0" SET Transform localPosition (-0.8370292907132567 0.3896343716247161 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.22022337960053529 1.137586054914082 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -20 13)
"cameras/drone/drone0" SET Transform localScale (1.2215449632236002 1.2215449632236002 1.2215449632236002)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 18 -12)
"cameras/drone/drone1" SET Transform localScale (1.470262880036993 1.470262880036993 1.470262880036993)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.09808558004939 0)
"cameras" SET Transform eulerAngles (-10.928773438087012 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5017133207957105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0645080715841702
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3021153325141068
"cameras/drone/drone0" SET Transform localPosition (0.5872343782750673 0.02327184264985277 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09682596858557879 0.8823546739006983 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -15 -8)
"cameras/drone/drone0" SET Transform localScale (0.7644043859299771 0.7644043859299771 0.7644043859299771)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -20 -17)
"cameras/drone/drone1" SET Transform localScale (0.6492864813275931 0.6492864813275931 0.6492864813275931)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3612811564837335 0)
"cameras" SET Transform eulerAngles (-11.027486843845757 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8214085400913754
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3538212020165594
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16256021560456096
"cameras/drone/drone0" SET Transform localPosition (0.231445426034818 -0.25123926441191474 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8928296919043415 0.9942299423702722 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 13 14)
"cameras/drone/drone0" SET Transform localScale (0.621805069426506 0.621805069426506 0.621805069426506)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -15 -7)
"cameras/drone/drone1" SET Transform localScale (1.259418526469926 1.259418526469926 1.259418526469926)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 94
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.000533806060872 0)
"cameras" SET Transform eulerAngles (-9.752782870902625 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5286396872859966
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4623601597069977
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.048009428172257354
"cameras/drone/drone0" SET Transform localPosition (1.1723221456736448 0.007684863809879927 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.38023766582207386 0.9705571429955013 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 10 9)
"cameras/drone/drone0" SET Transform localScale (0.6491456485071136 0.6491456485071136 0.6491456485071136)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 18 19)
"cameras/drone/drone1" SET Transform localScale (1.077880580572152 1.077880580572152 1.077880580572152)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.614045316497762 0)
"cameras" SET Transform eulerAngles (10.370967335302108 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0810996003503264
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3356587348665077
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.011476602755335685
"cameras/drone/drone0" SET Transform localPosition (-0.9990663165347429 -0.04267686001340382 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9279131708015977 0.9199522092356458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -6 -19)
"cameras/drone/drone0" SET Transform localScale (1.3745946595880643 1.3745946595880643 1.3745946595880643)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 10 -19)
"cameras/drone/drone1" SET Transform localScale (1.435871276280264 1.435871276280264 1.435871276280264)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8747664329487783 0)
"cameras" SET Transform eulerAngles (-0.6858580557736538 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1667619563536324
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7091505149725066
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39977068013545347
"cameras/drone/drone0" SET Transform localPosition (-0.7045473535199258 0.07555417493626954 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8202532908093285 1.2966932582997095 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 9 14)
"cameras/drone/drone0" SET Transform localScale (1.0615674214563269 1.0615674214563269 1.0615674214563269)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -1 5)
"cameras/drone/drone1" SET Transform localScale (0.9417305171909842 0.9417305171909842 0.9417305171909842)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9302672232500573 0)
"cameras" SET Transform eulerAngles (12.938630848891506 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4817114896973558
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3216591185379523
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21895060897194285
"cameras/drone/drone0" SET Transform localPosition (-0.5332237518827592 0.4378384335487127 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5554092931384789 0.8754024693604023 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -18 14)
"cameras/drone/drone0" SET Transform localScale (1.4052256029887913 1.4052256029887913 1.4052256029887913)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -10 -12)
"cameras/drone/drone1" SET Transform localScale (0.6918812509349196 0.6918812509349196 0.6918812509349196)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7989144581624354 0)
"cameras" SET Transform eulerAngles (-2.199337484388238 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2218703157725495
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3391770892901098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39910059561815703
"cameras/drone/drone0" SET Transform localPosition (-1.0876042020966126 0.1254345926028257 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07833920139297401 0.9419633483532036 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -2 7)
"cameras/drone/drone0" SET Transform localScale (1.3366419274561805 1.3366419274561805 1.3366419274561805)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -18 -8)
"cameras/drone/drone1" SET Transform localScale (1.4130973654625587 1.4130973654625587 1.4130973654625587)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3941363536663465 0)
"cameras" SET Transform eulerAngles (-3.3382707122537667 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7829601381228033
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2514128330491403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2215835531039385
"cameras/drone/drone0" SET Transform localPosition (0.7236010362445267 0.5447856916358453 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.43927812283915224 1.0910524086460627 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 20 -4)
"cameras/drone/drone0" SET Transform localScale (0.9806773748761104 0.9806773748761104 0.9806773748761104)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -8 -8)
"cameras/drone/drone1" SET Transform localScale (0.727077576711416 0.727077576711416 0.727077576711416)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.389617277028518 0)
"cameras" SET Transform eulerAngles (-1.6283914924982277 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3245493810979183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0680475623683487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13658442322104364
"cameras/drone/drone0" SET Transform localPosition (0.9646034967160795 -0.04012652686464252 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4748501065076054 1.1577965495833782 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -20 -13)
"cameras/drone/drone0" SET Transform localScale (0.9674641027509772 0.9674641027509772 0.9674641027509772)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -10 14)
"cameras/drone/drone1" SET Transform localScale (1.2016928954108486 1.2016928954108486 1.2016928954108486)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.344854375451008 0)
"cameras" SET Transform eulerAngles (-18.52143389923375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4073706782578017
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9700712863996408
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1585500067118546
"cameras/drone/drone0" SET Transform localPosition (0.6422843041354447 0.5331625428074909 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9182149587296815 1.2765376318945516 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -9 -4)
"cameras/drone/drone0" SET Transform localScale (0.7916903904179159 0.7916903904179159 0.7916903904179159)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -7 -12)
"cameras/drone/drone1" SET Transform localScale (1.3131707847319407 1.3131707847319407 1.3131707847319407)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.718324200730845 0)
"cameras" SET Transform eulerAngles (-5.047118037584122 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6869730561948129
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5987161987724519
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19278675396235673
"cameras/drone/drone0" SET Transform localPosition (-0.004852866763856989 -0.18547594374259463 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0445552522260535 1.121339887929375 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -8 11)
"cameras/drone/drone0" SET Transform localScale (1.0377930824751742 1.0377930824751742 1.0377930824751742)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -14 -6)
"cameras/drone/drone1" SET Transform localScale (1.1901319972296458 1.1901319972296458 1.1901319972296458)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0089451654151365 0)
"cameras" SET Transform eulerAngles (11.188573090404574 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9646944217708328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4968039370807213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07306709528578854
"cameras/drone/drone0" SET Transform localPosition (-0.7216015477530904 0.15883843054803876 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.25300670042972295 0.8965810390524849 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 3 -16)
"cameras/drone/drone0" SET Transform localScale (0.9693369271169597 0.9693369271169597 0.9693369271169597)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 6 -6)
"cameras/drone/drone1" SET Transform localScale (1.2860241733931004 1.2860241733931004 1.2860241733931004)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.083066033455134 0)
"cameras" SET Transform eulerAngles (18.44489493069981 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.12756874312208
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2094750453155185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01101091030680439
"cameras/drone/drone0" SET Transform localPosition (-0.29981614286870684 0.3736285971019175 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.826885286844764 0.9320291450922267 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 17 15)
"cameras/drone/drone0" SET Transform localScale (0.8823627156242257 0.8823627156242257 0.8823627156242257)
"cameras/drone/drone1" SET Transform localEulerAngles (14 16 -19)
"cameras/drone/drone1" SET Transform localScale (1.2326038836797988 1.2326038836797988 1.2326038836797988)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.262054872847414 0)
"cameras" SET Transform eulerAngles (-4.913290288335332 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4255332900848856
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.66967125810203
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30345169256530496
"cameras/drone/drone0" SET Transform localPosition (-0.30461046455168994 0.5765610107424044 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5020855380572489 0.9611629283338461 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 14 6)
"cameras/drone/drone0" SET Transform localScale (0.7141824718645038 0.7141824718645038 0.7141824718645038)
"cameras/drone/drone1" SET Transform localEulerAngles (10 3 -1)
"cameras/drone/drone1" SET Transform localScale (0.6966347971317755 0.6966347971317755 0.6966347971317755)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9246547641683858 0)
"cameras" SET Transform eulerAngles (6.9243543976992505 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.847440250730978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9542594716973796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18769841451399052
"cameras/drone/drone0" SET Transform localPosition (-0.6161286149804123 0.1909158293419792 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0168474291980336 0.9984253425228093 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -3 15)
"cameras/drone/drone0" SET Transform localScale (1.45181755335509 1.45181755335509 1.45181755335509)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 20 -8)
"cameras/drone/drone1" SET Transform localScale (1.4322229804766242 1.4322229804766242 1.4322229804766242)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9063478652250523 0)
"cameras" SET Transform eulerAngles (17.094595508016305 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7124807420119508
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.727933526078236
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29720253026092985
"cameras/drone/drone0" SET Transform localPosition (-0.24969590433945632 0.6441956051089581 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8368423229132034 1.1832889291363924 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -15 -7)
"cameras/drone/drone0" SET Transform localScale (0.8358618198818613 0.8358618198818613 0.8358618198818613)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -19 -1)
"cameras/drone/drone1" SET Transform localScale (0.7592074624686824 0.7592074624686824 0.7592074624686824)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6441421696890584 0)
"cameras" SET Transform eulerAngles (-12.838619054950602 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3821163527403688
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3652921673487757
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3139547668687883
"cameras/drone/drone0" SET Transform localPosition (0.6259167431601846 0.3622970254427836 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5832209323001921 0.8420474538644946 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 20 17)
"cameras/drone/drone0" SET Transform localScale (0.614689676873651 0.614689676873651 0.614689676873651)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 19 5)
"cameras/drone/drone1" SET Transform localScale (0.8278762329270143 0.8278762329270143 0.8278762329270143)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.509184544972608 0)
"cameras" SET Transform eulerAngles (12.289614291214235 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3964108620008417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8429190572682672
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3152084329328877
"cameras/drone/drone0" SET Transform localPosition (-0.9514134253720559 0.4449059831723407 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.190153606701497 1.2107642038234756 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 16 0)
"cameras/drone/drone0" SET Transform localScale (0.9149115041900819 0.9149115041900819 0.9149115041900819)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 5 14)
"cameras/drone/drone1" SET Transform localScale (1.1537805208617191 1.1537805208617191 1.1537805208617191)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.409526675398504 0)
"cameras" SET Transform eulerAngles (-8.455057178899533 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6439801327374575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1524632722328725
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3483655174746517
"cameras/drone/drone0" SET Transform localPosition (-0.07310079976450701 0.4174451881385712 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.38260846527112324 1.0572343947390692 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -3 5)
"cameras/drone/drone0" SET Transform localScale (1.4805184403183786 1.4805184403183786 1.4805184403183786)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -15 -8)
"cameras/drone/drone1" SET Transform localScale (0.9036521299499384 0.9036521299499384 0.9036521299499384)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.533434057271492 0)
"cameras" SET Transform eulerAngles (9.890017663292355 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6701370984372044
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6983994517247067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12599347152079315
"cameras/drone/drone0" SET Transform localPosition (0.38216449806962016 -0.2764623933074049 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7483125216052844 1.0741373796611393 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 18 7)
"cameras/drone/drone0" SET Transform localScale (1.4481458966096818 1.4481458966096818 1.4481458966096818)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -7 -10)
"cameras/drone/drone1" SET Transform localScale (0.6282486619236338 0.6282486619236338 0.6282486619236338)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4573827004984703 0)
"cameras" SET Transform eulerAngles (-9.949799937918486 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.747654430541273
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1304626333787122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25405059259211943
"cameras/drone/drone0" SET Transform localPosition (-0.8793791759146691 -0.11037059806487987 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5406855858706485 0.971968675148551 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -8 19)
"cameras/drone/drone0" SET Transform localScale (1.3744456508831338 1.3744456508831338 1.3744456508831338)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 16 12)
"cameras/drone/drone1" SET Transform localScale (0.8537466108074929 0.8537466108074929 0.8537466108074929)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.159557885697506 0)
"cameras" SET Transform eulerAngles (-3.600859824717123 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4653673942376302
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.053940161903339
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03608781683260114
"cameras/drone/drone0" SET Transform localPosition (1.179176724576019 -0.12626704153541674 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.31549832544158807 0.8625790401680372 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -5 20)
"cameras/drone/drone0" SET Transform localScale (1.1806692349835761 1.1806692349835761 1.1806692349835761)
"cameras/drone/drone1" SET Transform localEulerAngles (18 8 17)
"cameras/drone/drone1" SET Transform localScale (1.3564829517537238 1.3564829517537238 1.3564829517537238)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.176693503032066 0)
"cameras" SET Transform eulerAngles (-8.511557525623864 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3305462493481364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1655840962453448
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2008199757484624
"cameras/drone/drone0" SET Transform localPosition (0.19299858424118543 0.4987219105217316 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1675249561061074 0.862967288846924 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -5 -10)
"cameras/drone/drone0" SET Transform localScale (1.2431737938969412 1.2431737938969412 1.2431737938969412)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -17 -13)
"cameras/drone/drone1" SET Transform localScale (0.7225163458904725 0.7225163458904725 0.7225163458904725)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.788779647754505 0)
"cameras" SET Transform eulerAngles (1.7188149207215098 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3636182248681858
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1680365578754983
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14851570896656593
"cameras/drone/drone0" SET Transform localPosition (-0.33724971360935785 -0.10738015715974009 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7789033238607495 1.15117688376177 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 5 -11)
"cameras/drone/drone0" SET Transform localScale (1.1496753578387038 1.1496753578387038 1.1496753578387038)
"cameras/drone/drone1" SET Transform localEulerAngles (19 2 -3)
"cameras/drone/drone1" SET Transform localScale (1.1104513329818757 1.1104513329818757 1.1104513329818757)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.858335878978617 0)
"cameras" SET Transform eulerAngles (-19.048404033922264 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3387512624210984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1209571156869458
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13600360173309026
"cameras/drone/drone0" SET Transform localPosition (-0.38291500099371734 0.6244253138294185 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19929661487898764 0.8635299248244059 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -2 -11)
"cameras/drone/drone0" SET Transform localScale (1.0993649502854996 1.0993649502854996 1.0993649502854996)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -14 -10)
"cameras/drone/drone1" SET Transform localScale (1.4646440424138039 1.4646440424138039 1.4646440424138039)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.331439733048443 0)
"cameras" SET Transform eulerAngles (-0.405840135926141 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5775721844610063
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.665178720447365
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06482296179803396
"cameras/drone/drone0" SET Transform localPosition (0.7634077076718924 0.20829511078603719 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.956564799871106 0.8834443255585243 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -10 -11)
"cameras/drone/drone0" SET Transform localScale (0.6887648601138603 0.6887648601138603 0.6887648601138603)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -18 5)
"cameras/drone/drone1" SET Transform localScale (0.8474681616824715 0.8474681616824715 0.8474681616824715)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3445278882292935 0)
"cameras" SET Transform eulerAngles (1.463091720189695 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5688091817586938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8626460582682123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1333086906022436
"cameras/drone/drone0" SET Transform localPosition (0.028745006864921763 -0.01884212288665138 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.010858642639185234 0.8902634857623576 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -9 -2)
"cameras/drone/drone0" SET Transform localScale (1.1828381434940864 1.1828381434940864 1.1828381434940864)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -20 -12)
"cameras/drone/drone1" SET Transform localScale (1.2176599632131253 1.2176599632131253 1.2176599632131253)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.434247106784111 0)
"cameras" SET Transform eulerAngles (-12.166717042245207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3526530325256088
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1771490049812847
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.135252546743132
"cameras/drone/drone0" SET Transform localPosition (0.9143162316943687 0.11072745960525293 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.138405685778102 0.9877027287087363 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -12 2)
"cameras/drone/drone0" SET Transform localScale (1.3219663176767757 1.3219663176767757 1.3219663176767757)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -11 19)
"cameras/drone/drone1" SET Transform localScale (0.7076796901030636 0.7076796901030636 0.7076796901030636)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.524004552536993 0)
"cameras" SET Transform eulerAngles (-19.764008263959635 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.015596940733619
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.979886373007143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36202580532879297
"cameras/drone/drone0" SET Transform localPosition (-0.7301961662046839 0.5608961626261126 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0180922518168283 0.8327428578069189 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 0 10)
"cameras/drone/drone0" SET Transform localScale (1.1289497075544208 1.1289497075544208 1.1289497075544208)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 16 15)
"cameras/drone/drone1" SET Transform localScale (1.267130211244036 1.267130211244036 1.267130211244036)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8422585564206715 0)
"cameras" SET Transform eulerAngles (16.156146976587834 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8950743731202018
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1912476644810694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.004675169522195022
"cameras/drone/drone0" SET Transform localPosition (-0.5960778971785579 0.37527434933390996 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08988212820180697 1.218104716071666 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -20 15)
"cameras/drone/drone0" SET Transform localScale (0.7088319159392142 0.7088319159392142 0.7088319159392142)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -13 -20)
"cameras/drone/drone1" SET Transform localScale (0.7586386688715991 0.7586386688715991 0.7586386688715991)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.852139073244571 0)
"cameras" SET Transform eulerAngles (0.6642674764319381 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1936738623387388
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9499764109429756
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12920527573230128
"cameras/drone/drone0" SET Transform localPosition (-0.13239308007282458 0.36142602124922824 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8745123466769458 0.8346287562200744 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 15 -19)
"cameras/drone/drone0" SET Transform localScale (1.2644983897224882 1.2644983897224882 1.2644983897224882)
"cameras/drone/drone1" SET Transform localEulerAngles (16 11 -1)
"cameras/drone/drone1" SET Transform localScale (0.6381506341068706 0.6381506341068706 0.6381506341068706)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.554072663357742 0)
"cameras" SET Transform eulerAngles (-16.000770200788775 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.38163062288668
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0287430919703717
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3994144943064133
"cameras/drone/drone0" SET Transform localPosition (-0.7701066036941387 0.3472237181422581 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.042596056099404 1.1399436616683918 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 20 4)
"cameras/drone/drone0" SET Transform localScale (0.7820404569730982 0.7820404569730982 0.7820404569730982)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -18 12)
"cameras/drone/drone1" SET Transform localScale (0.8546106393550844 0.8546106393550844 0.8546106393550844)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.004172559627051 0)
"cameras" SET Transform eulerAngles (-5.283835503132316 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5980786640641007
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6398220995676347
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12271916177298725
"cameras/drone/drone0" SET Transform localPosition (-0.6315282509562536 0.2246932928563699 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.020997477096754924 0.8204861087504653 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 17 -19)
"cameras/drone/drone0" SET Transform localScale (1.4150592387922347 1.4150592387922347 1.4150592387922347)
"cameras/drone/drone1" SET Transform localEulerAngles (13 5 -9)
"cameras/drone/drone1" SET Transform localScale (0.6418055763055014 0.6418055763055014 0.6418055763055014)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.446135714373072 0)
"cameras" SET Transform eulerAngles (0.961829629827541 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4614063499475969
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9550488515286597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22397384237285767
"cameras/drone/drone0" SET Transform localPosition (-0.24039295991623677 0.3906800089448213 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9475915050228825 1.1415250678737658 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 20 12)
"cameras/drone/drone0" SET Transform localScale (0.7344671910804373 0.7344671910804373 0.7344671910804373)
"cameras/drone/drone1" SET Transform localEulerAngles (17 18 19)
"cameras/drone/drone1" SET Transform localScale (0.8225350947049903 0.8225350947049903 0.8225350947049903)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.452082558871953 0)
"cameras" SET Transform eulerAngles (4.589428065004114 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6091681114401042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.980534941483509
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1964500106290903
"cameras/drone/drone0" SET Transform localPosition (0.07609597178846661 -0.10508818567288786 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.26819274317487174 0.9437101220341645 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 9 -12)
"cameras/drone/drone0" SET Transform localScale (1.0895891242716107 1.0895891242716107 1.0895891242716107)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -20 5)
"cameras/drone/drone1" SET Transform localScale (1.0356485078044235 1.0356485078044235 1.0356485078044235)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.023069742486085 0)
"cameras" SET Transform eulerAngles (-12.323164747094882 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5972621439230729
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8376182997776795
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08062585921094537
"cameras/drone/drone0" SET Transform localPosition (-0.7198701489648711 -0.028872508799437757 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8702999481563649 0.9826267389088315 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 8 19)
"cameras/drone/drone0" SET Transform localScale (0.8832527698854349 0.8832527698854349 0.8832527698854349)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -6 -19)
"cameras/drone/drone1" SET Transform localScale (1.290642059447836 1.290642059447836 1.290642059447836)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.403302463225976 0)
"cameras" SET Transform eulerAngles (-10.711736761950927 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6005596503363475
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9282018725936916
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22646130930262456
"cameras/drone/drone0" SET Transform localPosition (-0.9871492299443353 0.34709458636097695 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7831673684147158 0.9167774410500373 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -12 8)
"cameras/drone/drone0" SET Transform localScale (0.6297824911852926 0.6297824911852926 0.6297824911852926)
"cameras/drone/drone1" SET Transform localEulerAngles (17 13 5)
"cameras/drone/drone1" SET Transform localScale (0.9715685829078291 0.9715685829078291 0.9715685829078291)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.534905895701128 0)
"cameras" SET Transform eulerAngles (-0.026816718260832317 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8447710785887961
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.76197238855402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3201873145988148
"cameras/drone/drone0" SET Transform localPosition (-0.6317694100093881 0.5274701641247102 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7004658109509518 1.1946527581172797 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 18 9)
"cameras/drone/drone0" SET Transform localScale (0.9592302459291403 0.9592302459291403 0.9592302459291403)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -7 -15)
"cameras/drone/drone1" SET Transform localScale (1.1269180654838569 1.1269180654838569 1.1269180654838569)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.139936131107163 0)
"cameras" SET Transform eulerAngles (17.994771774707353 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4862987032280142
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4802615208015037
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28640069484294267
"cameras/drone/drone0" SET Transform localPosition (0.3727028316942982 -0.21807847429920107 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7575579945574564 1.2035179923027355 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 16 -6)
"cameras/drone/drone0" SET Transform localScale (1.3487359863776467 1.3487359863776467 1.3487359863776467)
"cameras/drone/drone1" SET Transform localEulerAngles (6 18 6)
"cameras/drone/drone1" SET Transform localScale (1.2666697957242052 1.2666697957242052 1.2666697957242052)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.512017208484107 0)
"cameras" SET Transform eulerAngles (7.717454363119764 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0588535038795377
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2328985512197217
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26151803977788873
"cameras/drone/drone0" SET Transform localPosition (-0.5409070114266293 -0.26759372246944296 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.235213065370236 1.2420708600136843 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -18 -3)
"cameras/drone/drone0" SET Transform localScale (0.8291137163522451 0.8291137163522451 0.8291137163522451)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -19 17)
"cameras/drone/drone1" SET Transform localScale (0.7921387033410735 0.7921387033410735 0.7921387033410735)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.58829228888256 0)
"cameras" SET Transform eulerAngles (17.57589474657729 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4597364934255688
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5810512923743667
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3120477131714538
"cameras/drone/drone0" SET Transform localPosition (0.03332800100087274 0.6846324033664952 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2691206843895184 0.9904587059698142 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 13 -9)
"cameras/drone/drone0" SET Transform localScale (1.1782833325923163 1.1782833325923163 1.1782833325923163)
"cameras/drone/drone1" SET Transform localEulerAngles (20 19 12)
"cameras/drone/drone1" SET Transform localScale (1.3059981527014104 1.3059981527014104 1.3059981527014104)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.875817682755821 0)
"cameras" SET Transform eulerAngles (-15.023746349024535 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3171335532841297
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2625301256630104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14850027802232343
"cameras/drone/drone0" SET Transform localPosition (0.7908292796655716 0.24307821729358753 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9338011239025132 1.1516155729769435 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -18 11)
"cameras/drone/drone0" SET Transform localScale (1.3951457402297907 1.3951457402297907 1.3951457402297907)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -9 4)
"cameras/drone/drone1" SET Transform localScale (1.4461966617065452 1.4461966617065452 1.4461966617065452)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.813735163150734 0)
"cameras" SET Transform eulerAngles (5.487916691683527 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0067234632245694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3364614408548585
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10538199779274082
"cameras/drone/drone0" SET Transform localPosition (0.4849708747112307 -0.008097532364697513 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10489662413914713 1.0356891032407782 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 4 7)
"cameras/drone/drone0" SET Transform localScale (0.7166594204757668 0.7166594204757668 0.7166594204757668)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 8 -4)
"cameras/drone/drone1" SET Transform localScale (0.9051363008495278 0.9051363008495278 0.9051363008495278)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5552376835799784 0)
"cameras" SET Transform eulerAngles (-17.63258215915162 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.132724411858529
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7505335313091148
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3825659601015513
"cameras/drone/drone0" SET Transform localPosition (-0.6394507042057417 0.2669557423492485 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7187828884489951 0.8075853601845896 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 6 14)
"cameras/drone/drone0" SET Transform localScale (1.1784124616469653 1.1784124616469653 1.1784124616469653)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -7 6)
"cameras/drone/drone1" SET Transform localScale (1.138434908136781 1.138434908136781 1.138434908136781)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.699956596085459 0)
"cameras" SET Transform eulerAngles (7.683912718603917 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47038263921974277
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6988109416573778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10838285031588352
"cameras/drone/drone0" SET Transform localPosition (0.25044096997974563 0.6832647215865881 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5352275466425862 1.1026842781674469 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 17 19)
"cameras/drone/drone0" SET Transform localScale (1.482902479319633 1.482902479319633 1.482902479319633)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 9 -2)
"cameras/drone/drone1" SET Transform localScale (1.4347414820926472 1.4347414820926472 1.4347414820926472)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.561999688870644 0)
"cameras" SET Transform eulerAngles (-19.415935942533924 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.53138232886952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3526192136162907
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3066332123621416
"cameras/drone/drone0" SET Transform localPosition (-0.6336955289501293 0.6237516130144443 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20303475075998723 1.1322133314191791 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 14 2)
"cameras/drone/drone0" SET Transform localScale (0.8377667605801191 0.8377667605801191 0.8377667605801191)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -5 -13)
"cameras/drone/drone1" SET Transform localScale (0.908309518782562 0.908309518782562 0.908309518782562)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6495537880250097 0)
"cameras" SET Transform eulerAngles (-18.770899258274213 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5420957761532593
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.976926797151172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15365695738223661
"cameras/drone/drone0" SET Transform localPosition (-0.6865785774032497 0.47564734071202514 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.49865502360279057 1.269453350939946 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -15 -15)
"cameras/drone/drone0" SET Transform localScale (0.8720451541357432 0.8720451541357432 0.8720451541357432)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -4 -5)
"cameras/drone/drone1" SET Transform localScale (1.2393110177409294 1.2393110177409294 1.2393110177409294)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.83474426806025 0)
"cameras" SET Transform eulerAngles (-16.42662126401705 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9736681541970389
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.651446836071854
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0865865342362247
"cameras/drone/drone0" SET Transform localPosition (1.1677771830001535 0.6719893807311792 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7894103386058353 0.9803153333194542 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -15 -2)
"cameras/drone/drone0" SET Transform localScale (0.6061376563196619 0.6061376563196619 0.6061376563196619)
"cameras/drone/drone1" SET Transform localEulerAngles (3 14 9)
"cameras/drone/drone1" SET Transform localScale (1.140432702863294 1.140432702863294 1.140432702863294)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.61483247955663 0)
"cameras" SET Transform eulerAngles (0.605387731938265 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1337593007043505
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1927108644821651
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1213663434485953
"cameras/drone/drone0" SET Transform localPosition (0.8045166953699099 0.3605713922681519 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9951147588571319 0.8451068038188037 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 7 14)
"cameras/drone/drone0" SET Transform localScale (0.7079085902272845 0.7079085902272845 0.7079085902272845)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -4 -13)
"cameras/drone/drone1" SET Transform localScale (0.8540990066758172 0.8540990066758172 0.8540990066758172)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.880930640132901 0)
"cameras" SET Transform eulerAngles (7.297832596230734 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4174978272430998
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9330603498742556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3814675574660257
"cameras/drone/drone0" SET Transform localPosition (0.511478557175671 -0.04115109100362718 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5408526068696097 0.9173370921165078 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -17 -19)
"cameras/drone/drone0" SET Transform localScale (1.2921504427648403 1.2921504427648403 1.2921504427648403)
"cameras/drone/drone1" SET Transform localEulerAngles (10 13 7)
"cameras/drone/drone1" SET Transform localScale (0.8964314651997816 0.8964314651997816 0.8964314651997816)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9666291986288833 0)
"cameras" SET Transform eulerAngles (16.57233862686305 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4167015288542919
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7917434125986704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06987967842755553
"cameras/drone/drone0" SET Transform localPosition (0.531742418519904 0.13132506892219925 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6031975032389141 1.1883616906213992 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 19 19)
"cameras/drone/drone0" SET Transform localScale (1.2256872605271827 1.2256872605271827 1.2256872605271827)
"cameras/drone/drone1" SET Transform localEulerAngles (20 20 16)
"cameras/drone/drone1" SET Transform localScale (0.743714915470945 0.743714915470945 0.743714915470945)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.202564709068396 0)
"cameras" SET Transform eulerAngles (-1.2089819354889215 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8598996400350127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5832346804913162
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2553559447217733
"cameras/drone/drone0" SET Transform localPosition (-0.9643155876363118 -0.15378428370758673 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1327805906709838 1.0987416853726715 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 2 2)
"cameras/drone/drone0" SET Transform localScale (1.1946824509945135 1.1946824509945135 1.1946824509945135)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -1 -8)
"cameras/drone/drone1" SET Transform localScale (1.4999734127219373 1.4999734127219373 1.4999734127219373)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.12604911484883 0)
"cameras" SET Transform eulerAngles (-13.308721003048651 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6665186687285347
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5746201409063334
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11476419645795972
"cameras/drone/drone0" SET Transform localPosition (-0.4123285548204293 0.558383933743096 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1016967773901587 1.2785922453343153 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -17 14)
"cameras/drone/drone0" SET Transform localScale (1.2414650521443664 1.2414650521443664 1.2414650521443664)
"cameras/drone/drone1" SET Transform localEulerAngles (12 8 10)
"cameras/drone/drone1" SET Transform localScale (1.1510148416082187 1.1510148416082187 1.1510148416082187)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0235352030184295 0)
"cameras" SET Transform eulerAngles (-12.276145706185888 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5292204540757255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5006397033120218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19747421696734865
"cameras/drone/drone0" SET Transform localPosition (-1.0408829760598344 -0.08139705708201878 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9171038077516054 0.976631781795309 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -11 -3)
"cameras/drone/drone0" SET Transform localScale (0.7809574590979224 0.7809574590979224 0.7809574590979224)
"cameras/drone/drone1" SET Transform localEulerAngles (10 12 10)
"cameras/drone/drone1" SET Transform localScale (1.4929311738137179 1.4929311738137179 1.4929311738137179)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8622622010825722 0)
"cameras" SET Transform eulerAngles (-12.291805958224424 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9725796977414664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.786280345179407
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09900496886462001
"cameras/drone/drone0" SET Transform localPosition (0.6279596580303552 0.37624467258251765 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9386692569080272 1.167864201165556 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 20 16)
"cameras/drone/drone0" SET Transform localScale (0.8109477830232235 0.8109477830232235 0.8109477830232235)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -7 -6)
"cameras/drone/drone1" SET Transform localScale (1.1104538313123502 1.1104538313123502 1.1104538313123502)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.197890280998754 0)
"cameras" SET Transform eulerAngles (1.4369097459541464 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8407604983323104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3441360632308292
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12843129221492353
"cameras/drone/drone0" SET Transform localPosition (0.5875243502390746 0.3821332636817418 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5628699719569039 0.8708494420501292 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -12 -11)
"cameras/drone/drone0" SET Transform localScale (0.860259081601014 0.860259081601014 0.860259081601014)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -3 -12)
"cameras/drone/drone1" SET Transform localScale (1.1706236142087854 1.1706236142087854 1.1706236142087854)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.112088218613371 0)
"cameras" SET Transform eulerAngles (-19.463783514514986 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1965611362013404
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.143067858220389
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.013387339429703006
"cameras/drone/drone0" SET Transform localPosition (0.650299777723711 0.41135687456434505 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2816289759962335 1.0252785660367518 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 3 19)
"cameras/drone/drone0" SET Transform localScale (0.8089757678750139 0.8089757678750139 0.8089757678750139)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -16 -18)
"cameras/drone/drone1" SET Transform localScale (1.293905072735746 1.293905072735746 1.293905072735746)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.757790880982914 0)
"cameras" SET Transform eulerAngles (-5.336357027739908 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2711004605838396
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5590595330191663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11623648641924832
"cameras/drone/drone0" SET Transform localPosition (0.704855073571798 0.499780934665551 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.162944071479841 0.9897277072535048 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -18 -9)
"cameras/drone/drone0" SET Transform localScale (0.6349595442895475 0.6349595442895475 0.6349595442895475)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -13 -13)
"cameras/drone/drone1" SET Transform localScale (0.7758690839983673 0.7758690839983673 0.7758690839983673)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.031202028246777 0)
"cameras" SET Transform eulerAngles (9.80652207048734 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2531666834498352
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6903266414161595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06431953915102616
"cameras/drone/drone0" SET Transform localPosition (-0.6433805083698048 0.23643948070655602 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05386617204230726 1.165575115924279 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 19 -15)
"cameras/drone/drone0" SET Transform localScale (1.0911259411824616 1.0911259411824616 1.0911259411824616)
"cameras/drone/drone1" SET Transform localEulerAngles (2 10 -13)
"cameras/drone/drone1" SET Transform localScale (0.740486823780483 0.740486823780483 0.740486823780483)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5319624527743976 0)
"cameras" SET Transform eulerAngles (12.5176581578731 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7272638739950659
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2739587869675595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19889314485756415
"cameras/drone/drone0" SET Transform localPosition (0.8533872643875144 0.46213227453478606 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37418104916663963 1.2151580245923035 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 20 15)
"cameras/drone/drone0" SET Transform localScale (1.0933591880788238 1.0933591880788238 1.0933591880788238)
"cameras/drone/drone1" SET Transform localEulerAngles (13 8 5)
"cameras/drone/drone1" SET Transform localScale (1.2135641295642219 1.2135641295642219 1.2135641295642219)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.640895560738105 0)
"cameras" SET Transform eulerAngles (-12.349812139203253 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1599538750277842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9016427522287093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1531308603690055
"cameras/drone/drone0" SET Transform localPosition (-0.9419012312937904 0.5507788872657038 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8289669002597411 1.136933634408225 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 16 -17)
"cameras/drone/drone0" SET Transform localScale (1.2695352216896867 1.2695352216896867 1.2695352216896867)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -5 12)
"cameras/drone/drone1" SET Transform localScale (1.3185245301917807 1.3185245301917807 1.3185245301917807)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.30658792242399 0)
"cameras" SET Transform eulerAngles (-5.154553862561805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9354195950055647
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0620016753696528
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07844126313700342
"cameras/drone/drone0" SET Transform localPosition (0.9590751413338048 0.5877184860605413 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8268347149136707 1.0552984249312094 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -18 -20)
"cameras/drone/drone0" SET Transform localScale (0.817241410524115 0.817241410524115 0.817241410524115)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -8 -1)
"cameras/drone/drone1" SET Transform localScale (1.0004361496116552 1.0004361496116552 1.0004361496116552)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.495487786547513 0)
"cameras" SET Transform eulerAngles (4.070013299515974 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8511863336168076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.406113460520451
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07655126745552066
"cameras/drone/drone0" SET Transform localPosition (-0.4651512992124822 -0.04200654082394789 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1080711784756585 1.0665044292279782 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -13 -15)
"cameras/drone/drone0" SET Transform localScale (0.8732465183750129 0.8732465183750129 0.8732465183750129)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -19 11)
"cameras/drone/drone1" SET Transform localScale (0.9548638158044722 0.9548638158044722 0.9548638158044722)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.590118462857866 0)
"cameras" SET Transform eulerAngles (-4.7505129040892236 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5769548253551111
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4797173625156774
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2630048419232386
"cameras/drone/drone0" SET Transform localPosition (0.9963833557532225 -0.023681446270953754 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5041771237531278 1.172638054469556 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -10 -19)
"cameras/drone/drone0" SET Transform localScale (1.0080821711318653 1.0080821711318653 1.0080821711318653)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -2 6)
"cameras/drone/drone1" SET Transform localScale (1.2824822801542215 1.2824822801542215 1.2824822801542215)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.886418148239466 0)
"cameras" SET Transform eulerAngles (16.72460029438612 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4740258650359754
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7609064243784451
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0038508673352016134
"cameras/drone/drone0" SET Transform localPosition (0.6731050804743115 0.21399594994755383 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9706101878307917 0.8219935510905118 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -7 -10)
"cameras/drone/drone0" SET Transform localScale (0.8601630149169741 0.8601630149169741 0.8601630149169741)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -6 17)
"cameras/drone/drone1" SET Transform localScale (0.6818169420766913 0.6818169420766913 0.6818169420766913)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8366980915995255 0)
"cameras" SET Transform eulerAngles (-3.4757563018540836 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8247142071406189
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.728471096536624
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3275782108149968
"cameras/drone/drone0" SET Transform localPosition (-0.8369320506146505 0.19625662457433152 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.906745514266319 1.031873667286379 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 13 14)
"cameras/drone/drone0" SET Transform localScale (0.8386441275541496 0.8386441275541496 0.8386441275541496)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 0 7)
"cameras/drone/drone1" SET Transform localScale (0.6575494793618182 0.6575494793618182 0.6575494793618182)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.561563216355206 0)
"cameras" SET Transform eulerAngles (-0.72465890455398 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6771043867157973
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9882042785980247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16458134631836493
"cameras/drone/drone0" SET Transform localPosition (0.8916997828870661 0.09874413076229199 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.193662631625491 1.1982301723580562 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 20 -3)
"cameras/drone/drone0" SET Transform localScale (0.6397856471113106 0.6397856471113106 0.6397856471113106)
"cameras/drone/drone1" SET Transform localEulerAngles (16 10 -2)
"cameras/drone/drone1" SET Transform localScale (1.1879558107320332 1.1879558107320332 1.1879558107320332)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.356482881200455 0)
"cameras" SET Transform eulerAngles (2.10607058661585 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8574901525987603
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4601157855638516
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09360755880904983
"cameras/drone/drone0" SET Transform localPosition (0.9897168664692322 0.3656162676228388 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32934454291963977 0.8290262948324807 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 12 -8)
"cameras/drone/drone0" SET Transform localScale (1.1428209318952667 1.1428209318952667 1.1428209318952667)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -16 9)
"cameras/drone/drone1" SET Transform localScale (1.0045627914391766 1.0045627914391766 1.0045627914391766)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.984488727442111 0)
"cameras" SET Transform eulerAngles (-4.499797360775597 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2125827158171618
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.04343701791848
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3366058035171373
"cameras/drone/drone0" SET Transform localPosition (0.15228954828560637 0.6494506565976943 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.49426001038721057 0.8057719142304252 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -14 -10)
"cameras/drone/drone0" SET Transform localScale (1.1052980814008568 1.1052980814008568 1.1052980814008568)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -14 11)
"cameras/drone/drone1" SET Transform localScale (1.1452282584306395 1.1452282584306395 1.1452282584306395)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.049444765635027 0)
"cameras" SET Transform eulerAngles (-11.787012764880572 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4710674698660093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.788432023020663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0411322751678072
"cameras/drone/drone0" SET Transform localPosition (-0.450623510984848 0.34889409212223493 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9973851314509294 0.8478020801533765 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -19 -2)
"cameras/drone/drone0" SET Transform localScale (1.0588532345243995 1.0588532345243995 1.0588532345243995)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -20 -7)
"cameras/drone/drone1" SET Transform localScale (1.3284353075453517 1.3284353075453517 1.3284353075453517)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.07653695110951 0)
"cameras" SET Transform eulerAngles (16.39889498697164 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5665940777603278
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9168073598048356
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09660191890948218
"cameras/drone/drone0" SET Transform localPosition (-0.80781571376946 0.12856839696296268 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7098477011674624 1.1489782893163487 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 3 -14)
"cameras/drone/drone0" SET Transform localScale (0.9258887500427653 0.9258887500427653 0.9258887500427653)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -1 -19)
"cameras/drone/drone1" SET Transform localScale (1.2772383055341636 1.2772383055341636 1.2772383055341636)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.922230719609175 0)
"cameras" SET Transform eulerAngles (-19.578037436557814 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4495388934941831
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4732252492796238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3437075877451605
"cameras/drone/drone0" SET Transform localPosition (-0.3701865698035205 0.5930209029864455 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.376255398607636 0.9597457737505719 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -16 12)
"cameras/drone/drone0" SET Transform localScale (0.9467220475931142 0.9467220475931142 0.9467220475931142)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 8 11)
"cameras/drone/drone1" SET Transform localScale (1.3543327821242634 1.3543327821242634 1.3543327821242634)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3847878938182303 0)
"cameras" SET Transform eulerAngles (-1.9499906088519872 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9569514544439582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6132913959934896
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23396386331629057
"cameras/drone/drone0" SET Transform localPosition (0.8896270392388599 -0.08723722219333246 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3400100167268463 1.0541728189558417 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 18 -14)
"cameras/drone/drone0" SET Transform localScale (0.8429736075135452 0.8429736075135452 0.8429736075135452)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -2 14)
"cameras/drone/drone1" SET Transform localScale (0.6428976875117628 0.6428976875117628 0.6428976875117628)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.96640092543356 0)
"cameras" SET Transform eulerAngles (-5.3570673708131125 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.42363599467172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9505884728005467
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03546902633627696
"cameras/drone/drone0" SET Transform localPosition (-0.9807088052121621 0.09126915782963713 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9965047366921203 0.8276086754451901 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -20 -4)
"cameras/drone/drone0" SET Transform localScale (0.8531488431703593 0.8531488431703593 0.8531488431703593)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -11 6)
"cameras/drone/drone1" SET Transform localScale (1.2525019318298183 1.2525019318298183 1.2525019318298183)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2298822846885935 0)
"cameras" SET Transform eulerAngles (-6.512003673687392 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5619951925540327
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.260697775067658
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3695650963356156
"cameras/drone/drone0" SET Transform localPosition (-0.32180349557005794 0.44020076775000844 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.042680361895026 1.0298891621986952 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -19 14)
"cameras/drone/drone0" SET Transform localScale (0.6944279187479709 0.6944279187479709 0.6944279187479709)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 16 13)
"cameras/drone/drone1" SET Transform localScale (1.3332384452451782 1.3332384452451782 1.3332384452451782)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.809243094504971 0)
"cameras" SET Transform eulerAngles (2.5372992495205153 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4900563600591221
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0013433044395255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22197154036899974
"cameras/drone/drone0" SET Transform localPosition (0.004307403011239108 -0.01983032414160263 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7092497233936481 0.9771396880970598 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 14 -20)
"cameras/drone/drone0" SET Transform localScale (1.0641966606676263 1.0641966606676263 1.0641966606676263)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -18 4)
"cameras/drone/drone1" SET Transform localScale (1.2832760255407822 1.2832760255407822 1.2832760255407822)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.56533684124169 0)
"cameras" SET Transform eulerAngles (-2.047750072764586 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0926657981322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2811331365803005
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34589364887421814
"cameras/drone/drone0" SET Transform localPosition (0.8795845891242877 -0.1372859514686478 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6488502399756566 0.8887299692058397 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -20 -14)
"cameras/drone/drone0" SET Transform localScale (1.0446652934360552 1.0446652934360552 1.0446652934360552)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 19 -7)
"cameras/drone/drone1" SET Transform localScale (1.3677986282410965 1.3677986282410965 1.3677986282410965)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2407100074852737 0)
"cameras" SET Transform eulerAngles (-14.686959080893658 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7778381740258016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.271225875020136
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18184077274033414
"cameras/drone/drone0" SET Transform localPosition (0.37846279247007164 0.5122419593143375 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2556091139825962 0.8693462115073392 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 10 13)
"cameras/drone/drone0" SET Transform localScale (1.0641894571401838 1.0641894571401838 1.0641894571401838)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 15 19)
"cameras/drone/drone1" SET Transform localScale (0.6970726513392348 0.6970726513392348 0.6970726513392348)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.606644663711419 0)
"cameras" SET Transform eulerAngles (13.980135652505787 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3289747362161193
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5239100639280143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22154482675850729
"cameras/drone/drone0" SET Transform localPosition (0.5185959802348381 0.11875452366815825 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.823384529788273 1.079286571419757 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 10 -3)
"cameras/drone/drone0" SET Transform localScale (0.8595434119862855 0.8595434119862855 0.8595434119862855)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 9 -1)
"cameras/drone/drone1" SET Transform localScale (1.1070899884570649 1.1070899884570649 1.1070899884570649)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.605943750966973 0)
"cameras" SET Transform eulerAngles (4.817597315076636 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2000387208445815
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3255592132995178
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11237282678975685
"cameras/drone/drone0" SET Transform localPosition (-0.33695741879423047 0.02247262494187313 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0002593644480695 1.2707864576818015 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 2 10)
"cameras/drone/drone0" SET Transform localScale (1.0380754580490124 1.0380754580490124 1.0380754580490124)
"cameras/drone/drone1" SET Transform localEulerAngles (11 4 -18)
"cameras/drone/drone1" SET Transform localScale (1.1846833540035684 1.1846833540035684 1.1846833540035684)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.9784472565907665 0)
"cameras" SET Transform eulerAngles (9.996449434434517 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.147575419912705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3805568663535166
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1630224763753011
"cameras/drone/drone0" SET Transform localPosition (0.16467608781238874 -0.13178677144187273 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.34746976789926565 1.04287914594784 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 9 9)
"cameras/drone/drone0" SET Transform localScale (0.7597891831259996 0.7597891831259996 0.7597891831259996)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 8 0)
"cameras/drone/drone1" SET Transform localScale (1.3583467236277404 1.3583467236277404 1.3583467236277404)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7425542835165455 0)
"cameras" SET Transform eulerAngles (-19.964753818160858 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2352549911872597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9741740623762968
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0623394470226629
"cameras/drone/drone0" SET Transform localPosition (-0.969918481640209 0.49176675922276286 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7051051375040438 0.806298719121367 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 11 -16)
"cameras/drone/drone0" SET Transform localScale (1.437146174496367 1.437146174496367 1.437146174496367)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 19 20)
"cameras/drone/drone1" SET Transform localScale (0.641551453058949 0.641551453058949 0.641551453058949)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.216665778511885 0)
"cameras" SET Transform eulerAngles (-17.575362162562943 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2167870110432133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3941153161025976
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13881311354209988
"cameras/drone/drone0" SET Transform localPosition (0.058263868830267906 0.19754370373666413 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3011349345963935 0.9790534296240783 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -11 -7)
"cameras/drone/drone0" SET Transform localScale (0.699310629112162 0.699310629112162 0.699310629112162)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -12 -17)
"cameras/drone/drone1" SET Transform localScale (0.7514571461070704 0.7514571461070704 0.7514571461070704)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.361684131757346 0)
"cameras" SET Transform eulerAngles (-10.678505668340833 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9747702670808059
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9785905969010321
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3024828591713629
"cameras/drone/drone0" SET Transform localPosition (0.5827399005026286 -0.08819171422771815 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7629035888655793 1.2597775550853068 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 7 4)
"cameras/drone/drone0" SET Transform localScale (0.7248007337305397 0.7248007337305397 0.7248007337305397)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -15 10)
"cameras/drone/drone1" SET Transform localScale (1.4847050024847381 1.4847050024847381 1.4847050024847381)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1684936153931824 0)
"cameras" SET Transform eulerAngles (12.099530044752711 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.531645614068681
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4020297082766993
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36733609229536635
"cameras/drone/drone0" SET Transform localPosition (0.6390765307984791 0.5452379988147285 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0219809007775458 1.137846030000678 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 8 -7)
"cameras/drone/drone0" SET Transform localScale (0.9780834185057442 0.9780834185057442 0.9780834185057442)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -16 -3)
"cameras/drone/drone1" SET Transform localScale (0.7338307929057504 0.7338307929057504 0.7338307929057504)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.988439606344372 0)
"cameras" SET Transform eulerAngles (13.764420269678261 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9459118875687157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2562564752919094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31844253589459376
"cameras/drone/drone0" SET Transform localPosition (-0.10048730599806555 0.4418396882536236 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.671473567059146 1.1368618195887419 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -12 19)
"cameras/drone/drone0" SET Transform localScale (0.7233093647416785 0.7233093647416785 0.7233093647416785)
"cameras/drone/drone1" SET Transform localEulerAngles (12 12 -12)
"cameras/drone/drone1" SET Transform localScale (0.7554153407671709 0.7554153407671709 0.7554153407671709)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.728455145119921 0)
"cameras" SET Transform eulerAngles (4.276247630975327 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1129445882273814
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5002718422275991
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09776714994131269
"cameras/drone/drone0" SET Transform localPosition (-0.11558291085410666 0.36646413845265585 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.026845168719242807 1.1046048671871587 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -13 14)
"cameras/drone/drone0" SET Transform localScale (1.2146639457339605 1.2146639457339605 1.2146639457339605)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 0 -17)
"cameras/drone/drone1" SET Transform localScale (0.872383062267153 0.872383062267153 0.872383062267153)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4985809911263157 0)
"cameras" SET Transform eulerAngles (-6.788562285600719 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8857775755414268
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.979762634089846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04509403107134076
"cameras/drone/drone0" SET Transform localPosition (0.19207076130320488 0.10628565494451486 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05920591315186163 0.8888545953818401 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 9 10)
"cameras/drone/drone0" SET Transform localScale (1.2103693959403543 1.2103693959403543 1.2103693959403543)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -11 6)
"cameras/drone/drone1" SET Transform localScale (1.1148287283755867 1.1148287283755867 1.1148287283755867)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7182925681030996 0)
"cameras" SET Transform eulerAngles (-11.294456516403084 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3751365362714756
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.262620714426388
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24361633230114943
"cameras/drone/drone0" SET Transform localPosition (0.9998740702855498 -0.047380665290847224 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4242036640641832 1.0525127765691507 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 11 -10)
"cameras/drone/drone0" SET Transform localScale (1.3890924615891505 1.3890924615891505 1.3890924615891505)
"cameras/drone/drone1" SET Transform localEulerAngles (10 15 -20)
"cameras/drone/drone1" SET Transform localScale (1.2484349462567628 1.2484349462567628 1.2484349462567628)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.193860020772214 0)
"cameras" SET Transform eulerAngles (9.25233567595686 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3640005170699478
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0815354750418102
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15384069490862615
"cameras/drone/drone0" SET Transform localPosition (-0.030189900609773668 -0.1017938753614645 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0761516022092568 1.0018660998506288 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 4 19)
"cameras/drone/drone0" SET Transform localScale (0.9971390102288196 0.9971390102288196 0.9971390102288196)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -4 -13)
"cameras/drone/drone1" SET Transform localScale (1.204524092469668 1.204524092469668 1.204524092469668)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.520957270838103 0)
"cameras" SET Transform eulerAngles (-18.75938750577162 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7144468782202291
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9156027967621019
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24157991260118183
"cameras/drone/drone0" SET Transform localPosition (0.2904214913450387 -0.22871840526950776 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.781348000135069 1.2135664325935056 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -4 -18)
"cameras/drone/drone0" SET Transform localScale (0.8859537473830696 0.8859537473830696 0.8859537473830696)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 4 5)
"cameras/drone/drone1" SET Transform localScale (1.0348525963506696 1.0348525963506696 1.0348525963506696)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3794980391505955 0)
"cameras" SET Transform eulerAngles (17.226322883947354 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.35945906304629
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7855678100181154
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10064086204139025
"cameras/drone/drone0" SET Transform localPosition (-1.0851471234349226 0.3243253907705624 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8485251934081528 1.09155897216962 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 7 15)
"cameras/drone/drone0" SET Transform localScale (1.0847494674829568 1.0847494674829568 1.0847494674829568)
"cameras/drone/drone1" SET Transform localEulerAngles (2 3 8)
"cameras/drone/drone1" SET Transform localScale (1.07364908467855 1.07364908467855 1.07364908467855)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9444958960875045 0)
"cameras" SET Transform eulerAngles (-9.833994003075679 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9874382229317847
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1002921612111611
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05341430098685929
"cameras/drone/drone0" SET Transform localPosition (0.06462906200676288 0.17306254210462385 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.023276925295759 0.9148502876100617 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 6 5)
"cameras/drone/drone0" SET Transform localScale (1.2879676442541785 1.2879676442541785 1.2879676442541785)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 0 11)
"cameras/drone/drone1" SET Transform localScale (0.968108343382164 0.968108343382164 0.968108343382164)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.976520219424247 0)
"cameras" SET Transform eulerAngles (11.208416895715253 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3223860595710906
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1932234157125503
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0869857527599089
"cameras/drone/drone0" SET Transform localPosition (1.174984762575942 0.387412685768132 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20804260476791714 1.265413356423846 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -1 13)
"cameras/drone/drone0" SET Transform localScale (1.4588992784101578 1.4588992784101578 1.4588992784101578)
"cameras/drone/drone1" SET Transform localEulerAngles (5 19 -3)
"cameras/drone/drone1" SET Transform localScale (1.1451039108898649 1.1451039108898649 1.1451039108898649)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.525993205176429 0)
"cameras" SET Transform eulerAngles (11.404402562436019 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4235728310650795
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5193584431747542
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27854147506894916
"cameras/drone/drone0" SET Transform localPosition (-0.6692338605649557 0.6311788226051864 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06522158982637594 1.2994039115655271 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 14 18)
"cameras/drone/drone0" SET Transform localScale (0.8105067034355302 0.8105067034355302 0.8105067034355302)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -16 -10)
"cameras/drone/drone1" SET Transform localScale (1.1475463236560381 1.1475463236560381 1.1475463236560381)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.937530112574606 0)
"cameras" SET Transform eulerAngles (-12.322945089442157 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.248868976133343
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5319402674246057
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.045556615620684804
"cameras/drone/drone0" SET Transform localPosition (0.3615454346944742 0.22663617716215673 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5303014990239903 1.293640286712335 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -7 -11)
"cameras/drone/drone0" SET Transform localScale (1.4550908760586567 1.4550908760586567 1.4550908760586567)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -12 5)
"cameras/drone/drone1" SET Transform localScale (0.7433771359590502 0.7433771359590502 0.7433771359590502)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.405514805506317 0)
"cameras" SET Transform eulerAngles (19.763419813497784 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7257443973926085
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1986609023113537
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16351639658741637
"cameras/drone/drone0" SET Transform localPosition (0.2880333545935183 0.47289676250785545 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9971354852134531 1.1286264873723348 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -10 -15)
"cameras/drone/drone0" SET Transform localScale (0.8587310632663854 0.8587310632663854 0.8587310632663854)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -13 5)
"cameras/drone/drone1" SET Transform localScale (0.9175416856800733 0.9175416856800733 0.9175416856800733)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.523733814918205 0)
"cameras" SET Transform eulerAngles (-12.823524123683207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2140056439448452
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.44941968907479
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2390730693529679
"cameras/drone/drone0" SET Transform localPosition (0.8886553581537251 -0.14700678699761432 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6141333474042314 1.1406516969978697 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -5 -6)
"cameras/drone/drone0" SET Transform localScale (1.0869364559837675 1.0869364559837675 1.0869364559837675)
"cameras/drone/drone1" SET Transform localEulerAngles (16 10 -7)
"cameras/drone/drone1" SET Transform localScale (1.340661201626369 1.340661201626369 1.340661201626369)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.952736741212296 0)
"cameras" SET Transform eulerAngles (-19.487671040367132 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6556440812562174
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2105728665314213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.030251066690783146
"cameras/drone/drone0" SET Transform localPosition (0.7726392079789746 0.5014781162455448 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7091667726898503 1.0240997644591352 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -20 -4)
"cameras/drone/drone0" SET Transform localScale (1.4446569007751346 1.4446569007751346 1.4446569007751346)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -6 16)
"cameras/drone/drone1" SET Transform localScale (0.9271510023215918 0.9271510023215918 0.9271510023215918)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.76975479275346 0)
"cameras" SET Transform eulerAngles (15.829336950833934 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45808178542594763
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4563093348421634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1534551744824842
"cameras/drone/drone0" SET Transform localPosition (-0.901773944127858 0.3760332473536068 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5550189265071076 1.158021412335092 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 14 1)
"cameras/drone/drone0" SET Transform localScale (0.8584438164147199 0.8584438164147199 0.8584438164147199)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -9 -12)
"cameras/drone/drone1" SET Transform localScale (1.0038145219507246 1.0038145219507246 1.0038145219507246)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.738287804229206 0)
"cameras" SET Transform eulerAngles (-7.998327902654928 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.921865832509259
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4857386839723978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26336247194639384
"cameras/drone/drone0" SET Transform localPosition (0.8850680138593805 0.013877534590207963 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2216458872096463 1.2295169634226433 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -4 -18)
"cameras/drone/drone0" SET Transform localScale (0.6835285119625092 0.6835285119625092 0.6835285119625092)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 1 12)
"cameras/drone/drone1" SET Transform localScale (1.2277659508993968 1.2277659508993968 1.2277659508993968)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.324278370889701 0)
"cameras" SET Transform eulerAngles (-10.361327890226004 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8173438483898949
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.937403983408306
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30746285636212867
"cameras/drone/drone0" SET Transform localPosition (0.17686553054935716 0.4783217225106607 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7667626060169419 1.076194011527186 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -16 13)
"cameras/drone/drone0" SET Transform localScale (1.4690206279715199 1.4690206279715199 1.4690206279715199)
"cameras/drone/drone1" SET Transform localEulerAngles (12 1 -3)
"cameras/drone/drone1" SET Transform localScale (0.6842496541289849 0.6842496541289849 0.6842496541289849)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 30
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.582753128717049 0)
"cameras" SET Transform eulerAngles (17.561623241625554 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2473568926808851
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9082105168048388
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10262703486468779
"cameras/drone/drone0" SET Transform localPosition (-0.62556123327734 0.6570248423822562 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7660413696094872 1.1161425038834274 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -10 -19)
"cameras/drone/drone0" SET Transform localScale (0.8499631976439612 0.8499631976439612 0.8499631976439612)
"cameras/drone/drone1" SET Transform localEulerAngles (4 12 -6)
"cameras/drone/drone1" SET Transform localScale (1.220673247360512 1.220673247360512 1.220673247360512)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8688000207349535 0)
"cameras" SET Transform eulerAngles (-8.435711057636182 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6222134894645559
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3723768179091644
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3503665438636883
"cameras/drone/drone0" SET Transform localPosition (-0.3618689227869559 -0.23933746041274068 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3529668161667494 0.9913538932679349 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 9 -20)
"cameras/drone/drone0" SET Transform localScale (0.6839110286010546 0.6839110286010546 0.6839110286010546)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -8 16)
"cameras/drone/drone1" SET Transform localScale (0.9299427786259611 0.9299427786259611 0.9299427786259611)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9181657871260396 0)
"cameras" SET Transform eulerAngles (-16.64466520336766 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1560625879965887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9568560059406642
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01627250288697626
"cameras/drone/drone0" SET Transform localPosition (0.1951781534204906 0.3442961947028979 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4511456036022814 1.1975514598932069 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 9 -6)
"cameras/drone/drone0" SET Transform localScale (0.852306248077303 0.852306248077303 0.852306248077303)
"cameras/drone/drone1" SET Transform localEulerAngles (3 4 4)
"cameras/drone/drone1" SET Transform localScale (1.296303103969717 1.296303103969717 1.296303103969717)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6708234026014415 0)
"cameras" SET Transform eulerAngles (-17.923500421700993 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.10039538942803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1876839928353062
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.021871673098889623
"cameras/drone/drone0" SET Transform localPosition (-0.20061291574466233 0.03237001720476956 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3516714394194056 1.2691472759782485 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -9 -13)
"cameras/drone/drone0" SET Transform localScale (0.8688397949753728 0.8688397949753728 0.8688397949753728)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -20 7)
"cameras/drone/drone1" SET Transform localScale (1.120739366172499 1.120739366172499 1.120739366172499)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.362030701436225 0)
"cameras" SET Transform eulerAngles (-7.9177362017814 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49845435012697364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8546134460176922
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3300090537131472
"cameras/drone/drone0" SET Transform localPosition (-0.37760722118963186 -0.1513922910787498 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.142523008706463 0.8556300243938448 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -4 11)
"cameras/drone/drone0" SET Transform localScale (0.8085415171796159 0.8085415171796159 0.8085415171796159)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -8 2)
"cameras/drone/drone1" SET Transform localScale (1.4085164268727461 1.4085164268727461 1.4085164268727461)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.097837437749293 0)
"cameras" SET Transform eulerAngles (6.584081968460737 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.292131831805197
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3003119126459213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24954358992264744
"cameras/drone/drone0" SET Transform localPosition (-0.5154033924294767 0.4142017720939117 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12283307353198247 1.2358993121723916 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -17 -10)
"cameras/drone/drone0" SET Transform localScale (1.313557176571 1.313557176571 1.313557176571)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -11 -13)
"cameras/drone/drone1" SET Transform localScale (0.6083466069961699 0.6083466069961699 0.6083466069961699)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.07691015569401 0)
"cameras" SET Transform eulerAngles (-3.046527910026036 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2056440393233192
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.881650366507265
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22237082069809674
"cameras/drone/drone0" SET Transform localPosition (-0.9023340266804332 -0.17103738700970533 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4667247048015435 0.9795856642021309 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 1 14)
"cameras/drone/drone0" SET Transform localScale (1.3733178203027712 1.3733178203027712 1.3733178203027712)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -1 15)
"cameras/drone/drone1" SET Transform localScale (1.2950602645842668 1.2950602645842668 1.2950602645842668)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8841006287705717 0)
"cameras" SET Transform eulerAngles (9.446427209642518 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0432268657356976
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.010077868971552
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.274022063549072
"cameras/drone/drone0" SET Transform localPosition (0.12250445165414336 0.06138711589349494 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.058596104164979845 0.8048100372516485 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -17 11)
"cameras/drone/drone0" SET Transform localScale (1.4944078888538281 1.4944078888538281 1.4944078888538281)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -13 19)
"cameras/drone/drone1" SET Transform localScale (1.382221861389918 1.382221861389918 1.382221861389918)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0352182199934177 0)
"cameras" SET Transform eulerAngles (13.800979952634805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4008446891403263
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.511114203806127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3316418254456571
"cameras/drone/drone0" SET Transform localPosition (1.0141927021175514 0.09788249866490656 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3178677983873801 0.838310157943954 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -15 -1)
"cameras/drone/drone0" SET Transform localScale (0.8223090141043071 0.8223090141043071 0.8223090141043071)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 0 8)
"cameras/drone/drone1" SET Transform localScale (1.3559774207657975 1.3559774207657975 1.3559774207657975)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.351527487833206 0)
"cameras" SET Transform eulerAngles (-5.351585011319893 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4414925010237355
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9635333154039271
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03548462624165016
"cameras/drone/drone0" SET Transform localPosition (0.5509468693176285 0.4588657616001243 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.163998205659162 0.9564847348782097 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -9 -13)
"cameras/drone/drone0" SET Transform localScale (1.0827901502420976 1.0827901502420976 1.0827901502420976)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -11 -1)
"cameras/drone/drone1" SET Transform localScale (1.2892581832602672 1.2892581832602672 1.2892581832602672)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.828859780657968 0)
"cameras" SET Transform eulerAngles (15.005445597510871 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3477040541497307
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2736972352356615
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10746997132703835
"cameras/drone/drone0" SET Transform localPosition (0.25537820566728753 0.3527188615498909 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4036784262546934 1.177621619119554 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -12 1)
"cameras/drone/drone0" SET Transform localScale (1.2695492618630315 1.2695492618630315 1.2695492618630315)
"cameras/drone/drone1" SET Transform localEulerAngles (13 9 19)
"cameras/drone/drone1" SET Transform localScale (1.4382227339779718 1.4382227339779718 1.4382227339779718)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7495268790642133 0)
"cameras" SET Transform eulerAngles (-4.2516297512558054 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5032865900247105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2549190212377936
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35165301531363574
"cameras/drone/drone0" SET Transform localPosition (-0.3412423757907084 -0.050573510012435985 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.048793652385187 0.9428504430502349 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -7 2)
"cameras/drone/drone0" SET Transform localScale (1.4678823510257635 1.4678823510257635 1.4678823510257635)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 1 14)
"cameras/drone/drone1" SET Transform localScale (0.9339459754212247 0.9339459754212247 0.9339459754212247)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.686312934125397 0)
"cameras" SET Transform eulerAngles (-15.96488584823534 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1853785961853016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5532952362180628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38176278577560835
"cameras/drone/drone0" SET Transform localPosition (-0.20889014542067041 0.44459310830870274 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6045366403524586 1.238702834537765 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 3 -1)
"cameras/drone/drone0" SET Transform localScale (1.2597417770282835 1.2597417770282835 1.2597417770282835)
"cameras/drone/drone1" SET Transform localEulerAngles (8 20 0)
"cameras/drone/drone1" SET Transform localScale (1.211683112698599 1.211683112698599 1.211683112698599)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.625219036959593 0)
"cameras" SET Transform eulerAngles (-12.746402755779908 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8742651554404597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5405131871556745
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3856126400510309
"cameras/drone/drone0" SET Transform localPosition (-0.09524445100696588 0.2786105490228456 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0702921815777398 1.0352951396623684 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -19 12)
"cameras/drone/drone0" SET Transform localScale (0.9491479412881236 0.9491479412881236 0.9491479412881236)
"cameras/drone/drone1" SET Transform localEulerAngles (18 0 18)
"cameras/drone/drone1" SET Transform localScale (0.9157901101051538 0.9157901101051538 0.9157901101051538)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.319415188787116 0)
"cameras" SET Transform eulerAngles (8.868743595101467 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.615025276987676
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1454454040924724
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23968347681958196
"cameras/drone/drone0" SET Transform localPosition (0.6527392778514141 0.634442150728004 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3807563079047869 0.845688773441164 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 19 -8)
"cameras/drone/drone0" SET Transform localScale (1.2236817575614345 1.2236817575614345 1.2236817575614345)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -12 -16)
"cameras/drone/drone1" SET Transform localScale (1.4902646889783324 1.4902646889783324 1.4902646889783324)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.524347061371052 0)
"cameras" SET Transform eulerAngles (5.268275167936917 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.307268024977779
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5441775994546587
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2194568358670666
"cameras/drone/drone0" SET Transform localPosition (-0.7722692711356576 0.4887535330773611 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5961466168123624 1.2204930006682537 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -12 0)
"cameras/drone/drone0" SET Transform localScale (1.1714546486738229 1.1714546486738229 1.1714546486738229)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 1 -3)
"cameras/drone/drone1" SET Transform localScale (0.8744890471330449 0.8744890471330449 0.8744890471330449)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.694665073230568 0)
"cameras" SET Transform eulerAngles (16.533068728274756 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7601261544412292
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5953516051048253
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.169151960094761
"cameras/drone/drone0" SET Transform localPosition (1.1201399628244946 -0.15988015717508858 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1400732524390869 1.2154106831704037 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -12 10)
"cameras/drone/drone0" SET Transform localScale (1.1020295917054526 1.1020295917054526 1.1020295917054526)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -15 16)
"cameras/drone/drone1" SET Transform localScale (1.3265175482052232 1.3265175482052232 1.3265175482052232)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.740479373532331 0)
"cameras" SET Transform eulerAngles (-9.703971228187864 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8597123249534424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2171405957090617
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2996730852142365
"cameras/drone/drone0" SET Transform localPosition (0.6795238156863161 0.5241399293746993 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1408944850642497 1.1792436000397886 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -10 -3)
"cameras/drone/drone0" SET Transform localScale (1.4680156171877896 1.4680156171877896 1.4680156171877896)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -10 -6)
"cameras/drone/drone1" SET Transform localScale (1.1748985893868622 1.1748985893868622 1.1748985893868622)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.947067615352271 0)
"cameras" SET Transform eulerAngles (13.600200064846966 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.077589340233574
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8290389679132453
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15025293888253968
"cameras/drone/drone0" SET Transform localPosition (0.6837072293552093 -0.02528641894055078 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04642916228959271 1.2608366732805143 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -19 -20)
"cameras/drone/drone0" SET Transform localScale (0.722661317775726 0.722661317775726 0.722661317775726)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -11 15)
"cameras/drone/drone1" SET Transform localScale (1.3619204391712056 1.3619204391712056 1.3619204391712056)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.186486477807937 0)
"cameras" SET Transform eulerAngles (8.422024853387278 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49767058259525804
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3933385242844814
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3396636150226899
"cameras/drone/drone0" SET Transform localPosition (-0.042248301355732654 0.5833503364135182 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0719535123013337 1.1207835611642296 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 3 16)
"cameras/drone/drone0" SET Transform localScale (1.0281320435461936 1.0281320435461936 1.0281320435461936)
"cameras/drone/drone1" SET Transform localEulerAngles (18 13 19)
"cameras/drone/drone1" SET Transform localScale (1.1898162449368814 1.1898162449368814 1.1898162449368814)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.380843551423842 0)
"cameras" SET Transform eulerAngles (0.46394966480709954 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9155479843570844
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5500455428461204
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3512276341710046
"cameras/drone/drone0" SET Transform localPosition (-0.5266526233609609 0.08576742475085691 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9225788477571464 1.2173566699709615 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 6 -12)
"cameras/drone/drone0" SET Transform localScale (0.6115926520077959 0.6115926520077959 0.6115926520077959)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -12 18)
"cameras/drone/drone1" SET Transform localScale (1.3773332988440017 1.3773332988440017 1.3773332988440017)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.680472391999923 0)
"cameras" SET Transform eulerAngles (0.13534718820645253 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8529912352051348
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6728243274926857
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.302039996859924
"cameras/drone/drone0" SET Transform localPosition (-0.46471702094068557 0.35318322717114187 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5998347419799873 0.8513240979847114 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 9 0)
"cameras/drone/drone0" SET Transform localScale (1.0605312410187555 1.0605312410187555 1.0605312410187555)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 12 11)
"cameras/drone/drone1" SET Transform localScale (1.0941925402500283 1.0941925402500283 1.0941925402500283)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8256697240960853 0)
"cameras" SET Transform eulerAngles (19.988079364455736 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.568130488008792
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1754608510255609
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0524880240227025
"cameras/drone/drone0" SET Transform localPosition (0.9551258866930079 -0.22874794912694157 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.14247201388468267 1.2548522675348053 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 0 18)
"cameras/drone/drone0" SET Transform localScale (0.9044395036036748 0.9044395036036748 0.9044395036036748)
"cameras/drone/drone1" SET Transform localEulerAngles (3 15 3)
"cameras/drone/drone1" SET Transform localScale (1.2389091613359304 1.2389091613359304 1.2389091613359304)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.672419945038968 0)
"cameras" SET Transform eulerAngles (8.634220579906714 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5468455107494479
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9445586337316922
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.051442043844723354
"cameras/drone/drone0" SET Transform localPosition (-0.7189075821637465 0.651401823943577 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03902555867768687 0.8571028805591878 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -20 14)
"cameras/drone/drone0" SET Transform localScale (1.2518593391709143 1.2518593391709143 1.2518593391709143)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -17 -11)
"cameras/drone/drone1" SET Transform localScale (1.0907539084418096 1.0907539084418096 1.0907539084418096)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5910369001821256 0)
"cameras" SET Transform eulerAngles (-6.151631803441475 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2842343776844918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5935142945502085
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04549070509412694
"cameras/drone/drone0" SET Transform localPosition (1.1128001077626812 -0.021855265685032876 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.128771320748775 0.9166225499460037 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 1 17)
"cameras/drone/drone0" SET Transform localScale (0.7405910825202018 0.7405910825202018 0.7405910825202018)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 3 6)
"cameras/drone/drone1" SET Transform localScale (0.7397089520491009 0.7397089520491009 0.7397089520491009)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.614226178312526 0)
"cameras" SET Transform eulerAngles (3.0774040300479477 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4492194420150701
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7611867527543434
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.024498549253477588
"cameras/drone/drone0" SET Transform localPosition (0.46575883456158684 0.5846371422811796 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1255095358173284 1.174923492657662 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 16 -9)
"cameras/drone/drone0" SET Transform localScale (0.9658894837876337 0.9658894837876337 0.9658894837876337)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 3 -8)
"cameras/drone/drone1" SET Transform localScale (0.7587785003637376 0.7587785003637376 0.7587785003637376)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1822394730210526 0)
"cameras" SET Transform eulerAngles (17.880427847790827 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5841810538255632
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5226392701925653
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.023201510790756476
"cameras/drone/drone0" SET Transform localPosition (-0.04346111674394226 0.09952216453808499 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08634503938840554 0.9957980374002069 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 4 -10)
"cameras/drone/drone0" SET Transform localScale (0.6585267438522651 0.6585267438522651 0.6585267438522651)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -18 -8)
"cameras/drone/drone1" SET Transform localScale (0.921448096931256 0.921448096931256 0.921448096931256)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2272690805707906 0)
"cameras" SET Transform eulerAngles (-11.406539616588866 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5754615203223927
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6745886232728813
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38784755963261697
"cameras/drone/drone0" SET Transform localPosition (0.7934642169801098 -0.11486040469704412 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.0666241723552865 1.1853684470563486 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 9 -10)
"cameras/drone/drone0" SET Transform localScale (1.1114376127399441 1.1114376127399441 1.1114376127399441)
"cameras/drone/drone1" SET Transform localEulerAngles (8 11 -2)
"cameras/drone/drone1" SET Transform localScale (1.478408337895858 1.478408337895858 1.478408337895858)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7323981075296127 0)
"cameras" SET Transform eulerAngles (-10.401622183146957 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0850575473522648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5787692403337918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2243114187777926
"cameras/drone/drone0" SET Transform localPosition (-0.20736619033668224 -0.08143031150805596 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0905102355569805 1.1552236448818134 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -2 -14)
"cameras/drone/drone0" SET Transform localScale (0.8881823287846635 0.8881823287846635 0.8881823287846635)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 20 10)
"cameras/drone/drone1" SET Transform localScale (1.4239782081071546 1.4239782081071546 1.4239782081071546)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8051820692715825 0)
"cameras" SET Transform eulerAngles (-10.34393560978697 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6043298826102041
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5494723300536393
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14328989401526648
"cameras/drone/drone0" SET Transform localPosition (-1.0606799880954394 0.17075415880706707 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0806230571228486 1.0205168981181967 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -1 2)
"cameras/drone/drone0" SET Transform localScale (0.8503157194535887 0.8503157194535887 0.8503157194535887)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -6 -17)
"cameras/drone/drone1" SET Transform localScale (0.7841996634853332 0.7841996634853332 0.7841996634853332)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.111082488683694 0)
"cameras" SET Transform eulerAngles (16.8144775959642 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7680088825181226
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5476359765830527
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.061812042101479836
"cameras/drone/drone0" SET Transform localPosition (0.32883399804992575 0.38247231405621634 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.062475329301802995 1.1486651594156965 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 0 -11)
"cameras/drone/drone0" SET Transform localScale (1.0232391837043355 1.0232391837043355 1.0232391837043355)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -16 16)
"cameras/drone/drone1" SET Transform localScale (1.454870136284693 1.454870136284693 1.454870136284693)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3024469364436144 0)
"cameras" SET Transform eulerAngles (-6.71032347201686 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5559788418378073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.722600139182032
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30036431053807416
"cameras/drone/drone0" SET Transform localPosition (-0.6136766149263829 -0.04293444817565789 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1766273560110592 1.1507530985537273 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -20 -15)
"cameras/drone/drone0" SET Transform localScale (1.4332184654480828 1.4332184654480828 1.4332184654480828)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 17 19)
"cameras/drone/drone1" SET Transform localScale (1.3355307234260108 1.3355307234260108 1.3355307234260108)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7635305006944755 0)
"cameras" SET Transform eulerAngles (11.884198967815646 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4298306532816252
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4194442855807354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1753143203736381
"cameras/drone/drone0" SET Transform localPosition (0.7337414761751933 -0.14717348387451507 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6962882454603283 0.9113982155473372 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 9 -16)
"cameras/drone/drone0" SET Transform localScale (1.160928724629483 1.160928724629483 1.160928724629483)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -12 13)
"cameras/drone/drone1" SET Transform localScale (1.0177045535329685 1.0177045535329685 1.0177045535329685)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1382505282563775 0)
"cameras" SET Transform eulerAngles (-9.789507590943852 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.424202749461915
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6077660961301268
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21500425623526717
"cameras/drone/drone0" SET Transform localPosition (0.9425248668599078 0.6813746615064336 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.114480234203391 0.9335142929231417 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -4 -1)
"cameras/drone/drone0" SET Transform localScale (1.3902130188099626 1.3902130188099626 1.3902130188099626)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 8 1)
"cameras/drone/drone1" SET Transform localScale (0.8037864876598682 0.8037864876598682 0.8037864876598682)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.793006886200183 0)
"cameras" SET Transform eulerAngles (16.302896989994686 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7977328417548633
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8903121247900982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2799236750961156
"cameras/drone/drone0" SET Transform localPosition (0.16834674064584298 0.42585266174094544 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8251072913733923 1.0742088041679378 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 18 -15)
"cameras/drone/drone0" SET Transform localScale (0.7396385394141356 0.7396385394141356 0.7396385394141356)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -16 11)
"cameras/drone/drone1" SET Transform localScale (1.148400533636067 1.148400533636067 1.148400533636067)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.824897627867994 0)
"cameras" SET Transform eulerAngles (-8.28521368686831 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1308088635597082
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7895047948037666
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24061416690162282
"cameras/drone/drone0" SET Transform localPosition (-0.3049886887824099 0.0982360826900725 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.16326350137058543 1.0832663939803506 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 11 4)
"cameras/drone/drone0" SET Transform localScale (1.0822591086930942 1.0822591086930942 1.0822591086930942)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 11 -11)
"cameras/drone/drone1" SET Transform localScale (0.6435520847295508 0.6435520847295508 0.6435520847295508)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.132579616635906 0)
"cameras" SET Transform eulerAngles (-9.599939528652385 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4812921365133875
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3196097169473968
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2234818042519339
"cameras/drone/drone0" SET Transform localPosition (-0.1661389397811568 0.24517441731719108 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1037547914901986 0.8013682865261706 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -17 -11)
"cameras/drone/drone0" SET Transform localScale (0.6872933702606153 0.6872933702606153 0.6872933702606153)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -8 -13)
"cameras/drone/drone1" SET Transform localScale (1.3041931561553972 1.3041931561553972 1.3041931561553972)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.230190878688946 0)
"cameras" SET Transform eulerAngles (16.663684103287565 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6296784946031619
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4006367569962537
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01005069385578934
"cameras/drone/drone0" SET Transform localPosition (0.03059109376556246 -0.012134220206848678 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.13731393059631825 1.254458437493128 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 11 -5)
"cameras/drone/drone0" SET Transform localScale (0.9060214606579573 0.9060214606579573 0.9060214606579573)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -1 -18)
"cameras/drone/drone1" SET Transform localScale (1.053911618372255 1.053911618372255 1.053911618372255)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.632605983451085 0)
"cameras" SET Transform eulerAngles (-10.408497280004049 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.384988443926869
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6770279991995327
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16862302248864222
"cameras/drone/drone0" SET Transform localPosition (-0.24510991506075785 -0.1566855792218828 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6440622298026566 0.9447672231446009 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -5 -9)
"cameras/drone/drone0" SET Transform localScale (0.6423714035899156 0.6423714035899156 0.6423714035899156)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -17 -13)
"cameras/drone/drone1" SET Transform localScale (0.6295474071867974 0.6295474071867974 0.6295474071867974)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6836391741831034 0)
"cameras" SET Transform eulerAngles (14.911999331081176 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8433501386606279
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9237055909446599
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.021237682020590176
"cameras/drone/drone0" SET Transform localPosition (-0.15190110272538404 -0.021734052956855876 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1005362787782382 1.204769637104914 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -15 -4)
"cameras/drone/drone0" SET Transform localScale (1.1549889884319864 1.1549889884319864 1.1549889884319864)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -4 10)
"cameras/drone/drone1" SET Transform localScale (1.2146488286983381 1.2146488286983381 1.2146488286983381)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.808915154610421 0)
"cameras" SET Transform eulerAngles (8.571826499062315 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5782769439122281
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9483688905307142
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.006036213091471377
"cameras/drone/drone0" SET Transform localPosition (0.48675612896902676 0.01311764563832235 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12212691826420374 1.0594280118534747 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 14 -3)
"cameras/drone/drone0" SET Transform localScale (1.3328451020382 1.3328451020382 1.3328451020382)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 9 -2)
"cameras/drone/drone1" SET Transform localScale (1.0432324905462091 1.0432324905462091 1.0432324905462091)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6023013074889274 0)
"cameras" SET Transform eulerAngles (5.094605665852555 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3325856115213042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1901926515900954
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.058813837681176075
"cameras/drone/drone0" SET Transform localPosition (-0.25572043460062466 -0.26770420221510255 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.660127531115706 0.8745389985216945 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -17 0)
"cameras/drone/drone0" SET Transform localScale (1.1599063184766627 1.1599063184766627 1.1599063184766627)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -8 -14)
"cameras/drone/drone1" SET Transform localScale (1.1115513044960383 1.1115513044960383 1.1115513044960383)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.569693490677989 0)
"cameras" SET Transform eulerAngles (12.042617529734294 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3935177868244346
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5732645917609462
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27608389034278147
"cameras/drone/drone0" SET Transform localPosition (0.7957653205141619 -0.0983392029368318 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0179148337977921 1.278610595780258 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 6 0)
"cameras/drone/drone0" SET Transform localScale (0.7458386855575734 0.7458386855575734 0.7458386855575734)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -9 12)
"cameras/drone/drone1" SET Transform localScale (1.1250551110148181 1.1250551110148181 1.1250551110148181)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.347150663903623 0)
"cameras" SET Transform eulerAngles (-9.906572566718438 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2792976125661575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.644887700839456
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06794799826787945
"cameras/drone/drone0" SET Transform localPosition (-0.7238552490730938 0.6515549025006995 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0116948936279218 0.8156349057698601 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -19 -17)
"cameras/drone/drone0" SET Transform localScale (0.6070010110493131 0.6070010110493131 0.6070010110493131)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 5 -5)
"cameras/drone/drone1" SET Transform localScale (1.3541954989084484 1.3541954989084484 1.3541954989084484)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.225326578460656 0)
"cameras" SET Transform eulerAngles (-3.6775403290764714 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.235728473585878
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7580789835977995
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.028279113222372
"cameras/drone/drone0" SET Transform localPosition (1.062793874558967 -0.042958166778511664 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5272032159413698 1.2467832666821674 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 12 -17)
"cameras/drone/drone0" SET Transform localScale (1.141394889014887 1.141394889014887 1.141394889014887)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 2 12)
"cameras/drone/drone1" SET Transform localScale (1.440313212652323 1.440313212652323 1.440313212652323)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.756399501306638 0)
"cameras" SET Transform eulerAngles (14.475874046887988 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8708845226160038
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.930375108690659
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12088110026643283
"cameras/drone/drone0" SET Transform localPosition (-0.2581887782617234 0.6006534320956807 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.28117835801400726 1.2450549879683377 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 7 7)
"cameras/drone/drone0" SET Transform localScale (1.1192840186146142 1.1192840186146142 1.1192840186146142)
"cameras/drone/drone1" SET Transform localEulerAngles (5 11 -19)
"cameras/drone/drone1" SET Transform localScale (0.7374868875977817 0.7374868875977817 0.7374868875977817)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.494635573897749 0)
"cameras" SET Transform eulerAngles (14.229077917651644 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5881679172255787
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.243540263579898
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3342413646849123
"cameras/drone/drone0" SET Transform localPosition (-0.46857752554814847 0.6021238684387398 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.629098985917898 1.2261466587254986 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 7 -16)
"cameras/drone/drone0" SET Transform localScale (1.2124638799487055 1.2124638799487055 1.2124638799487055)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -4 3)
"cameras/drone/drone1" SET Transform localScale (1.3721407038606168 1.3721407038606168 1.3721407038606168)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.398639419576505 0)
"cameras" SET Transform eulerAngles (-1.2818019715512392 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6817420970017023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3376709771929705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12065112980776177
"cameras/drone/drone0" SET Transform localPosition (-0.4140185327241137 0.4921543945552576 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.030930188685959203 0.818987973879771 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 0 4)
"cameras/drone/drone0" SET Transform localScale (0.9340639666712099 0.9340639666712099 0.9340639666712099)
"cameras/drone/drone1" SET Transform localEulerAngles (17 14 -20)
"cameras/drone/drone1" SET Transform localScale (1.382263463576952 1.382263463576952 1.382263463576952)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.923932639049017 0)
"cameras" SET Transform eulerAngles (14.806353886205905 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2065875382507036
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.342274657690073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.034917471440176366
"cameras/drone/drone0" SET Transform localPosition (-0.30477518926487357 -0.03987331562393964 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.153905236360685 0.8974513256259085 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -20 -10)
"cameras/drone/drone0" SET Transform localScale (1.3078680623276773 1.3078680623276773 1.3078680623276773)
"cameras/drone/drone1" SET Transform localEulerAngles (0 7 -3)
"cameras/drone/drone1" SET Transform localScale (1.0736962871694637 1.0736962871694637 1.0736962871694637)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.035059970940768 0)
"cameras" SET Transform eulerAngles (7.118071986060567 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.553634269897424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1356885866452262
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33160337861250205
"cameras/drone/drone0" SET Transform localPosition (-0.7680964526837577 0.5984450743054277 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.063784945616505 0.8070210149134249 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -17 5)
"cameras/drone/drone0" SET Transform localScale (1.37826416544139 1.37826416544139 1.37826416544139)
"cameras/drone/drone1" SET Transform localEulerAngles (18 10 17)
"cameras/drone/drone1" SET Transform localScale (0.8819857216999512 0.8819857216999512 0.8819857216999512)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.227450615812419 0)
"cameras" SET Transform eulerAngles (-15.34565177554236 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6970046419917504
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4791083859922427
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39449440633560584
"cameras/drone/drone0" SET Transform localPosition (-0.2710782306443196 0.591969223271374 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3313584634058918 1.0620154681569756 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 1 -5)
"cameras/drone/drone0" SET Transform localScale (0.9497157143989654 0.9497157143989654 0.9497157143989654)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -15 3)
"cameras/drone/drone1" SET Transform localScale (1.0148631499727956 1.0148631499727956 1.0148631499727956)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.665358289561374 0)
"cameras" SET Transform eulerAngles (-10.632337068511406 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8155893526428277
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.198768444214818
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23363881411711876
"cameras/drone/drone0" SET Transform localPosition (-1.0108105104275367 0.46030339973063367 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19068787302467016 1.004474667015398 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 12 -15)
"cameras/drone/drone0" SET Transform localScale (1.2390780008585407 1.2390780008585407 1.2390780008585407)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -18 -12)
"cameras/drone/drone1" SET Transform localScale (1.3366690908175678 1.3366690908175678 1.3366690908175678)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.890781791680819 0)
"cameras" SET Transform eulerAngles (10.066891416024752 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5154115520393665
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1603296830491847
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03062687530436139
"cameras/drone/drone0" SET Transform localPosition (-1.0757324135312225 0.25149358095205415 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.00039986580434936414 1.0174359708337664 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -1 6)
"cameras/drone/drone0" SET Transform localScale (1.0295141219912423 1.0295141219912423 1.0295141219912423)
"cameras/drone/drone1" SET Transform localEulerAngles (9 13 3)
"cameras/drone/drone1" SET Transform localScale (1.1557667645769412 1.1557667645769412 1.1557667645769412)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9469586781425834 0)
"cameras" SET Transform eulerAngles (17.92238917044638 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1337891861450613
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9979809579858533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24406527967440664
"cameras/drone/drone0" SET Transform localPosition (1.1041973499754942 -0.22868954553641868 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.24903147963508987 1.2975229734545792 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 5 8)
"cameras/drone/drone0" SET Transform localScale (0.6427336089339738 0.6427336089339738 0.6427336089339738)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 3 5)
"cameras/drone/drone1" SET Transform localScale (1.1413198770200403 1.1413198770200403 1.1413198770200403)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.563807057572438 0)
"cameras" SET Transform eulerAngles (17.126186820376503 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3699458057477398
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8591788255600785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.288148760200345
"cameras/drone/drone0" SET Transform localPosition (0.15246393180841045 -0.06265536085587803 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0727228082231555 1.2669353369244116 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 18 15)
"cameras/drone/drone0" SET Transform localScale (0.8187024757129313 0.8187024757129313 0.8187024757129313)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -3 6)
"cameras/drone/drone1" SET Transform localScale (0.9613526166134796 0.9613526166134796 0.9613526166134796)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.712661722468231 0)
"cameras" SET Transform eulerAngles (12.550706547145566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4141153036237757
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6252739333496034
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10170190148469214
"cameras/drone/drone0" SET Transform localPosition (0.5516102426163307 -0.008799109097921198 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18585400419144849 1.0830895948498425 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 20 3)
"cameras/drone/drone0" SET Transform localScale (1.3117331661796685 1.3117331661796685 1.3117331661796685)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -16 1)
"cameras/drone/drone1" SET Transform localScale (0.6773552840402925 0.6773552840402925 0.6773552840402925)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1489890172470725 0)
"cameras" SET Transform eulerAngles (8.650080998763364 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.207363740716608
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.154898944859016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21238299373327185
"cameras/drone/drone0" SET Transform localPosition (0.8469000801648392 0.05087122433126162 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.46410900657479304 0.8475016797839469 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 4 12)
"cameras/drone/drone0" SET Transform localScale (1.2464892978564879 1.2464892978564879 1.2464892978564879)
"cameras/drone/drone1" SET Transform localEulerAngles (19 20 -12)
"cameras/drone/drone1" SET Transform localScale (0.874807019101598 0.874807019101598 0.874807019101598)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.299783382758044 0)
"cameras" SET Transform eulerAngles (5.836145754309353 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1467678702951403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.428289232909556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22125372018140516
"cameras/drone/drone0" SET Transform localPosition (-1.100701379712877 0.6302155150853772 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7450571495549332 1.284359992228615 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 17 9)
"cameras/drone/drone0" SET Transform localScale (1.3037086553270925 1.3037086553270925 1.3037086553270925)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 6 -20)
"cameras/drone/drone1" SET Transform localScale (1.1118011139513357 1.1118011139513357 1.1118011139513357)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.905049149167504 0)
"cameras" SET Transform eulerAngles (-13.171500632055814 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.560355075078793
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.740893692135006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3809538361409759
"cameras/drone/drone0" SET Transform localPosition (-0.7595695145718067 -0.18329916502863836 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5536217339889108 0.9902544255670438 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -18 15)
"cameras/drone/drone0" SET Transform localScale (0.9609900532219844 0.9609900532219844 0.9609900532219844)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 1 -4)
"cameras/drone/drone1" SET Transform localScale (1.429807153628825 1.429807153628825 1.429807153628825)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.809244126333824 0)
"cameras" SET Transform eulerAngles (9.402179511037403 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.21988732908572
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0442637973150866
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01213830560048832
"cameras/drone/drone0" SET Transform localPosition (0.36817631952552343 0.3331236785874154 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8404789202252478 1.13930535497746 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -4 19)
"cameras/drone/drone0" SET Transform localScale (0.9385374047590429 0.9385374047590429 0.9385374047590429)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -13 7)
"cameras/drone/drone1" SET Transform localScale (0.7500440832915614 0.7500440832915614 0.7500440832915614)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.398664665056667 0)
"cameras" SET Transform eulerAngles (10.495526087663691 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4454526350938428
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0300298044963498
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3664845257810263
"cameras/drone/drone0" SET Transform localPosition (-0.6684613057032056 0.5197487696517782 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.20523728736839852 0.8548798147434664 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -9 -1)
"cameras/drone/drone0" SET Transform localScale (0.6924467978168138 0.6924467978168138 0.6924467978168138)
"cameras/drone/drone1" SET Transform localEulerAngles (8 12 17)
"cameras/drone/drone1" SET Transform localScale (0.7299027060780915 0.7299027060780915 0.7299027060780915)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.892938444647488 0)
"cameras" SET Transform eulerAngles (10.991241590571008 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2424615161145969
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1456802950945042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3999199735033809
"cameras/drone/drone0" SET Transform localPosition (-0.8968572492881943 -0.11701017648408168 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4342869571542278 0.853941071408731 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 11 16)
"cameras/drone/drone0" SET Transform localScale (1.1838271867649743 1.1838271867649743 1.1838271867649743)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -9 -8)
"cameras/drone/drone1" SET Transform localScale (0.6549607376820772 0.6549607376820772 0.6549607376820772)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.25236122990162 0)
"cameras" SET Transform eulerAngles (-2.8444439694291006 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6891777536585442
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.829202667769763
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2663620928881096
"cameras/drone/drone0" SET Transform localPosition (-1.1786751499611385 0.41051054483026655 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.14918136255832803 0.9295311916035249 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -12 10)
"cameras/drone/drone0" SET Transform localScale (1.384360915634681 1.384360915634681 1.384360915634681)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -20 3)
"cameras/drone/drone1" SET Transform localScale (1.0568481774763279 1.0568481774763279 1.0568481774763279)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.679328473116562 0)
"cameras" SET Transform eulerAngles (-0.6711744093448502 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2695765967767967
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0863636715284501
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02311700590937145
"cameras/drone/drone0" SET Transform localPosition (0.16200200536248932 -0.1236628182210115 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5230108566551138 1.1841581173702915 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 5 13)
"cameras/drone/drone0" SET Transform localScale (0.9960107443914672 0.9960107443914672 0.9960107443914672)
"cameras/drone/drone1" SET Transform localEulerAngles (13 0 -18)
"cameras/drone/drone1" SET Transform localScale (1.094706340469834 1.094706340469834 1.094706340469834)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.270372326499349 0)
"cameras" SET Transform eulerAngles (19.516494656535365 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2674051253976244
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2414373910567
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21074587033414285
"cameras/drone/drone0" SET Transform localPosition (0.6382395758534427 -0.2316038747944617 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.27772562457402716 0.9437722994088478 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -17 -20)
"cameras/drone/drone0" SET Transform localScale (1.132196661084419 1.132196661084419 1.132196661084419)
"cameras/drone/drone1" SET Transform localEulerAngles (15 7 8)
"cameras/drone/drone1" SET Transform localScale (1.4018103711626848 1.4018103711626848 1.4018103711626848)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.371987860879674 0)
"cameras" SET Transform eulerAngles (-15.490861754056171 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0363476922807626
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1409838507912333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0504030693428192
"cameras/drone/drone0" SET Transform localPosition (0.5326249705441262 0.07697788754463192 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4263595294005187 0.8074320944431295 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 16 -3)
"cameras/drone/drone0" SET Transform localScale (1.30660223657223 1.30660223657223 1.30660223657223)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -8 -6)
"cameras/drone/drone1" SET Transform localScale (0.7643188501918373 0.7643188501918373 0.7643188501918373)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.30600848446077 0)
"cameras" SET Transform eulerAngles (-2.4024836725000256 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7889094042156035
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3439329513545397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06463122687740275
"cameras/drone/drone0" SET Transform localPosition (-1.0662052912571494 0.5123393216333059 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22240123102724518 1.2916778323355957 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -2 20)
"cameras/drone/drone0" SET Transform localScale (0.9942078091665636 0.9942078091665636 0.9942078091665636)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -2 -10)
"cameras/drone/drone1" SET Transform localScale (0.893083884023389 0.893083884023389 0.893083884023389)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.704411592240632 0)
"cameras" SET Transform eulerAngles (5.020505719299475 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9902384046717085
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6808964143078533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04314482071570356
"cameras/drone/drone0" SET Transform localPosition (0.6774593981006571 0.4799297811833744 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0791656987324887 1.1914402360532834 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 2 -20)
"cameras/drone/drone0" SET Transform localScale (1.4558527005320974 1.4558527005320974 1.4558527005320974)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -7 12)
"cameras/drone/drone1" SET Transform localScale (1.2534846633297732 1.2534846633297732 1.2534846633297732)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.892919557891554 0)
"cameras" SET Transform eulerAngles (-3.68707151833965 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9032886573924557
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6372886914820894
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11364559577262288
"cameras/drone/drone0" SET Transform localPosition (-1.1732878615777371 0.6063512623591749 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06926200231178092 1.205774893428199 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -7 4)
"cameras/drone/drone0" SET Transform localScale (0.7991217768947634 0.7991217768947634 0.7991217768947634)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -7 -13)
"cameras/drone/drone1" SET Transform localScale (0.8637747005870904 0.8637747005870904 0.8637747005870904)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2219799723148306 0)
"cameras" SET Transform eulerAngles (17.84291272489711 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9762350294283083
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0867326498317278
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14826754029159006
"cameras/drone/drone0" SET Transform localPosition (-0.36697247775913344 0.5335151774123281 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17684403801837134 1.143311467527546 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 5 10)
"cameras/drone/drone0" SET Transform localScale (0.89835765382054 0.89835765382054 0.89835765382054)
"cameras/drone/drone1" SET Transform localEulerAngles (12 4 -4)
"cameras/drone/drone1" SET Transform localScale (1.2548431724134237 1.2548431724134237 1.2548431724134237)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.618493466445639 0)
"cameras" SET Transform eulerAngles (-6.848648787119135 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2685118282477794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6137266758440156
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1501483172274737
"cameras/drone/drone0" SET Transform localPosition (0.5830249080461121 -0.04869398613913184 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1628712082239383 0.9989154560600192 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -6 -11)
"cameras/drone/drone0" SET Transform localScale (1.173345073446709 1.173345073446709 1.173345073446709)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -13 8)
"cameras/drone/drone1" SET Transform localScale (0.957938741945149 0.957938741945149 0.957938741945149)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4964556151792245 0)
"cameras" SET Transform eulerAngles (-11.227823144289392 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2860198200312616
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4418724429495589
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36808494339327186
"cameras/drone/drone0" SET Transform localPosition (-0.6506937890905015 -0.08354685423174962 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0567848781705338 0.8945999480197011 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 20 -4)
"cameras/drone/drone0" SET Transform localScale (1.3613443760491055 1.3613443760491055 1.3613443760491055)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -5 9)
"cameras/drone/drone1" SET Transform localScale (0.7860456434777541 0.7860456434777541 0.7860456434777541)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.234527739589845 0)
"cameras" SET Transform eulerAngles (-12.330250927835685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4705509613003579
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8594280946295654
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11343262831351342
"cameras/drone/drone0" SET Transform localPosition (-0.15366074844134392 -0.12989676486159413 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.888237440765647 1.2205347895913718 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -14 5)
"cameras/drone/drone0" SET Transform localScale (0.7630331230734455 0.7630331230734455 0.7630331230734455)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -14 -20)
"cameras/drone/drone1" SET Transform localScale (0.8851067338190572 0.8851067338190572 0.8851067338190572)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8852321073397205 0)
"cameras" SET Transform eulerAngles (-9.383579779140963 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.869233627552062
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3504136858652465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20813789033806854
"cameras/drone/drone0" SET Transform localPosition (0.5406849260500599 0.018176271861296278 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3527324851832966 0.8748120444451577 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 18 -20)
"cameras/drone/drone0" SET Transform localScale (1.316018982667783 1.316018982667783 1.316018982667783)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -3 -20)
"cameras/drone/drone1" SET Transform localScale (0.9674383863468028 0.9674383863468028 0.9674383863468028)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4908318205555053 0)
"cameras" SET Transform eulerAngles (-19.89847057519237 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1604206824965084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9025067248107828
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38701286390420236
"cameras/drone/drone0" SET Transform localPosition (-0.9442927356234898 0.4740153721918317 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5955877350005343 1.0373073814658933 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -13 17)
"cameras/drone/drone0" SET Transform localScale (1.2699111547233914 1.2699111547233914 1.2699111547233914)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -19 18)
"cameras/drone/drone1" SET Transform localScale (0.7349710884073497 0.7349710884073497 0.7349710884073497)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.102629003080194 0)
"cameras" SET Transform eulerAngles (-5.640945205691015 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2428415785529645
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1818129602694392
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.292042848946413
"cameras/drone/drone0" SET Transform localPosition (0.39914465763346096 0.07132478943795734 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4393388418439519 0.9456141283277748 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -12 6)
"cameras/drone/drone0" SET Transform localScale (1.2302871740399461 1.2302871740399461 1.2302871740399461)
"cameras/drone/drone1" SET Transform localEulerAngles (3 4 -19)
"cameras/drone/drone1" SET Transform localScale (1.0658677497811413 1.0658677497811413 1.0658677497811413)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5966582701519716 0)
"cameras" SET Transform eulerAngles (18.057934799400314 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6873836805293576
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2124451807997851
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30475868736061007
"cameras/drone/drone0" SET Transform localPosition (-0.9356100845996109 0.6379955986756247 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.18552184127527416 1.0886645906981625 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -6 20)
"cameras/drone/drone0" SET Transform localScale (1.3328978905087308 1.3328978905087308 1.3328978905087308)
"cameras/drone/drone1" SET Transform localEulerAngles (5 7 7)
"cameras/drone/drone1" SET Transform localScale (0.7924522916907224 0.7924522916907224 0.7924522916907224)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.159885374241406 0)
"cameras" SET Transform eulerAngles (3.0852596611666243 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6616016244132819
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4270042778707406
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29764429568312617
"cameras/drone/drone0" SET Transform localPosition (-0.8666163591198747 0.3804269760659495 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6707444043695776 1.1732055919731577 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -12 9)
"cameras/drone/drone0" SET Transform localScale (1.1419738874410192 1.1419738874410192 1.1419738874410192)
"cameras/drone/drone1" SET Transform localEulerAngles (9 11 -8)
"cameras/drone/drone1" SET Transform localScale (1.1494044576305782 1.1494044576305782 1.1494044576305782)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7618431228782807 0)
"cameras" SET Transform eulerAngles (-12.341360219540496 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.000247307784533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9874399540461494
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2382787767468166
"cameras/drone/drone0" SET Transform localPosition (0.9656905610943685 0.264564068007149 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9418827971943367 0.8193721821869764 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -7 -5)
"cameras/drone/drone0" SET Transform localScale (1.0235301712154339 1.0235301712154339 1.0235301712154339)
"cameras/drone/drone1" SET Transform localEulerAngles (1 19 -8)
"cameras/drone/drone1" SET Transform localScale (0.6437894898733797 0.6437894898733797 0.6437894898733797)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0556582627243465 0)
"cameras" SET Transform eulerAngles (-1.0982209984621285 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4390129717581863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7357553214671793
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.322311912877908
"cameras/drone/drone0" SET Transform localPosition (0.5666300118075713 0.17201617268928676 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.02546176103229203 1.0520505168288246 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 11 -10)
"cameras/drone/drone0" SET Transform localScale (0.9820528144466021 0.9820528144466021 0.9820528144466021)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -9 0)
"cameras/drone/drone1" SET Transform localScale (0.8862212257820861 0.8862212257820861 0.8862212257820861)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.006018355263053 0)
"cameras" SET Transform eulerAngles (17.074235514903762 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48906709030836987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.247366863119071
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3596913908838084
"cameras/drone/drone0" SET Transform localPosition (0.04593317301234778 0.6602264605929051 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1982366448133015 1.2943177576015183 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 4 -13)
"cameras/drone/drone0" SET Transform localScale (0.8505798178157855 0.8505798178157855 0.8505798178157855)
"cameras/drone/drone1" SET Transform localEulerAngles (17 14 -14)
"cameras/drone/drone1" SET Transform localScale (1.3592165268819913 1.3592165268819913 1.3592165268819913)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.541360154818426 0)
"cameras" SET Transform eulerAngles (-3.7271038551654776 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3679571661815813
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.009594644006074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03779726277595655
"cameras/drone/drone0" SET Transform localPosition (-0.46453718761619456 0.013114322053927874 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6609931697458403 1.282047372551169 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 10 -9)
"cameras/drone/drone0" SET Transform localScale (0.8684981150552773 0.8684981150552773 0.8684981150552773)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 11 2)
"cameras/drone/drone1" SET Transform localScale (0.8108600640482115 0.8108600640482115 0.8108600640482115)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.025968428031862 0)
"cameras" SET Transform eulerAngles (18.291603140025096 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8039840933726683
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2552002249432936
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09195767403580546
"cameras/drone/drone0" SET Transform localPosition (0.3135233818301344 0.014215168952680879 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1313276342791034 0.9552805385777763 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -9 -9)
"cameras/drone/drone0" SET Transform localScale (0.812714164473813 0.812714164473813 0.812714164473813)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -17 -16)
"cameras/drone/drone1" SET Transform localScale (0.8820327920032414 0.8820327920032414 0.8820327920032414)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5900902158218684 0)
"cameras" SET Transform eulerAngles (-1.7479054881426812 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.342142019292309
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9464379551840318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19267470343240883
"cameras/drone/drone0" SET Transform localPosition (-0.7418930659580556 0.07597972436861095 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6604685093900782 1.163362734269901 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 15 -15)
"cameras/drone/drone0" SET Transform localScale (0.7335982620270886 0.7335982620270886 0.7335982620270886)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 10 -15)
"cameras/drone/drone1" SET Transform localScale (1.1520420746974933 1.1520420746974933 1.1520420746974933)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.095221861294139 0)
"cameras" SET Transform eulerAngles (12.821767964646064 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6647021503590614
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6432852340454942
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2994655200783779
"cameras/drone/drone0" SET Transform localPosition (-0.2831571101554462 0.6881471831869175 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.02932756958066 0.8904191738038643 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -2 2)
"cameras/drone/drone0" SET Transform localScale (1.2635055977652967 1.2635055977652967 1.2635055977652967)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 1 3)
"cameras/drone/drone1" SET Transform localScale (0.6655269533530144 0.6655269533530144 0.6655269533530144)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.941041804365716 0)
"cameras" SET Transform eulerAngles (7.958844963500464 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.594194884951124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4108187432824897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30463478188842713
"cameras/drone/drone0" SET Transform localPosition (-0.3440601987024119 0.5126465765483221 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.30279649196691594 1.1883259468001417 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 0 11)
"cameras/drone/drone0" SET Transform localScale (0.9965424472737238 0.9965424472737238 0.9965424472737238)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 16 -17)
"cameras/drone/drone1" SET Transform localScale (0.6619150160946572 0.6619150160946572 0.6619150160946572)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3239653596268433 0)
"cameras" SET Transform eulerAngles (5.4123317414303465 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6062979508316674
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9886131424231617
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2543433352732967
"cameras/drone/drone0" SET Transform localPosition (0.3802123524802903 0.44200089843589646 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6458524780870836 0.8696674130205253 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -1 11)
"cameras/drone/drone0" SET Transform localScale (1.1692777662704756 1.1692777662704756 1.1692777662704756)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -14 9)
"cameras/drone/drone1" SET Transform localScale (1.4871381405299497 1.4871381405299497 1.4871381405299497)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.488406563407071 0)
"cameras" SET Transform eulerAngles (14.987253884393695 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9831595950001848
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.63436305470978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.049032087640776205
"cameras/drone/drone0" SET Transform localPosition (-0.3557854871201256 0.5221763685111354 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5045836402137296 0.8436047224412511 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 16 -4)
"cameras/drone/drone0" SET Transform localScale (0.7773365887106531 0.7773365887106531 0.7773365887106531)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -6 18)
"cameras/drone/drone1" SET Transform localScale (1.009450153877282 1.009450153877282 1.009450153877282)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2795851529770426 0)
"cameras" SET Transform eulerAngles (-10.324493468358348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4697065391369274
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5506155545339801
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32168161428517017
"cameras/drone/drone0" SET Transform localPosition (-0.5529254835129465 0.24732730143259668 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5063908230712869 1.24073561277985 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -2 -11)
"cameras/drone/drone0" SET Transform localScale (1.0105781993459195 1.0105781993459195 1.0105781993459195)
"cameras/drone/drone1" SET Transform localEulerAngles (8 16 -18)
"cameras/drone/drone1" SET Transform localScale (1.2362103239792779 1.2362103239792779 1.2362103239792779)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.192039612789992 0)
"cameras" SET Transform eulerAngles (6.379534854755899 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1761047359223442
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2600142755321664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3603536104087969
"cameras/drone/drone0" SET Transform localPosition (0.15412068398882584 -0.1045391821327118 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1565091575185591 1.214412535345624 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 10 -19)
"cameras/drone/drone0" SET Transform localScale (1.1456564572954058 1.1456564572954058 1.1456564572954058)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -5 -20)
"cameras/drone/drone1" SET Transform localScale (0.8611420774195229 0.8611420774195229 0.8611420774195229)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.01939989357419 0)
"cameras" SET Transform eulerAngles (7.21222237698532 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9434427487003322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9620993996471943
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3469036162586382
"cameras/drone/drone0" SET Transform localPosition (-0.2316400680956039 -0.24819945200319954 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1140312216866948 1.1246940521228241 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -19 -7)
"cameras/drone/drone0" SET Transform localScale (0.6743547305875786 0.6743547305875786 0.6743547305875786)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -19 0)
"cameras/drone/drone1" SET Transform localScale (0.9720804741545434 0.9720804741545434 0.9720804741545434)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.930733767710784 0)
"cameras" SET Transform eulerAngles (-1.4602136392646123 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8234450494775953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1836033120065337
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.281194012004142
"cameras/drone/drone0" SET Transform localPosition (0.6929778502346764 0.44476188661529387 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1967352470038988 1.0492748930137235 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -3 -20)
"cameras/drone/drone0" SET Transform localScale (1.083238303666907 1.083238303666907 1.083238303666907)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -19 0)
"cameras/drone/drone1" SET Transform localScale (1.106249209599516 1.106249209599516 1.106249209599516)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9064215193609977 0)
"cameras" SET Transform eulerAngles (-1.8348757497449775 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7087925146700447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8688433315836892
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09432988452330071
"cameras/drone/drone0" SET Transform localPosition (0.9281030172131313 0.5363776290174767 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0633235315860439 1.2846372792091985 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 13 -1)
"cameras/drone/drone0" SET Transform localScale (1.4327994953872183 1.4327994953872183 1.4327994953872183)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 0 16)
"cameras/drone/drone1" SET Transform localScale (0.6410079021252189 0.6410079021252189 0.6410079021252189)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.963766388109251 0)
"cameras" SET Transform eulerAngles (-0.27721464041538013 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5149298080302092
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8548154064299949
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3398446837332102
"cameras/drone/drone0" SET Transform localPosition (0.7865713969127013 0.055178443971701185 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8907786385425844 1.2773615534943068 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 0 1)
"cameras/drone/drone0" SET Transform localScale (0.8345707623948274 0.8345707623948274 0.8345707623948274)
"cameras/drone/drone1" SET Transform localEulerAngles (7 9 3)
"cameras/drone/drone1" SET Transform localScale (1.0557873371232236 1.0557873371232236 1.0557873371232236)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.459295404632417 0)
"cameras" SET Transform eulerAngles (5.975626356125311 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9947027254616557
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.464179967533835
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09945350031043527
"cameras/drone/drone0" SET Transform localPosition (0.3104060747668864 -0.08888823666755036 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.43679919482240115 1.062600062579577 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 5 -5)
"cameras/drone/drone0" SET Transform localScale (1.4455771387577863 1.4455771387577863 1.4455771387577863)
"cameras/drone/drone1" SET Transform localEulerAngles (14 17 -3)
"cameras/drone/drone1" SET Transform localScale (0.907516237115578 0.907516237115578 0.907516237115578)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.854653666017054 0)
"cameras" SET Transform eulerAngles (17.55521187143158 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8178198629044435
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9542946296326247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20427084191525952
"cameras/drone/drone0" SET Transform localPosition (1.066737993311148 -0.1287343622228792 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4893236102739891 1.051110949426704 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 18 10)
"cameras/drone/drone0" SET Transform localScale (0.7305692791626847 0.7305692791626847 0.7305692791626847)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -8 -10)
"cameras/drone/drone1" SET Transform localScale (0.8609587493591943 0.8609587493591943 0.8609587493591943)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.769261589635164 0)
"cameras" SET Transform eulerAngles (0.9734190823995057 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5003579552909496
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4869008290720482
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09553880377428739
"cameras/drone/drone0" SET Transform localPosition (-0.19920588903214953 -0.0006040011473126827 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.39554190494927266 1.0577992802614915 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -17 -1)
"cameras/drone/drone0" SET Transform localScale (0.7194178883868415 0.7194178883868415 0.7194178883868415)
"cameras/drone/drone1" SET Transform localEulerAngles (5 19 -6)
"cameras/drone/drone1" SET Transform localScale (1.2820324097203366 1.2820324097203366 1.2820324097203366)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7760480314253044 0)
"cameras" SET Transform eulerAngles (17.48479713508499 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4663894801351163
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5433171177076388
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.190927851755119
"cameras/drone/drone0" SET Transform localPosition (-0.5481435041951159 0.5141695416413028 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8651211242230745 1.1619272581049345 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 20 14)
"cameras/drone/drone0" SET Transform localScale (0.8559440198023432 0.8559440198023432 0.8559440198023432)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -16 -2)
"cameras/drone/drone1" SET Transform localScale (1.4391337269581306 1.4391337269581306 1.4391337269581306)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0027435820847694 0)
"cameras" SET Transform eulerAngles (1.4606351110747262 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8177187345082122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9969146749554603
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3542183165235998
"cameras/drone/drone0" SET Transform localPosition (0.6332439919882717 -0.2232484547971188 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7866567298383187 0.9843226924654225 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 16 -12)
"cameras/drone/drone0" SET Transform localScale (1.3855262281971297 1.3855262281971297 1.3855262281971297)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -5 -13)
"cameras/drone/drone1" SET Transform localScale (1.4680172183173004 1.4680172183173004 1.4680172183173004)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.210557400789863 0)
"cameras" SET Transform eulerAngles (-3.910814975935949 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.201192671001034
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5067049961867314
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10944820789394259
"cameras/drone/drone0" SET Transform localPosition (0.15841481466457052 0.1477684981150587 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6926845683055426 0.8263287913508197 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 6 13)
"cameras/drone/drone0" SET Transform localScale (1.4456103167141487 1.4456103167141487 1.4456103167141487)
"cameras/drone/drone1" SET Transform localEulerAngles (5 9 10)
"cameras/drone/drone1" SET Transform localScale (0.9734136621417502 0.9734136621417502 0.9734136621417502)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 76
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.6958318941306283 0)
"cameras" SET Transform eulerAngles (17.33733697363236 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0268802626117597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.162145528474602
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09610952737139225
"cameras/drone/drone0" SET Transform localPosition (0.5295870000578038 -0.20350648532611232 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.22860597338697375 1.201518218931165 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -12 -6)
"cameras/drone/drone0" SET Transform localScale (0.605360443742978 0.605360443742978 0.605360443742978)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -14 11)
"cameras/drone/drone1" SET Transform localScale (1.2245815979396593 1.2245815979396593 1.2245815979396593)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.335005344109155 0)
"cameras" SET Transform eulerAngles (0.05166245925799018 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.412022547219728
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8529170679199838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06662885747295402
"cameras/drone/drone0" SET Transform localPosition (-0.49361045720585084 0.26840377134678944 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7280305098762203 1.0534427582508883 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -11 -7)
"cameras/drone/drone0" SET Transform localScale (0.998153586994226 0.998153586994226 0.998153586994226)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 12 17)
"cameras/drone/drone1" SET Transform localScale (0.8671147645599653 0.8671147645599653 0.8671147645599653)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2471827577075265 0)
"cameras" SET Transform eulerAngles (-10.777180468939328 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4565246728299988
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.692908135679045
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3056544543734482
"cameras/drone/drone0" SET Transform localPosition (0.9000480762300691 0.31697007267039307 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1603478034609604 1.096222043799214 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -18 -18)
"cameras/drone/drone0" SET Transform localScale (1.2719885030095834 1.2719885030095834 1.2719885030095834)
"cameras/drone/drone1" SET Transform localEulerAngles (19 4 -11)
"cameras/drone/drone1" SET Transform localScale (1.4526628734131974 1.4526628734131974 1.4526628734131974)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2426630902962135 0)
"cameras" SET Transform eulerAngles (-7.280076411014566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4979983109206367
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7513668967331428
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32260061399652584
"cameras/drone/drone0" SET Transform localPosition (0.19623444781087773 0.36086398628229427 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0324225603669273 0.9059014384254285 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -12 18)
"cameras/drone/drone0" SET Transform localScale (0.7603037809422577 0.7603037809422577 0.7603037809422577)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -4 -19)
"cameras/drone/drone1" SET Transform localScale (1.4757478408564442 1.4757478408564442 1.4757478408564442)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4383821573302638 0)
"cameras" SET Transform eulerAngles (-1.3644028769274676 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.800457790858059
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2928767791730231
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.021570372392636372
"cameras/drone/drone0" SET Transform localPosition (0.8665101814596838 -0.08438821251124112 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.40609543661336067 1.1972310844466967 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -20 -12)
"cameras/drone/drone0" SET Transform localScale (1.4832274758752562 1.4832274758752562 1.4832274758752562)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -19 11)
"cameras/drone/drone1" SET Transform localScale (0.8340485355713327 0.8340485355713327 0.8340485355713327)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.23280921167029 0)
"cameras" SET Transform eulerAngles (-13.352622078284494 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2705643522616061
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1094872053329645
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26726689191368824
"cameras/drone/drone0" SET Transform localPosition (-0.41500155296524055 -0.15673625918766237 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6295225698669507 0.875460193910223 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -13 -20)
"cameras/drone/drone0" SET Transform localScale (1.3331124274394217 1.3331124274394217 1.3331124274394217)
"cameras/drone/drone1" SET Transform localEulerAngles (16 15 20)
"cameras/drone/drone1" SET Transform localScale (1.0840360728885774 1.0840360728885774 1.0840360728885774)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.126987967120057 0)
"cameras" SET Transform eulerAngles (-10.908042788338728 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1464251632421232
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.390729522327937
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2587885497685298
"cameras/drone/drone0" SET Transform localPosition (0.821817508033724 -0.10476710187274768 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0178968895314082 0.8590291011114435 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -1 7)
"cameras/drone/drone0" SET Transform localScale (0.9894743231986447 0.9894743231986447 0.9894743231986447)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -12 -19)
"cameras/drone/drone1" SET Transform localScale (0.6769559579537027 0.6769559579537027 0.6769559579537027)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.395861410102526 0)
"cameras" SET Transform eulerAngles (-19.028059643363953 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.577325362108199
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3001052426713553
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31903470789979216
"cameras/drone/drone0" SET Transform localPosition (0.569819540572372 0.18725436974654003 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7914120884479334 1.1103867103565648 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -11 5)
"cameras/drone/drone0" SET Transform localScale (1.1067612100852549 1.1067612100852549 1.1067612100852549)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -19 -6)
"cameras/drone/drone1" SET Transform localScale (0.7555774463251747 0.7555774463251747 0.7555774463251747)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.893470451252374 0)
"cameras" SET Transform eulerAngles (-13.782615731413696 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0643799765295707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6361765402483917
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.043286653793550525
"cameras/drone/drone0" SET Transform localPosition (-0.25065775035953486 0.4902669045616422 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3464806884205861 1.1487570669191274 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 15 12)
"cameras/drone/drone0" SET Transform localScale (1.2088814350529378 1.2088814350529378 1.2088814350529378)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 20 19)
"cameras/drone/drone1" SET Transform localScale (0.8136977382434862 0.8136977382434862 0.8136977382434862)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7160721551449765 0)
"cameras" SET Transform eulerAngles (0.12802299037792508 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9668992158049008
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6321304930493805
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.020625508443270137
"cameras/drone/drone0" SET Transform localPosition (0.1285399005964063 0.5700039263844403 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.058894783172329435 1.2299550679382834 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -9 -15)
"cameras/drone/drone0" SET Transform localScale (1.4177541375862917 1.4177541375862917 1.4177541375862917)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -8 1)
"cameras/drone/drone1" SET Transform localScale (0.7180985224940941 0.7180985224940941 0.7180985224940941)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.122273789629065 0)
"cameras" SET Transform eulerAngles (-19.182713125206554 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6903738207918905
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9979325578144356
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1664292503887988
"cameras/drone/drone0" SET Transform localPosition (0.13839400072896724 0.24038774846296446 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1842816681100719 1.1192532143211291 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 2 -19)
"cameras/drone/drone0" SET Transform localScale (1.3567700031325307 1.3567700031325307 1.3567700031325307)
"cameras/drone/drone1" SET Transform localEulerAngles (7 4 12)
"cameras/drone/drone1" SET Transform localScale (1.2143045988409593 1.2143045988409593 1.2143045988409593)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7097496504945755 0)
"cameras" SET Transform eulerAngles (11.570333932427094 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8872369671395928
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8959999090351127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10765154960527763
"cameras/drone/drone0" SET Transform localPosition (0.10503107119552269 -0.2822156873706723 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.39559025711225393 0.9677427204155868 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -10 -6)
"cameras/drone/drone0" SET Transform localScale (1.20176790351216 1.20176790351216 1.20176790351216)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -6 2)
"cameras/drone/drone1" SET Transform localScale (0.7909764927438712 0.7909764927438712 0.7909764927438712)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4457375555990835 0)
"cameras" SET Transform eulerAngles (-4.326715222749229 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7896926878492934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9588741097247206
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.298835975520428
"cameras/drone/drone0" SET Transform localPosition (0.7813698126995572 0.43222510518203733 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28006752381033007 1.0268858231773461 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -19 -8)
"cameras/drone/drone0" SET Transform localScale (1.462636430774558 1.462636430774558 1.462636430774558)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -6 4)
"cameras/drone/drone1" SET Transform localScale (1.0697059698808997 1.0697059698808997 1.0697059698808997)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.575573643979395 0)
"cameras" SET Transform eulerAngles (13.009763241961743 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4401860933871484
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8295519388621697
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1519026782766773
"cameras/drone/drone0" SET Transform localPosition (-0.26762480135082334 -0.06806862133421793 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6673473618422305 0.9152174369916346 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 20 2)
"cameras/drone/drone0" SET Transform localScale (1.237006890398391 1.237006890398391 1.237006890398391)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -20 -2)
"cameras/drone/drone1" SET Transform localScale (1.013556855459023 1.013556855459023 1.013556855459023)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.33832568385991 0)
"cameras" SET Transform eulerAngles (1.7434851032588128 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2325551460157902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0067215319186003
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11320529371672566
"cameras/drone/drone0" SET Transform localPosition (0.47173846368302175 -0.22417401869130776 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1624895700917455 1.0213005491686937 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 19 0)
"cameras/drone/drone0" SET Transform localScale (0.9937396284524711 0.9937396284524711 0.9937396284524711)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 15 -16)
"cameras/drone/drone1" SET Transform localScale (1.2274856624410462 1.2274856624410462 1.2274856624410462)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.337373999401471 0)
"cameras" SET Transform eulerAngles (-12.744672507041921 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6638788235884465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9656228731605978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2338574837406113
"cameras/drone/drone0" SET Transform localPosition (0.29916262307547914 -0.2889042130943876 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6610681412315367 0.9378284865461297 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -4 -10)
"cameras/drone/drone0" SET Transform localScale (1.2812761533663488 1.2812761533663488 1.2812761533663488)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -3 -18)
"cameras/drone/drone1" SET Transform localScale (1.3481854239412066 1.3481854239412066 1.3481854239412066)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.407027742320637 0)
"cameras" SET Transform eulerAngles (6.421268746021852 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1073304676167068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8983079224063584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11133220256998318
"cameras/drone/drone0" SET Transform localPosition (-0.7082194092490566 0.6186405108686166 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5736152630071776 1.1278747488946081 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 11 -18)
"cameras/drone/drone0" SET Transform localScale (1.214647692429093 1.214647692429093 1.214647692429093)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -14 -8)
"cameras/drone/drone1" SET Transform localScale (0.6159138258967922 0.6159138258967922 0.6159138258967922)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9277734589650737 0)
"cameras" SET Transform eulerAngles (4.204392747503842 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5386296256604101
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3443586330692654
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.013716842151292008
"cameras/drone/drone0" SET Transform localPosition (0.20462095319015483 -0.1546960119621697 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6193088706447517 1.1325948983673673 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 4 2)
"cameras/drone/drone0" SET Transform localScale (0.6327189032549483 0.6327189032549483 0.6327189032549483)
"cameras/drone/drone1" SET Transform localEulerAngles (4 20 -8)
"cameras/drone/drone1" SET Transform localScale (1.3076620654549962 1.3076620654549962 1.3076620654549962)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8382925078751993 0)
"cameras" SET Transform eulerAngles (16.477536530010262 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9617948548496713
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8762352829318552
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18991946249658476
"cameras/drone/drone0" SET Transform localPosition (0.11059564345163397 -0.07863790451112801 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.25155322755670206 1.1502987013946209 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 7 20)
"cameras/drone/drone0" SET Transform localScale (0.957050143747048 0.957050143747048 0.957050143747048)
"cameras/drone/drone1" SET Transform localEulerAngles (19 20 -16)
"cameras/drone/drone1" SET Transform localScale (0.6097586705174802 0.6097586705174802 0.6097586705174802)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.321895613267346 0)
"cameras" SET Transform eulerAngles (-9.413631441061149 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9498703284081692
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.558226822021822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08667772433602808
"cameras/drone/drone0" SET Transform localPosition (0.6186277130139941 0.20003868751777737 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.24990269688328792 0.9277233064162648 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -15 12)
"cameras/drone/drone0" SET Transform localScale (1.2170308728727222 1.2170308728727222 1.2170308728727222)
"cameras/drone/drone1" SET Transform localEulerAngles (3 16 -12)
"cameras/drone/drone1" SET Transform localScale (0.6151160582409894 0.6151160582409894 0.6151160582409894)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.131079672616181 0)
"cameras" SET Transform eulerAngles (-8.163147042716595 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.020551444177177
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6885444968092873
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.016037930891174446
"cameras/drone/drone0" SET Transform localPosition (-1.1873140667576418 0.38627032967688085 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5410798532401191 1.2222763113400077 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 13 -20)
"cameras/drone/drone0" SET Transform localScale (0.6482136368200764 0.6482136368200764 0.6482136368200764)
"cameras/drone/drone1" SET Transform localEulerAngles (19 17 11)
"cameras/drone/drone1" SET Transform localScale (1.2807446314769655 1.2807446314769655 1.2807446314769655)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.269298724269159 0)
"cameras" SET Transform eulerAngles (-16.52777005547729 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3315688631528806
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9144417758983465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21011504331229275
"cameras/drone/drone0" SET Transform localPosition (1.1848036877346482 0.16648954638689156 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7077365787100143 1.2621262800311244 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 1 16)
"cameras/drone/drone0" SET Transform localScale (1.4930614056556433 1.4930614056556433 1.4930614056556433)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 0 -18)
"cameras/drone/drone1" SET Transform localScale (1.3782628471155896 1.3782628471155896 1.3782628471155896)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.031515473187536 0)
"cameras" SET Transform eulerAngles (12.922016832909897 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.172674178439025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2661658437373058
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07930574439761107
"cameras/drone/drone0" SET Transform localPosition (1.0671136294386339 -0.054702723636922135 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.004788813947801618 1.025004401216337 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 20 18)
"cameras/drone/drone0" SET Transform localScale (1.39049282163533 1.39049282163533 1.39049282163533)
"cameras/drone/drone1" SET Transform localEulerAngles (13 8 6)
"cameras/drone/drone1" SET Transform localScale (1.3961392382201026 1.3961392382201026 1.3961392382201026)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.273007311821579 0)
"cameras" SET Transform eulerAngles (17.954124098606087 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5994710620353803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5636589077747165
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2192439195255238
"cameras/drone/drone0" SET Transform localPosition (1.0200388782506924 0.25597737868222864 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.160073755299759 1.1903814634732104 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -12 -7)
"cameras/drone/drone0" SET Transform localScale (1.281103913741466 1.281103913741466 1.281103913741466)
"cameras/drone/drone1" SET Transform localEulerAngles (13 4 -17)
"cameras/drone/drone1" SET Transform localScale (0.7850813571827224 0.7850813571827224 0.7850813571827224)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9910648024300928 0)
"cameras" SET Transform eulerAngles (6.884417352850836 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40856479269719115
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9232719484875802
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.038828951216411056
"cameras/drone/drone0" SET Transform localPosition (-0.1792076903193256 -0.28507075426046097 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.707457646290411 1.0938684306164252 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -9 -15)
"cameras/drone/drone0" SET Transform localScale (0.9544916119935721 0.9544916119935721 0.9544916119935721)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -7 18)
"cameras/drone/drone1" SET Transform localScale (0.9649457183654855 0.9649457183654855 0.9649457183654855)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.543486314643533 0)
"cameras" SET Transform eulerAngles (16.66804210350181 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4915272629693002
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4968460915373267
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3506446913694617
"cameras/drone/drone0" SET Transform localPosition (0.24285891448321162 0.26490951400472945 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.932776936965771 1.0032765816598315 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 16 20)
"cameras/drone/drone0" SET Transform localScale (0.6539200250367236 0.6539200250367236 0.6539200250367236)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -12 -6)
"cameras/drone/drone1" SET Transform localScale (0.7009269439850344 0.7009269439850344 0.7009269439850344)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.459280095722314 0)
"cameras" SET Transform eulerAngles (-5.443957963391899 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1351660798538794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5987749110939615
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3800654270241152
"cameras/drone/drone0" SET Transform localPosition (-0.3310167984089468 -0.2647870069070322 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7712756997166081 0.9050291041650422 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 1 1)
"cameras/drone/drone0" SET Transform localScale (1.4287850323874167 1.4287850323874167 1.4287850323874167)
"cameras/drone/drone1" SET Transform localEulerAngles (18 9 9)
"cameras/drone/drone1" SET Transform localScale (0.6097962534496353 0.6097962534496353 0.6097962534496353)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.136147813725631 0)
"cameras" SET Transform eulerAngles (-5.352321363343023 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6430816882748249
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4529428820297485
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0888459941573636
"cameras/drone/drone0" SET Transform localPosition (0.34895202770197176 0.5133021711980077 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8349385571119909 0.8860774911306459 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 9 0)
"cameras/drone/drone0" SET Transform localScale (0.8292714962666315 0.8292714962666315 0.8292714962666315)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 5 -13)
"cameras/drone/drone1" SET Transform localScale (1.365908451641284 1.365908451641284 1.365908451641284)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6554810997643106 0)
"cameras" SET Transform eulerAngles (9.847809055204767 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9096508747468777
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9124762012650527
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07021148302206433
"cameras/drone/drone0" SET Transform localPosition (-0.9438983991885597 0.13526830624553393 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.037923646470718 0.9698487657291944 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -11 2)
"cameras/drone/drone0" SET Transform localScale (1.1589037739816157 1.1589037739816157 1.1589037739816157)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -9 5)
"cameras/drone/drone1" SET Transform localScale (1.0077566908278395 1.0077566908278395 1.0077566908278395)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5416345613108735 0)
"cameras" SET Transform eulerAngles (5.364456947187563 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5131963395070925
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9108694369172086
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.023085965941604326
"cameras/drone/drone0" SET Transform localPosition (0.5304485999386439 -0.0854795243279522 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.967091819163769 1.068122333908474 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 2 16)
"cameras/drone/drone0" SET Transform localScale (1.1795850079993904 1.1795850079993904 1.1795850079993904)
"cameras/drone/drone1" SET Transform localEulerAngles (12 18 -17)
"cameras/drone/drone1" SET Transform localScale (0.7182102737681765 0.7182102737681765 0.7182102737681765)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.250385095374444 0)
"cameras" SET Transform eulerAngles (9.472866524585932 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5323595173985551
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.03004717054421
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3139684548893893
"cameras/drone/drone0" SET Transform localPosition (0.3529620466996706 -0.12380891537700794 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23198960698859117 1.1478037406646135 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -20 13)
"cameras/drone/drone0" SET Transform localScale (1.4640325754576233 1.4640325754576233 1.4640325754576233)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -15 4)
"cameras/drone/drone1" SET Transform localScale (0.927512821808946 0.927512821808946 0.927512821808946)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1752685181435156 0)
"cameras" SET Transform eulerAngles (-4.599918929435617 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2514917524782496
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7933059015091364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17757478517309414
"cameras/drone/drone0" SET Transform localPosition (-1.1542049916591492 -0.1642006361722929 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.820261881641484 0.8472366553229145 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 10 -6)
"cameras/drone/drone0" SET Transform localScale (1.0076022287924025 1.0076022287924025 1.0076022287924025)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -11 13)
"cameras/drone/drone1" SET Transform localScale (1.3245136240679576 1.3245136240679576 1.3245136240679576)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.07561147817793 0)
"cameras" SET Transform eulerAngles (-11.958553880789275 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4091396099352629
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9832516032718717
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25753901867892826
"cameras/drone/drone0" SET Transform localPosition (-0.9610343898931819 -0.06451064161332692 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.49122329267347953 1.2433166260070472 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 2 18)
"cameras/drone/drone0" SET Transform localScale (1.2250584751112765 1.2250584751112765 1.2250584751112765)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -13 -3)
"cameras/drone/drone1" SET Transform localScale (1.194639863779562 1.194639863779562 1.194639863779562)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9568555699431 0)
"cameras" SET Transform eulerAngles (-13.028024191278561 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0436921812263855
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1715194894854097
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2093732979081422
"cameras/drone/drone0" SET Transform localPosition (0.2227380908138441 0.614465608204841 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2778768307906698 0.8407970364141009 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 17 12)
"cameras/drone/drone0" SET Transform localScale (0.7047441148676239 0.7047441148676239 0.7047441148676239)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 15 -12)
"cameras/drone/drone1" SET Transform localScale (1.2131026916040835 1.2131026916040835 1.2131026916040835)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.150347371004412 0)
"cameras" SET Transform eulerAngles (-12.110147303335491 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6410260111238423
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.731064432825594
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2063180198822695
"cameras/drone/drone0" SET Transform localPosition (-0.8947140189303804 0.13765925291944509 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04462193131769521 0.9039829942842341 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -16 5)
"cameras/drone/drone0" SET Transform localScale (0.6849536276212864 0.6849536276212864 0.6849536276212864)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -18 13)
"cameras/drone/drone1" SET Transform localScale (0.6842148108025128 0.6842148108025128 0.6842148108025128)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.499504638323192 0)
"cameras" SET Transform eulerAngles (-11.896599172729907 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7238285024984346
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2970622292967495
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2487271458039021
"cameras/drone/drone0" SET Transform localPosition (0.30862678266125565 -0.03258996654905838 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8617177460039971 0.8178031736778663 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 16 12)
"cameras/drone/drone0" SET Transform localScale (1.1468007885379814 1.1468007885379814 1.1468007885379814)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -11 16)
"cameras/drone/drone1" SET Transform localScale (0.9067800100128347 0.9067800100128347 0.9067800100128347)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.096891750019553 0)
"cameras" SET Transform eulerAngles (16.364672296321004 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.284892447745494
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0228567140019467
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3153595764747042
"cameras/drone/drone0" SET Transform localPosition (-0.17060293457622944 0.004058353910141588 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7945918840839536 0.8852443921673281 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -16 -12)
"cameras/drone/drone0" SET Transform localScale (1.2913691147237303 1.2913691147237303 1.2913691147237303)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -3 4)
"cameras/drone/drone1" SET Transform localScale (1.4433559128800524 1.4433559128800524 1.4433559128800524)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4159662617097455 0)
"cameras" SET Transform eulerAngles (-15.079077803735604 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1050512270907595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5871402699727433
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2963444092345273
"cameras/drone/drone0" SET Transform localPosition (-0.768943054985395 -0.2677703017672007 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.38181746456980714 1.2362864641507678 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -16 15)
"cameras/drone/drone0" SET Transform localScale (1.0675119071565813 1.0675119071565813 1.0675119071565813)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 5 0)
"cameras/drone/drone1" SET Transform localScale (1.4567664279275148 1.4567664279275148 1.4567664279275148)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.102985127482922 0)
"cameras" SET Transform eulerAngles (-13.619962020730911 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6855449986217699
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9574395613441083
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11200518365195489
"cameras/drone/drone0" SET Transform localPosition (-0.7018885381166523 0.5910378063163213 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9226223746873886 1.13817158708032 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -8 15)
"cameras/drone/drone0" SET Transform localScale (0.9645095356178346 0.9645095356178346 0.9645095356178346)
"cameras/drone/drone1" SET Transform localEulerAngles (9 0 -11)
"cameras/drone/drone1" SET Transform localScale (1.025467199130568 1.025467199130568 1.025467199130568)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7289812971220053 0)
"cameras" SET Transform eulerAngles (-18.7610962876131 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8722448407013658
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1960744493680473
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30209916799898223
"cameras/drone/drone0" SET Transform localPosition (-0.04180733524559166 0.42684905828626746 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.010337067640227904 0.8928779964050986 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -12 0)
"cameras/drone/drone0" SET Transform localScale (0.8159425793295803 0.8159425793295803 0.8159425793295803)
"cameras/drone/drone1" SET Transform localEulerAngles (1 13 -18)
"cameras/drone/drone1" SET Transform localScale (0.9618111419887836 0.9618111419887836 0.9618111419887836)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.580637883188739 0)
"cameras" SET Transform eulerAngles (15.841196537394168 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1570322594379239
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.950534159382264
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.029563416400119193
"cameras/drone/drone0" SET Transform localPosition (-1.0755332605568007 0.2891957209641211 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5718430639924357 0.8202562441352896 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -4 4)
"cameras/drone/drone0" SET Transform localScale (0.6776530484651668 0.6776530484651668 0.6776530484651668)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -9 -14)
"cameras/drone/drone1" SET Transform localScale (1.3975411755422544 1.3975411755422544 1.3975411755422544)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2083850160763916 0)
"cameras" SET Transform eulerAngles (-16.419649490352278 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5486879705808785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5949270474812793
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07809419186113958
"cameras/drone/drone0" SET Transform localPosition (0.688232850889267 0.024617001682194883 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.039041767824054 0.9555890040134125 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -11 6)
"cameras/drone/drone0" SET Transform localScale (1.0521781831738908 1.0521781831738908 1.0521781831738908)
"cameras/drone/drone1" SET Transform localEulerAngles (9 2 -4)
"cameras/drone/drone1" SET Transform localScale (1.015213939736686 1.015213939736686 1.015213939736686)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6668480254841036 0)
"cameras" SET Transform eulerAngles (12.721255660947769 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.289507277351798
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6161634721974714
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34705817754925344
"cameras/drone/drone0" SET Transform localPosition (-0.501923389245835 0.21316498062083072 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40993956620775807 1.2822534016144929 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -17 -14)
"cameras/drone/drone0" SET Transform localScale (1.1548676510172455 1.1548676510172455 1.1548676510172455)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 15 16)
"cameras/drone/drone1" SET Transform localScale (1.0158885230323829 1.0158885230323829 1.0158885230323829)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.32169203741355 0)
"cameras" SET Transform eulerAngles (13.284335338179126 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7364626546908442
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4979928312510273
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27434195974943687
"cameras/drone/drone0" SET Transform localPosition (0.8821969996720826 0.42706695133239786 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6185318573857528 1.2230362303163484 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 12 15)
"cameras/drone/drone0" SET Transform localScale (0.6725200684545061 0.6725200684545061 0.6725200684545061)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -13 6)
"cameras/drone/drone1" SET Transform localScale (0.6134732961755244 0.6134732961755244 0.6134732961755244)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.711215792678673 0)
"cameras" SET Transform eulerAngles (15.037912312606117 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6053028558767338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5845700191506913
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025208323344049433
"cameras/drone/drone0" SET Transform localPosition (-0.24038181603376985 -0.012327709987549451 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.647136999460841e-05 0.9470184189081002 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 16 -13)
"cameras/drone/drone0" SET Transform localScale (0.9501516175129763 0.9501516175129763 0.9501516175129763)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -1 -1)
"cameras/drone/drone1" SET Transform localScale (0.8572877051010857 0.8572877051010857 0.8572877051010857)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.471420058760114 0)
"cameras" SET Transform eulerAngles (2.282519635755861 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45028642277353004
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8756635401968214
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16743495118191035
"cameras/drone/drone0" SET Transform localPosition (-0.682759311362689 -0.2134555042002711 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8224290408253914 1.2064342207304342 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -7 -3)
"cameras/drone/drone0" SET Transform localScale (1.107701460822451 1.107701460822451 1.107701460822451)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -11 13)
"cameras/drone/drone1" SET Transform localScale (1.1622776320673385 1.1622776320673385 1.1622776320673385)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.990330686742614 0)
"cameras" SET Transform eulerAngles (8.615675085545078 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1647469495611968
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7017791573175503
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39322545436388456
"cameras/drone/drone0" SET Transform localPosition (-0.10436940711786313 0.38891100675550355 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2891744996447413 1.0791589045117798 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 5 -13)
"cameras/drone/drone0" SET Transform localScale (0.6246562934039993 0.6246562934039993 0.6246562934039993)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -1 -2)
"cameras/drone/drone1" SET Transform localScale (1.4522363127966509 1.4522363127966509 1.4522363127966509)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.051029651090234 0)
"cameras" SET Transform eulerAngles (-15.888331023174175 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3033546779840208
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0641010143719416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2507088349952279
"cameras/drone/drone0" SET Transform localPosition (0.5831159032956683 -0.10670465312405936 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5743722784733989 0.9977233651249207 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 14 -7)
"cameras/drone/drone0" SET Transform localScale (0.8804079284142583 0.8804079284142583 0.8804079284142583)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -9 -8)
"cameras/drone/drone1" SET Transform localScale (1.3404711959836466 1.3404711959836466 1.3404711959836466)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7942748152422165 0)
"cameras" SET Transform eulerAngles (-3.834045937198862 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3163892410702633
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9595352165618465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3055058218218849
"cameras/drone/drone0" SET Transform localPosition (-0.9133840213545579 0.09667664672502879 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8412132028681552 0.8281552609314532 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -6 -9)
"cameras/drone/drone0" SET Transform localScale (1.1997882880729562 1.1997882880729562 1.1997882880729562)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 0 18)
"cameras/drone/drone1" SET Transform localScale (0.937414809935126 0.937414809935126 0.937414809935126)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5023506370563773 0)
"cameras" SET Transform eulerAngles (-18.686379609669444 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5288318753006704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.857411931862476
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31798255826133087
"cameras/drone/drone0" SET Transform localPosition (0.3998380079003607 0.21718395114375172 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04748435577827892 0.9670462775730833 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -14 2)
"cameras/drone/drone0" SET Transform localScale (0.874483398700902 0.874483398700902 0.874483398700902)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 14 6)
"cameras/drone/drone1" SET Transform localScale (1.2302183877863402 1.2302183877863402 1.2302183877863402)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.040099417674095 0)
"cameras" SET Transform eulerAngles (-13.313776385522957 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2210066483931852
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6704528866165567
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2914457164665866
"cameras/drone/drone0" SET Transform localPosition (0.8663292208235938 0.6887394030267358 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.040049376221849675 1.00588124703426 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 2 12)
"cameras/drone/drone0" SET Transform localScale (1.3046939606085657 1.3046939606085657 1.3046939606085657)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -10 -4)
"cameras/drone/drone1" SET Transform localScale (0.7111592596766897 0.7111592596766897 0.7111592596766897)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5635781827265633 0)
"cameras" SET Transform eulerAngles (18.39538622455376 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8957927544229634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8091297622517812
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.250272426945568
"cameras/drone/drone0" SET Transform localPosition (0.07767993742074641 0.031461613838687785 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2890857358869834 1.1731471874434047 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 6 20)
"cameras/drone/drone0" SET Transform localScale (1.0834188808616994 1.0834188808616994 1.0834188808616994)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 11 -1)
"cameras/drone/drone1" SET Transform localScale (0.8447520275618036 0.8447520275618036 0.8447520275618036)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.163327022515048 0)
"cameras" SET Transform eulerAngles (-3.4450563387919964 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5408969769734053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3951111151739792
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2423884614412124
"cameras/drone/drone0" SET Transform localPosition (0.5280302108803043 0.15899232225481957 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2664972569440114 1.2390912059693435 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 5 -1)
"cameras/drone/drone0" SET Transform localScale (0.9129998415925256 0.9129998415925256 0.9129998415925256)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 9 1)
"cameras/drone/drone1" SET Transform localScale (1.4783828195485962 1.4783828195485962 1.4783828195485962)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.658315445784776 0)
"cameras" SET Transform eulerAngles (12.702141243721847 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9995874803007058
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5346586156196569
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2825754737242636
"cameras/drone/drone0" SET Transform localPosition (-0.9339911840942341 -0.047318086422061645 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.750991049910873 1.2385222153548456 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 8 -12)
"cameras/drone/drone0" SET Transform localScale (1.0154696691860732 1.0154696691860732 1.0154696691860732)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -9 2)
"cameras/drone/drone1" SET Transform localScale (0.873507261938267 0.873507261938267 0.873507261938267)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9109484133785495 0)
"cameras" SET Transform eulerAngles (-6.073350707166107 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.032689006219003
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2554606136132342
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.250554753142863
"cameras/drone/drone0" SET Transform localPosition (0.9960971277412425 -0.29504972088513365 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5749063837529065 1.0268780952761631 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -19 19)
"cameras/drone/drone0" SET Transform localScale (0.7505949353179104 0.7505949353179104 0.7505949353179104)
"cameras/drone/drone1" SET Transform localEulerAngles (11 14 8)
"cameras/drone/drone1" SET Transform localScale (0.9697200986857625 0.9697200986857625 0.9697200986857625)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.994793246977295 0)
"cameras" SET Transform eulerAngles (9.602295147340797 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7064732115950161
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8182546767540346
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05040362342054894
"cameras/drone/drone0" SET Transform localPosition (1.1286900909520032 0.4968739523615077 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9981545571447474 0.9520844718706991 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 9 -4)
"cameras/drone/drone0" SET Transform localScale (0.979974213299549 0.979974213299549 0.979974213299549)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -10 -17)
"cameras/drone/drone1" SET Transform localScale (1.0419773937662098 1.0419773937662098 1.0419773937662098)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.728562459151513 0)
"cameras" SET Transform eulerAngles (-9.598772945599663 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.924660898657395
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2795336364918115
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23518202447554803
"cameras/drone/drone0" SET Transform localPosition (-0.9788044592501742 0.5533733299066195 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0780594393068943 1.008126634627421 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -1 -15)
"cameras/drone/drone0" SET Transform localScale (0.9640725748310639 0.9640725748310639 0.9640725748310639)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -12 -14)
"cameras/drone/drone1" SET Transform localScale (0.7761288011347717 0.7761288011347717 0.7761288011347717)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.764179241657986 0)
"cameras" SET Transform eulerAngles (-3.1682404414702035 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0257524051514482
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8459485189545628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2910319221260313
"cameras/drone/drone0" SET Transform localPosition (0.37070192501181487 0.18920621647687536 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24991134117455172 1.0128328175936443 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -5 5)
"cameras/drone/drone0" SET Transform localScale (1.1718169953668363 1.1718169953668363 1.1718169953668363)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 14 -7)
"cameras/drone/drone1" SET Transform localScale (1.02063370591052 1.02063370591052 1.02063370591052)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.043163856707739 0)
"cameras" SET Transform eulerAngles (18.932684427366432 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.427410997618355
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8472544155997757
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17664884553564517
"cameras/drone/drone0" SET Transform localPosition (0.9089328769847469 -0.15750645960731008 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1094946880887742 1.0193325682558037 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -7 8)
"cameras/drone/drone0" SET Transform localScale (1.258340584875918 1.258340584875918 1.258340584875918)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -13 -19)
"cameras/drone/drone1" SET Transform localScale (0.9719134877422613 0.9719134877422613 0.9719134877422613)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.538889092940685 0)
"cameras" SET Transform eulerAngles (14.553955455196231 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1993672971379992
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2831280071337239
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31925705816377015
"cameras/drone/drone0" SET Transform localPosition (-0.9848502988101646 0.4502271670861317 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8311207347692674 1.0177290818750837 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 11 10)
"cameras/drone/drone0" SET Transform localScale (1.3730624034424164 1.3730624034424164 1.3730624034424164)
"cameras/drone/drone1" SET Transform localEulerAngles (0 3 16)
"cameras/drone/drone1" SET Transform localScale (0.9869176647725346 0.9869176647725346 0.9869176647725346)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.398406096604676 0)
"cameras" SET Transform eulerAngles (7.935792576039283 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1910648406035822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2363159712974487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22424847462744954
"cameras/drone/drone0" SET Transform localPosition (-0.7972191350432969 0.49678929121522725 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1036376574253397 0.9021284655138362 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -13 14)
"cameras/drone/drone0" SET Transform localScale (1.139761298290189 1.139761298290189 1.139761298290189)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 19 6)
"cameras/drone/drone1" SET Transform localScale (1.3723449470213547 1.3723449470213547 1.3723449470213547)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3320325835532865 0)
"cameras" SET Transform eulerAngles (16.051199379836774 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3347664985965841
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5257359356453484
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3261880746873218
"cameras/drone/drone0" SET Transform localPosition (-0.5884285947755005 -0.08327465833584075 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4660390076578921 0.9811022705903854 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -11 -7)
"cameras/drone/drone0" SET Transform localScale (1.4059172483158648 1.4059172483158648 1.4059172483158648)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -7 9)
"cameras/drone/drone1" SET Transform localScale (0.8356663920226192 0.8356663920226192 0.8356663920226192)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.331550728774183 0)
"cameras" SET Transform eulerAngles (-10.08594571294054 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5310452940405408
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7608620482360942
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21526015612621607
"cameras/drone/drone0" SET Transform localPosition (-0.5033599704162669 0.30444114167199293 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.45685799745410915 1.1942367208603537 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 10 2)
"cameras/drone/drone0" SET Transform localScale (1.3734343028055664 1.3734343028055664 1.3734343028055664)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -2 10)
"cameras/drone/drone1" SET Transform localScale (1.2319492792734286 1.2319492792734286 1.2319492792734286)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4210129022963844 0)
"cameras" SET Transform eulerAngles (-19.845719567902854 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1557735474177517
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2344263089324663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08375226794171096
"cameras/drone/drone0" SET Transform localPosition (0.20801948636552048 0.40475956715103284 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1228179106407856 1.290363296518184 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 11 1)
"cameras/drone/drone0" SET Transform localScale (0.8148569741644683 0.8148569741644683 0.8148569741644683)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -13 0)
"cameras/drone/drone1" SET Transform localScale (0.9254489544743216 0.9254489544743216 0.9254489544743216)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7731702869025145 0)
"cameras" SET Transform eulerAngles (-9.506343087057058 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6205001238376705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.30321247664425
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3534166705493397
"cameras/drone/drone0" SET Transform localPosition (0.011295138256418591 -0.28184965411594737 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1975483490140537 0.9926193110980084 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -19 5)
"cameras/drone/drone0" SET Transform localScale (1.419190037525174 1.419190037525174 1.419190037525174)
"cameras/drone/drone1" SET Transform localEulerAngles (11 6 -14)
"cameras/drone/drone1" SET Transform localScale (0.6351061151764475 0.6351061151764475 0.6351061151764475)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.592300349758714 0)
"cameras" SET Transform eulerAngles (-16.159003443893564 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4362280941097927
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0575728902431416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1579996789852207
"cameras/drone/drone0" SET Transform localPosition (-0.8559254972489427 -0.14405225715060416 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.095368859682566 0.8542125085109004 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -17 -8)
"cameras/drone/drone0" SET Transform localScale (1.4088838594668198 1.4088838594668198 1.4088838594668198)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -9 -1)
"cameras/drone/drone1" SET Transform localScale (1.457202010399294 1.457202010399294 1.457202010399294)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2107727361584413 0)
"cameras" SET Transform eulerAngles (10.58793182082698 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9944461782258004
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3415475339449776
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.009781756822314592
"cameras/drone/drone0" SET Transform localPosition (-0.7945310576659845 -0.021055596538182064 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1901235170151465 0.9725797692302778 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 13 -15)
"cameras/drone/drone0" SET Transform localScale (1.0670692942557571 1.0670692942557571 1.0670692942557571)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 3 -17)
"cameras/drone/drone1" SET Transform localScale (1.3710974015850623 1.3710974015850623 1.3710974015850623)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.324177436376717 0)
"cameras" SET Transform eulerAngles (-16.84788709034343 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6693225902500486
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9654673727682868
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29395047277833647
"cameras/drone/drone0" SET Transform localPosition (0.27917960547123233 0.5214489681848029 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.21054659743387238 1.1779335662423138 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -15 -15)
"cameras/drone/drone0" SET Transform localScale (1.378367295246356 1.378367295246356 1.378367295246356)
"cameras/drone/drone1" SET Transform localEulerAngles (13 15 4)
"cameras/drone/drone1" SET Transform localScale (1.3737154336902888 1.3737154336902888 1.3737154336902888)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.94664879022604 0)
"cameras" SET Transform eulerAngles (13.977666854491488 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9633865984308716
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0312673761659599
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3191909189274556
"cameras/drone/drone0" SET Transform localPosition (-0.5712659721218241 0.4021204557439157 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3209429975644027 1.1797715154802542 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 11 10)
"cameras/drone/drone0" SET Transform localScale (1.0757574392280376 1.0757574392280376 1.0757574392280376)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 1 4)
"cameras/drone/drone1" SET Transform localScale (1.2514940169778104 1.2514940169778104 1.2514940169778104)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2147865303517342 0)
"cameras" SET Transform eulerAngles (3.039133486413075 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0308257820833795
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9968848862518898
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.346992034103532
"cameras/drone/drone0" SET Transform localPosition (0.9247737115913897 0.4381690017711573 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.549492366812423 1.2606521249042566 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 6 -18)
"cameras/drone/drone0" SET Transform localScale (0.6760939766268554 0.6760939766268554 0.6760939766268554)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -10 12)
"cameras/drone/drone1" SET Transform localScale (1.3602520527033548 1.3602520527033548 1.3602520527033548)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3307815610094753 0)
"cameras" SET Transform eulerAngles (-0.7451768657235966 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4276541195398732
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4726769924539118
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.027255714469290385
"cameras/drone/drone0" SET Transform localPosition (0.17578712215776449 0.25538491286924087 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2991698463437956 0.830456247635537 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 15 -17)
"cameras/drone/drone0" SET Transform localScale (1.3464394730636156 1.3464394730636156 1.3464394730636156)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -13 12)
"cameras/drone/drone1" SET Transform localScale (1.40501770733031 1.40501770733031 1.40501770733031)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6480268598199 0)
"cameras" SET Transform eulerAngles (-7.429436232384411 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4599737249548201
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9906194510947924
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20247392837310346
"cameras/drone/drone0" SET Transform localPosition (-0.2299742390560694 0.2231527168156791 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9102705574725134 1.0670503732158645 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -15 -7)
"cameras/drone/drone0" SET Transform localScale (1.0421157406720687 1.0421157406720687 1.0421157406720687)
"cameras/drone/drone1" SET Transform localEulerAngles (4 7 7)
"cameras/drone/drone1" SET Transform localScale (1.4606988380341361 1.4606988380341361 1.4606988380341361)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.342386959879043 0)
"cameras" SET Transform eulerAngles (12.94906725454473 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2511061899091902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5497897384977704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20600928300775034
"cameras/drone/drone0" SET Transform localPosition (0.5757816892714727 -0.16625245694754692 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3960151490269128 1.0508709692623879 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 14 1)
"cameras/drone/drone0" SET Transform localScale (1.4958919542009497 1.4958919542009497 1.4958919542009497)
"cameras/drone/drone1" SET Transform localEulerAngles (13 3 -9)
"cameras/drone/drone1" SET Transform localScale (1.232437186660079 1.232437186660079 1.232437186660079)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.241643445730464 0)
"cameras" SET Transform eulerAngles (-10.759360260527387 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7644116681711277
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.163688000927665
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06817392805213829
"cameras/drone/drone0" SET Transform localPosition (0.7299195422063736 0.6347591411661688 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5079760699442553 1.2181657944571094 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 16 8)
"cameras/drone/drone0" SET Transform localScale (1.033725839035628 1.033725839035628 1.033725839035628)
"cameras/drone/drone1" SET Transform localEulerAngles (6 18 10)
"cameras/drone/drone1" SET Transform localScale (1.0359309900769742 1.0359309900769742 1.0359309900769742)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.245461558360671 0)
"cameras" SET Transform eulerAngles (-3.2929439747512177 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.147618871671132
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4619841315174467
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34969795859081804
"cameras/drone/drone0" SET Transform localPosition (-0.26790601807002357 0.2874798789012976 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0021099941164866 1.1771490553349095 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 8 -13)
"cameras/drone/drone0" SET Transform localScale (0.7290641836698628 0.7290641836698628 0.7290641836698628)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -11 7)
"cameras/drone/drone1" SET Transform localScale (0.8650439402661334 0.8650439402661334 0.8650439402661334)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1139237972721983 0)
"cameras" SET Transform eulerAngles (9.60793869580251 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8084904467701128
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9723088250290863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21057851913877323
"cameras/drone/drone0" SET Transform localPosition (0.8575097376329499 -0.12861448774471412 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0437980754782943 1.0409847607115221 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 3 -19)
"cameras/drone/drone0" SET Transform localScale (0.7044709008403178 0.7044709008403178 0.7044709008403178)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 13 13)
"cameras/drone/drone1" SET Transform localScale (0.8377486340341503 0.8377486340341503 0.8377486340341503)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5675111049232555 0)
"cameras" SET Transform eulerAngles (-15.019348085151929 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6276540521604885
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9897816754248225
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25527630148222874
"cameras/drone/drone0" SET Transform localPosition (-0.6714415788573956 -0.11690757046772277 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.564046433274497 1.2760056900427783 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 9 6)
"cameras/drone/drone0" SET Transform localScale (1.2933887032236042 1.2933887032236042 1.2933887032236042)
"cameras/drone/drone1" SET Transform localEulerAngles (6 7 12)
"cameras/drone/drone1" SET Transform localScale (1.1467012881482535 1.1467012881482535 1.1467012881482535)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9772482229837376 0)
"cameras" SET Transform eulerAngles (17.323635293791085 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47348101654039193
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8995731246996426
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3925328280223226
"cameras/drone/drone0" SET Transform localPosition (0.5603923970385121 0.506605023741244 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.164407269854795 0.94981892800662 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -4 14)
"cameras/drone/drone0" SET Transform localScale (1.172404786771863 1.172404786771863 1.172404786771863)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 15 9)
"cameras/drone/drone1" SET Transform localScale (0.865944947072012 0.865944947072012 0.865944947072012)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.597017160726247 0)
"cameras" SET Transform eulerAngles (16.164976103817537 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6225930849088009
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5651636665654458
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.039712423525877005
"cameras/drone/drone0" SET Transform localPosition (-0.22066493901037598 -0.2904077417039907 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21186373347603493 0.90143366628804 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -19 14)
"cameras/drone/drone0" SET Transform localScale (1.0302512835176199 1.0302512835176199 1.0302512835176199)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -5 20)
"cameras/drone/drone1" SET Transform localScale (1.073101303890934 1.073101303890934 1.073101303890934)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1736956378456034 0)
"cameras" SET Transform eulerAngles (-4.351385433885703 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0118122461289372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7582093851545157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.014224126038005203
"cameras/drone/drone0" SET Transform localPosition (-0.2526397696390935 0.27405024830868546 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0429554744019722 1.1628656465036449 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 6 2)
"cameras/drone/drone0" SET Transform localScale (1.2613120909021325 1.2613120909021325 1.2613120909021325)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -13 -3)
"cameras/drone/drone1" SET Transform localScale (0.8709379593072812 0.8709379593072812 0.8709379593072812)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9040965301674007 0)
"cameras" SET Transform eulerAngles (4.344342991589549 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5218778344847625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2455720217535275
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2583951404925823
"cameras/drone/drone0" SET Transform localPosition (-0.0858926275190266 0.48080537006259355 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2919673298187737 0.9956676749267092 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 18 9)
"cameras/drone/drone0" SET Transform localScale (0.6551006412258886 0.6551006412258886 0.6551006412258886)
"cameras/drone/drone1" SET Transform localEulerAngles (6 16 1)
"cameras/drone/drone1" SET Transform localScale (1.0393759446034683 1.0393759446034683 1.0393759446034683)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6718358768005137 0)
"cameras" SET Transform eulerAngles (-18.323170168157795 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7294729361567696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4662515260472517
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.266487710428078
"cameras/drone/drone0" SET Transform localPosition (-0.6402370978492555 0.33906874371793466 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.16249063727950808 1.0615293991999284 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -1 -6)
"cameras/drone/drone0" SET Transform localScale (0.7590396895645327 0.7590396895645327 0.7590396895645327)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -4 10)
"cameras/drone/drone1" SET Transform localScale (1.4288256246054436 1.4288256246054436 1.4288256246054436)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.059886760564182 0)
"cameras" SET Transform eulerAngles (9.360154225732472 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.425458228906637
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7440741176902033
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08895740294912198
"cameras/drone/drone0" SET Transform localPosition (0.4799551610357269 0.6908297771834275 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3291113008853076 0.8405601153470688 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 12 12)
"cameras/drone/drone0" SET Transform localScale (1.4046908257629367 1.4046908257629367 1.4046908257629367)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -7 -14)
"cameras/drone/drone1" SET Transform localScale (0.6238840554604088 0.6238840554604088 0.6238840554604088)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.777215149471305 0)
"cameras" SET Transform eulerAngles (-13.151099143628425 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5265088909852391
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1392587501983835
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.023438126078364974
"cameras/drone/drone0" SET Transform localPosition (-0.2152914145376319 0.3374599216573427 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5797386905976031 1.1467304153897562 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 6 -9)
"cameras/drone/drone0" SET Transform localScale (1.4477359895241937 1.4477359895241937 1.4477359895241937)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 17 -8)
"cameras/drone/drone1" SET Transform localScale (1.1847381197352795 1.1847381197352795 1.1847381197352795)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9111478596889584 0)
"cameras" SET Transform eulerAngles (8.190730312449269 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1767606264345711
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.782122372410656
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.029775813457547165
"cameras/drone/drone0" SET Transform localPosition (0.5098352596154614 0.010936282832499866 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9593097968033661 1.2601326037230183 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -9 -14)
"cameras/drone/drone0" SET Transform localScale (1.2654425738938997 1.2654425738938997 1.2654425738938997)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -9 -13)
"cameras/drone/drone1" SET Transform localScale (1.1878465601843216 1.1878465601843216 1.1878465601843216)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.740928277679441 0)
"cameras" SET Transform eulerAngles (-17.791863461115383 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8296334941003084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.160820133424751
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16597819859972188
"cameras/drone/drone0" SET Transform localPosition (-0.6711025611176545 -0.14249458571716828 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8164201741664618 1.1858704819072856 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 1 -8)
"cameras/drone/drone0" SET Transform localScale (0.8673738916277861 0.8673738916277861 0.8673738916277861)
"cameras/drone/drone1" SET Transform localEulerAngles (0 15 19)
"cameras/drone/drone1" SET Transform localScale (0.6573482597550594 0.6573482597550594 0.6573482597550594)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.037529660485701 0)
"cameras" SET Transform eulerAngles (-15.583346152707538 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9881257192172574
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.058727023484496
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.012725594597286172
"cameras/drone/drone0" SET Transform localPosition (0.14157535497930507 0.35435598037360755 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22035571606253201 0.830714985233076 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 1 -14)
"cameras/drone/drone0" SET Transform localScale (0.6156184475253876 0.6156184475253876 0.6156184475253876)
"cameras/drone/drone1" SET Transform localEulerAngles (11 6 -14)
"cameras/drone/drone1" SET Transform localScale (0.689032725754211 0.689032725754211 0.689032725754211)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8910665434625544 0)
"cameras" SET Transform eulerAngles (-16.491260501382804 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9052352548323481
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6149037538649684
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18654280282540447
"cameras/drone/drone0" SET Transform localPosition (-0.47287827894391976 0.5315129775287724 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7283305363716119 1.2439215133737198 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 3 -16)
"cameras/drone/drone0" SET Transform localScale (1.1998496746128207 1.1998496746128207 1.1998496746128207)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -20 1)
"cameras/drone/drone1" SET Transform localScale (0.9333091989556885 0.9333091989556885 0.9333091989556885)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.750397236521435 0)
"cameras" SET Transform eulerAngles (13.308617089476016 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5489256981444934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3731874113934517
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.015720715106650164
"cameras/drone/drone0" SET Transform localPosition (-0.163806277347204 0.6165499837754529 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2343506896075076 1.0536467623319292 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -11 -7)
"cameras/drone/drone0" SET Transform localScale (0.6406101631556221 0.6406101631556221 0.6406101631556221)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -16 -1)
"cameras/drone/drone1" SET Transform localScale (1.447557719412767 1.447557719412767 1.447557719412767)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.546169096908372 0)
"cameras" SET Transform eulerAngles (-4.192331390124636 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.526252321663113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0009829489935402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.061193459149253296
"cameras/drone/drone0" SET Transform localPosition (-0.6874720654627117 0.23453335800396785 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0675420700725964 0.81032338982666 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -11 5)
"cameras/drone/drone0" SET Transform localScale (0.7991323274977243 0.7991323274977243 0.7991323274977243)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 14 -10)
"cameras/drone/drone1" SET Transform localScale (0.7673065243621247 0.7673065243621247 0.7673065243621247)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.775563476139283 0)
"cameras" SET Transform eulerAngles (-15.523578235115085 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.694746571380982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9282455879509817
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13943653039714357
"cameras/drone/drone0" SET Transform localPosition (0.40158684754357865 -0.22312772596522473 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8355745651470268 1.0894683530685167 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -11 2)
"cameras/drone/drone0" SET Transform localScale (1.1656410540450977 1.1656410540450977 1.1656410540450977)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -1 2)
"cameras/drone/drone1" SET Transform localScale (1.264977100150598 1.264977100150598 1.264977100150598)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.397091540313746 0)
"cameras" SET Transform eulerAngles (15.411930377291881 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4659722093230934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.595102951162366
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25774471414142697
"cameras/drone/drone0" SET Transform localPosition (0.11502204230201918 0.11678755567469751 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1463354279435831 1.2727114195185265 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -3 -6)
"cameras/drone/drone0" SET Transform localScale (0.6528845199285971 0.6528845199285971 0.6528845199285971)
"cameras/drone/drone1" SET Transform localEulerAngles (11 19 -18)
"cameras/drone/drone1" SET Transform localScale (0.8279218896007661 0.8279218896007661 0.8279218896007661)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.199722557683017 0)
"cameras" SET Transform eulerAngles (19.106388927992086 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6541240432676843
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2341428391276632
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.373104870270503
"cameras/drone/drone0" SET Transform localPosition (0.6178373081224193 -0.02090270882915196 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12553769101338408 0.8731118048543766 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -10 -1)
"cameras/drone/drone0" SET Transform localScale (0.753818711301391 0.753818711301391 0.753818711301391)
"cameras/drone/drone1" SET Transform localEulerAngles (13 4 1)
"cameras/drone/drone1" SET Transform localScale (1.1257937044224668 1.1257937044224668 1.1257937044224668)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.669336906513193 0)
"cameras" SET Transform eulerAngles (-2.0077192336294836 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.356849069417669
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9606109830865908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1973228082421506
"cameras/drone/drone0" SET Transform localPosition (0.28376050421608556 0.486115326561596 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17233657235988975 0.9168541526819818 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 17 5)
"cameras/drone/drone0" SET Transform localScale (1.3812755035752318 1.3812755035752318 1.3812755035752318)
"cameras/drone/drone1" SET Transform localEulerAngles (13 13 -7)
"cameras/drone/drone1" SET Transform localScale (0.8948932646729109 0.8948932646729109 0.8948932646729109)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8830945212533488 0)
"cameras" SET Transform eulerAngles (14.990931676332686 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5242184911543974
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9964152995394896
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19057696904802462
"cameras/drone/drone0" SET Transform localPosition (0.7148783128862228 0.32307587045866554 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40220120369259704 1.057640813144482 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 3 -16)
"cameras/drone/drone0" SET Transform localScale (1.236880509040453 1.236880509040453 1.236880509040453)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 4 -6)
"cameras/drone/drone1" SET Transform localScale (1.4274561060703506 1.4274561060703506 1.4274561060703506)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.806050859004197 0)
"cameras" SET Transform eulerAngles (12.472074348406124 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9879631614177419
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5400485571420899
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05041078623053315
"cameras/drone/drone0" SET Transform localPosition (-0.021257054682611187 0.18082914171927839 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5001461466258852 0.9171941336136172 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -9 12)
"cameras/drone/drone0" SET Transform localScale (1.4081576790673425 1.4081576790673425 1.4081576790673425)
"cameras/drone/drone1" SET Transform localEulerAngles (3 7 -17)
"cameras/drone/drone1" SET Transform localScale (0.9222457365031229 0.9222457365031229 0.9222457365031229)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.953937543353131 0)
"cameras" SET Transform eulerAngles (8.051599555303277 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5277834945183768
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9186450963986582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20768262305003282
"cameras/drone/drone0" SET Transform localPosition (0.1480945180529294 -0.04985976296272715 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7443303178428817 1.1563436085554781 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 5 1)
"cameras/drone/drone0" SET Transform localScale (1.070128806085019 1.070128806085019 1.070128806085019)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -14 1)
"cameras/drone/drone1" SET Transform localScale (0.9538498059473234 0.9538498059473234 0.9538498059473234)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.721596889269891 0)
"cameras" SET Transform eulerAngles (-16.861708843223177 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4567357788899981
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2004440456415426
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20868579614357077
"cameras/drone/drone0" SET Transform localPosition (0.7193945824388279 -0.02666682670092374 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.07590794608358231 1.2022915752004646 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -13 14)
"cameras/drone/drone0" SET Transform localScale (0.7775475742672759 0.7775475742672759 0.7775475742672759)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -18 15)
"cameras/drone/drone1" SET Transform localScale (0.7839061779569731 0.7839061779569731 0.7839061779569731)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5911832418920007 0)
"cameras" SET Transform eulerAngles (8.33890281705009 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45057304262569564
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6920090337188385
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12279278424720608
"cameras/drone/drone0" SET Transform localPosition (0.5020900817689062 0.003116293418760574 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1122947916803472 0.9133392493073202 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -6 15)
"cameras/drone/drone0" SET Transform localScale (0.6246058597293995 0.6246058597293995 0.6246058597293995)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -11 -1)
"cameras/drone/drone1" SET Transform localScale (0.8503445180059999 0.8503445180059999 0.8503445180059999)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.070086890356597 0)
"cameras" SET Transform eulerAngles (-10.969842985481804 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1015688743306524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7832182006065094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2857512786760339
"cameras/drone/drone0" SET Transform localPosition (-0.6921845877263856 0.5904493963140456 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6041091987284064 1.2155498886341254 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -4 -19)
"cameras/drone/drone0" SET Transform localScale (1.0499183768740499 1.0499183768740499 1.0499183768740499)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 6 5)
"cameras/drone/drone1" SET Transform localScale (0.7495434414270717 0.7495434414270717 0.7495434414270717)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 72
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.680176055675755 0)
"cameras" SET Transform eulerAngles (16.074872554839473 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1681230462855607
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2294152044186237
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16140341601788644
"cameras/drone/drone0" SET Transform localPosition (0.6545563094112434 0.31247625897811165 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.23222229874608402 0.9442549112496104 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -17 4)
"cameras/drone/drone0" SET Transform localScale (1.2152296867501642 1.2152296867501642 1.2152296867501642)
"cameras/drone/drone1" SET Transform localEulerAngles (17 10 16)
"cameras/drone/drone1" SET Transform localScale (1.3424451392326575 1.3424451392326575 1.3424451392326575)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.883095265147102 0)
"cameras" SET Transform eulerAngles (16.732235771234144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9759150279755173
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2376401552870868
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16419546165769905
"cameras/drone/drone0" SET Transform localPosition (-0.627557799671644 -0.006295686184776772 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6776581991847273 0.9511206813323387 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -7 -2)
"cameras/drone/drone0" SET Transform localScale (1.2057440749542696 1.2057440749542696 1.2057440749542696)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -13 16)
"cameras/drone/drone1" SET Transform localScale (1.2350886840671436 1.2350886840671436 1.2350886840671436)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.265262816466718 0)
"cameras" SET Transform eulerAngles (-4.0476979832099715 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6386269845924362
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3734642394394163
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14561104731733737
"cameras/drone/drone0" SET Transform localPosition (0.04443168058490232 0.4867735672740469 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1012797584487759 0.8590146376613964 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -19 -1)
"cameras/drone/drone0" SET Transform localScale (1.090611813346678 1.090611813346678 1.090611813346678)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 1 17)
"cameras/drone/drone1" SET Transform localScale (0.6717175011239307 0.6717175011239307 0.6717175011239307)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.582330469188165 0)
"cameras" SET Transform eulerAngles (5.122166033852402 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0346749756400841
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7560542435763469
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06482968740158253
"cameras/drone/drone0" SET Transform localPosition (-0.11342173507653719 0.5274725344917439 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1552768046445947 0.9777125573338048 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 13 18)
"cameras/drone/drone0" SET Transform localScale (1.0225124276408595 1.0225124276408595 1.0225124276408595)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -15 11)
"cameras/drone/drone1" SET Transform localScale (1.3888447999568092 1.3888447999568092 1.3888447999568092)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.027758566331835 0)
"cameras" SET Transform eulerAngles (-18.579772868635477 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.425282073289348
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3559927313255806
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17813465592548475
"cameras/drone/drone0" SET Transform localPosition (-1.103840619629817 0.5697381154267225 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8586490083023078 0.8368029795113578 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 6 -6)
"cameras/drone/drone0" SET Transform localScale (1.0676961347854579 1.0676961347854579 1.0676961347854579)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -9 -4)
"cameras/drone/drone1" SET Transform localScale (0.8602809581111854 0.8602809581111854 0.8602809581111854)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.703348754617897 0)
"cameras" SET Transform eulerAngles (-18.105086323976188 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8370059592576533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1773286738752577
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.022930093278346053
"cameras/drone/drone0" SET Transform localPosition (0.7750086431128507 0.5310847350953685 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6646039280732654 1.2452720403503998 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 10 -17)
"cameras/drone/drone0" SET Transform localScale (1.2155353243468072 1.2155353243468072 1.2155353243468072)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -6 -8)
"cameras/drone/drone1" SET Transform localScale (1.4159617978322245 1.4159617978322245 1.4159617978322245)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.684055259473571 0)
"cameras" SET Transform eulerAngles (-17.76303309934045 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0486996708813296
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3675316585228638
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1219470989362606
"cameras/drone/drone0" SET Transform localPosition (0.5742259971468575 0.44562136966645355 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.01257354213903783 1.2837276071307466 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 4 -12)
"cameras/drone/drone0" SET Transform localScale (0.7284487919722323 0.7284487919722323 0.7284487919722323)
"cameras/drone/drone1" SET Transform localEulerAngles (17 19 -12)
"cameras/drone/drone1" SET Transform localScale (0.9358459903986236 0.9358459903986236 0.9358459903986236)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.325955920634499 0)
"cameras" SET Transform eulerAngles (2.790037680905506 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3532234249366086
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6026131001392794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3246215396626121
"cameras/drone/drone0" SET Transform localPosition (-0.38200484353988273 0.30814139981149385 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8413594963694151 0.9848813596139415 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 8 1)
"cameras/drone/drone0" SET Transform localScale (0.8526378493674682 0.8526378493674682 0.8526378493674682)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 4 -5)
"cameras/drone/drone1" SET Transform localScale (1.173100201872522 1.173100201872522 1.173100201872522)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.264088911114745 0)
"cameras" SET Transform eulerAngles (-14.3252645960265 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8970223979519274
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5297305410220825
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09400687460805371
"cameras/drone/drone0" SET Transform localPosition (-0.7732141633648448 0.3933439825557051 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28538674754076543 1.005659349212658 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 7 -12)
"cameras/drone/drone0" SET Transform localScale (1.3207520888584945 1.3207520888584945 1.3207520888584945)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 1 2)
"cameras/drone/drone1" SET Transform localScale (1.090906660724368 1.090906660724368 1.090906660724368)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.754732569834909 0)
"cameras" SET Transform eulerAngles (11.79389545459754 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.079870023856794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7544667357783978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09919206758465418
"cameras/drone/drone0" SET Transform localPosition (0.45200330354504015 -0.05285951042726095 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6544185309625611 0.9769375894957664 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -2 -12)
"cameras/drone/drone0" SET Transform localScale (1.1334121617658068 1.1334121617658068 1.1334121617658068)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 7 15)
"cameras/drone/drone1" SET Transform localScale (1.0317270728403556 1.0317270728403556 1.0317270728403556)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4963547385258664 0)
"cameras" SET Transform eulerAngles (-14.054661386816939 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1275983312446396
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7254034898331194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14179038982756467
"cameras/drone/drone0" SET Transform localPosition (0.7466656681951369 0.3654731928791118 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.36047389652133344 1.007081432247193 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 2 9)
"cameras/drone/drone0" SET Transform localScale (1.0384298868859192 1.0384298868859192 1.0384298868859192)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -4 19)
"cameras/drone/drone1" SET Transform localScale (1.1011834508080915 1.1011834508080915 1.1011834508080915)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.783263545356238 0)
"cameras" SET Transform eulerAngles (13.367676631394914 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7929958171598406
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2947163112857947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17054172476589502
"cameras/drone/drone0" SET Transform localPosition (0.968223011387688 0.284006507850563 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5999760191870969 0.9791956182650415 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 7 10)
"cameras/drone/drone0" SET Transform localScale (0.7502944821819284 0.7502944821819284 0.7502944821819284)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 5 -14)
"cameras/drone/drone1" SET Transform localScale (0.6832010365420503 0.6832010365420503 0.6832010365420503)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.389522421046829 0)
"cameras" SET Transform eulerAngles (-17.573320319545353 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9450874389566374
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9684151580175854
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2877014171916666
"cameras/drone/drone0" SET Transform localPosition (0.8774547197342717 -0.2633076631599282 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0370092383533538 1.1920738987152888 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 9 -17)
"cameras/drone/drone0" SET Transform localScale (1.4047795275320283 1.4047795275320283 1.4047795275320283)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 13 -11)
"cameras/drone/drone1" SET Transform localScale (0.8963887366669359 0.8963887366669359 0.8963887366669359)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4569880839317 0)
"cameras" SET Transform eulerAngles (14.323032813210766 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7257730742881143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4752120427657074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14453105830312657
"cameras/drone/drone0" SET Transform localPosition (0.8451197448428205 0.3664649358674566 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1228577072459411 0.8805995628996408 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 18 16)
"cameras/drone/drone0" SET Transform localScale (1.2183777677562788 1.2183777677562788 1.2183777677562788)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -13 11)
"cameras/drone/drone1" SET Transform localScale (0.7738943879956834 0.7738943879956834 0.7738943879956834)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3756337590583483 0)
"cameras" SET Transform eulerAngles (3.872630000144831 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2395664218094273
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2667121162409987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.024883898545658756
"cameras/drone/drone0" SET Transform localPosition (-0.18305075457179454 0.41833686125227926 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9360875652454153 0.978475713964926 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -9 1)
"cameras/drone/drone0" SET Transform localScale (0.6144206238162128 0.6144206238162128 0.6144206238162128)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -20 -11)
"cameras/drone/drone1" SET Transform localScale (1.1296346233246521 1.1296346233246521 1.1296346233246521)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2673346600327666 0)
"cameras" SET Transform eulerAngles (-2.4069179220485566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7570748120432189
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1486351657066463
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3460570036365843
"cameras/drone/drone0" SET Transform localPosition (-0.6220446733446595 -0.28001517751874233 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7819075439702461 1.021476921918857 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -5 -11)
"cameras/drone/drone0" SET Transform localScale (0.6009141859028162 0.6009141859028162 0.6009141859028162)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -16 16)
"cameras/drone/drone1" SET Transform localScale (1.1698573389068527 1.1698573389068527 1.1698573389068527)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0410275976795 0)
"cameras" SET Transform eulerAngles (-12.00614089583684 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7371309762005318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7644811234678572
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1791126502350124
"cameras/drone/drone0" SET Transform localPosition (-0.03967849008943869 0.28096222398404674 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5337760693378881 1.2184980376568306 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -2 5)
"cameras/drone/drone0" SET Transform localScale (0.8296597733588182 0.8296597733588182 0.8296597733588182)
"cameras/drone/drone1" SET Transform localEulerAngles (19 9 0)
"cameras/drone/drone1" SET Transform localScale (1.2016466383892812 1.2016466383892812 1.2016466383892812)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.216845722854869 0)
"cameras" SET Transform eulerAngles (-18.718332125137493 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6393204072504516
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.417902177535062
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.024121434860051985
"cameras/drone/drone0" SET Transform localPosition (-0.023683051741025807 0.013979272024243816 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9846963963840778 1.2255239698825346 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -9 -17)
"cameras/drone/drone0" SET Transform localScale (1.4721344644373207 1.4721344644373207 1.4721344644373207)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -14 17)
"cameras/drone/drone1" SET Transform localScale (1.188355701264744 1.188355701264744 1.188355701264744)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.607908425232823 0)
"cameras" SET Transform eulerAngles (8.302584383205907 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8803564271415063
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1213669858127773
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23609166398689618
"cameras/drone/drone0" SET Transform localPosition (-0.10633218952453993 -0.11659849991238685 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7326379561504048 1.1317203470946076 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 7 0)
"cameras/drone/drone0" SET Transform localScale (0.6526204182699933 0.6526204182699933 0.6526204182699933)
"cameras/drone/drone1" SET Transform localEulerAngles (13 18 -11)
"cameras/drone/drone1" SET Transform localScale (1.3894895638129194 1.3894895638129194 1.3894895638129194)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8208080755017355 0)
"cameras" SET Transform eulerAngles (2.2855290578468903 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2260739654628758
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.93179629853567
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2959033316171604
"cameras/drone/drone0" SET Transform localPosition (-0.941217904918703 0.673224537581611 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.34098491361261063 1.0925815612360963 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -9 -9)
"cameras/drone/drone0" SET Transform localScale (1.3317244652153972 1.3317244652153972 1.3317244652153972)
"cameras/drone/drone1" SET Transform localEulerAngles (8 12 3)
"cameras/drone/drone1" SET Transform localScale (1.2968518741891226 1.2968518741891226 1.2968518741891226)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.902612204153294 0)
"cameras" SET Transform eulerAngles (14.000398952934376 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9817240315751506
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7256229258886595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20043974956557245
"cameras/drone/drone0" SET Transform localPosition (-0.7017482246023649 0.6492935160449407 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6417121744501749 1.0012015374220582 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 0 4)
"cameras/drone/drone0" SET Transform localScale (0.9749707437882129 0.9749707437882129 0.9749707437882129)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -20 13)
"cameras/drone/drone1" SET Transform localScale (1.4482149222161644 1.4482149222161644 1.4482149222161644)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.850117304721329 0)
"cameras" SET Transform eulerAngles (-8.30301164235252 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7566756862261339
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.296633757010816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06564272403733243
"cameras/drone/drone0" SET Transform localPosition (-0.7922535721672305 -0.12756361186843007 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.16965819409075 0.896465475350945 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 16 -14)
"cameras/drone/drone0" SET Transform localScale (0.6913230209177407 0.6913230209177407 0.6913230209177407)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -1 -5)
"cameras/drone/drone1" SET Transform localScale (0.8241686915636641 0.8241686915636641 0.8241686915636641)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0886991384878595 0)
"cameras" SET Transform eulerAngles (-7.263726690842077 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.222331445411256
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4298537331091907
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38541732186098343
"cameras/drone/drone0" SET Transform localPosition (0.7269906613017987 -0.18705352680101733 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3147148814181506 0.9735030430266447 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -14 6)
"cameras/drone/drone0" SET Transform localScale (1.450314657429031 1.450314657429031 1.450314657429031)
"cameras/drone/drone1" SET Transform localEulerAngles (19 17 20)
"cameras/drone/drone1" SET Transform localScale (1.0807491991646123 1.0807491991646123 1.0807491991646123)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3440726196088244 0)
"cameras" SET Transform eulerAngles (-11.044426237357467 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4616791874578346
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.683433959215062
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26014194228615506
"cameras/drone/drone0" SET Transform localPosition (1.0100974732320467 0.3661073543985694 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9005802706763528 0.8026943942181954 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -15 -7)
"cameras/drone/drone0" SET Transform localScale (0.8767461498626541 0.8767461498626541 0.8767461498626541)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -3 15)
"cameras/drone/drone1" SET Transform localScale (0.6022297244016501 0.6022297244016501 0.6022297244016501)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.078528841570613 0)
"cameras" SET Transform eulerAngles (8.71613136307495 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2335330888921825
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6881419920247265
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2714288288621964
"cameras/drone/drone0" SET Transform localPosition (0.25592916523066656 0.2533240840746715 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.609516934566364 0.9539055088268561 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -7 17)
"cameras/drone/drone0" SET Transform localScale (0.9130830755594571 0.9130830755594571 0.9130830755594571)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 2 18)
"cameras/drone/drone1" SET Transform localScale (1.4109351889455155 1.4109351889455155 1.4109351889455155)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.424045750720077 0)
"cameras" SET Transform eulerAngles (11.161868601253765 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9620745823594249
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4022111249202118
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36095660905102106
"cameras/drone/drone0" SET Transform localPosition (-1.118176768953721 0.27104872652980977 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0224106957158166 0.9344368340694458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 5 -12)
"cameras/drone/drone0" SET Transform localScale (1.4085071763789077 1.4085071763789077 1.4085071763789077)
"cameras/drone/drone1" SET Transform localEulerAngles (4 1 -18)
"cameras/drone/drone1" SET Transform localScale (1.1428150498775356 1.1428150498775356 1.1428150498775356)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3021322508740574 0)
"cameras" SET Transform eulerAngles (8.068111320212367 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.468455244884201
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0367847833785715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2264346141715807
"cameras/drone/drone0" SET Transform localPosition (0.2815525343068823 -0.17236464574783067 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6975898652041888 1.2154328443812852 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -8 -14)
"cameras/drone/drone0" SET Transform localScale (1.2963522710762585 1.2963522710762585 1.2963522710762585)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 17 -19)
"cameras/drone/drone1" SET Transform localScale (1.1028504769921774 1.1028504769921774 1.1028504769921774)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.964054885126122 0)
"cameras" SET Transform eulerAngles (-11.66827997392942 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8521798183290566
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8973515832278465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07903072736796096
"cameras/drone/drone0" SET Transform localPosition (-0.031208947776355966 0.45837764282461185 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.42238351603975377 1.2922037540678852 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -20 -1)
"cameras/drone/drone0" SET Transform localScale (1.1546424869224023 1.1546424869224023 1.1546424869224023)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -14 -14)
"cameras/drone/drone1" SET Transform localScale (1.0153929750351192 1.0153929750351192 1.0153929750351192)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.76470089591098 0)
"cameras" SET Transform eulerAngles (-11.840090772990482 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.010179611673248
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6137851736119728
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3134932357185398
"cameras/drone/drone0" SET Transform localPosition (-1.1132120647020631 0.12915229628732866 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03135284602827859 1.0040519462040054 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 1 19)
"cameras/drone/drone0" SET Transform localScale (0.9002896872441959 0.9002896872441959 0.9002896872441959)
"cameras/drone/drone1" SET Transform localEulerAngles (15 15 9)
"cameras/drone/drone1" SET Transform localScale (0.8810547460498537 0.8810547460498537 0.8810547460498537)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.184943764477088 0)
"cameras" SET Transform eulerAngles (-15.982807234710359 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6572780338221729
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9011263264383578
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2122299058609682
"cameras/drone/drone0" SET Transform localPosition (0.42590771400225647 0.36875341132897294 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.650131925520409 1.192736293522394 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -3 -15)
"cameras/drone/drone0" SET Transform localScale (0.7759140537364464 0.7759140537364464 0.7759140537364464)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -18 5)
"cameras/drone/drone1" SET Transform localScale (1.2933758004619795 1.2933758004619795 1.2933758004619795)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.035311284888052 0)
"cameras" SET Transform eulerAngles (-19.887661663943675 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0440137863683359
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.607128512369005
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09319513457343716
"cameras/drone/drone0" SET Transform localPosition (0.7387510864649154 0.3162611731768648 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0885795281702235 0.8541337948959703 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -19 18)
"cameras/drone/drone0" SET Transform localScale (0.601616584482396 0.601616584482396 0.601616584482396)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 9 9)
"cameras/drone/drone1" SET Transform localScale (1.3313454177855686 1.3313454177855686 1.3313454177855686)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.361336960872087 0)
"cameras" SET Transform eulerAngles (7.851005409985653 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5240820157254507
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9480939718696109
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1195993496680893
"cameras/drone/drone0" SET Transform localPosition (-0.5697790316841608 -0.03433624570475796 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.39397149803999687 1.0700221746811918 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -15 -5)
"cameras/drone/drone0" SET Transform localScale (0.9784258817958584 0.9784258817958584 0.9784258817958584)
"cameras/drone/drone1" SET Transform localEulerAngles (15 11 0)
"cameras/drone/drone1" SET Transform localScale (0.6457317945002254 0.6457317945002254 0.6457317945002254)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.811157991880858 0)
"cameras" SET Transform eulerAngles (-3.001113268773615 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.021777143458027
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6007610483060892
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27796829078367624
"cameras/drone/drone0" SET Transform localPosition (-0.3899030916954642 -0.19933016975058454 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2685858752121497 1.1562213526737684 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 12 15)
"cameras/drone/drone0" SET Transform localScale (0.789800155350276 0.789800155350276 0.789800155350276)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -16 -13)
"cameras/drone/drone1" SET Transform localScale (0.7920158683674983 0.7920158683674983 0.7920158683674983)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0823509658304427 0)
"cameras" SET Transform eulerAngles (-6.83252102222427 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4530879448399343
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9369644988484952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02439765310737592
"cameras/drone/drone0" SET Transform localPosition (0.8378781838262628 0.3844728951644593 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11555056988337964 1.2282835041771227 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -11 9)
"cameras/drone/drone0" SET Transform localScale (1.321979321768297 1.321979321768297 1.321979321768297)
"cameras/drone/drone1" SET Transform localEulerAngles (3 9 4)
"cameras/drone/drone1" SET Transform localScale (0.7438413616815283 0.7438413616815283 0.7438413616815283)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.681483258572218 0)
"cameras" SET Transform eulerAngles (-18.638871705895 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5209071343411171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5556339484805095
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29354728696573684
"cameras/drone/drone0" SET Transform localPosition (0.09709822257370626 0.5303503852355202 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7233973279636552 0.8999642073972389 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -2 -1)
"cameras/drone/drone0" SET Transform localScale (1.4661755021229008 1.4661755021229008 1.4661755021229008)
"cameras/drone/drone1" SET Transform localEulerAngles (17 7 -2)
"cameras/drone/drone1" SET Transform localScale (0.7341397614931399 0.7341397614931399 0.7341397614931399)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3242440333395176 0)
"cameras" SET Transform eulerAngles (-5.843044743433335 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5701283133319324
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.888133531675171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3637870410531592
"cameras/drone/drone0" SET Transform localPosition (0.6419414975913325 -0.19709078475970937 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5091504811158032 1.157022032556707 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 0 7)
"cameras/drone/drone0" SET Transform localScale (0.8752919018222844 0.8752919018222844 0.8752919018222844)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -11 3)
"cameras/drone/drone1" SET Transform localScale (0.9187089376960322 0.9187089376960322 0.9187089376960322)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5942930362326395 0)
"cameras" SET Transform eulerAngles (-13.415535251370635 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5183957510130033
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9347381390194575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28352087576866053
"cameras/drone/drone0" SET Transform localPosition (-0.4283727528520701 0.3189973287896271 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5430723570931453 0.8520311558633344 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 0 14)
"cameras/drone/drone0" SET Transform localScale (1.3773055365520581 1.3773055365520581 1.3773055365520581)
"cameras/drone/drone1" SET Transform localEulerAngles (20 10 5)
"cameras/drone/drone1" SET Transform localScale (0.9198232426757944 0.9198232426757944 0.9198232426757944)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.065471758771431 0)
"cameras" SET Transform eulerAngles (2.447772657702693 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40209680078009336
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8471532705647564
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2853516922710279
"cameras/drone/drone0" SET Transform localPosition (0.21961820661608433 -0.06786321898969755 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4115170812307709 0.8610544648535707 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 7 20)
"cameras/drone/drone0" SET Transform localScale (1.301449145277397 1.301449145277397 1.301449145277397)
"cameras/drone/drone1" SET Transform localEulerAngles (19 14 19)
"cameras/drone/drone1" SET Transform localScale (1.2541661586721249 1.2541661586721249 1.2541661586721249)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.129396040671492 0)
"cameras" SET Transform eulerAngles (6.982052384137511 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9398161233318226
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2054060522366699
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37121354902423587
"cameras/drone/drone0" SET Transform localPosition (-0.4449671850467928 0.15844968339827542 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2253650190225116 1.2407298114031522 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 0 -20)
"cameras/drone/drone0" SET Transform localScale (0.9239035550277027 0.9239035550277027 0.9239035550277027)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -2 10)
"cameras/drone/drone1" SET Transform localScale (0.963278908518644 0.963278908518644 0.963278908518644)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.45571090571755 0)
"cameras" SET Transform eulerAngles (3.624167622071262 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3132838924940868
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8685413482658553
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3015287867127256
"cameras/drone/drone0" SET Transform localPosition (0.6178699747249095 0.020294904296180583 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0716725712505974 1.0355794002287297 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 6 14)
"cameras/drone/drone0" SET Transform localScale (1.08218920844483 1.08218920844483 1.08218920844483)
"cameras/drone/drone1" SET Transform localEulerAngles (13 14 8)
"cameras/drone/drone1" SET Transform localScale (1.0820240239250514 1.0820240239250514 1.0820240239250514)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.390690532824404 0)
"cameras" SET Transform eulerAngles (-12.78646918120459 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3232716320901778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7092188478708161
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2487297529059812
"cameras/drone/drone0" SET Transform localPosition (0.6456397427590088 0.10053924440821554 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.26287551643696827 1.0433630843082058 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -8 -18)
"cameras/drone/drone0" SET Transform localScale (1.175355227342025 1.175355227342025 1.175355227342025)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -13 -14)
"cameras/drone/drone1" SET Transform localScale (0.8169883601700352 0.8169883601700352 0.8169883601700352)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.557939494017718 0)
"cameras" SET Transform eulerAngles (15.51320973321458 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4073158499156681
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3861226400219615
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3265456877223338
"cameras/drone/drone0" SET Transform localPosition (1.0363036471526088 0.6873227775894866 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08306604733550937 1.1120179350738693 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 17 8)
"cameras/drone/drone0" SET Transform localScale (1.1620633125522093 1.1620633125522093 1.1620633125522093)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -19 3)
"cameras/drone/drone1" SET Transform localScale (0.8212953086959395 0.8212953086959395 0.8212953086959395)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.211509283271475 0)
"cameras" SET Transform eulerAngles (5.315265109743255 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5803031890004027
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6259489334504251
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16222902248312196
"cameras/drone/drone0" SET Transform localPosition (-0.19305253295878333 0.6095873500836027 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9845434079375461 0.9204810822404914 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -17 -11)
"cameras/drone/drone0" SET Transform localScale (0.8518566240101256 0.8518566240101256 0.8518566240101256)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -3 15)
"cameras/drone/drone1" SET Transform localScale (0.7754648434945103 0.7754648434945103 0.7754648434945103)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.841951530676626 0)
"cameras" SET Transform eulerAngles (-1.3695434331920566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4720901296901663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0985852416376194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16194853742002888
"cameras/drone/drone0" SET Transform localPosition (0.5967341428157305 0.5315275871173613 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7822688363978907 1.1376548247473206 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 0 9)
"cameras/drone/drone0" SET Transform localScale (1.3692839344601282 1.3692839344601282 1.3692839344601282)
"cameras/drone/drone1" SET Transform localEulerAngles (8 17 16)
"cameras/drone/drone1" SET Transform localScale (1.2968535316115712 1.2968535316115712 1.2968535316115712)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.359503460763733 0)
"cameras" SET Transform eulerAngles (-3.3580577260149624 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.876394931547788
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9482966488295186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2930624152756548
"cameras/drone/drone0" SET Transform localPosition (0.960100495834842 0.5074839200643533 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1573310750713628 1.0093022146864816 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -17 12)
"cameras/drone/drone0" SET Transform localScale (1.0800735335866694 1.0800735335866694 1.0800735335866694)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -17 -4)
"cameras/drone/drone1" SET Transform localScale (1.1171198209262474 1.1171198209262474 1.1171198209262474)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.628907031933402 0)
"cameras" SET Transform eulerAngles (-11.968848870725534 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6242401721275579
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6236683965894325
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.045567840179120724
"cameras/drone/drone0" SET Transform localPosition (1.186166839472697 0.02013430293753654 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.70105228998753 1.2180454719761413 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 1 19)
"cameras/drone/drone0" SET Transform localScale (1.1460832771789697 1.1460832771789697 1.1460832771789697)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -17 1)
"cameras/drone/drone1" SET Transform localScale (0.9675659063995028 0.9675659063995028 0.9675659063995028)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.978719659938244 0)
"cameras" SET Transform eulerAngles (18.591172064473184 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9383491855659036
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9703333089739619
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3251302026962219
"cameras/drone/drone0" SET Transform localPosition (0.23818171151133138 -0.02589433197196639 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.664043262863102 0.9453514793014421 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 19 13)
"cameras/drone/drone0" SET Transform localScale (1.1913301273188823 1.1913301273188823 1.1913301273188823)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -2 4)
"cameras/drone/drone1" SET Transform localScale (1.2870133163603192 1.2870133163603192 1.2870133163603192)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.283301442582758 0)
"cameras" SET Transform eulerAngles (0.6742926609395639 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5242506921475587
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5920811242697668
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2825688487687577
"cameras/drone/drone0" SET Transform localPosition (0.9205361534952645 -0.08104287868789811 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.022634980502566515 1.1439933501085782 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 20 -6)
"cameras/drone/drone0" SET Transform localScale (1.1843490788625677 1.1843490788625677 1.1843490788625677)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -12 16)
"cameras/drone/drone1" SET Transform localScale (0.7543491742795854 0.7543491742795854 0.7543491742795854)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7566575133599986 0)
"cameras" SET Transform eulerAngles (-13.15948129736078 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7062112350633387
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0966842061332889
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.041817086936763476
"cameras/drone/drone0" SET Transform localPosition (0.7509211608769673 0.45363357723801084 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5379773714079229 0.8810516546377256 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -13 -1)
"cameras/drone/drone0" SET Transform localScale (1.4432291057533386 1.4432291057533386 1.4432291057533386)
"cameras/drone/drone1" SET Transform localEulerAngles (20 12 6)
"cameras/drone/drone1" SET Transform localScale (1.2316349115147993 1.2316349115147993 1.2316349115147993)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.162441855150244 0)
"cameras" SET Transform eulerAngles (-6.44104118970807 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5024978062606604
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4504545272653404
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38352617193805166
"cameras/drone/drone0" SET Transform localPosition (-0.5069793267228007 0.22377856744281516 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9913545974070115 0.913339696121368 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -11 9)
"cameras/drone/drone0" SET Transform localScale (1.023006580118811 1.023006580118811 1.023006580118811)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -2 -1)
"cameras/drone/drone1" SET Transform localScale (1.2907739349308498 1.2907739349308498 1.2907739349308498)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.604672846102027 0)
"cameras" SET Transform eulerAngles (2.3968040855942547 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9204300273183945
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.632774432857719
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26811886997250006
"cameras/drone/drone0" SET Transform localPosition (0.5519446079545869 0.5104429926482439 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4618207388821628 0.8396832634192837 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 17 -19)
"cameras/drone/drone0" SET Transform localScale (0.7975936496639516 0.7975936496639516 0.7975936496639516)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 14 -5)
"cameras/drone/drone1" SET Transform localScale (0.8344016449558102 0.8344016449558102 0.8344016449558102)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.682969043108187 0)
"cameras" SET Transform eulerAngles (11.747911924313978 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.56235214873417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9253388838025269
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3741056865856427
"cameras/drone/drone0" SET Transform localPosition (0.8466212846286163 0.5817362966337067 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.42727882133802353 1.2517360226882774 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 17 -15)
"cameras/drone/drone0" SET Transform localScale (1.4523402516669606 1.4523402516669606 1.4523402516669606)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -17 -13)
"cameras/drone/drone1" SET Transform localScale (1.173994788792777 1.173994788792777 1.173994788792777)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.098899935419437 0)
"cameras" SET Transform eulerAngles (11.813171005438925 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4855260779502117
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2051573468514687
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3131220149897716
"cameras/drone/drone0" SET Transform localPosition (0.1936513625902978 0.13405506770568693 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8464281637067119 1.1898580246130523 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -2 -13)
"cameras/drone/drone0" SET Transform localScale (0.9868039553160062 0.9868039553160062 0.9868039553160062)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 13 -3)
"cameras/drone/drone1" SET Transform localScale (1.4450239957496596 1.4450239957496596 1.4450239957496596)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.922379600430806 0)
"cameras" SET Transform eulerAngles (-5.035962903693122 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3743003964286111
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0306612685142138
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22863766008024952
"cameras/drone/drone0" SET Transform localPosition (-1.0064355589401508 0.08231994845432139 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.121005117201307 0.8513455802638543 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 5 -10)
"cameras/drone/drone0" SET Transform localScale (1.3273437512973059 1.3273437512973059 1.3273437512973059)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -19 -10)
"cameras/drone/drone1" SET Transform localScale (1.0957382636807482 1.0957382636807482 1.0957382636807482)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4530854555634374 0)
"cameras" SET Transform eulerAngles (-18.083029674599743 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6183303845376589
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6361164467383666
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.023498584354328722
"cameras/drone/drone0" SET Transform localPosition (0.9068225073601719 0.24317822394143124 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0713994741945643 0.91667416010601 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -18 -8)
"cameras/drone/drone0" SET Transform localScale (0.96575041529039 0.96575041529039 0.96575041529039)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -15 -19)
"cameras/drone/drone1" SET Transform localScale (1.1699023588391222 1.1699023588391222 1.1699023588391222)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4846937867167593 0)
"cameras" SET Transform eulerAngles (-8.33572214569466 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5001252950108444
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1832935878597006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06988450397868583
"cameras/drone/drone0" SET Transform localPosition (0.24948825180961554 0.1907482162514303 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9857320316589429 1.173897911083118 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -4 -20)
"cameras/drone/drone0" SET Transform localScale (0.8213571753852267 0.8213571753852267 0.8213571753852267)
"cameras/drone/drone1" SET Transform localEulerAngles (5 7 -13)
"cameras/drone/drone1" SET Transform localScale (0.9340860942656821 0.9340860942656821 0.9340860942656821)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.299104956685408 0)
"cameras" SET Transform eulerAngles (10.163948285067626 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2909849072887976
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.431239507252594
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3252963520337818
"cameras/drone/drone0" SET Transform localPosition (-0.25314389930359726 0.03804695695685373 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6213260319191731 1.2551083092248039 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 17 4)
"cameras/drone/drone0" SET Transform localScale (1.1435421435447402 1.1435421435447402 1.1435421435447402)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 5 7)
"cameras/drone/drone1" SET Transform localScale (1.3648106392404038 1.3648106392404038 1.3648106392404038)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0965964280423375 0)
"cameras" SET Transform eulerAngles (-11.049414030819191 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6712284457688877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0066368681002762
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27368642386629055
"cameras/drone/drone0" SET Transform localPosition (0.3708213507170519 0.01978699824398994 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1589663216345736 1.0203135859014887 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 0 6)
"cameras/drone/drone0" SET Transform localScale (1.4934538893339626 1.4934538893339626 1.4934538893339626)
"cameras/drone/drone1" SET Transform localEulerAngles (4 18 15)
"cameras/drone/drone1" SET Transform localScale (0.8461716789140246 0.8461716789140246 0.8461716789140246)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7568381287338175 0)
"cameras" SET Transform eulerAngles (17.835295193610307 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0854232946463491
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8816321375259473
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03441682695981956
"cameras/drone/drone0" SET Transform localPosition (0.6433181333747999 -0.09078890611553841 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0690854268391605 0.8772637180595275 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -10 11)
"cameras/drone/drone0" SET Transform localScale (0.8717421318121117 0.8717421318121117 0.8717421318121117)
"cameras/drone/drone1" SET Transform localEulerAngles (4 11 15)
"cameras/drone/drone1" SET Transform localScale (1.2741464987134858 1.2741464987134858 1.2741464987134858)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.82153857081591 0)
"cameras" SET Transform eulerAngles (16.40220899344262 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.481600672696508
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7534990733912186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20560098892588288
"cameras/drone/drone0" SET Transform localPosition (-0.047736918315684385 -0.1776096440460459 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19166063007127132 1.2720781516503645 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 19 2)
"cameras/drone/drone0" SET Transform localScale (0.9229138157125044 0.9229138157125044 0.9229138157125044)
"cameras/drone/drone1" SET Transform localEulerAngles (10 3 -14)
"cameras/drone/drone1" SET Transform localScale (1.0905144079802387 1.0905144079802387 1.0905144079802387)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2368233929492107 0)
"cameras" SET Transform eulerAngles (-9.423004441186528 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7610525406440738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8275338483792822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13434292111581336
"cameras/drone/drone0" SET Transform localPosition (1.1627126429952928 0.016555045342916352 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8863216129197429 0.8873119129885098 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -3 10)
"cameras/drone/drone0" SET Transform localScale (1.2764928586001671 1.2764928586001671 1.2764928586001671)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 18 -11)
"cameras/drone/drone1" SET Transform localScale (1.224775475043233 1.224775475043233 1.224775475043233)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.293992686942645 0)
"cameras" SET Transform eulerAngles (-6.451912737776482 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7036490628779627
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5464142831754395
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.035572976005864024
"cameras/drone/drone0" SET Transform localPosition (-0.03653432314029037 0.46946039594747185 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6049967033406829 0.8522569881203188 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -10 13)
"cameras/drone/drone0" SET Transform localScale (0.7763689347901553 0.7763689347901553 0.7763689347901553)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -7 -15)
"cameras/drone/drone1" SET Transform localScale (1.159281192354509 1.159281192354509 1.159281192354509)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1437447968007755 0)
"cameras" SET Transform eulerAngles (12.158892472794179 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4705189277646038
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0904731160664365
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39627528539595136
"cameras/drone/drone0" SET Transform localPosition (-0.165667989054898 0.4804806318135813 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9252538228094933 1.0287125334778717 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 15 -5)
"cameras/drone/drone0" SET Transform localScale (0.714710697088709 0.714710697088709 0.714710697088709)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -20 15)
"cameras/drone/drone1" SET Transform localScale (1.0301727064356916 1.0301727064356916 1.0301727064356916)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5720167294368426 0)
"cameras" SET Transform eulerAngles (4.884437915121769 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6949603868213601
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9474753272797471
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10743540596211934
"cameras/drone/drone0" SET Transform localPosition (0.495190308963009 -0.2779713218087377 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28755852863467535 0.8798802023796628 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -11 -3)
"cameras/drone/drone0" SET Transform localScale (1.0849814238822142 1.0849814238822142 1.0849814238822142)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -11 15)
"cameras/drone/drone1" SET Transform localScale (1.0427243352284523 1.0427243352284523 1.0427243352284523)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.976161564126451 0)
"cameras" SET Transform eulerAngles (4.851039107806141 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5028804818241817
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5217971895887408
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.024203836612779073
"cameras/drone/drone0" SET Transform localPosition (0.44601845100423443 0.5657624400833354 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8506091285564328 1.0162804456405836 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 17 12)
"cameras/drone/drone0" SET Transform localScale (1.4918702112306583 1.4918702112306583 1.4918702112306583)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -17 17)
"cameras/drone/drone1" SET Transform localScale (1.48521227589175 1.48521227589175 1.48521227589175)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.533257614658746 0)
"cameras" SET Transform eulerAngles (-12.94791412685309 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5376056474324432
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.910165198572298
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3483873102978133
"cameras/drone/drone0" SET Transform localPosition (-0.5226703772368643 0.5338042238872309 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3675435392655746 1.1211929760526542 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 6 -16)
"cameras/drone/drone0" SET Transform localScale (1.0550323833856465 1.0550323833856465 1.0550323833856465)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -13 7)
"cameras/drone/drone1" SET Transform localScale (1.132263510646372 1.132263510646372 1.132263510646372)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.331684619624482 0)
"cameras" SET Transform eulerAngles (-13.484219181495924 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.569159246732538
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3432371787112707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07115202512825096
"cameras/drone/drone0" SET Transform localPosition (-0.278617388384213 0.24431134460597154 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.082635194435942 0.8922401124095589 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -15 -6)
"cameras/drone/drone0" SET Transform localScale (0.8552665366418217 0.8552665366418217 0.8552665366418217)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -2 1)
"cameras/drone/drone1" SET Transform localScale (1.4217901097882812 1.4217901097882812 1.4217901097882812)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.269894988881122 0)
"cameras" SET Transform eulerAngles (-1.0096382519605562 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6662339977298937
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8465500372192367
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29357282206344565
"cameras/drone/drone0" SET Transform localPosition (0.28599050753136823 -0.10697462052862744 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.012316372218659888 1.1185442280542488 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -13 -18)
"cameras/drone/drone0" SET Transform localScale (1.3952706898511487 1.3952706898511487 1.3952706898511487)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -14 -13)
"cameras/drone/drone1" SET Transform localScale (0.9975165128066402 0.9975165128066402 0.9975165128066402)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.352021547516154 0)
"cameras" SET Transform eulerAngles (17.145340662821063 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8475938735925848
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8508292530220494
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1402122039580754
"cameras/drone/drone0" SET Transform localPosition (0.9569130456638131 0.012218907630206555 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6733250023610173 1.2390603806998493 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 7 -12)
"cameras/drone/drone0" SET Transform localScale (1.0902223352564375 1.0902223352564375 1.0902223352564375)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -16 -20)
"cameras/drone/drone1" SET Transform localScale (1.4570366408699287 1.4570366408699287 1.4570366408699287)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.942445278556682 0)
"cameras" SET Transform eulerAngles (7.544923637767521 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7833032284913346
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.555170472652112
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.060259814417299176
"cameras/drone/drone0" SET Transform localPosition (-0.08976079920294788 0.13774839385911825 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9901060405648738 0.8315594234964979 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -1 20)
"cameras/drone/drone0" SET Transform localScale (1.4834960522393403 1.4834960522393403 1.4834960522393403)
"cameras/drone/drone1" SET Transform localEulerAngles (7 13 20)
"cameras/drone/drone1" SET Transform localScale (1.3424672253519492 1.3424672253519492 1.3424672253519492)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3246592758802573 0)
"cameras" SET Transform eulerAngles (-15.86302279633076 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.500075671085018
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8305054065008584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37217720280949435
"cameras/drone/drone0" SET Transform localPosition (0.5373865231772548 0.053998901991442805 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21454679853981484 1.116708766954739 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 6 5)
"cameras/drone/drone0" SET Transform localScale (1.1720655676777039 1.1720655676777039 1.1720655676777039)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -10 16)
"cameras/drone/drone1" SET Transform localScale (1.4821844961219113 1.4821844961219113 1.4821844961219113)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4658459813048434 0)
"cameras" SET Transform eulerAngles (-17.110686697340945 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3084596753564015
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9316738321952114
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1717772523920104
"cameras/drone/drone0" SET Transform localPosition (0.07170195853547146 0.5275650449627605 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5362790992805557 1.1263504220476344 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 5 -8)
"cameras/drone/drone0" SET Transform localScale (0.9354161064105432 0.9354161064105432 0.9354161064105432)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -20 -6)
"cameras/drone/drone1" SET Transform localScale (0.956930434057882 0.956930434057882 0.956930434057882)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1271102652773966 0)
"cameras" SET Transform eulerAngles (-2.0120482712635877 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0153973836452734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8317031496684129
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32401583534208134
"cameras/drone/drone0" SET Transform localPosition (0.23814663020121252 0.5546195197124466 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0041510031313232 0.980621744355767 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 6 -3)
"cameras/drone/drone0" SET Transform localScale (1.0192934305072159 1.0192934305072159 1.0192934305072159)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -6 13)
"cameras/drone/drone1" SET Transform localScale (0.7617406421752031 0.7617406421752031 0.7617406421752031)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.348156206771434 0)
"cameras" SET Transform eulerAngles (-13.095598174338017 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6033832583586445
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.151525223927107
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3503655619310807
"cameras/drone/drone0" SET Transform localPosition (-1.1914175863472956 -0.01141760636268735 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1307337965356836 1.0988901912159066 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -1 9)
"cameras/drone/drone0" SET Transform localScale (1.44680560402813 1.44680560402813 1.44680560402813)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -15 6)
"cameras/drone/drone1" SET Transform localScale (0.7541533317572088 0.7541533317572088 0.7541533317572088)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0400793872524066 0)
"cameras" SET Transform eulerAngles (0.45000407500419115 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5045508569870472
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7047863552818432
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2812301167652374
"cameras/drone/drone0" SET Transform localPosition (-0.7345045483882722 0.17140023538196342 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0263828663971963 1.282497808868076 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 5 6)
"cameras/drone/drone0" SET Transform localScale (1.458300220529742 1.458300220529742 1.458300220529742)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 16 20)
"cameras/drone/drone1" SET Transform localScale (0.6114175616455888 0.6114175616455888 0.6114175616455888)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.966232604144709 0)
"cameras" SET Transform eulerAngles (-11.747135981167682 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7186099774984461
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.951534348848041
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37505271352673
"cameras/drone/drone0" SET Transform localPosition (1.1493826067226027 0.5957986953565027 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6461618156091675 1.0614311036092885 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -20 15)
"cameras/drone/drone0" SET Transform localScale (1.312676528287808 1.312676528287808 1.312676528287808)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -18 9)
"cameras/drone/drone1" SET Transform localScale (1.0660238598034315 1.0660238598034315 1.0660238598034315)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.670483907214445 0)
"cameras" SET Transform eulerAngles (-14.205320459715542 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49827121735318913
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1994066050577736
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08632953131131767
"cameras/drone/drone0" SET Transform localPosition (-0.2168285603485145 0.3163737843804811 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1884166578627167 0.8886646059237178 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 5 5)
"cameras/drone/drone0" SET Transform localScale (0.6524440729446849 0.6524440729446849 0.6524440729446849)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -12 -1)
"cameras/drone/drone1" SET Transform localScale (0.6872978112452299 0.6872978112452299 0.6872978112452299)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.91416608503005 0)
"cameras" SET Transform eulerAngles (-4.861452227901424 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8430217853747535
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7195210796051499
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16403463093173826
"cameras/drone/drone0" SET Transform localPosition (0.26532395486504523 0.009426968582682937 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.26346325772938506 1.0104492475870175 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 11 -13)
"cameras/drone/drone0" SET Transform localScale (1.4854129951036326 1.4854129951036326 1.4854129951036326)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -3 11)
"cameras/drone/drone1" SET Transform localScale (0.8365476045925385 0.8365476045925385 0.8365476045925385)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.327441656400831 0)
"cameras" SET Transform eulerAngles (-12.597268007886019 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.705748166137762
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8101330468232297
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2997931926223545
"cameras/drone/drone0" SET Transform localPosition (-0.7570850635832732 0.2610564953549867 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5515776284119646 0.9791220199367154 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -11 15)
"cameras/drone/drone0" SET Transform localScale (0.8913479591924102 0.8913479591924102 0.8913479591924102)
"cameras/drone/drone1" SET Transform localEulerAngles (1 8 15)
"cameras/drone/drone1" SET Transform localScale (1.0870789803013312 1.0870789803013312 1.0870789803013312)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.627058231945613 0)
"cameras" SET Transform eulerAngles (-15.968278006317957 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5765963380865133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0120667119395117
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3660390392834604
"cameras/drone/drone0" SET Transform localPosition (0.3703064775036329 0.4028609441127314 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7310377878053743 0.8736418040392604 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 16 -3)
"cameras/drone/drone0" SET Transform localScale (1.1481833446462668 1.1481833446462668 1.1481833446462668)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 12 -12)
"cameras/drone/drone1" SET Transform localScale (0.8278650025506145 0.8278650025506145 0.8278650025506145)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2774010879283075 0)
"cameras" SET Transform eulerAngles (-3.1170533061000363 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7351879985117227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7587009485048295
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23686575710005983
"cameras/drone/drone0" SET Transform localPosition (0.025050060697095144 0.4529698792136569 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.013245151815888478 1.2470980122512574 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -12 -6)
"cameras/drone/drone0" SET Transform localScale (1.3701150617517452 1.3701150617517452 1.3701150617517452)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -11 9)
"cameras/drone/drone1" SET Transform localScale (1.1620965464480442 1.1620965464480442 1.1620965464480442)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.283479263598728 0)
"cameras" SET Transform eulerAngles (13.79723085345703 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4353722362348713
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5209470952214548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09500634028397492
"cameras/drone/drone0" SET Transform localPosition (1.1871912608939337 -0.2874440261384645 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0307702478509746 0.9343924683579405 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 15 -1)
"cameras/drone/drone0" SET Transform localScale (0.9047921111020704 0.9047921111020704 0.9047921111020704)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -20 11)
"cameras/drone/drone1" SET Transform localScale (1.1537445190469415 1.1537445190469415 1.1537445190469415)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.957440665581092 0)
"cameras" SET Transform eulerAngles (0.23576728649015166 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.862661432464052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9305090044504767
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3588795056267669
"cameras/drone/drone0" SET Transform localPosition (-0.8910458725085276 0.4504397234652128 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.48081385047585834 0.9468218171113354 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -6 -8)
"cameras/drone/drone0" SET Transform localScale (0.7195217012327232 0.7195217012327232 0.7195217012327232)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 5 12)
"cameras/drone/drone1" SET Transform localScale (1.2296959755594776 1.2296959755594776 1.2296959755594776)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.463695341327134 0)
"cameras" SET Transform eulerAngles (-13.213112373507787 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6807864239750763
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7776133627133632
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06799149859160383
"cameras/drone/drone0" SET Transform localPosition (-0.41107130457485364 -0.0006870076997009256 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.21816593689000197 1.0254417782278091 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -14 -7)
"cameras/drone/drone0" SET Transform localScale (0.792787417653553 0.792787417653553 0.792787417653553)
"cameras/drone/drone1" SET Transform localEulerAngles (20 9 -10)
"cameras/drone/drone1" SET Transform localScale (1.3897413336099875 1.3897413336099875 1.3897413336099875)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.31347367075632 0)
"cameras" SET Transform eulerAngles (5.926274541885867 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3900610259905886
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4381849187883375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04388818050153587
"cameras/drone/drone0" SET Transform localPosition (0.7283058082416491 0.5784134911726004 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8547616289247515 1.0861455387494614 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 5 17)
"cameras/drone/drone0" SET Transform localScale (1.1029192192468824 1.1029192192468824 1.1029192192468824)
"cameras/drone/drone1" SET Transform localEulerAngles (17 5 3)
"cameras/drone/drone1" SET Transform localScale (1.36057859700851 1.36057859700851 1.36057859700851)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.057612365273866 0)
"cameras" SET Transform eulerAngles (15.206994221060228 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8057491853521983
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7940002429398298
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24897568136776133
"cameras/drone/drone0" SET Transform localPosition (0.25255658203626474 0.03378296154201571 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4133535546235141 1.26345348448549 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -9 15)
"cameras/drone/drone0" SET Transform localScale (0.9674490020603695 0.9674490020603695 0.9674490020603695)
"cameras/drone/drone1" SET Transform localEulerAngles (10 11 16)
"cameras/drone/drone1" SET Transform localScale (1.3982057926075337 1.3982057926075337 1.3982057926075337)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.834269016304554 0)
"cameras" SET Transform eulerAngles (-1.175777811433278 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7076300219914508
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0242682971158745
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0661228650850704
"cameras/drone/drone0" SET Transform localPosition (-0.26000934110378127 -0.047742864905839955 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7243271381574505 0.974457755928676 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -9 5)
"cameras/drone/drone0" SET Transform localScale (1.0315294296445723 1.0315294296445723 1.0315294296445723)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 1 4)
"cameras/drone/drone1" SET Transform localScale (1.0540981944116814 1.0540981944116814 1.0540981944116814)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.949494805578047 0)
"cameras" SET Transform eulerAngles (1.5834269502331502 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5009596536611102
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.589213256278108
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.020379517197603916
"cameras/drone/drone0" SET Transform localPosition (0.04777959110159702 0.2996741309772008 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0060439405684896 1.1665093746863153 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -16 20)
"cameras/drone/drone0" SET Transform localScale (0.7055861131895886 0.7055861131895886 0.7055861131895886)
"cameras/drone/drone1" SET Transform localEulerAngles (6 4 14)
"cameras/drone/drone1" SET Transform localScale (0.9344259998716575 0.9344259998716575 0.9344259998716575)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.479177658066851 0)
"cameras" SET Transform eulerAngles (-10.932036164436756 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5106375692045323
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0580782250751326
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1639561103659662
"cameras/drone/drone0" SET Transform localPosition (0.6162956814416167 -0.15920096977580994 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2503844580667739 1.1867689566372879 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -20 -19)
"cameras/drone/drone0" SET Transform localScale (0.8176162920129234 0.8176162920129234 0.8176162920129234)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -20 -10)
"cameras/drone/drone1" SET Transform localScale (1.128146603889721 1.128146603889721 1.128146603889721)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.940672619104137 0)
"cameras" SET Transform eulerAngles (-19.073493365039603 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6013034878935218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7385401997637322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17640031833110692
"cameras/drone/drone0" SET Transform localPosition (-0.44457446185344973 0.36586798829593375 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3368767247846247 1.13176154961125 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 3 6)
"cameras/drone/drone0" SET Transform localScale (0.9472963689069857 0.9472963689069857 0.9472963689069857)
"cameras/drone/drone1" SET Transform localEulerAngles (16 8 -3)
"cameras/drone/drone1" SET Transform localScale (1.495053440235817 1.495053440235817 1.495053440235817)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7019210345107982 0)
"cameras" SET Transform eulerAngles (-16.173012049787165 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47265374593359477
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.909229289574284
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08397998990265756
"cameras/drone/drone0" SET Transform localPosition (0.4869907113263483 0.00941433943692599 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9359858977661835 0.8985762006995581 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -3 5)
"cameras/drone/drone0" SET Transform localScale (0.7677626083445974 0.7677626083445974 0.7677626083445974)
"cameras/drone/drone1" SET Transform localEulerAngles (16 17 -4)
"cameras/drone/drone1" SET Transform localScale (0.8428032042415157 0.8428032042415157 0.8428032042415157)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.285622935003768 0)
"cameras" SET Transform eulerAngles (-13.459271150481253 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.239700397860041
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7570129632136964
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.030988800547446838
"cameras/drone/drone0" SET Transform localPosition (-0.3104149415655889 -0.14173789942775267 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.784308054042396 1.2247394373506733 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 3 -17)
"cameras/drone/drone0" SET Transform localScale (1.1006485585493873 1.1006485585493873 1.1006485585493873)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 18 17)
"cameras/drone/drone1" SET Transform localScale (1.0592895917622311 1.0592895917622311 1.0592895917622311)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.508011372502129 0)
"cameras" SET Transform eulerAngles (-5.8933354678932925 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4925074430265038
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9243904266867439
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10233188195693527
"cameras/drone/drone0" SET Transform localPosition (-0.7632902441576207 0.5779263097835039 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.10590132470021407 0.9041739437133991 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -1 10)
"cameras/drone/drone0" SET Transform localScale (1.16049773585429 1.16049773585429 1.16049773585429)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -6 -19)
"cameras/drone/drone1" SET Transform localScale (0.6551414239176192 0.6551414239176192 0.6551414239176192)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.253058545458568 0)
"cameras" SET Transform eulerAngles (-0.19114746101971392 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9957204719902705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8042132094828447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32041747025073053
"cameras/drone/drone0" SET Transform localPosition (1.01499595831081 0.09955692297513413 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6054041871842779 1.2665674660434556 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 4 20)
"cameras/drone/drone0" SET Transform localScale (1.0522664866844247 1.0522664866844247 1.0522664866844247)
"cameras/drone/drone1" SET Transform localEulerAngles (18 11 3)
"cameras/drone/drone1" SET Transform localScale (0.9752376593458485 0.9752376593458485 0.9752376593458485)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.10555134100313 0)
"cameras" SET Transform eulerAngles (-1.0243780066352635 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4934942694282154
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8554885359208957
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24298804880672686
"cameras/drone/drone0" SET Transform localPosition (0.5408547804407968 0.40120312720750945 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5767670512993421 0.9823316100147148 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 16 8)
"cameras/drone/drone0" SET Transform localScale (1.1561408989451323 1.1561408989451323 1.1561408989451323)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -6 12)
"cameras/drone/drone1" SET Transform localScale (0.6320773036927334 0.6320773036927334 0.6320773036927334)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.397355569995418 0)
"cameras" SET Transform eulerAngles (13.797744184858956 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4602094780310317
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.456204219081545
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2400991846713687
"cameras/drone/drone0" SET Transform localPosition (-1.1672601335929096 0.443772031308121 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0954531441164943 1.0311800519717391 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -1 -4)
"cameras/drone/drone0" SET Transform localScale (1.4864169057663004 1.4864169057663004 1.4864169057663004)
"cameras/drone/drone1" SET Transform localEulerAngles (12 14 -6)
"cameras/drone/drone1" SET Transform localScale (0.9646254881693384 0.9646254881693384 0.9646254881693384)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.491417413128582 0)
"cameras" SET Transform eulerAngles (10.290640763400777 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.575657939445081
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4429546879964217
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38127239163606963
"cameras/drone/drone0" SET Transform localPosition (-0.16857398333839413 -0.26008149102905503 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9939874188551855 0.8172057541892515 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -2 -19)
"cameras/drone/drone0" SET Transform localScale (1.3391240254206842 1.3391240254206842 1.3391240254206842)
"cameras/drone/drone1" SET Transform localEulerAngles (6 6 -11)
"cameras/drone/drone1" SET Transform localScale (0.8078991307230172 0.8078991307230172 0.8078991307230172)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.214371048189251 0)
"cameras" SET Transform eulerAngles (-18.394261574638335 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5375335989629706
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6766752146052213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09011560903233105
"cameras/drone/drone0" SET Transform localPosition (0.17248301916842101 -0.23487392934983392 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.594857811009682 1.1558548493155487 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 3 -2)
"cameras/drone/drone0" SET Transform localScale (1.4762620995576705 1.4762620995576705 1.4762620995576705)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -15 -14)
"cameras/drone/drone1" SET Transform localScale (1.2118843265218056 1.2118843265218056 1.2118843265218056)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8331190677159643 0)
"cameras" SET Transform eulerAngles (16.811719102486805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1286363799398833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.066353625023174
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12979059624917816
"cameras/drone/drone0" SET Transform localPosition (-0.021370131097407707 0.033196697547623055 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9524662618863469 1.2783524213916229 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -11 -9)
"cameras/drone/drone0" SET Transform localScale (0.6558609307866733 0.6558609307866733 0.6558609307866733)
"cameras/drone/drone1" SET Transform localEulerAngles (6 17 9)
"cameras/drone/drone1" SET Transform localScale (0.9491877852179191 0.9491877852179191 0.9491877852179191)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.659494379616267 0)
"cameras" SET Transform eulerAngles (-12.323498684016805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.277017460740024
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.847430234276275
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1265361399705922
"cameras/drone/drone0" SET Transform localPosition (1.0486893176783811 -0.22251118075487492 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5354465225722684 1.233582075790328 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -13 -14)
"cameras/drone/drone0" SET Transform localScale (1.4504374326008307 1.4504374326008307 1.4504374326008307)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 3 -1)
"cameras/drone/drone1" SET Transform localScale (1.3504495790350908 1.3504495790350908 1.3504495790350908)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
