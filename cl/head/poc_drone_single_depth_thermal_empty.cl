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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 178 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 30 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 68 collisionCheck true stickToGround false 
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
"cameras" SET Transform eulerAngles (-4.070841688030937 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 92
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.975599939307448 0)
"cameras" SET Transform eulerAngles (1.3078691628344572 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5489213598768641
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5394140833448091
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38431903211297086
"cameras/drone/drone0" SET Transform localPosition (-0.03315379198618085 0.07537668537755499 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8650375922652065 0.8429847175447551 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 9 -19)
"cameras/drone/drone0" SET Transform localScale (1.1653738950147012 1.1653738950147012 1.1653738950147012)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -7 7)
"cameras/drone/drone1" SET Transform localScale (1.1344243777933738 1.1344243777933738 1.1344243777933738)
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
"cameras" SET Transform position (0 4.266629118610736 0)
"cameras" SET Transform eulerAngles (19.60365990364312 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2934548658358498
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7488371924510342
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09242148402257083
"cameras/drone/drone0" SET Transform localPosition (0.6039081838263467 0.13266606281338705 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3871529078291973 1.2759254667631323 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 9 -5)
"cameras/drone/drone0" SET Transform localScale (1.06657330842302 1.06657330842302 1.06657330842302)
"cameras/drone/drone1" SET Transform localEulerAngles (16 18 0)
"cameras/drone/drone1" SET Transform localScale (1.2148814515802502 1.2148814515802502 1.2148814515802502)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.088865881488759 0)
"cameras" SET Transform eulerAngles (-18.53063933144768 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4958194458959796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.449558769075103
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28800177286837225
"cameras/drone/drone0" SET Transform localPosition (-0.33539767244618235 0.2366405402676655 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.00988220902545156 1.1744019302749815 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -7 -10)
"cameras/drone/drone0" SET Transform localScale (0.8051874738248307 0.8051874738248307 0.8051874738248307)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 0 5)
"cameras/drone/drone1" SET Transform localScale (1.0419781092746407 1.0419781092746407 1.0419781092746407)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.936695458468448 0)
"cameras" SET Transform eulerAngles (-2.529289776098402 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.336999832526344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.099001110206784
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38890553326866806
"cameras/drone/drone0" SET Transform localPosition (-0.9664448515711164 0.6755466403664641 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6701409258060296 1.0757442371028585 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 2 15)
"cameras/drone/drone0" SET Transform localScale (0.7626093637059608 0.7626093637059608 0.7626093637059608)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -3 -2)
"cameras/drone/drone1" SET Transform localScale (1.067841323392157 1.067841323392157 1.067841323392157)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.994188454201694 0)
"cameras" SET Transform eulerAngles (6.3338233189196025 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5356599081566276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.748511960473194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3131006750399945
"cameras/drone/drone0" SET Transform localPosition (-0.38485985914904497 0.49915731403010816 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3139878340975628 0.9544030895394418 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -2 20)
"cameras/drone/drone0" SET Transform localScale (1.2851008708193437 1.2851008708193437 1.2851008708193437)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 12 -10)
"cameras/drone/drone1" SET Transform localScale (0.947237623413397 0.947237623413397 0.947237623413397)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.395771296794102 0)
"cameras" SET Transform eulerAngles (5.634579183566242 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7394191173240285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7476219438904592
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.036859278872192335
"cameras/drone/drone0" SET Transform localPosition (-0.13427634851044723 -0.08698107448365106 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18852290260083615 1.01341824140682 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 15 -14)
"cameras/drone/drone0" SET Transform localScale (0.8221250506029676 0.8221250506029676 0.8221250506029676)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 13 19)
"cameras/drone/drone1" SET Transform localScale (1.319931014402397 1.319931014402397 1.319931014402397)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.02949898512128 0)
"cameras" SET Transform eulerAngles (0.0398864448279852 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4194899177464873
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3559324701107625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39097026593499834
"cameras/drone/drone0" SET Transform localPosition (0.12608862775826335 0.6667994123288115 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2861226959295441 0.9326051054786877 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -13 8)
"cameras/drone/drone0" SET Transform localScale (0.7592350942290333 0.7592350942290333 0.7592350942290333)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 15 17)
"cameras/drone/drone1" SET Transform localScale (0.9655777358569413 0.9655777358569413 0.9655777358569413)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7290337566904252 0)
"cameras" SET Transform eulerAngles (0.5624769356521355 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.166995115018561
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3245853898499593
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38173116462761375
"cameras/drone/drone0" SET Transform localPosition (0.44461233784265963 0.2579376816919699 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8669541162144835 0.8423588582266188 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 14 10)
"cameras/drone/drone0" SET Transform localScale (0.6898992312031951 0.6898992312031951 0.6898992312031951)
"cameras/drone/drone1" SET Transform localEulerAngles (6 1 4)
"cameras/drone/drone1" SET Transform localScale (1.3981886104837922 1.3981886104837922 1.3981886104837922)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.581720935293408 0)
"cameras" SET Transform eulerAngles (16.51143545900497 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4990666074226007
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.758654981987783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0009355034842619681
"cameras/drone/drone0" SET Transform localPosition (-0.6196038205044434 0.5804131313561847 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8405212009816012 0.870237309950944 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 2 5)
"cameras/drone/drone0" SET Transform localScale (0.8692595415291748 0.8692595415291748 0.8692595415291748)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -2 12)
"cameras/drone/drone1" SET Transform localScale (1.1784676404280636 1.1784676404280636 1.1784676404280636)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.394099109930873 0)
"cameras" SET Transform eulerAngles (-2.2212034832567937 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3000392888610577
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.530512232583368
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02119215701352202
"cameras/drone/drone0" SET Transform localPosition (0.381056494173595 0.4216540985585669 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5657356241487639 1.252376661445581 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -9 8)
"cameras/drone/drone0" SET Transform localScale (0.6335361885295102 0.6335361885295102 0.6335361885295102)
"cameras/drone/drone1" SET Transform localEulerAngles (10 14 -18)
"cameras/drone/drone1" SET Transform localScale (1.4710011151923656 1.4710011151923656 1.4710011151923656)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.917541617141456 0)
"cameras" SET Transform eulerAngles (-12.648563812604134 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6762166381100463
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.958000236627107
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3900081924003507
"cameras/drone/drone0" SET Transform localPosition (-0.34217255869646235 -0.15057601416569294 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.118011980629429 0.9698551891276155 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -19 18)
"cameras/drone/drone0" SET Transform localScale (1.3087332092821726 1.3087332092821726 1.3087332092821726)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -5 -16)
"cameras/drone/drone1" SET Transform localScale (0.7895798499655698 0.7895798499655698 0.7895798499655698)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7959913031098345 0)
"cameras" SET Transform eulerAngles (-16.57875470823605 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8472443960885664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9292774158619168
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36083109696037896
"cameras/drone/drone0" SET Transform localPosition (0.45219923257389705 0.6701582153223007 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7061952515977759 1.0106124348285233 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 15 12)
"cameras/drone/drone0" SET Transform localScale (1.3142119971749606 1.3142119971749606 1.3142119971749606)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -3 -17)
"cameras/drone/drone1" SET Transform localScale (0.6674142182450126 0.6674142182450126 0.6674142182450126)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.530268440880276 0)
"cameras" SET Transform eulerAngles (-17.91434113112612 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0715892228700903
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.148554818808598
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.004721477902305749
"cameras/drone/drone0" SET Transform localPosition (0.18088971296861445 -0.09786394376290025 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5556361677560898 1.2714445410034902 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -5 -15)
"cameras/drone/drone0" SET Transform localScale (0.7968913907397979 0.7968913907397979 0.7968913907397979)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -18 20)
"cameras/drone/drone1" SET Transform localScale (0.688541092507144 0.688541092507144 0.688541092507144)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.228444367119204 0)
"cameras" SET Transform eulerAngles (-2.2394840440811272 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.913439485367497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8907281971573817
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3568648019746669
"cameras/drone/drone0" SET Transform localPosition (-1.0897587399963342 0.14556762035019039 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09377104325840602 0.9918086335733561 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 14 -8)
"cameras/drone/drone0" SET Transform localScale (0.9005944219502953 0.9005944219502953 0.9005944219502953)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 13 15)
"cameras/drone/drone1" SET Transform localScale (1.125560241805902 1.125560241805902 1.125560241805902)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2796163628527806 0)
"cameras" SET Transform eulerAngles (19.057957985832083 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0011565942714178
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3610479808380678
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26821667949618305
"cameras/drone/drone0" SET Transform localPosition (0.6563707492338027 0.41109737583493583 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6320997899277292 0.8981462866325867 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 0 -13)
"cameras/drone/drone0" SET Transform localScale (1.4457327948628658 1.4457327948628658 1.4457327948628658)
"cameras/drone/drone1" SET Transform localEulerAngles (4 6 -11)
"cameras/drone/drone1" SET Transform localScale (1.0491701081939517 1.0491701081939517 1.0491701081939517)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.322226198950487 0)
"cameras" SET Transform eulerAngles (15.773073227035077 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6704451719386053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7700655007194532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19077340156579164
"cameras/drone/drone0" SET Transform localPosition (-0.6318576085905866 -0.26963345982382353 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.48765722323884164 1.0409236466963188 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 5 -12)
"cameras/drone/drone0" SET Transform localScale (0.6427347486681274 0.6427347486681274 0.6427347486681274)
"cameras/drone/drone1" SET Transform localEulerAngles (6 18 -3)
"cameras/drone/drone1" SET Transform localScale (0.8182261077711779 0.8182261077711779 0.8182261077711779)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.525488604809626 0)
"cameras" SET Transform eulerAngles (-7.800770347363176 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9617660272523308
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5687140598580216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1865240245528157
"cameras/drone/drone0" SET Transform localPosition (-0.5150837431486527 0.08575911415349452 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.15703548519441335 0.8001388347910079 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 3 -13)
"cameras/drone/drone0" SET Transform localScale (1.3394436118896729 1.3394436118896729 1.3394436118896729)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 11 10)
"cameras/drone/drone1" SET Transform localScale (1.1768891717631123 1.1768891717631123 1.1768891717631123)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.436290951433132 0)
"cameras" SET Transform eulerAngles (17.07317625217263 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48982318670784575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1104055693690043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14114061725074706
"cameras/drone/drone0" SET Transform localPosition (0.8126144552832966 0.17516441554356382 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3610140172813323 0.903529018416882 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -7 -17)
"cameras/drone/drone0" SET Transform localScale (0.7690290393381276 0.7690290393381276 0.7690290393381276)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -15 18)
"cameras/drone/drone1" SET Transform localScale (0.6151650580463063 0.6151650580463063 0.6151650580463063)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.18159796387169 0)
"cameras" SET Transform eulerAngles (15.712536416558258 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7928249958678171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5310467314771063
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05976195172380741
"cameras/drone/drone0" SET Transform localPosition (0.08644037504663538 0.6323147629899575 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1844588405668255 0.9613344684722633 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 14 19)
"cameras/drone/drone0" SET Transform localScale (1.3387623455139819 1.3387623455139819 1.3387623455139819)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 3 -4)
"cameras/drone/drone1" SET Transform localScale (1.1673715657870807 1.1673715657870807 1.1673715657870807)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.501816914048311 0)
"cameras" SET Transform eulerAngles (-6.135186257010602 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1726716570480313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9382510847272156
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37306978581120487
"cameras/drone/drone0" SET Transform localPosition (0.16030875447855664 0.04387786403142263 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8819566127080052 1.1075841954696684 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -11 2)
"cameras/drone/drone0" SET Transform localScale (1.357434054202077 1.357434054202077 1.357434054202077)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 0 12)
"cameras/drone/drone1" SET Transform localScale (0.8045338699883782 0.8045338699883782 0.8045338699883782)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3265524157836115 0)
"cameras" SET Transform eulerAngles (4.726028287983585 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6435401120089475
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2907228280541625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37820232496053663
"cameras/drone/drone0" SET Transform localPosition (0.809125327205521 -0.22142244692456187 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5699018781594716 1.071651022614023 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 3 -9)
"cameras/drone/drone0" SET Transform localScale (1.450927883787797 1.450927883787797 1.450927883787797)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -5 -16)
"cameras/drone/drone1" SET Transform localScale (0.697895490401676 0.697895490401676 0.697895490401676)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.206965865146936 0)
"cameras" SET Transform eulerAngles (13.290046452424797 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.020271850329058
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8290724699216665
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1705802570293174
"cameras/drone/drone0" SET Transform localPosition (1.0070680799824971 0.0026609778626694447 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.18031972184198253 1.0275160256394185 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -7 8)
"cameras/drone/drone0" SET Transform localScale (0.9261568369669393 0.9261568369669393 0.9261568369669393)
"cameras/drone/drone1" SET Transform localEulerAngles (11 6 16)
"cameras/drone/drone1" SET Transform localScale (1.0302758304913615 1.0302758304913615 1.0302758304913615)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.664241259575297 0)
"cameras" SET Transform eulerAngles (-12.620458209854593 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.489350557741465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.309093108874001
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16134826966381632
"cameras/drone/drone0" SET Transform localPosition (0.40083005033679964 -0.06356307873913608 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6001871073405202 1.055115121765681 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 8 -13)
"cameras/drone/drone0" SET Transform localScale (1.0738938640233737 1.0738938640233737 1.0738938640233737)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -6 15)
"cameras/drone/drone1" SET Transform localScale (1.114729219969843 1.114729219969843 1.114729219969843)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.478457666716624 0)
"cameras" SET Transform eulerAngles (18.05091657368085 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2285489885820922
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6082334580503803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3170349665445702
"cameras/drone/drone0" SET Transform localPosition (-0.4899486769976076 -0.1425560385079236 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1107512492722473 1.2593648912704223 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -1 -10)
"cameras/drone/drone0" SET Transform localScale (1.4214160901863089 1.4214160901863089 1.4214160901863089)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 15 20)
"cameras/drone/drone1" SET Transform localScale (1.3421093067563956 1.3421093067563956 1.3421093067563956)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4396533353760743 0)
"cameras" SET Transform eulerAngles (14.786772228893781 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.058536489625833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.996658715026657
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3435427744480007
"cameras/drone/drone0" SET Transform localPosition (-0.31253694321263603 0.3855074514099756 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.076773174986046 1.134936097066116 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 10 -6)
"cameras/drone/drone0" SET Transform localScale (0.9075155474934727 0.9075155474934727 0.9075155474934727)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 18 -20)
"cameras/drone/drone1" SET Transform localScale (0.9182905111392057 0.9182905111392057 0.9182905111392057)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.48151440130488 0)
"cameras" SET Transform eulerAngles (-10.708349754868799 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2097316115231198
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8808420989645733
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09274372691456852
"cameras/drone/drone0" SET Transform localPosition (-0.07909963007643972 0.28218503416168056 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8984481695134205 1.0559541975880509 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -2 -10)
"cameras/drone/drone0" SET Transform localScale (1.0582570080602454 1.0582570080602454 1.0582570080602454)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -11 4)
"cameras/drone/drone1" SET Transform localScale (1.217858771439134 1.217858771439134 1.217858771439134)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.348833132455933 0)
"cameras" SET Transform eulerAngles (8.281706426377585 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8671419499020325
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6483520340667928
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08624357070654716
"cameras/drone/drone0" SET Transform localPosition (1.0580023055131724 0.22823302302754395 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9202652221598793 1.1204222332397094 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 4 19)
"cameras/drone/drone0" SET Transform localScale (1.3222333503769086 1.3222333503769086 1.3222333503769086)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -20 6)
"cameras/drone/drone1" SET Transform localScale (0.839559980643111 0.839559980643111 0.839559980643111)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6562622476188196 0)
"cameras" SET Transform eulerAngles (-2.1311142761053326 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4569898120003297
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9850052175828515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.024006293639562994
"cameras/drone/drone0" SET Transform localPosition (-0.7764666855009388 0.30593219441026326 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1028100172171402 0.8854098405872799 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -4 3)
"cameras/drone/drone0" SET Transform localScale (1.2804315439370133 1.2804315439370133 1.2804315439370133)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -12 12)
"cameras/drone/drone1" SET Transform localScale (0.8118459241724472 0.8118459241724472 0.8118459241724472)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.771284602059578 0)
"cameras" SET Transform eulerAngles (10.662704104683804 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5779605917569043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9900235532487567
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.310661556186247
"cameras/drone/drone0" SET Transform localPosition (-0.3690080130576434 0.5833258500817549 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7844173195265218 0.9978169795453142 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 13 10)
"cameras/drone/drone0" SET Transform localScale (0.6042805857856929 0.6042805857856929 0.6042805857856929)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 10 8)
"cameras/drone/drone1" SET Transform localScale (1.0821820790865757 1.0821820790865757 1.0821820790865757)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.323326277946886 0)
"cameras" SET Transform eulerAngles (4.600247470606096 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3957115910491902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.590504047952145
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22190447097028987
"cameras/drone/drone0" SET Transform localPosition (1.1369222551172935 -0.023730067705727553 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0377365220230195 1.064387651647552 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 15 1)
"cameras/drone/drone0" SET Transform localScale (1.000069245042031 1.000069245042031 1.000069245042031)
"cameras/drone/drone1" SET Transform localEulerAngles (1 8 0)
"cameras/drone/drone1" SET Transform localScale (0.7480747137820003 0.7480747137820003 0.7480747137820003)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.176276979340887 0)
"cameras" SET Transform eulerAngles (8.647386018410913 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.035229256829839
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9692885777890208
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23134576293488
"cameras/drone/drone0" SET Transform localPosition (-1.0514133449538459 0.41900815563635857 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6270278882034026 1.247490318656421 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 10 16)
"cameras/drone/drone0" SET Transform localScale (1.4093852333381482 1.4093852333381482 1.4093852333381482)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -7 -20)
"cameras/drone/drone1" SET Transform localScale (1.3736948257767954 1.3736948257767954 1.3736948257767954)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6598255334266376 0)
"cameras" SET Transform eulerAngles (-2.247243098257524 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5212658504327146
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0068524165451014
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1020420834252282
"cameras/drone/drone0" SET Transform localPosition (0.8735834601184786 -0.09817290325915512 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8631207165176122 1.2883544838809815 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -17 17)
"cameras/drone/drone0" SET Transform localScale (1.236144833235308 1.236144833235308 1.236144833235308)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 12 -12)
"cameras/drone/drone1" SET Transform localScale (0.7501997505382327 0.7501997505382327 0.7501997505382327)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3221241258340894 0)
"cameras" SET Transform eulerAngles (-15.065786447949652 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4421483912985305
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4500641877719258
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.020655321967784968
"cameras/drone/drone0" SET Transform localPosition (-0.6036113849424503 -0.006579885686216758 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5556029283475354 1.098780761536859 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 14 5)
"cameras/drone/drone0" SET Transform localScale (0.9461296495439573 0.9461296495439573 0.9461296495439573)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -13 -7)
"cameras/drone/drone1" SET Transform localScale (0.7052604719521001 0.7052604719521001 0.7052604719521001)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.201070385116805 0)
"cameras" SET Transform eulerAngles (-15.645271834017542 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5002773577120605
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.552814019182505
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.026261525957807355
"cameras/drone/drone0" SET Transform localPosition (0.4516601241159268 0.5960214404130642 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9245369019422308 0.9024924876027796 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -18 6)
"cameras/drone/drone0" SET Transform localScale (1.3368003230561891 1.3368003230561891 1.3368003230561891)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -10 -2)
"cameras/drone/drone1" SET Transform localScale (1.4821084768282642 1.4821084768282642 1.4821084768282642)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7128003150085345 0)
"cameras" SET Transform eulerAngles (14.245968534063799 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.449925820906131
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0536846413003007
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1187836561193386
"cameras/drone/drone0" SET Transform localPosition (0.9156881996517139 -0.06211470465749552 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28223667561426624 0.816348853373889 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -4 -17)
"cameras/drone/drone0" SET Transform localScale (0.8219876713755702 0.8219876713755702 0.8219876713755702)
"cameras/drone/drone1" SET Transform localEulerAngles (12 13 13)
"cameras/drone/drone1" SET Transform localScale (0.9857290300749195 0.9857290300749195 0.9857290300749195)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.856275326020558 0)
"cameras" SET Transform eulerAngles (-7.687024152861785 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5938407209171267
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9117861221612964
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21004503187748613
"cameras/drone/drone0" SET Transform localPosition (-0.7679505287571533 0.144297600057042 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8371467088879745 0.8974200006461464 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 2 -18)
"cameras/drone/drone0" SET Transform localScale (0.7945563037151846 0.7945563037151846 0.7945563037151846)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 6 -18)
"cameras/drone/drone1" SET Transform localScale (0.7029924405219506 0.7029924405219506 0.7029924405219506)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0289623430467145 0)
"cameras" SET Transform eulerAngles (-16.693430414669276 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6991122145434683
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.875532600756821
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3190141866386764
"cameras/drone/drone0" SET Transform localPosition (-0.40852117846742575 -0.17704106060051866 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5677030297012735 1.065557465752257 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 15 7)
"cameras/drone/drone0" SET Transform localScale (1.3710965152090377 1.3710965152090377 1.3710965152090377)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -11 -6)
"cameras/drone/drone1" SET Transform localScale (0.6125571374133371 0.6125571374133371 0.6125571374133371)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.51468892999406 0)
"cameras" SET Transform eulerAngles (16.69342942606842 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5770331421836405
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0334494688599194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28224764953167464
"cameras/drone/drone0" SET Transform localPosition (0.037265142340820345 0.6236556097810577 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7772995868537778 1.2102612474803347 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -14 -3)
"cameras/drone/drone0" SET Transform localScale (1.361513511456303 1.361513511456303 1.361513511456303)
"cameras/drone/drone1" SET Transform localEulerAngles (6 17 9)
"cameras/drone/drone1" SET Transform localScale (1.211715149285257 1.211715149285257 1.211715149285257)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.544945378272081 0)
"cameras" SET Transform eulerAngles (6.269096137438829 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2445608769713996
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6310321296672399
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30019530216813495
"cameras/drone/drone0" SET Transform localPosition (-0.48653926780847534 0.3955888281986765 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8007009389376065 1.2368062706892575 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -17 1)
"cameras/drone/drone0" SET Transform localScale (0.6498235150256113 0.6498235150256113 0.6498235150256113)
"cameras/drone/drone1" SET Transform localEulerAngles (19 4 20)
"cameras/drone/drone1" SET Transform localScale (0.799459057946595 0.799459057946595 0.799459057946595)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.183831317661435 0)
"cameras" SET Transform eulerAngles (-10.968110240898481 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.550209695770286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9928216836482756
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3255813269894112
"cameras/drone/drone0" SET Transform localPosition (0.9348544536217307 -0.1996823716602411 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.160843680340551 1.2049203883560302 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 16 3)
"cameras/drone/drone0" SET Transform localScale (0.7059035309335008 0.7059035309335008 0.7059035309335008)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 11 -14)
"cameras/drone/drone1" SET Transform localScale (1.127128479456763 1.127128479456763 1.127128479456763)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.180017576715714 0)
"cameras" SET Transform eulerAngles (13.936221509081108 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4411428045209282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4590242261997042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.00018386097183134
"cameras/drone/drone0" SET Transform localPosition (-0.26036713552940927 -0.07379886734371782 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.456436249798281 1.1108709075649363 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -3 15)
"cameras/drone/drone0" SET Transform localScale (1.1963511001987803 1.1963511001987803 1.1963511001987803)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -13 -8)
"cameras/drone/drone1" SET Transform localScale (0.796399080753459 0.796399080753459 0.796399080753459)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.603468580366768 0)
"cameras" SET Transform eulerAngles (-5.62037356134114 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.17397498210673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.06018116484931
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.312133083281968
"cameras/drone/drone0" SET Transform localPosition (-0.23659996830146102 0.1542864474268843 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.164388199362876 0.8406636892556086 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 3 -4)
"cameras/drone/drone0" SET Transform localScale (1.0707326333784055 1.0707326333784055 1.0707326333784055)
"cameras/drone/drone1" SET Transform localEulerAngles (15 0 -7)
"cameras/drone/drone1" SET Transform localScale (1.2729995160978653 1.2729995160978653 1.2729995160978653)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.887765537392972 0)
"cameras" SET Transform eulerAngles (-13.259049881062563 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1749720153078829
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1263416011538334
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.336220946072227
"cameras/drone/drone0" SET Transform localPosition (-0.13820909490804723 -0.25228638134286047 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7597716484225989 1.2754055954498495 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -9 17)
"cameras/drone/drone0" SET Transform localScale (0.6732369430987462 0.6732369430987462 0.6732369430987462)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -6 3)
"cameras/drone/drone1" SET Transform localScale (0.9511965095814761 0.9511965095814761 0.9511965095814761)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.13190700494217 0)
"cameras" SET Transform eulerAngles (10.234150808710346 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5615289011405501
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9281783468239638
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13503333941231271
"cameras/drone/drone0" SET Transform localPosition (0.4617200594135711 -0.2511707495908047 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5173908620759746 0.9105544416051623 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 16 16)
"cameras/drone/drone0" SET Transform localScale (1.2067705404356008 1.2067705404356008 1.2067705404356008)
"cameras/drone/drone1" SET Transform localEulerAngles (6 7 11)
"cameras/drone/drone1" SET Transform localScale (1.1368503332254725 1.1368503332254725 1.1368503332254725)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.389706600093868 0)
"cameras" SET Transform eulerAngles (10.547384671464034 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6955947593427365
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4383233568967753
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05860193596637156
"cameras/drone/drone0" SET Transform localPosition (-1.0835698907573015 0.689130800368678 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4660378102398961 1.0014328499805554 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -17 15)
"cameras/drone/drone0" SET Transform localScale (0.8886781934268135 0.8886781934268135 0.8886781934268135)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -1 -20)
"cameras/drone/drone1" SET Transform localScale (0.9082787730361006 0.9082787730361006 0.9082787730361006)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.861264533449157 0)
"cameras" SET Transform eulerAngles (-8.127676768055604 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4492450913123691
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7760659202165403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11571737680770373
"cameras/drone/drone0" SET Transform localPosition (-1.1956237597213855 0.3410763211962184 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.32097006435965025 1.0870750659558859 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -18 -6)
"cameras/drone/drone0" SET Transform localScale (1.2297283094744966 1.2297283094744966 1.2297283094744966)
"cameras/drone/drone1" SET Transform localEulerAngles (10 8 10)
"cameras/drone/drone1" SET Transform localScale (1.2155334613599105 1.2155334613599105 1.2155334613599105)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.433993383861773 0)
"cameras" SET Transform eulerAngles (19.191968670393727 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9082791833555653
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8761342393465088
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3616542906336901
"cameras/drone/drone0" SET Transform localPosition (-0.5478715767451275 0.3585573736535747 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6734793888955515 0.8333477305736807 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 8 9)
"cameras/drone/drone0" SET Transform localScale (0.8582849091244433 0.8582849091244433 0.8582849091244433)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -10 -5)
"cameras/drone/drone1" SET Transform localScale (1.3099347409373885 1.3099347409373885 1.3099347409373885)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4311846058011675 0)
"cameras" SET Transform eulerAngles (-4.986347016744963 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5003312236198999
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9040535342489091
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12657710450923929
"cameras/drone/drone0" SET Transform localPosition (-0.9532075121741141 0.36615308132768704 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5230776097505163 1.0354440510648641 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -16 -18)
"cameras/drone/drone0" SET Transform localScale (0.8236653990663356 0.8236653990663356 0.8236653990663356)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -3 -15)
"cameras/drone/drone1" SET Transform localScale (0.8182484772054345 0.8182484772054345 0.8182484772054345)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.534564242991485 0)
"cameras" SET Transform eulerAngles (-17.067393213050913 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.499559246592053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9661147255359652
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17459776689580916
"cameras/drone/drone0" SET Transform localPosition (-0.17499969959454553 0.5955978581560526 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6344972861875504 0.8166520934460326 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -14 14)
"cameras/drone/drone0" SET Transform localScale (1.4861920401814328 1.4861920401814328 1.4861920401814328)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -12 6)
"cameras/drone/drone1" SET Transform localScale (1.3385124419461167 1.3385124419461167 1.3385124419461167)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6791520270372944 0)
"cameras" SET Transform eulerAngles (2.2608107921067884 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0337919156593989
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6945574917919437
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03562985630083069
"cameras/drone/drone0" SET Transform localPosition (1.0649756916162205 0.007490462251675101 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.22504143585370584 0.9749115246331563 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -3 9)
"cameras/drone/drone0" SET Transform localScale (1.4716275420338896 1.4716275420338896 1.4716275420338896)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -5 -15)
"cameras/drone/drone1" SET Transform localScale (1.4886906669863365 1.4886906669863365 1.4886906669863365)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2348657350186345 0)
"cameras" SET Transform eulerAngles (17.093712205056704 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41377543417476675
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9759206750259778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2362364061361625
"cameras/drone/drone0" SET Transform localPosition (1.085669481425694 0.3672239629405866 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16627596544050594 0.9805593452831065 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 12 8)
"cameras/drone/drone0" SET Transform localScale (1.1584789446174013 1.1584789446174013 1.1584789446174013)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -19 -13)
"cameras/drone/drone1" SET Transform localScale (0.9946199174093613 0.9946199174093613 0.9946199174093613)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2747933748511215 0)
"cameras" SET Transform eulerAngles (-19.166820651603025 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8664747757333535
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9162895347574046
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08603143061994026
"cameras/drone/drone0" SET Transform localPosition (0.7450652580758681 0.6300964344527451 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6665059185075954 0.9687018675626902 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -18 6)
"cameras/drone/drone0" SET Transform localScale (0.7286228471393142 0.7286228471393142 0.7286228471393142)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -2 5)
"cameras/drone/drone1" SET Transform localScale (1.029064653883847 1.029064653883847 1.029064653883847)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6885104209542954 0)
"cameras" SET Transform eulerAngles (-8.8439307017505 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6454231474513441
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6282652782152331
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3368099319417012
"cameras/drone/drone0" SET Transform localPosition (-0.9899352653633839 0.11658076202181095 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8317003808256589 0.8396568060408427 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 10 -5)
"cameras/drone/drone0" SET Transform localScale (1.3940673220089692 1.3940673220089692 1.3940673220089692)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -14 -10)
"cameras/drone/drone1" SET Transform localScale (0.9938774314624321 0.9938774314624321 0.9938774314624321)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7592155098948252 0)
"cameras" SET Transform eulerAngles (-12.14564737304773 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41399844322459695
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8651586453667357
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2739315207356032
"cameras/drone/drone0" SET Transform localPosition (0.2408958415344873 0.6021315604353146 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8174406180993152 1.2865792899588444 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 16 -20)
"cameras/drone/drone0" SET Transform localScale (0.9617555563140645 0.9617555563140645 0.9617555563140645)
"cameras/drone/drone1" SET Transform localEulerAngles (16 19 9)
"cameras/drone/drone1" SET Transform localScale (0.9268913443164775 0.9268913443164775 0.9268913443164775)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.689768848364295 0)
"cameras" SET Transform eulerAngles (-7.098770723309613 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6044552514760259
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9484694967533306
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20099996652144114
"cameras/drone/drone0" SET Transform localPosition (0.10274802725097731 0.5404976567379902 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.26592833852969466 0.9408616320669461 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -10 15)
"cameras/drone/drone0" SET Transform localScale (1.0593757483434465 1.0593757483434465 1.0593757483434465)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -16 12)
"cameras/drone/drone1" SET Transform localScale (1.4211567766634232 1.4211567766634232 1.4211567766634232)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4407745806683008 0)
"cameras" SET Transform eulerAngles (-18.716490204056925 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8438639219781252
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7599570653493068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03216893232680418
"cameras/drone/drone0" SET Transform localPosition (0.21947052979986736 0.07743383208998206 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.15750329442655442 1.105270052972404 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 4 16)
"cameras/drone/drone0" SET Transform localScale (0.8439656651643748 0.8439656651643748 0.8439656651643748)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 19 -5)
"cameras/drone/drone1" SET Transform localScale (0.8966921361062223 0.8966921361062223 0.8966921361062223)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1197813664388154 0)
"cameras" SET Transform eulerAngles (5.853842635597964 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2615341120761006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1533321436077508
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29291548765670095
"cameras/drone/drone0" SET Transform localPosition (1.0658022578019228 -0.2959792527503074 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6400099867199736 1.044818594295363 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -9 -17)
"cameras/drone/drone0" SET Transform localScale (0.6055815278665744 0.6055815278665744 0.6055815278665744)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 4 -5)
"cameras/drone/drone1" SET Transform localScale (0.6979017527339463 0.6979017527339463 0.6979017527339463)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.052646577630606 0)
"cameras" SET Transform eulerAngles (-8.13650554866452 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4429977448634048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9084025961175701
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30012122539152425
"cameras/drone/drone0" SET Transform localPosition (0.9689083597326593 0.3623444723481643 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4414200113240969 0.8971367280891165 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 10 10)
"cameras/drone/drone0" SET Transform localScale (0.73729817912314 0.73729817912314 0.73729817912314)
"cameras/drone/drone1" SET Transform localEulerAngles (12 18 11)
"cameras/drone/drone1" SET Transform localScale (1.4003247195159867 1.4003247195159867 1.4003247195159867)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.477450125625999 0)
"cameras" SET Transform eulerAngles (2.1633353686392276 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9963202032271435
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1603308031982957
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.195316006633526
"cameras/drone/drone0" SET Transform localPosition (0.9117281476929604 0.21016701752752548 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10142528157290087 1.2833294691284518 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -4 19)
"cameras/drone/drone0" SET Transform localScale (1.4295427527023123 1.4295427527023123 1.4295427527023123)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -15 -13)
"cameras/drone/drone1" SET Transform localScale (0.8647367415643703 0.8647367415643703 0.8647367415643703)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7209923145244885 0)
"cameras" SET Transform eulerAngles (11.554993176087287 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.538813276674464
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1904802809284978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31838112738157004
"cameras/drone/drone0" SET Transform localPosition (0.936264817776 0.3351308984103177 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9316066768101975 1.0855488245191687 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -18 -2)
"cameras/drone/drone0" SET Transform localScale (0.7155957916176664 0.7155957916176664 0.7155957916176664)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -8 13)
"cameras/drone/drone1" SET Transform localScale (0.8537034531972811 0.8537034531972811 0.8537034531972811)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.001303169395051 0)
"cameras" SET Transform eulerAngles (1.438965408677717 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8702802668328842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9230047297669906
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3592808925925461
"cameras/drone/drone0" SET Transform localPosition (-0.3857764140658818 0.18387813205249776 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0723906081614152 1.2848091329714901 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 1 -12)
"cameras/drone/drone0" SET Transform localScale (0.7795963329247768 0.7795963329247768 0.7795963329247768)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 11 3)
"cameras/drone/drone1" SET Transform localScale (0.7687318948748505 0.7687318948748505 0.7687318948748505)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.794956950748926 0)
"cameras" SET Transform eulerAngles (11.061211188398723 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4691334000802634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9422707423325472
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32450154882051563
"cameras/drone/drone0" SET Transform localPosition (0.24988127157389028 -0.044940503549848965 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9266994080078946 0.9498886756757333 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 2 -18)
"cameras/drone/drone0" SET Transform localScale (0.6693907172524155 0.6693907172524155 0.6693907172524155)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -20 -9)
"cameras/drone/drone1" SET Transform localScale (1.2027708111458204 1.2027708111458204 1.2027708111458204)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2728960393817204 0)
"cameras" SET Transform eulerAngles (-10.53164861717773 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5687142397434994
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8856927502111718
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1238502668338152
"cameras/drone/drone0" SET Transform localPosition (0.4047647185915131 0.5389491852123993 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7557698201178171 1.2963033809600182 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -8 10)
"cameras/drone/drone0" SET Transform localScale (0.9303347351230546 0.9303347351230546 0.9303347351230546)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 18 9)
"cameras/drone/drone1" SET Transform localScale (1.2132448486414615 1.2132448486414615 1.2132448486414615)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.031884895516267 0)
"cameras" SET Transform eulerAngles (8.789070253096316 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4157576144670099
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1182677245128227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31137577412530393
"cameras/drone/drone0" SET Transform localPosition (0.17287344594566045 -0.2509527511419452 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7457493248855116 1.1197664327948011 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 19 -15)
"cameras/drone/drone0" SET Transform localScale (0.9362932523466428 0.9362932523466428 0.9362932523466428)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 8 10)
"cameras/drone/drone1" SET Transform localScale (1.0952915669382275 1.0952915669382275 1.0952915669382275)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1506332320113914 0)
"cameras" SET Transform eulerAngles (-3.07851404434701 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0548745238444242
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8541070872115717
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27634877060198787
"cameras/drone/drone0" SET Transform localPosition (-0.19479808062357984 0.40684461844174896 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0440525619665029 1.2481429801215689 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -13 14)
"cameras/drone/drone0" SET Transform localScale (1.0068538426248386 1.0068538426248386 1.0068538426248386)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -15 -15)
"cameras/drone/drone1" SET Transform localScale (0.8996516979748873 0.8996516979748873 0.8996516979748873)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.817939105640043 0)
"cameras" SET Transform eulerAngles (16.960181004129332 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.615240220866961
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4781014973398072
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12952410726212404
"cameras/drone/drone0" SET Transform localPosition (-0.48174263476748214 0.1683035549257919 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6507002898954509 0.8552025043108542 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 3 10)
"cameras/drone/drone0" SET Transform localScale (0.8462705501303123 0.8462705501303123 0.8462705501303123)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 6 -7)
"cameras/drone/drone1" SET Transform localScale (0.6407446708957453 0.6407446708957453 0.6407446708957453)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.874334379755137 0)
"cameras" SET Transform eulerAngles (-4.5676137831254096 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8141929799686323
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6498919414187911
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11421527292476608
"cameras/drone/drone0" SET Transform localPosition (-0.12058789297938288 -0.04055155408376737 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37957708786754385 0.9678026139528686 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 9 8)
"cameras/drone/drone0" SET Transform localScale (0.61996801291908 0.61996801291908 0.61996801291908)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -4 16)
"cameras/drone/drone1" SET Transform localScale (1.479227634455087 1.479227634455087 1.479227634455087)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.497633751354417 0)
"cameras" SET Transform eulerAngles (12.384903573870275 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4847386160742877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8174323029229735
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3310482670272441
"cameras/drone/drone0" SET Transform localPosition (-1.0883448614160098 0.6834562348179967 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1263055663980512 0.9724879429080144 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -13 12)
"cameras/drone/drone0" SET Transform localScale (0.7383915528024576 0.7383915528024576 0.7383915528024576)
"cameras/drone/drone1" SET Transform localEulerAngles (5 6 -13)
"cameras/drone/drone1" SET Transform localScale (0.7446881790377486 0.7446881790377486 0.7446881790377486)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.533478294577269 0)
"cameras" SET Transform eulerAngles (-17.4397319686652 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9316889161680072
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.957024691462979
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15893812525875486
"cameras/drone/drone0" SET Transform localPosition (0.7596720452533774 0.11685475360711267 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18633309843131052 0.8975386186174983 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 15 -20)
"cameras/drone/drone0" SET Transform localScale (0.8345736984526766 0.8345736984526766 0.8345736984526766)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -11 15)
"cameras/drone/drone1" SET Transform localScale (0.8588295887889266 0.8588295887889266 0.8588295887889266)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1051465755998375 0)
"cameras" SET Transform eulerAngles (14.610351071764363 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9992014573053193
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8698693502385964
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26954394394079756
"cameras/drone/drone0" SET Transform localPosition (1.0155900300243454 0.5531017290662219 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2237972079835795 0.811630562007229 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -6 15)
"cameras/drone/drone0" SET Transform localScale (1.253183853385453 1.253183853385453 1.253183853385453)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 5 -18)
"cameras/drone/drone1" SET Transform localScale (0.8672968708457867 0.8672968708457867 0.8672968708457867)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.786814008799969 0)
"cameras" SET Transform eulerAngles (-8.522115095567887 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2602288845529572
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9525200524586049
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21198023688058668
"cameras/drone/drone0" SET Transform localPosition (-0.8869876605639038 0.30559698431226484 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8067418894784726 0.8692230625404778 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 3 -13)
"cameras/drone/drone0" SET Transform localScale (1.3674131689151592 1.3674131689151592 1.3674131689151592)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -10 0)
"cameras/drone/drone1" SET Transform localScale (0.6125836170366192 0.6125836170366192 0.6125836170366192)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.071601247234849 0)
"cameras" SET Transform eulerAngles (13.73461009741655 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4426201302833581
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6073905175295227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06598191737591334
"cameras/drone/drone0" SET Transform localPosition (-0.15295677548330366 0.11126222304265637 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2731277319500034 0.8235163476643153 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -4 4)
"cameras/drone/drone0" SET Transform localScale (1.1135542124017626 1.1135542124017626 1.1135542124017626)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -16 1)
"cameras/drone/drone1" SET Transform localScale (0.7488396882281381 0.7488396882281381 0.7488396882281381)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.391805026535503 0)
"cameras" SET Transform eulerAngles (6.646930809143026 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.463532469763336
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4340830395398276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13003755610388468
"cameras/drone/drone0" SET Transform localPosition (0.12230924088584616 0.6979498195771616 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.30509475293377886 1.1799464171934961 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 14 1)
"cameras/drone/drone0" SET Transform localScale (1.1136837191326774 1.1136837191326774 1.1136837191326774)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 6 -19)
"cameras/drone/drone1" SET Transform localScale (1.3820792055942928 1.3820792055942928 1.3820792055942928)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.091586866445826 0)
"cameras" SET Transform eulerAngles (-8.67365088732457 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.942729236699566
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.413205873585803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19089191931498972
"cameras/drone/drone0" SET Transform localPosition (0.44155803420540973 0.29345523852926375 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.28606729502402384 1.0797289342398366 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 15 18)
"cameras/drone/drone0" SET Transform localScale (1.1858061344926454 1.1858061344926454 1.1858061344926454)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 0 5)
"cameras/drone/drone1" SET Transform localScale (1.1573314071551972 1.1573314071551972 1.1573314071551972)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.25475293430827 0)
"cameras" SET Transform eulerAngles (0.7096113631249246 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7375527153874322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4307345972277623
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.060133045579645966
"cameras/drone/drone0" SET Transform localPosition (0.24616431254010784 0.6603580246346177 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.38686678815179 1.068524671664255 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -10 1)
"cameras/drone/drone0" SET Transform localScale (0.7472971539766554 0.7472971539766554 0.7472971539766554)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -18 -18)
"cameras/drone/drone1" SET Transform localScale (1.4718487098791333 1.4718487098791333 1.4718487098791333)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.816297029901449 0)
"cameras" SET Transform eulerAngles (-15.289440812603265 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0459293039061666
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8305259112441883
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29718587762063214
"cameras/drone/drone0" SET Transform localPosition (0.10206420910241132 -0.02927318269179996 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7633104920195688 0.8286294542165892 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -3 3)
"cameras/drone/drone0" SET Transform localScale (0.6352188369387046 0.6352188369387046 0.6352188369387046)
"cameras/drone/drone1" SET Transform localEulerAngles (13 16 3)
"cameras/drone/drone1" SET Transform localScale (0.8726236947541497 0.8726236947541497 0.8726236947541497)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1993161254178046 0)
"cameras" SET Transform eulerAngles (16.421317061875754 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0486371091007283
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7713544797021608
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18980182447099933
"cameras/drone/drone0" SET Transform localPosition (0.29209856872027506 0.22084252814712418 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1457419296300131 0.877485218609485 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 20 -13)
"cameras/drone/drone0" SET Transform localScale (1.25940422723197 1.25940422723197 1.25940422723197)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 8 2)
"cameras/drone/drone1" SET Transform localScale (0.926085114071779 0.926085114071779 0.926085114071779)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.397609954848992 0)
"cameras" SET Transform eulerAngles (-12.444566498438938 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.518577368864664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.474114668663602
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05569325309270386
"cameras/drone/drone0" SET Transform localPosition (0.48928000490336965 0.41018641172469045 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.390193353336281 1.0945933040871294 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 3 -12)
"cameras/drone/drone0" SET Transform localScale (0.8924277837713676 0.8924277837713676 0.8924277837713676)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -15 -9)
"cameras/drone/drone1" SET Transform localScale (0.7920046148520837 0.7920046148520837 0.7920046148520837)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1161902280336395 0)
"cameras" SET Transform eulerAngles (-9.469713926453803 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0025976582174927
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9846339184769993
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38618583610591684
"cameras/drone/drone0" SET Transform localPosition (0.4693353475633444 0.011142557479753623 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5273647005810369 0.8848824923697322 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 10 -19)
"cameras/drone/drone0" SET Transform localScale (1.1954039987250495 1.1954039987250495 1.1954039987250495)
"cameras/drone/drone1" SET Transform localEulerAngles (0 17 -19)
"cameras/drone/drone1" SET Transform localScale (0.801110946001896 0.801110946001896 0.801110946001896)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.381371578020636 0)
"cameras" SET Transform eulerAngles (-16.75791889949078 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4620603244580957
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1124858095060204
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3801341141292035
"cameras/drone/drone0" SET Transform localPosition (-0.972972809827532 0.2932990109659351 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.10551035177534729 1.076390887526009 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -6 16)
"cameras/drone/drone0" SET Transform localScale (1.2846010281769942 1.2846010281769942 1.2846010281769942)
"cameras/drone/drone1" SET Transform localEulerAngles (17 5 0)
"cameras/drone/drone1" SET Transform localScale (1.092254730116763 1.092254730116763 1.092254730116763)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7209352019582353 0)
"cameras" SET Transform eulerAngles (-9.105096031355684 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9295898962837333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.243831747823772
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.049092066298812444
"cameras/drone/drone0" SET Transform localPosition (-0.43686844566102645 0.2688205967056277 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1638253703950776 1.2003472491396228 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -12 4)
"cameras/drone/drone0" SET Transform localScale (1.3957767739076443 1.3957767739076443 1.3957767739076443)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -17 2)
"cameras/drone/drone1" SET Transform localScale (1.3225900454710455 1.3225900454710455 1.3225900454710455)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.777763474267034 0)
"cameras" SET Transform eulerAngles (14.889529933282759 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8975642207809722
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8608523724256694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18268971028984415
"cameras/drone/drone0" SET Transform localPosition (0.9941273037291551 -0.29975742346677486 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.682280626302448 0.9404995280547354 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 7 -4)
"cameras/drone/drone0" SET Transform localScale (1.2641599802438046 1.2641599802438046 1.2641599802438046)
"cameras/drone/drone1" SET Transform localEulerAngles (17 1 8)
"cameras/drone/drone1" SET Transform localScale (0.8740584068841442 0.8740584068841442 0.8740584068841442)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.213143162707171 0)
"cameras" SET Transform eulerAngles (-13.46120073811758 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1760119224610832
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5071276164178886
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25480146627401623
"cameras/drone/drone0" SET Transform localPosition (-0.37241439169800983 -0.24598019524148312 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7104165886827339 0.9083625813584214 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -2 7)
"cameras/drone/drone0" SET Transform localScale (0.7014749807376861 0.7014749807376861 0.7014749807376861)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -9 -11)
"cameras/drone/drone1" SET Transform localScale (0.8673484162585143 0.8673484162585143 0.8673484162585143)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9888241552022263 0)
"cameras" SET Transform eulerAngles (8.668236425684928 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5641017363358531
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0083368184033417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2565785878310105
"cameras/drone/drone0" SET Transform localPosition (-0.7629958700967046 -0.28158239963599146 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.049742416038030424 0.9934341371335893 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 6 -13)
"cameras/drone/drone0" SET Transform localScale (1.0683048053510669 1.0683048053510669 1.0683048053510669)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -6 -3)
"cameras/drone/drone1" SET Transform localScale (0.8034420283482236 0.8034420283482236 0.8034420283482236)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.77371528323895 0)
"cameras" SET Transform eulerAngles (-8.280207076195808 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1864606100228388
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0889074640097072
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.395139170160405
"cameras/drone/drone0" SET Transform localPosition (0.5410356894992785 -0.08745663717049584 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5475660432306616 1.2953972047010702 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 15 -5)
"cameras/drone/drone0" SET Transform localScale (1.0372971818821604 1.0372971818821604 1.0372971818821604)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 18 -13)
"cameras/drone/drone1" SET Transform localScale (1.3730150528573324 1.3730150528573324 1.3730150528573324)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.910606547684051 0)
"cameras" SET Transform eulerAngles (-15.029501688274207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8686212574998492
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9509654299723096
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16835365332549848
"cameras/drone/drone0" SET Transform localPosition (-0.6706934128897137 -0.10165683956454591 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.34745162242384353 1.0026504586169311 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -17 -19)
"cameras/drone/drone0" SET Transform localScale (1.3149093207308473 1.3149093207308473 1.3149093207308473)
"cameras/drone/drone1" SET Transform localEulerAngles (5 12 -11)
"cameras/drone/drone1" SET Transform localScale (0.7574748201125026 0.7574748201125026 0.7574748201125026)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.862641030444615 0)
"cameras" SET Transform eulerAngles (-10.60074428492273 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.699463860967338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9296438293295053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.034594869587545096
"cameras/drone/drone0" SET Transform localPosition (-0.6074901270197094 -0.0435456380442058 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12719687804487823 0.8985532049816678 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 11 17)
"cameras/drone/drone0" SET Transform localScale (1.0552414220042565 1.0552414220042565 1.0552414220042565)
"cameras/drone/drone1" SET Transform localEulerAngles (19 5 -3)
"cameras/drone/drone1" SET Transform localScale (0.7227052399301345 0.7227052399301345 0.7227052399301345)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.496417306416137 0)
"cameras" SET Transform eulerAngles (-1.9853601300240165 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0823371461106437
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9895340913544637
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09521437678498385
"cameras/drone/drone0" SET Transform localPosition (-0.4787555423149147 -0.11770754291205837 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7215953879618799 1.2452419451089847 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -9 -12)
"cameras/drone/drone0" SET Transform localScale (0.7371686838835321 0.7371686838835321 0.7371686838835321)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -20 0)
"cameras/drone/drone1" SET Transform localScale (1.171657986664496 1.171657986664496 1.171657986664496)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.056662760308077 0)
"cameras" SET Transform eulerAngles (-16.384914498549826 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9314688652474014
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6629892680257634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22986868105250174
"cameras/drone/drone0" SET Transform localPosition (-0.6055282188178862 0.0781924680344272 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5481540491314922 1.2516474996507032 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -18 -7)
"cameras/drone/drone0" SET Transform localScale (0.7656348446125475 0.7656348446125475 0.7656348446125475)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -17 -12)
"cameras/drone/drone1" SET Transform localScale (0.9368825567760176 0.9368825567760176 0.9368825567760176)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1990373950028306 0)
"cameras" SET Transform eulerAngles (19.099882028101987 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5862337570619784
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.029480900705612
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1331417456563786
"cameras/drone/drone0" SET Transform localPosition (-1.0016394740767356 -0.20991407814570423 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7149780610597294 0.8185314666141066 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 0 -7)
"cameras/drone/drone0" SET Transform localScale (0.9598155904156745 0.9598155904156745 0.9598155904156745)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -8 2)
"cameras/drone/drone1" SET Transform localScale (0.9335642521209926 0.9335642521209926 0.9335642521209926)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.696431560534455 0)
"cameras" SET Transform eulerAngles (8.424476932881277 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49771187781171133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2345385133096962
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15059457144381702
"cameras/drone/drone0" SET Transform localPosition (1.081356101363535 -0.17950263908165603 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5748825481676942 0.8404216956661812 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -4 -20)
"cameras/drone/drone0" SET Transform localScale (0.9648268021125793 0.9648268021125793 0.9648268021125793)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -19 -3)
"cameras/drone/drone1" SET Transform localScale (1.3318018408393772 1.3318018408393772 1.3318018408393772)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.78806149147782 0)
"cameras" SET Transform eulerAngles (19.828183578705804 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6991308409192158
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3837666926979304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39456517438403876
"cameras/drone/drone0" SET Transform localPosition (0.33235834205366843 0.6927267578926051 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17210685057656416 1.2923253457974286 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -20 4)
"cameras/drone/drone0" SET Transform localScale (0.9736002075643382 0.9736002075643382 0.9736002075643382)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 12 -3)
"cameras/drone/drone1" SET Transform localScale (1.1232630966749917 1.1232630966749917 1.1232630966749917)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5168022189084414 0)
"cameras" SET Transform eulerAngles (-7.134243678478738 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2705441441876668
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0910890828442108
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37411710268208737
"cameras/drone/drone0" SET Transform localPosition (-1.0905376027216915 0.24811858413409255 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24490084659818767 1.1003025333709484 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -10 -17)
"cameras/drone/drone0" SET Transform localScale (0.9982031441748944 0.9982031441748944 0.9982031441748944)
"cameras/drone/drone1" SET Transform localEulerAngles (11 9 -9)
"cameras/drone/drone1" SET Transform localScale (0.8172493228635966 0.8172493228635966 0.8172493228635966)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8104783704413663 0)
"cameras" SET Transform eulerAngles (-5.557172895418319 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1414219633622222
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9443812888567251
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12525158591848098
"cameras/drone/drone0" SET Transform localPosition (0.11503251466363373 -0.11789823114507952 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7905200352004258 1.2094755024535164 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -17 -17)
"cameras/drone/drone0" SET Transform localScale (0.8943879601494316 0.8943879601494316 0.8943879601494316)
"cameras/drone/drone1" SET Transform localEulerAngles (14 11 17)
"cameras/drone/drone1" SET Transform localScale (1.3855677235615156 1.3855677235615156 1.3855677235615156)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.874409356762275 0)
"cameras" SET Transform eulerAngles (-0.03527173089748814 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3652910186020697
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2682593163367013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04394520592263018
"cameras/drone/drone0" SET Transform localPosition (-0.8510152510723064 0.6581328783414684 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.12449489771231 1.1963537844993326 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 1 15)
"cameras/drone/drone0" SET Transform localScale (1.2349048464893353 1.2349048464893353 1.2349048464893353)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 8 18)
"cameras/drone/drone1" SET Transform localScale (1.1110168069516437 1.1110168069516437 1.1110168069516437)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.413922196300693 0)
"cameras" SET Transform eulerAngles (4.064488007531896 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3418792422233348
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1339193030584034
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09670624254774057
"cameras/drone/drone0" SET Transform localPosition (0.1912757818963562 -0.29450437704932436 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3372143921625219 1.120708706567831 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -1 14)
"cameras/drone/drone0" SET Transform localScale (0.6835139983001889 0.6835139983001889 0.6835139983001889)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -5 16)
"cameras/drone/drone1" SET Transform localScale (1.2918239099197142 1.2918239099197142 1.2918239099197142)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.056964984051296 0)
"cameras" SET Transform eulerAngles (-16.951865959006444 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5371398457697651
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.984266019231646
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1949938765480539
"cameras/drone/drone0" SET Transform localPosition (0.8587050068205213 0.3773971356776718 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1465499422718801 1.1474688816121554 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -7 17)
"cameras/drone/drone0" SET Transform localScale (1.1844800303198721 1.1844800303198721 1.1844800303198721)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 17 -10)
"cameras/drone/drone1" SET Transform localScale (1.4252409661710101 1.4252409661710101 1.4252409661710101)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4751141375756767 0)
"cameras" SET Transform eulerAngles (15.752756348793298 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6698531294214184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3371046679504932
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14404461439853566
"cameras/drone/drone0" SET Transform localPosition (0.24174880069431937 -0.08593463818590114 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.869692203679995 1.2684509503537602 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 10 -20)
"cameras/drone/drone0" SET Transform localScale (1.0867939519693075 1.0867939519693075 1.0867939519693075)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -1 1)
"cameras/drone/drone1" SET Transform localScale (1.2270459660619353 1.2270459660619353 1.2270459660619353)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.334462733387326 0)
"cameras" SET Transform eulerAngles (-7.799176089241371 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0725880354216284
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3436728249767265
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1097321446620009
"cameras/drone/drone0" SET Transform localPosition (-0.6925846503203217 0.20666120335978694 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.811357505256739 1.02553328583522 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -11 -7)
"cameras/drone/drone0" SET Transform localScale (1.4144384698202448 1.4144384698202448 1.4144384698202448)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 15 14)
"cameras/drone/drone1" SET Transform localScale (1.106260594718997 1.106260594718997 1.106260594718997)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.566283344263937 0)
"cameras" SET Transform eulerAngles (8.321047412473742 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1389577027431292
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2350140876280216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2748944132241499
"cameras/drone/drone0" SET Transform localPosition (0.9332826555135212 0.4346195707121529 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6395103570094623 1.1451118401486953 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -4 -1)
"cameras/drone/drone0" SET Transform localScale (0.7984747171931958 0.7984747171931958 0.7984747171931958)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -9 -9)
"cameras/drone/drone1" SET Transform localScale (1.255104459618274 1.255104459618274 1.255104459618274)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
