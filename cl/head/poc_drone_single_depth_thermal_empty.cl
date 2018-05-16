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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 175 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 39 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 59 collisionCheck true stickToGround false 
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
"cameras" SET Transform eulerAngles (-7.658452011250954 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 74
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.342900597546864 0)
"cameras" SET Transform eulerAngles (-4.469795797119151 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6192648163432923
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.150862080842816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21200595852512472
"cameras/drone/drone0" SET Transform localPosition (0.7555359659004584 0.04100240323873289 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.49149581511446416 0.9326013348524926 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 4 -5)
"cameras/drone/drone0" SET Transform localScale (0.9468372459611758 0.9468372459611758 0.9468372459611758)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 8 14)
"cameras/drone/drone1" SET Transform localScale (0.8096450115228003 0.8096450115228003 0.8096450115228003)
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
"cameras" SET Transform position (0 3.62677421226927 0)
"cameras" SET Transform eulerAngles (4.402916531090412 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5117102048884017
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1688739910982853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3981218222687343
"cameras/drone/drone0" SET Transform localPosition (-1.1228543598203917 -0.17583874631673396 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7069781908780345 1.0313681355899904 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -13 9)
"cameras/drone/drone0" SET Transform localScale (1.0745067827010002 1.0745067827010002 1.0745067827010002)
"cameras/drone/drone1" SET Transform localEulerAngles (15 14 5)
"cameras/drone/drone1" SET Transform localScale (1.4983784009671073 1.4983784009671073 1.4983784009671073)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.205093941622799 0)
"cameras" SET Transform eulerAngles (8.71740532831502 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6060901722124106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1963622885748002
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1536960088415445
"cameras/drone/drone0" SET Transform localPosition (0.8321619210626754 0.6704081083517699 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8366871660153259 1.0932377981525243 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 12 17)
"cameras/drone/drone0" SET Transform localScale (1.0661595448630499 1.0661595448630499 1.0661595448630499)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -10 15)
"cameras/drone/drone1" SET Transform localScale (1.1653628298246659 1.1653628298246659 1.1653628298246659)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.926987804228789 0)
"cameras" SET Transform eulerAngles (-0.8142468179811324 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1633746788343466
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2875021273895657
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22395980206425842
"cameras/drone/drone0" SET Transform localPosition (-0.6614351200954293 -0.26709435078684757 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.227289711500265 0.9774778353207878 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -12 -20)
"cameras/drone/drone0" SET Transform localScale (0.7090354186057152 0.7090354186057152 0.7090354186057152)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -8 17)
"cameras/drone/drone1" SET Transform localScale (1.2466523780210612 1.2466523780210612 1.2466523780210612)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.796614568515834 0)
"cameras" SET Transform eulerAngles (17.832871231734266 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7487265641568239
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.499712604758756
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3985828434221524
"cameras/drone/drone0" SET Transform localPosition (0.3443767002693643 0.030018245470289806 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.15772449887864792 0.856005980388272 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 6 -17)
"cameras/drone/drone0" SET Transform localScale (1.0674610406799108 1.0674610406799108 1.0674610406799108)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -19 -3)
"cameras/drone/drone1" SET Transform localScale (1.461674177484479 1.461674177484479 1.461674177484479)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5683608546568006 0)
"cameras" SET Transform eulerAngles (13.042641912630557 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5060106176696242
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2157404483721117
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14920113543814897
"cameras/drone/drone0" SET Transform localPosition (-0.7652334468488649 0.13958095301066248 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21428701098892655 0.8072598218961919 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -14 7)
"cameras/drone/drone0" SET Transform localScale (0.8184816570780598 0.8184816570780598 0.8184816570780598)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 17 12)
"cameras/drone/drone1" SET Transform localScale (0.6394156323371485 0.6394156323371485 0.6394156323371485)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.851851116412083 0)
"cameras" SET Transform eulerAngles (-16.011758954358708 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.547412612373798
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7120194032532075
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05894514666065934
"cameras/drone/drone0" SET Transform localPosition (-1.1977437940490263 0.5094569610796933 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1194869415515574 1.0742048330161778 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -16 -6)
"cameras/drone/drone0" SET Transform localScale (0.6492164623261005 0.6492164623261005 0.6492164623261005)
"cameras/drone/drone1" SET Transform localEulerAngles (16 5 -19)
"cameras/drone/drone1" SET Transform localScale (1.3222148095459603 1.3222148095459603 1.3222148095459603)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0547727783186227 0)
"cameras" SET Transform eulerAngles (-11.113784620567099 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0780181530221051
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5484181317656378
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.042024331305645694
"cameras/drone/drone0" SET Transform localPosition (1.139938370921232 0.0795919964345731 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0944280401797124 1.1083557887269073 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 16 18)
"cameras/drone/drone0" SET Transform localScale (0.8760646582501479 0.8760646582501479 0.8760646582501479)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -19 6)
"cameras/drone/drone1" SET Transform localScale (1.2964950811865616 1.2964950811865616 1.2964950811865616)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1630932757467294 0)
"cameras" SET Transform eulerAngles (18.61558732441594 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5354790949302051
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7063441563284623
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.187348367160946
"cameras/drone/drone0" SET Transform localPosition (-0.8044803485706303 0.4539996168867367 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.632588237447596 0.9506257328077174 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 5 7)
"cameras/drone/drone0" SET Transform localScale (1.289547209022441 1.289547209022441 1.289547209022441)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -2 11)
"cameras/drone/drone1" SET Transform localScale (0.7997659950532908 0.7997659950532908 0.7997659950532908)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.434633507060369 0)
"cameras" SET Transform eulerAngles (19.691566641429667 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0553582728104718
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7656377030260813
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32011821806712104
"cameras/drone/drone0" SET Transform localPosition (-0.7319296247508056 0.0919368153230678 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1607266602292283 1.0857303625496235 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -14 11)
"cameras/drone/drone0" SET Transform localScale (1.236103145400849 1.236103145400849 1.236103145400849)
"cameras/drone/drone1" SET Transform localEulerAngles (15 13 -18)
"cameras/drone/drone1" SET Transform localScale (1.3340867173647255 1.3340867173647255 1.3340867173647255)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.846549673867665 0)
"cameras" SET Transform eulerAngles (10.938306730450144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2773613803881623
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.671615833051934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24930202662100964
"cameras/drone/drone0" SET Transform localPosition (0.7344187132884812 -0.22042329515069753 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4928261876708079 1.0942538712190562 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 10 -8)
"cameras/drone/drone0" SET Transform localScale (1.1103685062497843 1.1103685062497843 1.1103685062497843)
"cameras/drone/drone1" SET Transform localEulerAngles (16 9 5)
"cameras/drone/drone1" SET Transform localScale (1.4155448625660965 1.4155448625660965 1.4155448625660965)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.719514023005623 0)
"cameras" SET Transform eulerAngles (19.224563070017844 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.290384539214753
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.979166487807954
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3299168979072813
"cameras/drone/drone0" SET Transform localPosition (-0.2606403024557735 -0.02147344457749739 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7419805939205986 1.089626087302894 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -1 -13)
"cameras/drone/drone0" SET Transform localScale (0.72756856281606 0.72756856281606 0.72756856281606)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 20 8)
"cameras/drone/drone1" SET Transform localScale (0.9910955446248235 0.9910955446248235 0.9910955446248235)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.876330505390656 0)
"cameras" SET Transform eulerAngles (-8.582423892404961 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5174848965583628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4428383262684836
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31340992600885237
"cameras/drone/drone0" SET Transform localPosition (0.4845723459879352 0.031099407917502597 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4306044720302624 1.136002111115527 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -4 -15)
"cameras/drone/drone0" SET Transform localScale (1.2576686332884481 1.2576686332884481 1.2576686332884481)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -12 -6)
"cameras/drone/drone1" SET Transform localScale (0.7104393118786844 0.7104393118786844 0.7104393118786844)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.367805289907405 0)
"cameras" SET Transform eulerAngles (-17.78241226586069 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8372116121346614
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1906290004742384
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.295943366166199
"cameras/drone/drone0" SET Transform localPosition (-0.5274372737380958 0.16609893289228855 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.32304737754944157 1.0955533706235185 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -20 16)
"cameras/drone/drone0" SET Transform localScale (1.4403892329775823 1.4403892329775823 1.4403892329775823)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 0 -15)
"cameras/drone/drone1" SET Transform localScale (0.9803253917855363 0.9803253917855363 0.9803253917855363)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4742918146545225 0)
"cameras" SET Transform eulerAngles (19.673708152250754 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5868664314912726
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6851798099157946
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3897467185308757
"cameras/drone/drone0" SET Transform localPosition (0.4820139427229275 -0.22053052629778197 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.40883403009970376 1.1246656643288004 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -10 -13)
"cameras/drone/drone0" SET Transform localScale (1.4831044675593765 1.4831044675593765 1.4831044675593765)
"cameras/drone/drone1" SET Transform localEulerAngles (5 14 -18)
"cameras/drone/drone1" SET Transform localScale (0.9352279033113091 0.9352279033113091 0.9352279033113091)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.360836857884421 0)
"cameras" SET Transform eulerAngles (17.03424142894206 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4004850248790183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4011726498699806
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0027067499421171703
"cameras/drone/drone0" SET Transform localPosition (0.5414277736346773 -0.2613048012836661 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.15954946707252815 0.871797726957473 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -8 14)
"cameras/drone/drone0" SET Transform localScale (0.9121450004836682 0.9121450004836682 0.9121450004836682)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 2 11)
"cameras/drone/drone1" SET Transform localScale (1.361042972527189 1.361042972527189 1.361042972527189)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.575474752172373 0)
"cameras" SET Transform eulerAngles (-6.121318451635691 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6692182770843048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7432700817402371
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22019034067915239
"cameras/drone/drone0" SET Transform localPosition (0.7871281071398724 -0.1833610668363836 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3053813700244947 1.170771336425352 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 1 10)
"cameras/drone/drone0" SET Transform localScale (0.8590880571494617 0.8590880571494617 0.8590880571494617)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -19 -12)
"cameras/drone/drone1" SET Transform localScale (1.2155637841863034 1.2155637841863034 1.2155637841863034)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.376602349546572 0)
"cameras" SET Transform eulerAngles (-15.385500341342482 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7485602845493846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1536166282358635
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.321616830542923
"cameras/drone/drone0" SET Transform localPosition (0.5731031025689712 0.37361462345505475 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.02553190992834553 1.2545015755664002 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -9 5)
"cameras/drone/drone0" SET Transform localScale (1.1459863358775042 1.1459863358775042 1.1459863358775042)
"cameras/drone/drone1" SET Transform localEulerAngles (14 8 19)
"cameras/drone/drone1" SET Transform localScale (0.7271993644083444 0.7271993644083444 0.7271993644083444)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7447043949320973 0)
"cameras" SET Transform eulerAngles (-13.790867182934385 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.547294525953613
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.855884986114817
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2818516906771397
"cameras/drone/drone0" SET Transform localPosition (-0.5027066821075389 0.6134973069929333 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.01457192605292712 1.202616150282636 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -9 -17)
"cameras/drone/drone0" SET Transform localScale (1.4095956623050916 1.4095956623050916 1.4095956623050916)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -10 -18)
"cameras/drone/drone1" SET Transform localScale (1.1387369243308791 1.1387369243308791 1.1387369243308791)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4147898821535216 0)
"cameras" SET Transform eulerAngles (15.272903296395697 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3054719567479554
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1133278437306415
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34405121958080004
"cameras/drone/drone0" SET Transform localPosition (0.17143753599801248 0.6332371302113746 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2131656393167327 1.2470062743908517 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -20 -4)
"cameras/drone/drone0" SET Transform localScale (0.9993413568895015 0.9993413568895015 0.9993413568895015)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 14 15)
"cameras/drone/drone1" SET Transform localScale (1.368916892863624 1.368916892863624 1.368916892863624)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2034857653907185 0)
"cameras" SET Transform eulerAngles (15.16879400728628 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.703965514457416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9398089804519413
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1817544711120919
"cameras/drone/drone0" SET Transform localPosition (-0.2238808333665644 -0.22472797061557265 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17612267026361272 1.1726204233021518 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 20 19)
"cameras/drone/drone0" SET Transform localScale (0.961977811813037 0.961977811813037 0.961977811813037)
"cameras/drone/drone1" SET Transform localEulerAngles (20 7 1)
"cameras/drone/drone1" SET Transform localScale (0.7480645305749196 0.7480645305749196 0.7480645305749196)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8384023052165075 0)
"cameras" SET Transform eulerAngles (19.847428897634657 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4941745718248879
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.218512807597004
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35656208467721684
"cameras/drone/drone0" SET Transform localPosition (0.960634248100382 0.6458431051638698 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7756805821424975 0.812463809668174 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -13 14)
"cameras/drone/drone0" SET Transform localScale (0.8583990372764034 0.8583990372764034 0.8583990372764034)
"cameras/drone/drone1" SET Transform localEulerAngles (2 18 -12)
"cameras/drone/drone1" SET Transform localScale (1.278701346126284 1.278701346126284 1.278701346126284)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.214913770950756 0)
"cameras" SET Transform eulerAngles (7.993299277099695 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7073314186484908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1376737490608555
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09190285962699836
"cameras/drone/drone0" SET Transform localPosition (-0.310675773925412 -0.07010146156396696 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9443428449745189 1.0708482317674801 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -13 -7)
"cameras/drone/drone0" SET Transform localScale (1.2164409298603531 1.2164409298603531 1.2164409298603531)
"cameras/drone/drone1" SET Transform localEulerAngles (4 19 14)
"cameras/drone/drone1" SET Transform localScale (0.7546415981890177 0.7546415981890177 0.7546415981890177)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.609990607645779 0)
"cameras" SET Transform eulerAngles (-8.022922507097823 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9269635047676898
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9310644111388813
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07587393319561389
"cameras/drone/drone0" SET Transform localPosition (0.07818361671542462 0.17431932123555677 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3585278077771452 1.0366038912490807 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -20 -17)
"cameras/drone/drone0" SET Transform localScale (1.1573497037673244 1.1573497037673244 1.1573497037673244)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 16 6)
"cameras/drone/drone1" SET Transform localScale (0.9444176234628956 0.9444176234628956 0.9444176234628956)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.445621808090873 0)
"cameras" SET Transform eulerAngles (13.138097391738953 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5803476162013217
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0677571898632399
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2396002421174954
"cameras/drone/drone0" SET Transform localPosition (0.11536229134784359 0.15847553629545502 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.191405916790161 0.8878195880973778 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -20 11)
"cameras/drone/drone0" SET Transform localScale (1.3566820293582373 1.3566820293582373 1.3566820293582373)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -6 19)
"cameras/drone/drone1" SET Transform localScale (1.4076360398933592 1.4076360398933592 1.4076360398933592)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.928629401507061 0)
"cameras" SET Transform eulerAngles (2.0516648379292306 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.821440837800793
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3946716139573396
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21598426856922293
"cameras/drone/drone0" SET Transform localPosition (0.3180351856981516 -0.22688594320348382 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4668810801568428 0.9126751225028802 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 1 12)
"cameras/drone/drone0" SET Transform localScale (1.465942268779314 1.465942268779314 1.465942268779314)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -13 12)
"cameras/drone/drone1" SET Transform localScale (0.9163984384742666 0.9163984384742666 0.9163984384742666)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1035197719097787 0)
"cameras" SET Transform eulerAngles (-19.722368723005225 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4859054159596248
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3143849908227467
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20922995665322408
"cameras/drone/drone0" SET Transform localPosition (-1.0337625078038655 -0.05374055999322397 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.456272341746614 1.2425817563189936 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -6 7)
"cameras/drone/drone0" SET Transform localScale (0.802970698741468 0.802970698741468 0.802970698741468)
"cameras/drone/drone1" SET Transform localEulerAngles (3 6 0)
"cameras/drone/drone1" SET Transform localScale (1.3151859591074226 1.3151859591074226 1.3151859591074226)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.099762204335287 0)
"cameras" SET Transform eulerAngles (5.074848872889067 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9461656849845438
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6034895890459122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1389077000067784
"cameras/drone/drone0" SET Transform localPosition (-0.6083867899597222 0.6572712240532039 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7911034340292111 0.9132425649865166 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 8 -10)
"cameras/drone/drone0" SET Transform localScale (1.4314078372920123 1.4314078372920123 1.4314078372920123)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 1 0)
"cameras/drone/drone1" SET Transform localScale (0.8234207380997698 0.8234207380997698 0.8234207380997698)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.697797737765639 0)
"cameras" SET Transform eulerAngles (-15.23531694878562 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4769726581014653
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8143753268202938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2675043970660876
"cameras/drone/drone0" SET Transform localPosition (-1.1313706495990283 0.2798697104699042 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0398956274277358 1.1568371575568337 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -12 -10)
"cameras/drone/drone0" SET Transform localScale (0.9363702524202548 0.9363702524202548 0.9363702524202548)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 1 -16)
"cameras/drone/drone1" SET Transform localScale (1.0297802025839733 1.0297802025839733 1.0297802025839733)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3299730497844 0)
"cameras" SET Transform eulerAngles (3.4421411418671255 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9680079317902848
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6965682982626
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39951065759522575
"cameras/drone/drone0" SET Transform localPosition (0.29888856128287133 -0.045385025771053134 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8663735625035567 1.1447996163890475 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -16 1)
"cameras/drone/drone0" SET Transform localScale (0.8211409272179631 0.8211409272179631 0.8211409272179631)
"cameras/drone/drone1" SET Transform localEulerAngles (11 11 11)
"cameras/drone/drone1" SET Transform localScale (1.1615682966437904 1.1615682966437904 1.1615682966437904)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.602214495300921 0)
"cameras" SET Transform eulerAngles (18.66176018955094 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2002674144375165
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.372968225165984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19669598347742953
"cameras/drone/drone0" SET Transform localPosition (-0.2346120779267603 0.4507790187660224 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3586075810663687 1.2668571941618954 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -14 -13)
"cameras/drone/drone0" SET Transform localScale (1.4036393164504544 1.4036393164504544 1.4036393164504544)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 17 19)
"cameras/drone/drone1" SET Transform localScale (1.3029967649975633 1.3029967649975633 1.3029967649975633)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.08626638445244 0)
"cameras" SET Transform eulerAngles (-5.051325284841477 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6351252963567509
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.845224575631751
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1828354429727116
"cameras/drone/drone0" SET Transform localPosition (-0.3270728967920503 0.11077055126976482 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.31422889764651896 0.8914795235196533 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -17 -13)
"cameras/drone/drone0" SET Transform localScale (1.1710961674916018 1.1710961674916018 1.1710961674916018)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -14 10)
"cameras/drone/drone1" SET Transform localScale (1.0355147931030741 1.0355147931030741 1.0355147931030741)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.462837449376707 0)
"cameras" SET Transform eulerAngles (-1.0920369410960191 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5876823655072974
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.029023138547358
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16437475513848662
"cameras/drone/drone0" SET Transform localPosition (1.1308045285404085 -0.03891254869695132 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.178996957894926 1.0966538507139907 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -6 4)
"cameras/drone/drone0" SET Transform localScale (0.8799378176175523 0.8799378176175523 0.8799378176175523)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -16 17)
"cameras/drone/drone1" SET Transform localScale (1.4414155242044693 1.4414155242044693 1.4414155242044693)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0165529405319456 0)
"cameras" SET Transform eulerAngles (15.463198598669464 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6397757467107308
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4632907075954629
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38455457199470117
"cameras/drone/drone0" SET Transform localPosition (-0.6737214700954391 0.12297584564235303 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16605607329615846 1.2859447404359885 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 9 1)
"cameras/drone/drone0" SET Transform localScale (1.0591155470598685 1.0591155470598685 1.0591155470598685)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 1 4)
"cameras/drone/drone1" SET Transform localScale (1.4752933441867566 1.4752933441867566 1.4752933441867566)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.415149398087474 0)
"cameras" SET Transform eulerAngles (-7.5071767020166735 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1218477028978031
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.945951363470024
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17817230211535048
"cameras/drone/drone0" SET Transform localPosition (0.37392982019419385 0.10253068410686755 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1952544308559778 0.9869592010513761 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 13 -17)
"cameras/drone/drone0" SET Transform localScale (0.6602113511949101 0.6602113511949101 0.6602113511949101)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -7 19)
"cameras/drone/drone1" SET Transform localScale (0.9515704384983543 0.9515704384983543 0.9515704384983543)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.195773274776391 0)
"cameras" SET Transform eulerAngles (-5.8802893530653755 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3650198312322837
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4695144826159867
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26767910997421607
"cameras/drone/drone0" SET Transform localPosition (-0.40725886972686065 -0.005856094970364489 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.223323296370743 1.066452192980822 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 17 -8)
"cameras/drone/drone0" SET Transform localScale (1.4163069657484788 1.4163069657484788 1.4163069657484788)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -7 13)
"cameras/drone/drone1" SET Transform localScale (1.3551898074623892 1.3551898074623892 1.3551898074623892)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.015318623309234 0)
"cameras" SET Transform eulerAngles (-10.438114467158094 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2908024146571577
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9302427787300945
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23461508712719226
"cameras/drone/drone0" SET Transform localPosition (0.08874473784653802 0.6272191821610731 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1319949435712469 1.1227952950108664 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -13 -8)
"cameras/drone/drone0" SET Transform localScale (1.4499124503654806 1.4499124503654806 1.4499124503654806)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 4 14)
"cameras/drone/drone1" SET Transform localScale (0.8107786050557646 0.8107786050557646 0.8107786050557646)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.108393420983311 0)
"cameras" SET Transform eulerAngles (19.073748001838425 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8224468450393165
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0362680596903766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09886074808281552
"cameras/drone/drone0" SET Transform localPosition (0.6339788482225879 0.47774708065526333 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.198677171943211 0.9701087686893994 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -5 12)
"cameras/drone/drone0" SET Transform localScale (1.0046187668426678 1.0046187668426678 1.0046187668426678)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -20 -2)
"cameras/drone/drone1" SET Transform localScale (1.2885952350647174 1.2885952350647174 1.2885952350647174)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.535174883776022 0)
"cameras" SET Transform eulerAngles (-9.89985019310144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9654113504064001
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2415114383224304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02158343901803086
"cameras/drone/drone0" SET Transform localPosition (-0.7168218940464366 -0.26128651788128915 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21072628355972567 0.8987272923763572 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -18 -9)
"cameras/drone/drone0" SET Transform localScale (1.2806950929463095 1.2806950929463095 1.2806950929463095)
"cameras/drone/drone1" SET Transform localEulerAngles (1 18 12)
"cameras/drone/drone1" SET Transform localScale (0.7980102784989774 0.7980102784989774 0.7980102784989774)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4282972290651355 0)
"cameras" SET Transform eulerAngles (7.99717051468976 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6344117682147505
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1799677446936803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3882471041641947
"cameras/drone/drone0" SET Transform localPosition (0.012742114572001029 0.3756971483232409 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6587830227017886 1.2228762493816532 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -20 6)
"cameras/drone/drone0" SET Transform localScale (1.1240905547247635 1.1240905547247635 1.1240905547247635)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -4 -3)
"cameras/drone/drone1" SET Transform localScale (0.8733296728141876 0.8733296728141876 0.8733296728141876)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7549792466144485 0)
"cameras" SET Transform eulerAngles (18.438877019069707 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4201629830945437
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9083569109758138
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20663806926895228
"cameras/drone/drone0" SET Transform localPosition (1.0960593812993846 0.0831713046786779 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11456081524587125 1.03024181253127 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 14 -1)
"cameras/drone/drone0" SET Transform localScale (0.7551245808688185 0.7551245808688185 0.7551245808688185)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -10 14)
"cameras/drone/drone1" SET Transform localScale (0.6249080388258743 0.6249080388258743 0.6249080388258743)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5888001983708144 0)
"cameras" SET Transform eulerAngles (-0.22910836192800232 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.489633665068899
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9186809773328418
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10520126560072547
"cameras/drone/drone0" SET Transform localPosition (0.42326244636035604 0.5017995962161936 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0534997377594595 1.0198260320956603 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 11 -15)
"cameras/drone/drone0" SET Transform localScale (0.8574094659425211 0.8574094659425211 0.8574094659425211)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -3 15)
"cameras/drone/drone1" SET Transform localScale (1.2801604826783644 1.2801604826783644 1.2801604826783644)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.33089393395983 0)
"cameras" SET Transform eulerAngles (-4.365252793289454 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48022106670636633
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1498765220157705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09629711671952013
"cameras/drone/drone0" SET Transform localPosition (-0.43541875796760376 0.3505970359416702 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3867378125486838 0.8406666471388182 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 16 -14)
"cameras/drone/drone0" SET Transform localScale (0.7451455690975952 0.7451455690975952 0.7451455690975952)
"cameras/drone/drone1" SET Transform localEulerAngles (11 8 -8)
"cameras/drone/drone1" SET Transform localScale (0.8197640607483756 0.8197640607483756 0.8197640607483756)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.597875426098006 0)
"cameras" SET Transform eulerAngles (16.986258028747613 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.004673323936598
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.872221560351984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.013836608569190023
"cameras/drone/drone0" SET Transform localPosition (0.2173486342634816 0.6610899044267262 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5006280335996207 1.128001914542134 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 0 9)
"cameras/drone/drone0" SET Transform localScale (1.3462025451934279 1.3462025451934279 1.3462025451934279)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -18 -8)
"cameras/drone/drone1" SET Transform localScale (1.187215949618438 1.187215949618438 1.187215949618438)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.579214386712179 0)
"cameras" SET Transform eulerAngles (-12.287877566505054 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49992409938905724
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9807456705551787
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17372021353561956
"cameras/drone/drone0" SET Transform localPosition (0.03872847791706979 0.4945692426066532 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.10463393092590034 1.0066408105342055 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -11 6)
"cameras/drone/drone0" SET Transform localScale (0.8365287264236875 0.8365287264236875 0.8365287264236875)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -20 17)
"cameras/drone/drone1" SET Transform localScale (1.2046234649189174 1.2046234649189174 1.2046234649189174)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.837927315172285 0)
"cameras" SET Transform eulerAngles (-2.7554319479256506 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4817210223599797
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.880466459110997
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27928165121429677
"cameras/drone/drone0" SET Transform localPosition (0.382848638721242 0.06563216627275986 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23583443936789705 1.0161440070195487 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -15 -14)
"cameras/drone/drone0" SET Transform localScale (0.6711686181793541 0.6711686181793541 0.6711686181793541)
"cameras/drone/drone1" SET Transform localEulerAngles (7 2 -12)
"cameras/drone/drone1" SET Transform localScale (1.2104180334235717 1.2104180334235717 1.2104180334235717)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.198330828433562 0)
"cameras" SET Transform eulerAngles (-8.473085732934962 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5116611983299332
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.972445536841815
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3199217915125896
"cameras/drone/drone0" SET Transform localPosition (-0.1775602665817888 0.4183708870007043 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0779164756866888 1.2578256175598435 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -1 9)
"cameras/drone/drone0" SET Transform localScale (0.8292082511482102 0.8292082511482102 0.8292082511482102)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -16 -14)
"cameras/drone/drone1" SET Transform localScale (1.2142261732195412 1.2142261732195412 1.2142261732195412)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.770122018791765 0)
"cameras" SET Transform eulerAngles (4.602131285174838 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.447711418063391
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1506567448031642
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18590076169126446
"cameras/drone/drone0" SET Transform localPosition (-1.106088949622879 0.3829850229694856 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.16519523595291 1.1487167478220455 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -16 11)
"cameras/drone/drone0" SET Transform localScale (0.9864059467060344 0.9864059467060344 0.9864059467060344)
"cameras/drone/drone1" SET Transform localEulerAngles (16 6 1)
"cameras/drone/drone1" SET Transform localScale (1.2935469885306432 1.2935469885306432 1.2935469885306432)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0847517330218395 0)
"cameras" SET Transform eulerAngles (-9.28031303317184 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3568056176839476
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7995235579565738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3935426013765029
"cameras/drone/drone0" SET Transform localPosition (0.952543401939973 0.6302481060605574 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6430260629809121 1.211573570024518 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 20 18)
"cameras/drone/drone0" SET Transform localScale (1.022543949143497 1.022543949143497 1.022543949143497)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 6 7)
"cameras/drone/drone1" SET Transform localScale (1.4823922222885704 1.4823922222885704 1.4823922222885704)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.667305317642407 0)
"cameras" SET Transform eulerAngles (-4.1589122667994225 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0914078529246096
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6972598431301888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3648864382806791
"cameras/drone/drone0" SET Transform localPosition (-0.8357076616792847 -0.018848448383518124 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.671817063588822 0.9440920269161677 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -8 9)
"cameras/drone/drone0" SET Transform localScale (1.13430798862042 1.13430798862042 1.13430798862042)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -3 3)
"cameras/drone/drone1" SET Transform localScale (1.0278633039460858 1.0278633039460858 1.0278633039460858)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.028274798615794 0)
"cameras" SET Transform eulerAngles (-1.44080737149444 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6806805563722269
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0549776664297932
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10182253996867568
"cameras/drone/drone0" SET Transform localPosition (0.48541646839943065 0.3084063746781445 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1906797971961562 0.8824415775754221 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -13 -6)
"cameras/drone/drone0" SET Transform localScale (1.1291351005901946 1.1291351005901946 1.1291351005901946)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -3 11)
"cameras/drone/drone1" SET Transform localScale (0.6385275065794571 0.6385275065794571 0.6385275065794571)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.697073978127099 0)
"cameras" SET Transform eulerAngles (7.080786932941045 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5060319117993757
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7642923623469542
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.204746024693615
"cameras/drone/drone0" SET Transform localPosition (0.150384685977637 0.3075203924217504 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1121459431453367 1.2132550441045462 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 14 0)
"cameras/drone/drone0" SET Transform localScale (1.294384404661585 1.294384404661585 1.294384404661585)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 9 -10)
"cameras/drone/drone1" SET Transform localScale (1.4491267826170713 1.4491267826170713 1.4491267826170713)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3572510157990982 0)
"cameras" SET Transform eulerAngles (7.82689424960526 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9094480915308304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1784329428795262
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.013440117951899434
"cameras/drone/drone0" SET Transform localPosition (-1.1840727791229877 -0.1538429608678274 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1442908239276173 1.0301313146400444 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 1 -10)
"cameras/drone/drone0" SET Transform localScale (1.4552605698718 1.4552605698718 1.4552605698718)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -3 -2)
"cameras/drone/drone1" SET Transform localScale (1.1760405703161738 1.1760405703161738 1.1760405703161738)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.044221788883444 0)
"cameras" SET Transform eulerAngles (-0.4526000575385325 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5007072851145224
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0211642238675067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04534162974780882
"cameras/drone/drone0" SET Transform localPosition (0.22277419769904383 0.03623587266976552 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.03790239761508518 1.0267236048245312 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -16 9)
"cameras/drone/drone0" SET Transform localScale (0.8867674064519127 0.8867674064519127 0.8867674064519127)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -10 15)
"cameras/drone/drone1" SET Transform localScale (0.8930171197676773 0.8930171197676773 0.8930171197676773)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2193084391988327 0)
"cameras" SET Transform eulerAngles (-2.692749383194659 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42885487089680907
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3098449901482752
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17912023528858423
"cameras/drone/drone0" SET Transform localPosition (-0.8604540579285771 0.3330887259684337 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6130643967760702 1.0391144483507482 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 15 17)
"cameras/drone/drone0" SET Transform localScale (0.762397797015597 0.762397797015597 0.762397797015597)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -5 -9)
"cameras/drone/drone1" SET Transform localScale (1.4813152556484863 1.4813152556484863 1.4813152556484863)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.386964633665743 0)
"cameras" SET Transform eulerAngles (-2.2529267727897384 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.371055436279733
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7320156654100234
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37384073859232997
"cameras/drone/drone0" SET Transform localPosition (-0.8311774735676716 -0.025928945304024398 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.14588595555595 1.281397784214889 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 10 -5)
"cameras/drone/drone0" SET Transform localScale (0.9827933771111874 0.9827933771111874 0.9827933771111874)
"cameras/drone/drone1" SET Transform localEulerAngles (20 14 -2)
"cameras/drone/drone1" SET Transform localScale (1.3623766246569198 1.3623766246569198 1.3623766246569198)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9142783831151178 0)
"cameras" SET Transform eulerAngles (6.013352121540034 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9455241925511036
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.056519649316232
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1189685558915218
"cameras/drone/drone0" SET Transform localPosition (0.19480093621132166 0.6866775368662394 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9556515399500876 1.2896462602340109 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 18 -10)
"cameras/drone/drone0" SET Transform localScale (1.4386757328868491 1.4386757328868491 1.4386757328868491)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 15 -12)
"cameras/drone/drone1" SET Transform localScale (0.8582078003123046 0.8582078003123046 0.8582078003123046)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.001243580418866 0)
"cameras" SET Transform eulerAngles (0.9175033939150055 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41270612466939094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.807872628315156
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09084008234099246
"cameras/drone/drone0" SET Transform localPosition (-0.2963115208660838 -0.0786399304292617 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6274345084247246 1.1527438395816803 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 15 -7)
"cameras/drone/drone0" SET Transform localScale (0.9853866275540136 0.9853866275540136 0.9853866275540136)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 6 -17)
"cameras/drone/drone1" SET Transform localScale (1.1092446883611764 1.1092446883611764 1.1092446883611764)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.568055987925531 0)
"cameras" SET Transform eulerAngles (-6.451520859460285 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.083255740814494
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4846097356593448
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2592668927195953
"cameras/drone/drone0" SET Transform localPosition (-0.6180958139002745 0.259500244377377 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5924391040642689 1.1333419757953842 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -14 -16)
"cameras/drone/drone0" SET Transform localScale (1.1261147769661752 1.1261147769661752 1.1261147769661752)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -4 -10)
"cameras/drone/drone1" SET Transform localScale (0.6747947182774794 0.6747947182774794 0.6747947182774794)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.208621024591248 0)
"cameras" SET Transform eulerAngles (-7.020958792726365 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.613817126267213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.394444872979403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13311153728098643
"cameras/drone/drone0" SET Transform localPosition (0.3163676971916167 -0.14437823022970347 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9023050876382034 1.2147250420732314 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 2 14)
"cameras/drone/drone0" SET Transform localScale (1.351372799875779 1.351372799875779 1.351372799875779)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -15 18)
"cameras/drone/drone1" SET Transform localScale (1.0816614065787749 1.0816614065787749 1.0816614065787749)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9113218580657816 0)
"cameras" SET Transform eulerAngles (5.564423807226348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2753708331253546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1692449835071184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3451896756290269
"cameras/drone/drone0" SET Transform localPosition (-1.1898180902684479 0.3022452846064348 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.014938987836681239 0.8898564938929168 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 10 -14)
"cameras/drone/drone0" SET Transform localScale (1.3486651226864876 1.3486651226864876 1.3486651226864876)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 11 7)
"cameras/drone/drone1" SET Transform localScale (0.8661773143955172 0.8661773143955172 0.8661773143955172)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.249545998793525 0)
"cameras" SET Transform eulerAngles (-16.443773298306613 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0989953187204304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1486496876246766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2965224155496068
"cameras/drone/drone0" SET Transform localPosition (-0.33287864056223027 0.1999120424824921 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.016086829454234 1.0077462499275727 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -3 -1)
"cameras/drone/drone0" SET Transform localScale (0.9195974269470721 0.9195974269470721 0.9195974269470721)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -13 18)
"cameras/drone/drone1" SET Transform localScale (0.7356895087460725 0.7356895087460725 0.7356895087460725)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4101425199359365 0)
"cameras" SET Transform eulerAngles (2.1631621083571844 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6112857757724022
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7444665823632681
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2632609596660797
"cameras/drone/drone0" SET Transform localPosition (0.29265571053703154 0.35116343025129854 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3007394600547446 0.8098488703994688 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -15 11)
"cameras/drone/drone0" SET Transform localScale (0.8487212204291961 0.8487212204291961 0.8487212204291961)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -13 -1)
"cameras/drone/drone1" SET Transform localScale (1.349133439180262 1.349133439180262 1.349133439180262)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.270449339285882 0)
"cameras" SET Transform eulerAngles (10.593897005474936 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49400710651139945
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3779351084167992
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15241598554496025
"cameras/drone/drone0" SET Transform localPosition (-0.29658645552511764 0.3051252026216135 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32178029696499455 0.8050259764405603 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -16 16)
"cameras/drone/drone0" SET Transform localScale (1.1678701842107853 1.1678701842107853 1.1678701842107853)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -20 15)
"cameras/drone/drone1" SET Transform localScale (1.342429631367916 1.342429631367916 1.342429631367916)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0570459190566246 0)
"cameras" SET Transform eulerAngles (-0.8783470882813162 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3125006339449032
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2707921629083305
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34617314716847764
"cameras/drone/drone0" SET Transform localPosition (0.6487577002993417 0.15515107146212564 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9646989933949651 1.1533776721360616 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -14 -9)
"cameras/drone/drone0" SET Transform localScale (1.0700701244422395 1.0700701244422395 1.0700701244422395)
"cameras/drone/drone1" SET Transform localEulerAngles (8 5 -13)
"cameras/drone/drone1" SET Transform localScale (1.0281967868578445 1.0281967868578445 1.0281967868578445)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.555103789924059 0)
"cameras" SET Transform eulerAngles (-1.2800667995093278 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4345075031133859
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3940586404059614
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10411828503458241
"cameras/drone/drone0" SET Transform localPosition (0.3730055849488756 0.49350428722801626 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6269048418083394 0.8037833021180711 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 11 -19)
"cameras/drone/drone0" SET Transform localScale (1.1449770786145275 1.1449770786145275 1.1449770786145275)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -11 2)
"cameras/drone/drone1" SET Transform localScale (1.380727248081901 1.380727248081901 1.380727248081901)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.949256959096642 0)
"cameras" SET Transform eulerAngles (2.483484610249075 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6070904540901882
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0255261060675687
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27644145858800967
"cameras/drone/drone0" SET Transform localPosition (-0.8758367250590704 0.33289940419809533 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.133822587548497 0.8604243271557104 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -9 7)
"cameras/drone/drone0" SET Transform localScale (1.0762456055345648 1.0762456055345648 1.0762456055345648)
"cameras/drone/drone1" SET Transform localEulerAngles (8 5 15)
"cameras/drone/drone1" SET Transform localScale (0.9820986209572802 0.9820986209572802 0.9820986209572802)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.176960102961947 0)
"cameras" SET Transform eulerAngles (-1.2561352218992567 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7654531155688018
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9118367369265927
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15712424878526196
"cameras/drone/drone0" SET Transform localPosition (-0.46516759416497755 0.27621617744907484 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6135909753477861 0.8385837654377568 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 6 -17)
"cameras/drone/drone0" SET Transform localScale (1.128739150392776 1.128739150392776 1.128739150392776)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -7 0)
"cameras/drone/drone1" SET Transform localScale (0.7510225687339422 0.7510225687339422 0.7510225687339422)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.01508684081892 0)
"cameras" SET Transform eulerAngles (6.576610552438517 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3238129880718623
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5377941285967096
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.053745274229712696
"cameras/drone/drone0" SET Transform localPosition (-0.4261069551080219 -0.28841801164681263 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0767923553637773 1.0116660925007253 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -10 9)
"cameras/drone/drone0" SET Transform localScale (1.4809934463985863 1.4809934463985863 1.4809934463985863)
"cameras/drone/drone1" SET Transform localEulerAngles (3 11 -7)
"cameras/drone/drone1" SET Transform localScale (0.7894794802445801 0.7894794802445801 0.7894794802445801)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.270882924892424 0)
"cameras" SET Transform eulerAngles (0.46552248017484743 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.219848726205776
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.810152356416731
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3359861201842296
"cameras/drone/drone0" SET Transform localPosition (0.6643791437495488 0.4485891882821292 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3130799351953164 1.252397901991554 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -7 1)
"cameras/drone/drone0" SET Transform localScale (0.9996412727381905 0.9996412727381905 0.9996412727381905)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -6 9)
"cameras/drone/drone1" SET Transform localScale (0.6671029829482009 0.6671029829482009 0.6671029829482009)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.422153514855426 0)
"cameras" SET Transform eulerAngles (6.449397055340157 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4023838495725385
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7897505335342232
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09697554413766869
"cameras/drone/drone0" SET Transform localPosition (0.14275548842831354 0.10812994904332002 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6052909335040818 0.8797969577219824 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 13 -4)
"cameras/drone/drone0" SET Transform localScale (1.21761435301457 1.21761435301457 1.21761435301457)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -5 12)
"cameras/drone/drone1" SET Transform localScale (1.1545022417451989 1.1545022417451989 1.1545022417451989)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.926550153796182 0)
"cameras" SET Transform eulerAngles (-6.001817234938628 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8559520713249809
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9776136717743731
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3914471063648428
"cameras/drone/drone0" SET Transform localPosition (-0.9016966924799179 0.397817984521914 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3589996145949246 1.257381172976567 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -14 -13)
"cameras/drone/drone0" SET Transform localScale (1.3896767156413903 1.3896767156413903 1.3896767156413903)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -3 -20)
"cameras/drone/drone1" SET Transform localScale (0.8242882347969114 0.8242882347969114 0.8242882347969114)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.507153427623793 0)
"cameras" SET Transform eulerAngles (-9.1646791788585 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3124718291075301
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4409888446212444
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.003509047481514616
"cameras/drone/drone0" SET Transform localPosition (0.39803719078892597 0.5395095469999878 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10874742269646287 1.274657815022997 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -9 0)
"cameras/drone/drone0" SET Transform localScale (0.7357018837392433 0.7357018837392433 0.7357018837392433)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -14 -17)
"cameras/drone/drone1" SET Transform localScale (0.7250116587333817 0.7250116587333817 0.7250116587333817)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.930557383679858 0)
"cameras" SET Transform eulerAngles (-5.2238281338904144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.433347106771902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5506528950333696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32617455378009425
"cameras/drone/drone0" SET Transform localPosition (0.5804751994096948 -0.27968846533235686 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.002495367225595846 0.9816372257850847 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -5 6)
"cameras/drone/drone0" SET Transform localScale (0.6317805734880731 0.6317805734880731 0.6317805734880731)
"cameras/drone/drone1" SET Transform localEulerAngles (18 16 13)
"cameras/drone/drone1" SET Transform localScale (1.4350528848827684 1.4350528848827684 1.4350528848827684)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.979958217434652 0)
"cameras" SET Transform eulerAngles (3.917908280402088 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42080863387711553
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1445192295974023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27683067710437065
"cameras/drone/drone0" SET Transform localPosition (0.42465038788147247 0.4688238765318454 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4334636643635541 1.2680824900252237 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 8 -14)
"cameras/drone/drone0" SET Transform localScale (1.4649303485257943 1.4649303485257943 1.4649303485257943)
"cameras/drone/drone1" SET Transform localEulerAngles (15 17 -11)
"cameras/drone/drone1" SET Transform localScale (0.9190651314406648 0.9190651314406648 0.9190651314406648)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.61124501259626 0)
"cameras" SET Transform eulerAngles (16.359978334477503 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0826383053265896
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4434118492779837
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2797315345626733
"cameras/drone/drone0" SET Transform localPosition (-0.65698802968832 -0.12010703404026696 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.03063237337884539 1.2682616710629322 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 7 1)
"cameras/drone/drone0" SET Transform localScale (1.306633659194292 1.306633659194292 1.306633659194292)
"cameras/drone/drone1" SET Transform localEulerAngles (15 14 9)
"cameras/drone/drone1" SET Transform localScale (1.1609329209677186 1.1609329209677186 1.1609329209677186)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3602105018064137 0)
"cameras" SET Transform eulerAngles (3.7858768597979235 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7820405180008105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9723233494437898
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05460964081462079
"cameras/drone/drone0" SET Transform localPosition (0.5301848495410098 0.04295315725865506 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7915407971312671 1.14094084757277 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 5 -3)
"cameras/drone/drone0" SET Transform localScale (1.0295324321561465 1.0295324321561465 1.0295324321561465)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 15 -12)
"cameras/drone/drone1" SET Transform localScale (1.1262832963175131 1.1262832963175131 1.1262832963175131)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.410033297205043 0)
"cameras" SET Transform eulerAngles (-15.448299581857157 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1421240403656157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9956855736689143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3058028924969457
"cameras/drone/drone0" SET Transform localPosition (1.1746769088489517 -0.24853018570493973 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.851093082998817 0.8164183746599254 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 19 -10)
"cameras/drone/drone0" SET Transform localScale (1.4327707828649467 1.4327707828649467 1.4327707828649467)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -8 -5)
"cameras/drone/drone1" SET Transform localScale (0.8012911916120622 0.8012911916120622 0.8012911916120622)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6860934825078795 0)
"cameras" SET Transform eulerAngles (-9.489503901475107 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6536336172811693
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7545197505416086
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38106216321409225
"cameras/drone/drone0" SET Transform localPosition (1.1717810642536504 0.1622943506658338 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6499454123241309 1.2902758948817759 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -3 -19)
"cameras/drone/drone0" SET Transform localScale (0.8359911593960161 0.8359911593960161 0.8359911593960161)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -9 -19)
"cameras/drone/drone1" SET Transform localScale (1.3260673952342712 1.3260673952342712 1.3260673952342712)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.368014702010652 0)
"cameras" SET Transform eulerAngles (-6.659369000927287 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5327704459399796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7416524501040094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21468275878227777
"cameras/drone/drone0" SET Transform localPosition (0.13448243795591264 -0.266881278653372 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9641395827142951 1.0148937270503928 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -8 -18)
"cameras/drone/drone0" SET Transform localScale (1.3860739095731787 1.3860739095731787 1.3860739095731787)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -19 19)
"cameras/drone/drone1" SET Transform localScale (0.6227062394219167 0.6227062394219167 0.6227062394219167)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.562585031661295 0)
"cameras" SET Transform eulerAngles (-18.974988574901307 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3069091918804427
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4705668685845001
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.023061187129178908
"cameras/drone/drone0" SET Transform localPosition (-0.8707704104000644 0.29111673532213317 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.03780880299553 0.9115346195402094 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 15 16)
"cameras/drone/drone0" SET Transform localScale (0.9883105803608856 0.9883105803608856 0.9883105803608856)
"cameras/drone/drone1" SET Transform localEulerAngles (8 10 18)
"cameras/drone/drone1" SET Transform localScale (0.7544755355682213 0.7544755355682213 0.7544755355682213)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.453495588261619 0)
"cameras" SET Transform eulerAngles (-13.094095425457892 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5145780064447143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3781248973316975
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11370231177358794
"cameras/drone/drone0" SET Transform localPosition (-0.5840307199186331 -0.2835622594616262 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9247189683612045 1.1517253447635274 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -1 2)
"cameras/drone/drone0" SET Transform localScale (1.043142393380236 1.043142393380236 1.043142393380236)
"cameras/drone/drone1" SET Transform localEulerAngles (4 14 -8)
"cameras/drone/drone1" SET Transform localScale (0.655300786135312 0.655300786135312 0.655300786135312)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.791036380397394 0)
"cameras" SET Transform eulerAngles (0.6664639962709558 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8514684661338215
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1827070091890186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.015556276356867871
"cameras/drone/drone0" SET Transform localPosition (0.7125201696055985 -0.01798989282328506 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.46663247464355007 1.0382445518390262 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -3 14)
"cameras/drone/drone0" SET Transform localScale (1.0342127065832771 1.0342127065832771 1.0342127065832771)
"cameras/drone/drone1" SET Transform localEulerAngles (6 8 8)
"cameras/drone/drone1" SET Transform localScale (1.0580674333194886 1.0580674333194886 1.0580674333194886)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.636406976121844 0)
"cameras" SET Transform eulerAngles (12.513650430327765 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6033825944484617
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3992535875572487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08967974658730245
"cameras/drone/drone0" SET Transform localPosition (0.5394927877807563 0.503947062974766 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11568427957753835 1.09696680018701 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -9 0)
"cameras/drone/drone0" SET Transform localScale (1.0456904519690278 1.0456904519690278 1.0456904519690278)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 5 16)
"cameras/drone/drone1" SET Transform localScale (0.6417669331285224 0.6417669331285224 0.6417669331285224)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4592393597541142 0)
"cameras" SET Transform eulerAngles (5.676496137416617 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3668162666208081
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3904051862987687
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08122983102155873
"cameras/drone/drone0" SET Transform localPosition (0.13909503509498977 0.038259360666737796 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0903704064095192 1.0816236213212977 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 18 -17)
"cameras/drone/drone0" SET Transform localScale (1.3829291646997226 1.3829291646997226 1.3829291646997226)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -8 19)
"cameras/drone/drone1" SET Transform localScale (1.154647008363365 1.154647008363365 1.154647008363365)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.675068979871093 0)
"cameras" SET Transform eulerAngles (-18.09233045110456 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5879234859044965
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7235807069841853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.028011863521473314
"cameras/drone/drone0" SET Transform localPosition (1.0161738195712091 0.11114148025237719 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5323003507428874 0.9459609110939202 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -7 -14)
"cameras/drone/drone0" SET Transform localScale (0.7995199296964708 0.7995199296964708 0.7995199296964708)
"cameras/drone/drone1" SET Transform localEulerAngles (16 4 -12)
"cameras/drone/drone1" SET Transform localScale (0.6644641614023371 0.6644641614023371 0.6644641614023371)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7475639922397814 0)
"cameras" SET Transform eulerAngles (-19.11212818410984 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5636449769536402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8939320608255328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34162426460421935
"cameras/drone/drone0" SET Transform localPosition (-0.7567515938828753 0.407918293109406 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.103427974750683 1.1816917341392723 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -15 12)
"cameras/drone/drone0" SET Transform localScale (0.8055710372989995 0.8055710372989995 0.8055710372989995)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 17 7)
"cameras/drone/drone1" SET Transform localScale (1.3152237662059294 1.3152237662059294 1.3152237662059294)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.705614903770938 0)
"cameras" SET Transform eulerAngles (-6.923363740179283 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.460585651845061
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3638707776388523
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28287122250902547
"cameras/drone/drone0" SET Transform localPosition (1.0456820792371244 -0.06410289813870057 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28262516788975733 1.07285700833126 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -18 2)
"cameras/drone/drone0" SET Transform localScale (0.6837519243850132 0.6837519243850132 0.6837519243850132)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -20 -11)
"cameras/drone/drone1" SET Transform localScale (0.8188759987356855 0.8188759987356855 0.8188759987356855)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.659009563959268 0)
"cameras" SET Transform eulerAngles (-18.448966271100062 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9026753237215018
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4936730745961024
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30050467438832623
"cameras/drone/drone0" SET Transform localPosition (0.12652200204432074 0.08098886270782185 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.205503823551068 1.005400970581447 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 20 -17)
"cameras/drone/drone0" SET Transform localScale (1.4915879672889398 1.4915879672889398 1.4915879672889398)
"cameras/drone/drone1" SET Transform localEulerAngles (14 11 3)
"cameras/drone/drone1" SET Transform localScale (1.3168209424643877 1.3168209424643877 1.3168209424643877)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.105936550827348 0)
"cameras" SET Transform eulerAngles (-7.686081927981384 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5101428832349062
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.854968755597039
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2349342637304738
"cameras/drone/drone0" SET Transform localPosition (-0.45709733991151835 0.5864318537752471 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7827476617770022 1.089126006005174 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 16 -17)
"cameras/drone/drone0" SET Transform localScale (0.9570896753556577 0.9570896753556577 0.9570896753556577)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 15 4)
"cameras/drone/drone1" SET Transform localScale (1.0645707850328117 1.0645707850328117 1.0645707850328117)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.490069038841236 0)
"cameras" SET Transform eulerAngles (-13.239284718329941 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42162072086337476
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3608086574439828
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12158826876001308
"cameras/drone/drone0" SET Transform localPosition (0.19574818101963598 0.06699800611808576 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0730062892245325 1.179448381723051 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -13 19)
"cameras/drone/drone0" SET Transform localScale (1.0105133520578375 1.0105133520578375 1.0105133520578375)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 20 4)
"cameras/drone/drone1" SET Transform localScale (1.0973293780376743 1.0973293780376743 1.0973293780376743)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.888228686123811 0)
"cameras" SET Transform eulerAngles (-14.876916658645856 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0481141503758766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6279117088428565
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17600737845101513
"cameras/drone/drone0" SET Transform localPosition (-0.08720145811958435 0.14796292066483213 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0330320754227145 1.0621750946911104 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -19 7)
"cameras/drone/drone0" SET Transform localScale (1.3677923702854864 1.3677923702854864 1.3677923702854864)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -8 10)
"cameras/drone/drone1" SET Transform localScale (1.16989944112273 1.16989944112273 1.16989944112273)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.264631919869187 0)
"cameras" SET Transform eulerAngles (-16.631587290680482 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2213780321815761
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6892919331522724
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28366491410823275
"cameras/drone/drone0" SET Transform localPosition (1.1308944485913857 -0.16712126514562703 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9799632926623805 1.2854428999764758 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -11 -4)
"cameras/drone/drone0" SET Transform localScale (0.9931806465927102 0.9931806465927102 0.9931806465927102)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -11 1)
"cameras/drone/drone1" SET Transform localScale (0.8174557016175392 0.8174557016175392 0.8174557016175392)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5557718681734736 0)
"cameras" SET Transform eulerAngles (-1.7587417894410464 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5145293697793845
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9327565131441463
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1125114008852512
"cameras/drone/drone0" SET Transform localPosition (0.8808783427592564 -0.293667062587948 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5996240789090155 0.9818092712305977 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -1 14)
"cameras/drone/drone0" SET Transform localScale (0.7507784464893829 0.7507784464893829 0.7507784464893829)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -14 15)
"cameras/drone/drone1" SET Transform localScale (0.7591712494585199 0.7591712494585199 0.7591712494585199)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.49284801216691 0)
"cameras" SET Transform eulerAngles (-12.926906942048642 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.427333021795878
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8644237985211838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39049217816586873
"cameras/drone/drone0" SET Transform localPosition (0.3466281588143889 0.5401043271953132 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7980736658198635 1.2565933073437017 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 16 7)
"cameras/drone/drone0" SET Transform localScale (1.3622658379393056 1.3622658379393056 1.3622658379393056)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -13 -16)
"cameras/drone/drone1" SET Transform localScale (0.9950150263236165 0.9950150263236165 0.9950150263236165)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1223966748635625 0)
"cameras" SET Transform eulerAngles (13.38551303892072 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1344080759477004
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.980595933518849
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2865077972858715
"cameras/drone/drone0" SET Transform localPosition (-1.157588908848308 0.672710474479389 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.028843992806745877 1.2227580485175322 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -11 6)
"cameras/drone/drone0" SET Transform localScale (0.6646167322832758 0.6646167322832758 0.6646167322832758)
"cameras/drone/drone1" SET Transform localEulerAngles (10 0 -17)
"cameras/drone/drone1" SET Transform localScale (1.1652975046946086 1.1652975046946086 1.1652975046946086)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.107888506183956 0)
"cameras" SET Transform eulerAngles (3.869609290410942 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8686025571303531
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7306817711793865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33073333804993155
"cameras/drone/drone0" SET Transform localPosition (0.05877770074347577 0.6619453970067981 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5032205660372875 1.2777070229582317 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -4 3)
"cameras/drone/drone0" SET Transform localScale (0.7633954251989945 0.7633954251989945 0.7633954251989945)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -19 12)
"cameras/drone/drone1" SET Transform localScale (1.01666234094914 1.01666234094914 1.01666234094914)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.736885131204902 0)
"cameras" SET Transform eulerAngles (-1.695494002411916 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4507304361584827
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9313869638668448
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18295718098039077
"cameras/drone/drone0" SET Transform localPosition (-1.081508129807075 0.3236737815821629 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9528444139478529 0.904013875983745 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -15 14)
"cameras/drone/drone0" SET Transform localScale (1.438974046841208 1.438974046841208 1.438974046841208)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -19 -3)
"cameras/drone/drone1" SET Transform localScale (1.466840814515733 1.466840814515733 1.466840814515733)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.075103462944381 0)
"cameras" SET Transform eulerAngles (18.473605601364206 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8318479538494007
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9008054880071468
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22226548601581197
"cameras/drone/drone0" SET Transform localPosition (0.3972926882154715 0.2960557569729217 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.35981095735564295 0.9705653370924301 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -11 17)
"cameras/drone/drone0" SET Transform localScale (1.3388077141218946 1.3388077141218946 1.3388077141218946)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -14 16)
"cameras/drone/drone1" SET Transform localScale (1.4257977403066593 1.4257977403066593 1.4257977403066593)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9746016141647313 0)
"cameras" SET Transform eulerAngles (-5.260253789569219 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5999838755200374
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3282448915347767
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06216857937534699
"cameras/drone/drone0" SET Transform localPosition (-0.24567147455013727 -0.10375457837476093 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1365713412030523 0.8426035082128112 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 17 19)
"cameras/drone/drone0" SET Transform localScale (1.1287579986126703 1.1287579986126703 1.1287579986126703)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -12 15)
"cameras/drone/drone1" SET Transform localScale (0.8973947356632233 0.8973947356632233 0.8973947356632233)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
