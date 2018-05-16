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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 163 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 41 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 76 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET Transform position (0 25 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-11.295726926153355 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 85
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.9204734692873626 0)
"cameras" SET Transform eulerAngles (-12.986076669114478 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4694167256013566
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4042713280635517
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.062276667757250694
"cameras/drone/drone0" SET Transform localPosition (0.1308242712298433 0.29182239815768546 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8530495692005162 0.815146950482507 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -19 -19)
"cameras/drone/drone0" SET Transform localScale (1.3571318690444907 1.3571318690444907 1.3571318690444907)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -11 16)
"cameras/drone/drone1" SET Transform localScale (0.9767063984362819 0.9767063984362819 0.9767063984362819)
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
"cameras" SET Transform position (0 3.1135770138859833 0)
"cameras" SET Transform eulerAngles (6.236860492385684 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5085625180354696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9090942887149595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.042648382081243025
"cameras/drone/drone0" SET Transform localPosition (-0.03353614494504775 -0.13900937391086937 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40450217277856026 0.8556301481756854 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -16 -7)
"cameras/drone/drone0" SET Transform localScale (0.7408906135354127 0.7408906135354127 0.7408906135354127)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -4 10)
"cameras/drone/drone1" SET Transform localScale (0.7310962593791108 0.7310962593791108 0.7310962593791108)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.170043872036317 0)
"cameras" SET Transform eulerAngles (19.10982460700049 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5558183941646367
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5182176558167542
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.021699490713082525
"cameras/drone/drone0" SET Transform localPosition (0.7759083944283667 0.6405569852803539 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18773617244796625 0.8955767505708019 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -3 -11)
"cameras/drone/drone0" SET Transform localScale (1.4147276384825087 1.4147276384825087 1.4147276384825087)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -20 5)
"cameras/drone/drone1" SET Transform localScale (0.9927439299983405 0.9927439299983405 0.9927439299983405)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6102184171207243 0)
"cameras" SET Transform eulerAngles (15.78030433466332 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.371236791170238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7578645755448765
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.028800906077603952
"cameras/drone/drone0" SET Transform localPosition (0.6017681078954458 -0.2373875891600989 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.18404306831902 1.0852760196112075 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -18 -12)
"cameras/drone/drone0" SET Transform localScale (0.8052357268140408 0.8052357268140408 0.8052357268140408)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -1 -20)
"cameras/drone/drone1" SET Transform localScale (0.7307777087863417 0.7307777087863417 0.7307777087863417)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8130951121425993 0)
"cameras" SET Transform eulerAngles (10.267792932442493 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6720671793368532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7251624315708958
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22282553472557215
"cameras/drone/drone0" SET Transform localPosition (0.9809787427849594 -0.16404754051744258 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.29757078735205666 1.267745918172549 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 8 -3)
"cameras/drone/drone0" SET Transform localScale (1.3078081592647512 1.3078081592647512 1.3078081592647512)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 3 -13)
"cameras/drone/drone1" SET Transform localScale (1.147855312396671 1.147855312396671 1.147855312396671)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.90675794787209 0)
"cameras" SET Transform eulerAngles (-0.6685280415364119 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8530022202145039
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9718010586210846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0033120347676602437
"cameras/drone/drone0" SET Transform localPosition (-1.1799907786991908 0.26145244721166633 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1336031406939222 1.2583122519493946 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 11 -2)
"cameras/drone/drone0" SET Transform localScale (1.4720246635041532 1.4720246635041532 1.4720246635041532)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -10 -1)
"cameras/drone/drone1" SET Transform localScale (1.3922810785043938 1.3922810785043938 1.3922810785043938)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1097800106184845 0)
"cameras" SET Transform eulerAngles (-16.230376473668144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.491852526102385
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9500800017165036
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24521361200729244
"cameras/drone/drone0" SET Transform localPosition (0.2749108878597908 -0.22591792971698849 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17295948763586 1.2143491742421946 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -6 -11)
"cameras/drone/drone0" SET Transform localScale (1.178195730595538 1.178195730595538 1.178195730595538)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -15 9)
"cameras/drone/drone1" SET Transform localScale (1.0696487367160237 1.0696487367160237 1.0696487367160237)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.94957509910196 0)
"cameras" SET Transform eulerAngles (2.307480140664037 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5842533022824976
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0494717618818592
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3306915286473372
"cameras/drone/drone0" SET Transform localPosition (0.8156535081470759 -0.11564958666400177 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7386456999698272 1.1860145691167616 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 3 -7)
"cameras/drone/drone0" SET Transform localScale (0.7947897770140467 0.7947897770140467 0.7947897770140467)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -9 -3)
"cameras/drone/drone1" SET Transform localScale (1.0827824637408936 1.0827824637408936 1.0827824637408936)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.382340012664276 0)
"cameras" SET Transform eulerAngles (-9.437114325466789 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6583013018358168
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9081325333104843
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05787793678547999
"cameras/drone/drone0" SET Transform localPosition (-1.1854191099925961 0.24485074468332596 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.168360322039366 1.0626835356207887 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -9 12)
"cameras/drone/drone0" SET Transform localScale (1.141681836167789 1.141681836167789 1.141681836167789)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 4 10)
"cameras/drone/drone1" SET Transform localScale (1.154187547556172 1.154187547556172 1.154187547556172)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1137150288345072 0)
"cameras" SET Transform eulerAngles (-7.965234092562969 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3367966929812878
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.486793992367795
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25417021701538706
"cameras/drone/drone0" SET Transform localPosition (-0.7779646738038097 0.2680306223634617 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3079581784584585 0.8490069163409943 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 9 -5)
"cameras/drone/drone0" SET Transform localScale (1.0440652196484792 1.0440652196484792 1.0440652196484792)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 11 17)
"cameras/drone/drone1" SET Transform localScale (1.2648015788648177 1.2648015788648177 1.2648015788648177)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0006080939768456 0)
"cameras" SET Transform eulerAngles (16.552979787799927 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4616042961508868
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7367832331323267
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3039835993426634
"cameras/drone/drone0" SET Transform localPosition (0.9553882893835752 0.6265613298888579 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9261978449646893 1.043533729226233 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 16 -7)
"cameras/drone/drone0" SET Transform localScale (0.6378213608612253 0.6378213608612253 0.6378213608612253)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 20 10)
"cameras/drone/drone1" SET Transform localScale (0.7760868925896023 0.7760868925896023 0.7760868925896023)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.824954085696745 0)
"cameras" SET Transform eulerAngles (-1.8466205955139792 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6690717303460184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.137900200652384
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.022975796879687982
"cameras/drone/drone0" SET Transform localPosition (0.6748299220271592 0.16949860317220272 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4838659552090937 0.9126223666607455 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -20 -6)
"cameras/drone/drone0" SET Transform localScale (0.821774258522586 0.821774258522586 0.821774258522586)
"cameras/drone/drone1" SET Transform localEulerAngles (4 2 -17)
"cameras/drone/drone1" SET Transform localScale (1.1189682976977875 1.1189682976977875 1.1189682976977875)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.424740661257093 0)
"cameras" SET Transform eulerAngles (7.537966307292358 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6601108634165048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0027172421632957
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2859014637291014
"cameras/drone/drone0" SET Transform localPosition (1.119593826821008 0.36672500748599274 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9284660450049638 1.1128381768349056 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -2 -9)
"cameras/drone/drone0" SET Transform localScale (1.0646959871302175 1.0646959871302175 1.0646959871302175)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -9 -18)
"cameras/drone/drone1" SET Transform localScale (1.3123665462558427 1.3123665462558427 1.3123665462558427)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.209447567050609 0)
"cameras" SET Transform eulerAngles (-8.008018831048084 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8629470176997621
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9276540423027931
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3455371469138518
"cameras/drone/drone0" SET Transform localPosition (0.4528024866720477 0.6434874281655993 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20613622428058798 0.955468338296342 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -6 -6)
"cameras/drone/drone0" SET Transform localScale (1.022759450659896 1.022759450659896 1.022759450659896)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -1 14)
"cameras/drone/drone1" SET Transform localScale (0.609327381527904 0.609327381527904 0.609327381527904)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.322727727364303 0)
"cameras" SET Transform eulerAngles (2.9371595047121417 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5181265740717502
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4718949287593106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16507394050452973
"cameras/drone/drone0" SET Transform localPosition (0.986745580028398 0.3185053923334456 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4747496608477514 1.1310569534141601 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -9 19)
"cameras/drone/drone0" SET Transform localScale (1.1993233725569579 1.1993233725569579 1.1993233725569579)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -11 2)
"cameras/drone/drone1" SET Transform localScale (1.0943651574740134 1.0943651574740134 1.0943651574740134)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.802211604674743 0)
"cameras" SET Transform eulerAngles (-4.773213585752085 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5698750075762073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.055268715043813
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05604955777176049
"cameras/drone/drone0" SET Transform localPosition (-0.40392889082277317 -0.21280934581810246 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.635118233802162 1.160236033123152 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 16 18)
"cameras/drone/drone0" SET Transform localScale (1.3117806109429035 1.3117806109429035 1.3117806109429035)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 14 -4)
"cameras/drone/drone1" SET Transform localScale (1.3963910231071814 1.3963910231071814 1.3963910231071814)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.539850057215649 0)
"cameras" SET Transform eulerAngles (13.556311163332246 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0416683685294719
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1895371402563204
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09134465319005347
"cameras/drone/drone0" SET Transform localPosition (-0.10455070971062286 -0.19432254604031557 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.845742807958137 1.1605063417868613 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 0 -1)
"cameras/drone/drone0" SET Transform localScale (0.6093831836740238 0.6093831836740238 0.6093831836740238)
"cameras/drone/drone1" SET Transform localEulerAngles (12 4 -18)
"cameras/drone/drone1" SET Transform localScale (0.9526130734116603 0.9526130734116603 0.9526130734116603)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.974691399560186 0)
"cameras" SET Transform eulerAngles (-5.010808440797554 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6836393260162612
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8925922728277005
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3908958300490241
"cameras/drone/drone0" SET Transform localPosition (0.8639381984533785 -0.1260934215825697 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5107664684253479 1.2155047714165126 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 2 -6)
"cameras/drone/drone0" SET Transform localScale (1.439768489663047 1.439768489663047 1.439768489663047)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -19 18)
"cameras/drone/drone1" SET Transform localScale (0.9552198702100192 0.9552198702100192 0.9552198702100192)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.678782899761355 0)
"cameras" SET Transform eulerAngles (-14.620983872404235 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.46358577953787
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8212252176080423
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2753663912998881
"cameras/drone/drone0" SET Transform localPosition (0.10026618024352185 0.4932106280415161 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.938390574417999 1.2241189707402818 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -3 9)
"cameras/drone/drone0" SET Transform localScale (1.2584191282306274 1.2584191282306274 1.2584191282306274)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -12 12)
"cameras/drone/drone1" SET Transform localScale (1.4658315959198336 1.4658315959198336 1.4658315959198336)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7789597701789632 0)
"cameras" SET Transform eulerAngles (0.4078041421581702 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6383813647374763
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3801763065968422
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12900121398426295
"cameras/drone/drone0" SET Transform localPosition (0.01285137931446001 0.5130852496982372 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24325120168638525 0.9270351293073422 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -6 13)
"cameras/drone/drone0" SET Transform localScale (1.4965266251096239 1.4965266251096239 1.4965266251096239)
"cameras/drone/drone1" SET Transform localEulerAngles (4 9 -18)
"cameras/drone/drone1" SET Transform localScale (1.0453493652769132 1.0453493652769132 1.0453493652769132)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.768715948160438 0)
"cameras" SET Transform eulerAngles (1.2098431581196891 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.712114149647127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8614907074004696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2846057780870125
"cameras/drone/drone0" SET Transform localPosition (0.04493514499539675 -0.28251163947943553 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.020408488868582708 0.8560218027323773 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -8 17)
"cameras/drone/drone0" SET Transform localScale (0.8905900810059437 0.8905900810059437 0.8905900810059437)
"cameras/drone/drone1" SET Transform localEulerAngles (19 8 13)
"cameras/drone/drone1" SET Transform localScale (1.0365559377911915 1.0365559377911915 1.0365559377911915)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7816823815650045 0)
"cameras" SET Transform eulerAngles (-1.1405886025110057 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4753451282657286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4747013331051655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32701609379363794
"cameras/drone/drone0" SET Transform localPosition (0.958018244992348 0.0542931241819225 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12486338838009026 1.024124304616625 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -11 -20)
"cameras/drone/drone0" SET Transform localScale (0.8408784093062522 0.8408784093062522 0.8408784093062522)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -16 14)
"cameras/drone/drone1" SET Transform localScale (1.0939155416619637 1.0939155416619637 1.0939155416619637)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7911031309142995 0)
"cameras" SET Transform eulerAngles (9.573053441504904 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0152595635364094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7694677069054376
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19047606617788493
"cameras/drone/drone0" SET Transform localPosition (-1.1758321867226726 0.5147012703075158 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8138978315407622 1.0294592371956708 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -9 -16)
"cameras/drone/drone0" SET Transform localScale (1.14498071192643 1.14498071192643 1.14498071192643)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 7 9)
"cameras/drone/drone1" SET Transform localScale (1.0817120830655984 1.0817120830655984 1.0817120830655984)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.153657142635591 0)
"cameras" SET Transform eulerAngles (5.210487568153962 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7331763709370349
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8338686829230402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06312620897055617
"cameras/drone/drone0" SET Transform localPosition (0.9837696234041104 0.3481934005201592 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6707442313781342 1.0597249720418627 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 3 -2)
"cameras/drone/drone0" SET Transform localScale (1.3278269563916778 1.3278269563916778 1.3278269563916778)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -8 7)
"cameras/drone/drone1" SET Transform localScale (1.2194707185193252 1.2194707185193252 1.2194707185193252)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5393898362657636 0)
"cameras" SET Transform eulerAngles (-2.6602839786703747 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2138008357272023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2928948980672392
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34468476283564253
"cameras/drone/drone0" SET Transform localPosition (-0.6022996555473332 0.26800876632691456 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6118964404424518 1.234257300078244 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -10 16)
"cameras/drone/drone0" SET Transform localScale (1.3717521369684484 1.3717521369684484 1.3717521369684484)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -19 -13)
"cameras/drone/drone1" SET Transform localScale (1.3334240176580519 1.3334240176580519 1.3334240176580519)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.02916428853946 0)
"cameras" SET Transform eulerAngles (9.047451685174618 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7076674661548696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.815857453009051
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3436665976889093
"cameras/drone/drone0" SET Transform localPosition (0.08561160738937623 0.1570339352198375 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7196221522760531 1.1339474070384832 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 6 -1)
"cameras/drone/drone0" SET Transform localScale (1.3338038532507484 1.3338038532507484 1.3338038532507484)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 15 17)
"cameras/drone/drone1" SET Transform localScale (0.7891176725806046 0.7891176725806046 0.7891176725806046)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9906583953267147 0)
"cameras" SET Transform eulerAngles (-4.406741059092937 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6069823030929185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.814261832981845
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.321244570230644
"cameras/drone/drone0" SET Transform localPosition (-0.11747955904557994 -0.1540162213198713 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.47116056154923225 0.9185791818683207 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -4 6)
"cameras/drone/drone0" SET Transform localScale (0.7763766158629092 0.7763766158629092 0.7763766158629092)
"cameras/drone/drone1" SET Transform localEulerAngles (6 6 -9)
"cameras/drone/drone1" SET Transform localScale (1.0882596195668905 1.0882596195668905 1.0882596195668905)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.548361096652778 0)
"cameras" SET Transform eulerAngles (0.6742767396464302 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.022612133558908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.790608007266947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.132327659913478
"cameras/drone/drone0" SET Transform localPosition (-1.0958489927728767 0.5334665650067172 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1564160080479275 1.2487211106725955 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -3 -5)
"cameras/drone/drone0" SET Transform localScale (1.4814156515267425 1.4814156515267425 1.4814156515267425)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -9 3)
"cameras/drone/drone1" SET Transform localScale (1.451272764982042 1.451272764982042 1.451272764982042)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2137638037326592 0)
"cameras" SET Transform eulerAngles (-13.10660367235791 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2145315550739773
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9919760493163952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2845297105630246
"cameras/drone/drone0" SET Transform localPosition (0.2845587787429087 -0.12684850415638277 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.07592239895121788 0.9583670608723363 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -13 -5)
"cameras/drone/drone0" SET Transform localScale (0.9525086412934229 0.9525086412934229 0.9525086412934229)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -16 18)
"cameras/drone/drone1" SET Transform localScale (0.73617693851223 0.73617693851223 0.73617693851223)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.738261889636312 0)
"cameras" SET Transform eulerAngles (-16.041556359172503 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4906930314609417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2521284084508815
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18381783210524516
"cameras/drone/drone0" SET Transform localPosition (-0.21109989923346573 0.639600374242314 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06056477707190755 1.2419592287570065 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 19 14)
"cameras/drone/drone0" SET Transform localScale (1.0997245773906594 1.0997245773906594 1.0997245773906594)
"cameras/drone/drone1" SET Transform localEulerAngles (20 18 19)
"cameras/drone/drone1" SET Transform localScale (1.1284306641302364 1.1284306641302364 1.1284306641302364)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.316817516156991 0)
"cameras" SET Transform eulerAngles (-11.900054838500003 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.184169398183445
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9054362998715475
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3276480803147157
"cameras/drone/drone0" SET Transform localPosition (-0.41038669834510333 -0.06340254888637437 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6944194129766841 0.9716018560621165 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -11 15)
"cameras/drone/drone0" SET Transform localScale (1.0121474351321451 1.0121474351321451 1.0121474351321451)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -20 -14)
"cameras/drone/drone1" SET Transform localScale (0.9313357767626649 0.9313357767626649 0.9313357767626649)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0143999342293455 0)
"cameras" SET Transform eulerAngles (-0.5257979709807756 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7007970012946013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6504532549137383
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08343292277454589
"cameras/drone/drone0" SET Transform localPosition (-0.03822092658575693 0.3060247854970684 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9534465263279241 1.1714895606488274 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -9 14)
"cameras/drone/drone0" SET Transform localScale (1.4993133416768016 1.4993133416768016 1.4993133416768016)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 17 -9)
"cameras/drone/drone1" SET Transform localScale (0.967008470465264 0.967008470465264 0.967008470465264)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.628591530243409 0)
"cameras" SET Transform eulerAngles (12.889128673608425 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8567762344581622
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.401358674096056
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.016246916976715698
"cameras/drone/drone0" SET Transform localPosition (0.9304052554111515 -0.11786632318583651 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.46832258575668484 0.9490674634850187 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 9 8)
"cameras/drone/drone0" SET Transform localScale (1.444707681624138 1.444707681624138 1.444707681624138)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -9 -1)
"cameras/drone/drone1" SET Transform localScale (1.359601430270442 1.359601430270442 1.359601430270442)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.341991127076949 0)
"cameras" SET Transform eulerAngles (-3.532021676992727 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5693040241617086
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3217771706659127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26603092637824544
"cameras/drone/drone0" SET Transform localPosition (0.21881997497622985 0.6752709013839788 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0743728399469334 1.2121934981963927 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -13 11)
"cameras/drone/drone0" SET Transform localScale (0.615636984619291 0.615636984619291 0.615636984619291)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -9 19)
"cameras/drone/drone1" SET Transform localScale (0.6629510959987721 0.6629510959987721 0.6629510959987721)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.573439928025797 0)
"cameras" SET Transform eulerAngles (-16.091594318670385 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4610644670686104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7547013564557523
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14079370586094206
"cameras/drone/drone0" SET Transform localPosition (-1.0324003772647816 0.21978343920081628 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8859506004976458 0.8619784581677418 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -11 4)
"cameras/drone/drone0" SET Transform localScale (1.3506656556186933 1.3506656556186933 1.3506656556186933)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 18 -5)
"cameras/drone/drone1" SET Transform localScale (1.251059231579002 1.251059231579002 1.251059231579002)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.718683072892404 0)
"cameras" SET Transform eulerAngles (-11.015720620292907 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0524152783169134
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4066424435117186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37652184652049975
"cameras/drone/drone0" SET Transform localPosition (-0.01839714157417527 0.24411484870036376 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5062873982417205 1.13775358537271 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -14 1)
"cameras/drone/drone0" SET Transform localScale (0.8037680692584659 0.8037680692584659 0.8037680692584659)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -3 9)
"cameras/drone/drone1" SET Transform localScale (1.3308508964471208 1.3308508964471208 1.3308508964471208)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.955999702127052 0)
"cameras" SET Transform eulerAngles (-1.3817496048451758 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.536895736040681
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3251488107339728
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20478518347553806
"cameras/drone/drone0" SET Transform localPosition (0.9831727982251406 -0.02431132900712546 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0276849103678514 1.0189825244324855 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -6 -9)
"cameras/drone/drone0" SET Transform localScale (1.411059329734587 1.411059329734587 1.411059329734587)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -15 9)
"cameras/drone/drone1" SET Transform localScale (0.6818773870480901 0.6818773870480901 0.6818773870480901)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4728693109313777 0)
"cameras" SET Transform eulerAngles (-19.836689021359422 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4814704019724565
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2772447674694773
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2965633506523172
"cameras/drone/drone0" SET Transform localPosition (0.013726480038436684 0.48864233126868234 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6497825632214813 0.8416718297820609 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -19 -19)
"cameras/drone/drone0" SET Transform localScale (0.6260061578709574 0.6260061578709574 0.6260061578709574)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -20 -13)
"cameras/drone/drone1" SET Transform localScale (0.7132206013022145 0.7132206013022145 0.7132206013022145)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.479274446453048 0)
"cameras" SET Transform eulerAngles (6.880063043484206 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5347087127772209
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4099361414881861
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.047453112167949785
"cameras/drone/drone0" SET Transform localPosition (0.9343374955807537 0.1396704365551344 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.13913753343078183 1.0801044759887715 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 13 -13)
"cameras/drone/drone0" SET Transform localScale (1.451520619552253 1.451520619552253 1.451520619552253)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -2 -16)
"cameras/drone/drone1" SET Transform localScale (0.7132313168278263 0.7132313168278263 0.7132313168278263)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.475449381295985 0)
"cameras" SET Transform eulerAngles (7.763424380588567 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2566443105796692
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.812952956692877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38428798033111367
"cameras/drone/drone0" SET Transform localPosition (-0.08116643799456713 -0.060556821618881485 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.064915485446261 1.065614553754776 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -5 0)
"cameras/drone/drone0" SET Transform localScale (1.012670332182867 1.012670332182867 1.012670332182867)
"cameras/drone/drone1" SET Transform localEulerAngles (20 16 10)
"cameras/drone/drone1" SET Transform localScale (1.0678686077242745 1.0678686077242745 1.0678686077242745)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.868281820220675 0)
"cameras" SET Transform eulerAngles (2.4228522905007566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6990056488829766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7494973826320006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10975377396639581
"cameras/drone/drone0" SET Transform localPosition (0.12185044422263336 0.3820518968014363 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9864449608682648 1.1038860884778976 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -17 -2)
"cameras/drone/drone0" SET Transform localScale (0.990276882322852 0.990276882322852 0.990276882322852)
"cameras/drone/drone1" SET Transform localEulerAngles (4 9 13)
"cameras/drone/drone1" SET Transform localScale (0.8151028868240535 0.8151028868240535 0.8151028868240535)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1970697391311607 0)
"cameras" SET Transform eulerAngles (14.975398630806083 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8027390513549628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4619648583169251
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2647188873999473
"cameras/drone/drone0" SET Transform localPosition (-1.0044382066948632 -0.08031165706545057 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1186689901332274 1.0238421591294986 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -1 9)
"cameras/drone/drone0" SET Transform localScale (0.975377479935269 0.975377479935269 0.975377479935269)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -1 11)
"cameras/drone/drone1" SET Transform localScale (1.372616325627799 1.372616325627799 1.372616325627799)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.964667656788746 0)
"cameras" SET Transform eulerAngles (11.896547241207713 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5178804196924776
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1198980113038168
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3442965482980287
"cameras/drone/drone0" SET Transform localPosition (0.7088497288407063 -0.04288438675044154 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32836276828781896 1.1472372873575234 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -15 20)
"cameras/drone/drone0" SET Transform localScale (0.8074766307980447 0.8074766307980447 0.8074766307980447)
"cameras/drone/drone1" SET Transform localEulerAngles (20 6 1)
"cameras/drone/drone1" SET Transform localScale (1.2069734431938262 1.2069734431938262 1.2069734431938262)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.03951676747544 0)
"cameras" SET Transform eulerAngles (15.609919247216155 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4098547776660983
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.531750995834047
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09157215379480706
"cameras/drone/drone0" SET Transform localPosition (-0.5449375619727176 0.5860540453182423 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8002776539500778 0.9225855793314608 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 5 -4)
"cameras/drone/drone0" SET Transform localScale (1.0255327603233058 1.0255327603233058 1.0255327603233058)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -3 4)
"cameras/drone/drone1" SET Transform localScale (1.2694557107977404 1.2694557107977404 1.2694557107977404)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.602397323645159 0)
"cameras" SET Transform eulerAngles (17.200372316096278 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8276065829127467
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9063366224889094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31039614865344967
"cameras/drone/drone0" SET Transform localPosition (1.150182499795662 -0.24912524417669096 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.48850413167074835 1.2143039261109019 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 7 17)
"cameras/drone/drone0" SET Transform localScale (1.4184259564956343 1.4184259564956343 1.4184259564956343)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -4 2)
"cameras/drone/drone1" SET Transform localScale (1.2936999518313748 1.2936999518313748 1.2936999518313748)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.406549114596059 0)
"cameras" SET Transform eulerAngles (-8.061420791665537 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8615740401406407
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0858794808322059
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3553030457824375
"cameras/drone/drone0" SET Transform localPosition (0.9622188963227092 -0.12771231435834424 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2846389640380087 0.9413438138431962 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -14 5)
"cameras/drone/drone0" SET Transform localScale (1.4134230133128665 1.4134230133128665 1.4134230133128665)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -4 9)
"cameras/drone/drone1" SET Transform localScale (1.067670404334549 1.067670404334549 1.067670404334549)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.64291777403436 0)
"cameras" SET Transform eulerAngles (8.737732102768096 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4455498884334816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9682587318506473
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09805781225104787
"cameras/drone/drone0" SET Transform localPosition (0.653882799355066 -0.09758499918340596 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1743962254486882 1.1258992858871608 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -11 1)
"cameras/drone/drone0" SET Transform localScale (1.3369622450579328 1.3369622450579328 1.3369622450579328)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -5 -5)
"cameras/drone/drone1" SET Transform localScale (1.2246058777002116 1.2246058777002116 1.2246058777002116)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1646596195628094 0)
"cameras" SET Transform eulerAngles (11.756192936581378 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.41808847632498
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5266393146500123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025882866816548056
"cameras/drone/drone0" SET Transform localPosition (0.936648742812175 0.6066739919707032 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6513760024534124 1.2739997642852714 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 8 -3)
"cameras/drone/drone0" SET Transform localScale (0.8279160738822502 0.8279160738822502 0.8279160738822502)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 19 9)
"cameras/drone/drone1" SET Transform localScale (0.9998530518064479 0.9998530518064479 0.9998530518064479)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.507577331926224 0)
"cameras" SET Transform eulerAngles (-13.719118914883456 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.558176596091951
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7416696129890061
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2344013743973882
"cameras/drone/drone0" SET Transform localPosition (-0.8910085092536009 -0.2091954540297098 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1952541715775051 1.1811332723795205 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 18 -2)
"cameras/drone/drone0" SET Transform localScale (1.4756875049343265 1.4756875049343265 1.4756875049343265)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 5 -20)
"cameras/drone/drone1" SET Transform localScale (0.7814782643118211 0.7814782643118211 0.7814782643118211)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.860392227015675 0)
"cameras" SET Transform eulerAngles (-14.96546541550526 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.306407189906243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6526111655510238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24041531303562885
"cameras/drone/drone0" SET Transform localPosition (-1.0541185636686294 0.12880494753395372 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05758368360420563 1.1163559857706897 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 15 5)
"cameras/drone/drone0" SET Transform localScale (0.959486969531826 0.959486969531826 0.959486969531826)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -11 0)
"cameras/drone/drone1" SET Transform localScale (1.2243015764100853 1.2243015764100853 1.2243015764100853)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6730404630790643 0)
"cameras" SET Transform eulerAngles (-0.9656110465704195 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6751735369567488
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.048401330095658
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2893824070920427
"cameras/drone/drone0" SET Transform localPosition (0.5606591476457432 0.31224156215293936 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1519054038068517 0.9868738963322012 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -20 3)
"cameras/drone/drone0" SET Transform localScale (1.3547248280518471 1.3547248280518471 1.3547248280518471)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -9 -8)
"cameras/drone/drone1" SET Transform localScale (1.3740706554796986 1.3740706554796986 1.3740706554796986)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.946564709108205 0)
"cameras" SET Transform eulerAngles (-3.745266687117976 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.000041683128662
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2543003259886754
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37216453583303305
"cameras/drone/drone0" SET Transform localPosition (1.1420189717852638 0.3999238419554276 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5408757334182948 1.1227913618129384 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -1 -10)
"cameras/drone/drone0" SET Transform localScale (1.4572322915838138 1.4572322915838138 1.4572322915838138)
"cameras/drone/drone1" SET Transform localEulerAngles (16 4 18)
"cameras/drone/drone1" SET Transform localScale (1.0256718284929827 1.0256718284929827 1.0256718284929827)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.080715450139154 0)
"cameras" SET Transform eulerAngles (-9.343541412602555 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.596194271365702
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.575865199262426
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.006961332431549439
"cameras/drone/drone0" SET Transform localPosition (-0.2910749392030808 0.2819587584917131 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3605575092981168 1.0528908365589007 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 2 -4)
"cameras/drone/drone0" SET Transform localScale (1.4259368822495375 1.4259368822495375 1.4259368822495375)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 7 -9)
"cameras/drone/drone1" SET Transform localScale (1.3013652794781194 1.3013652794781194 1.3013652794781194)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.375535776175469 0)
"cameras" SET Transform eulerAngles (-4.584088812074452 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.411503759216091
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.158737931659429
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19790679393978713
"cameras/drone/drone0" SET Transform localPosition (0.2871207402192262 0.0583408407300145 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.39249041737425594 1.011569537248333 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -1 5)
"cameras/drone/drone0" SET Transform localScale (0.7971753603562245 0.7971753603562245 0.7971753603562245)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -3 -18)
"cameras/drone/drone1" SET Transform localScale (1.332046578357904 1.332046578357904 1.332046578357904)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.340412441752331 0)
"cameras" SET Transform eulerAngles (13.897134280391356 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2752792997664948
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4272032884930628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30895701497956307
"cameras/drone/drone0" SET Transform localPosition (0.18869345417579209 -0.048350403633856176 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.10711945835643077 1.0216722704284091 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -8 -11)
"cameras/drone/drone0" SET Transform localScale (0.8162967249166473 0.8162967249166473 0.8162967249166473)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -4 -4)
"cameras/drone/drone1" SET Transform localScale (1.198592454445382 1.198592454445382 1.198592454445382)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1251035440274473 0)
"cameras" SET Transform eulerAngles (0.8745930840313676 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1565734162108605
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5662496577791052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18516798315329297
"cameras/drone/drone0" SET Transform localPosition (0.8387120586572354 -0.15094027916929315 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.44403850376141796 1.1352561958972487 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -17 -16)
"cameras/drone/drone0" SET Transform localScale (1.464732015855993 1.464732015855993 1.464732015855993)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 9 1)
"cameras/drone/drone1" SET Transform localScale (0.751624573316676 0.751624573316676 0.751624573316676)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.117237153383513 0)
"cameras" SET Transform eulerAngles (9.70443168692103 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1885700771217595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1008026688163883
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3706364552375465
"cameras/drone/drone0" SET Transform localPosition (1.1397860760646654 0.3628754532089146 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5371181548969703 1.088139791580472 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -6 -16)
"cameras/drone/drone0" SET Transform localScale (0.8378662244631149 0.8378662244631149 0.8378662244631149)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -8 19)
"cameras/drone/drone1" SET Transform localScale (0.8399685804548056 0.8399685804548056 0.8399685804548056)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4435458426397743 0)
"cameras" SET Transform eulerAngles (-12.202716162601357 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.01700571510899
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9414661396812969
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27142443296246394
"cameras/drone/drone0" SET Transform localPosition (0.6736702073991776 0.28342872082643805 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.033946552961469534 1.0253377316972483 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -18 -2)
"cameras/drone/drone0" SET Transform localScale (0.6527630795285374 0.6527630795285374 0.6527630795285374)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -17 19)
"cameras/drone/drone1" SET Transform localScale (1.3423355124296665 1.3423355124296665 1.3423355124296665)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8850209738439747 0)
"cameras" SET Transform eulerAngles (1.3523528230269832 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1294625568976024
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1655373944011662
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09818860992202288
"cameras/drone/drone0" SET Transform localPosition (-0.9963133233028945 0.3811203709786211 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7320352060368832 0.9438875480774749 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -4 16)
"cameras/drone/drone0" SET Transform localScale (0.9950750531346901 0.9950750531346901 0.9950750531346901)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -16 4)
"cameras/drone/drone1" SET Transform localScale (1.4622855556767114 1.4622855556767114 1.4622855556767114)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.695996138133402 0)
"cameras" SET Transform eulerAngles (14.206163858174861 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.484498844275842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.441979350714005
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0598433751308709
"cameras/drone/drone0" SET Transform localPosition (0.7101559047598771 0.09635121595714341 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8069243163289549 1.2293812672989288 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -18 6)
"cameras/drone/drone0" SET Transform localScale (1.1626824054617706 1.1626824054617706 1.1626824054617706)
"cameras/drone/drone1" SET Transform localEulerAngles (13 15 17)
"cameras/drone/drone1" SET Transform localScale (0.754622304989367 0.754622304989367 0.754622304989367)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.536364315773701 0)
"cameras" SET Transform eulerAngles (-17.331533740922218 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5215826480380459
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4602871131549584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.309442057735383
"cameras/drone/drone0" SET Transform localPosition (-0.0731150634004274 0.14968737323887166 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1750821221818486 0.9859491559759099 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 16 18)
"cameras/drone/drone0" SET Transform localScale (1.2259700197752952 1.2259700197752952 1.2259700197752952)
"cameras/drone/drone1" SET Transform localEulerAngles (5 6 2)
"cameras/drone/drone1" SET Transform localScale (0.7255664016412583 0.7255664016412583 0.7255664016412583)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.800413519934465 0)
"cameras" SET Transform eulerAngles (-0.9473508515127946 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7149636689061716
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0386679639359573
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24860624570759318
"cameras/drone/drone0" SET Transform localPosition (0.004484083172147546 0.3742718432117828 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1578400868452796 1.076599516994817 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 9 2)
"cameras/drone/drone0" SET Transform localScale (1.0958191269232893 1.0958191269232893 1.0958191269232893)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 9 -2)
"cameras/drone/drone1" SET Transform localScale (1.4540815638848748 1.4540815638848748 1.4540815638848748)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6370468829535874 0)
"cameras" SET Transform eulerAngles (2.1827505980283526 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.74823233042868
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6258188424430253
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19997282109139336
"cameras/drone/drone0" SET Transform localPosition (-0.696069523004263 0.2037526313732933 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9768405549643833 0.9673800962287293 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 3 -4)
"cameras/drone/drone0" SET Transform localScale (1.073277197375353 1.073277197375353 1.073277197375353)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -11 20)
"cameras/drone/drone1" SET Transform localScale (1.1751319878197477 1.1751319878197477 1.1751319878197477)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.987960122327697 0)
"cameras" SET Transform eulerAngles (5.541459228562466 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.813416225364726
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.06945917982438
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2690315567882473
"cameras/drone/drone0" SET Transform localPosition (0.403342322416707 0.4166569496536882 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.060789920019172 1.0888632829677496 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -17 -16)
"cameras/drone/drone0" SET Transform localScale (1.0669062617925242 1.0669062617925242 1.0669062617925242)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -4 16)
"cameras/drone/drone1" SET Transform localScale (1.204244296703517 1.204244296703517 1.204244296703517)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.605955335065866 0)
"cameras" SET Transform eulerAngles (6.015411726789985 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9330133674693842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.512010238357211
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15516073915341108
"cameras/drone/drone0" SET Transform localPosition (0.17617967689913994 -0.2280191081061384 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7916152244986525 0.9530850286365122 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 12 19)
"cameras/drone/drone0" SET Transform localScale (1.1756847642005126 1.1756847642005126 1.1756847642005126)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -19 -7)
"cameras/drone/drone1" SET Transform localScale (1.2747948679676762 1.2747948679676762 1.2747948679676762)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6523762343022885 0)
"cameras" SET Transform eulerAngles (18.1785559045273 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7049871937736568
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0225525779097138
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02532777046734136
"cameras/drone/drone0" SET Transform localPosition (1.135377574108319 0.3331951626806749 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1258194931163306 0.969580562968515 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -1 -11)
"cameras/drone/drone0" SET Transform localScale (1.4192482384579534 1.4192482384579534 1.4192482384579534)
"cameras/drone/drone1" SET Transform localEulerAngles (17 14 -4)
"cameras/drone/drone1" SET Transform localScale (1.4429559856537117 1.4429559856537117 1.4429559856537117)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.492342486789313 0)
"cameras" SET Transform eulerAngles (-0.12406294922457306 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7051510426952909
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.342954381820778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15039657955050567
"cameras/drone/drone0" SET Transform localPosition (-0.7082277838794788 0.6737609414487933 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9837707509159745 0.8720836813875592 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 0 -4)
"cameras/drone/drone0" SET Transform localScale (1.1304836754137277 1.1304836754137277 1.1304836754137277)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -17 -20)
"cameras/drone/drone1" SET Transform localScale (1.2144656260995266 1.2144656260995266 1.2144656260995266)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3792352965192416 0)
"cameras" SET Transform eulerAngles (18.27721836896268 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.065725088918457
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7016362586649127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.057223808076634214
"cameras/drone/drone0" SET Transform localPosition (0.5830493676242681 0.03430306889588369 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.13474916836013762 0.8113900896473323 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 13 -6)
"cameras/drone/drone0" SET Transform localScale (1.1604810128827778 1.1604810128827778 1.1604810128827778)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 14 12)
"cameras/drone/drone1" SET Transform localScale (1.2785912206321517 1.2785912206321517 1.2785912206321517)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9658597254968795 0)
"cameras" SET Transform eulerAngles (18.3723086628746 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8854356569871775
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0309403630145662
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3213887440885846
"cameras/drone/drone0" SET Transform localPosition (-1.1726936194921331 0.48632387239547364 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1478132069370328 0.9597367822005161 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 13 -13)
"cameras/drone/drone0" SET Transform localScale (0.9049483569914372 0.9049483569914372 0.9049483569914372)
"cameras/drone/drone1" SET Transform localEulerAngles (16 17 10)
"cameras/drone/drone1" SET Transform localScale (0.8366629728767795 0.8366629728767795 0.8366629728767795)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0096020215113874 0)
"cameras" SET Transform eulerAngles (-9.299849053571076 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7125619690917828
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9524767655654753
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1127508993796461
"cameras/drone/drone0" SET Transform localPosition (0.2203247313297818 -0.19524530664932044 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9414693029337224 0.9952581991938549 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -15 -9)
"cameras/drone/drone0" SET Transform localScale (1.4058101541946275 1.4058101541946275 1.4058101541946275)
"cameras/drone/drone1" SET Transform localEulerAngles (2 17 7)
"cameras/drone/drone1" SET Transform localScale (1.2709907127060298 1.2709907127060298 1.2709907127060298)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5632735511294396 0)
"cameras" SET Transform eulerAngles (1.3644618672683109 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41413473313787125
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.547611052147619
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2621555312094167
"cameras/drone/drone0" SET Transform localPosition (-1.025466512548819 0.2899849803872497 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.49917161514612673 1.1893396610571005 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -12 -18)
"cameras/drone/drone0" SET Transform localScale (1.2924276239642372 1.2924276239642372 1.2924276239642372)
"cameras/drone/drone1" SET Transform localEulerAngles (17 0 17)
"cameras/drone/drone1" SET Transform localScale (1.0544784815156723 1.0544784815156723 1.0544784815156723)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.724530088878862 0)
"cameras" SET Transform eulerAngles (-9.241155249952975 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1578302093585222
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6903419941511908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19735936515758815
"cameras/drone/drone0" SET Transform localPosition (0.24606345779868155 0.685288225165946 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.0031573806078986077 1.2414299407094433 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 18 12)
"cameras/drone/drone0" SET Transform localScale (1.072742001872037 1.072742001872037 1.072742001872037)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -20 -19)
"cameras/drone/drone1" SET Transform localScale (1.2220133404145386 1.2220133404145386 1.2220133404145386)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7236657100192367 0)
"cameras" SET Transform eulerAngles (-15.991753274665239 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.069047474218249
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.45190017917273
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18776557263860003
"cameras/drone/drone0" SET Transform localPosition (-0.37487279567958665 0.545423735246171 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.21389628442460062 0.9945453613743194 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 15 15)
"cameras/drone/drone0" SET Transform localScale (0.9356469804805134 0.9356469804805134 0.9356469804805134)
"cameras/drone/drone1" SET Transform localEulerAngles (6 15 2)
"cameras/drone/drone1" SET Transform localScale (0.8451192812016188 0.8451192812016188 0.8451192812016188)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.463226881113954 0)
"cameras" SET Transform eulerAngles (-17.28113078466516 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7810669201825868
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3114821720056258
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2681782363292497
"cameras/drone/drone0" SET Transform localPosition (-0.18426227075617896 0.018546489744845462 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.003801282776459 0.8455255832662054 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -3 5)
"cameras/drone/drone0" SET Transform localScale (1.2663760320032735 1.2663760320032735 1.2663760320032735)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 9 8)
"cameras/drone/drone1" SET Transform localScale (0.989418319117231 0.989418319117231 0.989418319117231)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1569631793384865 0)
"cameras" SET Transform eulerAngles (6.124574229899629 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8627736445724562
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1885339134554591
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.059549394443943804
"cameras/drone/drone0" SET Transform localPosition (0.7372758406164299 -0.2111230394640619 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.959374709871887 1.2770187936143036 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -15 -15)
"cameras/drone/drone0" SET Transform localScale (1.2754451946051897 1.2754451946051897 1.2754451946051897)
"cameras/drone/drone1" SET Transform localEulerAngles (1 14 -15)
"cameras/drone/drone1" SET Transform localScale (1.4491938568306977 1.4491938568306977 1.4491938568306977)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.167132455523761 0)
"cameras" SET Transform eulerAngles (11.659315921881458 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8119086567142844
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1832468854161555
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3648256482007371
"cameras/drone/drone0" SET Transform localPosition (-1.156567416488145 0.6996642884601352 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21730005159773103 1.0524866609172265 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 18 -5)
"cameras/drone/drone0" SET Transform localScale (1.0460114688634752 1.0460114688634752 1.0460114688634752)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -14 -14)
"cameras/drone/drone1" SET Transform localScale (1.4132370526176166 1.4132370526176166 1.4132370526176166)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.956997006112556 0)
"cameras" SET Transform eulerAngles (-0.2987046638575883 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1398385219203906
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2656873572620402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15667400351672414
"cameras/drone/drone0" SET Transform localPosition (0.5329332511395999 0.3064220407504073 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8180843331557315 1.1063758565668995 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -20 -3)
"cameras/drone/drone0" SET Transform localScale (0.7819733785915305 0.7819733785915305 0.7819733785915305)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -4 -2)
"cameras/drone/drone1" SET Transform localScale (0.9064084290057463 0.9064084290057463 0.9064084290057463)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.576654438695353 0)
"cameras" SET Transform eulerAngles (-7.859589029994289 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6517711505440269
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3728783727326814
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03965324383438369
"cameras/drone/drone0" SET Transform localPosition (0.149293923868709 0.3292735711742077 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7036018680761202 0.9611505268170606 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 7 -6)
"cameras/drone/drone0" SET Transform localScale (1.4037891624825554 1.4037891624825554 1.4037891624825554)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -2 -7)
"cameras/drone/drone1" SET Transform localScale (0.928302375254932 0.928302375254932 0.928302375254932)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.174736694007646 0)
"cameras" SET Transform eulerAngles (-13.57064866913182 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5913167568112514
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.98258124771491
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3544007098492598
"cameras/drone/drone0" SET Transform localPosition (0.9015572379284429 -0.08153119361039235 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08291206264515205 1.0778065952262368 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 7 1)
"cameras/drone/drone0" SET Transform localScale (1.2420655536952643 1.2420655536952643 1.2420655536952643)
"cameras/drone/drone1" SET Transform localEulerAngles (1 18 -5)
"cameras/drone/drone1" SET Transform localScale (1.002426866215689 1.002426866215689 1.002426866215689)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.55693148971786 0)
"cameras" SET Transform eulerAngles (-8.085556225320424 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4334026284215009
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5030775987399125
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1411605861220607
"cameras/drone/drone0" SET Transform localPosition (0.5704626787403941 -0.19147029673131882 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3496851900374154 1.0022346046166235 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 3 15)
"cameras/drone/drone0" SET Transform localScale (1.3339364124967517 1.3339364124967517 1.3339364124967517)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 11 6)
"cameras/drone/drone1" SET Transform localScale (0.6500117146413069 0.6500117146413069 0.6500117146413069)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.488515559063934 0)
"cameras" SET Transform eulerAngles (-8.254205297518066 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40799302182406566
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9201857600688532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07461200327350591
"cameras/drone/drone0" SET Transform localPosition (1.167635974995464 0.49198846676384284 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8728521699920083 1.06570807788027 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -9 18)
"cameras/drone/drone0" SET Transform localScale (1.1288820818182117 1.1288820818182117 1.1288820818182117)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -5 6)
"cameras/drone/drone1" SET Transform localScale (0.6038849209788373 0.6038849209788373 0.6038849209788373)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3115454977206156 0)
"cameras" SET Transform eulerAngles (8.101683743523616 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0405131680717958
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5435866445980375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18521876676445773
"cameras/drone/drone0" SET Transform localPosition (0.7589277516828103 0.5102947366435429 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1825435843333159 1.2369546670951401 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 2 2)
"cameras/drone/drone0" SET Transform localScale (1.4258487053021764 1.4258487053021764 1.4258487053021764)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -2 3)
"cameras/drone/drone1" SET Transform localScale (0.789740417303844 0.789740417303844 0.789740417303844)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.640524546468376 0)
"cameras" SET Transform eulerAngles (13.621304244680978 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6838011275226581
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0199813391203492
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3615405321887654
"cameras/drone/drone0" SET Transform localPosition (0.18906096893350255 -0.2669847930091684 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17713392590848898 1.0561671324121769 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -20 12)
"cameras/drone/drone0" SET Transform localScale (0.9006500093537613 0.9006500093537613 0.9006500093537613)
"cameras/drone/drone1" SET Transform localEulerAngles (0 7 -5)
"cameras/drone/drone1" SET Transform localScale (1.2247678719391546 1.2247678719391546 1.2247678719391546)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.785772337991428 0)
"cameras" SET Transform eulerAngles (8.8968591232763 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5812709871817212
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.44984417470926
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1462566725925373
"cameras/drone/drone0" SET Transform localPosition (-0.1970725373971529 -0.196575054824294 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0545789683424642 1.2568140630302265 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 13 9)
"cameras/drone/drone0" SET Transform localScale (0.885669765404927 0.885669765404927 0.885669765404927)
"cameras/drone/drone1" SET Transform localEulerAngles (1 7 -17)
"cameras/drone/drone1" SET Transform localScale (1.275333206508534 1.275333206508534 1.275333206508534)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.068096104894162 0)
"cameras" SET Transform eulerAngles (15.454598426474725 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7409463881911289
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5848858577749052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3402497523290933
"cameras/drone/drone0" SET Transform localPosition (0.7679815581684444 0.15795533988735216 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0052393462501230115 0.9736513660563124 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -20 6)
"cameras/drone/drone0" SET Transform localScale (1.4643689258422117 1.4643689258422117 1.4643689258422117)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -20 4)
"cameras/drone/drone1" SET Transform localScale (1.0929163511506834 1.0929163511506834 1.0929163511506834)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.438809616290899 0)
"cameras" SET Transform eulerAngles (13.11776456741525 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5317298644415933
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.600123815719619
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32378888166473807
"cameras/drone/drone0" SET Transform localPosition (1.0906380614340623 0.21966901763338514 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3378092267849724 1.018326842462596 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 5 8)
"cameras/drone/drone0" SET Transform localScale (1.246254049281609 1.246254049281609 1.246254049281609)
"cameras/drone/drone1" SET Transform localEulerAngles (0 9 6)
"cameras/drone/drone1" SET Transform localScale (0.896301866105099 0.896301866105099 0.896301866105099)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.764321538841447 0)
"cameras" SET Transform eulerAngles (14.023328116241714 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.929387504312518
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6918757480301796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3666377205245439
"cameras/drone/drone0" SET Transform localPosition (-0.11276002940818008 -0.06891133255406673 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0139301250132966 1.030937678969011 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 11 -19)
"cameras/drone/drone0" SET Transform localScale (0.915440509306852 0.915440509306852 0.915440509306852)
"cameras/drone/drone1" SET Transform localEulerAngles (7 10 16)
"cameras/drone/drone1" SET Transform localScale (0.9339597473775015 0.9339597473775015 0.9339597473775015)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8421183632077605 0)
"cameras" SET Transform eulerAngles (-15.186167678510776 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5182244564983269
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.163320242708482
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37344601315904025
"cameras/drone/drone0" SET Transform localPosition (-0.950352487554992 -0.13166006119576518 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09608214549056049 1.1921626084229708 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 15 16)
"cameras/drone/drone0" SET Transform localScale (1.3432424001052294 1.3432424001052294 1.3432424001052294)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 15 -12)
"cameras/drone/drone1" SET Transform localScale (1.4779887979997839 1.4779887979997839 1.4779887979997839)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.058870646316282 0)
"cameras" SET Transform eulerAngles (-19.151608841843178 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4508257842514984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3726890549567148
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3121880426404876
"cameras/drone/drone0" SET Transform localPosition (0.7976539962728335 0.2287578190113177 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.30195494964512093 1.2858579083553328 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -16 18)
"cameras/drone/drone0" SET Transform localScale (1.0393040545695198 1.0393040545695198 1.0393040545695198)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -19 3)
"cameras/drone/drone1" SET Transform localScale (1.0719555941771661 1.0719555941771661 1.0719555941771661)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.832169832687235 0)
"cameras" SET Transform eulerAngles (-3.0094576227925742 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5920294831856955
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4318698616342895
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22684498003664497
"cameras/drone/drone0" SET Transform localPosition (-0.06823273499990457 0.6912248964403314 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7639060886291027 0.9672125803882421 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 4 4)
"cameras/drone/drone0" SET Transform localScale (1.438386590673383 1.438386590673383 1.438386590673383)
"cameras/drone/drone1" SET Transform localEulerAngles (9 5 9)
"cameras/drone/drone1" SET Transform localScale (0.8773637339050271 0.8773637339050271 0.8773637339050271)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.618656384430885 0)
"cameras" SET Transform eulerAngles (3.9540064921284284 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4264350814879211
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0570146590476803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3035172101855982
"cameras/drone/drone0" SET Transform localPosition (0.5188561331206638 -0.2615006326055463 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.27536786822192927 1.2185095875628584 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 15 -4)
"cameras/drone/drone0" SET Transform localScale (1.0111902146903242 1.0111902146903242 1.0111902146903242)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 6 9)
"cameras/drone/drone1" SET Transform localScale (0.8863587559003893 0.8863587559003893 0.8863587559003893)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.538355428482833 0)
"cameras" SET Transform eulerAngles (10.703833576259147 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1184625366521372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2289945299547322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18325555673144867
"cameras/drone/drone0" SET Transform localPosition (-0.67802468863129 0.5651509932669765 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32386846690991256 0.947927486671406 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -17 -2)
"cameras/drone/drone0" SET Transform localScale (1.0549114532083697 1.0549114532083697 1.0549114532083697)
"cameras/drone/drone1" SET Transform localEulerAngles (0 0 19)
"cameras/drone/drone1" SET Transform localScale (0.7712212116320907 0.7712212116320907 0.7712212116320907)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.062374550120852 0)
"cameras" SET Transform eulerAngles (5.357342800796143 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9221888685140536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2869618993491656
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1789923708110607
"cameras/drone/drone0" SET Transform localPosition (-0.568312615215158 0.5511560914104359 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3306128499511781 1.2059826460050704 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -20 16)
"cameras/drone/drone0" SET Transform localScale (0.7955865578619165 0.7955865578619165 0.7955865578619165)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 14 -10)
"cameras/drone/drone1" SET Transform localScale (0.9718682032745958 0.9718682032745958 0.9718682032745958)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.76894912816057 0)
"cameras" SET Transform eulerAngles (-9.071225463018816 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0249737240241306
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1812175880975784
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.395647528035365
"cameras/drone/drone0" SET Transform localPosition (0.6250449893278545 0.07219129617861614 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.680218683093979 0.9634960827033816 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 2 -16)
"cameras/drone/drone0" SET Transform localScale (1.1102989803246133 1.1102989803246133 1.1102989803246133)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 13 -5)
"cameras/drone/drone1" SET Transform localScale (1.4592928673095473 1.4592928673095473 1.4592928673095473)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.457023485526362 0)
"cameras" SET Transform eulerAngles (19.58332128372681 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8755064697484394
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1755988118563356
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3085095321295137
"cameras/drone/drone0" SET Transform localPosition (-0.7328139325674818 -0.036583195230715904 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4873947763726175 0.8788587362733943 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -3 -1)
"cameras/drone/drone0" SET Transform localScale (1.3860103116539133 1.3860103116539133 1.3860103116539133)
"cameras/drone/drone1" SET Transform localEulerAngles (4 6 13)
"cameras/drone/drone1" SET Transform localScale (0.8293406373651434 0.8293406373651434 0.8293406373651434)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9816776631168476 0)
"cameras" SET Transform eulerAngles (1.2060892040130469 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1152360981888365
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.428888252083084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2965740088891909
"cameras/drone/drone0" SET Transform localPosition (-0.4811704864179335 -0.16390555351309638 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4558478618534434 0.9190452870138686 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -14 4)
"cameras/drone/drone0" SET Transform localScale (1.190182032371502 1.190182032371502 1.190182032371502)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -3 5)
"cameras/drone/drone1" SET Transform localScale (1.370371299600901 1.370371299600901 1.370371299600901)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.729377986346839 0)
"cameras" SET Transform eulerAngles (-18.838006824631645 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4429372202506863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9143763751760776
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09985612470643496
"cameras/drone/drone0" SET Transform localPosition (0.7336296415774961 0.25631328030000405 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0059110457527531 0.9341474435704178 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 20 7)
"cameras/drone/drone0" SET Transform localScale (0.9266675126774832 0.9266675126774832 0.9266675126774832)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -4 11)
"cameras/drone/drone1" SET Transform localScale (1.0951143338173241 1.0951143338173241 1.0951143338173241)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.399296958125717 0)
"cameras" SET Transform eulerAngles (-8.588391850687792 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2376781945556397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.558850299134251
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19392604458235693
"cameras/drone/drone0" SET Transform localPosition (1.0483523149458398 -0.21446004635854093 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9350515399095338 1.1506469800112713 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -10 20)
"cameras/drone/drone0" SET Transform localScale (1.1529707316122453 1.1529707316122453 1.1529707316122453)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -9 13)
"cameras/drone/drone1" SET Transform localScale (1.3429324938690441 1.3429324938690441 1.3429324938690441)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0509335314332087 0)
"cameras" SET Transform eulerAngles (-16.862072129655598 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4142024922897857
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.932659565517174
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09147796499235956
"cameras/drone/drone0" SET Transform localPosition (0.805536795510754 0.1872012849857822 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0718656770075892 0.8783819236113276 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 5 -11)
"cameras/drone/drone0" SET Transform localScale (0.8053932901921025 0.8053932901921025 0.8053932901921025)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -4 -7)
"cameras/drone/drone1" SET Transform localScale (0.6630947824005202 0.6630947824005202 0.6630947824005202)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.442282834003459 0)
"cameras" SET Transform eulerAngles (14.626319712374823 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5394011941742165
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5149072323979653
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03698410683085229
"cameras/drone/drone0" SET Transform localPosition (0.10787968358874367 0.2818062219995044 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07149656470447363 1.165909403071348 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -10 -12)
"cameras/drone/drone0" SET Transform localScale (0.8278730831251448 0.8278730831251448 0.8278730831251448)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -7 -20)
"cameras/drone/drone1" SET Transform localScale (1.1307542173265392 1.1307542173265392 1.1307542173265392)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
