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
"cameras/segmentation" SET active true
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1536 1152 24 "ARGB32" "Default"
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB" "cameras/cameraRGB"
"EnviroSky" SET active true
"cameras/cameraRGB" SET active true
[UI.Window] ShowFromCamera "cameras/cameraRGB" AS "cameraRGB" WITH 1536 1152 24 "ARGB32" "Default"
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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 175 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 37 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 81 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 45 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-15.84852294112109 0 0)
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
"cameras" SET Transform position (0 4.262255068706088 0)
"cameras" SET Transform eulerAngles (-17.210496034332976 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6875812971442725
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5358678493510434
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.141900886240901
"cameras/drone/drone0" SET Transform localPosition (0.2734701803215378 -0.21247405574351136 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.10590260607553015 1.2510107730835807 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -10 6)
"cameras/drone/drone0" SET Transform localScale (1.088135651055186 1.088135651055186 1.088135651055186)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -1 2)
"cameras/drone/drone1" SET Transform localScale (1.210044255654799 1.210044255654799 1.210044255654799)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8225429452239 0)
"cameras" SET Transform eulerAngles (-3.113921815116054 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.900800324924214
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0790532209832921
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.022376904127721576
"cameras/drone/drone0" SET Transform localPosition (-0.5907533863119182 -0.09347879029378409 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.601160703206084 1.2370659781224818 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 4 -13)
"cameras/drone/drone0" SET Transform localScale (0.8989571959011793 0.8989571959011793 0.8989571959011793)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -6 9)
"cameras/drone/drone1" SET Transform localScale (0.9764273080461735 0.9764273080461735 0.9764273080461735)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.266889593855607 0)
"cameras" SET Transform eulerAngles (-6.014867101783526 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2270884617229256
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9576239503966362
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22419172513947905
"cameras/drone/drone0" SET Transform localPosition (0.9082257736595298 0.4706663455465458 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.22501010896789053 1.1983549858193547 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -1 -16)
"cameras/drone/drone0" SET Transform localScale (1.4703781637960582 1.4703781637960582 1.4703781637960582)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -10 2)
"cameras/drone/drone1" SET Transform localScale (1.222641162523106 1.222641162523106 1.222641162523106)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.097808924147447 0)
"cameras" SET Transform eulerAngles (14.065192057497697 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8711914789389978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0144522431473968
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2558219394263582
"cameras/drone/drone0" SET Transform localPosition (-0.7495416046280754 0.3621268677827347 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8035655394295709 1.0823047607024916 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 19 -4)
"cameras/drone/drone0" SET Transform localScale (1.2804017323722934 1.2804017323722934 1.2804017323722934)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -9 -5)
"cameras/drone/drone1" SET Transform localScale (0.9239689402679273 0.9239689402679273 0.9239689402679273)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8338125170041355 0)
"cameras" SET Transform eulerAngles (12.492471376176503 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1731125843982366
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0838366166130329
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08258056188940902
"cameras/drone/drone0" SET Transform localPosition (-1.0015566970363565 0.14285132435122122 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4148892832557083 0.8937336026176644 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -16 -3)
"cameras/drone/drone0" SET Transform localScale (1.164206240999558 1.164206240999558 1.164206240999558)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 10 -20)
"cameras/drone/drone1" SET Transform localScale (1.0806980253094276 1.0806980253094276 1.0806980253094276)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3322814908033807 0)
"cameras" SET Transform eulerAngles (-5.129273411200167 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7690489632011437
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0403490456913091
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3090214039018912
"cameras/drone/drone0" SET Transform localPosition (0.03879786905803995 0.08532317187525068 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.30597594501585423 1.1510847642886026 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -4 -2)
"cameras/drone/drone0" SET Transform localScale (0.96711864426303 0.96711864426303 0.96711864426303)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 14 11)
"cameras/drone/drone1" SET Transform localScale (1.1556256850258722 1.1556256850258722 1.1556256850258722)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.273881347673974 0)
"cameras" SET Transform eulerAngles (19.425742037968654 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8264113112888019
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.205529792153789
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3187634306301288
"cameras/drone/drone0" SET Transform localPosition (0.040913822387669496 0.36649476459530345 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8139458623402416 0.906467323373968 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 15 -3)
"cameras/drone/drone0" SET Transform localScale (0.6731558658088378 0.6731558658088378 0.6731558658088378)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -16 6)
"cameras/drone/drone1" SET Transform localScale (1.0323429093921115 1.0323429093921115 1.0323429093921115)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0450127081045477 0)
"cameras" SET Transform eulerAngles (-17.183889020264314 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9393306477264209
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.434333539290302
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37003596673803085
"cameras/drone/drone0" SET Transform localPosition (-0.9005322725161043 -0.18888063141511374 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1244483540678238 1.2840647688912914 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -8 0)
"cameras/drone/drone0" SET Transform localScale (0.7495928901932833 0.7495928901932833 0.7495928901932833)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -8 -19)
"cameras/drone/drone1" SET Transform localScale (1.187436833482086 1.187436833482086 1.187436833482086)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.350562882792935 0)
"cameras" SET Transform eulerAngles (9.17321062233535 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.311300234871988
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.754221509309681
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3657100819963364
"cameras/drone/drone0" SET Transform localPosition (0.9935585181963551 0.22620875249262823 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7356022952648027 0.8580290681723703 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -8 -15)
"cameras/drone/drone0" SET Transform localScale (1.3204932278301587 1.3204932278301587 1.3204932278301587)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -5 10)
"cameras/drone/drone1" SET Transform localScale (1.150150859414079 1.150150859414079 1.150150859414079)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9487022014536404 0)
"cameras" SET Transform eulerAngles (-15.014957061660139 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5210229447039287
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.001239321729744
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35013036474627135
"cameras/drone/drone0" SET Transform localPosition (0.8111957020877443 -0.023236368468449953 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9896194812671578 0.9649532831647063 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -1 -5)
"cameras/drone/drone0" SET Transform localScale (0.8742874361949102 0.8742874361949102 0.8742874361949102)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -4 13)
"cameras/drone/drone1" SET Transform localScale (0.6690968202893619 0.6690968202893619 0.6690968202893619)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.480050888035817 0)
"cameras" SET Transform eulerAngles (-17.894574838380617 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8533709730414181
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.815650420484732
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3996336976531431
"cameras/drone/drone0" SET Transform localPosition (1.0297503637096381 0.17308024105449787 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.26123488985606635 1.285045349369192 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 15 -14)
"cameras/drone/drone0" SET Transform localScale (1.3452855669679398 1.3452855669679398 1.3452855669679398)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -7 -11)
"cameras/drone/drone1" SET Transform localScale (0.6614787551905812 0.6614787551905812 0.6614787551905812)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0870760040901075 0)
"cameras" SET Transform eulerAngles (17.654999610747353 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7125714958840621
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7570203569719265
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1166023743194761
"cameras/drone/drone0" SET Transform localPosition (-0.545999348700401 0.6516348753019181 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6105292630385042 0.8611796235665226 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -16 4)
"cameras/drone/drone0" SET Transform localScale (1.1157404066529735 1.1157404066529735 1.1157404066529735)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -1 -6)
"cameras/drone/drone1" SET Transform localScale (0.8588898928314752 0.8588898928314752 0.8588898928314752)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0149546416107214 0)
"cameras" SET Transform eulerAngles (-12.690233719828083 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5486127772199048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.957069597909074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23443585735732922
"cameras/drone/drone0" SET Transform localPosition (-0.8760440740784268 -0.21977437639812208 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08595853884607929 0.986902596749589 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -15 -8)
"cameras/drone/drone0" SET Transform localScale (1.2950671566387675 1.2950671566387675 1.2950671566387675)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -17 -18)
"cameras/drone/drone1" SET Transform localScale (1.000435634576219 1.000435634576219 1.000435634576219)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.801253745322137 0)
"cameras" SET Transform eulerAngles (4.037377707553631 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6582639411261029
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.024891189069853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18721551622950858
"cameras/drone/drone0" SET Transform localPosition (0.008634526784910612 0.24454835477861653 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.61975288564237 1.20130260366194 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -11 14)
"cameras/drone/drone0" SET Transform localScale (1.0583371885679267 1.0583371885679267 1.0583371885679267)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 3 -5)
"cameras/drone/drone1" SET Transform localScale (0.9456526648592818 0.9456526648592818 0.9456526648592818)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8490224725258626 0)
"cameras" SET Transform eulerAngles (1.302556711306245 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41216367378297347
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.117934555580969
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.019968975353618038
"cameras/drone/drone0" SET Transform localPosition (-0.4168946191456012 0.31719390611231096 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9847305436715208 1.2057689617577476 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 11 17)
"cameras/drone/drone0" SET Transform localScale (1.4403170000370624 1.4403170000370624 1.4403170000370624)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 12 12)
"cameras/drone/drone1" SET Transform localScale (0.8155704840570143 0.8155704840570143 0.8155704840570143)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4423583941775404 0)
"cameras" SET Transform eulerAngles (-17.336961880151183 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4838202535182581
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3053551806624937
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2829005053747033
"cameras/drone/drone0" SET Transform localPosition (0.6282708755132715 0.09384402934494268 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6520288857098266 1.1090136246314466 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -3 3)
"cameras/drone/drone0" SET Transform localScale (1.0132902488722455 1.0132902488722455 1.0132902488722455)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 8 4)
"cameras/drone/drone1" SET Transform localScale (1.09713733527775 1.09713733527775 1.09713733527775)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.417263071978902 0)
"cameras" SET Transform eulerAngles (-19.677865331171716 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8487650183202673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7745565020470935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25594522668799913
"cameras/drone/drone0" SET Transform localPosition (-0.381157122048305 0.08443034828523827 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9541919047621628 0.8822923049269256 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 1 7)
"cameras/drone/drone0" SET Transform localScale (0.7543916622159538 0.7543916622159538 0.7543916622159538)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 2 -17)
"cameras/drone/drone1" SET Transform localScale (0.8496865944415362 0.8496865944415362 0.8496865944415362)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2909769162037605 0)
"cameras" SET Transform eulerAngles (3.9715201364254966 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3438273446671205
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.792155262228071
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14240706340996565
"cameras/drone/drone0" SET Transform localPosition (0.47948595015058926 0.3270983072936721 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.044969324220854 1.1005801946604494 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 12 18)
"cameras/drone/drone0" SET Transform localScale (1.1698803706849197 1.1698803706849197 1.1698803706849197)
"cameras/drone/drone1" SET Transform localEulerAngles (15 7 7)
"cameras/drone/drone1" SET Transform localScale (1.222061783303416 1.222061783303416 1.222061783303416)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.749416867852615 0)
"cameras" SET Transform eulerAngles (18.093737943946522 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8417750691823664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1397585494742548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3892796699273346
"cameras/drone/drone0" SET Transform localPosition (-0.10044518550642234 0.2623335800923257 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8820072186591819 1.269826146574926 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 10 3)
"cameras/drone/drone0" SET Transform localScale (1.3741828099787088 1.3741828099787088 1.3741828099787088)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -14 -4)
"cameras/drone/drone1" SET Transform localScale (1.1814552786178287 1.1814552786178287 1.1814552786178287)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.092775160509065 0)
"cameras" SET Transform eulerAngles (-15.365743081888352 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7374866495546575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9116538896925788
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20146148862293511
"cameras/drone/drone0" SET Transform localPosition (-0.36382698559042403 0.45818448427138564 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4816800722271376 0.8136303863184504 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -7 19)
"cameras/drone/drone0" SET Transform localScale (1.320204441669739 1.320204441669739 1.320204441669739)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 9 12)
"cameras/drone/drone1" SET Transform localScale (0.7469607274664409 0.7469607274664409 0.7469607274664409)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.439108421299323 0)
"cameras" SET Transform eulerAngles (18.176984186805115 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6800385896672356
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9085634769700793
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01772086758865221
"cameras/drone/drone0" SET Transform localPosition (-0.29384419169242504 -0.1866172425342451 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6105338263691018 1.0277603832342184 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -9 9)
"cameras/drone/drone0" SET Transform localScale (1.4983973320481025 1.4983973320481025 1.4983973320481025)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 2 -20)
"cameras/drone/drone1" SET Transform localScale (0.8155128873600509 0.8155128873600509 0.8155128873600509)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.347054530884704 0)
"cameras" SET Transform eulerAngles (16.122621658182254 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9509972671117619
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7800068343427011
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13555944503894432
"cameras/drone/drone0" SET Transform localPosition (0.6640264003098251 -0.18417683570675908 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1218982689449404 1.2629507666683473 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -11 -16)
"cameras/drone/drone0" SET Transform localScale (1.015433633651082 1.015433633651082 1.015433633651082)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 6 5)
"cameras/drone/drone1" SET Transform localScale (0.6549618763620243 0.6549618763620243 0.6549618763620243)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.829569255721182 0)
"cameras" SET Transform eulerAngles (16.651037047992936 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3878718832588408
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5527884057574664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11217525102543863
"cameras/drone/drone0" SET Transform localPosition (0.24939589178634103 0.08606556331799725 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9954228588334497 1.0304226612879908 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 10 -19)
"cameras/drone/drone0" SET Transform localScale (1.3823126179225067 1.3823126179225067 1.3823126179225067)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 9 -4)
"cameras/drone/drone1" SET Transform localScale (1.2583906067401653 1.2583906067401653 1.2583906067401653)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.336647291314776 0)
"cameras" SET Transform eulerAngles (-18.49040761534763 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5132182287764246
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7927611061298374
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30560764048119476
"cameras/drone/drone0" SET Transform localPosition (-0.0014920838210508158 0.3596194378329604 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40593049331396447 1.058315003019369 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -5 3)
"cameras/drone/drone0" SET Transform localScale (0.7917398508348152 0.7917398508348152 0.7917398508348152)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 1 -18)
"cameras/drone/drone1" SET Transform localScale (0.9554432160793307 0.9554432160793307 0.9554432160793307)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.117070268372096 0)
"cameras" SET Transform eulerAngles (-5.196453250206474 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.653218627741715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.686292250040336
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12361030111059526
"cameras/drone/drone0" SET Transform localPosition (0.5799067985565656 -0.21620036271477666 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7703926789148388 0.8927485732220715 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 0 12)
"cameras/drone/drone0" SET Transform localScale (1.2785118013734684 1.2785118013734684 1.2785118013734684)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -1 -19)
"cameras/drone/drone1" SET Transform localScale (0.8885022311922673 0.8885022311922673 0.8885022311922673)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.415825677947026 0)
"cameras" SET Transform eulerAngles (13.181228554663065 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7918376178250341
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9005146771406367
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1730899468673214
"cameras/drone/drone0" SET Transform localPosition (0.6564943986067495 -0.23187173381462683 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.183889255884811 0.834333351756561 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 3 -16)
"cameras/drone/drone0" SET Transform localScale (1.3076177377101785 1.3076177377101785 1.3076177377101785)
"cameras/drone/drone1" SET Transform localEulerAngles (0 5 9)
"cameras/drone/drone1" SET Transform localScale (0.697017522026683 0.697017522026683 0.697017522026683)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.60928905444323 0)
"cameras" SET Transform eulerAngles (-12.004928400736222 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8960661559559415
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3553865429746834
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3774841523802342
"cameras/drone/drone0" SET Transform localPosition (-0.6130261561067455 -0.23330930722696525 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.092923921297783 1.1384876340152636 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 2 16)
"cameras/drone/drone0" SET Transform localScale (1.1295407999474931 1.1295407999474931 1.1295407999474931)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -18 -3)
"cameras/drone/drone1" SET Transform localScale (0.7849924949295424 0.7849924949295424 0.7849924949295424)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.167310972176874 0)
"cameras" SET Transform eulerAngles (-5.141619736443253 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3267442238857048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0106539688948417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1601467080215624
"cameras/drone/drone0" SET Transform localPosition (-0.9000603320844356 0.07004235376023843 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.141191907851938 1.0996168035145568 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 16 -2)
"cameras/drone/drone0" SET Transform localScale (1.2926528091079494 1.2926528091079494 1.2926528091079494)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 18 -12)
"cameras/drone/drone1" SET Transform localScale (0.7451173601031201 0.7451173601031201 0.7451173601031201)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6931344931172365 0)
"cameras" SET Transform eulerAngles (11.052648351581922 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0189526715395298
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.30188343504151
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09922717509268889
"cameras/drone/drone0" SET Transform localPosition (0.3044757972359471 0.33400592283327063 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9341315158853611 1.1600491889409261 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 9 13)
"cameras/drone/drone0" SET Transform localScale (0.7929246073971541 0.7929246073971541 0.7929246073971541)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 3 -15)
"cameras/drone/drone1" SET Transform localScale (0.6007016104454781 0.6007016104454781 0.6007016104454781)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4581210241883804 0)
"cameras" SET Transform eulerAngles (-18.184677584482696 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.024933484145647
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5074633497730847
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19139353492908337
"cameras/drone/drone0" SET Transform localPosition (-0.25595605540217725 0.6814217743009303 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.20646866362827032 1.2916754598011573 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 12 -13)
"cameras/drone/drone0" SET Transform localScale (0.8215621575658392 0.8215621575658392 0.8215621575658392)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -7 -7)
"cameras/drone/drone1" SET Transform localScale (1.2370410588267107 1.2370410588267107 1.2370410588267107)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7120492140067767 0)
"cameras" SET Transform eulerAngles (11.242991910243617 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.569508721364087
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1216352698048495
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2383707481564435
"cameras/drone/drone0" SET Transform localPosition (-0.04701740485539152 -0.05861815432941381 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.37732031583161474 0.842632060848699 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -19 19)
"cameras/drone/drone0" SET Transform localScale (1.2143672101067866 1.2143672101067866 1.2143672101067866)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -7 15)
"cameras/drone/drone1" SET Transform localScale (0.9168339437216486 0.9168339437216486 0.9168339437216486)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.757496352724628 0)
"cameras" SET Transform eulerAngles (-3.453828700987156 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0089356299793089
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8095304861129056
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05818949144680033
"cameras/drone/drone0" SET Transform localPosition (-0.09858396911610057 0.04726654679541481 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8439448508812737 1.0428687337536262 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -15 -12)
"cameras/drone/drone0" SET Transform localScale (1.2979437664127 1.2979437664127 1.2979437664127)
"cameras/drone/drone1" SET Transform localEulerAngles (2 18 19)
"cameras/drone/drone1" SET Transform localScale (0.6796946905932069 0.6796946905932069 0.6796946905932069)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.266753862000619 0)
"cameras" SET Transform eulerAngles (-15.693562863073204 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2673228570597206
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3223899335952936
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21135679843733277
"cameras/drone/drone0" SET Transform localPosition (-0.955901215978167 0.21882350544260648 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1696954821996173 1.0167811996702307 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 4 -12)
"cameras/drone/drone0" SET Transform localScale (1.0322801354157105 1.0322801354157105 1.0322801354157105)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -12 7)
"cameras/drone/drone1" SET Transform localScale (0.8334798494544579 0.8334798494544579 0.8334798494544579)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5545595980086677 0)
"cameras" SET Transform eulerAngles (-9.595394118980805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5853900451439267
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4144932836154438
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.111951635194426
"cameras/drone/drone0" SET Transform localPosition (-0.8347551596177335 0.5207830904542443 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9359275727919514 1.2905029946638225 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 12 -20)
"cameras/drone/drone0" SET Transform localScale (1.0989401352125192 1.0989401352125192 1.0989401352125192)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -10 3)
"cameras/drone/drone1" SET Transform localScale (1.2014487084899614 1.2014487084899614 1.2014487084899614)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.243622369501262 0)
"cameras" SET Transform eulerAngles (8.968407027762481 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8398012722553232
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9088277857143816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03927864076661702
"cameras/drone/drone0" SET Transform localPosition (-0.1664229409454574 -0.10036368082360964 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2618084885202717 1.1697931640285042 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 1 17)
"cameras/drone/drone0" SET Transform localScale (1.1434303760595794 1.1434303760595794 1.1434303760595794)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 20 -6)
"cameras/drone/drone1" SET Transform localScale (1.454826958112049 1.454826958112049 1.454826958112049)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.131285935109001 0)
"cameras" SET Transform eulerAngles (-19.70270246570205 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2133595907831207
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.38287854093464
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22204639299928852
"cameras/drone/drone0" SET Transform localPosition (0.2342055361826656 0.40183111718147063 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1186816389762784 1.1699980196310127 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 1 18)
"cameras/drone/drone0" SET Transform localScale (0.7323649604377356 0.7323649604377356 0.7323649604377356)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -13 -12)
"cameras/drone/drone1" SET Transform localScale (0.7557767275448339 0.7557767275448339 0.7557767275448339)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6483924398833047 0)
"cameras" SET Transform eulerAngles (-19.437624552901035 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.065579540873593
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1521284209940275
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39856037948025685
"cameras/drone/drone0" SET Transform localPosition (-0.03383947354596928 0.6654416886879209 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.520234950643896 0.9104704103822479 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 15 -17)
"cameras/drone/drone0" SET Transform localScale (1.0466809921566878 1.0466809921566878 1.0466809921566878)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -20 0)
"cameras/drone/drone1" SET Transform localScale (1.364291549982395 1.364291549982395 1.364291549982395)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.031812561464582 0)
"cameras" SET Transform eulerAngles (0.8449683476031993 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8355407745374721
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.442172596224037
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22508781525172822
"cameras/drone/drone0" SET Transform localPosition (-0.25455276866693666 -0.047758378542271995 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1880016574946612 0.982452295943224 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -11 12)
"cameras/drone/drone0" SET Transform localScale (1.3441057670905867 1.3441057670905867 1.3441057670905867)
"cameras/drone/drone1" SET Transform localEulerAngles (11 2 13)
"cameras/drone/drone1" SET Transform localScale (1.1262251119857494 1.1262251119857494 1.1262251119857494)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9876848402937344 0)
"cameras" SET Transform eulerAngles (14.763323484642719 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8195809781098818
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4470504753054847
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23770306217080633
"cameras/drone/drone0" SET Transform localPosition (1.1230003107846713 0.3731618013591789 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0832205528721885 1.1755586601910961 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -4 -19)
"cameras/drone/drone0" SET Transform localScale (1.0878786770911644 1.0878786770911644 1.0878786770911644)
"cameras/drone/drone1" SET Transform localEulerAngles (1 18 14)
"cameras/drone/drone1" SET Transform localScale (1.0376868271378032 1.0376868271378032 1.0376868271378032)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.387465088435957 0)
"cameras" SET Transform eulerAngles (0.5808470534719348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3695023131354827
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2937584611048987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22314822186787595
"cameras/drone/drone0" SET Transform localPosition (0.13741300130813316 0.28926610494618515 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0507979740426048 0.966958441148515 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -9 10)
"cameras/drone/drone0" SET Transform localScale (0.703733522142579 0.703733522142579 0.703733522142579)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 19 -16)
"cameras/drone/drone1" SET Transform localScale (0.9644759879856483 0.9644759879856483 0.9644759879856483)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7620241796529057 0)
"cameras" SET Transform eulerAngles (-17.196704359087814 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.78596455244867
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2505066903928248
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35652773364041446
"cameras/drone/drone0" SET Transform localPosition (1.0396942222338492 0.5002903209778962 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2874043450916207 0.8534304958287182 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -3 1)
"cameras/drone/drone0" SET Transform localScale (0.8686365639877888 0.8686365639877888 0.8686365639877888)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -19 9)
"cameras/drone/drone1" SET Transform localScale (0.8053329886717684 0.8053329886717684 0.8053329886717684)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4197036919033534 0)
"cameras" SET Transform eulerAngles (-14.875687495942685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5708511878989754
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9075658486359663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.009535457133002767
"cameras/drone/drone0" SET Transform localPosition (0.024509244179860445 0.16479210634418978 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9571707004922125 1.2583820078967822 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 2 -5)
"cameras/drone/drone0" SET Transform localScale (0.9357780006365779 0.9357780006365779 0.9357780006365779)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 6 12)
"cameras/drone/drone1" SET Transform localScale (0.9333078964993407 0.9333078964993407 0.9333078964993407)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.864288339191395 0)
"cameras" SET Transform eulerAngles (9.883555375836728 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7683504093515429
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6802812624303143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3369795525619659
"cameras/drone/drone0" SET Transform localPosition (-0.3995883492627389 0.5565109308365825 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9549747858157944 1.2605081284807662 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -13 20)
"cameras/drone/drone0" SET Transform localScale (0.8025099863856737 0.8025099863856737 0.8025099863856737)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -20 19)
"cameras/drone/drone1" SET Transform localScale (1.4269336143761708 1.4269336143761708 1.4269336143761708)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6803120461027174 0)
"cameras" SET Transform eulerAngles (4.083345605046436 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8516192189796796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8767809192562517
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16872247020604714
"cameras/drone/drone0" SET Transform localPosition (0.779388402169128 0.23797797870123066 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.43098937428189776 0.8501578236696671 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 9 -8)
"cameras/drone/drone0" SET Transform localScale (0.6640588928733155 0.6640588928733155 0.6640588928733155)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 7 -17)
"cameras/drone/drone1" SET Transform localScale (0.9974299533931337 0.9974299533931337 0.9974299533931337)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.495558366151621 0)
"cameras" SET Transform eulerAngles (-19.79927327335436 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0993191949802972
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.879510231572957
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11581342910867112
"cameras/drone/drone0" SET Transform localPosition (0.844290027854165 -0.04308110224188716 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3321382796868899 1.0275153275939495 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -18 -3)
"cameras/drone/drone0" SET Transform localScale (0.641665977487317 0.641665977487317 0.641665977487317)
"cameras/drone/drone1" SET Transform localEulerAngles (18 4 -10)
"cameras/drone/drone1" SET Transform localScale (0.9259403116016762 0.9259403116016762 0.9259403116016762)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.002225385918893 0)
"cameras" SET Transform eulerAngles (2.9545247437980784 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0892697792144261
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.243020213872997
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3690109892283011
"cameras/drone/drone0" SET Transform localPosition (-0.5752000462660739 -0.22557640905079496 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.859190204315402 0.8215418851610349 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -5 -1)
"cameras/drone/drone0" SET Transform localScale (0.6626311786783792 0.6626311786783792 0.6626311786783792)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 1 -17)
"cameras/drone/drone1" SET Transform localScale (0.8056739616587232 0.8056739616587232 0.8056739616587232)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.421470028400356 0)
"cameras" SET Transform eulerAngles (-3.684263906687221 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2163094451065795
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.916722746214242
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21594552467963377
"cameras/drone/drone0" SET Transform localPosition (0.7179823738980202 -0.1609902078485253 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2007040440520047 0.9837847858357385 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 9 13)
"cameras/drone/drone0" SET Transform localScale (0.9921558384235825 0.9921558384235825 0.9921558384235825)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 16 4)
"cameras/drone/drone1" SET Transform localScale (0.8206988545212929 0.8206988545212929 0.8206988545212929)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2719710149491603 0)
"cameras" SET Transform eulerAngles (-4.8288996178077515 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5019572277359446
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.231267014704884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29095644735117737
"cameras/drone/drone0" SET Transform localPosition (0.042429294558928854 0.6428898591458765 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7293744215134448 0.8785940483791704 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -10 -8)
"cameras/drone/drone0" SET Transform localScale (1.303175724257302 1.303175724257302 1.303175724257302)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -17 -3)
"cameras/drone/drone1" SET Transform localScale (1.1653585707958978 1.1653585707958978 1.1653585707958978)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.602838693663297 0)
"cameras" SET Transform eulerAngles (13.981923092369605 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7308004198614849
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.727590719233254
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.101398413289966
"cameras/drone/drone0" SET Transform localPosition (-0.3210136967110926 0.6114124451829037 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2274201044149422 1.0343686627497064 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -5 11)
"cameras/drone/drone0" SET Transform localScale (1.342832504167327 1.342832504167327 1.342832504167327)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -13 13)
"cameras/drone/drone1" SET Transform localScale (0.6008551944612626 0.6008551944612626 0.6008551944612626)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6286307972496545 0)
"cameras" SET Transform eulerAngles (-11.549415056425723 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5865717273689877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1153426362863583
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30057949388934135
"cameras/drone/drone0" SET Transform localPosition (-0.8214585702769773 -0.1781860524123578 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.31978550406346085 0.9854521686543283 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 0 20)
"cameras/drone/drone0" SET Transform localScale (0.6860470551732771 0.6860470551732771 0.6860470551732771)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 1 -3)
"cameras/drone/drone1" SET Transform localScale (1.088841650316343 1.088841650316343 1.088841650316343)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2497032381960675 0)
"cameras" SET Transform eulerAngles (11.138945929034172 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6132166976901895
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6410921471867992
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2072265065462855
"cameras/drone/drone0" SET Transform localPosition (-0.9187590269238548 0.3025735370329283 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08739296453717293 1.0349195230938601 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 20 0)
"cameras/drone/drone0" SET Transform localScale (1.1793389945267203 1.1793389945267203 1.1793389945267203)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -10 -20)
"cameras/drone/drone1" SET Transform localScale (0.9707034719963694 0.9707034719963694 0.9707034719963694)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.33181161687137 0)
"cameras" SET Transform eulerAngles (3.3528938440436384 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4538625613888186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9802978739866521
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2291946721244812
"cameras/drone/drone0" SET Transform localPosition (-0.48272964739986146 0.11475130659745075 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6717676297467209 0.8755297301802938 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 20 18)
"cameras/drone/drone0" SET Transform localScale (1.4333207652983422 1.4333207652983422 1.4333207652983422)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -5 -17)
"cameras/drone/drone1" SET Transform localScale (1.2212046152462088 1.2212046152462088 1.2212046152462088)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.944007335439058 0)
"cameras" SET Transform eulerAngles (-17.08871078856764 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9808507284460682
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7867996028014952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32198615147651327
"cameras/drone/drone0" SET Transform localPosition (0.5262277398827475 0.07804103943374713 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16767988461756156 0.8973662316092885 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -20 -2)
"cameras/drone/drone0" SET Transform localScale (0.9460058507778364 0.9460058507778364 0.9460058507778364)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 12 0)
"cameras/drone/drone1" SET Transform localScale (0.6132030147956004 0.6132030147956004 0.6132030147956004)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0111162518522083 0)
"cameras" SET Transform eulerAngles (17.912237402974107 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1014689089224423
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0506606909555023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20384109242638077
"cameras/drone/drone0" SET Transform localPosition (-0.5817843360003475 0.022763343291331506 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8094266792985583 0.8713440886002788 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 2 5)
"cameras/drone/drone0" SET Transform localScale (1.3822170819429949 1.3822170819429949 1.3822170819429949)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -7 -8)
"cameras/drone/drone1" SET Transform localScale (1.2637008166934354 1.2637008166934354 1.2637008166934354)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9907604117803332 0)
"cameras" SET Transform eulerAngles (6.580130072067632 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2799419801927838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.884610104888782
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36018562352292993
"cameras/drone/drone0" SET Transform localPosition (-0.670902767462428 0.41538485232215566 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.931490381367043 1.2913485933560775 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -18 -11)
"cameras/drone/drone0" SET Transform localScale (1.2278032757458557 1.2278032757458557 1.2278032757458557)
"cameras/drone/drone1" SET Transform localEulerAngles (11 11 -3)
"cameras/drone/drone1" SET Transform localScale (0.7871402483070065 0.7871402483070065 0.7871402483070065)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.897925678052018 0)
"cameras" SET Transform eulerAngles (0.22297230805273216 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6316790564735537
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1223058704393105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11519041208762766
"cameras/drone/drone0" SET Transform localPosition (0.8876573656688558 0.1088640314182227 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.23558467407365535 1.0236872016163139 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 1 -7)
"cameras/drone/drone0" SET Transform localScale (1.0748526032610406 1.0748526032610406 1.0748526032610406)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -10 -7)
"cameras/drone/drone1" SET Transform localScale (0.9487732453253354 0.9487732453253354 0.9487732453253354)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5811069557066086 0)
"cameras" SET Transform eulerAngles (-5.5237834616450066 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0179383164446925
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5592161162966345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13553141889246284
"cameras/drone/drone0" SET Transform localPosition (-0.3173798263600326 0.4277521062187006 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.33660051174674366 1.037404994078547 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -14 -5)
"cameras/drone/drone0" SET Transform localScale (1.384252014435174 1.384252014435174 1.384252014435174)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -16 -6)
"cameras/drone/drone1" SET Transform localScale (1.1758164225078978 1.1758164225078978 1.1758164225078978)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.171105421061782 0)
"cameras" SET Transform eulerAngles (1.316469256676701 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4969198185628655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9932866125317221
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10562017327808469
"cameras/drone/drone0" SET Transform localPosition (0.2669141028864115 -0.09000468347879836 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7645491374564901 0.8655930725594136 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -11 17)
"cameras/drone/drone0" SET Transform localScale (1.425648050509714 1.425648050509714 1.425648050509714)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -4 19)
"cameras/drone/drone1" SET Transform localScale (0.6296251680456391 0.6296251680456391 0.6296251680456391)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.592004169431049 0)
"cameras" SET Transform eulerAngles (-17.53858505742313 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5972263756970745
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8229512544402402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05932953302118338
"cameras/drone/drone0" SET Transform localPosition (0.2725375007781583 0.6702933810026608 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.20060443530587668 0.909777773743983 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 0 -10)
"cameras/drone/drone0" SET Transform localScale (1.1231305504381819 1.1231305504381819 1.1231305504381819)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 19 18)
"cameras/drone/drone1" SET Transform localScale (0.86455793181825 0.86455793181825 0.86455793181825)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0800371471118706 0)
"cameras" SET Transform eulerAngles (13.685040338134236 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.954826536954737
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4872855872242745
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10679881747036091
"cameras/drone/drone0" SET Transform localPosition (0.0336283777387556 -0.08119826256997237 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1131750726269012 1.0083565996046717 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 11 -3)
"cameras/drone/drone0" SET Transform localScale (0.6341041079087012 0.6341041079087012 0.6341041079087012)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -11 -3)
"cameras/drone/drone1" SET Transform localScale (1.0050102543878685 1.0050102543878685 1.0050102543878685)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.299049209925284 0)
"cameras" SET Transform eulerAngles (13.66620822246476 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5030708028375034
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.015060119076955
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3016994113961372
"cameras/drone/drone0" SET Transform localPosition (-0.24217046062359182 0.15591601184588694 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.012163170171051174 0.8218304519695292 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 17 -8)
"cameras/drone/drone0" SET Transform localScale (1.2211246623121927 1.2211246623121927 1.2211246623121927)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -5 16)
"cameras/drone/drone1" SET Transform localScale (1.0594698251495074 1.0594698251495074 1.0594698251495074)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6077843916808723 0)
"cameras" SET Transform eulerAngles (-8.265726114385888 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9045750593900825
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9351248588365744
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01931703435365728
"cameras/drone/drone0" SET Transform localPosition (-1.1103284934540387 0.08844634712240179 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7345935366463481 1.005210326597822 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -5 -16)
"cameras/drone/drone0" SET Transform localScale (1.4311311158090603 1.4311311158090603 1.4311311158090603)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -8 9)
"cameras/drone/drone1" SET Transform localScale (1.203323422019817 1.203323422019817 1.203323422019817)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.139730339767511 0)
"cameras" SET Transform eulerAngles (-6.7938439656934335 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.149670966490085
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.09501116392217
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3801832922914192
"cameras/drone/drone0" SET Transform localPosition (-1.0966529024844993 0.5162709501274947 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.46273247739987833 0.9106607529487376 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -17 -15)
"cameras/drone/drone0" SET Transform localScale (1.1079107359530844 1.1079107359530844 1.1079107359530844)
"cameras/drone/drone1" SET Transform localEulerAngles (19 19 5)
"cameras/drone/drone1" SET Transform localScale (1.2811593146081353 1.2811593146081353 1.2811593146081353)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.394269874368717 0)
"cameras" SET Transform eulerAngles (-0.9995288312554784 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1688456726250092
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1359667061390697
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09282918619350428
"cameras/drone/drone0" SET Transform localPosition (-0.796562858553447 0.3795530947866775 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7508229962324555 1.0350621066238865 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 5 -5)
"cameras/drone/drone0" SET Transform localScale (0.9202926725240124 0.9202926725240124 0.9202926725240124)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -5 -12)
"cameras/drone/drone1" SET Transform localScale (1.3761519706644778 1.3761519706644778 1.3761519706644778)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.89107123522229 0)
"cameras" SET Transform eulerAngles (-13.256062972038333 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7362873367497631
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.525866990025688
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38224127027018334
"cameras/drone/drone0" SET Transform localPosition (-0.08669590693397655 0.2414867006696611 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.713190686610006 1.0978123104670536 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -9 -10)
"cameras/drone/drone0" SET Transform localScale (0.9273686949292712 0.9273686949292712 0.9273686949292712)
"cameras/drone/drone1" SET Transform localEulerAngles (1 19 -5)
"cameras/drone/drone1" SET Transform localScale (0.86823454195885 0.86823454195885 0.86823454195885)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9305104121747894 0)
"cameras" SET Transform eulerAngles (4.312402412551318 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0101593522666017
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6751280290492383
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18586940303747523
"cameras/drone/drone0" SET Transform localPosition (1.0321117917766849 -0.07050388266189317 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3302821047579465 1.0062926939758654 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 20 6)
"cameras/drone/drone0" SET Transform localScale (0.7913396962391178 0.7913396962391178 0.7913396962391178)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -2 4)
"cameras/drone/drone1" SET Transform localScale (0.8303910938297879 0.8303910938297879 0.8303910938297879)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2699117092427468 0)
"cameras" SET Transform eulerAngles (-10.754861968916067 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2794346763967233
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0260064239670947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38801718569960597
"cameras/drone/drone0" SET Transform localPosition (-0.28825408563579213 -0.29792568287088333 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1711026025539548 1.2726161750454996 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -13 16)
"cameras/drone/drone0" SET Transform localScale (1.4063466560178906 1.4063466560178906 1.4063466560178906)
"cameras/drone/drone1" SET Transform localEulerAngles (12 16 -11)
"cameras/drone/drone1" SET Transform localScale (1.0848470832922246 1.0848470832922246 1.0848470832922246)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.54765420711541 0)
"cameras" SET Transform eulerAngles (2.2995658402451937 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2645053381599936
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3033588467665627
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.011659459907629267
"cameras/drone/drone0" SET Transform localPosition (0.14316385349124028 0.2651681329696078 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1702865709422576 0.9157180602893011 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -18 -16)
"cameras/drone/drone0" SET Transform localScale (0.9679725367621554 0.9679725367621554 0.9679725367621554)
"cameras/drone/drone1" SET Transform localEulerAngles (8 2 0)
"cameras/drone/drone1" SET Transform localScale (1.3542362414488556 1.3542362414488556 1.3542362414488556)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.115205544481746 0)
"cameras" SET Transform eulerAngles (12.204321482322491 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.24234770599359
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1058704529070802
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.057861709938519336
"cameras/drone/drone0" SET Transform localPosition (-0.2236131537143451 0.15439301683275158 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.125291159132914 1.1145960767374514 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -11 -17)
"cameras/drone/drone0" SET Transform localScale (0.7115894406717461 0.7115894406717461 0.7115894406717461)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -15 -14)
"cameras/drone/drone1" SET Transform localScale (0.6300147723633525 0.6300147723633525 0.6300147723633525)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4805557248417616 0)
"cameras" SET Transform eulerAngles (-7.92212800208722 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8464895263146639
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.473836417905126
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35263390989459326
"cameras/drone/drone0" SET Transform localPosition (0.7331618515156288 0.6089296624916247 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7123160799844701 1.2525061264706254 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -2 3)
"cameras/drone/drone0" SET Transform localScale (0.7710278545306248 0.7710278545306248 0.7710278545306248)
"cameras/drone/drone1" SET Transform localEulerAngles (14 4 12)
"cameras/drone/drone1" SET Transform localScale (0.6202136402984707 0.6202136402984707 0.6202136402984707)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.47517736259634 0)
"cameras" SET Transform eulerAngles (19.734979985921484 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0346102053450248
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0680727248242283
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.121388778027911
"cameras/drone/drone0" SET Transform localPosition (-0.8314818996956874 0.1964242787641916 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8083670827582286 0.8822957766046204 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -20 -6)
"cameras/drone/drone0" SET Transform localScale (0.6732265774426252 0.6732265774426252 0.6732265774426252)
"cameras/drone/drone1" SET Transform localEulerAngles (3 13 -12)
"cameras/drone/drone1" SET Transform localScale (1.479111204336709 1.479111204336709 1.479111204336709)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0932890474412327 0)
"cameras" SET Transform eulerAngles (16.90081317545686 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8522962390933688
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8658294259046313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16971016814588663
"cameras/drone/drone0" SET Transform localPosition (-0.3262144014553635 -0.14472245054617566 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.35048409418415316 1.0667482733957103 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 9 -8)
"cameras/drone/drone0" SET Transform localScale (0.6059055920292797 0.6059055920292797 0.6059055920292797)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 1 12)
"cameras/drone/drone1" SET Transform localScale (0.8779487195097677 0.8779487195097677 0.8779487195097677)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5104893651677926 0)
"cameras" SET Transform eulerAngles (-3.518357565296924 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1238718541473312
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1880648526995476
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0031268285389035367
"cameras/drone/drone0" SET Transform localPosition (-0.5837146457551364 0.6089473796899987 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10654990307875911 1.0999300326998713 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 16 12)
"cameras/drone/drone0" SET Transform localScale (0.9080013435887117 0.9080013435887117 0.9080013435887117)
"cameras/drone/drone1" SET Transform localEulerAngles (5 1 -3)
"cameras/drone/drone1" SET Transform localScale (0.8369542561934196 0.8369542561934196 0.8369542561934196)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.541298936735769 0)
"cameras" SET Transform eulerAngles (-14.420413376336768 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9788220550415447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.860502312551724
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20618723499956315
"cameras/drone/drone0" SET Transform localPosition (0.3819084079648838 0.26441656912854966 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0639479182733143 1.152442787760727 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 14 -16)
"cameras/drone/drone0" SET Transform localScale (1.0872774428757972 1.0872774428757972 1.0872774428757972)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -13 -16)
"cameras/drone/drone1" SET Transform localScale (0.6448258248601494 0.6448258248601494 0.6448258248601494)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.313248614511274 0)
"cameras" SET Transform eulerAngles (-9.973018355912945 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5336266567715159
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4539387353977897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34753463093569176
"cameras/drone/drone0" SET Transform localPosition (-0.501646810011971 0.6939242761019142 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9172553439579765 0.816794106991615 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -19 -17)
"cameras/drone/drone0" SET Transform localScale (1.1294430599088314 1.1294430599088314 1.1294430599088314)
"cameras/drone/drone1" SET Transform localEulerAngles (20 1 -12)
"cameras/drone/drone1" SET Transform localScale (0.8295069507060332 0.8295069507060332 0.8295069507060332)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4342079918261375 0)
"cameras" SET Transform eulerAngles (-14.332260622360735 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5004833073880093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3100454739370142
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11012432611840084
"cameras/drone/drone0" SET Transform localPosition (-0.19026989708407127 0.18411646203188176 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0264738609050836 0.8538339888509529 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 10 -19)
"cameras/drone/drone0" SET Transform localScale (1.1165860846134348 1.1165860846134348 1.1165860846134348)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -9 4)
"cameras/drone/drone1" SET Transform localScale (0.7834219237353501 0.7834219237353501 0.7834219237353501)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.395209669576089 0)
"cameras" SET Transform eulerAngles (-16.193441108103833 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7765645440553168
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8944548803686625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10236942349203391
"cameras/drone/drone0" SET Transform localPosition (-0.29093681671605165 0.2781060834662484 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20705546773581207 1.1560262390299563 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -16 -15)
"cameras/drone/drone0" SET Transform localScale (0.784568667681301 0.784568667681301 0.784568667681301)
"cameras/drone/drone1" SET Transform localEulerAngles (20 13 20)
"cameras/drone/drone1" SET Transform localScale (1.4573515319143726 1.4573515319143726 1.4573515319143726)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7030322767070682 0)
"cameras" SET Transform eulerAngles (-2.1212341621887347 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.051440369584543
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4960443343909304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19585234642696736
"cameras/drone/drone0" SET Transform localPosition (-0.4792456587422558 -0.022277823733742375 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.13178058386444 1.2487188696812923 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 15 12)
"cameras/drone/drone0" SET Transform localScale (1.1151554326923256 1.1151554326923256 1.1151554326923256)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -13 -14)
"cameras/drone/drone1" SET Transform localScale (1.2851197758039117 1.2851197758039117 1.2851197758039117)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.843925746126429 0)
"cameras" SET Transform eulerAngles (-12.077185855191717 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8027885594851505
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2016276742972154
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.056325830174536407
"cameras/drone/drone0" SET Transform localPosition (-1.1937055584987502 0.5302817388830972 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5611687361636922 1.0782594347185104 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 10 14)
"cameras/drone/drone0" SET Transform localScale (1.389126876818266 1.389126876818266 1.389126876818266)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -19 2)
"cameras/drone/drone1" SET Transform localScale (0.6749660417034244 0.6749660417034244 0.6749660417034244)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.354223141826122 0)
"cameras" SET Transform eulerAngles (-5.631810345320364 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0913270157724686
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1120547074378462
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30056223317158964
"cameras/drone/drone0" SET Transform localPosition (0.4745929318696718 -0.08485769702485052 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6832520711785076 1.285580251275 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 4 -18)
"cameras/drone/drone0" SET Transform localScale (1.3159201916299044 1.3159201916299044 1.3159201916299044)
"cameras/drone/drone1" SET Transform localEulerAngles (9 6 -4)
"cameras/drone/drone1" SET Transform localScale (0.9877110852198854 0.9877110852198854 0.9877110852198854)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.17433548822784 0)
"cameras" SET Transform eulerAngles (-18.31054372390102 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7619941991644228
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.838442229593473
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3754888896965442
"cameras/drone/drone0" SET Transform localPosition (-0.41944368745669214 -0.03232191741183693 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0395975922526903 1.0445556530478717 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -19 12)
"cameras/drone/drone0" SET Transform localScale (0.7883897521401733 0.7883897521401733 0.7883897521401733)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -6 -10)
"cameras/drone/drone1" SET Transform localScale (1.4216908204100762 1.4216908204100762 1.4216908204100762)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.571245089689366 0)
"cameras" SET Transform eulerAngles (1.5139068138552503 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.320504720711788
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.976202342324985
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28864715039860744
"cameras/drone/drone0" SET Transform localPosition (1.1220498743843847 0.6960037534835808 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7622865301652388 0.831028128781434 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -3 -9)
"cameras/drone/drone0" SET Transform localScale (1.1141497912008502 1.1141497912008502 1.1141497912008502)
"cameras/drone/drone1" SET Transform localEulerAngles (5 3 15)
"cameras/drone/drone1" SET Transform localScale (0.7325297711379508 0.7325297711379508 0.7325297711379508)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5934208502635574 0)
"cameras" SET Transform eulerAngles (-2.8017118731411017 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7556676351097694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3209445935625967
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15199524771619466
"cameras/drone/drone0" SET Transform localPosition (-0.7830487532801722 0.24940345124722857 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1853724489116062 1.0152216868186885 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 9 -16)
"cameras/drone/drone0" SET Transform localScale (0.881362870738208 0.881362870738208 0.881362870738208)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -4 -6)
"cameras/drone/drone1" SET Transform localScale (0.8034150863807366 0.8034150863807366 0.8034150863807366)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.302361254628005 0)
"cameras" SET Transform eulerAngles (17.324128383199763 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0278893973446912
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.071736684038831
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3631325018463638
"cameras/drone/drone0" SET Transform localPosition (-0.6224133017712961 -0.2723603384973517 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.43111112598467416 0.9396457202597317 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -6 -15)
"cameras/drone/drone0" SET Transform localScale (1.1152549580405173 1.1152549580405173 1.1152549580405173)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 18 -9)
"cameras/drone/drone1" SET Transform localScale (1.4960592690778587 1.4960592690778587 1.4960592690778587)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.833990296027772 0)
"cameras" SET Transform eulerAngles (6.196893575476015 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2457608824223136
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5990093027806092
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3489711824708104
"cameras/drone/drone0" SET Transform localPosition (-0.3053055056299656 0.06959742223762094 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.001884041647129 1.1137109377890961 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 11 2)
"cameras/drone/drone0" SET Transform localScale (1.238870210950726 1.238870210950726 1.238870210950726)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 15 -2)
"cameras/drone/drone1" SET Transform localScale (1.2405855551402158 1.2405855551402158 1.2405855551402158)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0067714984381384 0)
"cameras" SET Transform eulerAngles (-9.321291434695059 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8320633507411308
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6833891700997603
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34177279436447117
"cameras/drone/drone0" SET Transform localPosition (0.5408497583913887 0.4379548710979821 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.0417370141884994 1.1390206536438405 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -5 -20)
"cameras/drone/drone0" SET Transform localScale (1.04168591355318 1.04168591355318 1.04168591355318)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -5 -6)
"cameras/drone/drone1" SET Transform localScale (1.0629329180504719 1.0629329180504719 1.0629329180504719)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.385407044591406 0)
"cameras" SET Transform eulerAngles (17.14861326019816 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3770337773000607
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1257287239607958
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15580784352090432
"cameras/drone/drone0" SET Transform localPosition (1.1378132990626455 -0.23264604687248985 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1718695448897829 1.2448488471266352 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 4 15)
"cameras/drone/drone0" SET Transform localScale (0.9554679657892704 0.9554679657892704 0.9554679657892704)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -2 -4)
"cameras/drone/drone1" SET Transform localScale (1.16545811045826 1.16545811045826 1.16545811045826)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.292543692298246 0)
"cameras" SET Transform eulerAngles (5.401278832735038 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2578206893144723
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0312473012374115
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3928572479758956
"cameras/drone/drone0" SET Transform localPosition (-0.4132337331993733 -0.08421519804630301 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.570242434296619 0.9766922473349045 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 0 -2)
"cameras/drone/drone0" SET Transform localScale (1.3868843596446963 1.3868843596446963 1.3868843596446963)
"cameras/drone/drone1" SET Transform localEulerAngles (1 16 19)
"cameras/drone/drone1" SET Transform localScale (1.387296733635206 1.387296733635206 1.387296733635206)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.881533246883306 0)
"cameras" SET Transform eulerAngles (5.749678644049222 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8239879055354162
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4411161184096228
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08196047048920559
"cameras/drone/drone0" SET Transform localPosition (0.13774324616973788 -0.16641474607822243 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3504500875460126 1.2785737684580711 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 13 -4)
"cameras/drone/drone0" SET Transform localScale (1.2746557455886833 1.2746557455886833 1.2746557455886833)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -8 6)
"cameras/drone/drone1" SET Transform localScale (1.381583707485762 1.381583707485762 1.381583707485762)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.206155304591018 0)
"cameras" SET Transform eulerAngles (4.857841348945033 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6874784389540468
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2660175695620906
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3028512480822272
"cameras/drone/drone0" SET Transform localPosition (-0.6108354242427724 0.23159976757203843 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6065345613176916 1.0664294374150538 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -9 15)
"cameras/drone/drone0" SET Transform localScale (0.8007098873426712 0.8007098873426712 0.8007098873426712)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -7 19)
"cameras/drone/drone1" SET Transform localScale (1.2235648519881892 1.2235648519881892 1.2235648519881892)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.90127952144024 0)
"cameras" SET Transform eulerAngles (-2.3728194509896063 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44369732999686995
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2649741308774032
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38445470383010094
"cameras/drone/drone0" SET Transform localPosition (-0.47808533100649264 -0.11652150125702637 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1471735698472243 1.0738641001865237 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -3 16)
"cameras/drone/drone0" SET Transform localScale (1.103466473728767 1.103466473728767 1.103466473728767)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -5 -4)
"cameras/drone/drone1" SET Transform localScale (0.6759495473003285 0.6759495473003285 0.6759495473003285)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.300757476070469 0)
"cameras" SET Transform eulerAngles (13.729293160786263 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41154220732027186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1205132844074484
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2679230905866445
"cameras/drone/drone0" SET Transform localPosition (0.7708784747742463 0.05819688397740913 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.48863377430861465 1.1959167765478396 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -20 -5)
"cameras/drone/drone0" SET Transform localScale (0.9851132063860867 0.9851132063860867 0.9851132063860867)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -20 18)
"cameras/drone/drone1" SET Transform localScale (1.4378841153006645 1.4378841153006645 1.4378841153006645)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.434441689773416 0)
"cameras" SET Transform eulerAngles (-19.023946001464136 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41177988814452543
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.463434638807237
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1445927417012894
"cameras/drone/drone0" SET Transform localPosition (-0.061355330217959914 -0.2267227046688201 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4551669364767301 0.8928715205391586 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 11 -5)
"cameras/drone/drone0" SET Transform localScale (1.1688373999129926 1.1688373999129926 1.1688373999129926)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -19 7)
"cameras/drone/drone1" SET Transform localScale (0.965399385828239 0.965399385828239 0.965399385828239)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3165863897342485 0)
"cameras" SET Transform eulerAngles (19.89419479095963 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4672157556877057
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9678740859338223
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18825636949027402
"cameras/drone/drone0" SET Transform localPosition (0.850766990856149 -0.12245289451870506 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.187259175761984 1.0772981828312755 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 3 -9)
"cameras/drone/drone0" SET Transform localScale (1.410669362597533 1.410669362597533 1.410669362597533)
"cameras/drone/drone1" SET Transform localEulerAngles (16 2 18)
"cameras/drone/drone1" SET Transform localScale (1.1787984327044154 1.1787984327044154 1.1787984327044154)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.904205115197438 0)
"cameras" SET Transform eulerAngles (-8.203691128855128 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4291861252877718
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5170801592427152
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3100499326673194
"cameras/drone/drone0" SET Transform localPosition (1.0344225217486807 -0.07621074828887825 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8296757806223896 0.9125051259722278 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 13 12)
"cameras/drone/drone0" SET Transform localScale (1.0784906903105684 1.0784906903105684 1.0784906903105684)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -14 -9)
"cameras/drone/drone1" SET Transform localScale (1.4629945998070069 1.4629945998070069 1.4629945998070069)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9683339213378632 0)
"cameras" SET Transform eulerAngles (18.06061240986825 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0363170321532578
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8294898378253461
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06414911663371403
"cameras/drone/drone0" SET Transform localPosition (-0.7766571151354702 -0.12842551397520846 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4339915483198844 1.0183546587857812 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 7 7)
"cameras/drone/drone0" SET Transform localScale (1.4926785457395635 1.4926785457395635 1.4926785457395635)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -6 13)
"cameras/drone/drone1" SET Transform localScale (0.8916666786110683 0.8916666786110683 0.8916666786110683)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5874241795708706 0)
"cameras" SET Transform eulerAngles (18.57034107768144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0401268072519785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.033535214632643
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2728324451568955
"cameras/drone/drone0" SET Transform localPosition (-0.49794308959387046 0.3001640759505078 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.25998182430822725 1.068098481789033 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 11 -7)
"cameras/drone/drone0" SET Transform localScale (0.7411157692062753 0.7411157692062753 0.7411157692062753)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 9 1)
"cameras/drone/drone1" SET Transform localScale (0.6265641202673193 0.6265641202673193 0.6265641202673193)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.846808749202488 0)
"cameras" SET Transform eulerAngles (-12.771972343314268 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6454012397435294
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.27050280471228
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0379836803735802
"cameras/drone/drone0" SET Transform localPosition (0.34817547706828456 -0.13278284838758653 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.70912713597249 1.2968292860400574 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -14 12)
"cameras/drone/drone0" SET Transform localScale (0.9151884790728981 0.9151884790728981 0.9151884790728981)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -5 9)
"cameras/drone/drone1" SET Transform localScale (1.2259083867615568 1.2259083867615568 1.2259083867615568)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.539322644035728 0)
"cameras" SET Transform eulerAngles (-2.217157827644641 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1479145616726059
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8868006392279364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35410373843540843
"cameras/drone/drone0" SET Transform localPosition (-1.1311796363891715 0.3937945618539193 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.38637523191454926 0.8218206634333096 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -11 -15)
"cameras/drone/drone0" SET Transform localScale (1.1297875915389115 1.1297875915389115 1.1297875915389115)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -15 -1)
"cameras/drone/drone1" SET Transform localScale (1.3099454064353866 1.3099454064353866 1.3099454064353866)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5882876030739954 0)
"cameras" SET Transform eulerAngles (-4.020039493793757 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8570832175514438
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0581393099580265
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27771233813403695
"cameras/drone/drone0" SET Transform localPosition (-0.3408253003959487 0.019797875256275133 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4154325316034436 0.8235167098802989 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -17 -8)
"cameras/drone/drone0" SET Transform localScale (1.3181640332257438 1.3181640332257438 1.3181640332257438)
"cameras/drone/drone1" SET Transform localEulerAngles (1 12 -13)
"cameras/drone/drone1" SET Transform localScale (1.3736487875218852 1.3736487875218852 1.3736487875218852)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
