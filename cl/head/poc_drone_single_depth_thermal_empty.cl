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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 167 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 30 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 48 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-4.984571842230833 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 31
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.650508359079238 0)
"cameras" SET Transform eulerAngles (-14.337601665900625 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4050880798482883
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4419546276712842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21473449297441102
"cameras/drone/drone0" SET Transform localPosition (1.1211882587935251 0.08579847763316711 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.006994909098753 1.2781480426999634 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -7 -1)
"cameras/drone/drone0" SET Transform localScale (0.6108004818510646 0.6108004818510646 0.6108004818510646)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -7 10)
"cameras/drone/drone1" SET Transform localScale (0.8494017769746685 0.8494017769746685 0.8494017769746685)
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
"cameras" SET Transform position (0 3.118164351536649 0)
"cameras" SET Transform eulerAngles (19.481133951790227 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9070749650285224
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8365522051930876
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2574737718050394
"cameras/drone/drone0" SET Transform localPosition (-0.6063898627465538 -0.034850009668540405 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7676841252463407 1.0468031119832277 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 14 -19)
"cameras/drone/drone0" SET Transform localScale (0.8744484748122328 0.8744484748122328 0.8744484748122328)
"cameras/drone/drone1" SET Transform localEulerAngles (7 4 -1)
"cameras/drone/drone1" SET Transform localScale (0.6876581336127114 0.6876581336127114 0.6876581336127114)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.322488714928841 0)
"cameras" SET Transform eulerAngles (-1.901139133024273 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5029351021361235
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0903019097960382
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18349655838442228
"cameras/drone/drone0" SET Transform localPosition (0.25885462720875707 -0.11273781062845162 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6960966298447719 1.280209436943808 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -14 -19)
"cameras/drone/drone0" SET Transform localScale (1.4861947911567732 1.4861947911567732 1.4861947911567732)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -10 -5)
"cameras/drone/drone1" SET Transform localScale (0.9800960974430013 0.9800960974430013 0.9800960974430013)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.153598391890456 0)
"cameras" SET Transform eulerAngles (0.28819239954447795 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7068703033410604
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9986310600575182
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16694567639432423
"cameras/drone/drone0" SET Transform localPosition (-0.8079025641750854 0.05972812930897503 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3301345930338122 1.2688869717753586 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -19 -20)
"cameras/drone/drone0" SET Transform localScale (1.2484749739490217 1.2484749739490217 1.2484749739490217)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 11 13)
"cameras/drone/drone1" SET Transform localScale (0.721859711094287 0.721859711094287 0.721859711094287)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.250480841485209 0)
"cameras" SET Transform eulerAngles (3.7377600296347424 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.820664103180833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5851482031101123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02511678741818657
"cameras/drone/drone0" SET Transform localPosition (0.07294087634498436 -0.09097117747927103 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2263173210016527 0.9734513260810518 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -12 18)
"cameras/drone/drone0" SET Transform localScale (0.7323744982842646 0.7323744982842646 0.7323744982842646)
"cameras/drone/drone1" SET Transform localEulerAngles (15 11 -15)
"cameras/drone/drone1" SET Transform localScale (1.494256032348333 1.494256032348333 1.494256032348333)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.746646586341108 0)
"cameras" SET Transform eulerAngles (-14.219368535241568 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9101168055891986
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5309850572617656
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1864207215789616
"cameras/drone/drone0" SET Transform localPosition (-0.8213559760568656 0.6381471759542496 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7261911141638915 1.020999771922036 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 17 -14)
"cameras/drone/drone0" SET Transform localScale (0.8497859681462578 0.8497859681462578 0.8497859681462578)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 14 -2)
"cameras/drone/drone1" SET Transform localScale (1.3552950361098857 1.3552950361098857 1.3552950361098857)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.69483753635937 0)
"cameras" SET Transform eulerAngles (-7.860166726266495 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6769651340565073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3049182508065755
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3832633184031599
"cameras/drone/drone0" SET Transform localPosition (-1.154205046124637 -0.19449098046068486 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1427457079688852 0.9020670465120653 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -5 1)
"cameras/drone/drone0" SET Transform localScale (1.1863934827677727 1.1863934827677727 1.1863934827677727)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -9 6)
"cameras/drone/drone1" SET Transform localScale (0.7973354603938618 0.7973354603938618 0.7973354603938618)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.351164862074982 0)
"cameras" SET Transform eulerAngles (0.5968282324040928 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7653775691707815
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6101353942697367
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2966619345515761
"cameras/drone/drone0" SET Transform localPosition (-1.0795170722649876 -0.08834663409105553 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6234133876078138 0.9896256631044154 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 15 -9)
"cameras/drone/drone0" SET Transform localScale (0.6506453739393347 0.6506453739393347 0.6506453739393347)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 8 -15)
"cameras/drone/drone1" SET Transform localScale (0.698473135738354 0.698473135738354 0.698473135738354)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.700500243246018 0)
"cameras" SET Transform eulerAngles (-5.245182727819259 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5452655605661483
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9224708815400997
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3107278289217627
"cameras/drone/drone0" SET Transform localPosition (0.9802620017642873 -0.14852986741740376 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22498871094619632 1.2321852246015363 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -14 1)
"cameras/drone/drone0" SET Transform localScale (1.3843136152605986 1.3843136152605986 1.3843136152605986)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -3 -1)
"cameras/drone/drone1" SET Transform localScale (0.798190907681173 0.798190907681173 0.798190907681173)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.238305460862708 0)
"cameras" SET Transform eulerAngles (18.47139343325913 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5048539127717135
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2764979888106973
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15735278808992695
"cameras/drone/drone0" SET Transform localPosition (-0.4582805700550142 0.26708982042438517 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.46947101944136105 0.9951534682124944 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 6 -2)
"cameras/drone/drone0" SET Transform localScale (0.8662033792544923 0.8662033792544923 0.8662033792544923)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 1 19)
"cameras/drone/drone1" SET Transform localScale (0.8353181812539 0.8353181812539 0.8353181812539)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.077979328443245 0)
"cameras" SET Transform eulerAngles (6.208224086347535 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9187457866910159
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8493907678219403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06027922369813737
"cameras/drone/drone0" SET Transform localPosition (0.25687361002932585 0.027849456860216615 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9542901943228286 0.8417970545074009 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -20 3)
"cameras/drone/drone0" SET Transform localScale (0.8499547058214084 0.8499547058214084 0.8499547058214084)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -7 8)
"cameras/drone/drone1" SET Transform localScale (0.8493947708501283 0.8493947708501283 0.8493947708501283)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.166333866707676 0)
"cameras" SET Transform eulerAngles (0.1177284392176361 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5654410682212967
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.957898382249859
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.172849375433907
"cameras/drone/drone0" SET Transform localPosition (0.3607581798454573 0.015751231194453152 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7953611209450422 0.9055113660591612 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 14 -13)
"cameras/drone/drone0" SET Transform localScale (1.072473206574048 1.072473206574048 1.072473206574048)
"cameras/drone/drone1" SET Transform localEulerAngles (10 0 -5)
"cameras/drone/drone1" SET Transform localScale (0.9512781362397071 0.9512781362397071 0.9512781362397071)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.586374344483753 0)
"cameras" SET Transform eulerAngles (18.49159712710682 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.202711296573221
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.627561592110026
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31009607332988276
"cameras/drone/drone0" SET Transform localPosition (0.5922916066466419 0.02819352615529086 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.501946868675538 1.097628682132894 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 7 -18)
"cameras/drone/drone0" SET Transform localScale (1.0832674959235868 1.0832674959235868 1.0832674959235868)
"cameras/drone/drone1" SET Transform localEulerAngles (1 14 -11)
"cameras/drone/drone1" SET Transform localScale (1.1331391600654017 1.1331391600654017 1.1331391600654017)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.788467066500507 0)
"cameras" SET Transform eulerAngles (9.857690767982909 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0173622561578823
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.889898332395143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3407270584152833
"cameras/drone/drone0" SET Transform localPosition (-0.3860730146929684 0.356946586542965 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.903829212216811 0.9510898735878128 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -17 15)
"cameras/drone/drone0" SET Transform localScale (1.2935299598121068 1.2935299598121068 1.2935299598121068)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -17 -17)
"cameras/drone/drone1" SET Transform localScale (1.4334092501026685 1.4334092501026685 1.4334092501026685)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.612916881606174 0)
"cameras" SET Transform eulerAngles (-8.115700094216315 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5447170993818222
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7353299839159562
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13379351619320082
"cameras/drone/drone0" SET Transform localPosition (0.5318807712028502 -0.01128863641252692 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.22972710968406307 1.1714767413177107 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 3 16)
"cameras/drone/drone0" SET Transform localScale (0.9104616631850524 0.9104616631850524 0.9104616631850524)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 19 4)
"cameras/drone/drone1" SET Transform localScale (1.402516900831003 1.402516900831003 1.402516900831003)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.145765896289506 0)
"cameras" SET Transform eulerAngles (-16.564950761387244 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4990496301981322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1127454359375057
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2525408746317843
"cameras/drone/drone0" SET Transform localPosition (0.34497215073564913 0.10192788803996183 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.48546822498040676 1.2029621413039024 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -14 16)
"cameras/drone/drone0" SET Transform localScale (1.0150551442366438 1.0150551442366438 1.0150551442366438)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 0 10)
"cameras/drone/drone1" SET Transform localScale (0.6831126418193222 0.6831126418193222 0.6831126418193222)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3773725397442895 0)
"cameras" SET Transform eulerAngles (-1.5551650877246175 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5874656066783341
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.710059049285793
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3897943433364808
"cameras/drone/drone0" SET Transform localPosition (-0.6291101163628601 0.14863473585866677 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9395566575723577 1.22484654526256 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 4 6)
"cameras/drone/drone0" SET Transform localScale (1.303817819815156 1.303817819815156 1.303817819815156)
"cameras/drone/drone1" SET Transform localEulerAngles (16 18 -16)
"cameras/drone/drone1" SET Transform localScale (0.7125897565479187 0.7125897565479187 0.7125897565479187)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.533873371439915 0)
"cameras" SET Transform eulerAngles (-19.009275212077988 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5846046361247779
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4477916179099921
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30506848507536755
"cameras/drone/drone0" SET Transform localPosition (-1.0153873900908499 0.17498088151767582 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1065223915629896 0.9377377523213403 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -17 8)
"cameras/drone/drone0" SET Transform localScale (1.2888045144952738 1.2888045144952738 1.2888045144952738)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 10 17)
"cameras/drone/drone1" SET Transform localScale (0.7233687706261339 0.7233687706261339 0.7233687706261339)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.929558196919275 0)
"cameras" SET Transform eulerAngles (18.020157648614436 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9327091765491121
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4664063673001326
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2953222613932221
"cameras/drone/drone0" SET Transform localPosition (0.5188817832284558 -0.11945002119267462 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9850327125204406 1.047566717467545 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 3 -6)
"cameras/drone/drone0" SET Transform localScale (1.4027791822391884 1.4027791822391884 1.4027791822391884)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -13 -18)
"cameras/drone/drone1" SET Transform localScale (1.3821923144493236 1.3821923144493236 1.3821923144493236)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.97170005935069 0)
"cameras" SET Transform eulerAngles (5.263062101097759 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5593735642690201
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.042573093935133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16265301385378628
"cameras/drone/drone0" SET Transform localPosition (-0.12975713483967377 -0.14308358780037195 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9946794885228278 1.2354114260368803 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -11 -19)
"cameras/drone/drone0" SET Transform localScale (1.381366655043101 1.381366655043101 1.381366655043101)
"cameras/drone/drone1" SET Transform localEulerAngles (7 19 -8)
"cameras/drone/drone1" SET Transform localScale (1.0527951900296653 1.0527951900296653 1.0527951900296653)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.272098227494043 0)
"cameras" SET Transform eulerAngles (-5.997012381179442 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5216747989371542
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9544329660299365
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22487978859859536
"cameras/drone/drone0" SET Transform localPosition (-0.6879115603225235 -0.04374659397527053 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4055632066738375 0.9502550922315458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 2 0)
"cameras/drone/drone0" SET Transform localScale (1.3634053299810545 1.3634053299810545 1.3634053299810545)
"cameras/drone/drone1" SET Transform localEulerAngles (19 19 13)
"cameras/drone/drone1" SET Transform localScale (1.431470367147159 1.431470367147159 1.431470367147159)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0194498373885414 0)
"cameras" SET Transform eulerAngles (2.7145910048773736 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9720425905073699
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3456770393464654
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35143892218907197
"cameras/drone/drone0" SET Transform localPosition (-0.45209539689037526 0.4976726410781093 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09945356397588889 1.2790251177295204 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -19 15)
"cameras/drone/drone0" SET Transform localScale (0.6355877939191099 0.6355877939191099 0.6355877939191099)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -9 -17)
"cameras/drone/drone1" SET Transform localScale (0.6972699916546957 0.6972699916546957 0.6972699916546957)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2559375469226026 0)
"cameras" SET Transform eulerAngles (18.58556105356078 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.747389564828824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8144863421633404
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17641526695828114
"cameras/drone/drone0" SET Transform localPosition (0.01427614392524612 0.35932684969184175 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1787594399573482 1.006150398528321 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -4 12)
"cameras/drone/drone0" SET Transform localScale (1.0280313014554952 1.0280313014554952 1.0280313014554952)
"cameras/drone/drone1" SET Transform localEulerAngles (12 16 12)
"cameras/drone/drone1" SET Transform localScale (1.258116272227198 1.258116272227198 1.258116272227198)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.979830670723703 0)
"cameras" SET Transform eulerAngles (-12.41218751815708 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7579950121207044
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1288133690594833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3376798023876935
"cameras/drone/drone0" SET Transform localPosition (-0.11588633097777135 0.5931353216197179 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8255416058151439 0.8700498505361838 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 17 -10)
"cameras/drone/drone0" SET Transform localScale (1.3750654301623555 1.3750654301623555 1.3750654301623555)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -7 15)
"cameras/drone/drone1" SET Transform localScale (0.818157383952665 0.818157383952665 0.818157383952665)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2421783380624802 0)
"cameras" SET Transform eulerAngles (-0.5851295757997654 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3404906843185407
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9235253327432007
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29337814553211117
"cameras/drone/drone0" SET Transform localPosition (-0.8315625029310862 0.4163225250463272 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6329074627943447 1.0195956572851976 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 7 -11)
"cameras/drone/drone0" SET Transform localScale (1.109180380516734 1.109180380516734 1.109180380516734)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 4 11)
"cameras/drone/drone1" SET Transform localScale (0.892950229697484 0.892950229697484 0.892950229697484)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1736140239703716 0)
"cameras" SET Transform eulerAngles (5.22057184512127 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6402757842704909
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9093472297578487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3706885001755446
"cameras/drone/drone0" SET Transform localPosition (0.8553737681406293 0.6860864811614718 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6663210976804185 0.9998583030974828 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -12 12)
"cameras/drone/drone0" SET Transform localScale (0.9744525126960002 0.9744525126960002 0.9744525126960002)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -9 13)
"cameras/drone/drone1" SET Transform localScale (1.2158286294139198 1.2158286294139198 1.2158286294139198)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.483196172320742 0)
"cameras" SET Transform eulerAngles (-1.0911162673104933 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6643046276790614
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9087130200985196
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01909030151673905
"cameras/drone/drone0" SET Transform localPosition (-0.5143696388134531 0.49987406211203783 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1246446841332827 1.268180038984184 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -18 20)
"cameras/drone/drone0" SET Transform localScale (1.3709650215720313 1.3709650215720313 1.3709650215720313)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 20 -6)
"cameras/drone/drone1" SET Transform localScale (1.1557464200666097 1.1557464200666097 1.1557464200666097)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8682294481622956 0)
"cameras" SET Transform eulerAngles (12.029841334791755 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9023669479981317
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7198389137176942
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36631480047639126
"cameras/drone/drone0" SET Transform localPosition (0.3830177666677623 0.5881711507971781 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2541440978961871 1.2278866503398627 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 12 -18)
"cameras/drone/drone0" SET Transform localScale (0.8673420333786896 0.8673420333786896 0.8673420333786896)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -2 -2)
"cameras/drone/drone1" SET Transform localScale (1.4530687694988984 1.4530687694988984 1.4530687694988984)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.401447659115604 0)
"cameras" SET Transform eulerAngles (-4.5603771420875425 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9222386817384687
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7819159601494543
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08025640621519924
"cameras/drone/drone0" SET Transform localPosition (-0.8151172909380566 -0.16432517458130708 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7256998939845154 0.830617097900582 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -10 4)
"cameras/drone/drone0" SET Transform localScale (1.3066037030007291 1.3066037030007291 1.3066037030007291)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 4 17)
"cameras/drone/drone1" SET Transform localScale (1.268245214901032 1.268245214901032 1.268245214901032)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7542942863150905 0)
"cameras" SET Transform eulerAngles (7.296694892943876 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7787703783256816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5693960615142122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28601383293155197
"cameras/drone/drone0" SET Transform localPosition (0.14838369872377632 0.15277317290820497 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0784337761919431 0.8115197417162417 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 1 6)
"cameras/drone/drone0" SET Transform localScale (1.0598970205833262 1.0598970205833262 1.0598970205833262)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -4 -8)
"cameras/drone/drone1" SET Transform localScale (1.1343581841973465 1.1343581841973465 1.1343581841973465)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1720503917680167 0)
"cameras" SET Transform eulerAngles (1.3058457112698854 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9265213019684219
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.028643099092857
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05114480130439136
"cameras/drone/drone0" SET Transform localPosition (0.8890041427133981 0.07696183208437007 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2813529075338639 1.02352875911987 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -7 -19)
"cameras/drone/drone0" SET Transform localScale (0.9012350234367028 0.9012350234367028 0.9012350234367028)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 17 -2)
"cameras/drone/drone1" SET Transform localScale (1.3566311000067244 1.3566311000067244 1.3566311000067244)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.268087717888403 0)
"cameras" SET Transform eulerAngles (-18.916805561346983 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8255584357911332
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3775921825952397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31148221153733563
"cameras/drone/drone0" SET Transform localPosition (-1.055687380880623 0.3879348487509244 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.131516847510621 0.9192451873087373 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -11 8)
"cameras/drone/drone0" SET Transform localScale (1.33253227831656 1.33253227831656 1.33253227831656)
"cameras/drone/drone1" SET Transform localEulerAngles (6 0 -1)
"cameras/drone/drone1" SET Transform localScale (0.679504003106294 0.679504003106294 0.679504003106294)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.860700979029753 0)
"cameras" SET Transform eulerAngles (-19.585456902882697 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8617081992669766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6262328136686914
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38546965556967794
"cameras/drone/drone0" SET Transform localPosition (0.8291257280329682 0.31308696555569177 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5849831260930529 0.8388648682622659 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 8 12)
"cameras/drone/drone0" SET Transform localScale (0.7234597841605465 0.7234597841605465 0.7234597841605465)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 5 -15)
"cameras/drone/drone1" SET Transform localScale (1.4989020755202866 1.4989020755202866 1.4989020755202866)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.506603576270112 0)
"cameras" SET Transform eulerAngles (10.4687718338077 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9708579568316384
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9149837639668563
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11800342017658944
"cameras/drone/drone0" SET Transform localPosition (0.5029106706176507 -0.028784941618442972 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06728776734383768 0.9362236828522685 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 9 -9)
"cameras/drone/drone0" SET Transform localScale (0.8666151946333724 0.8666151946333724 0.8666151946333724)
"cameras/drone/drone1" SET Transform localEulerAngles (6 3 -9)
"cameras/drone/drone1" SET Transform localScale (0.7383006470628549 0.7383006470628549 0.7383006470628549)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5186293210643216 0)
"cameras" SET Transform eulerAngles (-14.342859217950217 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5531959957212463
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8725724028523678
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04174322839076581
"cameras/drone/drone0" SET Transform localPosition (-1.1293979006995498 0.5243505635646104 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6113991062161863 0.996015474647896 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -19 20)
"cameras/drone/drone0" SET Transform localScale (0.7640078822289479 0.7640078822289479 0.7640078822289479)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -20 -2)
"cameras/drone/drone1" SET Transform localScale (1.090760424895562 1.090760424895562 1.090760424895562)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.617510307575163 0)
"cameras" SET Transform eulerAngles (8.063259019423384 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8599351310300428
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.515180555690244
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24595152345618487
"cameras/drone/drone0" SET Transform localPosition (0.5752080269952877 0.1846415492088193 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.002415050782539563 1.1217412378304563 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -14 -9)
"cameras/drone/drone0" SET Transform localScale (1.4295995133690984 1.4295995133690984 1.4295995133690984)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 1 9)
"cameras/drone/drone1" SET Transform localScale (1.0989007084945428 1.0989007084945428 1.0989007084945428)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8481629904831514 0)
"cameras" SET Transform eulerAngles (-17.264843259538004 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8884748395721043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.254659463165558
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37971278481423343
"cameras/drone/drone0" SET Transform localPosition (-0.6063845386437658 0.263469344797078 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22629074831996077 1.0762045231027586 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -8 1)
"cameras/drone/drone0" SET Transform localScale (0.8228376394011486 0.8228376394011486 0.8228376394011486)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -17 1)
"cameras/drone/drone1" SET Transform localScale (1.19465934892059 1.19465934892059 1.19465934892059)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.330658800949781 0)
"cameras" SET Transform eulerAngles (12.662564715345745 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1861750269210891
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8776353999262319
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3542318790004367
"cameras/drone/drone0" SET Transform localPosition (-0.2554827009156022 -0.03298819691540228 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2682247771883861 1.228543954484104 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 8 8)
"cameras/drone/drone0" SET Transform localScale (1.1697388294620854 1.1697388294620854 1.1697388294620854)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 6 -4)
"cameras/drone/drone1" SET Transform localScale (1.166374140905252 1.166374140905252 1.166374140905252)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.801434229216391 0)
"cameras" SET Transform eulerAngles (-3.2819674931711447 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.284605045757913
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1357481127406006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3080153735349668
"cameras/drone/drone0" SET Transform localPosition (0.6588136934004634 0.06082271454177218 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5416905548607263 1.0125302463053045 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -2 20)
"cameras/drone/drone0" SET Transform localScale (0.9307309736165164 0.9307309736165164 0.9307309736165164)
"cameras/drone/drone1" SET Transform localEulerAngles (16 5 18)
"cameras/drone/drone1" SET Transform localScale (1.321542275259934 1.321542275259934 1.321542275259934)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.219528808870859 0)
"cameras" SET Transform eulerAngles (10.209909976388015 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2286818616344006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.087102283662885
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14147217788970395
"cameras/drone/drone0" SET Transform localPosition (-1.0183603288947622 0.5538170156574367 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8577523167372478 1.2635308878871336 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 8 -2)
"cameras/drone/drone0" SET Transform localScale (0.708117341611075 0.708117341611075 0.708117341611075)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -10 -11)
"cameras/drone/drone1" SET Transform localScale (1.1502808519361312 1.1502808519361312 1.1502808519361312)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.072808542947111 0)
"cameras" SET Transform eulerAngles (-6.347557224647424 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3454761785499851
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4314850108515462
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.220035305515321
"cameras/drone/drone0" SET Transform localPosition (0.23376094199594055 0.16303947028585658 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37416687481613586 1.2805411304985643 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 18 12)
"cameras/drone/drone0" SET Transform localScale (1.1948414579045994 1.1948414579045994 1.1948414579045994)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 3 5)
"cameras/drone/drone1" SET Transform localScale (1.4351140462901364 1.4351140462901364 1.4351140462901364)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.54422890327997 0)
"cameras" SET Transform eulerAngles (16.690333987022107 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6114693819384612
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6341988679851558
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02523673752562381
"cameras/drone/drone0" SET Transform localPosition (-0.3607022714189978 0.09702609730439288 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19381736033524155 1.0090241122922559 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -10 -2)
"cameras/drone/drone0" SET Transform localScale (0.6554343725769955 0.6554343725769955 0.6554343725769955)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -1 14)
"cameras/drone/drone1" SET Transform localScale (1.0505412268348324 1.0505412268348324 1.0505412268348324)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.081373462649976 0)
"cameras" SET Transform eulerAngles (-16.2129367213403 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5117369151823996
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9718499840645043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3970904493701774
"cameras/drone/drone0" SET Transform localPosition (0.19138220577968945 -0.297543179576188 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09612439319510502 0.8186837386421834 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 1 -5)
"cameras/drone/drone0" SET Transform localScale (1.4085890428592012 1.4085890428592012 1.4085890428592012)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -11 20)
"cameras/drone/drone1" SET Transform localScale (1.1606832337268334 1.1606832337268334 1.1606832337268334)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.438174109631443 0)
"cameras" SET Transform eulerAngles (-12.772985085378433 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5846494882499628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0287083971189532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.030109453285879176
"cameras/drone/drone0" SET Transform localPosition (0.1403106036841857 0.6427797431768449 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0611532318671932 0.950990674522431 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -9 2)
"cameras/drone/drone0" SET Transform localScale (1.230477149292948 1.230477149292948 1.230477149292948)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -2 -10)
"cameras/drone/drone1" SET Transform localScale (1.3465233086175705 1.3465233086175705 1.3465233086175705)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.501617648603264 0)
"cameras" SET Transform eulerAngles (-16.636083962394235 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4929134310053587
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7204381455436524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2877549976076607
"cameras/drone/drone0" SET Transform localPosition (0.3007178826522183 0.3798585254946701 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9853182852684381 1.0624049382492298 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -13 4)
"cameras/drone/drone0" SET Transform localScale (1.0846944862578847 1.0846944862578847 1.0846944862578847)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 0 -20)
"cameras/drone/drone1" SET Transform localScale (0.8042993298387147 0.8042993298387147 0.8042993298387147)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.134325630914003 0)
"cameras" SET Transform eulerAngles (-12.075390071971883 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6882370940205202
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3592438799088578
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14246425533757434
"cameras/drone/drone0" SET Transform localPosition (-0.6575751650759646 0.6805731393206302 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7435668601368552 0.8963456584593901 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 14 8)
"cameras/drone/drone0" SET Transform localScale (0.7595762426692583 0.7595762426692583 0.7595762426692583)
"cameras/drone/drone1" SET Transform localEulerAngles (14 20 -15)
"cameras/drone/drone1" SET Transform localScale (0.6162142144947004 0.6162142144947004 0.6162142144947004)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.439727220074163 0)
"cameras" SET Transform eulerAngles (-12.021341603576928 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8321628827340612
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.336871357975863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.333626278689199
"cameras/drone/drone0" SET Transform localPosition (1.0209267094603869 -0.008095482646478025 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7175222365077187 1.2722224540571403 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -8 -5)
"cameras/drone/drone0" SET Transform localScale (1.3137173777899895 1.3137173777899895 1.3137173777899895)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 13 3)
"cameras/drone/drone1" SET Transform localScale (0.9255338060715014 0.9255338060715014 0.9255338060715014)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.617778202995675 0)
"cameras" SET Transform eulerAngles (-15.93388994937551 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5436287072699493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.448816226704223
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31277829820429653
"cameras/drone/drone0" SET Transform localPosition (-0.04395450080894192 0.32435932180483534 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0995559341358376 1.1737321734195505 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 19 -4)
"cameras/drone/drone0" SET Transform localScale (1.2047761511467816 1.2047761511467816 1.2047761511467816)
"cameras/drone/drone1" SET Transform localEulerAngles (9 9 -6)
"cameras/drone/drone1" SET Transform localScale (1.2697354815687387 1.2697354815687387 1.2697354815687387)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.867175612388535 0)
"cameras" SET Transform eulerAngles (-15.43375408758806 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.441582916427942
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.877324562738007
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3121355442134808
"cameras/drone/drone0" SET Transform localPosition (-0.1404596693118796 0.6847857405895839 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9349108867023327 0.9954727405487587 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 16 -14)
"cameras/drone/drone0" SET Transform localScale (1.3015328645993076 1.3015328645993076 1.3015328645993076)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -12 19)
"cameras/drone/drone1" SET Transform localScale (1.220316787886384 1.220316787886384 1.220316787886384)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.81437748516701 0)
"cameras" SET Transform eulerAngles (-17.933330001232445 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45301453175951245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8910612432832843
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.056011947382407314
"cameras/drone/drone0" SET Transform localPosition (0.19901830897679318 0.2484628392803478 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3756344281808981 1.2194127620647286 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -10 -16)
"cameras/drone/drone0" SET Transform localScale (1.3160549596120528 1.3160549596120528 1.3160549596120528)
"cameras/drone/drone1" SET Transform localEulerAngles (7 4 18)
"cameras/drone/drone1" SET Transform localScale (1.4360294037043504 1.4360294037043504 1.4360294037043504)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.420472289943291 0)
"cameras" SET Transform eulerAngles (19.88948397154924 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6365780866393682
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0204260822975884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23999840170634143
"cameras/drone/drone0" SET Transform localPosition (0.46189056805304496 0.41174127388998455 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6696313040091383 0.8505819111211328 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -12 10)
"cameras/drone/drone0" SET Transform localScale (0.6604480233422626 0.6604480233422626 0.6604480233422626)
"cameras/drone/drone1" SET Transform localEulerAngles (5 16 19)
"cameras/drone/drone1" SET Transform localScale (1.495869423498869 1.495869423498869 1.495869423498869)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.733184655945756 0)
"cameras" SET Transform eulerAngles (-19.49596560672485 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6879974006148689
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7138254896504144
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18220916917188515
"cameras/drone/drone0" SET Transform localPosition (0.8953208160659789 0.2171479164490719 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.090649956326973 1.0718015219813897 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -3 -1)
"cameras/drone/drone0" SET Transform localScale (1.4884313933551687 1.4884313933551687 1.4884313933551687)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -12 3)
"cameras/drone/drone1" SET Transform localScale (1.3122513487632785 1.3122513487632785 1.3122513487632785)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.045487876649256 0)
"cameras" SET Transform eulerAngles (-5.065045241195548 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9545292718828675
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0270889975072404
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31796301925466963
"cameras/drone/drone0" SET Transform localPosition (0.6950344820496113 0.2996571242527159 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.07549215346905047 0.9336997271918606 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 18 -9)
"cameras/drone/drone0" SET Transform localScale (1.1308842897793512 1.1308842897793512 1.1308842897793512)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -18 10)
"cameras/drone/drone1" SET Transform localScale (1.4390758589114676 1.4390758589114676 1.4390758589114676)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.309465171625032 0)
"cameras" SET Transform eulerAngles (14.164410486664757 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5294170947630381
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9915567163769348
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1370547486618274
"cameras/drone/drone0" SET Transform localPosition (-0.655635690109301 -0.1749713573864486 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5293303540170744 1.0045608807099051 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 2 9)
"cameras/drone/drone0" SET Transform localScale (0.7916414797773862 0.7916414797773862 0.7916414797773862)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -11 -11)
"cameras/drone/drone1" SET Transform localScale (1.3995564175094488 1.3995564175094488 1.3995564175094488)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1067523279521225 0)
"cameras" SET Transform eulerAngles (-19.4257547438001 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8407143931620178
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1339503047726036
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3794074927410613
"cameras/drone/drone0" SET Transform localPosition (0.7083754130712936 0.6368761134741563 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5914935166385142 0.9924463001942343 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 12 -6)
"cameras/drone/drone0" SET Transform localScale (0.676087608116101 0.676087608116101 0.676087608116101)
"cameras/drone/drone1" SET Transform localEulerAngles (16 18 -16)
"cameras/drone/drone1" SET Transform localScale (1.1101959365974303 1.1101959365974303 1.1101959365974303)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4186720321622817 0)
"cameras" SET Transform eulerAngles (-15.887065809778793 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43294857047304286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9743071870266915
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.352196470577811
"cameras/drone/drone0" SET Transform localPosition (1.1768581803413969 0.048714167804992214 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8789339195162096 1.2769500372071279 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -7 9)
"cameras/drone/drone0" SET Transform localScale (1.180463676315909 1.180463676315909 1.180463676315909)
"cameras/drone/drone1" SET Transform localEulerAngles (0 2 8)
"cameras/drone/drone1" SET Transform localScale (0.9001633229518236 0.9001633229518236 0.9001633229518236)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.414022291714399 0)
"cameras" SET Transform eulerAngles (18.412485901933202 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5057998308143938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2726798988946837
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13138074420109866
"cameras/drone/drone0" SET Transform localPosition (1.0361613985040659 0.1679044117833139 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.30887900943981883 0.9249335946187281 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 16 10)
"cameras/drone/drone0" SET Transform localScale (1.2130858924325425 1.2130858924325425 1.2130858924325425)
"cameras/drone/drone1" SET Transform localEulerAngles (3 10 5)
"cameras/drone/drone1" SET Transform localScale (0.7355476312368993 0.7355476312368993 0.7355476312368993)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.304599404790806 0)
"cameras" SET Transform eulerAngles (-0.20338024943604438 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7500403707312207
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4059074983877635
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.026111446155910656
"cameras/drone/drone0" SET Transform localPosition (-0.520684036010279 0.41314003905918867 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11120148161315302 0.8234099515131464 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -4 -14)
"cameras/drone/drone0" SET Transform localScale (1.0903497430721951 1.0903497430721951 1.0903497430721951)
"cameras/drone/drone1" SET Transform localEulerAngles (18 3 1)
"cameras/drone/drone1" SET Transform localScale (0.6764099185244102 0.6764099185244102 0.6764099185244102)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7327103502458736 0)
"cameras" SET Transform eulerAngles (-16.714916511263645 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.449038762934307
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8352978648574823
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07019227640785686
"cameras/drone/drone0" SET Transform localPosition (-0.6587390578731374 0.4026747814975839 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6837946963049468 0.8720823989720988 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 5 16)
"cameras/drone/drone0" SET Transform localScale (1.1660257308774082 1.1660257308774082 1.1660257308774082)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 19 3)
"cameras/drone/drone1" SET Transform localScale (0.7777389862587866 0.7777389862587866 0.7777389862587866)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.888311706606389 0)
"cameras" SET Transform eulerAngles (16.243393070480067 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7523750008987062
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.929841947994194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18045733499171246
"cameras/drone/drone0" SET Transform localPosition (0.2842077540783412 0.45506204021657143 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7622565592338153 1.0749646013921381 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 3 14)
"cameras/drone/drone0" SET Transform localScale (1.085791741051297 1.085791741051297 1.085791741051297)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -15 14)
"cameras/drone/drone1" SET Transform localScale (0.7150611966146544 0.7150611966146544 0.7150611966146544)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.488965051705959 0)
"cameras" SET Transform eulerAngles (-14.98395786906114 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9958062147845708
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6118744240068064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09882773382314416
"cameras/drone/drone0" SET Transform localPosition (-0.03290855834764894 -0.06085385657188341 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5482762442567981 1.0143783179156831 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -8 -20)
"cameras/drone/drone0" SET Transform localScale (0.6614790316726888 0.6614790316726888 0.6614790316726888)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 16 7)
"cameras/drone/drone1" SET Transform localScale (1.4274966504236999 1.4274966504236999 1.4274966504236999)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.789085266690849 0)
"cameras" SET Transform eulerAngles (7.439043175165857 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49458033079076386
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7930107369795867
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35796143047634754
"cameras/drone/drone0" SET Transform localPosition (0.061641986990156106 -0.04346500917825408 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.133662055841376 1.029609393525402 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 11 -2)
"cameras/drone/drone0" SET Transform localScale (1.030050767435073 1.030050767435073 1.030050767435073)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -6 -6)
"cameras/drone/drone1" SET Transform localScale (1.0093846516060765 1.0093846516060765 1.0093846516060765)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7948915090598367 0)
"cameras" SET Transform eulerAngles (-7.210117420083876 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.131960852009119
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2166031922942127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18697564304342668
"cameras/drone/drone0" SET Transform localPosition (0.41770670945046207 0.37801726446764233 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16878800765102397 0.987964586112816 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 1 1)
"cameras/drone/drone0" SET Transform localScale (0.7384115649836124 0.7384115649836124 0.7384115649836124)
"cameras/drone/drone1" SET Transform localEulerAngles (14 9 -4)
"cameras/drone/drone1" SET Transform localScale (1.417754873012412 1.417754873012412 1.417754873012412)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.13391331366556 0)
"cameras" SET Transform eulerAngles (9.489917155153549 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43466399877964973
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0335781842039113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34693150321113153
"cameras/drone/drone0" SET Transform localPosition (0.714762504057497 0.1321643029357235 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.345168642539855 0.8130897534421433 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 14 8)
"cameras/drone/drone0" SET Transform localScale (1.2835133111351398 1.2835133111351398 1.2835133111351398)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -3 -18)
"cameras/drone/drone1" SET Transform localScale (1.3501057687935898 1.3501057687935898 1.3501057687935898)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1477217505768413 0)
"cameras" SET Transform eulerAngles (9.769719376460657 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0758584827974649
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9398481460644597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05992404955063746
"cameras/drone/drone0" SET Transform localPosition (-0.6558245673842472 0.1890274883125757 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.0736429072527729 1.2938612079246772 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 3 -19)
"cameras/drone/drone0" SET Transform localScale (0.6804848003878344 0.6804848003878344 0.6804848003878344)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -10 11)
"cameras/drone/drone1" SET Transform localScale (1.359990836664435 1.359990836664435 1.359990836664435)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2292438085599615 0)
"cameras" SET Transform eulerAngles (0.042693156407153765 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2900354301685306
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2903694688908989
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3814689069540602
"cameras/drone/drone0" SET Transform localPosition (0.5115662317304275 0.5514591826747637 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9124527471370352 1.1568754161156725 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 20 -14)
"cameras/drone/drone0" SET Transform localScale (1.1047344656806208 1.1047344656806208 1.1047344656806208)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -17 -19)
"cameras/drone/drone1" SET Transform localScale (1.0459551893507417 1.0459551893507417 1.0459551893507417)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1385811263837256 0)
"cameras" SET Transform eulerAngles (11.907147780839157 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47549509251126526
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2971682293810374
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09842275725396621
"cameras/drone/drone0" SET Transform localPosition (-0.13030661045484138 0.149681285675823 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8336356326963597 0.8742703901620186 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -3 17)
"cameras/drone/drone0" SET Transform localScale (1.3573662751176594 1.3573662751176594 1.3573662751176594)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -19 12)
"cameras/drone/drone1" SET Transform localScale (1.4305727907045447 1.4305727907045447 1.4305727907045447)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.641774935118975 0)
"cameras" SET Transform eulerAngles (2.970217865230076 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7132650823828626
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5429026287798193
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.046339417679233025
"cameras/drone/drone0" SET Transform localPosition (0.6122315016445874 0.19159253419624295 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08902805991930007 0.8490783329554445 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 13 -8)
"cameras/drone/drone0" SET Transform localScale (0.8620081072942991 0.8620081072942991 0.8620081072942991)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -20 -9)
"cameras/drone/drone1" SET Transform localScale (1.3605751876276648 1.3605751876276648 1.3605751876276648)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.107832142054053 0)
"cameras" SET Transform eulerAngles (-6.892146291969205 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4031774474239844
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.625710386400328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19007634941344134
"cameras/drone/drone0" SET Transform localPosition (-0.15083949810580966 0.45200110556349476 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3033904027319261 1.0866629984840055 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -16 0)
"cameras/drone/drone0" SET Transform localScale (1.0586494212207762 1.0586494212207762 1.0586494212207762)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -8 6)
"cameras/drone/drone1" SET Transform localScale (1.4419490115326694 1.4419490115326694 1.4419490115326694)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.368868487485614 0)
"cameras" SET Transform eulerAngles (17.099423703144147 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1606630892331287
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5872201304174092
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2339807646348434
"cameras/drone/drone0" SET Transform localPosition (0.17354803927105467 0.5721893405342842 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03753479046140562 0.8134975970739036 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 9 13)
"cameras/drone/drone0" SET Transform localScale (1.080967702802992 1.080967702802992 1.080967702802992)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 5 -2)
"cameras/drone/drone1" SET Transform localScale (0.8232901810319571 0.8232901810319571 0.8232901810319571)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.721350193429321 0)
"cameras" SET Transform eulerAngles (-10.800366290851105 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7519801288095732
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3700635358328497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22734469570192345
"cameras/drone/drone0" SET Transform localPosition (0.8951261943317286 0.2406354054131276 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9101787667342695 0.8963535898139097 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 4 -18)
"cameras/drone/drone0" SET Transform localScale (1.191064691566241 1.191064691566241 1.191064691566241)
"cameras/drone/drone1" SET Transform localEulerAngles (8 13 -10)
"cameras/drone/drone1" SET Transform localScale (1.4410126370967997 1.4410126370967997 1.4410126370967997)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.080165845362491 0)
"cameras" SET Transform eulerAngles (-13.574496722093382 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5355364356967551
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3674696326933755
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3853031794184267
"cameras/drone/drone0" SET Transform localPosition (0.4310392412215769 0.14453320101425665 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.833707141953955 0.9356674853162736 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -4 20)
"cameras/drone/drone0" SET Transform localScale (0.8369600851640251 0.8369600851640251 0.8369600851640251)
"cameras/drone/drone1" SET Transform localEulerAngles (4 10 -13)
"cameras/drone/drone1" SET Transform localScale (1.1852271701316754 1.1852271701316754 1.1852271701316754)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.662632012954046 0)
"cameras" SET Transform eulerAngles (0.15678240084140072 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.488153677984605
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9298857751684149
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19114841683373063
"cameras/drone/drone0" SET Transform localPosition (0.36886913012286104 0.13970899822430555 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2745605263559494 0.8082784382637872 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 15 -14)
"cameras/drone/drone0" SET Transform localScale (1.0059742965711918 1.0059742965711918 1.0059742965711918)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 18 -16)
"cameras/drone/drone1" SET Transform localScale (1.397656366549159 1.397656366549159 1.397656366549159)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.893137124206288 0)
"cameras" SET Transform eulerAngles (3.349477558481489 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8844755031926465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6641975278078442
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16329478963890712
"cameras/drone/drone0" SET Transform localPosition (0.09418489467253943 -0.24259194607045104 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1955643803016447 0.8766631316207363 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -4 -14)
"cameras/drone/drone0" SET Transform localScale (0.6425599003045528 0.6425599003045528 0.6425599003045528)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 13 -16)
"cameras/drone/drone1" SET Transform localScale (1.09166121358042 1.09166121358042 1.09166121358042)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.705003761912009 0)
"cameras" SET Transform eulerAngles (-1.8797077771617232 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9914172290438998
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5555178522867572
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22501323134159495
"cameras/drone/drone0" SET Transform localPosition (0.8797646716929932 -0.19728532004663707 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3786602853974288 1.1377832616359977 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 3 -14)
"cameras/drone/drone0" SET Transform localScale (1.1876583615808223 1.1876583615808223 1.1876583615808223)
"cameras/drone/drone1" SET Transform localEulerAngles (18 20 12)
"cameras/drone/drone1" SET Transform localScale (0.6005187450383556 0.6005187450383556 0.6005187450383556)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.831037031548762 0)
"cameras" SET Transform eulerAngles (-13.432937704934913 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3412544121869687
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6239490758999715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11741906925909165
"cameras/drone/drone0" SET Transform localPosition (-0.661964172642922 0.17370357446268142 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8781701496495858 0.941716096532339 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 17 -17)
"cameras/drone/drone0" SET Transform localScale (0.7514467157437325 0.7514467157437325 0.7514467157437325)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -1 3)
"cameras/drone/drone1" SET Transform localScale (1.3829422091336188 1.3829422091336188 1.3829422091336188)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.46320264186501 0)
"cameras" SET Transform eulerAngles (10.477433136539311 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6780527203778868
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2435368405889717
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13227025665112704
"cameras/drone/drone0" SET Transform localPosition (-0.1408432609004291 -0.2295217101920109 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7332092356055229 0.9452513893757912 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 6 8)
"cameras/drone/drone0" SET Transform localScale (1.348584390854461 1.348584390854461 1.348584390854461)
"cameras/drone/drone1" SET Transform localEulerAngles (10 8 -1)
"cameras/drone/drone1" SET Transform localScale (1.2137013084698318 1.2137013084698318 1.2137013084698318)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.643958200837838 0)
"cameras" SET Transform eulerAngles (-17.088192948686917 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4558585106372113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2318525294087723
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10482117356476706
"cameras/drone/drone0" SET Transform localPosition (-0.8717772227108371 0.21814298791454106 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9302948514899843 0.837463353942949 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 19 16)
"cameras/drone/drone0" SET Transform localScale (1.4331655778776526 1.4331655778776526 1.4331655778776526)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -13 14)
"cameras/drone/drone1" SET Transform localScale (1.104092234797565 1.104092234797565 1.104092234797565)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8427366999263475 0)
"cameras" SET Transform eulerAngles (16.81254291530381 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1337388487101097
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9418538130088008
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3143159227797603
"cameras/drone/drone0" SET Transform localPosition (0.5296227539254788 -0.07981647222606164 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4969298437306464 1.2446843486949315 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -1 -6)
"cameras/drone/drone0" SET Transform localScale (0.8026191370882914 0.8026191370882914 0.8026191370882914)
"cameras/drone/drone1" SET Transform localEulerAngles (9 19 9)
"cameras/drone/drone1" SET Transform localScale (0.9182204530707132 0.9182204530707132 0.9182204530707132)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8689981792685355 0)
"cameras" SET Transform eulerAngles (1.1087411079440486 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.847495410629652
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9245938374780323
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35674970893828917
"cameras/drone/drone0" SET Transform localPosition (-0.931247796629618 -0.20166006487863558 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4695790765652349 1.2558042043484128 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -13 12)
"cameras/drone/drone0" SET Transform localScale (1.3817455588663816 1.3817455588663816 1.3817455588663816)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -20 -8)
"cameras/drone/drone1" SET Transform localScale (1.4747001889907239 1.4747001889907239 1.4747001889907239)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4875630812708165 0)
"cameras" SET Transform eulerAngles (9.936712053981914 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6381662925395489
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2955499010771727
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.012581347245086994
"cameras/drone/drone0" SET Transform localPosition (0.10054652099367933 0.060197845087787416 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07455477363565932 1.0667454396576197 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 17 -4)
"cameras/drone/drone0" SET Transform localScale (0.6382385122926094 0.6382385122926094 0.6382385122926094)
"cameras/drone/drone1" SET Transform localEulerAngles (0 2 -5)
"cameras/drone/drone1" SET Transform localScale (0.7488990125658859 0.7488990125658859 0.7488990125658859)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.38007214499135 0)
"cameras" SET Transform eulerAngles (-0.931617078316318 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8267490483003525
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7787924729302658
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06074495179263866
"cameras/drone/drone0" SET Transform localPosition (0.18944077032178552 -0.14400673139887593 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.316713884636748 1.0172250155859353 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -18 8)
"cameras/drone/drone0" SET Transform localScale (1.0917537540412647 1.0917537540412647 1.0917537540412647)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 11 16)
"cameras/drone/drone1" SET Transform localScale (0.8517532822515365 0.8517532822515365 0.8517532822515365)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1447716758630966 0)
"cameras" SET Transform eulerAngles (-0.6212200945720241 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0681317609224612
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9350231567918006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11723231313158707
"cameras/drone/drone0" SET Transform localPosition (-0.8103289168196509 0.2649647738488617 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.18848614791127205 1.2194758892806248 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -4 20)
"cameras/drone/drone0" SET Transform localScale (1.4910983332898684 1.4910983332898684 1.4910983332898684)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -4 2)
"cameras/drone/drone1" SET Transform localScale (0.749029435674927 0.749029435674927 0.749029435674927)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.557405260520638 0)
"cameras" SET Transform eulerAngles (-16.027891624590467 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.18500685863101
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9115492071816595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.061179846768572604
"cameras/drone/drone0" SET Transform localPosition (0.5146538824391422 0.37731998090899993 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2503197551979319 0.9867042258059272 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 6 -9)
"cameras/drone/drone0" SET Transform localScale (0.7444692669729438 0.7444692669729438 0.7444692669729438)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -11 6)
"cameras/drone/drone1" SET Transform localScale (1.388887516244383 1.388887516244383 1.388887516244383)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.624142261575133 0)
"cameras" SET Transform eulerAngles (-5.419044734549292 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8003553844021292
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7676706259586763
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04900366544518473
"cameras/drone/drone0" SET Transform localPosition (-0.49926587544379686 0.24662980409475982 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0351882428959016 1.1537680565907713 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 1 11)
"cameras/drone/drone0" SET Transform localScale (0.7918016022579015 0.7918016022579015 0.7918016022579015)
"cameras/drone/drone1" SET Transform localEulerAngles (11 19 -4)
"cameras/drone/drone1" SET Transform localScale (0.8987124368075667 0.8987124368075667 0.8987124368075667)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.560575135134684 0)
"cameras" SET Transform eulerAngles (-14.210258665146206 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.331375490719487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3544912923262185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3147558797211635
"cameras/drone/drone0" SET Transform localPosition (-0.2990510310833645 0.5949396953219497 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7748803199433019 1.0047263046347585 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 9 -12)
"cameras/drone/drone0" SET Transform localScale (1.2446569211428375 1.2446569211428375 1.2446569211428375)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 9 -5)
"cameras/drone/drone1" SET Transform localScale (1.3569848395176156 1.3569848395176156 1.3569848395176156)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.830545832912081 0)
"cameras" SET Transform eulerAngles (5.95539622434417 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.344612918389032
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9898616703985106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3326482756594755
"cameras/drone/drone0" SET Transform localPosition (-0.25359846585787893 0.002966857407866119 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.15065012575065628 0.9849207040506729 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -14 -1)
"cameras/drone/drone0" SET Transform localScale (1.2187936632132654 1.2187936632132654 1.2187936632132654)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -19 12)
"cameras/drone/drone1" SET Transform localScale (1.4193829116576464 1.4193829116576464 1.4193829116576464)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6944201954189624 0)
"cameras" SET Transform eulerAngles (-5.722093059645253 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4495762813684472
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8743940571881235
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2755992412741201
"cameras/drone/drone0" SET Transform localPosition (-0.6655773123606503 0.20495582310556887 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2812251241474142 1.2596775047382454 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 4 -16)
"cameras/drone/drone0" SET Transform localScale (0.7511001918244347 0.7511001918244347 0.7511001918244347)
"cameras/drone/drone1" SET Transform localEulerAngles (13 19 -10)
"cameras/drone/drone1" SET Transform localScale (0.9961583925173472 0.9961583925173472 0.9961583925173472)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5810864713209725 0)
"cameras" SET Transform eulerAngles (-10.847305456528717 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1587475768139694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.188646890574946
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025324959877227826
"cameras/drone/drone0" SET Transform localPosition (0.028602562487742622 -0.16410136641668288 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0713922750598655 1.2507586020984347 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 7 -2)
"cameras/drone/drone0" SET Transform localScale (0.7040514908397084 0.7040514908397084 0.7040514908397084)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 20 5)
"cameras/drone/drone1" SET Transform localScale (0.951559362253872 0.951559362253872 0.951559362253872)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.87437766541012 0)
"cameras" SET Transform eulerAngles (11.419239864335914 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0028943020530556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.233092450458313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17741181700994071
"cameras/drone/drone0" SET Transform localPosition (-0.40434813919064716 -0.26807895601933124 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.43015588501795454 1.0986520918536715 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -17 13)
"cameras/drone/drone0" SET Transform localScale (0.8490690201883432 0.8490690201883432 0.8490690201883432)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -18 -6)
"cameras/drone/drone1" SET Transform localScale (0.6126767660601543 0.6126767660601543 0.6126767660601543)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7430879508531723 0)
"cameras" SET Transform eulerAngles (18.30998484192842 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6805511624130742
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8860847463289345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05503368725955249
"cameras/drone/drone0" SET Transform localPosition (0.2657009801617176 -0.24196551245225312 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6725342297791339 1.1389491827034464 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -20 15)
"cameras/drone/drone0" SET Transform localScale (0.777859376296135 0.777859376296135 0.777859376296135)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -18 -14)
"cameras/drone/drone1" SET Transform localScale (0.9006127881037604 0.9006127881037604 0.9006127881037604)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.111375370095606 0)
"cameras" SET Transform eulerAngles (-10.09314317632164 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9897219982602184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7897909314559097
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26842932110131235
"cameras/drone/drone0" SET Transform localPosition (0.7356742868307542 0.1529788142003204 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4958532580403541 1.2617390367135166 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -19 -19)
"cameras/drone/drone0" SET Transform localScale (0.7774632279941843 0.7774632279941843 0.7774632279941843)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -8 12)
"cameras/drone/drone1" SET Transform localScale (0.9889124197644058 0.9889124197644058 0.9889124197644058)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.975434918831 0)
"cameras" SET Transform eulerAngles (11.521740256166147 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9292025227213286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4330341118666685
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37761545260361745
"cameras/drone/drone0" SET Transform localPosition (-0.746526958662084 -0.2331916455587128 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9241637661975898 1.074174692727726 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 12 0)
"cameras/drone/drone0" SET Transform localScale (1.3591441898194219 1.3591441898194219 1.3591441898194219)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 14 -4)
"cameras/drone/drone1" SET Transform localScale (0.6410349206248287 0.6410349206248287 0.6410349206248287)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.175907488205244 0)
"cameras" SET Transform eulerAngles (-15.924474850059273 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2320978289644247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6186677669862157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3404223682809364
"cameras/drone/drone0" SET Transform localPosition (-0.7418277825083539 0.2093493091179079 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3353491033143623 1.213560407006661 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -10 -13)
"cameras/drone/drone0" SET Transform localScale (0.9877002266328233 0.9877002266328233 0.9877002266328233)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -14 -6)
"cameras/drone/drone1" SET Transform localScale (1.011875101375276 1.011875101375276 1.011875101375276)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.090867116369498 0)
"cameras" SET Transform eulerAngles (-1.6806372912964633 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0800745491496222
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4173548464786014
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03687633330858655
"cameras/drone/drone0" SET Transform localPosition (0.6496082943947514 0.19963701609326462 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6333996806715039 1.1051327112815112 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -12 4)
"cameras/drone/drone0" SET Transform localScale (0.9412374668138473 0.9412374668138473 0.9412374668138473)
"cameras/drone/drone1" SET Transform localEulerAngles (8 10 2)
"cameras/drone/drone1" SET Transform localScale (1.1040345595464474 1.1040345595464474 1.1040345595464474)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.730475645191547 0)
"cameras" SET Transform eulerAngles (5.056366062611591 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5723109790214094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9263052452754925
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15021757837203986
"cameras/drone/drone0" SET Transform localPosition (-0.09264407957800058 0.668798083515876 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7843987860284697 1.2415493683889411 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -8 7)
"cameras/drone/drone0" SET Transform localScale (1.374086585494707 1.374086585494707 1.374086585494707)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -15 17)
"cameras/drone/drone1" SET Transform localScale (1.0429122218896092 1.0429122218896092 1.0429122218896092)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.586188174090952 0)
"cameras" SET Transform eulerAngles (11.742132561116293 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.039803158483497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5052332961152177
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2912885601917773
"cameras/drone/drone0" SET Transform localPosition (1.0139291315530767 0.5071890318067185 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.749749379437481 0.9593802336501671 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -18 20)
"cameras/drone/drone0" SET Transform localScale (1.0617586877583784 1.0617586877583784 1.0617586877583784)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -2 -4)
"cameras/drone/drone1" SET Transform localScale (1.0334323690156664 1.0334323690156664 1.0334323690156664)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.037379370222415 0)
"cameras" SET Transform eulerAngles (4.7344186239648 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3126581801579298
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1402753668680032
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26514512461022943
"cameras/drone/drone0" SET Transform localPosition (0.24397850424915601 -0.2724148393072368 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.27994263127412466 0.8283755168717625 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 11 13)
"cameras/drone/drone0" SET Transform localScale (1.0867381307519717 1.0867381307519717 1.0867381307519717)
"cameras/drone/drone1" SET Transform localEulerAngles (14 9 13)
"cameras/drone/drone1" SET Transform localScale (0.7753388750637292 0.7753388750637292 0.7753388750637292)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.324963396326858 0)
"cameras" SET Transform eulerAngles (13.435475067151728 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3859011042775027
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3566544245670071
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24774349891024838
"cameras/drone/drone0" SET Transform localPosition (-0.9101707290794864 0.45716828493269807 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.941567388697025 0.9674253288607277 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -20 12)
"cameras/drone/drone0" SET Transform localScale (1.3478772949905276 1.3478772949905276 1.3478772949905276)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -11 -8)
"cameras/drone/drone1" SET Transform localScale (0.8536394737755699 0.8536394737755699 0.8536394737755699)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.59086388442652 0)
"cameras" SET Transform eulerAngles (-19.513390892378663 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.261320869294477
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9585863678246076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29643937874364984
"cameras/drone/drone0" SET Transform localPosition (-0.130988264332762 0.01968194050039257 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9757480588033347 0.9937653711451739 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 16 4)
"cameras/drone/drone0" SET Transform localScale (1.1904230881888567 1.1904230881888567 1.1904230881888567)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -6 -14)
"cameras/drone/drone1" SET Transform localScale (0.8524521893142158 0.8524521893142158 0.8524521893142158)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
