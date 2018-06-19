CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
"Segmentation.Profile.instance" PUSH classes "Void" "drone0"
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors
"cameras/segmentation" SET SegmentationCamera transparencyCutout 0
"cameras/segmentation" SET Camera allowMSAA false allowHDR false near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Void->black" "drone0->red"
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "drone0"
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1536 1152 24 "ARGBFloat" "Default"
"cameras/segmentation" SET active true
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera Sensors.RenderCamera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true allowMSAA false 
CREATE RenderTexture 1536 1152 24 "ARGB32" "Default" AS "cameraRGB_RT"
"cameraRGB_RT" SET name "cameras/cameraRGB"
"cameraRGB_RT" EXECUTE @Create
"cameras/cameraRGB" SET Camera targetTexture "cameraRGB_RT"
"cameras/cameraRGB" SET Sensors.RenderCamera format "ARGB32" resolution (1536 1152) alwaysOn false
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB" "cameras/cameraRGB"
"EnviroSky" SET active true
[UI.Window] ShowFromRenderTexture "cameraRGB_RT" AS "cameraRGB"
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 21 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 96 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET Transform position (0 60 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/birds/container" SET active true
"spawner/animals/birds" SET active true
CREATE "spawner/cars/container"
"spawner/cars/container" SET active false
"spawner/cars/container" ADD RandomProps.Torus
"spawner/cars/container" ADD RandomProps.PropArea
"spawner/cars/container" SET RandomProps.PropArea tags "car"
"spawner/cars/container" SET RandomProps.PropArea async false numberOfProps 10 collisionCheck false stickToGround false 
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
"cameras" SET Transform eulerAngles (-0.5407166160898917 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 64
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.9119930401177445 0)
"cameras" SET Transform eulerAngles (5.232115931355107 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2567094141430581
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1721451124450397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3545413332633881
"cameras/drone/drone0" SET Transform localPosition (-0.783545824977443 0.4379335963208713 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.361239409001072 1.0372742925076577 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 7 -5)
"cameras/drone/drone0" SET Transform localScale (1.07507315012967 1.07507315012967 1.07507315012967)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -4 -13)
"cameras/drone/drone1" SET Transform localScale (0.7634721935886695 0.7634721935886695 0.7634721935886695)
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
"cameras" SET Transform position (0 3.3657254682961453 0)
"cameras" SET Transform eulerAngles (-19.183661310643302 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.343393763273251
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3096413479665845
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.053542470756503674
"cameras/drone/drone0" SET Transform localPosition (1.1359813351965495 0.3742157142270571 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1318696525884786 1.1896822171354278 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -5 -13)
"cameras/drone/drone0" SET Transform localScale (0.7160599779632084 0.7160599779632084 0.7160599779632084)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -19 13)
"cameras/drone/drone1" SET Transform localScale (0.8511677823889316 0.8511677823889316 0.8511677823889316)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.05421289065166 0)
"cameras" SET Transform eulerAngles (-12.652984657092418 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9268948344679387
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.536064051041926
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3584448047690158
"cameras/drone/drone0" SET Transform localPosition (-0.25242629541447403 0.3645001437474927 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0651811307774952 0.9864692092579366 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -10 -1)
"cameras/drone/drone0" SET Transform localScale (1.3874570464344003 1.3874570464344003 1.3874570464344003)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -2 -12)
"cameras/drone/drone1" SET Transform localScale (1.3818066973596945 1.3818066973596945 1.3818066973596945)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.848725238107697 0)
"cameras" SET Transform eulerAngles (15.12485530981079 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5285103520458964
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.111516236073684
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3948435049208928
"cameras/drone/drone0" SET Transform localPosition (-0.7957020181002585 0.3156161664272769 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0058430623076637 0.8211183149729018 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 3 -13)
"cameras/drone/drone0" SET Transform localScale (0.6693563450416564 0.6693563450416564 0.6693563450416564)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -12 -16)
"cameras/drone/drone1" SET Transform localScale (0.9365834637838047 0.9365834637838047 0.9365834637838047)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.179759858083771 0)
"cameras" SET Transform eulerAngles (10.458199492610937 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0906283098368708
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2471963263833397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29599842262567305
"cameras/drone/drone0" SET Transform localPosition (0.7280399127100625 -0.0629187760374556 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4552581971541432 0.8415129218801243 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 7 1)
"cameras/drone/drone0" SET Transform localScale (1.077092534743361 1.077092534743361 1.077092534743361)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 16 -20)
"cameras/drone/drone1" SET Transform localScale (0.8486376218810672 0.8486376218810672 0.8486376218810672)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.945579390180495 0)
"cameras" SET Transform eulerAngles (2.446189409922436 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.507274743752388
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7562812144373332
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24350022952890094
"cameras/drone/drone0" SET Transform localPosition (-0.9645780123254291 -0.27037071040276023 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8925089946120421 1.0211345558881544 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 0 -5)
"cameras/drone/drone0" SET Transform localScale (1.0206493494473483 1.0206493494473483 1.0206493494473483)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -18 5)
"cameras/drone/drone1" SET Transform localScale (1.2108285810443231 1.2108285810443231 1.2108285810443231)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.850906004262032 0)
"cameras" SET Transform eulerAngles (-8.326176008537779 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.786596958072462
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8146687724601938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3053652653790974
"cameras/drone/drone0" SET Transform localPosition (1.0433567805875288 -0.05516564902892379 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7968536669296982 1.00569268259345 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -17 10)
"cameras/drone/drone0" SET Transform localScale (0.9999904517722897 0.9999904517722897 0.9999904517722897)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 5 2)
"cameras/drone/drone1" SET Transform localScale (0.8443895527495202 0.8443895527495202 0.8443895527495202)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.860362878197986 0)
"cameras" SET Transform eulerAngles (-9.742873348650548 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5623563626665435
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1417895970970313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2518052623745716
"cameras/drone/drone0" SET Transform localPosition (-0.7638125540395238 0.13875737407246452 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9453615758569032 0.8296380527671354 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -18 -15)
"cameras/drone/drone0" SET Transform localScale (1.464361844005074 1.464361844005074 1.464361844005074)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -20 0)
"cameras/drone/drone1" SET Transform localScale (0.8271522670440992 0.8271522670440992 0.8271522670440992)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.523079530042583 0)
"cameras" SET Transform eulerAngles (-10.898405104774023 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1166312163227854
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8858770051137785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23358834772549986
"cameras/drone/drone0" SET Transform localPosition (0.40082711001665583 -0.019714595864858075 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.256225248729941 1.0068672953412612 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 12 -9)
"cameras/drone/drone0" SET Transform localScale (1.022233523828847 1.022233523828847 1.022233523828847)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -2 14)
"cameras/drone/drone1" SET Transform localScale (0.7092691856356479 0.7092691856356479 0.7092691856356479)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.439644699363984 0)
"cameras" SET Transform eulerAngles (18.619963191601855 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1601718714754372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9831359374149895
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1822073628872954
"cameras/drone/drone0" SET Transform localPosition (-1.0905111730850328 0.546302754887934 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9562908955474361 0.830889649464684 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 17 13)
"cameras/drone/drone0" SET Transform localScale (0.6100276244894637 0.6100276244894637 0.6100276244894637)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -3 11)
"cameras/drone/drone1" SET Transform localScale (0.8793747423500298 0.8793747423500298 0.8793747423500298)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.719842934042845 0)
"cameras" SET Transform eulerAngles (8.248656989402935 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5297125258785929
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4744742842286567
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1467958716427627
"cameras/drone/drone0" SET Transform localPosition (-0.07334779313007833 0.00758241601520554 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8780672281895459 0.8016028449976282 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 10 -11)
"cameras/drone/drone0" SET Transform localScale (1.3880197003246102 1.3880197003246102 1.3880197003246102)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -13 13)
"cameras/drone/drone1" SET Transform localScale (1.3917247079659218 1.3917247079659218 1.3917247079659218)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.102592449744003 0)
"cameras" SET Transform eulerAngles (7.357191981573806 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4577152457639553
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9650678332313415
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.024630115676358245
"cameras/drone/drone0" SET Transform localPosition (-0.3390451551900764 0.16239677995691065 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.051188359116842 1.0496770392628962 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 18 -14)
"cameras/drone/drone0" SET Transform localScale (1.3779816046422022 1.3779816046422022 1.3779816046422022)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -13 9)
"cameras/drone/drone1" SET Transform localScale (1.292013242312608 1.292013242312608 1.292013242312608)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9173294608564815 0)
"cameras" SET Transform eulerAngles (-8.277413110392358 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1775657933092685
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5878331885985992
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18610004903582397
"cameras/drone/drone0" SET Transform localPosition (0.7719004496324149 0.6600907278342663 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1123576617638662 1.2986248883224563 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 14 -13)
"cameras/drone/drone0" SET Transform localScale (0.8294998243091112 0.8294998243091112 0.8294998243091112)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 16 -16)
"cameras/drone/drone1" SET Transform localScale (1.131295629364368 1.131295629364368 1.131295629364368)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8540573797429847 0)
"cameras" SET Transform eulerAngles (4.594453775513742 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8372073850700963
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7483581550066127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.012316846963063944
"cameras/drone/drone0" SET Transform localPosition (0.2490127446407271 0.04791385805436993 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3987705771286225 1.0828280068308453 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -13 -7)
"cameras/drone/drone0" SET Transform localScale (0.9009667828106595 0.9009667828106595 0.9009667828106595)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 3 0)
"cameras/drone/drone1" SET Transform localScale (1.311331791135097 1.311331791135097 1.311331791135097)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4287810770063 0)
"cameras" SET Transform eulerAngles (0.8782283084706286 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42654062872022325
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4113940442633277
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0206592890320346
"cameras/drone/drone0" SET Transform localPosition (-0.6024410631281674 0.47324173025014565 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37417476422831675 1.2356771527911525 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -9 1)
"cameras/drone/drone0" SET Transform localScale (1.2761397053059416 1.2761397053059416 1.2761397053059416)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -8 -4)
"cameras/drone/drone1" SET Transform localScale (1.2741559771303126 1.2741559771303126 1.2741559771303126)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8999969179998293 0)
"cameras" SET Transform eulerAngles (7.007657072807447 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4389784890561788
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.496846785572644
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17789373421703486
"cameras/drone/drone0" SET Transform localPosition (-1.1715606954883806 -0.2797817715618394 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7743187118035939 1.2304745800489694 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 17 -17)
"cameras/drone/drone0" SET Transform localScale (0.768274363291444 0.768274363291444 0.768274363291444)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -8 -3)
"cameras/drone/drone1" SET Transform localScale (1.4220985239775175 1.4220985239775175 1.4220985239775175)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.492520735430653 0)
"cameras" SET Transform eulerAngles (-5.87378175371375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.590631424976984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2979754046745708
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15545806293810968
"cameras/drone/drone0" SET Transform localPosition (-1.1206151251936838 0.5419954353115628 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1547102810205554 1.2878616961597618 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -17 9)
"cameras/drone/drone0" SET Transform localScale (0.9599412742150407 0.9599412742150407 0.9599412742150407)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 0 3)
"cameras/drone/drone1" SET Transform localScale (1.2256351328077084 1.2256351328077084 1.2256351328077084)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.033861463838431 0)
"cameras" SET Transform eulerAngles (6.091886567264311 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8458359869521822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9353502241014326
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20610870154232527
"cameras/drone/drone0" SET Transform localPosition (0.21828451408990746 0.38351794983601256 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8987226239332905 1.2933455591837757 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 7 -17)
"cameras/drone/drone0" SET Transform localScale (1.4174172628391775 1.4174172628391775 1.4174172628391775)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 9 3)
"cameras/drone/drone1" SET Transform localScale (0.6283071837577976 0.6283071837577976 0.6283071837577976)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5003007291714825 0)
"cameras" SET Transform eulerAngles (-0.8390824161391635 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4779707420801378
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8512786961533125
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06904720699479841
"cameras/drone/drone0" SET Transform localPosition (-0.720645586379454 0.6766618642213194 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7313402294570717 1.2709418577391423 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 7 -14)
"cameras/drone/drone0" SET Transform localScale (1.0172662498811598 1.0172662498811598 1.0172662498811598)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 19 0)
"cameras/drone/drone1" SET Transform localScale (0.8136447397168032 0.8136447397168032 0.8136447397168032)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.320695647896529 0)
"cameras" SET Transform eulerAngles (-16.925204967897077 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6941258664442309
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.760611285768833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32810400930743383
"cameras/drone/drone0" SET Transform localPosition (1.005225460118113 0.0932916801453168 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5395614210898964 1.2654871177962528 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 7 16)
"cameras/drone/drone0" SET Transform localScale (0.7670513272996241 0.7670513272996241 0.7670513272996241)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -12 -18)
"cameras/drone/drone1" SET Transform localScale (0.9353409152497811 0.9353409152497811 0.9353409152497811)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.912612927227199 0)
"cameras" SET Transform eulerAngles (-12.483242412279502 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.302745056346133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4671404743782523
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18434058705869447
"cameras/drone/drone0" SET Transform localPosition (0.8767030685896138 -0.2504412976526152 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5140510283185902 1.0211720881205264 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 4 -1)
"cameras/drone/drone0" SET Transform localScale (1.1341224973519524 1.1341224973519524 1.1341224973519524)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 0 7)
"cameras/drone/drone1" SET Transform localScale (1.3622480432939525 1.3622480432939525 1.3622480432939525)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.815619109851821 0)
"cameras" SET Transform eulerAngles (15.559086445736249 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9553321879819875
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.450401225908673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08674333489080471
"cameras/drone/drone0" SET Transform localPosition (-0.943141854261067 -0.24262106606140382 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5076008401926614 0.9260023621236233 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 2 -10)
"cameras/drone/drone0" SET Transform localScale (1.4193105290708736 1.4193105290708736 1.4193105290708736)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -19 2)
"cameras/drone/drone1" SET Transform localScale (1.3443740557067714 1.3443740557067714 1.3443740557067714)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8154531507953022 0)
"cameras" SET Transform eulerAngles (3.132335651783279 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1283038321038186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6062839993026774
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16272054188666335
"cameras/drone/drone0" SET Transform localPosition (-1.093610682592489 -0.09860868301670572 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40152246569872685 0.95155792344072 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -5 -14)
"cameras/drone/drone0" SET Transform localScale (1.2950548302168836 1.2950548302168836 1.2950548302168836)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -9 6)
"cameras/drone/drone1" SET Transform localScale (1.140606558863397 1.140606558863397 1.140606558863397)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3639313830858013 0)
"cameras" SET Transform eulerAngles (7.305235518075392 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3625366558000591
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9871000036225714
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3051340960768587
"cameras/drone/drone0" SET Transform localPosition (-0.4663519635326855 0.5360662047478044 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2083438815279991 0.933682233522309 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -9 -15)
"cameras/drone/drone0" SET Transform localScale (1.2137457356971593 1.2137457356971593 1.2137457356971593)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 14 -10)
"cameras/drone/drone1" SET Transform localScale (1.3180792088226747 1.3180792088226747 1.3180792088226747)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.89630859130775 0)
"cameras" SET Transform eulerAngles (1.2874991714284647 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0160235188455502
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8896405974468395
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1736224221075996
"cameras/drone/drone0" SET Transform localPosition (0.03405798567200513 -0.012322738638967767 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.20221997662887736 1.2720658629811328 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 4 13)
"cameras/drone/drone0" SET Transform localScale (1.3176627975207924 1.3176627975207924 1.3176627975207924)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 8 16)
"cameras/drone/drone1" SET Transform localScale (1.4028049225370665 1.4028049225370665 1.4028049225370665)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.438440782668185 0)
"cameras" SET Transform eulerAngles (9.726952302514526 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4039915442881439
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.905903962453435
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11940883531473007
"cameras/drone/drone0" SET Transform localPosition (-1.1699684917506534 -0.03402094531269301 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5025218140358195 1.0356305768920933 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 1 16)
"cameras/drone/drone0" SET Transform localScale (0.7481172770605093 0.7481172770605093 0.7481172770605093)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 14 0)
"cameras/drone/drone1" SET Transform localScale (1.2017861685625595 1.2017861685625595 1.2017861685625595)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.198588206432393 0)
"cameras" SET Transform eulerAngles (-12.423709385715092 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.250029385453211
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9574918922208404
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.106674944935537
"cameras/drone/drone0" SET Transform localPosition (-0.4350779696856508 0.63813215429813 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3016514369587415 1.2462655474603617 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -9 13)
"cameras/drone/drone0" SET Transform localScale (1.4642786599033368 1.4642786599033368 1.4642786599033368)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -4 -15)
"cameras/drone/drone1" SET Transform localScale (0.8576481594162206 0.8576481594162206 0.8576481594162206)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.68705651678855 0)
"cameras" SET Transform eulerAngles (5.188999327885185 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5561897049219646
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1127783350094893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05748637039178792
"cameras/drone/drone0" SET Transform localPosition (-0.4256950503577782 0.0201802470672387 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37716999230039594 1.0933147221567365 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 13 -15)
"cameras/drone/drone0" SET Transform localScale (0.8387705623335114 0.8387705623335114 0.8387705623335114)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -14 4)
"cameras/drone/drone1" SET Transform localScale (1.0337878953779251 1.0337878953779251 1.0337878953779251)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4980523679926208 0)
"cameras" SET Transform eulerAngles (1.1125911487267146 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6279873709549831
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1653746891426755
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06287846257851558
"cameras/drone/drone0" SET Transform localPosition (1.1984455062609138 -0.03879731271512793 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.004972375785898375 0.8333530382612173 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -4 2)
"cameras/drone/drone0" SET Transform localScale (1.4135548764555468 1.4135548764555468 1.4135548764555468)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -2 12)
"cameras/drone/drone1" SET Transform localScale (0.6562614224747857 0.6562614224747857 0.6562614224747857)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.624876873805968 0)
"cameras" SET Transform eulerAngles (18.643448209170685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7632285889716808
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5708008557765258
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28802136167855513
"cameras/drone/drone0" SET Transform localPosition (1.1816384389882442 0.11304641527522014 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.763260381446522 1.041631812450019 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 20 -17)
"cameras/drone/drone0" SET Transform localScale (0.9379006521559109 0.9379006521559109 0.9379006521559109)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 0 13)
"cameras/drone/drone1" SET Transform localScale (0.9999506350535377 0.9999506350535377 0.9999506350535377)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.001404250760496 0)
"cameras" SET Transform eulerAngles (4.094135865238858 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5592430590524887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.965442929754852
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3900830630564571
"cameras/drone/drone0" SET Transform localPosition (-0.08966297422507408 0.11755135005213851 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9037557237952969 0.9918545214626279 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -8 14)
"cameras/drone/drone0" SET Transform localScale (0.8299493158797628 0.8299493158797628 0.8299493158797628)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -13 5)
"cameras/drone/drone1" SET Transform localScale (1.0177800000325892 1.0177800000325892 1.0177800000325892)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.631178824857699 0)
"cameras" SET Transform eulerAngles (17.260737923176748 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44148759999396747
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9942317461461356
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39794659481354
"cameras/drone/drone0" SET Transform localPosition (1.067477873279311 0.6373354826990214 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4384679607807539 1.1754812819937488 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -19 -11)
"cameras/drone/drone0" SET Transform localScale (0.9940004969580147 0.9940004969580147 0.9940004969580147)
"cameras/drone/drone1" SET Transform localEulerAngles (0 7 -18)
"cameras/drone/drone1" SET Transform localScale (1.262836220346124 1.262836220346124 1.262836220346124)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.761747177081145 0)
"cameras" SET Transform eulerAngles (-8.935442185190725 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6901865919555241
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.260514230083083
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1406625676968166
"cameras/drone/drone0" SET Transform localPosition (-0.8711982228071012 -0.28835580302034797 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8887977874190411 1.09457756855993 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -7 7)
"cameras/drone/drone0" SET Transform localScale (1.4592292463418857 1.4592292463418857 1.4592292463418857)
"cameras/drone/drone1" SET Transform localEulerAngles (15 18 -2)
"cameras/drone/drone1" SET Transform localScale (0.8026017799432208 0.8026017799432208 0.8026017799432208)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.904072836153154 0)
"cameras" SET Transform eulerAngles (-16.37550569766633 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9201055061331354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6076405359434132
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05977069001962252
"cameras/drone/drone0" SET Transform localPosition (0.9484411902897578 0.16674342886657995 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9873267364800534 0.8344127534529878 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -12 3)
"cameras/drone/drone0" SET Transform localScale (1.4947496660034885 1.4947496660034885 1.4947496660034885)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 9 10)
"cameras/drone/drone1" SET Transform localScale (0.7356897659420691 0.7356897659420691 0.7356897659420691)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4072083570754255 0)
"cameras" SET Transform eulerAngles (5.107032962368873 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1404363300237632
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7566266441917044
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23194696700875786
"cameras/drone/drone0" SET Transform localPosition (-1.142027997129706 -0.148277688049888 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1617163338572387 1.2097306601970814 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -9 -10)
"cameras/drone/drone0" SET Transform localScale (0.6614796469408757 0.6614796469408757 0.6614796469408757)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 8 -18)
"cameras/drone/drone1" SET Transform localScale (0.999476889973707 0.999476889973707 0.999476889973707)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.274280132204977 0)
"cameras" SET Transform eulerAngles (-8.150902355805698 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4602167207615437
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7057588413763822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11084911778599836
"cameras/drone/drone0" SET Transform localPosition (0.3759655341174877 -0.1675095517671647 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8765528147436685 1.1821867708048113 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 0 -18)
"cameras/drone/drone0" SET Transform localScale (1.202818614654038 1.202818614654038 1.202818614654038)
"cameras/drone/drone1" SET Transform localEulerAngles (18 0 -15)
"cameras/drone/drone1" SET Transform localScale (0.936907688902543 0.936907688902543 0.936907688902543)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.954745686720359 0)
"cameras" SET Transform eulerAngles (-15.68320829481542 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4721363233185986
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8043299431046158
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20170947177382118
"cameras/drone/drone0" SET Transform localPosition (0.8967633863295317 -0.029829106138851536 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0380266342435724 1.1607368680053805 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 12 -15)
"cameras/drone/drone0" SET Transform localScale (0.7310679452738589 0.7310679452738589 0.7310679452738589)
"cameras/drone/drone1" SET Transform localEulerAngles (8 8 -1)
"cameras/drone/drone1" SET Transform localScale (1.2560026711074 1.2560026711074 1.2560026711074)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1941232924375105 0)
"cameras" SET Transform eulerAngles (8.70046032238077 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1196321632126442
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7688003420086755
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06612628350220202
"cameras/drone/drone0" SET Transform localPosition (0.5953584412917159 -0.22381970104107812 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9798221606908287 1.1089228080501239 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -8 -14)
"cameras/drone/drone0" SET Transform localScale (1.1554329017040852 1.1554329017040852 1.1554329017040852)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 7 -20)
"cameras/drone/drone1" SET Transform localScale (0.9123610505647084 0.9123610505647084 0.9123610505647084)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.171416105928882 0)
"cameras" SET Transform eulerAngles (-6.357021542192047 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0298777327298896
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2764391634588519
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2847243531523236
"cameras/drone/drone0" SET Transform localPosition (-1.1153785211082703 0.6936355061953781 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7281745798121997 1.1342169759328329 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -13 -15)
"cameras/drone/drone0" SET Transform localScale (1.0955878229228442 1.0955878229228442 1.0955878229228442)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -12 -15)
"cameras/drone/drone1" SET Transform localScale (1.3045783749073763 1.3045783749073763 1.3045783749073763)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.243963655167775 0)
"cameras" SET Transform eulerAngles (11.506780778804632 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1871999570565395
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9716061239907038
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02109422130436771
"cameras/drone/drone0" SET Transform localPosition (-0.49333873198075184 0.06798776982053173 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9643507915542722 0.8120216690391455 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -20 9)
"cameras/drone/drone0" SET Transform localScale (1.2705846017256235 1.2705846017256235 1.2705846017256235)
"cameras/drone/drone1" SET Transform localEulerAngles (13 5 -4)
"cameras/drone/drone1" SET Transform localScale (1.049281226442236 1.049281226442236 1.049281226442236)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.288605688679858 0)
"cameras" SET Transform eulerAngles (12.661658897350243 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3478402740298627
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9316866487091318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1817746149214221
"cameras/drone/drone0" SET Transform localPosition (0.8425932614514784 -0.19063762784544752 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6055661063899499 0.942641898808252 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -19 -1)
"cameras/drone/drone0" SET Transform localScale (1.383819133096166 1.383819133096166 1.383819133096166)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 18 -15)
"cameras/drone/drone1" SET Transform localScale (0.8977337600780466 0.8977337600780466 0.8977337600780466)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.122954334090409 0)
"cameras" SET Transform eulerAngles (-4.307206947240001 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3808393682836042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2994531672771603
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0444653772403854
"cameras/drone/drone0" SET Transform localPosition (-1.1940464264455062 0.3774603277715732 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7588577502787949 1.0133669198054838 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 20 4)
"cameras/drone/drone0" SET Transform localScale (0.9614798385632637 0.9614798385632637 0.9614798385632637)
"cameras/drone/drone1" SET Transform localEulerAngles (3 2 20)
"cameras/drone/drone1" SET Transform localScale (1.3975923722723536 1.3975923722723536 1.3975923722723536)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.365104900632396 0)
"cameras" SET Transform eulerAngles (-0.9914415446312965 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4683763895876164
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7934141961934094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3153031120179809
"cameras/drone/drone0" SET Transform localPosition (1.1647274356513015 -0.2079411143642212 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5825558433433257 1.16429505605047 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -19 -4)
"cameras/drone/drone0" SET Transform localScale (0.654653345351244 0.654653345351244 0.654653345351244)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -2 -20)
"cameras/drone/drone1" SET Transform localScale (1.0707045065183385 1.0707045065183385 1.0707045065183385)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7911196813302332 0)
"cameras" SET Transform eulerAngles (-11.795150230381086 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5111295058018999
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8252442457277178
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18114283735208014
"cameras/drone/drone0" SET Transform localPosition (1.0876410561921215 -0.29379055090354905 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7484289599363187 0.9920317355814852 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 7 -15)
"cameras/drone/drone0" SET Transform localScale (1.2634477240225523 1.2634477240225523 1.2634477240225523)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -20 0)
"cameras/drone/drone1" SET Transform localScale (1.030409772570461 1.030409772570461 1.030409772570461)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.731810704038903 0)
"cameras" SET Transform eulerAngles (-12.5520322615195 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6502379001079841
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2899507352588888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33061294681766534
"cameras/drone/drone0" SET Transform localPosition (-1.114442903782807 -0.15786427368763584 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5385202266454376 1.035800942312345 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -3 -3)
"cameras/drone/drone0" SET Transform localScale (1.1194555422789676 1.1194555422789676 1.1194555422789676)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 3 9)
"cameras/drone/drone1" SET Transform localScale (1.0550302864180048 1.0550302864180048 1.0550302864180048)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.791823006279488 0)
"cameras" SET Transform eulerAngles (0.469877793826754 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2968650612005308
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6381270557085434
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06979106798898878
"cameras/drone/drone0" SET Transform localPosition (-1.1220477704023466 -0.134749646628527 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6847667006274176 1.2330533078565433 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 12 11)
"cameras/drone/drone0" SET Transform localScale (1.1807394052951317 1.1807394052951317 1.1807394052951317)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -16 -19)
"cameras/drone/drone1" SET Transform localScale (1.2718665727115912 1.2718665727115912 1.2718665727115912)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.612979013191693 0)
"cameras" SET Transform eulerAngles (8.674775092017878 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3198825695240122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0057217321211953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15224299004427178
"cameras/drone/drone0" SET Transform localPosition (0.7406239049799113 0.6793927085008318 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8208919337687437 1.2391012457469153 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 15 -2)
"cameras/drone/drone0" SET Transform localScale (1.1403326262490598 1.1403326262490598 1.1403326262490598)
"cameras/drone/drone1" SET Transform localEulerAngles (2 0 10)
"cameras/drone/drone1" SET Transform localScale (1.444344737330947 1.444344737330947 1.444344737330947)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.325238176616917 0)
"cameras" SET Transform eulerAngles (5.428944096094259 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7444738966025433
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9240082530427367
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2002113194451971
"cameras/drone/drone0" SET Transform localPosition (-1.1422621840890261 -0.05502449876166232 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0681567796158464 0.8900913869542781 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 11 -9)
"cameras/drone/drone0" SET Transform localScale (0.6200904028957626 0.6200904028957626 0.6200904028957626)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -13 11)
"cameras/drone/drone1" SET Transform localScale (1.4090034989141302 1.4090034989141302 1.4090034989141302)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.234457394390157 0)
"cameras" SET Transform eulerAngles (-17.460959782433356 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8964281070695017
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9300889943151558
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2842705361327511
"cameras/drone/drone0" SET Transform localPosition (-1.1971898412201034 0.2530270447794663 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9415335789589248 1.020364937392104 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -3 4)
"cameras/drone/drone0" SET Transform localScale (0.7340601408071774 0.7340601408071774 0.7340601408071774)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -13 2)
"cameras/drone/drone1" SET Transform localScale (0.725059771349671 0.725059771349671 0.725059771349671)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4477333743734406 0)
"cameras" SET Transform eulerAngles (13.58746552179791 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0633244487833782
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1458572012275947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.244882901830524
"cameras/drone/drone0" SET Transform localPosition (0.0020119234550177723 -0.2577667171327342 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.021960225284064938 0.9270643144420878 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 4 12)
"cameras/drone/drone0" SET Transform localScale (0.7900005252420141 0.7900005252420141 0.7900005252420141)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 18 2)
"cameras/drone/drone1" SET Transform localScale (0.6089750312600848 0.6089750312600848 0.6089750312600848)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.352027244207138 0)
"cameras" SET Transform eulerAngles (1.2138324172797326 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0921631970890182
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0264364053248214
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08788871705766295
"cameras/drone/drone0" SET Transform localPosition (-0.8701428056487195 0.08251539527477497 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.40722994747912156 0.8469237403098008 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 4 15)
"cameras/drone/drone0" SET Transform localScale (1.0556230159109738 1.0556230159109738 1.0556230159109738)
"cameras/drone/drone1" SET Transform localEulerAngles (2 4 -5)
"cameras/drone/drone1" SET Transform localScale (0.6947627033200791 0.6947627033200791 0.6947627033200791)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3491062921355725 0)
"cameras" SET Transform eulerAngles (-1.3656955528485604 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.28478464688572
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5709911716018712
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09757784212481808
"cameras/drone/drone0" SET Transform localPosition (0.6474193633686414 0.23694145414226958 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8940869281207469 1.1292760024006623 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -20 -19)
"cameras/drone/drone0" SET Transform localScale (0.9331247517074039 0.9331247517074039 0.9331247517074039)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 4 -6)
"cameras/drone/drone1" SET Transform localScale (0.9635472493534012 0.9635472493534012 0.9635472493534012)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.280333364811554 0)
"cameras" SET Transform eulerAngles (1.2509432890393448 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8881515909872084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7906328334126216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.019107218979307918
"cameras/drone/drone0" SET Transform localPosition (1.1709004407799777 0.6439007175560107 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5584051311074456 1.2506557411910721 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 20 14)
"cameras/drone/drone0" SET Transform localScale (0.9020878934230907 0.9020878934230907 0.9020878934230907)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 20 13)
"cameras/drone/drone1" SET Transform localScale (1.3512197896446971 1.3512197896446971 1.3512197896446971)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2006799104392885 0)
"cameras" SET Transform eulerAngles (15.836556183717803 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4647982713127991
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4775327860109704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3099837410315575
"cameras/drone/drone0" SET Transform localPosition (-0.39923894478179334 0.14112831541126408 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.46875731077223715 0.9417187898956649 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 2 -10)
"cameras/drone/drone0" SET Transform localScale (0.808655094406613 0.808655094406613 0.808655094406613)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -18 -10)
"cameras/drone/drone1" SET Transform localScale (1.4424622320080636 1.4424622320080636 1.4424622320080636)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.348118274413999 0)
"cameras" SET Transform eulerAngles (3.7704912632558134 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2969481298536112
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0469967844820376
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3685490996583275
"cameras/drone/drone0" SET Transform localPosition (-0.5471144207741775 0.2635812977767517 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4472317701289287 1.2056148574015972 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -1 -12)
"cameras/drone/drone0" SET Transform localScale (1.0579103977773567 1.0579103977773567 1.0579103977773567)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -3 18)
"cameras/drone/drone1" SET Transform localScale (1.328691510558171 1.328691510558171 1.328691510558171)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.769813766799902 0)
"cameras" SET Transform eulerAngles (-16.670031301969054 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0866294018344553
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5091368236583063
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06319936945236662
"cameras/drone/drone0" SET Transform localPosition (0.6966105043627866 -0.0548476460870197 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0216478759882806 0.9479379250895686 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -6 15)
"cameras/drone/drone0" SET Transform localScale (0.6183821428232499 0.6183821428232499 0.6183821428232499)
"cameras/drone/drone1" SET Transform localEulerAngles (10 12 -3)
"cameras/drone/drone1" SET Transform localScale (0.7271800831900825 0.7271800831900825 0.7271800831900825)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.276640531461968 0)
"cameras" SET Transform eulerAngles (17.99825391757649 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.57755502556921
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9223080342146828
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08396458134430906
"cameras/drone/drone0" SET Transform localPosition (0.16186688281805117 0.4784401355634826 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4446265883226874 1.2170397319562527 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 17 -11)
"cameras/drone/drone0" SET Transform localScale (0.6973781618662567 0.6973781618662567 0.6973781618662567)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -2 2)
"cameras/drone/drone1" SET Transform localScale (0.8983899543258835 0.8983899543258835 0.8983899543258835)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.492242487678158 0)
"cameras" SET Transform eulerAngles (-3.3650013833878845 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9113286221099434
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5208203961963984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12487971403428642
"cameras/drone/drone0" SET Transform localPosition (1.1682173175222552 -0.07053094451344316 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5916159039508518 0.9581064634578292 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 4 -14)
"cameras/drone/drone0" SET Transform localScale (1.419004416584864 1.419004416584864 1.419004416584864)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 16 -9)
"cameras/drone/drone1" SET Transform localScale (0.9734069753264177 0.9734069753264177 0.9734069753264177)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7008449187474852 0)
"cameras" SET Transform eulerAngles (8.355703467882797 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5794441198822549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.322204797471248
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30282917189564196
"cameras/drone/drone0" SET Transform localPosition (0.05577455356399175 0.0403401689373491 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40415778492612997 1.2804823028771724 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -18 3)
"cameras/drone/drone0" SET Transform localScale (1.0515318008785326 1.0515318008785326 1.0515318008785326)
"cameras/drone/drone1" SET Transform localEulerAngles (20 1 -1)
"cameras/drone/drone1" SET Transform localScale (0.9250246968158757 0.9250246968158757 0.9250246968158757)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.065446818822145 0)
"cameras" SET Transform eulerAngles (12.54505824984281 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.432256826944385
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.267671884638252
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1580755369816752
"cameras/drone/drone0" SET Transform localPosition (-0.9535582476203908 0.15798899326823718 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.192529546470247 0.8935755605204658 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 11 4)
"cameras/drone/drone0" SET Transform localScale (1.1258952026911753 1.1258952026911753 1.1258952026911753)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -3 -5)
"cameras/drone/drone1" SET Transform localScale (1.0264152978577428 1.0264152978577428 1.0264152978577428)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.847724987327794 0)
"cameras" SET Transform eulerAngles (14.248108221910101 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1196174021176173
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9607399609294196
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19023171609742065
"cameras/drone/drone0" SET Transform localPosition (-0.0771347281144954 0.19391196651400594 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.25262456236036657 1.0288649748261542 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 5 -6)
"cameras/drone/drone0" SET Transform localScale (0.7612770842937802 0.7612770842937802 0.7612770842937802)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -5 -3)
"cameras/drone/drone1" SET Transform localScale (0.689466298321582 0.689466298321582 0.689466298321582)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.519867774609993 0)
"cameras" SET Transform eulerAngles (5.669001779491303 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.821885016210109
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1872207450293966
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14749362158985552
"cameras/drone/drone0" SET Transform localPosition (-1.06868608582486 0.6807789125338144 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9653658613759657 1.2591157551144994 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 17 8)
"cameras/drone/drone0" SET Transform localScale (0.8955263871066066 0.8955263871066066 0.8955263871066066)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -2 18)
"cameras/drone/drone1" SET Transform localScale (1.0850243089457563 1.0850243089457563 1.0850243089457563)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.621086817604116 0)
"cameras" SET Transform eulerAngles (-8.670051887312686 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7578614828380351
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0649264101798805
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3340482813790531
"cameras/drone/drone0" SET Transform localPosition (0.2896796829221755 0.6917273805865398 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.146659428174545 1.071954777136187 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -15 15)
"cameras/drone/drone0" SET Transform localScale (0.9176053439029128 0.9176053439029128 0.9176053439029128)
"cameras/drone/drone1" SET Transform localEulerAngles (6 2 13)
"cameras/drone/drone1" SET Transform localScale (1.020740275621418 1.020740275621418 1.020740275621418)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.136524851677926 0)
"cameras" SET Transform eulerAngles (11.659164196711135 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1350321148896705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0870220154219914
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2387938153328887
"cameras/drone/drone0" SET Transform localPosition (-0.6461998663762679 -0.24166824605414466 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0954672122457787 0.9893088211654805 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -6 12)
"cameras/drone/drone0" SET Transform localScale (0.6692031758411905 0.6692031758411905 0.6692031758411905)
"cameras/drone/drone1" SET Transform localEulerAngles (20 13 3)
"cameras/drone/drone1" SET Transform localScale (1.4438577940517963 1.4438577940517963 1.4438577940517963)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5199674693741794 0)
"cameras" SET Transform eulerAngles (7.194798499437237 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1610757816931137
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4756662918272625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35707113475909497
"cameras/drone/drone0" SET Transform localPosition (0.41925689213331574 0.4576508428842693 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9795459505633675 0.9196209147519387 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 14 0)
"cameras/drone/drone0" SET Transform localScale (1.270598519044166 1.270598519044166 1.270598519044166)
"cameras/drone/drone1" SET Transform localEulerAngles (8 6 3)
"cameras/drone/drone1" SET Transform localScale (1.0408414255987986 1.0408414255987986 1.0408414255987986)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.673759313529474 0)
"cameras" SET Transform eulerAngles (14.350174748177942 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2139313648436956
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0981294586552344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12564436833766748
"cameras/drone/drone0" SET Transform localPosition (1.086673124320859 -0.22161581250231527 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03628564639361165 1.2598598427361072 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -11 -3)
"cameras/drone/drone0" SET Transform localScale (0.6427562636411419 0.6427562636411419 0.6427562636411419)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -8 16)
"cameras/drone/drone1" SET Transform localScale (0.9399903901512447 0.9399903901512447 0.9399903901512447)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.444578878112418 0)
"cameras" SET Transform eulerAngles (10.579515442904764 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0030230423221502
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7140081660336937
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2056976327847161
"cameras/drone/drone0" SET Transform localPosition (0.26695918387698203 0.33655610998167323 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.29099934969304786 1.0806979453328962 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -10 11)
"cameras/drone/drone0" SET Transform localScale (1.3605973141957275 1.3605973141957275 1.3605973141957275)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -14 -6)
"cameras/drone/drone1" SET Transform localScale (0.622193983913266 0.622193983913266 0.622193983913266)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.726726648170255 0)
"cameras" SET Transform eulerAngles (-14.861993473120624 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5984388239380257
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6969618075633948
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3429003963808751
"cameras/drone/drone0" SET Transform localPosition (0.9435875335408868 -0.219853337041997 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7932368322138434 1.2560910746835527 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 20 6)
"cameras/drone/drone0" SET Transform localScale (1.2420759023752201 1.2420759023752201 1.2420759023752201)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -17 20)
"cameras/drone/drone1" SET Transform localScale (0.6380462289821511 0.6380462289821511 0.6380462289821511)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3541064841708295 0)
"cameras" SET Transform eulerAngles (16.864502055682635 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41107270275104396
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9283331974033874
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.020449744990016328
"cameras/drone/drone0" SET Transform localPosition (-0.24244503914193516 0.32743707570410524 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.22785522393319613 1.2658270274232506 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -10 -18)
"cameras/drone/drone0" SET Transform localScale (1.032504624210986 1.032504624210986 1.032504624210986)
"cameras/drone/drone1" SET Transform localEulerAngles (11 0 -9)
"cameras/drone/drone1" SET Transform localScale (0.6975084249355419 0.6975084249355419 0.6975084249355419)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.151262777068161 0)
"cameras" SET Transform eulerAngles (19.978417351013377 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8176128734682866
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5913716929948536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1901600731316213
"cameras/drone/drone0" SET Transform localPosition (-1.060264085546913 0.2088706715715078 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.373911205003858 0.8626415629576004 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -18 -8)
"cameras/drone/drone0" SET Transform localScale (0.8780043472195741 0.8780043472195741 0.8780043472195741)
"cameras/drone/drone1" SET Transform localEulerAngles (8 20 -3)
"cameras/drone/drone1" SET Transform localScale (1.1070676157882606 1.1070676157882606 1.1070676157882606)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9424645879076854 0)
"cameras" SET Transform eulerAngles (-8.680837899617963 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8469300650120826
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5382781822234035
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3802558408859624
"cameras/drone/drone0" SET Transform localPosition (1.1573527378988449 0.5177335337282201 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5343692736432251 1.1345128205922401 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 9 -8)
"cameras/drone/drone0" SET Transform localScale (1.409140396417079 1.409140396417079 1.409140396417079)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 15 -11)
"cameras/drone/drone1" SET Transform localScale (1.078892844484095 1.078892844484095 1.078892844484095)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.374051799954265 0)
"cameras" SET Transform eulerAngles (-0.011771638209957302 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.312567921922836
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7453163670012022
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17195459940412033
"cameras/drone/drone0" SET Transform localPosition (0.07321364809667585 0.005409142643019005 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10716912607319995 0.9027418158535733 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 17 6)
"cameras/drone/drone0" SET Transform localScale (0.9539551674147455 0.9539551674147455 0.9539551674147455)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -6 3)
"cameras/drone/drone1" SET Transform localScale (0.8313276841896988 0.8313276841896988 0.8313276841896988)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.481309972083931 0)
"cameras" SET Transform eulerAngles (9.291698262673727 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8605327496271876
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4869053129314385
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3538974216221701
"cameras/drone/drone0" SET Transform localPosition (-0.05351884614581448 0.5152662395097594 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11720085246071266 0.8856053660079461 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 13 -5)
"cameras/drone/drone0" SET Transform localScale (0.9688423328673896 0.9688423328673896 0.9688423328673896)
"cameras/drone/drone1" SET Transform localEulerAngles (16 20 1)
"cameras/drone/drone1" SET Transform localScale (1.2275729331311767 1.2275729331311767 1.2275729331311767)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0265028129651945 0)
"cameras" SET Transform eulerAngles (-19.991458387883743 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9844633957443185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1130134278991746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12409213211658043
"cameras/drone/drone0" SET Transform localPosition (0.7923146618978569 0.48250733241878213 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3162691928839547 1.202266305165293 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 8 -10)
"cameras/drone/drone0" SET Transform localScale (0.6769757007284136 0.6769757007284136 0.6769757007284136)
"cameras/drone/drone1" SET Transform localEulerAngles (18 4 14)
"cameras/drone/drone1" SET Transform localScale (1.1054497360007112 1.1054497360007112 1.1054497360007112)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5927828075420605 0)
"cameras" SET Transform eulerAngles (-16.85907179217333 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2957785359803635
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0150973664922105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29505718534605696
"cameras/drone/drone0" SET Transform localPosition (0.8028673247699258 0.3746062953774238 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.19750778911110412 1.0603686435477735 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 7 10)
"cameras/drone/drone0" SET Transform localScale (1.123961241226191 1.123961241226191 1.123961241226191)
"cameras/drone/drone1" SET Transform localEulerAngles (8 8 2)
"cameras/drone/drone1" SET Transform localScale (1.462951901475989 1.462951901475989 1.462951901475989)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.222795194552967 0)
"cameras" SET Transform eulerAngles (-14.350860595392941 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.594808807452146
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0488801535405432
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26564170087442807
"cameras/drone/drone0" SET Transform localPosition (-0.11704080870048283 0.5327538026293783 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2027013823189765 0.9469480060247337 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -3 6)
"cameras/drone/drone0" SET Transform localScale (1.423046492558517 1.423046492558517 1.423046492558517)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -18 11)
"cameras/drone/drone1" SET Transform localScale (1.3967839875069508 1.3967839875069508 1.3967839875069508)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5818888888873017 0)
"cameras" SET Transform eulerAngles (-19.94447636883413 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1226425522695318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2169637758007732
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2640600329421369
"cameras/drone/drone0" SET Transform localPosition (0.17135866577922032 -0.033572654228679666 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1891834748257435 1.1991289767671156 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 9 -9)
"cameras/drone/drone0" SET Transform localScale (1.2436841003343084 1.2436841003343084 1.2436841003343084)
"cameras/drone/drone1" SET Transform localEulerAngles (0 12 4)
"cameras/drone/drone1" SET Transform localScale (1.295636360021103 1.295636360021103 1.295636360021103)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4660319356332696 0)
"cameras" SET Transform eulerAngles (4.074512662364469 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.04024352950881
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8491800992603635
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26714699277661774
"cameras/drone/drone0" SET Transform localPosition (0.35908628116411867 0.09725820323535089 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8331070825924545 1.1357995283397933 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 8 6)
"cameras/drone/drone0" SET Transform localScale (1.1163832409686907 1.1163832409686907 1.1163832409686907)
"cameras/drone/drone1" SET Transform localEulerAngles (14 20 20)
"cameras/drone/drone1" SET Transform localScale (1.1220760839551582 1.1220760839551582 1.1220760839551582)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5255745930378257 0)
"cameras" SET Transform eulerAngles (3.202772397581896 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.525055405642143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.630820597463142
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0744149543625131
"cameras/drone/drone0" SET Transform localPosition (1.105249460682222 -0.03305248460866733 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2047253935768748 0.8304424213840833 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 2 -1)
"cameras/drone/drone0" SET Transform localScale (0.8466350978418029 0.8466350978418029 0.8466350978418029)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -4 -16)
"cameras/drone/drone1" SET Transform localScale (1.4690022665797369 1.4690022665797369 1.4690022665797369)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.464075562660324 0)
"cameras" SET Transform eulerAngles (-4.106247224522587 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3522139627545537
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7098857013784996
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08004950088936834
"cameras/drone/drone0" SET Transform localPosition (0.83978739900308 0.40041933468192753 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18890289354063783 1.2823505481819737 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -13 -3)
"cameras/drone/drone0" SET Transform localScale (1.3654959039449281 1.3654959039449281 1.3654959039449281)
"cameras/drone/drone1" SET Transform localEulerAngles (11 15 5)
"cameras/drone/drone1" SET Transform localScale (1.351737290467444 1.351737290467444 1.351737290467444)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.04371378085777 0)
"cameras" SET Transform eulerAngles (12.255742590911446 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5491952892271152
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1202518357840363
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30786612989839685
"cameras/drone/drone0" SET Transform localPosition (0.18370964579060312 0.15986173542760113 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5698126349097208 1.2480730352678835 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 12 13)
"cameras/drone/drone0" SET Transform localScale (0.6498390030657222 0.6498390030657222 0.6498390030657222)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -17 2)
"cameras/drone/drone1" SET Transform localScale (0.993380092888548 0.993380092888548 0.993380092888548)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.36964069816709 0)
"cameras" SET Transform eulerAngles (0.1393989843302137 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8581518878579827
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.383254896592876
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2534163567980139
"cameras/drone/drone0" SET Transform localPosition (-0.7346724220197367 0.09224926420037433 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.923810790690542 0.943963877022095 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 7 -13)
"cameras/drone/drone0" SET Transform localScale (1.2966924579788475 1.2966924579788475 1.2966924579788475)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -16 8)
"cameras/drone/drone1" SET Transform localScale (0.8438629961824149 0.8438629961824149 0.8438629961824149)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2170968995736064 0)
"cameras" SET Transform eulerAngles (-18.49848130594861 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0225274219861655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7129421220091727
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07390455910096376
"cameras/drone/drone0" SET Transform localPosition (0.7201695258887633 0.1261666622707423 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7958860189046437 0.8971739659536909 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -14 13)
"cameras/drone/drone0" SET Transform localScale (0.8740910139687772 0.8740910139687772 0.8740910139687772)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -12 17)
"cameras/drone/drone1" SET Transform localScale (0.8974359403934463 0.8974359403934463 0.8974359403934463)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.645359206471449 0)
"cameras" SET Transform eulerAngles (1.1149789372683507 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.143113803595233
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9844950194626336
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20158384219738223
"cameras/drone/drone0" SET Transform localPosition (0.3270370023027802 0.5193163098261819 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24828898336200567 1.2861313566779735 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 20 -3)
"cameras/drone/drone0" SET Transform localScale (1.4592204080947928 1.4592204080947928 1.4592204080947928)
"cameras/drone/drone1" SET Transform localEulerAngles (8 14 -7)
"cameras/drone/drone1" SET Transform localScale (1.2350232357987005 1.2350232357987005 1.2350232357987005)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.588151220641502 0)
"cameras" SET Transform eulerAngles (7.474526017330113 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0375188376431117
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2258500752098613
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33750192584607097
"cameras/drone/drone0" SET Transform localPosition (0.8017189207506086 0.44117801685524444 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.10697826704281588 1.1618692969452142 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 19 -1)
"cameras/drone/drone0" SET Transform localScale (1.078045465966369 1.078045465966369 1.078045465966369)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 10 8)
"cameras/drone/drone1" SET Transform localScale (1.4797660816436766 1.4797660816436766 1.4797660816436766)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.953369730193299 0)
"cameras" SET Transform eulerAngles (11.454158375423766 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2771437161666381
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1283906762924114
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3506501786556935
"cameras/drone/drone0" SET Transform localPosition (-0.5691165908302078 -0.10927464504357004 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1326603970699345 1.127700208146209 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -11 -15)
"cameras/drone/drone0" SET Transform localScale (1.2077307192827573 1.2077307192827573 1.2077307192827573)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -11 -7)
"cameras/drone/drone1" SET Transform localScale (1.3313500614781861 1.3313500614781861 1.3313500614781861)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7690773367076833 0)
"cameras" SET Transform eulerAngles (16.67422346205801 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1890657810102687
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4723181381314863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12848816643122674
"cameras/drone/drone0" SET Transform localPosition (-0.5122850345463555 0.6048271225114834 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9424961139486454 1.1379667104566549 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 9 -12)
"cameras/drone/drone0" SET Transform localScale (0.6770192303593245 0.6770192303593245 0.6770192303593245)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -7 -18)
"cameras/drone/drone1" SET Transform localScale (1.413562400028034 1.413562400028034 1.413562400028034)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7300278227683967 0)
"cameras" SET Transform eulerAngles (-8.397047003086353 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2581987634253422
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8308863930185506
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19182137321784506
"cameras/drone/drone0" SET Transform localPosition (-0.4506027426833321 0.1393558739399547 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2856835851833375 1.0100550879002494 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -17 -3)
"cameras/drone/drone0" SET Transform localScale (0.8695735180994644 0.8695735180994644 0.8695735180994644)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -16 11)
"cameras/drone/drone1" SET Transform localScale (1.2477207123914744 1.2477207123914744 1.2477207123914744)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.010157596326637 0)
"cameras" SET Transform eulerAngles (10.898188452483364 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42728551807004256
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6448427032167372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10393053966963284
"cameras/drone/drone0" SET Transform localPosition (0.07947567749234574 0.16751457292504085 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0668991496569096 1.0067565940607803 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 19 14)
"cameras/drone/drone0" SET Transform localScale (1.2398508152472238 1.2398508152472238 1.2398508152472238)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -6 14)
"cameras/drone/drone1" SET Transform localScale (0.8422422180313784 0.8422422180313784 0.8422422180313784)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.943826852699818 0)
"cameras" SET Transform eulerAngles (-16.377931644807077 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7969668137351189
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3676914387239223
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26742201290483564
"cameras/drone/drone0" SET Transform localPosition (0.7782207018040175 0.47195521820086567 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6512580369779378 0.87810781934337 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -3 -17)
"cameras/drone/drone0" SET Transform localScale (0.9585483826020812 0.9585483826020812 0.9585483826020812)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -16 -13)
"cameras/drone/drone1" SET Transform localScale (0.6671289880225767 0.6671289880225767 0.6671289880225767)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.132174132992021 0)
"cameras" SET Transform eulerAngles (15.492581948717117 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3342722029387548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2767764169888072
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3976457867530029
"cameras/drone/drone0" SET Transform localPosition (-0.26042122888118613 -0.07741265606576936 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.054234435936097114 1.2453225580787541 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 1 17)
"cameras/drone/drone0" SET Transform localScale (1.2952925135893623 1.2952925135893623 1.2952925135893623)
"cameras/drone/drone1" SET Transform localEulerAngles (9 16 1)
"cameras/drone/drone1" SET Transform localScale (1.0761603971162266 1.0761603971162266 1.0761603971162266)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.583262629375892 0)
"cameras" SET Transform eulerAngles (-15.471225068748176 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7107924377309219
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5097213602635724
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3648220358401921
"cameras/drone/drone0" SET Transform localPosition (0.6998088415435055 0.4355299213637452 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40750320350549085 0.9985107251066554 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 14 -3)
"cameras/drone/drone0" SET Transform localScale (1.0694142597533622 1.0694142597533622 1.0694142597533622)
"cameras/drone/drone1" SET Transform localEulerAngles (11 9 -18)
"cameras/drone/drone1" SET Transform localScale (0.9609721305454682 0.9609721305454682 0.9609721305454682)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2181602564006155 0)
"cameras" SET Transform eulerAngles (4.738242396966154 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2903431384785393
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.996031311670759
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19078520849224342
"cameras/drone/drone0" SET Transform localPosition (1.1636080395184114 -0.15856724411383843 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09417692673761535 0.9083466322602671 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -17 -11)
"cameras/drone/drone0" SET Transform localScale (1.3411934471616969 1.3411934471616969 1.3411934471616969)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 11 -15)
"cameras/drone/drone1" SET Transform localScale (1.3108431017863944 1.3108431017863944 1.3108431017863944)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.26983996289601 0)
"cameras" SET Transform eulerAngles (-19.219445853629896 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6121180050033006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4090156753997336
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05832578345081414
"cameras/drone/drone0" SET Transform localPosition (-0.4899062183286059 -0.25875143098649295 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1817279681135595 0.9985086707121729 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 16 -4)
"cameras/drone/drone0" SET Transform localScale (0.6065331436109114 0.6065331436109114 0.6065331436109114)
"cameras/drone/drone1" SET Transform localEulerAngles (3 1 12)
"cameras/drone/drone1" SET Transform localScale (0.8239660452583437 0.8239660452583437 0.8239660452583437)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.490412416041429 0)
"cameras" SET Transform eulerAngles (-17.872077406777617 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7518252969497876
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.221267755724944
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08078118081905578
"cameras/drone/drone0" SET Transform localPosition (-0.09646433164451418 0.44305650310114836 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9670496270577977 0.8555404528636263 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -20 -12)
"cameras/drone/drone0" SET Transform localScale (1.2202998192501067 1.2202998192501067 1.2202998192501067)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 11 -10)
"cameras/drone/drone1" SET Transform localScale (1.0857880310568233 1.0857880310568233 1.0857880310568233)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.073062710369019 0)
"cameras" SET Transform eulerAngles (6.0160876754478245 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8176710225794561
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.817389672080444
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07210198316249095
"cameras/drone/drone0" SET Transform localPosition (-0.27974675950107963 0.21525356279265678 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.42957383803807625 1.0371578066449243 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 12 -9)
"cameras/drone/drone0" SET Transform localScale (1.0757233203602792 1.0757233203602792 1.0757233203602792)
"cameras/drone/drone1" SET Transform localEulerAngles (18 10 18)
"cameras/drone/drone1" SET Transform localScale (0.9086652879224881 0.9086652879224881 0.9086652879224881)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2800275523898774 0)
"cameras" SET Transform eulerAngles (-13.430626300909765 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5866836342427029
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0596289356708648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15042830874472474
"cameras/drone/drone0" SET Transform localPosition (0.1774056958166801 0.29809536592683955 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2492142470189327 1.1204621363506595 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -15 15)
"cameras/drone/drone0" SET Transform localScale (1.169016074804853 1.169016074804853 1.169016074804853)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -13 -1)
"cameras/drone/drone1" SET Transform localScale (1.2983944021313731 1.2983944021313731 1.2983944021313731)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.728289230581074 0)
"cameras" SET Transform eulerAngles (-19.339673015638574 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4882646044279948
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2095359770814436
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19453887889905974
"cameras/drone/drone0" SET Transform localPosition (1.1948625351913076 0.33874665991416747 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3871482016327552 1.2106351909129434 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -15 -12)
"cameras/drone/drone0" SET Transform localScale (0.7749509197423214 0.7749509197423214 0.7749509197423214)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -4 17)
"cameras/drone/drone1" SET Transform localScale (1.4130303696048077 1.4130303696048077 1.4130303696048077)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.800847075041352 0)
"cameras" SET Transform eulerAngles (17.189404302643013 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4279464837618485
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4016917703880347
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36858648325078347
"cameras/drone/drone0" SET Transform localPosition (0.8735616667423838 0.2975493337966126 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.13136073842365 1.0842541589960604 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -3 -4)
"cameras/drone/drone0" SET Transform localScale (1.057709893226705 1.057709893226705 1.057709893226705)
"cameras/drone/drone1" SET Transform localEulerAngles (1 10 5)
"cameras/drone/drone1" SET Transform localScale (0.6729082991685486 0.6729082991685486 0.6729082991685486)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6397575693418034 0)
"cameras" SET Transform eulerAngles (14.479653522535934 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8481245579910999
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.803977619269253
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.023942838054946014
"cameras/drone/drone0" SET Transform localPosition (1.1247452333035481 0.6861900746151355 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7077818926595816 0.9801557337086864 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 1 0)
"cameras/drone/drone0" SET Transform localScale (1.2761743569672968 1.2761743569672968 1.2761743569672968)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -5 12)
"cameras/drone/drone1" SET Transform localScale (1.498459449058219 1.498459449058219 1.498459449058219)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 38
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.086746255389623 0)
"cameras" SET Transform eulerAngles (0.8558050769397276 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7954931702390411
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.906197861419549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17837009065913675
"cameras/drone/drone0" SET Transform localPosition (0.19435424872257423 -0.28639023811743874 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5796664023202802 1.2872631897365814 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -5 7)
"cameras/drone/drone0" SET Transform localScale (1.2503591720162723 1.2503591720162723 1.2503591720162723)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 18 -17)
"cameras/drone/drone1" SET Transform localScale (1.0182630614346901 1.0182630614346901 1.0182630614346901)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4299425652946396 0)
"cameras" SET Transform eulerAngles (-9.41071220823018 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6703585159258851
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.295100508321564
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19516262767221498
"cameras/drone/drone0" SET Transform localPosition (-0.4456613015200054 0.206794943249553 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12709334383122628 0.8347941634927707 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 15 3)
"cameras/drone/drone0" SET Transform localScale (0.9005110092778729 0.9005110092778729 0.9005110092778729)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 9 19)
"cameras/drone/drone1" SET Transform localScale (0.8151296412296748 0.8151296412296748 0.8151296412296748)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2394774808181825 0)
"cameras" SET Transform eulerAngles (-3.5057913869467363 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47068822415025985
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2079835743632108
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17481701349273404
"cameras/drone/drone0" SET Transform localPosition (0.38344662255652784 0.22331688419288492 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.07882096719993403 1.0094854659455765 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -2 9)
"cameras/drone/drone0" SET Transform localScale (0.7635162749424753 0.7635162749424753 0.7635162749424753)
"cameras/drone/drone1" SET Transform localEulerAngles (0 9 -8)
"cameras/drone/drone1" SET Transform localScale (0.7230338873899724 0.7230338873899724 0.7230338873899724)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.405801442655144 0)
"cameras" SET Transform eulerAngles (19.51605196739436 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2194366898381317
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3759905394210694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36328246494324345
"cameras/drone/drone0" SET Transform localPosition (-0.6108935598336531 0.12994878882337096 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.04319691385412816 0.8221195876960293 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 7 13)
"cameras/drone/drone0" SET Transform localScale (0.7935081647731639 0.7935081647731639 0.7935081647731639)
"cameras/drone/drone1" SET Transform localEulerAngles (12 19 19)
"cameras/drone/drone1" SET Transform localScale (0.7300165922347079 0.7300165922347079 0.7300165922347079)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7959006356065776 0)
"cameras" SET Transform eulerAngles (-15.43380413532892 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8872423462205572
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9617102906420198
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3362497812414181
"cameras/drone/drone0" SET Transform localPosition (0.24287059317462423 0.4483468114650098 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3319306122733632 1.216022153651278 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 2 -4)
"cameras/drone/drone0" SET Transform localScale (1.2876410107475826 1.2876410107475826 1.2876410107475826)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -10 20)
"cameras/drone/drone1" SET Transform localScale (0.7559878637611991 0.7559878637611991 0.7559878637611991)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6304736279842675 0)
"cameras" SET Transform eulerAngles (4.1675389105751 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1825839549601822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0100038405227707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3928040502196928
"cameras/drone/drone0" SET Transform localPosition (0.8359154412499519 0.5197787111566217 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.16085773529548408 0.9261160857654548 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -14 -4)
"cameras/drone/drone0" SET Transform localScale (0.748270102320065 0.748270102320065 0.748270102320065)
"cameras/drone/drone1" SET Transform localEulerAngles (20 13 -8)
"cameras/drone/drone1" SET Transform localScale (0.6398005772419815 0.6398005772419815 0.6398005772419815)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0906038601062424 0)
"cameras" SET Transform eulerAngles (5.894949367558063 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4669162817425536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9423657224852424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3694029498061599
"cameras/drone/drone0" SET Transform localPosition (0.5875279421297128 0.35698464532091295 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3136883282616455 0.8244223669997774 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 2 16)
"cameras/drone/drone0" SET Transform localScale (1.1365959230342702 1.1365959230342702 1.1365959230342702)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -10 -10)
"cameras/drone/drone1" SET Transform localScale (1.2248023605137621 1.2248023605137621 1.2248023605137621)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.719980888295356 0)
"cameras" SET Transform eulerAngles (-0.8435887543205247 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40954119900235236
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5823990099943794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08717138718187463
"cameras/drone/drone0" SET Transform localPosition (0.47471772294447523 -0.15909243255018896 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.005051511530869 0.879064584346902 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -8 -4)
"cameras/drone/drone0" SET Transform localScale (0.6548484936190048 0.6548484936190048 0.6548484936190048)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -2 8)
"cameras/drone/drone1" SET Transform localScale (1.2054344084114028 1.2054344084114028 1.2054344084114028)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7261098666423695 0)
"cameras" SET Transform eulerAngles (12.66589766360486 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.028051313576829
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.289629782538088
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10610369966199525
"cameras/drone/drone0" SET Transform localPosition (1.1035445437626141 0.6700935236195589 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06402350945826751 1.2254140104628481 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 15 -14)
"cameras/drone/drone0" SET Transform localScale (1.3859266978246683 1.3859266978246683 1.3859266978246683)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 1 -12)
"cameras/drone/drone1" SET Transform localScale (0.6973635070070103 0.6973635070070103 0.6973635070070103)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.060598310757849 0)
"cameras" SET Transform eulerAngles (12.53532554491747 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0699329798324746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8730965948802272
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23234882810423516
"cameras/drone/drone0" SET Transform localPosition (0.7016159341148156 -0.18322121582563483 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.47185672205341256 1.158470084551094 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -4 -1)
"cameras/drone/drone0" SET Transform localScale (1.4666358784128875 1.4666358784128875 1.4666358784128875)
"cameras/drone/drone1" SET Transform localEulerAngles (16 10 -1)
"cameras/drone/drone1" SET Transform localScale (0.7736764731699635 0.7736764731699635 0.7736764731699635)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.585640202962059 0)
"cameras" SET Transform eulerAngles (-18.258766993891648 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2344300783180282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4689315671369296
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23047808868144953
"cameras/drone/drone0" SET Transform localPosition (0.6013841002110356 0.22139620173614555 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.030765395560228 1.139459053558232 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -18 -12)
"cameras/drone/drone0" SET Transform localScale (1.4659365846746906 1.4659365846746906 1.4659365846746906)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -20 3)
"cameras/drone/drone1" SET Transform localScale (1.221513932990196 1.221513932990196 1.221513932990196)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.231340045663633 0)
"cameras" SET Transform eulerAngles (3.4539522541426315 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4081296015664408
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6998614599965336
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2510943414883237
"cameras/drone/drone0" SET Transform localPosition (0.6044466351028728 0.37256811652001026 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1983090242293504 1.070682572437321 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -4 3)
"cameras/drone/drone0" SET Transform localScale (1.1849270334487367 1.1849270334487367 1.1849270334487367)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -11 2)
"cameras/drone/drone1" SET Transform localScale (1.3121587973585978 1.3121587973585978 1.3121587973585978)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5460482239738074 0)
"cameras" SET Transform eulerAngles (15.800415555871531 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.084563587872951
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6096586665027492
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22093127578286495
"cameras/drone/drone0" SET Transform localPosition (-0.06847271575237568 0.6132530130395151 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7080507104587517 0.8559402843907054 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 4 16)
"cameras/drone/drone0" SET Transform localScale (0.8270377329549742 0.8270377329549742 0.8270377329549742)
"cameras/drone/drone1" SET Transform localEulerAngles (4 18 -8)
"cameras/drone/drone1" SET Transform localScale (0.6877872986538959 0.6877872986538959 0.6877872986538959)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.357127196716225 0)
"cameras" SET Transform eulerAngles (18.186780814115032 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4201134685475268
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9511657204916197
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19093350950914814
"cameras/drone/drone0" SET Transform localPosition (1.1555097167056287 0.1742737550271301 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7280631520213054 1.2901259101402185 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 18 -8)
"cameras/drone/drone0" SET Transform localScale (1.4318422403911324 1.4318422403911324 1.4318422403911324)
"cameras/drone/drone1" SET Transform localEulerAngles (0 3 -20)
"cameras/drone/drone1" SET Transform localScale (0.8467583973295693 0.8467583973295693 0.8467583973295693)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.379110676388385 0)
"cameras" SET Transform eulerAngles (12.099629077090071 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2885493272527038
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.395068363910411
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20617862537751544
"cameras/drone/drone0" SET Transform localPosition (-0.751862576401888 0.17396823068124928 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.616476728667464 1.0980192505368638 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 10 -9)
"cameras/drone/drone0" SET Transform localScale (1.095743845679705 1.095743845679705 1.095743845679705)
"cameras/drone/drone1" SET Transform localEulerAngles (2 0 -6)
"cameras/drone/drone1" SET Transform localScale (1.1414694164075683 1.1414694164075683 1.1414694164075683)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.930658294058479 0)
"cameras" SET Transform eulerAngles (12.661683393128783 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7489667705826248
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.485144608322086
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3347126729506655
"cameras/drone/drone0" SET Transform localPosition (-1.0898133701255321 -0.08005339689175467 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8488553943508304 1.0164613325590812 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 12 -11)
"cameras/drone/drone0" SET Transform localScale (1.3391833810162495 1.3391833810162495 1.3391833810162495)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -20 12)
"cameras/drone/drone1" SET Transform localScale (0.6690888407764183 0.6690888407764183 0.6690888407764183)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0872359728165035 0)
"cameras" SET Transform eulerAngles (-15.370875062429544 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0321761064653978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7515164463787798
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24461425914510693
"cameras/drone/drone0" SET Transform localPosition (0.9499783309759999 -0.04787100460445631 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1813204561345951 0.9675769662066569 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -6 -15)
"cameras/drone/drone0" SET Transform localScale (1.3123910269270884 1.3123910269270884 1.3123910269270884)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -4 -13)
"cameras/drone/drone1" SET Transform localScale (1.1902187018446049 1.1902187018446049 1.1902187018446049)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.353642803511841 0)
"cameras" SET Transform eulerAngles (3.604557743090105 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3071564341919224
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0520855147025743
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1868657880725344
"cameras/drone/drone0" SET Transform localPosition (0.5777599582783988 0.48646796601163506 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28710900103485737 1.1709562272330756 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 10 -10)
"cameras/drone/drone0" SET Transform localScale (1.2139361803030404 1.2139361803030404 1.2139361803030404)
"cameras/drone/drone1" SET Transform localEulerAngles (16 1 17)
"cameras/drone/drone1" SET Transform localScale (0.7293785670104019 0.7293785670104019 0.7293785670104019)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.858928869768049 0)
"cameras" SET Transform eulerAngles (19.419884254645098 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.329550114248513
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9040359936224842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0257261961397405
"cameras/drone/drone0" SET Transform localPosition (0.16753867933561084 0.23078143921125532 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3388662897415704 1.2404631204280698 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -19 2)
"cameras/drone/drone0" SET Transform localScale (1.236345617562955 1.236345617562955 1.236345617562955)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -11 20)
"cameras/drone/drone1" SET Transform localScale (1.1416824740174052 1.1416824740174052 1.1416824740174052)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.870254563197295 0)
"cameras" SET Transform eulerAngles (-5.662591346682948 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1165205411375452
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2283873995409786
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1504988756433397
"cameras/drone/drone0" SET Transform localPosition (-1.1223165451354455 -0.2848620330292157 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1754991422881691 1.0494488875036994 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -15 11)
"cameras/drone/drone0" SET Transform localScale (1.1683239996830737 1.1683239996830737 1.1683239996830737)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -3 8)
"cameras/drone/drone1" SET Transform localScale (1.479265617515904 1.479265617515904 1.479265617515904)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.198089974301756 0)
"cameras" SET Transform eulerAngles (2.9033304223216305 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5842777879525888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.728471452539711
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05403628216915073
"cameras/drone/drone0" SET Transform localPosition (0.18635256115939813 -0.20951518166711486 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.25391568648121954 0.8466102496383205 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 11 12)
"cameras/drone/drone0" SET Transform localScale (1.35945781810656 1.35945781810656 1.35945781810656)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 14 2)
"cameras/drone/drone1" SET Transform localScale (0.7379072647619886 0.7379072647619886 0.7379072647619886)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.503444996084137 0)
"cameras" SET Transform eulerAngles (-4.121904932148386 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6080355008721652
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7953244094980372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04696343935582839
"cameras/drone/drone0" SET Transform localPosition (-0.7756733258811377 0.03711919046749795 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3465306596858275 1.0491915924054698 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -13 -1)
"cameras/drone/drone0" SET Transform localScale (0.8669842475159519 0.8669842475159519 0.8669842475159519)
"cameras/drone/drone1" SET Transform localEulerAngles (11 3 -9)
"cameras/drone/drone1" SET Transform localScale (0.6874851521208503 0.6874851521208503 0.6874851521208503)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2648257130946545 0)
"cameras" SET Transform eulerAngles (-1.0611163297303605 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.036340471726201
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.541000846859799
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09959778924578928
"cameras/drone/drone0" SET Transform localPosition (-0.9436371807167256 0.6025390585796275 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7582687693843839 0.8146409378163453 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -2 -20)
"cameras/drone/drone0" SET Transform localScale (1.4005952399121073 1.4005952399121073 1.4005952399121073)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -6 -18)
"cameras/drone/drone1" SET Transform localScale (0.888147345510905 0.888147345510905 0.888147345510905)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9978760182046713 0)
"cameras" SET Transform eulerAngles (-0.32483840229470573 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5945692494953394
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8436478077244882
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3285596899307063
"cameras/drone/drone0" SET Transform localPosition (-0.24660280502076692 0.21856673186580794 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.30448565308154685 0.878336396673406 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 13 8)
"cameras/drone/drone0" SET Transform localScale (1.0323313563339491 1.0323313563339491 1.0323313563339491)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -14 2)
"cameras/drone/drone1" SET Transform localScale (0.7099048415647811 0.7099048415647811 0.7099048415647811)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.087131139840235 0)
"cameras" SET Transform eulerAngles (-5.1585045037226465 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6055552779065801
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.63599273262916
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35300095981837304
"cameras/drone/drone0" SET Transform localPosition (0.32326887785656666 0.692903717245049 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2555633582132326 1.1492918330315982 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -10 -15)
"cameras/drone/drone0" SET Transform localScale (1.1541634683254418 1.1541634683254418 1.1541634683254418)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -4 -10)
"cameras/drone/drone1" SET Transform localScale (1.0374921428430852 1.0374921428430852 1.0374921428430852)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8367056338396357 0)
"cameras" SET Transform eulerAngles (-4.831849452317737 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0197333154691837
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1383694622115006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3814103597359741
"cameras/drone/drone0" SET Transform localPosition (0.34898558766279475 0.4544714293264846 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.272881100908952 1.020892014034884 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -7 4)
"cameras/drone/drone0" SET Transform localScale (1.0356008425128953 1.0356008425128953 1.0356008425128953)
"cameras/drone/drone1" SET Transform localEulerAngles (9 19 12)
"cameras/drone/drone1" SET Transform localScale (0.7332572945652749 0.7332572945652749 0.7332572945652749)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0016466811804463 0)
"cameras" SET Transform eulerAngles (7.6420864145087855 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6105711220040337
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2511699728594412
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1684271615474572
"cameras/drone/drone0" SET Transform localPosition (-0.3250609475469982 0.21913730527703174 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1506000606830422 1.0877853223540552 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -7 -4)
"cameras/drone/drone0" SET Transform localScale (1.1835308477671624 1.1835308477671624 1.1835308477671624)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -17 12)
"cameras/drone/drone1" SET Transform localScale (1.264718804327516 1.264718804327516 1.264718804327516)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2494601453271375 0)
"cameras" SET Transform eulerAngles (-9.468071226157146 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5574387332059025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0568484852989193
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3906301867353057
"cameras/drone/drone0" SET Transform localPosition (0.3489479075182891 0.5505589498695609 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.194061982784674 0.9571102596820849 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -18 15)
"cameras/drone/drone0" SET Transform localScale (0.6468315860252415 0.6468315860252415 0.6468315860252415)
"cameras/drone/drone1" SET Transform localEulerAngles (0 15 -13)
"cameras/drone/drone1" SET Transform localScale (1.3832425768801033 1.3832425768801033 1.3832425768801033)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6552615281723524 0)
"cameras" SET Transform eulerAngles (14.267920037904403 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6826078754114207
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9216784668125877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0020309053223720674
"cameras/drone/drone0" SET Transform localPosition (0.3325278256016577 -0.09105967704839218 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.058029191295242 0.9465045892071045 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 11 -9)
"cameras/drone/drone0" SET Transform localScale (0.9254996931025392 0.9254996931025392 0.9254996931025392)
"cameras/drone/drone1" SET Transform localEulerAngles (15 8 19)
"cameras/drone/drone1" SET Transform localScale (0.7073034281580094 0.7073034281580094 0.7073034281580094)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.778485591485678 0)
"cameras" SET Transform eulerAngles (8.733727794908486 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6921668988107943
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7722336472732736
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33765682479935544
"cameras/drone/drone0" SET Transform localPosition (0.8925779610116 0.2330045222941472 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.327360704815994 1.2525857352336294 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -17 -4)
"cameras/drone/drone0" SET Transform localScale (0.6165520863095981 0.6165520863095981 0.6165520863095981)
"cameras/drone/drone1" SET Transform localEulerAngles (8 7 -10)
"cameras/drone/drone1" SET Transform localScale (0.7893768174272651 0.7893768174272651 0.7893768174272651)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.690929765012863 0)
"cameras" SET Transform eulerAngles (-18.622788907469516 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4469745480941779
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4013275032272354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1669981697254137
"cameras/drone/drone0" SET Transform localPosition (-1.0453197379986772 0.32183960973610376 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.36086581444214794 0.9675364426780273 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 4 11)
"cameras/drone/drone0" SET Transform localScale (0.8355347035688814 0.8355347035688814 0.8355347035688814)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 20 15)
"cameras/drone/drone1" SET Transform localScale (1.3582106177199829 1.3582106177199829 1.3582106177199829)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.060368131293643 0)
"cameras" SET Transform eulerAngles (-11.902646054921684 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.33317541637386
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6638540907147497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02118465743893192
"cameras/drone/drone0" SET Transform localPosition (-0.4890278170813527 0.5115163195902581 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.30847356987029917 0.849934960099278 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 6 -20)
"cameras/drone/drone0" SET Transform localScale (0.748780686076547 0.748780686076547 0.748780686076547)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -17 -8)
"cameras/drone/drone1" SET Transform localScale (1.2756338282472828 1.2756338282472828 1.2756338282472828)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.95004130928014 0)
"cameras" SET Transform eulerAngles (-10.499420408536725 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3098764656778128
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.650001520889972
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.028034354812406504
"cameras/drone/drone0" SET Transform localPosition (-0.8216253764075805 0.6736307767879175 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.00807204159410757 0.9150624273946488 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -1 -12)
"cameras/drone/drone0" SET Transform localScale (0.6124323124362608 0.6124323124362608 0.6124323124362608)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 10 9)
"cameras/drone/drone1" SET Transform localScale (1.3500472988835726 1.3500472988835726 1.3500472988835726)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.26242800981227 0)
"cameras" SET Transform eulerAngles (1.250677352045507 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4464414735445899
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.385748103873543
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12539587354481682
"cameras/drone/drone0" SET Transform localPosition (0.3086010418565459 0.2589849275605505 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6905629436073351 1.2812385968601163 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -6 9)
"cameras/drone/drone0" SET Transform localScale (0.6920941238131825 0.6920941238131825 0.6920941238131825)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -14 0)
"cameras/drone/drone1" SET Transform localScale (1.4806148258255338 1.4806148258255338 1.4806148258255338)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.985604682963465 0)
"cameras" SET Transform eulerAngles (5.154289432438919 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9253280155275151
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8186111060871106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08663554358073361
"cameras/drone/drone0" SET Transform localPosition (0.9593200859653417 -0.2805255784940435 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.26933102259265507 1.2254564716891758 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -6 -6)
"cameras/drone/drone0" SET Transform localScale (0.632664035899741 0.632664035899741 0.632664035899741)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 3 -1)
"cameras/drone/drone1" SET Transform localScale (1.1062693703865771 1.1062693703865771 1.1062693703865771)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.935090651360296 0)
"cameras" SET Transform eulerAngles (-15.737391385004083 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9329340912675739
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9722617682750888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09808456967668029
"cameras/drone/drone0" SET Transform localPosition (1.05749079626021 0.535556378370734 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0796383032717067 0.864787586647663 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -18 9)
"cameras/drone/drone0" SET Transform localScale (1.1992764143875394 1.1992764143875394 1.1992764143875394)
"cameras/drone/drone1" SET Transform localEulerAngles (0 10 8)
"cameras/drone/drone1" SET Transform localScale (1.4333676606225514 1.4333676606225514 1.4333676606225514)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.857169379087178 0)
"cameras" SET Transform eulerAngles (4.397331138711515 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5937599496815296
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2376210195746888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05697028853321604
"cameras/drone/drone0" SET Transform localPosition (0.4216759940420143 0.29485907157376606 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09812044233363126 0.958813559537113 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 8 -5)
"cameras/drone/drone0" SET Transform localScale (1.248237649923135 1.248237649923135 1.248237649923135)
"cameras/drone/drone1" SET Transform localEulerAngles (14 14 1)
"cameras/drone/drone1" SET Transform localScale (0.963182141107271 0.963182141107271 0.963182141107271)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.349955601713597 0)
"cameras" SET Transform eulerAngles (15.949899075938646 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.323703113276977
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4641361552908831
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1396792224844139
"cameras/drone/drone0" SET Transform localPosition (-0.33134351458610733 -0.18777811083705548 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7456621914465424 1.0987077025022125 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -3 7)
"cameras/drone/drone0" SET Transform localScale (1.1677408873233652 1.1677408873233652 1.1677408873233652)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -11 16)
"cameras/drone/drone1" SET Transform localScale (0.870592734486556 0.870592734486556 0.870592734486556)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.837827166665984 0)
"cameras" SET Transform eulerAngles (-3.6705780558161685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5999404219986042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7371622468665944
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20413552822838216
"cameras/drone/drone0" SET Transform localPosition (-1.0566740163552912 0.3567553724119837 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5353264672295985 1.1948737909215208 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 0 -12)
"cameras/drone/drone0" SET Transform localScale (1.0104284962299945 1.0104284962299945 1.0104284962299945)
"cameras/drone/drone1" SET Transform localEulerAngles (16 12 -10)
"cameras/drone/drone1" SET Transform localScale (0.9487718695352436 0.9487718695352436 0.9487718695352436)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.608065784071503 0)
"cameras" SET Transform eulerAngles (2.975577173505858 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5215634588373792
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8185104185380705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07838621132043239
"cameras/drone/drone0" SET Transform localPosition (-0.5748358466672464 -0.17891488837981445 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.27411861885377964 0.8682093793910169 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -20 -8)
"cameras/drone/drone0" SET Transform localScale (0.8388852201159115 0.8388852201159115 0.8388852201159115)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -18 -18)
"cameras/drone/drone1" SET Transform localScale (0.6512445804844311 0.6512445804844311 0.6512445804844311)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.040895527693436 0)
"cameras" SET Transform eulerAngles (-4.164165677182439 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.274880467186663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1041664645074536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37560866113911945
"cameras/drone/drone0" SET Transform localPosition (0.482449448156105 0.41898577105668205 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7949779184999699 1.0558200504241015 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 18 -9)
"cameras/drone/drone0" SET Transform localScale (0.6047340873730487 0.6047340873730487 0.6047340873730487)
"cameras/drone/drone1" SET Transform localEulerAngles (10 0 -7)
"cameras/drone/drone1" SET Transform localScale (1.2147374097090002 1.2147374097090002 1.2147374097090002)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7148798794525657 0)
"cameras" SET Transform eulerAngles (-10.139671412484974 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5381929790383938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0917728689692008
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29762583732247244
"cameras/drone/drone0" SET Transform localPosition (-0.1448024800417258 0.10233344468182143 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7701104360886002 0.8036773302058366 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 6 -12)
"cameras/drone/drone0" SET Transform localScale (1.319112014450579 1.319112014450579 1.319112014450579)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -5 0)
"cameras/drone/drone1" SET Transform localScale (0.7783632468471146 0.7783632468471146 0.7783632468471146)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.158973246350337 0)
"cameras" SET Transform eulerAngles (1.5278545467210307 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3659703650322699
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9411566512636997
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09818589176287779
"cameras/drone/drone0" SET Transform localPosition (-0.8416904933238637 -0.16511954655069833 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2849725312484217 1.2337113405492186 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -18 -11)
"cameras/drone/drone0" SET Transform localScale (1.3709145355993881 1.3709145355993881 1.3709145355993881)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -4 4)
"cameras/drone/drone1" SET Transform localScale (0.8204045659481727 0.8204045659481727 0.8204045659481727)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.647910334160403 0)
"cameras" SET Transform eulerAngles (9.0918380711448 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0268666487911238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3260027999072954
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15672629191569248
"cameras/drone/drone0" SET Transform localPosition (0.2837788952965863 0.6232916375637729 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5572517298475965 1.245194897863016 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 7 7)
"cameras/drone/drone0" SET Transform localScale (0.9978945184129879 0.9978945184129879 0.9978945184129879)
"cameras/drone/drone1" SET Transform localEulerAngles (9 14 0)
"cameras/drone/drone1" SET Transform localScale (0.9522341825661809 0.9522341825661809 0.9522341825661809)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.932574713177433 0)
"cameras" SET Transform eulerAngles (5.969052524689673 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3468663317251068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4347517627682733
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.027260054878635344
"cameras/drone/drone0" SET Transform localPosition (0.15440166865091354 0.16660954093958508 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4813464108619394 1.0310534107227367 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -6 6)
"cameras/drone/drone0" SET Transform localScale (0.8067040889003089 0.8067040889003089 0.8067040889003089)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -4 9)
"cameras/drone/drone1" SET Transform localScale (1.2156209673346814 1.2156209673346814 1.2156209673346814)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.657747389839157 0)
"cameras" SET Transform eulerAngles (-10.139868881940348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5019437925232344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.02899583683607
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14269790348838837
"cameras/drone/drone0" SET Transform localPosition (0.6951928626909838 0.24929338385469463 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.46100381198916396 0.9305728328709266 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 12 -6)
"cameras/drone/drone0" SET Transform localScale (1.2891166902176465 1.2891166902176465 1.2891166902176465)
"cameras/drone/drone1" SET Transform localEulerAngles (2 13 -10)
"cameras/drone/drone1" SET Transform localScale (1.0651506080340023 1.0651506080340023 1.0651506080340023)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.685672082123226 0)
"cameras" SET Transform eulerAngles (2.5045538789467017 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4520945954931128
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9876531363686268
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18955647560911992
"cameras/drone/drone0" SET Transform localPosition (-0.9154681878189117 0.44142723224999797 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23104624212570757 1.266719522815014 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 6 -1)
"cameras/drone/drone0" SET Transform localScale (1.1404996403924776 1.1404996403924776 1.1404996403924776)
"cameras/drone/drone1" SET Transform localEulerAngles (8 18 1)
"cameras/drone/drone1" SET Transform localScale (0.7146645978268973 0.7146645978268973 0.7146645978268973)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.587878699033412 0)
"cameras" SET Transform eulerAngles (-4.336361750604588 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5961438829973296
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3680632006747766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0955158116830333
"cameras/drone/drone0" SET Transform localPosition (1.178906492133008 0.6439453759956375 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.06283002944170013 1.1144897389915913 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 16 13)
"cameras/drone/drone0" SET Transform localScale (0.8021961665883135 0.8021961665883135 0.8021961665883135)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 11 2)
"cameras/drone/drone1" SET Transform localScale (1.2165079016232343 1.2165079016232343 1.2165079016232343)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5437465455237316 0)
"cameras" SET Transform eulerAngles (18.644780932777515 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0678675686426216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9757834450542804
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025623306761543143
"cameras/drone/drone0" SET Transform localPosition (1.1207783475724795 -0.22878226797230355 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.005135610867559981 1.159985270595365 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -15 8)
"cameras/drone/drone0" SET Transform localScale (1.1081954135082945 1.1081954135082945 1.1081954135082945)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -8 3)
"cameras/drone/drone1" SET Transform localScale (1.3720050500645162 1.3720050500645162 1.3720050500645162)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4522228633405465 0)
"cameras" SET Transform eulerAngles (2.20102892635839 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47471896687751863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0400834181804572
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3092014785807991
"cameras/drone/drone0" SET Transform localPosition (0.09756517758895233 0.03623588060515398 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2753745557622148 1.0475434121404983 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 15 7)
"cameras/drone/drone0" SET Transform localScale (0.7725586496651545 0.7725586496651545 0.7725586496651545)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -5 10)
"cameras/drone/drone1" SET Transform localScale (0.7007683263667079 0.7007683263667079 0.7007683263667079)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.853562583313215 0)
"cameras" SET Transform eulerAngles (-8.956842540742564 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.534158309324089
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.104791833223751
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1802434038507557
"cameras/drone/drone0" SET Transform localPosition (0.1782917738478893 -0.2770959117137127 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3030434872637182 1.218601975343 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -17 -15)
"cameras/drone/drone0" SET Transform localScale (0.8858712516328839 0.8858712516328839 0.8858712516328839)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -16 -19)
"cameras/drone/drone1" SET Transform localScale (1.2073126660535927 1.2073126660535927 1.2073126660535927)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.839816403447966 0)
"cameras" SET Transform eulerAngles (17.00650788878807 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46499460378672836
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.03216051473543
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39205249189514496
"cameras/drone/drone0" SET Transform localPosition (0.14204813649323023 0.6750280978700243 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1187628868731696 1.154038136983734 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -16 -17)
"cameras/drone/drone0" SET Transform localScale (1.4336307862193403 1.4336307862193403 1.4336307862193403)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -5 -4)
"cameras/drone/drone1" SET Transform localScale (1.393814063740042 1.393814063740042 1.393814063740042)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.724021175194404 0)
"cameras" SET Transform eulerAngles (-19.649951798025988 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8480276063907778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.078805955833513
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30255802960290556
"cameras/drone/drone0" SET Transform localPosition (0.5968767335929437 -0.18065909690095933 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.050389489269852206 1.0648811316934252 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 8 14)
"cameras/drone/drone0" SET Transform localScale (1.4754213650128103 1.4754213650128103 1.4754213650128103)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 12 -16)
"cameras/drone/drone1" SET Transform localScale (0.9468144029137366 0.9468144029137366 0.9468144029137366)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0014754641294585 0)
"cameras" SET Transform eulerAngles (-2.788311814405038 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8937605339199728
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.962473686639718
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3915764369513036
"cameras/drone/drone0" SET Transform localPosition (0.21799801889149983 0.6041407914359547 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5068740980355955 1.078899361695727 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -7 -8)
"cameras/drone/drone0" SET Transform localScale (1.422653078297829 1.422653078297829 1.422653078297829)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -15 11)
"cameras/drone/drone1" SET Transform localScale (0.84162247308703 0.84162247308703 0.84162247308703)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.432113116469272 0)
"cameras" SET Transform eulerAngles (18.97240745473116 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5730386617820278
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0420297226889506
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15369386037703825
"cameras/drone/drone0" SET Transform localPosition (-0.8070978427352976 -0.2907012929387662 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.026431111188636613 0.9498153379345501 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -4 1)
"cameras/drone/drone0" SET Transform localScale (0.773682132451904 0.773682132451904 0.773682132451904)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -19 -4)
"cameras/drone/drone1" SET Transform localScale (1.281210364147467 1.281210364147467 1.281210364147467)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1152828626654823 0)
"cameras" SET Transform eulerAngles (-13.36738636416893 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1105135251753482
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.961373475541699
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.020140277726517875
"cameras/drone/drone0" SET Transform localPosition (0.47153006573123046 0.6263251095243416 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8898117926940066 1.0886164518898749 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -6 -10)
"cameras/drone/drone0" SET Transform localScale (0.6098170669182564 0.6098170669182564 0.6098170669182564)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -2 -14)
"cameras/drone/drone1" SET Transform localScale (0.8444823824726229 0.8444823824726229 0.8444823824726229)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.146375567078964 0)
"cameras" SET Transform eulerAngles (13.687762618506405 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7838707124750646
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1405999337678498
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10488113497564525
"cameras/drone/drone0" SET Transform localPosition (0.43903895368148627 0.2720865245798684 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9818001846831214 0.9905281122411671 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 1 5)
"cameras/drone/drone0" SET Transform localScale (0.6829209859145924 0.6829209859145924 0.6829209859145924)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -6 -7)
"cameras/drone/drone1" SET Transform localScale (1.1934670551267512 1.1934670551267512 1.1934670551267512)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1028494477550885 0)
"cameras" SET Transform eulerAngles (-19.459822653705274 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0134773926136635
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.224357793691269
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07187541349991898
"cameras/drone/drone0" SET Transform localPosition (0.28928702122581784 0.18320675476471776 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2020858589819563 1.2714627044904692 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 17 -17)
"cameras/drone/drone0" SET Transform localScale (0.6874610719065218 0.6874610719065218 0.6874610719065218)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -14 18)
"cameras/drone/drone1" SET Transform localScale (1.3978625894479833 1.3978625894479833 1.3978625894479833)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.870338383170274 0)
"cameras" SET Transform eulerAngles (7.173042929434619 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2005499419136945
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6458815567821785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10610727293183797
"cameras/drone/drone0" SET Transform localPosition (-0.6511015342360218 0.35628529643860446 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.030525484307244 0.9623592909282821 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 9 12)
"cameras/drone/drone0" SET Transform localScale (1.4052497699925124 1.4052497699925124 1.4052497699925124)
"cameras/drone/drone1" SET Transform localEulerAngles (2 0 -18)
"cameras/drone/drone1" SET Transform localScale (1.238127667513092 1.238127667513092 1.238127667513092)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.451870966596694 0)
"cameras" SET Transform eulerAngles (-12.163650281641111 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9298937975607585
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5364078806682746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09564333198541389
"cameras/drone/drone0" SET Transform localPosition (0.25259771221149707 0.5561479310755777 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.477933455240682 0.9866232283756804 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -12 -12)
"cameras/drone/drone0" SET Transform localScale (0.8439703313270699 0.8439703313270699 0.8439703313270699)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 17 -16)
"cameras/drone/drone1" SET Transform localScale (0.8115347205763245 0.8115347205763245 0.8115347205763245)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.316847698627869 0)
"cameras" SET Transform eulerAngles (6.300070501217686 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4993789601679008
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8994180062012265
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01662072658232381
"cameras/drone/drone0" SET Transform localPosition (1.102205319142403 0.13941232386040964 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8450016529377107 0.8883617336381728 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 19 -13)
"cameras/drone/drone0" SET Transform localScale (0.7325257162357286 0.7325257162357286 0.7325257162357286)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -9 -17)
"cameras/drone/drone1" SET Transform localScale (1.0556306098809247 1.0556306098809247 1.0556306098809247)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2106915547458215 0)
"cameras" SET Transform eulerAngles (-19.8510538685267 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1489078663944652
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.671210943629338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2098127741496832
"cameras/drone/drone0" SET Transform localPosition (-0.38564191767304634 0.04592038456378017 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05480961589234612 1.2511885065971415 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -19 0)
"cameras/drone/drone0" SET Transform localScale (1.0777882954236404 1.0777882954236404 1.0777882954236404)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -4 -14)
"cameras/drone/drone1" SET Transform localScale (0.9583671252402912 0.9583671252402912 0.9583671252402912)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.391385337697977 0)
"cameras" SET Transform eulerAngles (-16.487367524980392 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40864724576711337
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0570957022529783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1258163368490151
"cameras/drone/drone0" SET Transform localPosition (-0.8022786887228837 -0.167195746104086 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28370082763055127 1.1938631101232275 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 13 -6)
"cameras/drone/drone0" SET Transform localScale (0.7214889189527098 0.7214889189527098 0.7214889189527098)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -3 -6)
"cameras/drone/drone1" SET Transform localScale (1.1122073551709493 1.1122073551709493 1.1122073551709493)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8371176898806487 0)
"cameras" SET Transform eulerAngles (15.63064022613866 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.263757804374762
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5223965786353435
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33931945266213903
"cameras/drone/drone0" SET Transform localPosition (-0.14782749321394228 -0.1521045076349538 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1022418601433539 1.0409159910824288 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -10 -12)
"cameras/drone/drone0" SET Transform localScale (1.232468660254017 1.232468660254017 1.232468660254017)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -7 -11)
"cameras/drone/drone1" SET Transform localScale (0.7937156356801001 0.7937156356801001 0.7937156356801001)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6238125840391637 0)
"cameras" SET Transform eulerAngles (-14.456000459896089 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0528936962942734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9984793166990964
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05322060121475643
"cameras/drone/drone0" SET Transform localPosition (0.9332774457453181 0.4866370209306205 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10742104548336551 1.1184922108504072 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 18 -8)
"cameras/drone/drone0" SET Transform localScale (1.173351884557534 1.173351884557534 1.173351884557534)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 3 9)
"cameras/drone/drone1" SET Transform localScale (1.406436098796791 1.406436098796791 1.406436098796791)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.612573831579767 0)
"cameras" SET Transform eulerAngles (12.391373928208317 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.971486069081671
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3349568155893956
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3326123162462533
"cameras/drone/drone0" SET Transform localPosition (-0.7245643740043359 0.029819028406889825 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23757393102909985 0.9978697550197623 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 13 17)
"cameras/drone/drone0" SET Transform localScale (0.6694949952949245 0.6694949952949245 0.6694949952949245)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 7 9)
"cameras/drone/drone1" SET Transform localScale (0.963100282420496 0.963100282420496 0.963100282420496)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6564454039497223 0)
"cameras" SET Transform eulerAngles (11.480039490265025 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2375071164213893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9038177272306084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3404758908866283
"cameras/drone/drone0" SET Transform localPosition (0.8517909797488448 0.6691393545527708 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5880373276349293 1.1246215271172355 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 15 6)
"cameras/drone/drone0" SET Transform localScale (0.7965894993067388 0.7965894993067388 0.7965894993067388)
"cameras/drone/drone1" SET Transform localEulerAngles (13 9 -12)
"cameras/drone/drone1" SET Transform localScale (0.7499276935408342 0.7499276935408342 0.7499276935408342)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.901711437285774 0)
"cameras" SET Transform eulerAngles (-5.129646930800016 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6819364437978055
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8826772896873836
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20762466323522055
"cameras/drone/drone0" SET Transform localPosition (0.3511755682396742 0.3166273180256624 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6244165295266088 1.2093387359136545 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -14 -8)
"cameras/drone/drone0" SET Transform localScale (0.836459577678274 0.836459577678274 0.836459577678274)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 11 -11)
"cameras/drone/drone1" SET Transform localScale (0.9403653225748836 0.9403653225748836 0.9403653225748836)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.521773746381674 0)
"cameras" SET Transform eulerAngles (4.924553402825914 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7811436998004384
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.818045470722276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13907624077775935
"cameras/drone/drone0" SET Transform localPosition (0.20019378337642424 0.4893408347484712 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.199923099122387 0.8973098412521836 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -14 16)
"cameras/drone/drone0" SET Transform localScale (0.7504368846710885 0.7504368846710885 0.7504368846710885)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 6 15)
"cameras/drone/drone1" SET Transform localScale (0.8425412731237253 0.8425412731237253 0.8425412731237253)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.171032968904448 0)
"cameras" SET Transform eulerAngles (-7.9884187165528395 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9900604167134267
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4686343585636683
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3653831694715994
"cameras/drone/drone0" SET Transform localPosition (1.0019490042512473 0.10891863127696227 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1823570781908523 1.1590620757399122 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -12 4)
"cameras/drone/drone0" SET Transform localScale (0.6210341279729598 0.6210341279729598 0.6210341279729598)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -13 13)
"cameras/drone/drone1" SET Transform localScale (0.9017443282164426 0.9017443282164426 0.9017443282164426)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.649364762217648 0)
"cameras" SET Transform eulerAngles (-10.20991933880559 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.585229028209529
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.531679239437532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2130932506324176
"cameras/drone/drone0" SET Transform localPosition (-0.7167441419010249 0.6510514773640519 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9526067920965964 1.1673202271218317 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -8 -11)
"cameras/drone/drone0" SET Transform localScale (1.4193988320523543 1.4193988320523543 1.4193988320523543)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -18 0)
"cameras/drone/drone1" SET Transform localScale (1.3564502326600765 1.3564502326600765 1.3564502326600765)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.226122543795273 0)
"cameras" SET Transform eulerAngles (15.886320293272064 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4276356725691184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4651412925895198
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23208585782126595
"cameras/drone/drone0" SET Transform localPosition (0.4687803467693976 0.5389983368585367 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6709741894776733 1.2132880147960492 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 8 15)
"cameras/drone/drone0" SET Transform localScale (1.0280975265627688 1.0280975265627688 1.0280975265627688)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 5 -15)
"cameras/drone/drone1" SET Transform localScale (1.4981510463903027 1.4981510463903027 1.4981510463903027)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.994671964522945 0)
"cameras" SET Transform eulerAngles (-17.276744096775104 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0312297467920444
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.707325410463959
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.009156941796342188
"cameras/drone/drone0" SET Transform localPosition (-0.29502590264649176 -0.23502094669087875 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8548054127294515 0.9720838703926836 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -12 -9)
"cameras/drone/drone0" SET Transform localScale (1.1946069282100178 1.1946069282100178 1.1946069282100178)
"cameras/drone/drone1" SET Transform localEulerAngles (10 17 -4)
"cameras/drone/drone1" SET Transform localScale (0.9000996044140515 0.9000996044140515 0.9000996044140515)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.049906879292667 0)
"cameras" SET Transform eulerAngles (14.796122018657208 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8068163164287154
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6596159196517999
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3343546523729716
"cameras/drone/drone0" SET Transform localPosition (-0.5280272113910396 0.3117879757099779 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.113493678536116 1.2362448967463875 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -14 10)
"cameras/drone/drone0" SET Transform localScale (0.9528006795502428 0.9528006795502428 0.9528006795502428)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 11 -3)
"cameras/drone/drone1" SET Transform localScale (0.6230922071334996 0.6230922071334996 0.6230922071334996)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0453822806541573 0)
"cameras" SET Transform eulerAngles (15.72908404598693 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.28766889841603
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0450240008247436
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11725309556012875
"cameras/drone/drone0" SET Transform localPosition (-0.0708340119763784 -0.10911153722499983 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8726113311958545 0.9081394035337791 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -16 11)
"cameras/drone/drone0" SET Transform localScale (0.8270573861639262 0.8270573861639262 0.8270573861639262)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 1 -1)
"cameras/drone/drone1" SET Transform localScale (1.3571145283864032 1.3571145283864032 1.3571145283864032)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.124988032995885 0)
"cameras" SET Transform eulerAngles (-17.312997076141784 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2216963816849824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5006646020109087
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32763762389370044
"cameras/drone/drone0" SET Transform localPosition (0.5004716242097795 0.6856250503634431 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.050382622965645885 1.2506656441169215 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -19 12)
"cameras/drone/drone0" SET Transform localScale (0.7472854834068351 0.7472854834068351 0.7472854834068351)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 8 9)
"cameras/drone/drone1" SET Transform localScale (0.8468018853211055 0.8468018853211055 0.8468018853211055)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.090270404430239 0)
"cameras" SET Transform eulerAngles (-4.1000534687904135 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8770464598239306
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.694994396573433
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.026633867948082604
"cameras/drone/drone0" SET Transform localPosition (0.11263587040628531 0.5507472326533307 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04684730380515578 1.1379378754365608 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 9 -5)
"cameras/drone/drone0" SET Transform localScale (1.1469214047623666 1.1469214047623666 1.1469214047623666)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 19 -19)
"cameras/drone/drone1" SET Transform localScale (0.9573823738298199 0.9573823738298199 0.9573823738298199)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.957051289764114 0)
"cameras" SET Transform eulerAngles (-16.79318693062138 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1568028884739698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9353038053040176
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23632518837249217
"cameras/drone/drone0" SET Transform localPosition (-0.4686727314175966 0.3336275389420685 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6832837106361925 1.1869805983301212 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 20 -4)
"cameras/drone/drone0" SET Transform localScale (1.166536614308596 1.166536614308596 1.166536614308596)
"cameras/drone/drone1" SET Transform localEulerAngles (17 4 12)
"cameras/drone/drone1" SET Transform localScale (1.2459926923404885 1.2459926923404885 1.2459926923404885)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1022650694806257 0)
"cameras" SET Transform eulerAngles (18.93186745983109 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5824317901183829
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.999625597265902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23540090651650925
"cameras/drone/drone0" SET Transform localPosition (0.6222940286283232 0.1788070519176918 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7637047524238827 1.0267754649776624 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 11 -7)
"cameras/drone/drone0" SET Transform localScale (1.3584301674784074 1.3584301674784074 1.3584301674784074)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -7 -1)
"cameras/drone/drone1" SET Transform localScale (0.9150324911912266 0.9150324911912266 0.9150324911912266)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.324917147135249 0)
"cameras" SET Transform eulerAngles (17.556542179000935 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0087470530725549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1169836223278882
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2297768556902392
"cameras/drone/drone0" SET Transform localPosition (-0.27029607215212104 0.3287837743832405 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09317694211978189 0.8750908165166453 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 18 14)
"cameras/drone/drone0" SET Transform localScale (0.6316156944301686 0.6316156944301686 0.6316156944301686)
"cameras/drone/drone1" SET Transform localEulerAngles (2 0 1)
"cameras/drone/drone1" SET Transform localScale (0.7038461114262599 0.7038461114262599 0.7038461114262599)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2852245068853545 0)
"cameras" SET Transform eulerAngles (-3.090806087528488 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.810897413055376
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1851190805938658
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2162712988873559
"cameras/drone/drone0" SET Transform localPosition (0.8680111709840135 -0.15893235223710128 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.46463333887328173 0.9959477497052507 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -4 -2)
"cameras/drone/drone0" SET Transform localScale (0.6031998612455203 0.6031998612455203 0.6031998612455203)
"cameras/drone/drone1" SET Transform localEulerAngles (3 5 6)
"cameras/drone/drone1" SET Transform localScale (1.1639611703558326 1.1639611703558326 1.1639611703558326)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.689015459240245 0)
"cameras" SET Transform eulerAngles (3.3000994663418197 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7620171583347719
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.51530116788782
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.042667706324561565
"cameras/drone/drone0" SET Transform localPosition (0.6530614517782272 0.13045834685238117 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12170948474613041 1.0072507684055145 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 4 -17)
"cameras/drone/drone0" SET Transform localScale (1.2681653244285815 1.2681653244285815 1.2681653244285815)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -7 19)
"cameras/drone/drone1" SET Transform localScale (1.4033964313502953 1.4033964313502953 1.4033964313502953)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.221692391150923 0)
"cameras" SET Transform eulerAngles (15.50518147530773 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5817099688202972
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9652697118331182
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03087383407940916
"cameras/drone/drone0" SET Transform localPosition (0.22646423367655277 -0.12462813553668711 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1516400076556275 0.9318360608325994 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 19 17)
"cameras/drone/drone0" SET Transform localScale (0.6933462191938564 0.6933462191938564 0.6933462191938564)
"cameras/drone/drone1" SET Transform localEulerAngles (16 4 7)
"cameras/drone/drone1" SET Transform localScale (1.2399687960212429 1.2399687960212429 1.2399687960212429)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0709529409419956 0)
"cameras" SET Transform eulerAngles (3.949607667212746 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40507369993723175
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6086295099697157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10647700762841109
"cameras/drone/drone0" SET Transform localPosition (-0.010980196628854966 0.28340632766543067 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8316572223633447 0.9787123245862657 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 0 -15)
"cameras/drone/drone0" SET Transform localScale (1.2112326490223426 1.2112326490223426 1.2112326490223426)
"cameras/drone/drone1" SET Transform localEulerAngles (0 3 17)
"cameras/drone/drone1" SET Transform localScale (1.031764256791627 1.031764256791627 1.031764256791627)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5086440042525022 0)
"cameras" SET Transform eulerAngles (-3.3249432891860344 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2408857785152838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1327734291651421
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16096564075414804
"cameras/drone/drone0" SET Transform localPosition (0.8116568951809795 -0.05451630488231257 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4997625618195598 1.1447905430403713 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -13 -14)
"cameras/drone/drone0" SET Transform localScale (0.794929040187034 0.794929040187034 0.794929040187034)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 15 2)
"cameras/drone/drone1" SET Transform localScale (1.4621567083367422 1.4621567083367422 1.4621567083367422)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.13063569895432 0)
"cameras" SET Transform eulerAngles (-8.64791855873111 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40544032569849947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5750938741894545
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23271188372052834
"cameras/drone/drone0" SET Transform localPosition (0.13871034183782083 0.18585558649994066 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06492711615970803 1.118843468433278 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -15 14)
"cameras/drone/drone0" SET Transform localScale (1.285081145495202 1.285081145495202 1.285081145495202)
"cameras/drone/drone1" SET Transform localEulerAngles (0 4 -2)
"cameras/drone/drone1" SET Transform localScale (0.9548077885995221 0.9548077885995221 0.9548077885995221)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.122687101175947 0)
"cameras" SET Transform eulerAngles (2.0645359031503183 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5292429175369775
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9521769058892988
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09860399235112993
"cameras/drone/drone0" SET Transform localPosition (0.3105353908353885 0.3954443124768054 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2377250253747898 1.1586848609382823 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 1 -17)
"cameras/drone/drone0" SET Transform localScale (1.2218545265688765 1.2218545265688765 1.2218545265688765)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -10 -6)
"cameras/drone/drone1" SET Transform localScale (0.9296285522915401 0.9296285522915401 0.9296285522915401)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.036628076426254 0)
"cameras" SET Transform eulerAngles (-3.068880234821595 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.375604919478186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.364239322723022
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08099418199080409
"cameras/drone/drone0" SET Transform localPosition (0.7104950489483943 0.21976075680615254 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8175226500600796 1.0453627670026848 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -8 -15)
"cameras/drone/drone0" SET Transform localScale (0.7128590662661392 0.7128590662661392 0.7128590662661392)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 5 19)
"cameras/drone/drone1" SET Transform localScale (1.4409687895985774 1.4409687895985774 1.4409687895985774)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4198829844212373 0)
"cameras" SET Transform eulerAngles (6.5865496602840246 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1226124930966732
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7811130818385068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06638966498464707
"cameras/drone/drone0" SET Transform localPosition (-0.32654253701096225 0.24094291759243863 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37746983177838245 1.0211773842839797 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -10 16)
"cameras/drone/drone0" SET Transform localScale (0.9616396926953859 0.9616396926953859 0.9616396926953859)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -20 -8)
"cameras/drone/drone1" SET Transform localScale (1.3690897347067312 1.3690897347067312 1.3690897347067312)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.447472967801724 0)
"cameras" SET Transform eulerAngles (16.528279130617463 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8980800395081266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7491129062256678
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06940751598138398
"cameras/drone/drone0" SET Transform localPosition (-0.031667561055262805 -0.19446448135065303 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9329480284992742 1.1873221419652027 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 15 -17)
"cameras/drone/drone0" SET Transform localScale (1.3691464196998626 1.3691464196998626 1.3691464196998626)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -8 8)
"cameras/drone/drone1" SET Transform localScale (1.0998051320847004 1.0998051320847004 1.0998051320847004)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.214475449589263 0)
"cameras" SET Transform eulerAngles (19.60295795988904 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5082935662289335
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6608394976602188
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24084094677336665
"cameras/drone/drone0" SET Transform localPosition (-0.3848186098038603 0.5025757169197116 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6616230557419873 0.8300369336987647 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 5 -7)
"cameras/drone/drone0" SET Transform localScale (1.1480537709386924 1.1480537709386924 1.1480537709386924)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 4 -12)
"cameras/drone/drone1" SET Transform localScale (0.7575217189131529 0.7575217189131529 0.7575217189131529)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.787551600914994 0)
"cameras" SET Transform eulerAngles (13.858824448784205 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7849872068782602
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8197099994364159
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17627043837331646
"cameras/drone/drone0" SET Transform localPosition (0.20596190170766726 -0.15111800955626659 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1856849033028014 1.1687822840073694 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 16 -5)
"cameras/drone/drone0" SET Transform localScale (0.9796836882781291 0.9796836882781291 0.9796836882781291)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -14 11)
"cameras/drone/drone1" SET Transform localScale (0.6254485548983416 0.6254485548983416 0.6254485548983416)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.879683291694199 0)
"cameras" SET Transform eulerAngles (-9.587831312290206 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2798212463793734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7765998345870226
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37705799174706867
"cameras/drone/drone0" SET Transform localPosition (-0.1305928574118651 0.630974201610027 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10306665455386854 1.0883395455331732 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -20 6)
"cameras/drone/drone0" SET Transform localScale (1.113745348067357 1.113745348067357 1.113745348067357)
"cameras/drone/drone1" SET Transform localEulerAngles (7 11 -20)
"cameras/drone/drone1" SET Transform localScale (1.2431095548693458 1.2431095548693458 1.2431095548693458)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.564613058417167 0)
"cameras" SET Transform eulerAngles (-15.51805623301069 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1048667571271542
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4785534563079574
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07768762220502326
"cameras/drone/drone0" SET Transform localPosition (-0.11214372992335697 0.02269516630818208 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1784550451594684 1.294234527622992 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -11 13)
"cameras/drone/drone0" SET Transform localScale (0.8490929610422409 0.8490929610422409 0.8490929610422409)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 4 -10)
"cameras/drone/drone1" SET Transform localScale (0.6475282789633457 0.6475282789633457 0.6475282789633457)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.57206693088626 0)
"cameras" SET Transform eulerAngles (-18.348029730683617 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.280622444644934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3582010235218278
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16044564366974337
"cameras/drone/drone0" SET Transform localPosition (-1.0892994853308373 0.6633805923514176 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9474640757751713 1.2514839058931895 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -7 10)
"cameras/drone/drone0" SET Transform localScale (1.1004505854560285 1.1004505854560285 1.1004505854560285)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -4 -5)
"cameras/drone/drone1" SET Transform localScale (1.4727236995029145 1.4727236995029145 1.4727236995029145)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.390068783824476 0)
"cameras" SET Transform eulerAngles (-4.667847419896042 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.138699529737587
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2608470740472268
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37620424443930583
"cameras/drone/drone0" SET Transform localPosition (-0.7415378244797544 0.31937116059149956 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7808036707091839 0.981892998085885 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -6 16)
"cameras/drone/drone0" SET Transform localScale (1.270768162458103 1.270768162458103 1.270768162458103)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 14 -16)
"cameras/drone/drone1" SET Transform localScale (0.9308727574842125 0.9308727574842125 0.9308727574842125)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9345303067811277 0)
"cameras" SET Transform eulerAngles (5.946810242544338 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.185983252237848
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7674308449354665
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.218202375983361
"cameras/drone/drone0" SET Transform localPosition (1.0535019575147893 0.5597959248931812 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21543646664930027 0.9358795981146317 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -19 -6)
"cameras/drone/drone0" SET Transform localScale (1.0209152173808027 1.0209152173808027 1.0209152173808027)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -9 -18)
"cameras/drone/drone1" SET Transform localScale (0.7960881907634855 0.7960881907634855 0.7960881907634855)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.251463483813521 0)
"cameras" SET Transform eulerAngles (12.548357099585644 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9196937640173556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7524968169068111
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3781501587644952
"cameras/drone/drone0" SET Transform localPosition (0.319081756564898 -0.15294768255789787 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8203059172392264 0.9461303893705149 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -15 -9)
"cameras/drone/drone0" SET Transform localScale (1.1814948355608181 1.1814948355608181 1.1814948355608181)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 12 -4)
"cameras/drone/drone1" SET Transform localScale (0.6387094411254475 0.6387094411254475 0.6387094411254475)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.470857109210858 0)
"cameras" SET Transform eulerAngles (-17.463350455514668 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2845871039802388
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.047031825350476
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09716769371303076
"cameras/drone/drone0" SET Transform localPosition (0.07461001173570803 0.6105877190622102 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0036892202591632 1.1620614308921209 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -12 11)
"cameras/drone/drone0" SET Transform localScale (0.64386859110434 0.64386859110434 0.64386859110434)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -3 -5)
"cameras/drone/drone1" SET Transform localScale (1.0687233175163073 1.0687233175163073 1.0687233175163073)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.24067144944385 0)
"cameras" SET Transform eulerAngles (-18.671352281502706 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7190007723744684
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3190736937047536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38809314866195826
"cameras/drone/drone0" SET Transform localPosition (-0.24801437414883665 0.08007381279306897 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1795800783923325 1.250534969443726 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -7 12)
"cameras/drone/drone0" SET Transform localScale (1.2682580223722009 1.2682580223722009 1.2682580223722009)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 10 14)
"cameras/drone/drone1" SET Transform localScale (0.882697706904328 0.882697706904328 0.882697706904328)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 83
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.3327580849454512 0)
"cameras" SET Transform eulerAngles (4.614906995607999 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8728458715751714
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.148886228002608
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10931463366417336
"cameras/drone/drone0" SET Transform localPosition (1.1090728021903977 0.1586682159146276 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9805496926336732 1.29217557599388 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -15 3)
"cameras/drone/drone0" SET Transform localScale (1.3539910633631922 1.3539910633631922 1.3539910633631922)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -8 6)
"cameras/drone/drone1" SET Transform localScale (1.1988158458412892 1.1988158458412892 1.1988158458412892)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5200919992092747 0)
"cameras" SET Transform eulerAngles (-10.654747694221838 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8380352686722912
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2648624030772735
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22599338844839323
"cameras/drone/drone0" SET Transform localPosition (0.33970025906147394 -0.1790535297123294 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16597355076162756 0.8512971603452922 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -18 15)
"cameras/drone/drone0" SET Transform localScale (1.3357784565451207 1.3357784565451207 1.3357784565451207)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 10 16)
"cameras/drone/drone1" SET Transform localScale (0.7534648169863999 0.7534648169863999 0.7534648169863999)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.630705237129297 0)
"cameras" SET Transform eulerAngles (16.887841948686336 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4168499648218188
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.261954424874373
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30383368278069256
"cameras/drone/drone0" SET Transform localPosition (-1.052700346017237 0.5580792949830113 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3764771245923494 1.2602853878292244 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -11 -2)
"cameras/drone/drone0" SET Transform localScale (0.9656903926981544 0.9656903926981544 0.9656903926981544)
"cameras/drone/drone1" SET Transform localEulerAngles (8 19 -12)
"cameras/drone/drone1" SET Transform localScale (1.1874217060021572 1.1874217060021572 1.1874217060021572)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.639453898781955 0)
"cameras" SET Transform eulerAngles (-1.2806144927492298 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3647486209145523
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.177536689919338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12190070823168933
"cameras/drone/drone0" SET Transform localPosition (-0.5967459760488155 0.1723061392607334 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1055351721926683 1.1080168757472404 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -9 18)
"cameras/drone/drone0" SET Transform localScale (1.1493565228149776 1.1493565228149776 1.1493565228149776)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -18 -7)
"cameras/drone/drone1" SET Transform localScale (0.7636459296869146 0.7636459296869146 0.7636459296869146)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.75411237808537 0)
"cameras" SET Transform eulerAngles (15.679808752339596 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.280453810507335
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1554766385891346
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38681116006026106
"cameras/drone/drone0" SET Transform localPosition (0.6651254257518966 -0.007282658806553266 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2538958344644904 1.1848339655611395 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 0 -13)
"cameras/drone/drone0" SET Transform localScale (1.3219696515002273 1.3219696515002273 1.3219696515002273)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 10 17)
"cameras/drone/drone1" SET Transform localScale (1.4960160944053356 1.4960160944053356 1.4960160944053356)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.62360558546244 0)
"cameras" SET Transform eulerAngles (6.7086909389373695 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3603639261707103
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9914340681080621
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.123894769918651
"cameras/drone/drone0" SET Transform localPosition (-0.42497345906179396 -0.12255477097767281 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7454526804053867 0.9111991780929346 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -15 14)
"cameras/drone/drone0" SET Transform localScale (1.3091955876617303 1.3091955876617303 1.3091955876617303)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -15 16)
"cameras/drone/drone1" SET Transform localScale (1.3676276134649532 1.3676276134649532 1.3676276134649532)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.427511363576206 0)
"cameras" SET Transform eulerAngles (11.742447300693954 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5134902811084006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8946515035067657
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29907522777733503
"cameras/drone/drone0" SET Transform localPosition (-0.6734046169717443 -0.09459002852721227 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.49869840364863904 0.8852286506044938 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -19 -4)
"cameras/drone/drone0" SET Transform localScale (0.704909970819438 0.704909970819438 0.704909970819438)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -1 20)
"cameras/drone/drone1" SET Transform localScale (0.9733394005649562 0.9733394005649562 0.9733394005649562)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.469822205527253 0)
"cameras" SET Transform eulerAngles (19.441267306190312 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8907022415740657
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.520875768282729
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04602193783347222
"cameras/drone/drone0" SET Transform localPosition (-0.24566521402445296 0.4397761362292793 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.128102895376911 1.1048163671253755 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -7 -3)
"cameras/drone/drone0" SET Transform localScale (0.8960489864809267 0.8960489864809267 0.8960489864809267)
"cameras/drone/drone1" SET Transform localEulerAngles (5 6 -4)
"cameras/drone/drone1" SET Transform localScale (1.2533247565174976 1.2533247565174976 1.2533247565174976)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0356596069582995 0)
"cameras" SET Transform eulerAngles (8.749375530298487 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3857814823521544
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4058837824837513
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0821478439103025
"cameras/drone/drone0" SET Transform localPosition (-0.7853747499451162 0.3604412350312088 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.41149676047206507 1.0423331937834934 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -15 12)
"cameras/drone/drone0" SET Transform localScale (1.4522726814977551 1.4522726814977551 1.4522726814977551)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -3 14)
"cameras/drone/drone1" SET Transform localScale (1.2811082982296433 1.2811082982296433 1.2811082982296433)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0620221449362 0)
"cameras" SET Transform eulerAngles (5.0322180721406795 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4176824971301372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5283614435086852
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15504520599159186
"cameras/drone/drone0" SET Transform localPosition (0.08281925882209573 0.06024977217072863 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8166129933930313 0.9362923657029553 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -13 -4)
"cameras/drone/drone0" SET Transform localScale (0.9118667114093943 0.9118667114093943 0.9118667114093943)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 18 0)
"cameras/drone/drone1" SET Transform localScale (0.9351209864320604 0.9351209864320604 0.9351209864320604)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.566171022551053 0)
"cameras" SET Transform eulerAngles (0.08987103934563478 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8150140320836317
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2187833055570862
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16184657802607472
"cameras/drone/drone0" SET Transform localPosition (0.7950335155297064 0.041952262312683064 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12876676536397302 0.9000180030150045 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 5 0)
"cameras/drone/drone0" SET Transform localScale (0.987662414300361 0.987662414300361 0.987662414300361)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 17 7)
"cameras/drone/drone1" SET Transform localScale (1.2251899266247999 1.2251899266247999 1.2251899266247999)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.618942901042187 0)
"cameras" SET Transform eulerAngles (3.5066387098115435 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4377943467884953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9807283777029633
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3384987901135932
"cameras/drone/drone0" SET Transform localPosition (-0.5968946012482009 -0.18140542494041306 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.043626070169944464 1.246402386815146 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -20 -1)
"cameras/drone/drone0" SET Transform localScale (0.9489334991792346 0.9489334991792346 0.9489334991792346)
"cameras/drone/drone1" SET Transform localEulerAngles (4 11 5)
"cameras/drone/drone1" SET Transform localScale (1.4947772977977323 1.4947772977977323 1.4947772977977323)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9454385443896918 0)
"cameras" SET Transform eulerAngles (12.092722691537531 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6509176299889137
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9525946160155532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3602043000779174
"cameras/drone/drone0" SET Transform localPosition (0.20626001076968192 0.22030515937608103 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.39402379306098356 0.8377857789592855 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 3 4)
"cameras/drone/drone0" SET Transform localScale (1.4060499001504874 1.4060499001504874 1.4060499001504874)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 4 -2)
"cameras/drone/drone1" SET Transform localScale (1.3941422263317793 1.3941422263317793 1.3941422263317793)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9956713959765424 0)
"cameras" SET Transform eulerAngles (3.5703214172732274 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5637194514681299
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8455370220742706
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.136827594720952
"cameras/drone/drone0" SET Transform localPosition (-0.7390173290275336 0.3123567823180405 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.015160552341690892 1.2648326913281367 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -6 -14)
"cameras/drone/drone0" SET Transform localScale (0.9265532385811641 0.9265532385811641 0.9265532385811641)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 1 2)
"cameras/drone/drone1" SET Transform localScale (0.8134977869482485 0.8134977869482485 0.8134977869482485)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1299356100597486 0)
"cameras" SET Transform eulerAngles (19.55611814515681 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5520058719651773
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1187150230423417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3638388715208913
"cameras/drone/drone0" SET Transform localPosition (0.04875935522862318 -0.26346431763808914 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2870888560027046 0.9250802091564234 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -12 -3)
"cameras/drone/drone0" SET Transform localScale (1.2049711199528905 1.2049711199528905 1.2049711199528905)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -17 -7)
"cameras/drone/drone1" SET Transform localScale (0.7096860721876386 0.7096860721876386 0.7096860721876386)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.355513709738255 0)
"cameras" SET Transform eulerAngles (-19.65951276086362 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8448152538522196
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.357015545028546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.136422780701388
"cameras/drone/drone0" SET Transform localPosition (-0.3818944591769321 0.5508660915806445 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8673593056026543 0.9665134240645278 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -6 -7)
"cameras/drone/drone0" SET Transform localScale (0.9092930774295969 0.9092930774295969 0.9092930774295969)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -13 -18)
"cameras/drone/drone1" SET Transform localScale (0.9969617098322164 0.9969617098322164 0.9969617098322164)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9228624166380284 0)
"cameras" SET Transform eulerAngles (-11.107094753986878 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5581806814349775
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7673547979674802
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39254322885368365
"cameras/drone/drone0" SET Transform localPosition (-1.109710368823259 -0.24487809249686782 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7041154037577328 1.2181143201804714 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -17 -12)
"cameras/drone/drone0" SET Transform localScale (1.4628099287752532 1.4628099287752532 1.4628099287752532)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -9 17)
"cameras/drone/drone1" SET Transform localScale (1.0189023633181564 1.0189023633181564 1.0189023633181564)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.637212722869868 0)
"cameras" SET Transform eulerAngles (-11.339266552481755 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9673599979956353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7983923787371912
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22684375342314567
"cameras/drone/drone0" SET Transform localPosition (-1.14733973850497 0.11074242316015198 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12497757562490319 0.8130828700624315 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 20 -15)
"cameras/drone/drone0" SET Transform localScale (1.4960788386082071 1.4960788386082071 1.4960788386082071)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 4 -17)
"cameras/drone/drone1" SET Transform localScale (1.4079051666554192 1.4079051666554192 1.4079051666554192)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2652095677618416 0)
"cameras" SET Transform eulerAngles (2.3637498891054953 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7864572931116971
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0434303055977616
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04182159539190438
"cameras/drone/drone0" SET Transform localPosition (0.6229271069758575 0.17938202203608672 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4471145194786308 1.0445325360753794 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -11 10)
"cameras/drone/drone0" SET Transform localScale (0.8489620483111036 0.8489620483111036 0.8489620483111036)
"cameras/drone/drone1" SET Transform localEulerAngles (1 17 15)
"cameras/drone/drone1" SET Transform localScale (1.3704141082504289 1.3704141082504289 1.3704141082504289)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6272118122388544 0)
"cameras" SET Transform eulerAngles (-4.751293151658027 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5696905013925968
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3821047766465508
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3403599158100046
"cameras/drone/drone0" SET Transform localPosition (0.1652677662176114 -0.14800757091269662 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.189610132308155 1.0204844774101736 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -20 -1)
"cameras/drone/drone0" SET Transform localScale (1.4787365415904676 1.4787365415904676 1.4787365415904676)
"cameras/drone/drone1" SET Transform localEulerAngles (9 12 -19)
"cameras/drone/drone1" SET Transform localScale (0.9526846488968518 0.9526846488968518 0.9526846488968518)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.644625675819845 0)
"cameras" SET Transform eulerAngles (13.360379012224428 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9557073937514081
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2012229257480584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32647775453707717
"cameras/drone/drone0" SET Transform localPosition (-0.35534108491513017 0.4832618716128006 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6520234600216959 1.027453430351244 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -10 17)
"cameras/drone/drone0" SET Transform localScale (1.324675191406429 1.324675191406429 1.324675191406429)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -2 -1)
"cameras/drone/drone1" SET Transform localScale (1.4814422013622033 1.4814422013622033 1.4814422013622033)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.317923521978111 0)
"cameras" SET Transform eulerAngles (-18.035294673439452 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3165561917145725
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6637912493270484
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22782609279864596
"cameras/drone/drone0" SET Transform localPosition (-0.8289092932147755 -0.04143748840350009 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5339178716470068 1.1231706651548883 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 4 -20)
"cameras/drone/drone0" SET Transform localScale (0.9053732235437386 0.9053732235437386 0.9053732235437386)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -13 16)
"cameras/drone/drone1" SET Transform localScale (0.9816053051137348 0.9816053051137348 0.9816053051137348)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.142150881357369 0)
"cameras" SET Transform eulerAngles (-11.150372585887958 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3766921118984428
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2957735881789356
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13399699746527496
"cameras/drone/drone0" SET Transform localPosition (-0.675576008352397 0.21821609522323876 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.016219683461229817 1.1707966435341528 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 14 16)
"cameras/drone/drone0" SET Transform localScale (1.0882625233310361 1.0882625233310361 1.0882625233310361)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 11 -18)
"cameras/drone/drone1" SET Transform localScale (0.9279608546132385 0.9279608546132385 0.9279608546132385)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.679743907115612 0)
"cameras" SET Transform eulerAngles (-5.939112016026563 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1261594210026702
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7132895734940234
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17349652574840424
"cameras/drone/drone0" SET Transform localPosition (0.1271495534105911 0.04507813006176592 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7758679670699149 0.8041758788404558 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -5 6)
"cameras/drone/drone0" SET Transform localScale (1.1927200847202255 1.1927200847202255 1.1927200847202255)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 18 -13)
"cameras/drone/drone1" SET Transform localScale (0.6078038638950248 0.6078038638950248 0.6078038638950248)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.286260549025334 0)
"cameras" SET Transform eulerAngles (-0.7781661366391361 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5721450126799075
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7135399074692064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27697918894996126
"cameras/drone/drone0" SET Transform localPosition (0.043394509124294656 0.21133226096492402 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9728874274780532 1.2205362593486906 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -17 16)
"cameras/drone/drone0" SET Transform localScale (1.2560902523885926 1.2560902523885926 1.2560902523885926)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -13 12)
"cameras/drone/drone1" SET Transform localScale (0.9796587094379173 0.9796587094379173 0.9796587094379173)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6267053158037856 0)
"cameras" SET Transform eulerAngles (-11.570039611269296 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5604124219851871
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0234521213639174
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2784784658203636
"cameras/drone/drone0" SET Transform localPosition (-0.9139920353648593 0.2501304804622076 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8608949724964174 1.223232493303678 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 1 20)
"cameras/drone/drone0" SET Transform localScale (0.8972885953503467 0.8972885953503467 0.8972885953503467)
"cameras/drone/drone1" SET Transform localEulerAngles (17 7 -5)
"cameras/drone/drone1" SET Transform localScale (1.389232634460308 1.389232634460308 1.389232634460308)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.049683521652666 0)
"cameras" SET Transform eulerAngles (3.1942682937998867 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3427015777997788
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.041097895759441
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2613156241239689
"cameras/drone/drone0" SET Transform localPosition (0.12598943733992396 0.07905127979817655 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.058117214872033 1.1116366091589722 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -14 -20)
"cameras/drone/drone0" SET Transform localScale (1.2890140513960502 1.2890140513960502 1.2890140513960502)
"cameras/drone/drone1" SET Transform localEulerAngles (20 8 6)
"cameras/drone/drone1" SET Transform localScale (0.9878700880349964 0.9878700880349964 0.9878700880349964)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.695918678612648 0)
"cameras" SET Transform eulerAngles (7.451510304461351 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8814030285839682
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8727463861595448
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3003359511834611
"cameras/drone/drone0" SET Transform localPosition (0.28398820146950365 0.6108783751360494 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9864037852824308 0.9023540761219644 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -12 10)
"cameras/drone/drone0" SET Transform localScale (0.8190667365270257 0.8190667365270257 0.8190667365270257)
"cameras/drone/drone1" SET Transform localEulerAngles (6 15 -7)
"cameras/drone/drone1" SET Transform localScale (1.2921400752670604 1.2921400752670604 1.2921400752670604)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.634395746341034 0)
"cameras" SET Transform eulerAngles (9.781101094561677 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7405540229348802
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4130276245556073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17896090372945694
"cameras/drone/drone0" SET Transform localPosition (0.8577907050568034 0.14620727489014734 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22834557531977895 0.8704397348373141 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 3 -10)
"cameras/drone/drone0" SET Transform localScale (0.6834422737225788 0.6834422737225788 0.6834422737225788)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -2 4)
"cameras/drone/drone1" SET Transform localScale (0.768486011913624 0.768486011913624 0.768486011913624)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.204566438541912 0)
"cameras" SET Transform eulerAngles (14.484977657837973 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5118874119870114
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9871357151964224
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3580735898689817
"cameras/drone/drone0" SET Transform localPosition (-0.9436326445846672 -0.07385416414707696 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.14594811830992227 1.1820337356384598 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -4 -7)
"cameras/drone/drone0" SET Transform localScale (1.008410408186079 1.008410408186079 1.008410408186079)
"cameras/drone/drone1" SET Transform localEulerAngles (5 18 -6)
"cameras/drone/drone1" SET Transform localScale (1.3601207152752703 1.3601207152752703 1.3601207152752703)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.28261324897554 0)
"cameras" SET Transform eulerAngles (-4.866646843580167 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45444477389269916
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2703549936142435
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2675937710569786
"cameras/drone/drone0" SET Transform localPosition (-0.5982593945834203 -0.09307211282866917 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.031159595099955 0.9315487250257573 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 20 -13)
"cameras/drone/drone0" SET Transform localScale (0.8767317857506902 0.8767317857506902 0.8767317857506902)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -20 6)
"cameras/drone/drone1" SET Transform localScale (0.9384753835589064 0.9384753835589064 0.9384753835589064)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0264420146073014 0)
"cameras" SET Transform eulerAngles (2.1910143989722464 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8821790979982979
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6697244014722377
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36341611295152254
"cameras/drone/drone0" SET Transform localPosition (1.0986229988158518 -0.2465337758049852 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9991719236809226 1.2421986354553656 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -5 15)
"cameras/drone/drone0" SET Transform localScale (0.7003279560008507 0.7003279560008507 0.7003279560008507)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 20 -17)
"cameras/drone/drone1" SET Transform localScale (0.6735857068390716 0.6735857068390716 0.6735857068390716)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.59475611555261 0)
"cameras" SET Transform eulerAngles (18.29467239965635 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0809172492548282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8749885368690076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32153169015472344
"cameras/drone/drone0" SET Transform localPosition (1.0018456025058058 0.5259833399458105 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1694710538603663 1.1675410901763161 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -7 -6)
"cameras/drone/drone0" SET Transform localScale (0.7158096401757243 0.7158096401757243 0.7158096401757243)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 2 -11)
"cameras/drone/drone1" SET Transform localScale (1.483434367507103 1.483434367507103 1.483434367507103)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9272729351399236 0)
"cameras" SET Transform eulerAngles (-0.09990476995442421 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2499033311446484
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.282480535474559
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2287756464430878
"cameras/drone/drone0" SET Transform localPosition (0.8448519725088455 -0.09382351180064791 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7577078653249163 1.2175787268640323 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -6 17)
"cameras/drone/drone0" SET Transform localScale (0.7066642635686469 0.7066642635686469 0.7066642635686469)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 9 -15)
"cameras/drone/drone1" SET Transform localScale (1.432516959588408 1.432516959588408 1.432516959588408)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.560185025525411 0)
"cameras" SET Transform eulerAngles (3.785222633199723 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6415811893155379
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.098319231703613
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09423763331497459
"cameras/drone/drone0" SET Transform localPosition (-0.20840788872148908 -0.0610007970638769 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6006028232209222 0.802583242878382 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 15 19)
"cameras/drone/drone0" SET Transform localScale (0.6245323159057226 0.6245323159057226 0.6245323159057226)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -7 4)
"cameras/drone/drone1" SET Transform localScale (1.048330326946203 1.048330326946203 1.048330326946203)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.365867101639268 0)
"cameras" SET Transform eulerAngles (-10.864423120898174 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3145945199986189
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.25036117648216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23512992691042728
"cameras/drone/drone0" SET Transform localPosition (1.0322165412928148 -0.24701728733240075 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0075477249706017 0.8796806741518649 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -16 -20)
"cameras/drone/drone0" SET Transform localScale (0.6026221721928989 0.6026221721928989 0.6026221721928989)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -12 -9)
"cameras/drone/drone1" SET Transform localScale (1.0188994517124588 1.0188994517124588 1.0188994517124588)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5810232424688735 0)
"cameras" SET Transform eulerAngles (-19.72013235024393 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1537575321829792
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5818919614186475
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2566675435261881
"cameras/drone/drone0" SET Transform localPosition (0.8955832180291108 0.6763290579571404 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4596897077814379 0.9515768424137344 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -7 5)
"cameras/drone/drone0" SET Transform localScale (1.338139050958128 1.338139050958128 1.338139050958128)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -8 11)
"cameras/drone/drone1" SET Transform localScale (0.9626391049638897 0.9626391049638897 0.9626391049638897)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8717332360449 0)
"cameras" SET Transform eulerAngles (-19.0377196270271 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1260038910749945
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1186792403172001
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.007937763732451142
"cameras/drone/drone0" SET Transform localPosition (0.7242508290213485 0.1636183600033148 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1708332375004462 1.164365785868771 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -19 20)
"cameras/drone/drone0" SET Transform localScale (1.0680886801061105 1.0680886801061105 1.0680886801061105)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 3 5)
"cameras/drone/drone1" SET Transform localScale (0.7376285511148102 0.7376285511148102 0.7376285511148102)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0117525318728475 0)
"cameras" SET Transform eulerAngles (15.14857870978178 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1479503561468873
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9851830882325039
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22035569749638362
"cameras/drone/drone0" SET Transform localPosition (0.3190341590564474 -0.024078010190030696 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.35160490504628994 0.8987666224029123 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 10 -15)
"cameras/drone/drone0" SET Transform localScale (1.2091051877891505 1.2091051877891505 1.2091051877891505)
"cameras/drone/drone1" SET Transform localEulerAngles (17 16 10)
"cameras/drone/drone1" SET Transform localScale (0.6828976464135432 0.6828976464135432 0.6828976464135432)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.775197118896435 0)
"cameras" SET Transform eulerAngles (-9.570408193398752 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.369929352214845
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.920198988410307
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3429479429978196
"cameras/drone/drone0" SET Transform localPosition (-0.7751293308443818 0.35505128574480643 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4147696844336266 1.1437806646093545 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -4 -15)
"cameras/drone/drone0" SET Transform localScale (1.4688792579323198 1.4688792579323198 1.4688792579323198)
"cameras/drone/drone1" SET Transform localEulerAngles (6 3 -14)
"cameras/drone/drone1" SET Transform localScale (1.1315205463840026 1.1315205463840026 1.1315205463840026)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5776627862754475 0)
"cameras" SET Transform eulerAngles (-7.821757497356693 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.123922006656984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9086435185950202
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14477519705449124
"cameras/drone/drone0" SET Transform localPosition (0.02619258753717313 -0.24507704986127404 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.623337375037135 1.0040557510084742 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -19 -7)
"cameras/drone/drone0" SET Transform localScale (0.6825360178853871 0.6825360178853871 0.6825360178853871)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 14 19)
"cameras/drone/drone1" SET Transform localScale (1.4133322840718487 1.4133322840718487 1.4133322840718487)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6454073893959524 0)
"cameras" SET Transform eulerAngles (9.68649590323874 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7136353031904803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9723320898179403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1825217910090575
"cameras/drone/drone0" SET Transform localPosition (-0.754401796867567 0.6986467997160499 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.741393126338961 1.1329663094856368 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 0 18)
"cameras/drone/drone0" SET Transform localScale (0.967476349156086 0.967476349156086 0.967476349156086)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -10 -5)
"cameras/drone/drone1" SET Transform localScale (1.3121124871926004 1.3121124871926004 1.3121124871926004)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.413483352629996 0)
"cameras" SET Transform eulerAngles (-18.61878536783434 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.449316715660291
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3263054748897096
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08536321771861269
"cameras/drone/drone0" SET Transform localPosition (-0.04068319850579383 0.34096904915537857 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6231159794267892 1.1847291005954297 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 16 20)
"cameras/drone/drone0" SET Transform localScale (0.6978064665100513 0.6978064665100513 0.6978064665100513)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 11 5)
"cameras/drone/drone1" SET Transform localScale (1.1819239216915167 1.1819239216915167 1.1819239216915167)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7369182295763825 0)
"cameras" SET Transform eulerAngles (7.775931201325488 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.466773824545895
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.937979493185125
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24337241988536357
"cameras/drone/drone0" SET Transform localPosition (-0.46908372299766 0.569795727491418 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.35138977121817305 0.9368800480709587 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 14 -1)
"cameras/drone/drone0" SET Transform localScale (0.7206341981217109 0.7206341981217109 0.7206341981217109)
"cameras/drone/drone1" SET Transform localEulerAngles (11 4 19)
"cameras/drone/drone1" SET Transform localScale (1.0988681027607368 1.0988681027607368 1.0988681027607368)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1236610990172107 0)
"cameras" SET Transform eulerAngles (-6.76677945062421 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9973187305569123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2124869915654066
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10710122982042836
"cameras/drone/drone0" SET Transform localPosition (-0.9143476720688126 -0.20323530895644498 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.41214376075970094 0.9292917078966202 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -8 -4)
"cameras/drone/drone0" SET Transform localScale (1.373095847796732 1.373095847796732 1.373095847796732)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 11 -17)
"cameras/drone/drone1" SET Transform localScale (1.2351536060334483 1.2351536060334483 1.2351536060334483)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.617370722278776 0)
"cameras" SET Transform eulerAngles (6.85085802333877 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4732218037479208
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.665692371183838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3688968232597119
"cameras/drone/drone0" SET Transform localPosition (-1.1081520173032262 0.6098155069422861 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1632450021665568 0.939514895982454 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 4 -13)
"cameras/drone/drone0" SET Transform localScale (0.601978867286836 0.601978867286836 0.601978867286836)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 9 10)
"cameras/drone/drone1" SET Transform localScale (1.1483510206232972 1.1483510206232972 1.1483510206232972)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4904690245031365 0)
"cameras" SET Transform eulerAngles (-17.580610151035362 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3827881741303614
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.906810973845698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20062085407504557
"cameras/drone/drone0" SET Transform localPosition (0.6718644725838936 0.5579986632518932 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8819415557349547 1.2554540249117887 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 18 -4)
"cameras/drone/drone0" SET Transform localScale (0.9565538666723705 0.9565538666723705 0.9565538666723705)
"cameras/drone/drone1" SET Transform localEulerAngles (16 9 -10)
"cameras/drone/drone1" SET Transform localScale (0.6700750273639483 0.6700750273639483 0.6700750273639483)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.774963951046952 0)
"cameras" SET Transform eulerAngles (14.744405342985864 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2515865032594387
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8325962641290663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2918027891822973
"cameras/drone/drone0" SET Transform localPosition (-0.7507126682821157 -0.14196600328806847 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.43506915693260373 1.0493292877657376 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 6 -8)
"cameras/drone/drone0" SET Transform localScale (1.3032002137983105 1.3032002137983105 1.3032002137983105)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -12 19)
"cameras/drone/drone1" SET Transform localScale (0.8120446708455028 0.8120446708455028 0.8120446708455028)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1693035639147764 0)
"cameras" SET Transform eulerAngles (12.180654105885594 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47907430305674004
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0608389173519834
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37483412587772985
"cameras/drone/drone0" SET Transform localPosition (0.7769158352530601 0.15985214052458013 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0000682783283954 0.8935454748165093 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -11 -20)
"cameras/drone/drone0" SET Transform localScale (0.7164514597391046 0.7164514597391046 0.7164514597391046)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 16 -2)
"cameras/drone/drone1" SET Transform localScale (0.9923510091170489 0.9923510091170489 0.9923510091170489)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.657311622580404 0)
"cameras" SET Transform eulerAngles (-9.445541382591331 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1346320074536174
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2609011641010333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13775321460327813
"cameras/drone/drone0" SET Transform localPosition (-0.45658372725912344 0.3332119845525951 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3587038470935944 1.2624041612837709 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 18 1)
"cameras/drone/drone0" SET Transform localScale (1.0037833424313791 1.0037833424313791 1.0037833424313791)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -4 1)
"cameras/drone/drone1" SET Transform localScale (1.0687804850778444 1.0687804850778444 1.0687804850778444)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.198778713855987 0)
"cameras" SET Transform eulerAngles (-2.635881584139298 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4393476397992572
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9186711508008276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3362961727191239
"cameras/drone/drone0" SET Transform localPosition (-0.13144640229785365 0.0740735926590968 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12990192955252655 1.0137941336575562 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 17 -9)
"cameras/drone/drone0" SET Transform localScale (1.2747978386006222 1.2747978386006222 1.2747978386006222)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -14 11)
"cameras/drone/drone1" SET Transform localScale (0.8202129004694131 0.8202129004694131 0.8202129004694131)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.092916802730074 0)
"cameras" SET Transform eulerAngles (-6.706170762267437 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.481841579670062
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.006930861248108
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2189860408136126
"cameras/drone/drone0" SET Transform localPosition (-0.5459075567485857 0.4764226574055152 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6004778748765067 0.9479241113912686 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -8 -1)
"cameras/drone/drone0" SET Transform localScale (0.8316203420372721 0.8316203420372721 0.8316203420372721)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -12 -8)
"cameras/drone/drone1" SET Transform localScale (1.4538799772954403 1.4538799772954403 1.4538799772954403)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0366056177173615 0)
"cameras" SET Transform eulerAngles (7.21202003489158 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.789059016198735
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.15435371397458
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0632654842038241
"cameras/drone/drone0" SET Transform localPosition (0.1266160390013915 0.5008215838958339 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23722218898527347 1.0898894692894312 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 16 -2)
"cameras/drone/drone0" SET Transform localScale (0.9873077338507265 0.9873077338507265 0.9873077338507265)
"cameras/drone/drone1" SET Transform localEulerAngles (20 13 -15)
"cameras/drone/drone1" SET Transform localScale (1.450272772903737 1.450272772903737 1.450272772903737)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.777403325394513 0)
"cameras" SET Transform eulerAngles (-5.4053336319255685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.274484075009057
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7840382021610341
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39461705587446716
"cameras/drone/drone0" SET Transform localPosition (0.09692945133047548 -0.06371645669225573 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.812195332735405 1.1408212287529311 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -3 16)
"cameras/drone/drone0" SET Transform localScale (0.8040321488493672 0.8040321488493672 0.8040321488493672)
"cameras/drone/drone1" SET Transform localEulerAngles (10 20 -8)
"cameras/drone/drone1" SET Transform localScale (0.9235624585572508 0.9235624585572508 0.9235624585572508)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.022527147656472 0)
"cameras" SET Transform eulerAngles (-2.7272364261251028 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3646163757672491
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8367447810125095
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.017361796635794357
"cameras/drone/drone0" SET Transform localPosition (-0.33985511749368524 0.6925254515147945 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22666500816266422 1.2561996338310735 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -2 3)
"cameras/drone/drone0" SET Transform localScale (0.8604921372374839 0.8604921372374839 0.8604921372374839)
"cameras/drone/drone1" SET Transform localEulerAngles (17 15 -5)
"cameras/drone/drone1" SET Transform localScale (1.2227333776893397 1.2227333776893397 1.2227333776893397)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.132484004368614 0)
"cameras" SET Transform eulerAngles (-17.667577557328737 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.045314238021013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.826658934129905
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2568016599377502
"cameras/drone/drone0" SET Transform localPosition (-0.19675102483258078 0.6645596900838118 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1399185830350536 1.251097602298321 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -7 13)
"cameras/drone/drone0" SET Transform localScale (1.260539260654751 1.260539260654751 1.260539260654751)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -7 -9)
"cameras/drone/drone1" SET Transform localScale (0.9538685127865466 0.9538685127865466 0.9538685127865466)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.673109832108777 0)
"cameras" SET Transform eulerAngles (13.887322396411108 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9491431065403123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.577002263402838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3606911522070797
"cameras/drone/drone0" SET Transform localPosition (1.146714818860614 -0.199770969560974 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8225934228630274 1.2614333273261518 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 9 -13)
"cameras/drone/drone0" SET Transform localScale (1.2624563024781374 1.2624563024781374 1.2624563024781374)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -17 -7)
"cameras/drone/drone1" SET Transform localScale (1.0735487228287988 1.0735487228287988 1.0735487228287988)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.825125816015577 0)
"cameras" SET Transform eulerAngles (9.38306509160677 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9607632397950744
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9777764159504199
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07527732238998888
"cameras/drone/drone0" SET Transform localPosition (-0.012560728286690415 0.21107633179548452 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9386974982901763 1.2127435966273716 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 11 -15)
"cameras/drone/drone0" SET Transform localScale (0.7531760497410183 0.7531760497410183 0.7531760497410183)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 4 -3)
"cameras/drone/drone1" SET Transform localScale (1.2060623272515787 1.2060623272515787 1.2060623272515787)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.78861575866132 0)
"cameras" SET Transform eulerAngles (-18.094025521205722 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3427953921545337
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4520008841369874
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35348323581385743
"cameras/drone/drone0" SET Transform localPosition (1.1666193277987478 0.0674109943252193 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8478510814103116 0.9832817986462401 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -15 9)
"cameras/drone/drone0" SET Transform localScale (1.0495032253182206 1.0495032253182206 1.0495032253182206)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 11 8)
"cameras/drone/drone1" SET Transform localScale (0.9514888399389332 0.9514888399389332 0.9514888399389332)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.99601035603583 0)
"cameras" SET Transform eulerAngles (-9.17306436406557 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3236512537747913
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3157679399015068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01603029928635502
"cameras/drone/drone0" SET Transform localPosition (0.7702561039559714 0.4227598695182014 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.25990608476665 1.1048459993871602 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -18 17)
"cameras/drone/drone0" SET Transform localScale (0.6428444306045916 0.6428444306045916 0.6428444306045916)
"cameras/drone/drone1" SET Transform localEulerAngles (4 0 3)
"cameras/drone/drone1" SET Transform localScale (1.2446601020704644 1.2446601020704644 1.2446601020704644)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.242279065033098 0)
"cameras" SET Transform eulerAngles (-5.451931948829682 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8225353718440214
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7009080586655991
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01444517396462426
"cameras/drone/drone0" SET Transform localPosition (-0.6182752037313544 0.45413320608615554 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.04003952979890313 1.0807768624137388 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 7 1)
"cameras/drone/drone0" SET Transform localScale (1.4522783616898352 1.4522783616898352 1.4522783616898352)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 5 -19)
"cameras/drone/drone1" SET Transform localScale (0.9026488236441736 0.9026488236441736 0.9026488236441736)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8164490178876305 0)
"cameras" SET Transform eulerAngles (-2.8181297436943176 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5331260078520395
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9461563073728432
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.059320292591315486
"cameras/drone/drone0" SET Transform localPosition (-1.1890916793019164 0.24919492514649116 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.088729122918987 1.182412501158275 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -18 0)
"cameras/drone/drone0" SET Transform localScale (0.6251310830005551 0.6251310830005551 0.6251310830005551)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -4 -9)
"cameras/drone/drone1" SET Transform localScale (0.869299640345877 0.869299640345877 0.869299640345877)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.686403783175695 0)
"cameras" SET Transform eulerAngles (0.6980251504214188 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2024476734022562
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9947584799873281
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2730070528462926
"cameras/drone/drone0" SET Transform localPosition (-0.8559237112025752 -0.0256752655858537 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6400048934508169 1.0776992025694137 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 4 12)
"cameras/drone/drone0" SET Transform localScale (0.7487657333737595 0.7487657333737595 0.7487657333737595)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -10 16)
"cameras/drone/drone1" SET Transform localScale (0.7939021585837747 0.7939021585837747 0.7939021585837747)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.759919451068221 0)
"cameras" SET Transform eulerAngles (-5.90767434317498 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.664173801384579
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0257729732849152
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2880811341074578
"cameras/drone/drone0" SET Transform localPosition (0.7350582546914395 0.09312246753996806 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5580904970893499 0.9813374068481796 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -11 -2)
"cameras/drone/drone0" SET Transform localScale (0.7262282360445237 0.7262282360445237 0.7262282360445237)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -8 -1)
"cameras/drone/drone1" SET Transform localScale (1.2162086970585562 1.2162086970585562 1.2162086970585562)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.016561014455008 0)
"cameras" SET Transform eulerAngles (-2.4914208791298904 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5333276382117589
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1202582743496696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10368081955186557
"cameras/drone/drone0" SET Transform localPosition (-1.1071615601380953 -0.1988179852631093 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0265484483973932 1.1049896985170877 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 7 -13)
"cameras/drone/drone0" SET Transform localScale (0.8604655737469002 0.8604655737469002 0.8604655737469002)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -10 -6)
"cameras/drone/drone1" SET Transform localScale (1.4347536924748523 1.4347536924748523 1.4347536924748523)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.255644535895952 0)
"cameras" SET Transform eulerAngles (5.702659187509617 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.874119261011312
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0836255807836255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36681547416468274
"cameras/drone/drone0" SET Transform localPosition (-0.5145826546041846 -0.24462828439069978 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.87492594722906 0.9977871978559021 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -10 14)
"cameras/drone/drone0" SET Transform localScale (0.6437540196882606 0.6437540196882606 0.6437540196882606)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -15 -1)
"cameras/drone/drone1" SET Transform localScale (0.8770541212806147 0.8770541212806147 0.8770541212806147)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.208137584667769 0)
"cameras" SET Transform eulerAngles (12.584293988114574 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1490160667497602
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7680836677178466
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.012720134543171203
"cameras/drone/drone0" SET Transform localPosition (0.9791224183845137 0.17562935287142728 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.14918037457046052 1.0199248811949833 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 2 -13)
"cameras/drone/drone0" SET Transform localScale (0.808406530157739 0.808406530157739 0.808406530157739)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -18 -10)
"cameras/drone/drone1" SET Transform localScale (1.0556677614316468 1.0556677614316468 1.0556677614316468)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.795267553791525 0)
"cameras" SET Transform eulerAngles (-17.417966266187204 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7353775486226126
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6574687248442985
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.002936077325365938
"cameras/drone/drone0" SET Transform localPosition (0.35881561795225436 0.6125071488554421 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6000314379634559 1.1211579024279583 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 7 -20)
"cameras/drone/drone0" SET Transform localScale (1.253572800576673 1.253572800576673 1.253572800576673)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -5 -20)
"cameras/drone/drone1" SET Transform localScale (1.1717041801949768 1.1717041801949768 1.1717041801949768)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4124224298192676 0)
"cameras" SET Transform eulerAngles (10.995910723483775 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1010736208283907
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9160532428087866
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06945601880064012
"cameras/drone/drone0" SET Transform localPosition (0.5934157764125119 -0.14551399619495814 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6039502250480048 1.2388284161695606 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 12 13)
"cameras/drone/drone0" SET Transform localScale (1.290126751604841 1.290126751604841 1.290126751604841)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -12 -11)
"cameras/drone/drone1" SET Transform localScale (1.2503211301990649 1.2503211301990649 1.2503211301990649)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1034538634782805 0)
"cameras" SET Transform eulerAngles (-2.016338843683233 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2007559863778239
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9872764560986693
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2985783259083946
"cameras/drone/drone0" SET Transform localPosition (-1.018789513221883 -0.17618513245498973 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.423618584897012 0.9945217030254931 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 20 -10)
"cameras/drone/drone0" SET Transform localScale (1.2119814149952743 1.2119814149952743 1.2119814149952743)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 2 15)
"cameras/drone/drone1" SET Transform localScale (0.9244109061320362 0.9244109061320362 0.9244109061320362)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.818211425654187 0)
"cameras" SET Transform eulerAngles (16.515902383765805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5594011622882219
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7271064393052464
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.054783125113226964
"cameras/drone/drone0" SET Transform localPosition (0.9295514383909482 0.6516299577341567 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21284722665739775 1.1622727291720545 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -10 -3)
"cameras/drone/drone0" SET Transform localScale (1.0354634537321914 1.0354634537321914 1.0354634537321914)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 0 -9)
"cameras/drone/drone1" SET Transform localScale (0.6995059804850752 0.6995059804850752 0.6995059804850752)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.143405092739831 0)
"cameras" SET Transform eulerAngles (-8.619319651523165 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41592725669910097
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9076506945946353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1772687474256246
"cameras/drone/drone0" SET Transform localPosition (0.6724579152420576 0.6396864963821303 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9478557938774201 1.1955536603680659 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -8 -11)
"cameras/drone/drone0" SET Transform localScale (0.6945384422640493 0.6945384422640493 0.6945384422640493)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -18 17)
"cameras/drone/drone1" SET Transform localScale (0.8322608222573754 0.8322608222573754 0.8322608222573754)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7224530672149614 0)
"cameras" SET Transform eulerAngles (-11.142342029117685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.564257438948287
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.799649164009447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1287442130435689
"cameras/drone/drone0" SET Transform localPosition (-1.1351109803422403 -0.007530469522102401 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.833148144318724 0.868065765782974 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 12 -15)
"cameras/drone/drone0" SET Transform localScale (0.6622265930015347 0.6622265930015347 0.6622265930015347)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -6 -7)
"cameras/drone/drone1" SET Transform localScale (0.6676211431584667 0.6676211431584667 0.6676211431584667)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.559092687489998 0)
"cameras" SET Transform eulerAngles (2.0086844122820082 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.048028859849802
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.674862224179928
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27895644537088576
"cameras/drone/drone0" SET Transform localPosition (-0.6848986561636392 0.15209356393368428 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1167342591530867 0.8888168211102101 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -15 -7)
"cameras/drone/drone0" SET Transform localScale (1.4405353351011974 1.4405353351011974 1.4405353351011974)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 8 5)
"cameras/drone/drone1" SET Transform localScale (1.2995163427828282 1.2995163427828282 1.2995163427828282)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.322510994086352 0)
"cameras" SET Transform eulerAngles (-2.4617353050855755 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5256265807660215
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9437610361977318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0007103225926744284
"cameras/drone/drone0" SET Transform localPosition (-0.8661685527784145 0.569907934403912 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.43527614823100214 0.9265050578190546 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -6 -8)
"cameras/drone/drone0" SET Transform localScale (1.2892438771289485 1.2892438771289485 1.2892438771289485)
"cameras/drone/drone1" SET Transform localEulerAngles (10 14 -16)
"cameras/drone/drone1" SET Transform localScale (1.1009576593823711 1.1009576593823711 1.1009576593823711)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3665410164731036 0)
"cameras" SET Transform eulerAngles (15.211245326484708 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48433093323638554
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4181543320280527
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07473416019896165
"cameras/drone/drone0" SET Transform localPosition (-0.7539928324568046 0.09191015649915696 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0673050223090323 0.8034531626762123 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -18 16)
"cameras/drone/drone0" SET Transform localScale (0.8937421249298511 0.8937421249298511 0.8937421249298511)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 17 -14)
"cameras/drone/drone1" SET Transform localScale (1.4883395087270923 1.4883395087270923 1.4883395087270923)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.488548864639458 0)
"cameras" SET Transform eulerAngles (11.22581335870349 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5265596227966246
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3366589275220884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16136867815855427
"cameras/drone/drone0" SET Transform localPosition (0.5415158159071543 0.5597912845723727 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.032173293339146536 1.2005531156316365 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 2 -13)
"cameras/drone/drone0" SET Transform localScale (1.410340873955434 1.410340873955434 1.410340873955434)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -18 -1)
"cameras/drone/drone1" SET Transform localScale (1.344011298108927 1.344011298108927 1.344011298108927)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2822324602089807 0)
"cameras" SET Transform eulerAngles (16.110886714566696 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.504740316655105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8774454948474362
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2119319506647841
"cameras/drone/drone0" SET Transform localPosition (-0.996278724242109 0.2916809732954703 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8334211833168708 1.1260830425316446 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 17 10)
"cameras/drone/drone0" SET Transform localScale (0.8517081244771647 0.8517081244771647 0.8517081244771647)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 11 15)
"cameras/drone/drone1" SET Transform localScale (0.8856302445316826 0.8856302445316826 0.8856302445316826)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.233965349768267 0)
"cameras" SET Transform eulerAngles (11.758078254529405 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3618439579510213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.195118755292014
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12791574344082673
"cameras/drone/drone0" SET Transform localPosition (0.6553866160090507 -0.002444337042655509 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21035903990701632 1.0543098096356918 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -19 4)
"cameras/drone/drone0" SET Transform localScale (1.2819856998412287 1.2819856998412287 1.2819856998412287)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -13 -1)
"cameras/drone/drone1" SET Transform localScale (1.403771609658782 1.403771609658782 1.403771609658782)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.102219597217733 0)
"cameras" SET Transform eulerAngles (16.213093810053458 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9293540049867546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6554874907639172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2811819673902876
"cameras/drone/drone0" SET Transform localPosition (0.6019639747053704 0.6386949797978401 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6751959592261927 1.0443993093412482 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 2 -19)
"cameras/drone/drone0" SET Transform localScale (0.6249706043781423 0.6249706043781423 0.6249706043781423)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -19 -15)
"cameras/drone/drone1" SET Transform localScale (0.7629852238629782 0.7629852238629782 0.7629852238629782)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.409722080866199 0)
"cameras" SET Transform eulerAngles (2.11722871829247 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5064799484382363
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9538076059400503
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2565613858498177
"cameras/drone/drone0" SET Transform localPosition (0.19527037188782503 0.1634656269442401 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6584614123620531 1.137587809445181 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 17 6)
"cameras/drone/drone0" SET Transform localScale (1.2974749667788008 1.2974749667788008 1.2974749667788008)
"cameras/drone/drone1" SET Transform localEulerAngles (0 17 -2)
"cameras/drone/drone1" SET Transform localScale (1.3909390776651023 1.3909390776651023 1.3909390776651023)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.567976050696821 0)
"cameras" SET Transform eulerAngles (10.013858187485116 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.846251128707585
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9818902202873816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14289816727819502
"cameras/drone/drone0" SET Transform localPosition (-0.33975888881779437 -0.25516245048616065 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.81534458624904 1.0922042700808534 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -8 -9)
"cameras/drone/drone0" SET Transform localScale (0.7643894446198717 0.7643894446198717 0.7643894446198717)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -20 9)
"cameras/drone/drone1" SET Transform localScale (1.4497370972792267 1.4497370972792267 1.4497370972792267)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6961445283713505 0)
"cameras" SET Transform eulerAngles (0.6514862303112992 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6868986451469584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2015182415225278
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0031244966162107704
"cameras/drone/drone0" SET Transform localPosition (0.613599325546953 0.6353259713552923 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04671402335029384 1.1301036792555896 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 18 11)
"cameras/drone/drone0" SET Transform localScale (1.1781687694320468 1.1781687694320468 1.1781687694320468)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 3 -4)
"cameras/drone/drone1" SET Transform localScale (1.2474247119387019 1.2474247119387019 1.2474247119387019)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7979041596279215 0)
"cameras" SET Transform eulerAngles (13.61846365148618 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6009047035894926
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3290655889771084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35631837241647235
"cameras/drone/drone0" SET Transform localPosition (0.1548226435735618 -0.10941595155492062 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.067456665576964 1.1028165806163508 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -12 -19)
"cameras/drone/drone0" SET Transform localScale (0.9108829559312257 0.9108829559312257 0.9108829559312257)
"cameras/drone/drone1" SET Transform localEulerAngles (6 0 -9)
"cameras/drone/drone1" SET Transform localScale (0.9303054373433952 0.9303054373433952 0.9303054373433952)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.712710328163257 0)
"cameras" SET Transform eulerAngles (-2.608508145743265 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.384414391494167
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.403532830645966
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3565452403285678
"cameras/drone/drone0" SET Transform localPosition (0.36087436008210916 -0.25181507541572395 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.46401815073431396 1.1971616585920402 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 18 -7)
"cameras/drone/drone0" SET Transform localScale (1.4418349015302772 1.4418349015302772 1.4418349015302772)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -7 -17)
"cameras/drone/drone1" SET Transform localScale (1.1677899028769958 1.1677899028769958 1.1677899028769958)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8381763250957164 0)
"cameras" SET Transform eulerAngles (-14.801520477051548 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2037950321776159
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3751953519235007
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20871199022799827
"cameras/drone/drone0" SET Transform localPosition (1.0100600306999101 -0.11596615621936851 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.70292276679916 1.051280294708058 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -15 -10)
"cameras/drone/drone0" SET Transform localScale (0.6286719345023397 0.6286719345023397 0.6286719345023397)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -11 -3)
"cameras/drone/drone1" SET Transform localScale (1.109436659122043 1.109436659122043 1.109436659122043)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.428404918717419 0)
"cameras" SET Transform eulerAngles (-7.298948769494364 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5205427229927029
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9624044183471734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36261578786833254
"cameras/drone/drone0" SET Transform localPosition (-0.426585503269559 -0.018662942716968278 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6719053784250881 1.157129430444339 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -11 -12)
"cameras/drone/drone0" SET Transform localScale (1.019780466959011 1.019780466959011 1.019780466959011)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -19 -13)
"cameras/drone/drone1" SET Transform localScale (1.3816255198957612 1.3816255198957612 1.3816255198957612)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4909737577824735 0)
"cameras" SET Transform eulerAngles (-12.17704681241206 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8671862623890625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.097215661786151
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22308037719382764
"cameras/drone/drone0" SET Transform localPosition (-1.1517131057606818 0.3349115507166412 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.33519724632602543 1.076705435571175 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -20 14)
"cameras/drone/drone0" SET Transform localScale (0.6771500665519534 0.6771500665519534 0.6771500665519534)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -9 11)
"cameras/drone/drone1" SET Transform localScale (1.385046030640353 1.385046030640353 1.385046030640353)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.975396507400129 0)
"cameras" SET Transform eulerAngles (13.431263039664579 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7048187243071533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0004361419936374
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29264954014075617
"cameras/drone/drone0" SET Transform localPosition (0.6618246947493447 0.6934014752005881 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1315628776495277 0.8185914854780714 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 7 0)
"cameras/drone/drone0" SET Transform localScale (1.0297864121574292 1.0297864121574292 1.0297864121574292)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -3 -4)
"cameras/drone/drone1" SET Transform localScale (0.95664476082159 0.95664476082159 0.95664476082159)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.047384149919616 0)
"cameras" SET Transform eulerAngles (-9.154130451233588 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3782770130211113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9832032101459198
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10755189278739748
"cameras/drone/drone0" SET Transform localPosition (0.8989429854853979 0.6667144750503451 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37128722118748647 0.9002550696577842 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 12 1)
"cameras/drone/drone0" SET Transform localScale (0.9108635922573012 0.9108635922573012 0.9108635922573012)
"cameras/drone/drone1" SET Transform localEulerAngles (10 5 -9)
"cameras/drone/drone1" SET Transform localScale (1.4973664083771592 1.4973664083771592 1.4973664083771592)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.275600498790599 0)
"cameras" SET Transform eulerAngles (-7.8079966696347824 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4512019310761015
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6505687995156508
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26889235062765604
"cameras/drone/drone0" SET Transform localPosition (-0.9307755877173698 0.468031490505697 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.44709734138697454 0.8174376644810426 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 18 8)
"cameras/drone/drone0" SET Transform localScale (1.1630904398497353 1.1630904398497353 1.1630904398497353)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 17 9)
"cameras/drone/drone1" SET Transform localScale (0.6475169051379316 0.6475169051379316 0.6475169051379316)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8169971604504416 0)
"cameras" SET Transform eulerAngles (-13.123541823432925 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5090171931399685
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.844281598994247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28499554711996894
"cameras/drone/drone0" SET Transform localPosition (-0.9064120708021254 0.09386926654468858 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.37705394073335396 1.1441432604678246 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -11 5)
"cameras/drone/drone0" SET Transform localScale (1.1305815093997829 1.1305815093997829 1.1305815093997829)
"cameras/drone/drone1" SET Transform localEulerAngles (6 3 14)
"cameras/drone/drone1" SET Transform localScale (0.9664124780514471 0.9664124780514471 0.9664124780514471)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.190852811129766 0)
"cameras" SET Transform eulerAngles (5.877216592029939 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.236412451191299
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.630133476833283
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03297538165073046
"cameras/drone/drone0" SET Transform localPosition (-0.9466826620458381 0.29400601713286806 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.48554517141319364 1.2843463058868434 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -14 -2)
"cameras/drone/drone0" SET Transform localScale (0.9723312609250704 0.9723312609250704 0.9723312609250704)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 18 -11)
"cameras/drone/drone1" SET Transform localScale (1.1479998925926758 1.1479998925926758 1.1479998925926758)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.888396769563187 0)
"cameras" SET Transform eulerAngles (11.40121626745012 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4918361580235632
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.292602517709311
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.006827620778930799
"cameras/drone/drone0" SET Transform localPosition (-0.3382644415303261 0.15009423657044402 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7547132701796164 1.1047849216129042 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 1 2)
"cameras/drone/drone0" SET Transform localScale (1.3000568098955894 1.3000568098955894 1.3000568098955894)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -18 0)
"cameras/drone/drone1" SET Transform localScale (1.1486252202241602 1.1486252202241602 1.1486252202241602)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.194122443531292 0)
"cameras" SET Transform eulerAngles (11.045656705622228 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.482118521407196
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3800275815342227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14718189653367056
"cameras/drone/drone0" SET Transform localPosition (0.28220823837927056 0.6828085569013567 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6827181163383857 0.8073877106236872 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -3 5)
"cameras/drone/drone0" SET Transform localScale (1.3107599473621854 1.3107599473621854 1.3107599473621854)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -1 2)
"cameras/drone/drone1" SET Transform localScale (0.6130565156036333 0.6130565156036333 0.6130565156036333)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5837086777335765 0)
"cameras" SET Transform eulerAngles (12.822547027061198 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.632485636300952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.378710279931957
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2759371852824966
"cameras/drone/drone0" SET Transform localPosition (0.3965538980381418 -0.023290953198119746 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.005696391484969032 0.9438705224053427 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 2 -13)
"cameras/drone/drone0" SET Transform localScale (1.473303128918463 1.473303128918463 1.473303128918463)
"cameras/drone/drone1" SET Transform localEulerAngles (17 19 15)
"cameras/drone/drone1" SET Transform localScale (1.3231160542228948 1.3231160542228948 1.3231160542228948)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3971278689837368 0)
"cameras" SET Transform eulerAngles (-14.077281157792365 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6490971764280504
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5506108991244267
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3475010771709087
"cameras/drone/drone0" SET Transform localPosition (-0.5360899410740989 0.16126391469618312 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.33385114468038013 0.9932651880482374 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -12 9)
"cameras/drone/drone0" SET Transform localScale (1.390377466198756 1.390377466198756 1.390377466198756)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -14 15)
"cameras/drone/drone1" SET Transform localScale (1.023340535893231 1.023340535893231 1.023340535893231)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2789094334214273 0)
"cameras" SET Transform eulerAngles (-1.4654745678486911 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.573796646547963
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5676714903884639
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.343771577449764
"cameras/drone/drone0" SET Transform localPosition (-1.1769693777111627 0.11608102452176866 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0629344124570579 0.8858580883359453 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -8 -8)
"cameras/drone/drone0" SET Transform localScale (1.0523387283732155 1.0523387283732155 1.0523387283732155)
"cameras/drone/drone1" SET Transform localEulerAngles (11 2 8)
"cameras/drone/drone1" SET Transform localScale (0.6389050726777684 0.6389050726777684 0.6389050726777684)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.595099469605047 0)
"cameras" SET Transform eulerAngles (-7.869009163703451 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7542532617730338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.446754364897245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15015320731578946
"cameras/drone/drone0" SET Transform localPosition (0.9006543661759927 0.5470969878766421 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6081744651377927 1.2909847200183466 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -20 20)
"cameras/drone/drone0" SET Transform localScale (1.132022270280772 1.132022270280772 1.132022270280772)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 8 0)
"cameras/drone/drone1" SET Transform localScale (0.9201326698020182 0.9201326698020182 0.9201326698020182)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1379421287873748 0)
"cameras" SET Transform eulerAngles (-18.740850181292608 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9754713703125143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9264825240495334
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0375664032823821
"cameras/drone/drone0" SET Transform localPosition (-0.9943755606288552 0.07608763446943118 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.47438998592021 1.1166729898139238 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -18 0)
"cameras/drone/drone0" SET Transform localScale (0.9228411716928386 0.9228411716928386 0.9228411716928386)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -3 5)
"cameras/drone/drone1" SET Transform localScale (0.8912005625029238 0.8912005625029238 0.8912005625029238)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 84
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.8654941713170734 0)
"cameras" SET Transform eulerAngles (4.225551888058288 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0600056990398168
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8541456433700643
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07549465812241368
"cameras/drone/drone0" SET Transform localPosition (-0.6143190530511574 0.04089968244254344 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37035346038477357 1.256742369415333 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -6 -18)
"cameras/drone/drone0" SET Transform localScale (0.7896960159513812 0.7896960159513812 0.7896960159513812)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -1 -14)
"cameras/drone/drone1" SET Transform localScale (0.9422136448157135 0.9422136448157135 0.9422136448157135)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.905477763991147 0)
"cameras" SET Transform eulerAngles (-18.872857053549893 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43032284921397956
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.495015463931912
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3998711029256408
"cameras/drone/drone0" SET Transform localPosition (0.6296897700089918 0.3705179856705228 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7499528612305417 1.0909203727853973 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -5 -5)
"cameras/drone/drone0" SET Transform localScale (1.3330628854311528 1.3330628854311528 1.3330628854311528)
"cameras/drone/drone1" SET Transform localEulerAngles (17 12 9)
"cameras/drone/drone1" SET Transform localScale (1.285541005917307 1.285541005917307 1.285541005917307)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.821911896421277 0)
"cameras" SET Transform eulerAngles (9.67984709339811 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5106994441119412
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.680908999201918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15666783740803264
"cameras/drone/drone0" SET Transform localPosition (0.09741299774065593 0.0284326679232893 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.33556710629910147 0.8885020555583667 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -16 -1)
"cameras/drone/drone0" SET Transform localScale (1.3850522867675652 1.3850522867675652 1.3850522867675652)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -7 18)
"cameras/drone/drone1" SET Transform localScale (1.0911622290427578 1.0911622290427578 1.0911622290427578)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5818260902705794 0)
"cameras" SET Transform eulerAngles (18.49302674688724 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8925848499893678
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2380853212021643
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29902926239894695
"cameras/drone/drone0" SET Transform localPosition (0.633339616682681 -0.24851358459843736 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1092416657751174 0.8592109278761084 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 1 -1)
"cameras/drone/drone0" SET Transform localScale (0.9602719327501851 0.9602719327501851 0.9602719327501851)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 1 -13)
"cameras/drone/drone1" SET Transform localScale (1.3839072704103148 1.3839072704103148 1.3839072704103148)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.214679985999712 0)
"cameras" SET Transform eulerAngles (-1.9635807809132224 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7316422088307277
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5636964376664246
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14481797750826497
"cameras/drone/drone0" SET Transform localPosition (-0.9931850060075639 0.10276176490588146 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5460263228278268 0.8064397169107699 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 14 -11)
"cameras/drone/drone0" SET Transform localScale (1.1978348355261375 1.1978348355261375 1.1978348355261375)
"cameras/drone/drone1" SET Transform localEulerAngles (12 19 -6)
"cameras/drone/drone1" SET Transform localScale (1.3359463960709759 1.3359463960709759 1.3359463960709759)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5858311057279098 0)
"cameras" SET Transform eulerAngles (-17.177936076838478 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.962575058522826
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3477992983485914
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07657477412464592
"cameras/drone/drone0" SET Transform localPosition (0.24007876367010872 0.6795289592477827 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4643199457789041 1.0607404990047853 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 5 -15)
"cameras/drone/drone0" SET Transform localScale (1.4101268632252406 1.4101268632252406 1.4101268632252406)
"cameras/drone/drone1" SET Transform localEulerAngles (19 11 3)
"cameras/drone/drone1" SET Transform localScale (0.6873531949568293 0.6873531949568293 0.6873531949568293)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.320358306143022 0)
"cameras" SET Transform eulerAngles (10.697786159185412 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5976814635753915
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9386664698044854
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14582195812265755
"cameras/drone/drone0" SET Transform localPosition (0.26229168406725645 0.10161440545884887 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8455727840222658 0.8386290514121273 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -18 7)
"cameras/drone/drone0" SET Transform localScale (1.0131928969310082 1.0131928969310082 1.0131928969310082)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 7 -12)
"cameras/drone/drone1" SET Transform localScale (1.4784038834562598 1.4784038834562598 1.4784038834562598)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0575126320349284 0)
"cameras" SET Transform eulerAngles (11.667328434874584 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42822488186526764
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1734866936447577
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06663375836023869
"cameras/drone/drone0" SET Transform localPosition (-0.3822787427824169 0.29786938295831006 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.009149604998926364 1.0539212534030642 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -7 -11)
"cameras/drone/drone0" SET Transform localScale (1.2613112779313118 1.2613112779313118 1.2613112779313118)
"cameras/drone/drone1" SET Transform localEulerAngles (0 15 6)
"cameras/drone/drone1" SET Transform localScale (0.6448042190947079 0.6448042190947079 0.6448042190947079)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.252025849512362 0)
"cameras" SET Transform eulerAngles (5.3577336395733575 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9262060356131913
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1717311574760978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26237735626540953
"cameras/drone/drone0" SET Transform localPosition (-0.22650163532082834 -0.28724021687919715 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8206120116401923 0.8775033393243807 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 9 2)
"cameras/drone/drone0" SET Transform localScale (1.0753090725198233 1.0753090725198233 1.0753090725198233)
"cameras/drone/drone1" SET Transform localEulerAngles (2 19 3)
"cameras/drone/drone1" SET Transform localScale (1.1061864846111997 1.1061864846111997 1.1061864846111997)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8200275261825585 0)
"cameras" SET Transform eulerAngles (18.00575993430683 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9653918406506496
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6801387751912973
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04635593091408863
"cameras/drone/drone0" SET Transform localPosition (-0.10160954407865708 0.5280687003687425 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07236794819314984 1.0930446364357511 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 2 16)
"cameras/drone/drone0" SET Transform localScale (1.2253769806562254 1.2253769806562254 1.2253769806562254)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -4 -14)
"cameras/drone/drone1" SET Transform localScale (1.4838828409977922 1.4838828409977922 1.4838828409977922)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.181448953592662 0)
"cameras" SET Transform eulerAngles (2.494488365269323 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1900537608492434
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.903081141234925
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.003436015522511493
"cameras/drone/drone0" SET Transform localPosition (-0.4382955937359382 0.6118226057363421 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5652088860829736 0.8846596776964861 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -15 8)
"cameras/drone/drone0" SET Transform localScale (1.4011238992410842 1.4011238992410842 1.4011238992410842)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 16 -7)
"cameras/drone/drone1" SET Transform localScale (1.1374856358199334 1.1374856358199334 1.1374856358199334)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.222414592455782 0)
"cameras" SET Transform eulerAngles (3.9021775203678004 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8274504164250653
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4468118135446013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06265089946861795
"cameras/drone/drone0" SET Transform localPosition (1.098573765740319 0.6351965421101873 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6839563077503636 1.1855468061604284 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 1 -14)
"cameras/drone/drone0" SET Transform localScale (1.1474762282177942 1.1474762282177942 1.1474762282177942)
"cameras/drone/drone1" SET Transform localEulerAngles (18 5 -5)
"cameras/drone/drone1" SET Transform localScale (1.4705695105268979 1.4705695105268979 1.4705695105268979)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5391268845794475 0)
"cameras" SET Transform eulerAngles (-15.40681967118223 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45093228324943135
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4559978707472059
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2565977560473792
"cameras/drone/drone0" SET Transform localPosition (-0.07507738942166164 0.20000711026909473 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.037638045768365824 0.8263696719585062 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -15 -16)
"cameras/drone/drone0" SET Transform localScale (0.7183468718555347 0.7183468718555347 0.7183468718555347)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -9 -8)
"cameras/drone/drone1" SET Transform localScale (1.1665891025150228 1.1665891025150228 1.1665891025150228)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.208029285085804 0)
"cameras" SET Transform eulerAngles (-10.913698821120086 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9411432560815806
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5148696281174003
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.294574109978858
"cameras/drone/drone0" SET Transform localPosition (0.11276742437299592 -0.15834720899138416 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6508316034942959 0.9443854637610951 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 7 8)
"cameras/drone/drone0" SET Transform localScale (1.4797472766841437 1.4797472766841437 1.4797472766841437)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 9 -18)
"cameras/drone/drone1" SET Transform localScale (1.3809327114649457 1.3809327114649457 1.3809327114649457)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.72565934150417 0)
"cameras" SET Transform eulerAngles (-9.718801191575448 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1108980475335526
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9258679996234864
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01046501077750528
"cameras/drone/drone0" SET Transform localPosition (-0.21617160734870156 -0.028574233872204424 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0007816047638760093 0.9888527248543411 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 14 9)
"cameras/drone/drone0" SET Transform localScale (1.3683566864439074 1.3683566864439074 1.3683566864439074)
"cameras/drone/drone1" SET Transform localEulerAngles (6 2 -9)
"cameras/drone/drone1" SET Transform localScale (1.1637302963810128 1.1637302963810128 1.1637302963810128)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.860863461064511 0)
"cameras" SET Transform eulerAngles (17.745357798586767 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5375943381076245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8033544397860637
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22869741534760282
"cameras/drone/drone0" SET Transform localPosition (1.1155752858900898 0.2195338970279554 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04872012637512535 0.9549889069917579 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 2 0)
"cameras/drone/drone0" SET Transform localScale (0.9828065193376228 0.9828065193376228 0.9828065193376228)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 10 -14)
"cameras/drone/drone1" SET Transform localScale (0.6869333320549494 0.6869333320549494 0.6869333320549494)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3497232981647915 0)
"cameras" SET Transform eulerAngles (-16.780814824186535 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.008108360420275
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9501512529819999
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03174437112819928
"cameras/drone/drone0" SET Transform localPosition (1.1529005554303084 0.4666332149182682 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6410217911826607 0.8613241569367045 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 2 -8)
"cameras/drone/drone0" SET Transform localScale (0.9045622830619086 0.9045622830619086 0.9045622830619086)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -4 19)
"cameras/drone/drone1" SET Transform localScale (1.1650298937130392 1.1650298937130392 1.1650298937130392)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3164572673118897 0)
"cameras" SET Transform eulerAngles (15.969322749714188 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7180648968334189
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9483404742377086
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12849367226788458
"cameras/drone/drone0" SET Transform localPosition (-1.1701464110668403 0.3434234502129238 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6559565150233959 0.9097692478874364 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 3 17)
"cameras/drone/drone0" SET Transform localScale (0.8214335729417651 0.8214335729417651 0.8214335729417651)
"cameras/drone/drone1" SET Transform localEulerAngles (6 7 5)
"cameras/drone/drone1" SET Transform localScale (0.9436978178491102 0.9436978178491102 0.9436978178491102)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7246049190171 0)
"cameras" SET Transform eulerAngles (-8.595101406844243 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4399333399510734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9130786014642125
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.042906838947250184
"cameras/drone/drone0" SET Transform localPosition (-1.1380192101490427 0.538807703993224 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6824135488284271 1.1969432913591864 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 8 7)
"cameras/drone/drone0" SET Transform localScale (0.9893365286564382 0.9893365286564382 0.9893365286564382)
"cameras/drone/drone1" SET Transform localEulerAngles (16 16 17)
"cameras/drone/drone1" SET Transform localScale (0.7046648963322023 0.7046648963322023 0.7046648963322023)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8957384519119955 0)
"cameras" SET Transform eulerAngles (-1.6021741254978714 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5737808204129
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0465645694654742
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2829911309452774
"cameras/drone/drone0" SET Transform localPosition (0.4814816184563606 -0.05739670810526315 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8012239291820296 1.249641337158774 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -18 18)
"cameras/drone/drone0" SET Transform localScale (0.7082943090230858 0.7082943090230858 0.7082943090230858)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -13 11)
"cameras/drone/drone1" SET Transform localScale (0.8637150834464793 0.8637150834464793 0.8637150834464793)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.45437789407251 0)
"cameras" SET Transform eulerAngles (-3.9857478903808286 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6304812127996612
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4862391046827081
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09581506250322797
"cameras/drone/drone0" SET Transform localPosition (-0.2564795193301971 -0.12857551433591735 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.15848621358305737 1.2944890822434871 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -3 2)
"cameras/drone/drone0" SET Transform localScale (1.2839747384452693 1.2839747384452693 1.2839747384452693)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -11 -1)
"cameras/drone/drone1" SET Transform localScale (1.2805052143972793 1.2805052143972793 1.2805052143972793)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.790709167945904 0)
"cameras" SET Transform eulerAngles (7.904710873118322 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2782127405295385
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6926768101687717
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13660602246822393
"cameras/drone/drone0" SET Transform localPosition (0.06842672498334523 0.26709138617869604 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8832076093117147 0.8131725601341856 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 9 6)
"cameras/drone/drone0" SET Transform localScale (1.082986437490826 1.082986437490826 1.082986437490826)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -6 -15)
"cameras/drone/drone1" SET Transform localScale (0.8038351535192366 0.8038351535192366 0.8038351535192366)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3664557597736957 0)
"cameras" SET Transform eulerAngles (1.3891336460258188 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5069291622144627
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.046400852423746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05707716740759255
"cameras/drone/drone0" SET Transform localPosition (-0.34369860833875354 0.2024998482608697 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09873113400561428 1.025839814156992 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -5 11)
"cameras/drone/drone0" SET Transform localScale (1.2825449474323265 1.2825449474323265 1.2825449474323265)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -4 -19)
"cameras/drone/drone1" SET Transform localScale (1.4812882455259162 1.4812882455259162 1.4812882455259162)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.51354923118129 0)
"cameras" SET Transform eulerAngles (8.328732172526099 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4348062872705516
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.920129661950578
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3374475565602591
"cameras/drone/drone0" SET Transform localPosition (0.8538434964543116 -0.07358545702835556 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.35925774022868917 0.9693444372168887 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -1 20)
"cameras/drone/drone0" SET Transform localScale (0.8122932389657876 0.8122932389657876 0.8122932389657876)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -6 9)
"cameras/drone/drone1" SET Transform localScale (0.7462645749123451 0.7462645749123451 0.7462645749123451)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2189547652383723 0)
"cameras" SET Transform eulerAngles (19.709002118462536 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.372965498623336
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8432506881743191
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2156011227965581
"cameras/drone/drone0" SET Transform localPosition (-0.5648039821802763 0.23791789044822603 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0944608324567164 1.1383383221708656 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -14 7)
"cameras/drone/drone0" SET Transform localScale (1.4673701282166198 1.4673701282166198 1.4673701282166198)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -14 11)
"cameras/drone/drone1" SET Transform localScale (1.3028453202088757 1.3028453202088757 1.3028453202088757)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.449814433726018 0)
"cameras" SET Transform eulerAngles (-5.641392719470307 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2819667759856983
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4918226225318372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13695443224543466
"cameras/drone/drone0" SET Transform localPosition (-0.09395728459308605 -0.219062388819178 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0144478630449163 0.9154148703064231 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 2 -12)
"cameras/drone/drone0" SET Transform localScale (0.6844360137942611 0.6844360137942611 0.6844360137942611)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -20 19)
"cameras/drone/drone1" SET Transform localScale (1.4992812746628565 1.4992812746628565 1.4992812746628565)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.134899808318752 0)
"cameras" SET Transform eulerAngles (-1.109984397150832 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5367644444821738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3789115537494023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38198431649477327
"cameras/drone/drone0" SET Transform localPosition (0.4311626372114574 0.6282366213904675 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9801895249942009 1.2914181391290918 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 16 7)
"cameras/drone/drone0" SET Transform localScale (0.7954323858797221 0.7954323858797221 0.7954323858797221)
"cameras/drone/drone1" SET Transform localEulerAngles (16 10 -17)
"cameras/drone/drone1" SET Transform localScale (0.6083833648531803 0.6083833648531803 0.6083833648531803)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.415203286529344 0)
"cameras" SET Transform eulerAngles (4.482360718881004 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8319645964882778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1727692194454549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03744601558501919
"cameras/drone/drone0" SET Transform localPosition (0.1276808068602313 0.6879447886842469 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8391621986782651 1.1394590982238981 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -15 10)
"cameras/drone/drone0" SET Transform localScale (1.1567377801324308 1.1567377801324308 1.1567377801324308)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -14 -9)
"cameras/drone/drone1" SET Transform localScale (0.6068432390346084 0.6068432390346084 0.6068432390346084)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.532852333224052 0)
"cameras" SET Transform eulerAngles (-15.274170295505511 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6252259041244277
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.175770247509731
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07751908775737344
"cameras/drone/drone0" SET Transform localPosition (-0.6597548215716805 0.4380308620532735 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0918013330518683 1.1748280035039178 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -6 19)
"cameras/drone/drone0" SET Transform localScale (0.632514232125619 0.632514232125619 0.632514232125619)
"cameras/drone/drone1" SET Transform localEulerAngles (14 9 20)
"cameras/drone/drone1" SET Transform localScale (0.9704544134826963 0.9704544134826963 0.9704544134826963)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.80224922963734 0)
"cameras" SET Transform eulerAngles (1.8180851262568787 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5012465606412397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6000696580085987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20322550023741967
"cameras/drone/drone0" SET Transform localPosition (-0.9425657542718993 0.020910833614139535 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.03781491277448534 1.2355335134178917 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -15 -6)
"cameras/drone/drone0" SET Transform localScale (0.9083792809944408 0.9083792809944408 0.9083792809944408)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -20 16)
"cameras/drone/drone1" SET Transform localScale (0.6975826322948784 0.6975826322948784 0.6975826322948784)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9469137715522384 0)
"cameras" SET Transform eulerAngles (-18.457835593370685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5638775933957194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.421624710700074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2923444689229049
"cameras/drone/drone0" SET Transform localPosition (1.0513077962839137 0.24875082184419467 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9040817242391859 1.0157581112452196 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 1 15)
"cameras/drone/drone0" SET Transform localScale (0.939801676663943 0.939801676663943 0.939801676663943)
"cameras/drone/drone1" SET Transform localEulerAngles (2 4 -20)
"cameras/drone/drone1" SET Transform localScale (0.8826968575958405 0.8826968575958405 0.8826968575958405)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.385053287753582 0)
"cameras" SET Transform eulerAngles (11.97602560773629 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5054428425537916
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.188006831613963
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13828122844203655
"cameras/drone/drone0" SET Transform localPosition (1.0018970170039314 0.020032371581587383 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.087558545145231 1.257863288615969 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -17 -13)
"cameras/drone/drone0" SET Transform localScale (1.149586943264207 1.149586943264207 1.149586943264207)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 2 5)
"cameras/drone/drone1" SET Transform localScale (1.3138154133352988 1.3138154133352988 1.3138154133352988)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7118201989868433 0)
"cameras" SET Transform eulerAngles (-2.2229989388832934 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.589527978063345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6615566902383436
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.053705351931868386
"cameras/drone/drone0" SET Transform localPosition (0.3004759124132972 -0.04233105134232368 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6185473007117953 0.9302584579751861 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 15 -17)
"cameras/drone/drone0" SET Transform localScale (0.9741664812352375 0.9741664812352375 0.9741664812352375)
"cameras/drone/drone1" SET Transform localEulerAngles (6 1 14)
"cameras/drone/drone1" SET Transform localScale (1.417812162769926 1.417812162769926 1.417812162769926)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0700766024066795 0)
"cameras" SET Transform eulerAngles (-3.5680907229086216 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.463580091368955
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7606941612066525
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30931463036942064
"cameras/drone/drone0" SET Transform localPosition (0.7156426045976809 0.0009931816789197634 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5848830043118737 0.8535103797712869 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 4 10)
"cameras/drone/drone0" SET Transform localScale (0.9607929370540842 0.9607929370540842 0.9607929370540842)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -10 -12)
"cameras/drone/drone1" SET Transform localScale (1.0733226178151805 1.0733226178151805 1.0733226178151805)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.09905611899731 0)
"cameras" SET Transform eulerAngles (8.334785927582754 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9178169362266089
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9540007414240694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3190298045657986
"cameras/drone/drone0" SET Transform localPosition (1.0947692050913134 0.34441829564012566 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8725082452213948 0.9292672330202171 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -13 20)
"cameras/drone/drone0" SET Transform localScale (1.1295961044720184 1.1295961044720184 1.1295961044720184)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -18 -19)
"cameras/drone/drone1" SET Transform localScale (1.057219448577986 1.057219448577986 1.057219448577986)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.847760817332566 0)
"cameras" SET Transform eulerAngles (5.170732307465858 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.544212011684499
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.343225021576832
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2077970829982422
"cameras/drone/drone0" SET Transform localPosition (-0.009445974602135143 0.3366038598331949 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4530804033829614 0.8972452292026077 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -11 9)
"cameras/drone/drone0" SET Transform localScale (1.2001124940581678 1.2001124940581678 1.2001124940581678)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -15 -13)
"cameras/drone/drone1" SET Transform localScale (1.0530550183224106 1.0530550183224106 1.0530550183224106)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0788931945113633 0)
"cameras" SET Transform eulerAngles (15.118347177682772 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4924391782230699
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.648307595597421
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17750174101382946
"cameras/drone/drone0" SET Transform localPosition (0.4953147335033812 -0.11052596069746307 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0608867844495418 1.1902955680460394 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 20 1)
"cameras/drone/drone0" SET Transform localScale (0.6995134487007992 0.6995134487007992 0.6995134487007992)
"cameras/drone/drone1" SET Transform localEulerAngles (0 1 6)
"cameras/drone/drone1" SET Transform localScale (0.8234502982198457 0.8234502982198457 0.8234502982198457)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.223514038286668 0)
"cameras" SET Transform eulerAngles (3.029844355833397 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5641450605788063
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9578874484926256
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.010093215646358589
"cameras/drone/drone0" SET Transform localPosition (-0.2617172026602772 0.43476341849242656 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5591121753932764 0.9287332806930588 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 11 5)
"cameras/drone/drone0" SET Transform localScale (1.3332472627382697 1.3332472627382697 1.3332472627382697)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 2 -17)
"cameras/drone/drone1" SET Transform localScale (0.7681597433085612 0.7681597433085612 0.7681597433085612)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.495276273779073 0)
"cameras" SET Transform eulerAngles (12.946979538036992 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5630552910348265
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5207869637532816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26131099245118544
"cameras/drone/drone0" SET Transform localPosition (-1.000503291869288 0.4917095489335082 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12921348298155588 0.8478472077130014 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -2 -3)
"cameras/drone/drone0" SET Transform localScale (0.6319887413130156 0.6319887413130156 0.6319887413130156)
"cameras/drone/drone1" SET Transform localEulerAngles (15 13 17)
"cameras/drone/drone1" SET Transform localScale (1.263624818695353 1.263624818695353 1.263624818695353)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.091798360792229 0)
"cameras" SET Transform eulerAngles (-16.146873295512876 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2796274914619628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6558265335057372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2935927308333909
"cameras/drone/drone0" SET Transform localPosition (0.38321486286327877 0.2131940127980116 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8938580206066578 1.07910980124247 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 0 -6)
"cameras/drone/drone0" SET Transform localScale (1.08861161905763 1.08861161905763 1.08861161905763)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -17 -19)
"cameras/drone/drone1" SET Transform localScale (0.7146871703312059 0.7146871703312059 0.7146871703312059)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9555950481440947 0)
"cameras" SET Transform eulerAngles (-10.653786850790441 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1423904313849862
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8620907179753066
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26679987292070884
"cameras/drone/drone0" SET Transform localPosition (-0.031192666253127665 -0.24842715254615738 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.01141433012923021 1.2191008672368504 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -5 -16)
"cameras/drone/drone0" SET Transform localScale (1.2426977251976854 1.2426977251976854 1.2426977251976854)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -5 -4)
"cameras/drone/drone1" SET Transform localScale (1.2709421886563044 1.2709421886563044 1.2709421886563044)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.52491596851871 0)
"cameras" SET Transform eulerAngles (5.285037692378459 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8434290957311885
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.380248371120266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24152958509396358
"cameras/drone/drone0" SET Transform localPosition (0.5449492132672116 0.28348736773501676 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3388329337185083 0.9393051224068737 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 7 11)
"cameras/drone/drone0" SET Transform localScale (0.6659694017051577 0.6659694017051577 0.6659694017051577)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -3 17)
"cameras/drone/drone1" SET Transform localScale (1.4972839055018445 1.4972839055018445 1.4972839055018445)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.558941697451668 0)
"cameras" SET Transform eulerAngles (1.415555428126119 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8923514525219545
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8350869308887914
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.006216370620640799
"cameras/drone/drone0" SET Transform localPosition (0.722335662632879 0.6805880841448613 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.531999323463546 1.2900107900011175 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -18 -19)
"cameras/drone/drone0" SET Transform localScale (0.9822347692059092 0.9822347692059092 0.9822347692059092)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -14 19)
"cameras/drone/drone1" SET Transform localScale (1.2696769677753532 1.2696769677753532 1.2696769677753532)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.641430125652429 0)
"cameras" SET Transform eulerAngles (10.16024920748621 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5636102422876106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0259765368262446
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23678745664278755
"cameras/drone/drone0" SET Transform localPosition (1.0449659022307534 0.3250539952568086 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.000359247156758 1.0384705240326424 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -19 -16)
"cameras/drone/drone0" SET Transform localScale (0.751602511083076 0.751602511083076 0.751602511083076)
"cameras/drone/drone1" SET Transform localEulerAngles (4 9 2)
"cameras/drone/drone1" SET Transform localScale (1.1225359570987705 1.1225359570987705 1.1225359570987705)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.248442300794693 0)
"cameras" SET Transform eulerAngles (-6.187944110898794 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.031957282085033
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2236493865181406
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08463456652594284
"cameras/drone/drone0" SET Transform localPosition (-0.1356422775941084 -0.015545768474792776 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09773957386630405 0.9779234395161553 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -16 11)
"cameras/drone/drone0" SET Transform localScale (1.2286961706607018 1.2286961706607018 1.2286961706607018)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 7 20)
"cameras/drone/drone1" SET Transform localScale (0.7899263507358039 0.7899263507358039 0.7899263507358039)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.674978938617018 0)
"cameras" SET Transform eulerAngles (7.815225530791153 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3437256642226725
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3078851513155816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3750914225964768
"cameras/drone/drone0" SET Transform localPosition (-0.1867386678022327 0.08665795185743624 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6788771553811079 0.8334111538646921 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 8 -11)
"cameras/drone/drone0" SET Transform localScale (0.687020732359237 0.687020732359237 0.687020732359237)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -19 20)
"cameras/drone/drone1" SET Transform localScale (0.9291873128076249 0.9291873128076249 0.9291873128076249)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.434031877256304 0)
"cameras" SET Transform eulerAngles (-18.443038291565035 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4840878896693974
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1928084645187693
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0034479393036609186
"cameras/drone/drone0" SET Transform localPosition (-0.5548640611508916 0.10425344476298598 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8627030301782667 0.8913129046171058 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -16 -1)
"cameras/drone/drone0" SET Transform localScale (1.1897548707856662 1.1897548707856662 1.1897548707856662)
"cameras/drone/drone1" SET Transform localEulerAngles (0 13 6)
"cameras/drone/drone1" SET Transform localScale (1.1572344881764849 1.1572344881764849 1.1572344881764849)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.921097238638856 0)
"cameras" SET Transform eulerAngles (7.122777463411488 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.085596212156677
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7378450525760978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24389357952423465
"cameras/drone/drone0" SET Transform localPosition (0.14159833969251645 -0.2975993728779271 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0081620820305892 1.0720255103508256 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -12 7)
"cameras/drone/drone0" SET Transform localScale (1.3401824691242643 1.3401824691242643 1.3401824691242643)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -20 -20)
"cameras/drone/drone1" SET Transform localScale (1.2707572035896664 1.2707572035896664 1.2707572035896664)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8374833138415863 0)
"cameras" SET Transform eulerAngles (1.2080973323048916 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3210466882532863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4258762566506724
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18545417824819072
"cameras/drone/drone0" SET Transform localPosition (-0.502220258455348 -0.12342804179330952 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.29120368372707606 1.0597879619933783 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -1 -10)
"cameras/drone/drone0" SET Transform localScale (0.9170756164344226 0.9170756164344226 0.9170756164344226)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -3 -15)
"cameras/drone/drone1" SET Transform localScale (1.289140297104721 1.289140297104721 1.289140297104721)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.581421585119654 0)
"cameras" SET Transform eulerAngles (-3.3105630588549353 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4361586685556245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.904126059178529
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08698173413143505
"cameras/drone/drone0" SET Transform localPosition (-0.15145765822079293 0.2635000745642621 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7771612928800791 1.0416238645820461 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 1 20)
"cameras/drone/drone0" SET Transform localScale (1.1088980678175826 1.1088980678175826 1.1088980678175826)
"cameras/drone/drone1" SET Transform localEulerAngles (7 2 15)
"cameras/drone/drone1" SET Transform localScale (1.139206386268911 1.139206386268911 1.139206386268911)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3522270970063985 0)
"cameras" SET Transform eulerAngles (18.314484210884643 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8435232454750461
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.633867392112939
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07394011068740532
"cameras/drone/drone0" SET Transform localPosition (-0.5621051468135644 0.03459971611927609 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5708076014748956 0.957052472201471 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 5 20)
"cameras/drone/drone0" SET Transform localScale (0.8702709233751892 0.8702709233751892 0.8702709233751892)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -17 -20)
"cameras/drone/drone1" SET Transform localScale (0.9600887366489634 0.9600887366489634 0.9600887366489634)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.173178697951152 0)
"cameras" SET Transform eulerAngles (19.15902784818372 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7016670658433053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.063572824927595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22057068148783887
"cameras/drone/drone0" SET Transform localPosition (0.8963256801273485 0.37963014347362983 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9379388741034711 1.2329633314354522 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -3 -17)
"cameras/drone/drone0" SET Transform localScale (0.9726679219781709 0.9726679219781709 0.9726679219781709)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -4 -8)
"cameras/drone/drone1" SET Transform localScale (0.8393759790627436 0.8393759790627436 0.8393759790627436)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2250284133319065 0)
"cameras" SET Transform eulerAngles (-8.876066925501242 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9685978871023987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9540509944391091
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28403019180716493
"cameras/drone/drone0" SET Transform localPosition (1.0920375185589346 0.5652185076555143 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03077907871366392 1.264778236180937 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 4 0)
"cameras/drone/drone0" SET Transform localScale (1.409204129665783 1.409204129665783 1.409204129665783)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -12 -10)
"cameras/drone/drone1" SET Transform localScale (0.7071913161343873 0.7071913161343873 0.7071913161343873)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2313250701694027 0)
"cameras" SET Transform eulerAngles (12.652398734664729 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8217653507146824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.686957111206261
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33302949598404186
"cameras/drone/drone0" SET Transform localPosition (-0.3520749787330997 -0.15389883245868424 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12011979182525145 0.9150741764069134 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 18 -7)
"cameras/drone/drone0" SET Transform localScale (0.6597910890776589 0.6597910890776589 0.6597910890776589)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -9 -19)
"cameras/drone/drone1" SET Transform localScale (0.7877037514266697 0.7877037514266697 0.7877037514266697)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.926025827136411 0)
"cameras" SET Transform eulerAngles (12.738727400780895 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0658866000607157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4465038697250785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12812006223870887
"cameras/drone/drone0" SET Transform localPosition (1.007452928992752 0.24416788817783114 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8177531994014815 1.104458572720807 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -4 15)
"cameras/drone/drone0" SET Transform localScale (0.743863681553981 0.743863681553981 0.743863681553981)
"cameras/drone/drone1" SET Transform localEulerAngles (8 19 8)
"cameras/drone/drone1" SET Transform localScale (1.0937506682533915 1.0937506682533915 1.0937506682533915)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9027179329015222 0)
"cameras" SET Transform eulerAngles (-7.583706982827895 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5871087492448471
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.078980764840274
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39021186040035105
"cameras/drone/drone0" SET Transform localPosition (-0.3554508513918848 0.1979665650551135 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3232422535736921 1.2144776263374486 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 2 -4)
"cameras/drone/drone0" SET Transform localScale (0.638174861906947 0.638174861906947 0.638174861906947)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 14 -4)
"cameras/drone/drone1" SET Transform localScale (1.2298651887284913 1.2298651887284913 1.2298651887284913)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.548496907286317 0)
"cameras" SET Transform eulerAngles (-17.145591439304493 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48526156937539283
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.633600797328348
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24692947758061023
"cameras/drone/drone0" SET Transform localPosition (0.6378353691993461 0.6203051235132824 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1306346817987074 1.2877430429743217 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 9 19)
"cameras/drone/drone0" SET Transform localScale (1.0237994768125172 1.0237994768125172 1.0237994768125172)
"cameras/drone/drone1" SET Transform localEulerAngles (20 5 13)
"cameras/drone/drone1" SET Transform localScale (0.7327614260519112 0.7327614260519112 0.7327614260519112)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.27500985631317 0)
"cameras" SET Transform eulerAngles (17.434737233811802 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8929886227380184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7040101494390694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28071288175667236
"cameras/drone/drone0" SET Transform localPosition (0.2693676260199145 0.14742661612114755 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3133130152307747 1.1268390825497376 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 3 -16)
"cameras/drone/drone0" SET Transform localScale (1.4622772063940381 1.4622772063940381 1.4622772063940381)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 5 -5)
"cameras/drone/drone1" SET Transform localScale (1.0962190531706362 1.0962190531706362 1.0962190531706362)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.724840358455055 0)
"cameras" SET Transform eulerAngles (-13.414913887844602 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2303061118279084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0295478220439684
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19136877542203767
"cameras/drone/drone0" SET Transform localPosition (-0.3132251520800714 0.5290839661498459 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0040518945724253 1.144232467712177 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 7 20)
"cameras/drone/drone0" SET Transform localScale (1.3517562150503473 1.3517562150503473 1.3517562150503473)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 0 -3)
"cameras/drone/drone1" SET Transform localScale (1.029603803540198 1.029603803540198 1.029603803540198)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2141427732864267 0)
"cameras" SET Transform eulerAngles (-11.098497294356854 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.134375938280169
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.631397723048034
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.279537492580212
"cameras/drone/drone0" SET Transform localPosition (-1.0984087235615672 0.05081399903245526 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7074558495081282 1.2767749973655933 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -13 -11)
"cameras/drone/drone0" SET Transform localScale (1.080501949650684 1.080501949650684 1.080501949650684)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -9 2)
"cameras/drone/drone1" SET Transform localScale (1.0974158121900952 1.0974158121900952 1.0974158121900952)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.488290296265479 0)
"cameras" SET Transform eulerAngles (-12.618302080188597 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6886863980526575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1710585504089994
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22038464732018692
"cameras/drone/drone0" SET Transform localPosition (0.9938747622738815 -0.2654664973782623 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.29520023821880903 1.1087043488408832 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 9 8)
"cameras/drone/drone0" SET Transform localScale (1.4937681216068293 1.4937681216068293 1.4937681216068293)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -10 17)
"cameras/drone/drone1" SET Transform localScale (0.9061509423201908 0.9061509423201908 0.9061509423201908)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0996388504877324 0)
"cameras" SET Transform eulerAngles (-19.71917363566455 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7721768618579381
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3369034692605846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2869733001088574
"cameras/drone/drone0" SET Transform localPosition (0.8075340993710871 0.3737478308656061 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9918024433743631 1.0684876850456289 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -5 13)
"cameras/drone/drone0" SET Transform localScale (0.9423015331249358 0.9423015331249358 0.9423015331249358)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -1 -2)
"cameras/drone/drone1" SET Transform localScale (1.4416877978434748 1.4416877978434748 1.4416877978434748)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.474694492308742 0)
"cameras" SET Transform eulerAngles (5.577243615648911 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.899345153018781
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9591178388653465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15458768088486613
"cameras/drone/drone0" SET Transform localPosition (0.18215915278285522 0.3576452091569389 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0508101548351447 1.0318776166504264 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 18 -16)
"cameras/drone/drone0" SET Transform localScale (0.9424633780609815 0.9424633780609815 0.9424633780609815)
"cameras/drone/drone1" SET Transform localEulerAngles (16 11 4)
"cameras/drone/drone1" SET Transform localScale (1.470319779057824 1.470319779057824 1.470319779057824)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8756851799622387 0)
"cameras" SET Transform eulerAngles (-11.588716739928175 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7530987045655545
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.993264292630296
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3685911459743875
"cameras/drone/drone0" SET Transform localPosition (-1.0334076911052288 0.4212418180196283 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8820582188221947 0.9628426284245131 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 10 -16)
"cameras/drone/drone0" SET Transform localScale (0.6327463046582394 0.6327463046582394 0.6327463046582394)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 19 16)
"cameras/drone/drone1" SET Transform localScale (1.467936514795583 1.467936514795583 1.467936514795583)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.023695100308641 0)
"cameras" SET Transform eulerAngles (-19.273950606424325 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3229134528055022
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9381022451160397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27706081597030235
"cameras/drone/drone0" SET Transform localPosition (0.9511584926098016 0.211549682679065 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1001929960357282 0.9584583358187249 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -12 12)
"cameras/drone/drone0" SET Transform localScale (0.6377649179149611 0.6377649179149611 0.6377649179149611)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 11 2)
"cameras/drone/drone1" SET Transform localScale (0.8931940012180501 0.8931940012180501 0.8931940012180501)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.119982290128453 0)
"cameras" SET Transform eulerAngles (-7.61863994252645 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6556845490415939
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9895367377996322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33846032821472233
"cameras/drone/drone0" SET Transform localPosition (0.012520926846734781 0.1659035959375405 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6542899853507065 1.0555945446034252 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -5 -2)
"cameras/drone/drone0" SET Transform localScale (0.6610994627163251 0.6610994627163251 0.6610994627163251)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 6 20)
"cameras/drone/drone1" SET Transform localScale (1.2523424343004064 1.2523424343004064 1.2523424343004064)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.411567511222049 0)
"cameras" SET Transform eulerAngles (-12.700787385580409 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5660927469106518
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4010441731379053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09159363738696613
"cameras/drone/drone0" SET Transform localPosition (1.171277664335147 0.2811072858693307 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6644546402596321 0.9738795343505663 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 17 18)
"cameras/drone/drone0" SET Transform localScale (0.8698121699725254 0.8698121699725254 0.8698121699725254)
"cameras/drone/drone1" SET Transform localEulerAngles (5 16 -14)
"cameras/drone/drone1" SET Transform localScale (0.8924864365323286 0.8924864365323286 0.8924864365323286)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6685586569110353 0)
"cameras" SET Transform eulerAngles (-3.7589827263319293 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6698889256520546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.579197357974934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13210014182930588
"cameras/drone/drone0" SET Transform localPosition (-0.119020514628573 0.1956044299618674 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.100766460648787 1.1061793143640297 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 17 8)
"cameras/drone/drone0" SET Transform localScale (0.7554965451907508 0.7554965451907508 0.7554965451907508)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 17 11)
"cameras/drone/drone1" SET Transform localScale (1.1870151810124183 1.1870151810124183 1.1870151810124183)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5731523420653053 0)
"cameras" SET Transform eulerAngles (8.751485525517634 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6605290560295065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.810922584943576
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.061532884427735635
"cameras/drone/drone0" SET Transform localPosition (-0.7602902352007098 0.4195160603032558 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09830558594288186 0.9056719200035216 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -10 9)
"cameras/drone/drone0" SET Transform localScale (1.3917901384127753 1.3917901384127753 1.3917901384127753)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -13 -3)
"cameras/drone/drone1" SET Transform localScale (0.7035872287242434 0.7035872287242434 0.7035872287242434)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.930302437257577 0)
"cameras" SET Transform eulerAngles (-13.417581864548712 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.312098508181362
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6509201845828494
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21602792470974608
"cameras/drone/drone0" SET Transform localPosition (0.6170106099708195 0.6313684854364625 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4939862791153007 1.0880874877597222 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 18 2)
"cameras/drone/drone0" SET Transform localScale (0.7879031902308915 0.7879031902308915 0.7879031902308915)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -20 8)
"cameras/drone/drone1" SET Transform localScale (1.2424791611836503 1.2424791611836503 1.2424791611836503)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.76612217769082 0)
"cameras" SET Transform eulerAngles (-5.6807453656647375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9102574708398643
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9967390663055623
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27085004739115653
"cameras/drone/drone0" SET Transform localPosition (-0.6601978408711883 0.10021750090734621 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4241059572970578 1.2621573387263596 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 9 2)
"cameras/drone/drone0" SET Transform localScale (1.403245529427556 1.403245529427556 1.403245529427556)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -4 -8)
"cameras/drone/drone1" SET Transform localScale (0.8115479155178187 0.8115479155178187 0.8115479155178187)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1954559012848005 0)
"cameras" SET Transform eulerAngles (19.199100090551333 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7100669577046961
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.839394821694869
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33430097185107055
"cameras/drone/drone0" SET Transform localPosition (-0.9010426361610379 -0.05866425383265067 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.87059789447967 1.2575024989099026 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 6 3)
"cameras/drone/drone0" SET Transform localScale (1.1315891116790082 1.1315891116790082 1.1315891116790082)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 12 19)
"cameras/drone/drone1" SET Transform localScale (1.0127126338806234 1.0127126338806234 1.0127126338806234)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.368802376791773 0)
"cameras" SET Transform eulerAngles (1.7977430828397019 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4147920866020978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3769983318764365
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.046134915451616944
"cameras/drone/drone0" SET Transform localPosition (-0.580729652175336 0.15085043537767534 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6566820112402241 0.8500729914693568 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -15 -13)
"cameras/drone/drone0" SET Transform localScale (0.9108361459227985 0.9108361459227985 0.9108361459227985)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 16 10)
"cameras/drone/drone1" SET Transform localScale (0.9010709463425226 0.9010709463425226 0.9010709463425226)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7488035702852756 0)
"cameras" SET Transform eulerAngles (9.051332140456708 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9527320279659738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3813504182370737
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37970130345703085
"cameras/drone/drone0" SET Transform localPosition (-0.931337039964496 -0.17139180623595435 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1661539076917498 1.2105338387497167 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 4 -5)
"cameras/drone/drone0" SET Transform localScale (0.8435040762336048 0.8435040762336048 0.8435040762336048)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 17 9)
"cameras/drone/drone1" SET Transform localScale (1.099791041880753 1.099791041880753 1.099791041880753)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8554120004769428 0)
"cameras" SET Transform eulerAngles (-5.346047299846642 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9850126240010054
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1160124460530727
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30254593426626025
"cameras/drone/drone0" SET Transform localPosition (1.0088429186472518 0.4655608809087594 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1550496915698287 1.2583099521922207 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 12 -12)
"cameras/drone/drone0" SET Transform localScale (1.3314329858823908 1.3314329858823908 1.3314329858823908)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -3 -19)
"cameras/drone/drone1" SET Transform localScale (1.0529477999136168 1.0529477999136168 1.0529477999136168)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5625198942196517 0)
"cameras" SET Transform eulerAngles (-3.5186222926327346 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5310978190758406
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4598309674751173
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21310129364342628
"cameras/drone/drone0" SET Transform localPosition (0.6909491224940518 -0.2709657893439827 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.06251985491641854 1.1025232837133023 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -18 -5)
"cameras/drone/drone0" SET Transform localScale (0.802245799091865 0.802245799091865 0.802245799091865)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 1 -20)
"cameras/drone/drone1" SET Transform localScale (1.3349261500127534 1.3349261500127534 1.3349261500127534)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.82381925628317 0)
"cameras" SET Transform eulerAngles (3.014721596014226 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8387458494152067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6611742485362402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03927452709323412
"cameras/drone/drone0" SET Transform localPosition (-0.03490271636835951 0.07383397814504916 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6199743738001422 1.1769889343880335 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 14 -16)
"cameras/drone/drone0" SET Transform localScale (0.6723391166558108 0.6723391166558108 0.6723391166558108)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -10 -20)
"cameras/drone/drone1" SET Transform localScale (0.6907425483952425 0.6907425483952425 0.6907425483952425)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1436013398167137 0)
"cameras" SET Transform eulerAngles (10.59133984922736 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.436828176193238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1700068949392934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3004094089781817
"cameras/drone/drone0" SET Transform localPosition (0.37677877447942554 0.06997225345852814 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8134116860906442 1.0978997911115058 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -5 17)
"cameras/drone/drone0" SET Transform localScale (1.3398664996395264 1.3398664996395264 1.3398664996395264)
"cameras/drone/drone1" SET Transform localEulerAngles (15 4 -11)
"cameras/drone/drone1" SET Transform localScale (1.0508490721419252 1.0508490721419252 1.0508490721419252)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.649806408572246 0)
"cameras" SET Transform eulerAngles (-4.8032325616871585 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0897472522877192
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6222615983810598
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38790074493176707
"cameras/drone/drone0" SET Transform localPosition (-1.1763860686285303 0.29341221145551016 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6122114899099913 1.0415244656839628 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 2 17)
"cameras/drone/drone0" SET Transform localScale (1.112496873215429 1.112496873215429 1.112496873215429)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -4 -18)
"cameras/drone/drone1" SET Transform localScale (1.1872830709965716 1.1872830709965716 1.1872830709965716)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9636852908294307 0)
"cameras" SET Transform eulerAngles (-9.733027890691805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44495428363723594
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2606502354873155
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3283837574448177
"cameras/drone/drone0" SET Transform localPosition (0.5498977600009738 0.0921072808895727 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05223186686178716 1.0455110707863458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -1 -12)
"cameras/drone/drone0" SET Transform localScale (1.2025536640659724 1.2025536640659724 1.2025536640659724)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -11 17)
"cameras/drone/drone1" SET Transform localScale (1.2630452700044676 1.2630452700044676 1.2630452700044676)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.365916342940349 0)
"cameras" SET Transform eulerAngles (-15.750062451532942 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2228965388171773
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1648548750425154
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10488767192298912
"cameras/drone/drone0" SET Transform localPosition (0.5473745182443563 0.30169589791269885 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.022258295051108323 1.0482696073060416 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 13 -17)
"cameras/drone/drone0" SET Transform localScale (0.9102586318130339 0.9102586318130339 0.9102586318130339)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -5 1)
"cameras/drone/drone1" SET Transform localScale (1.0943440226106687 1.0943440226106687 1.0943440226106687)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2940249263693713 0)
"cameras" SET Transform eulerAngles (6.201388736324766 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0620529531393261
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.758022343783782
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2705231557633169
"cameras/drone/drone0" SET Transform localPosition (-0.13889928504796734 -0.2409634341149524 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.994282337471203 1.1122153541682627 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -3 15)
"cameras/drone/drone0" SET Transform localScale (1.2774713285379553 1.2774713285379553 1.2774713285379553)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -19 -18)
"cameras/drone/drone1" SET Transform localScale (0.7218188512782232 0.7218188512782232 0.7218188512782232)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.846110914949488 0)
"cameras" SET Transform eulerAngles (-14.491351876658968 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.291227347131373
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9325539125975485
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33959864680802687
"cameras/drone/drone0" SET Transform localPosition (0.41649117481884756 0.07355810238547261 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7082740751483196 1.200262579606735 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 18 7)
"cameras/drone/drone0" SET Transform localScale (0.6806113491676395 0.6806113491676395 0.6806113491676395)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -9 -3)
"cameras/drone/drone1" SET Transform localScale (1.2800828777787148 1.2800828777787148 1.2800828777787148)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.38030669115476 0)
"cameras" SET Transform eulerAngles (-16.40446253791465 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4623817879516388
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.299425855244887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10155864643066642
"cameras/drone/drone0" SET Transform localPosition (0.5092924539381716 0.3181965453813042 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0968532168836045 1.1572120443069207 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 8 -18)
"cameras/drone/drone0" SET Transform localScale (0.8018056929073676 0.8018056929073676 0.8018056929073676)
"cameras/drone/drone1" SET Transform localEulerAngles (19 1 14)
"cameras/drone/drone1" SET Transform localScale (1.2330594522802847 1.2330594522802847 1.2330594522802847)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6096117152286356 0)
"cameras" SET Transform eulerAngles (-14.120740014746218 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9247124928966549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2252467921265549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21602611266168956
"cameras/drone/drone0" SET Transform localPosition (0.6106038850888531 -0.21105860128883241 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.606794759537194 1.0819772835704304 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 13 13)
"cameras/drone/drone0" SET Transform localScale (0.9301338285869407 0.9301338285869407 0.9301338285869407)
"cameras/drone/drone1" SET Transform localEulerAngles (16 0 8)
"cameras/drone/drone1" SET Transform localScale (0.7449306100095789 0.7449306100095789 0.7449306100095789)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.468832074794784 0)
"cameras" SET Transform eulerAngles (-9.406264232626178 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1104496355763673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9888628017808128
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.00422916133591511
"cameras/drone/drone0" SET Transform localPosition (-0.03687176465420006 -0.05816762015331284 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11319992698458337 1.0665896127467198 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -13 -14)
"cameras/drone/drone0" SET Transform localScale (1.3235635458924204 1.3235635458924204 1.3235635458924204)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -6 1)
"cameras/drone/drone1" SET Transform localScale (1.2602920555448789 1.2602920555448789 1.2602920555448789)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9224450002080395 0)
"cameras" SET Transform eulerAngles (18.901943624022607 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2289426905867364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1870610918708653
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29535131493737815
"cameras/drone/drone0" SET Transform localPosition (-0.7468583580613266 0.15326036075829758 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8321467125870549 1.1684392838665343 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 17 10)
"cameras/drone/drone0" SET Transform localScale (0.9763373398250565 0.9763373398250565 0.9763373398250565)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -16 10)
"cameras/drone/drone1" SET Transform localScale (0.6615493809175567 0.6615493809175567 0.6615493809175567)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2174630456220683 0)
"cameras" SET Transform eulerAngles (-19.4596994530565 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3744822488883441
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.991477005264172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14723824971721391
"cameras/drone/drone0" SET Transform localPosition (-0.18049209230569163 0.4033234009887489 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.04045664115453 1.209048290475489 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -7 -3)
"cameras/drone/drone0" SET Transform localScale (1.2435234230578083 1.2435234230578083 1.2435234230578083)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -11 -5)
"cameras/drone/drone1" SET Transform localScale (0.8202840266644458 0.8202840266644458 0.8202840266644458)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.687099843286618 0)
"cameras" SET Transform eulerAngles (-13.049458439343775 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6260213812523562
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9303415444739915
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36897651665447406
"cameras/drone/drone0" SET Transform localPosition (-1.0931262486996915 0.29537346143547255 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.05354080860642396 0.8953239858156008 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -6 1)
"cameras/drone/drone0" SET Transform localScale (1.0845734708032548 1.0845734708032548 1.0845734708032548)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -10 -13)
"cameras/drone/drone1" SET Transform localScale (1.1684571396905254 1.1684571396905254 1.1684571396905254)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4338004504978508 0)
"cameras" SET Transform eulerAngles (16.45596975819781 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3366637378910728
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.622706568274157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1752856009460973
"cameras/drone/drone0" SET Transform localPosition (-1.1463691828591942 -0.01879659760498459 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28851969492285456 0.8448483144231063 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 18 17)
"cameras/drone/drone0" SET Transform localScale (0.758511042696307 0.758511042696307 0.758511042696307)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -1 -4)
"cameras/drone/drone1" SET Transform localScale (0.6844548294309167 0.6844548294309167 0.6844548294309167)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.50826586921236 0)
"cameras" SET Transform eulerAngles (16.001536514738554 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7310544943871371
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6412686131789127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3088900809602686
"cameras/drone/drone0" SET Transform localPosition (-0.2774099242773602 0.21773249108198783 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1999138432021297 1.150759044882038 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -9 9)
"cameras/drone/drone0" SET Transform localScale (1.3280973809190821 1.3280973809190821 1.3280973809190821)
"cameras/drone/drone1" SET Transform localEulerAngles (16 0 8)
"cameras/drone/drone1" SET Transform localScale (1.0297018438324543 1.0297018438324543 1.0297018438324543)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5976252896621985 0)
"cameras" SET Transform eulerAngles (-1.2247033785321548 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4224174640970904
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4739593721910809
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13167337984775182
"cameras/drone/drone0" SET Transform localPosition (0.09892203305414315 0.381293633092151 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0208859236301595 0.9062568189123631 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -1 8)
"cameras/drone/drone0" SET Transform localScale (1.1311103107901013 1.1311103107901013 1.1311103107901013)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -18 4)
"cameras/drone/drone1" SET Transform localScale (0.6276241975781653 0.6276241975781653 0.6276241975781653)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1330954410023857 0)
"cameras" SET Transform eulerAngles (19.772121452381562 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2903217571702816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.383267758284046
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29127937418838334
"cameras/drone/drone0" SET Transform localPosition (-0.11046797738749503 0.15729997119675782 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.16773928648578162 1.0237016126820435 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 8 -7)
"cameras/drone/drone0" SET Transform localScale (1.314870606757442 1.314870606757442 1.314870606757442)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -5 3)
"cameras/drone/drone1" SET Transform localScale (1.4040065062306333 1.4040065062306333 1.4040065062306333)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.754782461528043 0)
"cameras" SET Transform eulerAngles (-1.6485620039464948 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4988723377645309
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8426859968647595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14167197871043508
"cameras/drone/drone0" SET Transform localPosition (0.10264835381870174 0.10536365548250953 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2411244324790921 1.1188789092171507 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -2 -11)
"cameras/drone/drone0" SET Transform localScale (0.6016230978691953 0.6016230978691953 0.6016230978691953)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -3 -20)
"cameras/drone/drone1" SET Transform localScale (1.054232787948256 1.054232787948256 1.054232787948256)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.758334952909779 0)
"cameras" SET Transform eulerAngles (-4.426786805602916 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0557904778641212
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1623447171079877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23702199062578042
"cameras/drone/drone0" SET Transform localPosition (-0.37820390927647474 0.3866248476436734 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.911946419288823 1.1383530065013228 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 18 -2)
"cameras/drone/drone0" SET Transform localScale (1.4802293753040423 1.4802293753040423 1.4802293753040423)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -15 3)
"cameras/drone/drone1" SET Transform localScale (1.3696243363935818 1.3696243363935818 1.3696243363935818)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.144207248990162 0)
"cameras" SET Transform eulerAngles (-15.555060381196597 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6007433271852785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.310890182817124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39024952613143316
"cameras/drone/drone0" SET Transform localPosition (1.1465355739205034 -0.2356147834201719 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.550442843576536 1.1595688942560576 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -9 7)
"cameras/drone/drone0" SET Transform localScale (0.7495404941555512 0.7495404941555512 0.7495404941555512)
"cameras/drone/drone1" SET Transform localEulerAngles (8 1 -6)
"cameras/drone/drone1" SET Transform localScale (0.7527498624945983 0.7527498624945983 0.7527498624945983)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.629747606921112 0)
"cameras" SET Transform eulerAngles (7.562878822751568 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4329000154484524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.055583048733833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19766263686525887
"cameras/drone/drone0" SET Transform localPosition (0.520575718392088 -0.1723022346853847 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9641342746373696 1.201732442562326 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 19 -6)
"cameras/drone/drone0" SET Transform localScale (1.3469457325186749 1.3469457325186749 1.3469457325186749)
"cameras/drone/drone1" SET Transform localEulerAngles (5 18 -13)
"cameras/drone/drone1" SET Transform localScale (0.6392652490684422 0.6392652490684422 0.6392652490684422)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.269966583724116 0)
"cameras" SET Transform eulerAngles (8.919253270633224 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9891082876649002
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.796001513787397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12262269752179718
"cameras/drone/drone0" SET Transform localPosition (-0.01904488546854477 0.6304117972233907 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1451769672877863 1.2892877317141664 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -18 -7)
"cameras/drone/drone0" SET Transform localScale (1.151833674196535 1.151833674196535 1.151833674196535)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 17 2)
"cameras/drone/drone1" SET Transform localScale (1.4022649755677032 1.4022649755677032 1.4022649755677032)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7280375919866033 0)
"cameras" SET Transform eulerAngles (6.5923064142290535 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1595506028797673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7684770604475553
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2425700933836279
"cameras/drone/drone0" SET Transform localPosition (-1.0557584085414904 0.1399227989062894 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6787872909981975 0.9354102313822404 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 7 -3)
"cameras/drone/drone0" SET Transform localScale (1.1745470321086449 1.1745470321086449 1.1745470321086449)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -1 2)
"cameras/drone/drone1" SET Transform localScale (1.452456007432748 1.452456007432748 1.452456007432748)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3153586239259045 0)
"cameras" SET Transform eulerAngles (-19.7506517377808 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5296115789194782
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3524124070552328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30749100720589845
"cameras/drone/drone0" SET Transform localPosition (-0.6002409294766617 -0.0204304572598894 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5568920396917036 0.8300613878918575 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 8 9)
"cameras/drone/drone0" SET Transform localScale (0.6648490875616788 0.6648490875616788 0.6648490875616788)
"cameras/drone/drone1" SET Transform localEulerAngles (9 0 -16)
"cameras/drone/drone1" SET Transform localScale (0.6590921398229254 0.6590921398229254 0.6590921398229254)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 74
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.6637742115436667 0)
"cameras" SET Transform eulerAngles (18.38433023994486 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1057617038408254
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2903600790342953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3252492729454035
"cameras/drone/drone0" SET Transform localPosition (-0.8951804186647845 0.13737960497508112 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0124387103881274 0.9843748741926637 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 2 -2)
"cameras/drone/drone0" SET Transform localScale (1.005957052311575 1.005957052311575 1.005957052311575)
"cameras/drone/drone1" SET Transform localEulerAngles (4 0 8)
"cameras/drone/drone1" SET Transform localScale (1.0236569001536586 1.0236569001536586 1.0236569001536586)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.621582252004434 0)
"cameras" SET Transform eulerAngles (-5.881829132874676 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5428502275024392
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.420076081275894
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19028957252369377
"cameras/drone/drone0" SET Transform localPosition (0.9275965346731059 -0.1988415721590176 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6655197122850031 1.1319606156536535 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -8 6)
"cameras/drone/drone0" SET Transform localScale (0.8255371082807019 0.8255371082807019 0.8255371082807019)
"cameras/drone/drone1" SET Transform localEulerAngles (3 3 -17)
"cameras/drone/drone1" SET Transform localScale (0.6039512002961555 0.6039512002961555 0.6039512002961555)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8846603387352556 0)
"cameras" SET Transform eulerAngles (-0.062465430165069336 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.056709010633869
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9493181432578527
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13855232491254435
"cameras/drone/drone0" SET Transform localPosition (-0.34101631514174 0.3560326195602837 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8084672188800492 1.0747025578987592 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 4 18)
"cameras/drone/drone0" SET Transform localScale (1.1958655053760943 1.1958655053760943 1.1958655053760943)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 5 -16)
"cameras/drone/drone1" SET Transform localScale (1.359505402848035 1.359505402848035 1.359505402848035)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.75664038674306 0)
"cameras" SET Transform eulerAngles (-17.862136196201472 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2462427621661925
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.900125349301552
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3166249614958213
"cameras/drone/drone0" SET Transform localPosition (-0.10887529286984265 0.022944462186057557 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4040119870994632 0.8885014187782805 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -6 17)
"cameras/drone/drone0" SET Transform localScale (0.6645408688460471 0.6645408688460471 0.6645408688460471)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -4 6)
"cameras/drone/drone1" SET Transform localScale (1.2109260331648106 1.2109260331648106 1.2109260331648106)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7525513188867556 0)
"cameras" SET Transform eulerAngles (10.459395917720762 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3041609146701485
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9533643859228715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25228704453964057
"cameras/drone/drone0" SET Transform localPosition (0.22106987573857384 0.04976402807737573 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6010753982607286 1.272483840481482 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -15 8)
"cameras/drone/drone0" SET Transform localScale (1.2986690948712338 1.2986690948712338 1.2986690948712338)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -1 10)
"cameras/drone/drone1" SET Transform localScale (1.3108265094981817 1.3108265094981817 1.3108265094981817)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.571863790034903 0)
"cameras" SET Transform eulerAngles (2.829644457953048 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1559407617537891
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9893268839781628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.029956455291733432
"cameras/drone/drone0" SET Transform localPosition (0.47284469187837685 -0.05670769111266033 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.980868171130189 0.9699827564715311 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 17 -16)
"cameras/drone/drone0" SET Transform localScale (0.7783897188980555 0.7783897188980555 0.7783897188980555)
"cameras/drone/drone1" SET Transform localEulerAngles (6 17 1)
"cameras/drone/drone1" SET Transform localScale (0.7023983524270004 0.7023983524270004 0.7023983524270004)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9538887674243934 0)
"cameras" SET Transform eulerAngles (-14.69641291975741 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7520843685537126
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4599998678721124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16441047666063222
"cameras/drone/drone0" SET Transform localPosition (-0.6211898918870521 0.677504579985095 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24622030170559772 0.9355274053379379 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -7 -12)
"cameras/drone/drone0" SET Transform localScale (1.1081053051131966 1.1081053051131966 1.1081053051131966)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -16 13)
"cameras/drone/drone1" SET Transform localScale (1.3064258259234398 1.3064258259234398 1.3064258259234398)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6759863881289654 0)
"cameras" SET Transform eulerAngles (-0.26569017243550874 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3697363165672805
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.169820857508584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13258703220453857
"cameras/drone/drone0" SET Transform localPosition (0.7914984405631036 0.46158591381183806 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3620434931789501 0.8654529527461884 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -12 10)
"cameras/drone/drone0" SET Transform localScale (0.9413512615849176 0.9413512615849176 0.9413512615849176)
"cameras/drone/drone1" SET Transform localEulerAngles (13 13 -11)
"cameras/drone/drone1" SET Transform localScale (1.1334227054354569 1.1334227054354569 1.1334227054354569)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.808032240059768 0)
"cameras" SET Transform eulerAngles (11.227701718269778 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1292592202541591
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2804975178228952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18620326921312375
"cameras/drone/drone0" SET Transform localPosition (-0.21407857611304348 0.3497707397704279 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5192094242988595 0.9925052198955775 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 12 -17)
"cameras/drone/drone0" SET Transform localScale (1.3526261908229769 1.3526261908229769 1.3526261908229769)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -19 -15)
"cameras/drone/drone1" SET Transform localScale (0.9042404218734732 0.9042404218734732 0.9042404218734732)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7477802576417325 0)
"cameras" SET Transform eulerAngles (2.923489276498195 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.477229586875053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1388767309819525
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2962487475423021
"cameras/drone/drone0" SET Transform localPosition (-0.17945366646664707 -0.10259408963639022 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.33004359613784784 1.1571126628633597 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -13 5)
"cameras/drone/drone0" SET Transform localScale (1.1573152086042326 1.1573152086042326 1.1573152086042326)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 10 4)
"cameras/drone/drone1" SET Transform localScale (0.6395735867228196 0.6395735867228196 0.6395735867228196)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.85395599956118 0)
"cameras" SET Transform eulerAngles (17.932261367677512 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0827291557192145
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9169383321675912
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35305719923061085
"cameras/drone/drone0" SET Transform localPosition (-0.39741726014745626 0.5480366941581891 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6557399593495139 1.1523585728876076 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 7 -10)
"cameras/drone/drone0" SET Transform localScale (1.1905775443827937 1.1905775443827937 1.1905775443827937)
"cameras/drone/drone1" SET Transform localEulerAngles (2 1 10)
"cameras/drone/drone1" SET Transform localScale (1.4191085433246977 1.4191085433246977 1.4191085433246977)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.797133322179237 0)
"cameras" SET Transform eulerAngles (-18.85344110989552 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.265579565054638
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6437273852426286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2374310099505586
"cameras/drone/drone0" SET Transform localPosition (-0.42471023594351387 0.3476363405305691 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3837851531633302 1.0371910743708943 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 16 16)
"cameras/drone/drone0" SET Transform localScale (0.6054303066614994 0.6054303066614994 0.6054303066614994)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 15 -13)
"cameras/drone/drone1" SET Transform localScale (0.6935394230138806 0.6935394230138806 0.6935394230138806)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.456586526692459 0)
"cameras" SET Transform eulerAngles (3.484765308508706 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2273714176146875
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9525782337380746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31963866134444757
"cameras/drone/drone0" SET Transform localPosition (-0.3934116748218539 0.24763824806644447 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1694992393996142 0.9506282309290872 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 7 -12)
"cameras/drone/drone0" SET Transform localScale (0.733931900994856 0.733931900994856 0.733931900994856)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 15 -14)
"cameras/drone/drone1" SET Transform localScale (0.7020620976030326 0.7020620976030326 0.7020620976030326)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3452241527162974 0)
"cameras" SET Transform eulerAngles (-1.6669517620509247 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8107090883666923
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2738608799455575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2708217212127703
"cameras/drone/drone0" SET Transform localPosition (1.1780461821128652 -0.28705842221345884 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9650176651625881 0.8392869113035663 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 10 -16)
"cameras/drone/drone0" SET Transform localScale (1.2291563411723647 1.2291563411723647 1.2291563411723647)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -7 2)
"cameras/drone/drone1" SET Transform localScale (0.6329343288059992 0.6329343288059992 0.6329343288059992)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.695615728590976 0)
"cameras" SET Transform eulerAngles (-19.66328223420968 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2913748307267938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7292373238910552
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18217941186336495
"cameras/drone/drone0" SET Transform localPosition (-0.2773906225018189 0.64316902707155 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.506319687480715 1.1440732844479697 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -4 -3)
"cameras/drone/drone0" SET Transform localScale (1.3291242604365947 1.3291242604365947 1.3291242604365947)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 15 -13)
"cameras/drone/drone1" SET Transform localScale (1.3589330060115432 1.3589330060115432 1.3589330060115432)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0605784433228997 0)
"cameras" SET Transform eulerAngles (9.901421488159002 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5813497020608105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4223187912589248
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3738157252828585
"cameras/drone/drone0" SET Transform localPosition (0.8087293292606221 0.647547216569107 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.045349246011808 1.245647800478004 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -14 -19)
"cameras/drone/drone0" SET Transform localScale (0.6163365179092568 0.6163365179092568 0.6163365179092568)
"cameras/drone/drone1" SET Transform localEulerAngles (18 8 12)
"cameras/drone/drone1" SET Transform localScale (1.4566413061119134 1.4566413061119134 1.4566413061119134)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.448247348471931 0)
"cameras" SET Transform eulerAngles (-4.986248365474619 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8304616969950538
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6441532504821132
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25532891931839413
"cameras/drone/drone0" SET Transform localPosition (0.0010762296372328617 -0.26944890681146466 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8894437053849042 0.8299884316423113 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 8 1)
"cameras/drone/drone0" SET Transform localScale (1.4678815493998543 1.4678815493998543 1.4678815493998543)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 20 6)
"cameras/drone/drone1" SET Transform localScale (1.0680660277678 1.0680660277678 1.0680660277678)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.753192023043347 0)
"cameras" SET Transform eulerAngles (4.427472348417282 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.555363040838353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5050683071567397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3854905699921909
"cameras/drone/drone0" SET Transform localPosition (-0.6703153143770141 0.19744296337366546 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8658208082271206 1.0149196599904373 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -19 -5)
"cameras/drone/drone0" SET Transform localScale (1.1197890165975046 1.1197890165975046 1.1197890165975046)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -4 -14)
"cameras/drone/drone1" SET Transform localScale (0.7287810668108947 0.7287810668108947 0.7287810668108947)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.759193597867987 0)
"cameras" SET Transform eulerAngles (10.013887811426528 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1436942364243978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0288161458269585
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29443205763968816
"cameras/drone/drone0" SET Transform localPosition (-0.4840155319026336 -0.1240587630999011 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1506527551323118 1.2147106607982248 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -12 -4)
"cameras/drone/drone0" SET Transform localScale (0.8023185626454352 0.8023185626454352 0.8023185626454352)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -2 -13)
"cameras/drone/drone1" SET Transform localScale (0.973500848986294 0.973500848986294 0.973500848986294)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7132338519395143 0)
"cameras" SET Transform eulerAngles (8.824984588841161 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.479609286824843
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2833358659790994
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30652803994246414
"cameras/drone/drone0" SET Transform localPosition (1.1731561003291906 0.06362614690118934 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3906953071408533 0.8675807471516885 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 16 3)
"cameras/drone/drone0" SET Transform localScale (0.6021262976717903 0.6021262976717903 0.6021262976717903)
"cameras/drone/drone1" SET Transform localEulerAngles (7 11 -5)
"cameras/drone/drone1" SET Transform localScale (0.6082585573075945 0.6082585573075945 0.6082585573075945)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.89824698118158 0)
"cameras" SET Transform eulerAngles (1.1513902247993748 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8489851491317842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.973455390198143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0880338693368401
"cameras/drone/drone0" SET Transform localPosition (0.08494313899195927 -0.06787906888535505 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5903698817408962 1.1309296678865028 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 13 -18)
"cameras/drone/drone0" SET Transform localScale (1.233226684716362 1.233226684716362 1.233226684716362)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 19 -9)
"cameras/drone/drone1" SET Transform localScale (1.4684253741716036 1.4684253741716036 1.4684253741716036)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.197034384754215 0)
"cameras" SET Transform eulerAngles (-1.06073109466168 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.480525933209464
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9469498498487998
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20362132174253805
"cameras/drone/drone0" SET Transform localPosition (0.6009045739547816 0.24324861519759094 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5555843560933102 0.810134670702263 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -8 -13)
"cameras/drone/drone0" SET Transform localScale (1.0068014226789634 1.0068014226789634 1.0068014226789634)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -17 -20)
"cameras/drone/drone1" SET Transform localScale (1.2452598289211125 1.2452598289211125 1.2452598289211125)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.083636333313082 0)
"cameras" SET Transform eulerAngles (-19.79844404624251 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46801098422182674
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.040697447399887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3140402313047801
"cameras/drone/drone0" SET Transform localPosition (-0.13506121753212463 0.06411450685289893 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7884399152481012 0.8240050588544494 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 15 15)
"cameras/drone/drone0" SET Transform localScale (1.2383400436777126 1.2383400436777126 1.2383400436777126)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 14 8)
"cameras/drone/drone1" SET Transform localScale (1.1767438937542918 1.1767438937542918 1.1767438937542918)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9208492790316054 0)
"cameras" SET Transform eulerAngles (9.098664950456794 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6713266254189778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.327629584018889
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34814785621079797
"cameras/drone/drone0" SET Transform localPosition (-0.4246451942745535 0.3439540240598729 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07241524324059911 1.2828099783005196 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -12 10)
"cameras/drone/drone0" SET Transform localScale (0.7698427590343939 0.7698427590343939 0.7698427590343939)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 12 13)
"cameras/drone/drone1" SET Transform localScale (1.0687642459731155 1.0687642459731155 1.0687642459731155)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.567963491758274 0)
"cameras" SET Transform eulerAngles (6.727234224137916 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2780160026389387
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.293863879626541
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12508433503534477
"cameras/drone/drone0" SET Transform localPosition (0.7878540441650006 0.20725850890897685 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.173339063769306 0.9209332436046735 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 9 -3)
"cameras/drone/drone0" SET Transform localScale (1.3070502926243004 1.3070502926243004 1.3070502926243004)
"cameras/drone/drone1" SET Transform localEulerAngles (4 18 -8)
"cameras/drone/drone1" SET Transform localScale (0.8224297164892731 0.8224297164892731 0.8224297164892731)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0660077328533952 0)
"cameras" SET Transform eulerAngles (-6.5130714661910325 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.459503406267718
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9132749913569151
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2476203490400796
"cameras/drone/drone0" SET Transform localPosition (-1.1955141931694997 0.627871898322538 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.794864299834604 1.0399262591239902 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -6 -14)
"cameras/drone/drone0" SET Transform localScale (1.2510459879385323 1.2510459879385323 1.2510459879385323)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -5 -19)
"cameras/drone/drone1" SET Transform localScale (1.1328799057301624 1.1328799057301624 1.1328799057301624)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.580098979394986 0)
"cameras" SET Transform eulerAngles (0.2833741035830144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5111973645095853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3694876585088553
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2772773557238411
"cameras/drone/drone0" SET Transform localPosition (0.7837246079294273 0.1726969238225035 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6438059883870995 1.201408296908657 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 0 -16)
"cameras/drone/drone0" SET Transform localScale (1.4355298184609269 1.4355298184609269 1.4355298184609269)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 7 15)
"cameras/drone/drone1" SET Transform localScale (1.3964274683564297 1.3964274683564297 1.3964274683564297)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.993765157630376 0)
"cameras" SET Transform eulerAngles (-3.1853109767221888 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5781195680163337
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9932623810329337
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.008579417825302782
"cameras/drone/drone0" SET Transform localPosition (0.5863280614127466 0.32908923552923147 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.45536947173599995 1.180545601502626 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 3 0)
"cameras/drone/drone0" SET Transform localScale (1.054235048367317 1.054235048367317 1.054235048367317)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 5 17)
"cameras/drone/drone1" SET Transform localScale (0.7772854262785062 0.7772854262785062 0.7772854262785062)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.357097550268314 0)
"cameras" SET Transform eulerAngles (-16.097467315822882 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5779269331167134
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7910333654300907
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06510635843476686
"cameras/drone/drone0" SET Transform localPosition (1.1339914843692978 -0.19952007840213665 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.07610262817415103 1.1411017897012021 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 11 -18)
"cameras/drone/drone0" SET Transform localScale (0.9590260627244486 0.9590260627244486 0.9590260627244486)
"cameras/drone/drone1" SET Transform localEulerAngles (19 9 7)
"cameras/drone/drone1" SET Transform localScale (1.020881016118591 1.020881016118591 1.020881016118591)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.814664114523909 0)
"cameras" SET Transform eulerAngles (18.9703748996601 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3006457095558224
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3207793537107597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09688931360381972
"cameras/drone/drone0" SET Transform localPosition (0.05796433461440609 0.20582032451378068 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.888955144789753 0.9833858430782197 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 13 16)
"cameras/drone/drone0" SET Transform localScale (0.9969903931337136 0.9969903931337136 0.9969903931337136)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -5 8)
"cameras/drone/drone1" SET Transform localScale (1.2313993188377679 1.2313993188377679 1.2313993188377679)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.558968229097029 0)
"cameras" SET Transform eulerAngles (3.242036140189338 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.638618491222786
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9318596826089682
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15755637793817662
"cameras/drone/drone0" SET Transform localPosition (-0.20932766925728674 0.5686564707080268 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0155684191509913 1.232203400749655 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -8 0)
"cameras/drone/drone0" SET Transform localScale (1.1467519249871803 1.1467519249871803 1.1467519249871803)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -12 -15)
"cameras/drone/drone1" SET Transform localScale (0.6314812672002602 0.6314812672002602 0.6314812672002602)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.807836503578301 0)
"cameras" SET Transform eulerAngles (-7.615427859801457 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4751618014691732
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4367159749014564
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26328513196877806
"cameras/drone/drone0" SET Transform localPosition (-0.969884116105756 0.42401231339052475 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0275733976760444 1.0672819020789037 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -7 -17)
"cameras/drone/drone0" SET Transform localScale (1.3596494472710385 1.3596494472710385 1.3596494472710385)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -12 3)
"cameras/drone/drone1" SET Transform localScale (0.7644546330182118 0.7644546330182118 0.7644546330182118)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.063586292351125 0)
"cameras" SET Transform eulerAngles (-10.0582050183854 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.615613955209878
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.091859787363224
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21370740877960379
"cameras/drone/drone0" SET Transform localPosition (-1.017400328959777 0.3836395574094726 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.32214046788381545 1.1997871956550465 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 10 6)
"cameras/drone/drone0" SET Transform localScale (1.385740427135842 1.385740427135842 1.385740427135842)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -15 13)
"cameras/drone/drone1" SET Transform localScale (0.7560014912931274 0.7560014912931274 0.7560014912931274)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5467929140542056 0)
"cameras" SET Transform eulerAngles (-13.445383698688165 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9084452922049524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.774777191766863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07180878553326671
"cameras/drone/drone0" SET Transform localPosition (1.048852937941015 -0.17415299047236293 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8510708615587963 0.8572265405208568 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 20 -11)
"cameras/drone/drone0" SET Transform localScale (1.2223436497544133 1.2223436497544133 1.2223436497544133)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -2 16)
"cameras/drone/drone1" SET Transform localScale (1.34711099794111 1.34711099794111 1.34711099794111)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4292532526099846 0)
"cameras" SET Transform eulerAngles (-14.719537343933084 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9956865789985648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8233160328926576
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29088042375883144
"cameras/drone/drone0" SET Transform localPosition (0.7833018295480867 0.5609021493353799 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12136327360518218 1.2295729224635004 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 11 -7)
"cameras/drone/drone0" SET Transform localScale (0.8346079938416084 0.8346079938416084 0.8346079938416084)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -4 -9)
"cameras/drone/drone1" SET Transform localScale (1.3544447352819553 1.3544447352819553 1.3544447352819553)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1309762541195925 0)
"cameras" SET Transform eulerAngles (-14.565750044522932 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1473745848314978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.343530187767272
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11131106635716069
"cameras/drone/drone0" SET Transform localPosition (-0.771501673592474 0.2557800484697134 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9579159944637903 1.096101652736376 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 1 -20)
"cameras/drone/drone0" SET Transform localScale (0.801174585497995 0.801174585497995 0.801174585497995)
"cameras/drone/drone1" SET Transform localEulerAngles (15 9 8)
"cameras/drone/drone1" SET Transform localScale (1.1370458447371532 1.1370458447371532 1.1370458447371532)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2738675395783243 0)
"cameras" SET Transform eulerAngles (18.64569017414231 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0681636214228334
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9307030957417751
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2241904722611809
"cameras/drone/drone0" SET Transform localPosition (-0.313522573007068 0.6256986212614282 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6345535046234043 1.1035167621301323 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -10 -6)
"cameras/drone/drone0" SET Transform localScale (1.3208629679715451 1.3208629679715451 1.3208629679715451)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -1 -13)
"cameras/drone/drone1" SET Transform localScale (0.8359217290411325 0.8359217290411325 0.8359217290411325)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.228446329954154 0)
"cameras" SET Transform eulerAngles (-17.799590300725328 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.377668966051346
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9420730016634171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09221043232056095
"cameras/drone/drone0" SET Transform localPosition (-0.48687446154588165 -0.07696279451473004 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5087251621249674 1.1654160626610683 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -10 -8)
"cameras/drone/drone0" SET Transform localScale (1.1636274706475092 1.1636274706475092 1.1636274706475092)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -6 -10)
"cameras/drone/drone1" SET Transform localScale (0.7833427514019208 0.7833427514019208 0.7833427514019208)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.445836043757997 0)
"cameras" SET Transform eulerAngles (3.857297594376419 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2014910987450034
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7006915756715282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24499565602085405
"cameras/drone/drone0" SET Transform localPosition (-0.5441529254434871 0.30693174271571083 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5193756196021174 0.904119546259773 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -3 6)
"cameras/drone/drone0" SET Transform localScale (0.6831961400893217 0.6831961400893217 0.6831961400893217)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -13 1)
"cameras/drone/drone1" SET Transform localScale (0.7024327858864964 0.7024327858864964 0.7024327858864964)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.547850690247419 0)
"cameras" SET Transform eulerAngles (-13.467286187650043 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3704234026863866
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2809513828472576
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.378833520832653
"cameras/drone/drone0" SET Transform localPosition (-0.294858491340765 -0.14002147015393035 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32041021090020716 1.2989357203258813 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -9 -13)
"cameras/drone/drone0" SET Transform localScale (1.0697250397142242 1.0697250397142242 1.0697250397142242)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 13 17)
"cameras/drone/drone1" SET Transform localScale (0.8611800909595236 0.8611800909595236 0.8611800909595236)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4018332025602653 0)
"cameras" SET Transform eulerAngles (9.180905351014474 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1361296479636893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6325741840293735
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36664333335403854
"cameras/drone/drone0" SET Transform localPosition (0.9808624039262843 0.0834300039336427 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5122719640864823 1.02862683326681 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 9 -6)
"cameras/drone/drone0" SET Transform localScale (0.7115520481631087 0.7115520481631087 0.7115520481631087)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -6 18)
"cameras/drone/drone1" SET Transform localScale (1.3259196213131716 1.3259196213131716 1.3259196213131716)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0691865596260843 0)
"cameras" SET Transform eulerAngles (7.326934298510107 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.346591260221789
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8299416014085397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24881739433062752
"cameras/drone/drone0" SET Transform localPosition (-0.1867874311766935 0.5601216127184896 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0621285435610106 0.8171709479201279 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 8 18)
"cameras/drone/drone0" SET Transform localScale (1.2498253410393239 1.2498253410393239 1.2498253410393239)
"cameras/drone/drone1" SET Transform localEulerAngles (10 2 12)
"cameras/drone/drone1" SET Transform localScale (0.6868314758111269 0.6868314758111269 0.6868314758111269)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1508512761961565 0)
"cameras" SET Transform eulerAngles (-13.577116923854433 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5463053105760114
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9015437003359659
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02055944234602394
"cameras/drone/drone0" SET Transform localPosition (-0.0196908524873336 0.5429819816487838 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37844261066673357 1.2454098438674448 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -3 -7)
"cameras/drone/drone0" SET Transform localScale (0.7678399234794818 0.7678399234794818 0.7678399234794818)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -2 15)
"cameras/drone/drone1" SET Transform localScale (0.7899864402441806 0.7899864402441806 0.7899864402441806)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6811989273343455 0)
"cameras" SET Transform eulerAngles (-11.027689196724314 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4751004749349137
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0934227796110016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35905614149355536
"cameras/drone/drone0" SET Transform localPosition (0.3106150658601625 -0.0739347979044464 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.10460317797910679 1.0742035599645394 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -14 -19)
"cameras/drone/drone0" SET Transform localScale (0.9202563204474357 0.9202563204474357 0.9202563204474357)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -12 -19)
"cameras/drone/drone1" SET Transform localScale (1.2405398978058775 1.2405398978058775 1.2405398978058775)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.152648613166572 0)
"cameras" SET Transform eulerAngles (13.966749951584433 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1691687580290497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1082218720155326
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0020772400371114053
"cameras/drone/drone0" SET Transform localPosition (-0.9813132968096447 0.2823711553840997 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.34139588605552496 0.8913969154540544 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 2 1)
"cameras/drone/drone0" SET Transform localScale (1.3174215735343817 1.3174215735343817 1.3174215735343817)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -7 -14)
"cameras/drone/drone1" SET Transform localScale (1.2555184313379992 1.2555184313379992 1.2555184313379992)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.837156942434003 0)
"cameras" SET Transform eulerAngles (17.09245000247664 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8152575166132132
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.947341451401497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1351202732834489
"cameras/drone/drone0" SET Transform localPosition (-0.8545488374470704 0.056503071061374255 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.048617074270531 1.0998128407924725 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -7 10)
"cameras/drone/drone0" SET Transform localScale (1.128624151964574 1.128624151964574 1.128624151964574)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 10 3)
"cameras/drone/drone1" SET Transform localScale (1.4777495236918052 1.4777495236918052 1.4777495236918052)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1352640678586488 0)
"cameras" SET Transform eulerAngles (-10.975072496335528 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2245893320761283
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5380567185826122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2065976538624864
"cameras/drone/drone0" SET Transform localPosition (-0.9290039080930582 0.4829274434981002 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.0691241317375837 1.2745873338297904 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -14 -6)
"cameras/drone/drone0" SET Transform localScale (1.4899227400469348 1.4899227400469348 1.4899227400469348)
"cameras/drone/drone1" SET Transform localEulerAngles (8 3 15)
"cameras/drone/drone1" SET Transform localScale (0.9552341687066195 0.9552341687066195 0.9552341687066195)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.321000751408671 0)
"cameras" SET Transform eulerAngles (4.040498602129503 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8282271771146357
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9987821419433487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18641962055048836
"cameras/drone/drone0" SET Transform localPosition (1.143155216705139 0.3245704275670512 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1178162331445185 1.2195383962919646 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -2 -15)
"cameras/drone/drone0" SET Transform localScale (1.430309246110978 1.430309246110978 1.430309246110978)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 13 -13)
"cameras/drone/drone1" SET Transform localScale (0.6923061820772667 0.6923061820772667 0.6923061820772667)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.803184998226237 0)
"cameras" SET Transform eulerAngles (-9.23242018387434 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0785469814064905
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9446198044153218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14592357697518277
"cameras/drone/drone0" SET Transform localPosition (0.509738472751115 0.11028272429448699 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8209808843081923 1.0030882917663682 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -13 -12)
"cameras/drone/drone0" SET Transform localScale (1.122376932322045 1.122376932322045 1.122376932322045)
"cameras/drone/drone1" SET Transform localEulerAngles (11 8 14)
"cameras/drone/drone1" SET Transform localScale (0.7176274567453805 0.7176274567453805 0.7176274567453805)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.609897651442344 0)
"cameras" SET Transform eulerAngles (14.617619772361628 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8496138215437938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1195878684426621
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3726636396212889
"cameras/drone/drone0" SET Transform localPosition (0.08545558023858324 0.3728677292766524 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1500012768765602 1.1075552386286804 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -6 -19)
"cameras/drone/drone0" SET Transform localScale (1.061621986656175 1.061621986656175 1.061621986656175)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 17 19)
"cameras/drone/drone1" SET Transform localScale (1.1384169738391305 1.1384169738391305 1.1384169738391305)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7582256247254153 0)
"cameras" SET Transform eulerAngles (-0.3047463722045549 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6432445170162588
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9027125619534712
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1950358688594328
"cameras/drone/drone0" SET Transform localPosition (-0.3518030975077403 0.667588846557132 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0283998459338752 1.2055008677031251 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -20 3)
"cameras/drone/drone0" SET Transform localScale (0.907932964178334 0.907932964178334 0.907932964178334)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 10 -7)
"cameras/drone/drone1" SET Transform localScale (0.8981933367816952 0.8981933367816952 0.8981933367816952)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.913775190638356 0)
"cameras" SET Transform eulerAngles (2.6794336961663348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4730023651624333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1531898485973395
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04882790792807934
"cameras/drone/drone0" SET Transform localPosition (-0.6642239172627264 0.583321273113286 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0486440389639868 1.2075645021843127 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -11 -4)
"cameras/drone/drone0" SET Transform localScale (0.7259766332209078 0.7259766332209078 0.7259766332209078)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -1 18)
"cameras/drone/drone1" SET Transform localScale (0.6427353766027526 0.6427353766027526 0.6427353766027526)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.057975703496442 0)
"cameras" SET Transform eulerAngles (2.986891497217364 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3002272111187918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2205258956435925
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3851654925745561
"cameras/drone/drone0" SET Transform localPosition (0.7851810148961422 0.10516178374070967 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6453467319003839 1.1051096248806849 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 5 5)
"cameras/drone/drone0" SET Transform localScale (1.217780778017587 1.217780778017587 1.217780778017587)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -12 -14)
"cameras/drone/drone1" SET Transform localScale (1.133718898032813 1.133718898032813 1.133718898032813)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.01452040185044 0)
"cameras" SET Transform eulerAngles (1.4399575089300178 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.383228317408455
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9468184796070542
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22027873525372832
"cameras/drone/drone0" SET Transform localPosition (0.12061717395151073 0.5793319814571813 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05555327668197885 1.0986613839578991 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 19 8)
"cameras/drone/drone0" SET Transform localScale (0.8786429436326222 0.8786429436326222 0.8786429436326222)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 5 -18)
"cameras/drone/drone1" SET Transform localScale (0.9938286762483697 0.9938286762483697 0.9938286762483697)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2492420064659386 0)
"cameras" SET Transform eulerAngles (-15.118759722007784 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4391438313172489
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9983244626329282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35580195803925757
"cameras/drone/drone0" SET Transform localPosition (0.14300078031143082 0.532895025944917 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0712607732943755 0.8667396573880259 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 10 -12)
"cameras/drone/drone0" SET Transform localScale (1.127060893824463 1.127060893824463 1.127060893824463)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -12 -4)
"cameras/drone/drone1" SET Transform localScale (1.0938569941962546 1.0938569941962546 1.0938569941962546)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8196228680748545 0)
"cameras" SET Transform eulerAngles (-9.93796545572291 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9629095338124198
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1827747001831903
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08691986213962091
"cameras/drone/drone0" SET Transform localPosition (-0.057682608742419816 0.38221088122532026 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1425342119885202 0.816781402548945 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 11 14)
"cameras/drone/drone0" SET Transform localScale (0.7488644486868468 0.7488644486868468 0.7488644486868468)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -1 17)
"cameras/drone/drone1" SET Transform localScale (0.7448052840230082 0.7448052840230082 0.7448052840230082)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.550530967864917 0)
"cameras" SET Transform eulerAngles (-17.17934789463893 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5037970986688163
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6118323629519846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.039832953404315585
"cameras/drone/drone0" SET Transform localPosition (-0.9509449474491987 0.34563426339608955 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.975180154608642 0.9262920026208925 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -3 8)
"cameras/drone/drone0" SET Transform localScale (1.055991016980492 1.055991016980492 1.055991016980492)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -7 15)
"cameras/drone/drone1" SET Transform localScale (1.3068444349389257 1.3068444349389257 1.3068444349389257)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9323246243141607 0)
"cameras" SET Transform eulerAngles (-12.397171852279927 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3707943222141734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5987062393156852
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3489556966082086
"cameras/drone/drone0" SET Transform localPosition (0.6408954733661887 0.4797808967358704 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7189226381584002 1.244684117877866 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -20 -10)
"cameras/drone/drone0" SET Transform localScale (0.9157312476755934 0.9157312476755934 0.9157312476755934)
"cameras/drone/drone1" SET Transform localEulerAngles (9 16 -16)
"cameras/drone/drone1" SET Transform localScale (0.6802920999347821 0.6802920999347821 0.6802920999347821)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3216758794999324 0)
"cameras" SET Transform eulerAngles (2.5838785570417677 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5021035837414801
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5514191101389163
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3268591861639024
"cameras/drone/drone0" SET Transform localPosition (-0.12671454568175933 -0.17592302000202614 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.009522196259575733 1.2383925035189949 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -4 -5)
"cameras/drone/drone0" SET Transform localScale (1.3003587011754396 1.3003587011754396 1.3003587011754396)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -13 1)
"cameras/drone/drone1" SET Transform localScale (1.2630163000793644 1.2630163000793644 1.2630163000793644)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.572543271742933 0)
"cameras" SET Transform eulerAngles (7.197658676558447 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4827313358684967
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6063407046659433
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08836318965420094
"cameras/drone/drone0" SET Transform localPosition (-0.3771090955860884 0.41189274057877207 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8816033875910863 1.151158672032969 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -5 -12)
"cameras/drone/drone0" SET Transform localScale (0.8687439964137647 0.8687439964137647 0.8687439964137647)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -2 10)
"cameras/drone/drone1" SET Transform localScale (1.2827328529947648 1.2827328529947648 1.2827328529947648)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5027016870923733 0)
"cameras" SET Transform eulerAngles (-6.0344369087511485 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4774770057953397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6054804039557573
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2193739167820306
"cameras/drone/drone0" SET Transform localPosition (-1.1884249541059453 0.20463330207941716 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6812232927420315 0.8499033520504101 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -15 -13)
"cameras/drone/drone0" SET Transform localScale (1.012949894792962 1.012949894792962 1.012949894792962)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 19 0)
"cameras/drone/drone1" SET Transform localScale (0.9083474501599414 0.9083474501599414 0.9083474501599414)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.518417654626039 0)
"cameras" SET Transform eulerAngles (-6.732770371256533 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4824187570649308
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2394285977271073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04304542478176918
"cameras/drone/drone0" SET Transform localPosition (-1.049333017249839 -0.18502223117943034 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23480212913184229 1.2135011272228953 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 2 3)
"cameras/drone/drone0" SET Transform localScale (1.0654576086402037 1.0654576086402037 1.0654576086402037)
"cameras/drone/drone1" SET Transform localEulerAngles (5 9 2)
"cameras/drone/drone1" SET Transform localScale (0.7722144553316598 0.7722144553316598 0.7722144553316598)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.605155362161652 0)
"cameras" SET Transform eulerAngles (13.810931104390598 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8440094555482811
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.543106237564482
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09779845175418456
"cameras/drone/drone0" SET Transform localPosition (-0.2459218204924457 0.43312625630820584 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1926020094758687 1.0047257706926622 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 8 -13)
"cameras/drone/drone0" SET Transform localScale (0.8905138171587244 0.8905138171587244 0.8905138171587244)
"cameras/drone/drone1" SET Transform localEulerAngles (15 16 -17)
"cameras/drone/drone1" SET Transform localScale (1.203690333860342 1.203690333860342 1.203690333860342)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.948909236098219 0)
"cameras" SET Transform eulerAngles (5.975992916203797 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.173192069824145
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3262532843843051
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1634575444956671
"cameras/drone/drone0" SET Transform localPosition (0.5143178375127906 -0.2155321414273243 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6738879186507334 1.2836555803664347 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -16 6)
"cameras/drone/drone0" SET Transform localScale (1.3090717355798742 1.3090717355798742 1.3090717355798742)
"cameras/drone/drone1" SET Transform localEulerAngles (20 17 8)
"cameras/drone/drone1" SET Transform localScale (0.9906063084746038 0.9906063084746038 0.9906063084746038)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2548043553855446 0)
"cameras" SET Transform eulerAngles (-15.983533108180957 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1352575196035777
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0571407209854577
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13977500450230612
"cameras/drone/drone0" SET Transform localPosition (0.7400530175118682 -0.253781515858211 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.179449807914365 1.1347046242778143 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 7 -6)
"cameras/drone/drone0" SET Transform localScale (1.2917287787891287 1.2917287787891287 1.2917287787891287)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -4 18)
"cameras/drone/drone1" SET Transform localScale (0.8483495958596388 0.8483495958596388 0.8483495958596388)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.131880890862906 0)
"cameras" SET Transform eulerAngles (-14.191113771011317 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4824615299297115
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5837168430968678
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15581917082659072
"cameras/drone/drone0" SET Transform localPosition (0.537925879622668 0.5092729900391151 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.43445350344850564 1.2512241038458507 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -9 -10)
"cameras/drone/drone0" SET Transform localScale (0.6374885135926956 0.6374885135926956 0.6374885135926956)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -17 18)
"cameras/drone/drone1" SET Transform localScale (0.7786031405449605 0.7786031405449605 0.7786031405449605)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.959945189004598 0)
"cameras" SET Transform eulerAngles (3.0860749251699495 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.396288731218359
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3779952159513265
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.006617568835138999
"cameras/drone/drone0" SET Transform localPosition (0.45233965039321467 0.3490478978501013 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9501690992677554 0.9953830740551136 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 7 12)
"cameras/drone/drone0" SET Transform localScale (0.8667593310915562 0.8667593310915562 0.8667593310915562)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 14 15)
"cameras/drone/drone1" SET Transform localScale (1.0527036769928584 1.0527036769928584 1.0527036769928584)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.966315202764034 0)
"cameras" SET Transform eulerAngles (8.112987302411202 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7173869999181768
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.781277893560532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16468591893086565
"cameras/drone/drone0" SET Transform localPosition (0.5733136950928235 -0.042487760460139856 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1374551249471223 1.0459362350144306 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -20 -11)
"cameras/drone/drone0" SET Transform localScale (1.0023008339902348 1.0023008339902348 1.0023008339902348)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 0 -18)
"cameras/drone/drone1" SET Transform localScale (1.2445059113387924 1.2445059113387924 1.2445059113387924)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7386531249457065 0)
"cameras" SET Transform eulerAngles (-10.416331152449153 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4845640178266843
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.950655760986281
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.030523301285068662
"cameras/drone/drone0" SET Transform localPosition (-1.0378424576564307 0.20545241001475784 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3134702730304625 0.9016777664046796 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -8 -2)
"cameras/drone/drone0" SET Transform localScale (1.2861600101982478 1.2861600101982478 1.2861600101982478)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 6 -13)
"cameras/drone/drone1" SET Transform localScale (1.1589891773732444 1.1589891773732444 1.1589891773732444)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.391779740377806 0)
"cameras" SET Transform eulerAngles (9.928333486728704 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4979980416742653
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2641693666720202
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2422271436777831
"cameras/drone/drone0" SET Transform localPosition (0.9427112104933422 0.3454960037786759 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5408729252761235 1.0038777975796374 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 17 -5)
"cameras/drone/drone0" SET Transform localScale (0.941899682341389 0.941899682341389 0.941899682341389)
"cameras/drone/drone1" SET Transform localEulerAngles (17 18 6)
"cameras/drone/drone1" SET Transform localScale (0.6816431526667108 0.6816431526667108 0.6816431526667108)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.194871989896816 0)
"cameras" SET Transform eulerAngles (-19.69492183408416 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3963581404835368
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2186010079679412
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2844421181381563
"cameras/drone/drone0" SET Transform localPosition (0.6386232794794309 0.4990522918287354 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.818376512042482 0.9566996579626521 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -1 -9)
"cameras/drone/drone0" SET Transform localScale (1.4912366142158893 1.4912366142158893 1.4912366142158893)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -18 8)
"cameras/drone/drone1" SET Transform localScale (0.7139894193668311 0.7139894193668311 0.7139894193668311)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.190640892916318 0)
"cameras" SET Transform eulerAngles (-13.933442066505348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5037004170336523
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1536994449055133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.015072961999312141
"cameras/drone/drone0" SET Transform localPosition (-0.2412872210213617 0.3799103990998726 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9345206571976987 1.2264195932576862 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -16 4)
"cameras/drone/drone0" SET Transform localScale (1.4383916346617605 1.4383916346617605 1.4383916346617605)
"cameras/drone/drone1" SET Transform localEulerAngles (1 15 -10)
"cameras/drone/drone1" SET Transform localScale (0.8959176101209243 0.8959176101209243 0.8959176101209243)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.093126752014254 0)
"cameras" SET Transform eulerAngles (-13.72737669710299 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5221310920367164
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3313319226533804
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04316428741621308
"cameras/drone/drone0" SET Transform localPosition (0.4223950976093176 -0.07089452128091495 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.16002076005608434 0.8038222211462074 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 18 5)
"cameras/drone/drone0" SET Transform localScale (1.0155522517037894 1.0155522517037894 1.0155522517037894)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -11 -2)
"cameras/drone/drone1" SET Transform localScale (0.9946840849488828 0.9946840849488828 0.9946840849488828)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.50938276256068 0)
"cameras" SET Transform eulerAngles (8.752105479792256 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1318823550063257
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9000353629393124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34174242790187354
"cameras/drone/drone0" SET Transform localPosition (-0.3990833161347601 -0.15503888762576895 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3858406219795928 0.8241161261652162 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 2 20)
"cameras/drone/drone0" SET Transform localScale (1.3567197605309422 1.3567197605309422 1.3567197605309422)
"cameras/drone/drone1" SET Transform localEulerAngles (12 12 -5)
"cameras/drone/drone1" SET Transform localScale (1.2918512603441688 1.2918512603441688 1.2918512603441688)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.199065735542388 0)
"cameras" SET Transform eulerAngles (16.828376909584875 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0396050046828287
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5996823314747926
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2036266203813667
"cameras/drone/drone0" SET Transform localPosition (-0.34952110978593265 -0.02249187837069272 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6159166889819494 0.9822961291062462 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 6 -11)
"cameras/drone/drone0" SET Transform localScale (0.9838054789374906 0.9838054789374906 0.9838054789374906)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -9 -4)
"cameras/drone/drone1" SET Transform localScale (1.287132221239598 1.287132221239598 1.287132221239598)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.678954797104267 0)
"cameras" SET Transform eulerAngles (-8.52852167133408 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9232486450597058
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0091557203541415
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3857625739691034
"cameras/drone/drone0" SET Transform localPosition (-0.7836238172412746 0.23581755192459425 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2627156341401755 1.1881397901743778 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -8 -20)
"cameras/drone/drone0" SET Transform localScale (1.12639423585403 1.12639423585403 1.12639423585403)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -13 -15)
"cameras/drone/drone1" SET Transform localScale (0.6789594025407658 0.6789594025407658 0.6789594025407658)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.922960797115029 0)
"cameras" SET Transform eulerAngles (12.339792780829761 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0266936290072344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.447413151730272
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3605206374374835
"cameras/drone/drone0" SET Transform localPosition (1.11142811557356 -0.007083476198946059 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4392105858640398 0.9748235886161021 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 1 -2)
"cameras/drone/drone0" SET Transform localScale (0.6393932902810601 0.6393932902810601 0.6393932902810601)
"cameras/drone/drone1" SET Transform localEulerAngles (2 3 -9)
"cameras/drone/drone1" SET Transform localScale (1.351305220308849 1.351305220308849 1.351305220308849)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2128043599365164 0)
"cameras" SET Transform eulerAngles (-12.137258350911345 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.987021882698865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4369543258189084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16334672810299966
"cameras/drone/drone0" SET Transform localPosition (0.6408997574326107 -0.08876861884107917 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9533683700496951 1.2591718111767647 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -1 -7)
"cameras/drone/drone0" SET Transform localScale (1.0195270109555419 1.0195270109555419 1.0195270109555419)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 19 12)
"cameras/drone/drone1" SET Transform localScale (1.0682294572267466 1.0682294572267466 1.0682294572267466)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.896282427721021 0)
"cameras" SET Transform eulerAngles (1.962145225695913 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0782870297928442
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7425477708826898
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29025041908638477
"cameras/drone/drone0" SET Transform localPosition (0.6022802587087754 0.686926757814696 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0551769420883435 1.069378099461173 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 15 1)
"cameras/drone/drone0" SET Transform localScale (1.3319711047857914 1.3319711047857914 1.3319711047857914)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -10 16)
"cameras/drone/drone1" SET Transform localScale (1.2233561862797027 1.2233561862797027 1.2233561862797027)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3328275198367034 0)
"cameras" SET Transform eulerAngles (2.124556631870629 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.565987663494007
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9326543821812319
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15198010040418275
"cameras/drone/drone0" SET Transform localPosition (0.8920735216902316 0.37162958053987954 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7714957512537854 1.2871562826218346 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -15 -11)
"cameras/drone/drone0" SET Transform localScale (0.8163757234597462 0.8163757234597462 0.8163757234597462)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -7 -15)
"cameras/drone/drone1" SET Transform localScale (1.0891939260391132 1.0891939260391132 1.0891939260391132)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.630919237967462 0)
"cameras" SET Transform eulerAngles (17.609495273041176 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8014770859206737
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2228860185670474
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14157618258725144
"cameras/drone/drone0" SET Transform localPosition (0.5506648113846528 0.26858408497577496 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5679727589039684 0.869947530092926 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 9 1)
"cameras/drone/drone0" SET Transform localScale (1.3141304652750538 1.3141304652750538 1.3141304652750538)
"cameras/drone/drone1" SET Transform localEulerAngles (20 9 8)
"cameras/drone/drone1" SET Transform localScale (0.9276306016696805 0.9276306016696805 0.9276306016696805)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.140332747401231 0)
"cameras" SET Transform eulerAngles (-14.880250640036383 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6974348275322626
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6931208261107458
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3340606636397226
"cameras/drone/drone0" SET Transform localPosition (-0.5306512246554199 0.17455191428339628 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8353480036803196 1.0099533074728921 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 6 -9)
"cameras/drone/drone0" SET Transform localScale (0.7879588478805659 0.7879588478805659 0.7879588478805659)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 7 10)
"cameras/drone/drone1" SET Transform localScale (1.1685608847052824 1.1685608847052824 1.1685608847052824)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2144287671038363 0)
"cameras" SET Transform eulerAngles (-15.347295449773263 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3667377733296955
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1294531003010249
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13164176124546456
"cameras/drone/drone0" SET Transform localPosition (-0.551591555814749 0.16671457244551163 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4319893122382191 1.1007264513750683 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -14 -5)
"cameras/drone/drone0" SET Transform localScale (1.2511275633339136 1.2511275633339136 1.2511275633339136)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -3 20)
"cameras/drone/drone1" SET Transform localScale (0.9091319744532668 0.9091319744532668 0.9091319744532668)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.752548147431881 0)
"cameras" SET Transform eulerAngles (16.378782207447372 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6677387984997152
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8871391587087634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1829269977668549
"cameras/drone/drone0" SET Transform localPosition (-0.5889914296820616 -0.03444092335100196 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0018363857571961 0.8691777549789919 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -8 -15)
"cameras/drone/drone0" SET Transform localScale (1.1229256537793988 1.1229256537793988 1.1229256537793988)
"cameras/drone/drone1" SET Transform localEulerAngles (7 20 0)
"cameras/drone/drone1" SET Transform localScale (0.7933978728823871 0.7933978728823871 0.7933978728823871)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.801449484988078 0)
"cameras" SET Transform eulerAngles (18.46309943184073 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6341295695011063
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0202447214339945
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.055823999618891576
"cameras/drone/drone0" SET Transform localPosition (-0.52176980111437 0.3277648769662089 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.14410925601636615 1.0268395600816234 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 17 14)
"cameras/drone/drone0" SET Transform localScale (1.350810973454335 1.350810973454335 1.350810973454335)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 8 -12)
"cameras/drone/drone1" SET Transform localScale (1.224967276343378 1.224967276343378 1.224967276343378)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.690199062804672 0)
"cameras" SET Transform eulerAngles (14.263336723602684 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5158485542094297
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9404273492788305
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3894092345815825
"cameras/drone/drone0" SET Transform localPosition (-0.13539375351704197 -0.1952979967236838 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12379200642179766 0.9727415647348294 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 8 -19)
"cameras/drone/drone0" SET Transform localScale (0.653189578839887 0.653189578839887 0.653189578839887)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -18 -20)
"cameras/drone/drone1" SET Transform localScale (0.7004584050280428 0.7004584050280428 0.7004584050280428)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3634276066262148 0)
"cameras" SET Transform eulerAngles (18.98059872121555 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0815251734978837
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4280456936982298
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.158023378082973
"cameras/drone/drone0" SET Transform localPosition (-0.331706809006754 0.07781061650232163 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0799129964700989 0.8142904772588156 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 8 -18)
"cameras/drone/drone0" SET Transform localScale (0.8875355090522772 0.8875355090522772 0.8875355090522772)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -15 14)
"cameras/drone/drone1" SET Transform localScale (0.6529603091140496 0.6529603091140496 0.6529603091140496)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.965092068848737 0)
"cameras" SET Transform eulerAngles (-12.877441038345733 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9982966571800201
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3099386895243845
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08953514796029438
"cameras/drone/drone0" SET Transform localPosition (0.9115996333098979 0.4720195398669009 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9276470864198524 0.904447400123098 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -19 -4)
"cameras/drone/drone0" SET Transform localScale (1.4868603570533 1.4868603570533 1.4868603570533)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -3 -7)
"cameras/drone/drone1" SET Transform localScale (1.0138941810386684 1.0138941810386684 1.0138941810386684)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.322619663841801 0)
"cameras" SET Transform eulerAngles (15.08026988567466 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1723504525300648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.149370528977901
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.011268240529018404
"cameras/drone/drone0" SET Transform localPosition (0.30287557953301913 -0.28960459718144343 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8939452181692846 1.131052716986168 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 9 1)
"cameras/drone/drone0" SET Transform localScale (1.0518070556598957 1.0518070556598957 1.0518070556598957)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 2 3)
"cameras/drone/drone1" SET Transform localScale (0.6994359404228587 0.6994359404228587 0.6994359404228587)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7357481210348293 0)
"cameras" SET Transform eulerAngles (13.280424025803022 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3148410254200937
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5117975686077791
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2547139516193451
"cameras/drone/drone0" SET Transform localPosition (-0.1973833082118479 0.4413942669681395 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07988777190243779 0.8290880160179233 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 7 -16)
"cameras/drone/drone0" SET Transform localScale (1.3626866509000286 1.3626866509000286 1.3626866509000286)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -20 5)
"cameras/drone/drone1" SET Transform localScale (0.770970346081638 0.770970346081638 0.770970346081638)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.793547345500113 0)
"cameras" SET Transform eulerAngles (11.836184329585286 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8771206736723907
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.862324444747273
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1662236717276355
"cameras/drone/drone0" SET Transform localPosition (0.7579789251745519 0.6722926290394398 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0642943031801322 1.053698368119916 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -20 17)
"cameras/drone/drone0" SET Transform localScale (1.420140047730373 1.420140047730373 1.420140047730373)
"cameras/drone/drone1" SET Transform localEulerAngles (10 19 0)
"cameras/drone/drone1" SET Transform localScale (0.6463802044404975 0.6463802044404975 0.6463802044404975)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.619144617267836 0)
"cameras" SET Transform eulerAngles (-19.182460784888878 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9841252869639127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9476270314027118
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31210901226068977
"cameras/drone/drone0" SET Transform localPosition (1.1053826440681644 0.24110849552761576 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1727374197329168 1.2440711111041542 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 1 10)
"cameras/drone/drone0" SET Transform localScale (1.3565581181580448 1.3565581181580448 1.3565581181580448)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 12 0)
"cameras/drone/drone1" SET Transform localScale (0.6862559320465126 0.6862559320465126 0.6862559320465126)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2845483898930876 0)
"cameras" SET Transform eulerAngles (-8.890814357294872 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4961455964025094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0771487719930495
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02951284503853624
"cameras/drone/drone0" SET Transform localPosition (-0.39174595232861253 0.41952630170495936 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7623001577584274 0.907988182078547 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -3 19)
"cameras/drone/drone0" SET Transform localScale (1.1265254990854208 1.1265254990854208 1.1265254990854208)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -12 -14)
"cameras/drone/drone1" SET Transform localScale (1.281623387661251 1.281623387661251 1.281623387661251)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.543007748717078 0)
"cameras" SET Transform eulerAngles (2.998323373175161 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2322488164131764
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8769963567558658
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.048991976149336036
"cameras/drone/drone0" SET Transform localPosition (-0.7699576869319958 0.16682803948213226 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8462498506727967 1.02164516406976 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 0 1)
"cameras/drone/drone0" SET Transform localScale (0.6645189127242104 0.6645189127242104 0.6645189127242104)
"cameras/drone/drone1" SET Transform localEulerAngles (5 6 -17)
"cameras/drone/drone1" SET Transform localScale (0.9907966011891997 0.9907966011891997 0.9907966011891997)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.72951913717802 0)
"cameras" SET Transform eulerAngles (8.531587866024584 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8839033077926484
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3130758328801608
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2750252532916077
"cameras/drone/drone0" SET Transform localPosition (1.1586053259306428 0.29325344950902194 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7537129177694388 0.8966618936556157 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -5 -19)
"cameras/drone/drone0" SET Transform localScale (0.6725136551464773 0.6725136551464773 0.6725136551464773)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -17 -12)
"cameras/drone/drone1" SET Transform localScale (1.2729829901939165 1.2729829901939165 1.2729829901939165)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.267277313982696 0)
"cameras" SET Transform eulerAngles (0.8003957917938429 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4374567901821464
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9119220186023944
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0350804105528348
"cameras/drone/drone0" SET Transform localPosition (-0.06753787109518128 -0.2608809604714873 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0027083972082562 1.0649088569248937 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 12 18)
"cameras/drone/drone0" SET Transform localScale (0.6024679677420852 0.6024679677420852 0.6024679677420852)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -19 18)
"cameras/drone/drone1" SET Transform localScale (1.3231343803094848 1.3231343803094848 1.3231343803094848)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.992894804882066 0)
"cameras" SET Transform eulerAngles (15.252804580287858 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.614496099532051
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3117910635433194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10321403708466326
"cameras/drone/drone0" SET Transform localPosition (-0.7872632635033412 0.0959818384248195 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.787856612376892 0.8773064559189679 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 9 18)
"cameras/drone/drone0" SET Transform localScale (0.7140175114369062 0.7140175114369062 0.7140175114369062)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -16 -16)
"cameras/drone/drone1" SET Transform localScale (1.0060950899281955 1.0060950899281955 1.0060950899281955)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7687247604961507 0)
"cameras" SET Transform eulerAngles (18.192421909798426 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4225744679980954
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5601025303224139
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07052530717400107
"cameras/drone/drone0" SET Transform localPosition (0.9913907665757795 0.272525258128181 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03314660631611921 0.826030001952794 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -13 -1)
"cameras/drone/drone0" SET Transform localScale (0.9888741601225597 0.9888741601225597 0.9888741601225597)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -11 -11)
"cameras/drone/drone1" SET Transform localScale (1.0344326808046476 1.0344326808046476 1.0344326808046476)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.835181080503023 0)
"cameras" SET Transform eulerAngles (-4.0366743558970875 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1646462602220886
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.985074235008452
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35594808597273414
"cameras/drone/drone0" SET Transform localPosition (-1.1978824359401592 0.5977328252255978 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.739211081586604 0.9316430176878681 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -11 -7)
"cameras/drone/drone0" SET Transform localScale (1.0795364575370698 1.0795364575370698 1.0795364575370698)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -19 8)
"cameras/drone/drone1" SET Transform localScale (1.3168393004947374 1.3168393004947374 1.3168393004947374)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.923192461475116 0)
"cameras" SET Transform eulerAngles (-7.0961314210182955 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4860156547540369
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2465359036625183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13780751192199678
"cameras/drone/drone0" SET Transform localPosition (-0.261740198607215 0.6687145073126912 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.11360346470044336 0.8589880447578553 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 20 4)
"cameras/drone/drone0" SET Transform localScale (0.8787839560576207 0.8787839560576207 0.8787839560576207)
"cameras/drone/drone1" SET Transform localEulerAngles (9 18 -9)
"cameras/drone/drone1" SET Transform localScale (1.3561246183109512 1.3561246183109512 1.3561246183109512)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
