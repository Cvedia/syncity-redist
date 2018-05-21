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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 157 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 71 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 94 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-6.360606881817464 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 69
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.0481393519534716 0)
"cameras" SET Transform eulerAngles (1.8620084770256966 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5744661849460606
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9096006062188011
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32603153596469625
"cameras/drone/drone0" SET Transform localPosition (0.7843126760900707 0.20556153284402895 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.22739694204086425 1.015666990653459 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 20 16)
"cameras/drone/drone0" SET Transform localScale (1.2120029748661636 1.2120029748661636 1.2120029748661636)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -18 9)
"cameras/drone/drone1" SET Transform localScale (0.7564563469884912 0.7564563469884912 0.7564563469884912)
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
"cameras" SET Transform position (0 4.279097839787668 0)
"cameras" SET Transform eulerAngles (11.090752566250597 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8027925190437822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0898220327314518
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11016937245261085
"cameras/drone/drone0" SET Transform localPosition (-0.52601312110719 0.09230416616345255 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6083230837325849 1.122630139941694 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -3 -19)
"cameras/drone/drone0" SET Transform localScale (0.6015927023403471 0.6015927023403471 0.6015927023403471)
"cameras/drone/drone1" SET Transform localEulerAngles (7 12 13)
"cameras/drone/drone1" SET Transform localScale (1.395394101779475 1.395394101779475 1.395394101779475)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.829757026417788 0)
"cameras" SET Transform eulerAngles (-13.070486384515156 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9579429224858126
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.327853181575746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10966734112897343
"cameras/drone/drone0" SET Transform localPosition (-1.1814038013589918 0.42039662821036977 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.944120867981387 1.1528789498370298 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -3 13)
"cameras/drone/drone0" SET Transform localScale (1.1979243584001105 1.1979243584001105 1.1979243584001105)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 13 6)
"cameras/drone/drone1" SET Transform localScale (1.4775279862906137 1.4775279862906137 1.4775279862906137)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1943098294173584 0)
"cameras" SET Transform eulerAngles (-14.589807818490002 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5579898804063183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6097837406720696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1485251895344839
"cameras/drone/drone0" SET Transform localPosition (-0.8811339145648355 0.6126045411569094 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.012673588663255186 0.9036259176214771 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -10 -12)
"cameras/drone/drone0" SET Transform localScale (1.1663963255624639 1.1663963255624639 1.1663963255624639)
"cameras/drone/drone1" SET Transform localEulerAngles (10 6 -3)
"cameras/drone/drone1" SET Transform localScale (0.8607639849116588 0.8607639849116588 0.8607639849116588)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.018068566570972 0)
"cameras" SET Transform eulerAngles (4.388061696157209 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8768892683614542
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9594487076364314
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2802982468750516
"cameras/drone/drone0" SET Transform localPosition (0.5303246724249908 0.30931343490835445 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.739347244647546 0.992154124204926 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -2 -2)
"cameras/drone/drone0" SET Transform localScale (0.9789681138256077 0.9789681138256077 0.9789681138256077)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 18 13)
"cameras/drone/drone1" SET Transform localScale (0.782299191841182 0.782299191841182 0.782299191841182)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.367506680618101 0)
"cameras" SET Transform eulerAngles (12.783488570923659 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3289184122895266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7569948976112166
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1627277956798211
"cameras/drone/drone0" SET Transform localPosition (-1.0776148039225601 -0.1479364903260884 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0074216272039394 1.0235985708370456 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 0 9)
"cameras/drone/drone0" SET Transform localScale (0.7213914846030658 0.7213914846030658 0.7213914846030658)
"cameras/drone/drone1" SET Transform localEulerAngles (11 11 3)
"cameras/drone/drone1" SET Transform localScale (1.1568612271848153 1.1568612271848153 1.1568612271848153)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.144916522413048 0)
"cameras" SET Transform eulerAngles (14.450093847681018 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2641670175227988
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4229309689233154
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22964390805357066
"cameras/drone/drone0" SET Transform localPosition (-0.5740326888341298 0.1755015768146751 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.38548975702446986 1.1916096239543834 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 7 -5)
"cameras/drone/drone0" SET Transform localScale (1.0023978207047977 1.0023978207047977 1.0023978207047977)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 18 8)
"cameras/drone/drone1" SET Transform localScale (0.9373190404363922 0.9373190404363922 0.9373190404363922)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.398543191899711 0)
"cameras" SET Transform eulerAngles (17.267880264941617 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47233128313741923
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1167397482939814
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0022578767778215435
"cameras/drone/drone0" SET Transform localPosition (0.2222007896763296 -0.1968616264476712 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8856428327083996 1.0860874328687888 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -20 -19)
"cameras/drone/drone0" SET Transform localScale (0.8304497668609168 0.8304497668609168 0.8304497668609168)
"cameras/drone/drone1" SET Transform localEulerAngles (17 19 -20)
"cameras/drone/drone1" SET Transform localScale (0.634061797197776 0.634061797197776 0.634061797197776)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.711383590581788 0)
"cameras" SET Transform eulerAngles (-14.013144563039027 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0255095453486534
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9573162027812763
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3949596691704644
"cameras/drone/drone0" SET Transform localPosition (-0.7312081843412308 0.14828573504666315 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7986904599621241 0.8488200346166919 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 19 13)
"cameras/drone/drone0" SET Transform localScale (1.102862557613133 1.102862557613133 1.102862557613133)
"cameras/drone/drone1" SET Transform localEulerAngles (12 7 -8)
"cameras/drone/drone1" SET Transform localScale (1.1350611608347418 1.1350611608347418 1.1350611608347418)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.883606623383304 0)
"cameras" SET Transform eulerAngles (0.5228705749174942 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3658831755181833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9183478738812719
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2536389571283858
"cameras/drone/drone0" SET Transform localPosition (0.21217902972099578 -0.08380044048515661 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6420515869812558 0.8062931146987071 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -6 15)
"cameras/drone/drone0" SET Transform localScale (1.0534379029729917 1.0534379029729917 1.0534379029729917)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -5 13)
"cameras/drone/drone1" SET Transform localScale (1.2373186626626262 1.2373186626626262 1.2373186626626262)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.121282496002866 0)
"cameras" SET Transform eulerAngles (15.587698805878375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6234625534254773
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4401497815784858
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.008113537233139302
"cameras/drone/drone0" SET Transform localPosition (0.7304918381381273 0.6082869962190189 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8950296378941001 1.0098846740575371 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 7 -12)
"cameras/drone/drone0" SET Transform localScale (0.8048994142840301 0.8048994142840301 0.8048994142840301)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -9 11)
"cameras/drone/drone1" SET Transform localScale (0.8581495226438638 0.8581495226438638 0.8581495226438638)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.642478752346477 0)
"cameras" SET Transform eulerAngles (-9.032526143178913 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.652220451534091
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3280819468269476
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09602471490950189
"cameras/drone/drone0" SET Transform localPosition (-1.0471809018931248 0.33667080799998955 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.689427450023347 0.976296174956389 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -5 19)
"cameras/drone/drone0" SET Transform localScale (0.8988070159548704 0.8988070159548704 0.8988070159548704)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 20 18)
"cameras/drone/drone1" SET Transform localScale (1.405815815863166 1.405815815863166 1.405815815863166)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2116811257717455 0)
"cameras" SET Transform eulerAngles (2.1814305328125982 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6186998125217288
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6790713527951096
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36446362574431995
"cameras/drone/drone0" SET Transform localPosition (-0.03343355457904518 0.4437947810378153 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03613505824248442 0.8023894298446269 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -14 -17)
"cameras/drone/drone0" SET Transform localScale (0.7655965769133464 0.7655965769133464 0.7655965769133464)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -15 -19)
"cameras/drone/drone1" SET Transform localScale (1.1976119830466023 1.1976119830466023 1.1976119830466023)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.439966690103164 0)
"cameras" SET Transform eulerAngles (2.4111134570209316 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4689780974063851
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3629092979507549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3442614497446216
"cameras/drone/drone0" SET Transform localPosition (0.28031832987395755 0.28234267452666767 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6133514946443276 1.0957309291583117 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 2 1)
"cameras/drone/drone0" SET Transform localScale (1.2477867800097826 1.2477867800097826 1.2477867800097826)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -12 -4)
"cameras/drone/drone1" SET Transform localScale (0.7011419793293272 0.7011419793293272 0.7011419793293272)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.478776894807803 0)
"cameras" SET Transform eulerAngles (16.351699574205206 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.53852342750891
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.918071357451986
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2633986120999719
"cameras/drone/drone0" SET Transform localPosition (-0.5882350324437101 -0.1749197810741298 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3308661849283401 1.13368020713536 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 10 1)
"cameras/drone/drone0" SET Transform localScale (1.3109268250960442 1.3109268250960442 1.3109268250960442)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -1 15)
"cameras/drone/drone1" SET Transform localScale (1.3048082195552841 1.3048082195552841 1.3048082195552841)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3155099721957964 0)
"cameras" SET Transform eulerAngles (-6.0181521417412185 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1934198761884713
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8856966460992908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16243358131346586
"cameras/drone/drone0" SET Transform localPosition (0.3184265809731366 0.20403284671447325 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0386214156157256 1.076032737289957 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -14 10)
"cameras/drone/drone0" SET Transform localScale (1.0895945095617763 1.0895945095617763 1.0895945095617763)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -1 15)
"cameras/drone/drone1" SET Transform localScale (1.0311197422123843 1.0311197422123843 1.0311197422123843)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.35734598240788 0)
"cameras" SET Transform eulerAngles (-12.148548863305098 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7544351375410385
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2998076516531358
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30782816279392966
"cameras/drone/drone0" SET Transform localPosition (0.5280693257433104 -0.07477602386149024 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3678924607772469 1.171436129281716 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -9 -19)
"cameras/drone/drone0" SET Transform localScale (0.848470303234243 0.848470303234243 0.848470303234243)
"cameras/drone/drone1" SET Transform localEulerAngles (17 1 2)
"cameras/drone/drone1" SET Transform localScale (1.298661318865347 1.298661318865347 1.298661318865347)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.022659607759055 0)
"cameras" SET Transform eulerAngles (-16.567195341751727 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.57233928787252
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4442955245289821
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3239346286033394
"cameras/drone/drone0" SET Transform localPosition (-0.02634628911455783 0.373365258404805 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6181763299381069 1.090859969777139 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 6 16)
"cameras/drone/drone0" SET Transform localScale (0.8068763037068312 0.8068763037068312 0.8068763037068312)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 2 6)
"cameras/drone/drone1" SET Transform localScale (1.3736161350699758 1.3736161350699758 1.3736161350699758)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.691283421917496 0)
"cameras" SET Transform eulerAngles (-13.401538832653582 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.176476626105381
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3277598069748144
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.007729386546867234
"cameras/drone/drone0" SET Transform localPosition (1.0196980574482033 0.1938967643549913 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.20201203833887038 0.9937410596623433 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 20 -8)
"cameras/drone/drone0" SET Transform localScale (1.1486371147861503 1.1486371147861503 1.1486371147861503)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -8 8)
"cameras/drone/drone1" SET Transform localScale (0.8953514028208571 0.8953514028208571 0.8953514028208571)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0910166489127517 0)
"cameras" SET Transform eulerAngles (-19.232827194538366 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.669681989258766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9791545540145319
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1284612457858135
"cameras/drone/drone0" SET Transform localPosition (0.529940442230914 -0.1543147823022653 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.30363600728872964 1.0436441459916048 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -9 0)
"cameras/drone/drone0" SET Transform localScale (1.0047090566648214 1.0047090566648214 1.0047090566648214)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 5 -16)
"cameras/drone/drone1" SET Transform localScale (0.6106298503829191 0.6106298503829191 0.6106298503829191)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.74409765892298 0)
"cameras" SET Transform eulerAngles (4.687878437009893 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43583705813902884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9122888421123833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19802985450050634
"cameras/drone/drone0" SET Transform localPosition (-0.9665349030146899 0.6301788947461278 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.031006253064131295 1.2734756259099278 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 19 7)
"cameras/drone/drone0" SET Transform localScale (1.0843769465600004 1.0843769465600004 1.0843769465600004)
"cameras/drone/drone1" SET Transform localEulerAngles (3 18 -16)
"cameras/drone/drone1" SET Transform localScale (0.8231823501079136 0.8231823501079136 0.8231823501079136)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.547170888486853 0)
"cameras" SET Transform eulerAngles (-16.975121505451533 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0886982808178183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3325057163021876
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3064139512526367
"cameras/drone/drone0" SET Transform localPosition (0.05298997525643112 -0.17882606033605813 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06015892571215575 1.1826097879925053 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -13 6)
"cameras/drone/drone0" SET Transform localScale (1.116702563378026 1.116702563378026 1.116702563378026)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 5 7)
"cameras/drone/drone1" SET Transform localScale (1.3264867997851921 1.3264867997851921 1.3264867997851921)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.93154910962414 0)
"cameras" SET Transform eulerAngles (1.1981068757435835 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8157818311722123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1348109468266045
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2859786746855995
"cameras/drone/drone0" SET Transform localPosition (-1.0442942552781385 -0.054461838419053554 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.49262014375604735 0.8521066983777726 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -5 -6)
"cameras/drone/drone0" SET Transform localScale (0.7343129113467699 0.7343129113467699 0.7343129113467699)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -10 -14)
"cameras/drone/drone1" SET Transform localScale (1.3719514469346525 1.3719514469346525 1.3719514469346525)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3380290074927395 0)
"cameras" SET Transform eulerAngles (17.792666382819206 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.764870831160674
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9834238213054238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37740866170213366
"cameras/drone/drone0" SET Transform localPosition (-0.45516358624790687 0.028323548350214722 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7260057553935286 0.9645138638270863 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -2 17)
"cameras/drone/drone0" SET Transform localScale (0.6631426476837131 0.6631426476837131 0.6631426476837131)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 12 19)
"cameras/drone/drone1" SET Transform localScale (0.7783845700231586 0.7783845700231586 0.7783845700231586)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.132442901762703 0)
"cameras" SET Transform eulerAngles (-3.9780190029602878 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1745590677903732
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1199550629256199
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3697955071525234
"cameras/drone/drone0" SET Transform localPosition (-0.8875574081807269 0.4705287814711217 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7846257324134858 1.025862782957773 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 20 -19)
"cameras/drone/drone0" SET Transform localScale (1.0826572501328002 1.0826572501328002 1.0826572501328002)
"cameras/drone/drone1" SET Transform localEulerAngles (4 9 0)
"cameras/drone/drone1" SET Transform localScale (1.031488816284729 1.031488816284729 1.031488816284729)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.218772923655502 0)
"cameras" SET Transform eulerAngles (11.49269958512511 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.138613352224528
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8307663673960306
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37282314334253613
"cameras/drone/drone0" SET Transform localPosition (0.5435275017917953 0.18766143332058777 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1028008646198761 1.089086584426001 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 0 11)
"cameras/drone/drone0" SET Transform localScale (1.145260228773879 1.145260228773879 1.145260228773879)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -18 2)
"cameras/drone/drone1" SET Transform localScale (0.6169452636840292 0.6169452636840292 0.6169452636840292)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.418678388340056 0)
"cameras" SET Transform eulerAngles (-0.043581498705211885 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6089784853246909
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5188390011019832
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18312403258795054
"cameras/drone/drone0" SET Transform localPosition (0.7946633832659702 0.5442839184980113 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8977303711071607 0.813174045132237 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 3 -16)
"cameras/drone/drone0" SET Transform localScale (0.8214124991149685 0.8214124991149685 0.8214124991149685)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 6 -15)
"cameras/drone/drone1" SET Transform localScale (1.3114810742479253 1.3114810742479253 1.3114810742479253)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8225837606610145 0)
"cameras" SET Transform eulerAngles (12.591081075900206 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0683012562701024
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2941912042523942
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35146240635225934
"cameras/drone/drone0" SET Transform localPosition (0.608428770897572 -0.1906881806188529 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1334473980349935 1.1690923612772814 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 10 -18)
"cameras/drone/drone0" SET Transform localScale (1.1255602042005641 1.1255602042005641 1.1255602042005641)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -14 -8)
"cameras/drone/drone1" SET Transform localScale (1.331010865388466 1.331010865388466 1.331010865388466)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4863311904809606 0)
"cameras" SET Transform eulerAngles (11.844881907783147 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6715296161978888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0660186037051391
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02249478398544609
"cameras/drone/drone0" SET Transform localPosition (0.22188294744763115 -0.04528108552030902 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9791394773718445 0.9356654565319347 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 12 -5)
"cameras/drone/drone0" SET Transform localScale (0.7321789570242839 0.7321789570242839 0.7321789570242839)
"cameras/drone/drone1" SET Transform localEulerAngles (8 0 16)
"cameras/drone/drone1" SET Transform localScale (1.4158686097830713 1.4158686097830713 1.4158686097830713)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.687711330633694 0)
"cameras" SET Transform eulerAngles (10.232649020795925 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.797577672237807
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.240227544870447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17210141752350927
"cameras/drone/drone0" SET Transform localPosition (0.6881400065782328 -0.0602128050844874 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1883013714210129 1.1571036077210446 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 3 -1)
"cameras/drone/drone0" SET Transform localScale (1.450249486579232 1.450249486579232 1.450249486579232)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 11 17)
"cameras/drone/drone1" SET Transform localScale (1.1992005368505807 1.1992005368505807 1.1992005368505807)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.93864621194139 0)
"cameras" SET Transform eulerAngles (-18.18628950102255 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2633557012824075
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.632373338327215
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2772293253375268
"cameras/drone/drone0" SET Transform localPosition (-1.1832985612316045 -0.27816541536168554 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0514434541569921 1.2858830868882847 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 13 14)
"cameras/drone/drone0" SET Transform localScale (0.6851504958400637 0.6851504958400637 0.6851504958400637)
"cameras/drone/drone1" SET Transform localEulerAngles (1 20 10)
"cameras/drone/drone1" SET Transform localScale (1.312760531851291 1.312760531851291 1.312760531851291)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.53996353731918 0)
"cameras" SET Transform eulerAngles (-1.3547484481069247 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.436058356936821
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1575703011508136
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12436660782460845
"cameras/drone/drone0" SET Transform localPosition (-0.8297364083898107 0.2501875688133161 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.16465608939119 0.9232006608778622 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -6 -5)
"cameras/drone/drone0" SET Transform localScale (0.8807687378085514 0.8807687378085514 0.8807687378085514)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 9 5)
"cameras/drone/drone1" SET Transform localScale (1.3622264024205988 1.3622264024205988 1.3622264024205988)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.570986054941752 0)
"cameras" SET Transform eulerAngles (-17.00163510668034 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4903016918893046
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5877586912520374
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1990345593559237
"cameras/drone/drone0" SET Transform localPosition (-1.091479199797192 0.13579614658808653 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4342384422131188 1.2799653673263045 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -20 -2)
"cameras/drone/drone0" SET Transform localScale (1.4563810277376463 1.4563810277376463 1.4563810277376463)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 14 20)
"cameras/drone/drone1" SET Transform localScale (0.9979271695820923 0.9979271695820923 0.9979271695820923)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.914504867997694 0)
"cameras" SET Transform eulerAngles (-8.712335736707427 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1982985510834818
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3000544574681354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12954013534203793
"cameras/drone/drone0" SET Transform localPosition (-0.815983069440258 0.45784527229554045 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1521142411848282 1.1874759187166823 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 2 17)
"cameras/drone/drone0" SET Transform localScale (0.6143230778439522 0.6143230778439522 0.6143230778439522)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 18 -6)
"cameras/drone/drone1" SET Transform localScale (1.0365179422685646 1.0365179422685646 1.0365179422685646)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6857861785811092 0)
"cameras" SET Transform eulerAngles (-12.30988389270561 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4874797430562179
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9332736826259946
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10751114039291601
"cameras/drone/drone0" SET Transform localPosition (0.20093495488786117 -0.07069619964981338 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1396177454615044 0.9659877921289342 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 2 7)
"cameras/drone/drone0" SET Transform localScale (0.600654800404488 0.600654800404488 0.600654800404488)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -17 -17)
"cameras/drone/drone1" SET Transform localScale (1.0976169127431326 1.0976169127431326 1.0976169127431326)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8400631677574806 0)
"cameras" SET Transform eulerAngles (12.6245492955536 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3740163927454545
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8721937500932755
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04301525776762088
"cameras/drone/drone0" SET Transform localPosition (0.7361575649372523 -0.09577085951717296 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8634763948504006 1.0116847520861854 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -17 -16)
"cameras/drone/drone0" SET Transform localScale (1.4902233655757477 1.4902233655757477 1.4902233655757477)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -13 7)
"cameras/drone/drone1" SET Transform localScale (0.6913598467922202 0.6913598467922202 0.6913598467922202)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1877047683492155 0)
"cameras" SET Transform eulerAngles (-0.7186143493186314 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5025681536964668
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5311269949745423
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3137404212249599
"cameras/drone/drone0" SET Transform localPosition (0.4206906406923212 0.07779832047761531 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8783109376307634 0.9106812959902619 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 10 0)
"cameras/drone/drone0" SET Transform localScale (0.7703287682081867 0.7703287682081867 0.7703287682081867)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 6 12)
"cameras/drone/drone1" SET Transform localScale (1.062299700718382 1.062299700718382 1.062299700718382)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.005707820198934 0)
"cameras" SET Transform eulerAngles (-2.5195146604920566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.358722594547578
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2085100877479142
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21641112920577035
"cameras/drone/drone0" SET Transform localPosition (-1.0079488866081754 -0.1196912544877557 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23633121796197676 1.0942684650211896 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 6 -12)
"cameras/drone/drone0" SET Transform localScale (1.280437546425708 1.280437546425708 1.280437546425708)
"cameras/drone/drone1" SET Transform localEulerAngles (16 18 14)
"cameras/drone/drone1" SET Transform localScale (1.213422937292247 1.213422937292247 1.213422937292247)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.195239076807081 0)
"cameras" SET Transform eulerAngles (10.458572439539267 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7751666746677839
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7282477720256362
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38119345805817534
"cameras/drone/drone0" SET Transform localPosition (-0.22797136004875118 0.6410627672071094 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.29458013771867264 1.0766453113245014 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -12 19)
"cameras/drone/drone0" SET Transform localScale (1.3085501242747966 1.3085501242747966 1.3085501242747966)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -5 -14)
"cameras/drone/drone1" SET Transform localScale (0.8238916994036617 0.8238916994036617 0.8238916994036617)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.420651396603634 0)
"cameras" SET Transform eulerAngles (2.328937833151553 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.048602517715734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.003573847248122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20858564973066762
"cameras/drone/drone0" SET Transform localPosition (0.8349181560878451 0.0692717840213633 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8172115419967645 0.8931836329310552 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 4 -11)
"cameras/drone/drone0" SET Transform localScale (0.8848571427463847 0.8848571427463847 0.8848571427463847)
"cameras/drone/drone1" SET Transform localEulerAngles (16 0 -12)
"cameras/drone/drone1" SET Transform localScale (0.7308153565145084 0.7308153565145084 0.7308153565145084)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8903600476512272 0)
"cameras" SET Transform eulerAngles (14.78432477936687 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40663689671637643
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1122842890208902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16806140815117743
"cameras/drone/drone0" SET Transform localPosition (0.9046364604456023 -0.2402256443957776 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23948958222856387 1.2272382196843394 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 3 12)
"cameras/drone/drone0" SET Transform localScale (1.2318665464778842 1.2318665464778842 1.2318665464778842)
"cameras/drone/drone1" SET Transform localEulerAngles (0 9 18)
"cameras/drone/drone1" SET Transform localScale (1.295795798678367 1.295795798678367 1.295795798678367)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.029835412166265 0)
"cameras" SET Transform eulerAngles (-11.454935780666919 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0310921557240191
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6147059308544054
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.045497862786257004
"cameras/drone/drone0" SET Transform localPosition (-0.7999712780734827 0.18854141498393778 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0541178128054278 1.2828299399154273 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -14 3)
"cameras/drone/drone0" SET Transform localScale (0.9465076258718867 0.9465076258718867 0.9465076258718867)
"cameras/drone/drone1" SET Transform localEulerAngles (17 11 -17)
"cameras/drone/drone1" SET Transform localScale (1.2016293817666592 1.2016293817666592 1.2016293817666592)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0324240198642824 0)
"cameras" SET Transform eulerAngles (-8.32199881683717 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.704923188609647
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7045053876531202
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3904847499568112
"cameras/drone/drone0" SET Transform localPosition (-0.6247554237238808 0.6674817930941794 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.009392397919705697 1.1053214857747697 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -16 -6)
"cameras/drone/drone0" SET Transform localScale (1.3908416650056799 1.3908416650056799 1.3908416650056799)
"cameras/drone/drone1" SET Transform localEulerAngles (0 16 10)
"cameras/drone/drone1" SET Transform localScale (0.8785275440463782 0.8785275440463782 0.8785275440463782)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.602533945220303 0)
"cameras" SET Transform eulerAngles (7.60738442759266 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.34634287826351
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8436730346554897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26351720388459493
"cameras/drone/drone0" SET Transform localPosition (0.35112516408500194 0.49336390900817445 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9779660275172847 1.1608994131631314 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -3 -7)
"cameras/drone/drone0" SET Transform localScale (1.282666355763496 1.282666355763496 1.282666355763496)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 16 6)
"cameras/drone/drone1" SET Transform localScale (1.442723757610166 1.442723757610166 1.442723757610166)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.87003880309889 0)
"cameras" SET Transform eulerAngles (4.7085656423670486 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.47396955612794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4881820790461984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3082098762244214
"cameras/drone/drone0" SET Transform localPosition (0.9857419076852472 0.6723463857559302 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22098317309599924 1.269162566438011 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 19 11)
"cameras/drone/drone0" SET Transform localScale (1.4665622731118824 1.4665622731118824 1.4665622731118824)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -7 9)
"cameras/drone/drone1" SET Transform localScale (0.8262561375400674 0.8262561375400674 0.8262561375400674)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3460536387240225 0)
"cameras" SET Transform eulerAngles (5.954885234460171 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.896159443205617
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5353572477684594
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2984665192381039
"cameras/drone/drone0" SET Transform localPosition (-0.9697222151511894 0.23931537114343399 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09832940260866607 1.0681805416850148 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 17 16)
"cameras/drone/drone0" SET Transform localScale (0.9050876696251375 0.9050876696251375 0.9050876696251375)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 12 15)
"cameras/drone/drone1" SET Transform localScale (0.8049573454639971 0.8049573454639971 0.8049573454639971)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7780023289340963 0)
"cameras" SET Transform eulerAngles (15.528972593612707 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3496404994473832
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.898620456009445
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07988451130322947
"cameras/drone/drone0" SET Transform localPosition (-0.025042793057529655 0.00010326731336945949 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.13517025906883817 1.1929525742706328 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 8 14)
"cameras/drone/drone0" SET Transform localScale (1.347823268003841 1.347823268003841 1.347823268003841)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 1 -15)
"cameras/drone/drone1" SET Transform localScale (1.4017626248209933 1.4017626248209933 1.4017626248209933)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.354936391577738 0)
"cameras" SET Transform eulerAngles (-16.118522690389927 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6079121455676141
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3156627069921611
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11531297808194295
"cameras/drone/drone0" SET Transform localPosition (-0.5066870188087852 0.018006711767322325 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4985570863460378 1.210685296589984 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -1 -3)
"cameras/drone/drone0" SET Transform localScale (0.7642259857711954 0.7642259857711954 0.7642259857711954)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 5 10)
"cameras/drone/drone1" SET Transform localScale (0.9239049071897134 0.9239049071897134 0.9239049071897134)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.137054769395376 0)
"cameras" SET Transform eulerAngles (10.19375754616522 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.582092022651787
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.376341710380713
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36186244222079533
"cameras/drone/drone0" SET Transform localPosition (-0.8567497827396313 0.052403297058299325 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8508930287913354 1.1096096087972578 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 9 -6)
"cameras/drone/drone0" SET Transform localScale (1.417840948726889 1.417840948726889 1.417840948726889)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -3 1)
"cameras/drone/drone1" SET Transform localScale (1.1858952916651608 1.1858952916651608 1.1858952916651608)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.616209911700912 0)
"cameras" SET Transform eulerAngles (-15.168993909141758 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3468715931776
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6178104585337234
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.010641395175929259
"cameras/drone/drone0" SET Transform localPosition (-1.177187812961831 0.21795138899870387 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6776311222745701 1.1871912956799773 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -20 -3)
"cameras/drone/drone0" SET Transform localScale (1.242743174918754 1.242743174918754 1.242743174918754)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 9 -5)
"cameras/drone/drone1" SET Transform localScale (0.6714282085325194 0.6714282085325194 0.6714282085325194)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.946688748723172 0)
"cameras" SET Transform eulerAngles (9.923288889825791 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9710894017947499
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8456520051062713
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025783693622924986
"cameras/drone/drone0" SET Transform localPosition (-0.02711398978138413 0.5410259999950411 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0825471985407715 0.9615789181534502 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -17 -14)
"cameras/drone/drone0" SET Transform localScale (1.4871748311781428 1.4871748311781428 1.4871748311781428)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -4 4)
"cameras/drone/drone1" SET Transform localScale (1.24770768171881 1.24770768171881 1.24770768171881)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.191865888577543 0)
"cameras" SET Transform eulerAngles (-11.74741904655557 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48504617117757565
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.888726580723142
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18212156206329222
"cameras/drone/drone0" SET Transform localPosition (-1.0980299335204593 0.43426872955317825 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1532730968934557 0.8824695965576141 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -17 -12)
"cameras/drone/drone0" SET Transform localScale (0.8510769261629698 0.8510769261629698 0.8510769261629698)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -11 20)
"cameras/drone/drone1" SET Transform localScale (0.9008872504943468 0.9008872504943468 0.9008872504943468)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.38524986899259 0)
"cameras" SET Transform eulerAngles (-17.411734542335022 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.520361935654617
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.177145938232589
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35734079202460456
"cameras/drone/drone0" SET Transform localPosition (1.1517250120138531 0.5473304930458949 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2821157264170734 1.213735020679213 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 0 -14)
"cameras/drone/drone0" SET Transform localScale (0.7461518140881762 0.7461518140881762 0.7461518140881762)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -7 5)
"cameras/drone/drone1" SET Transform localScale (1.2552458777196205 1.2552458777196205 1.2552458777196205)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.847013987786131 0)
"cameras" SET Transform eulerAngles (-1.6698989528107866 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5708075877236771
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.198868474840738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28326921783860737
"cameras/drone/drone0" SET Transform localPosition (-0.7420552821853847 -0.13095210490493142 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0301312857372662 0.8651810417014315 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 0 -15)
"cameras/drone/drone0" SET Transform localScale (1.4983560592679868 1.4983560592679868 1.4983560592679868)
"cameras/drone/drone1" SET Transform localEulerAngles (19 3 -18)
"cameras/drone/drone1" SET Transform localScale (1.1092431697756489 1.1092431697756489 1.1092431697756489)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.05943100793994 0)
"cameras" SET Transform eulerAngles (-17.32810753639688 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.30198264726772
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5278988138908463
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.033827704879526264
"cameras/drone/drone0" SET Transform localPosition (0.5785325799279015 0.4067194082818815 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.394366903475474 0.9307056080643566 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -1 -10)
"cameras/drone/drone0" SET Transform localScale (0.6789056205735597 0.6789056205735597 0.6789056205735597)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -1 11)
"cameras/drone/drone1" SET Transform localScale (1.3943854257644341 1.3943854257644341 1.3943854257644341)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.817620028052924 0)
"cameras" SET Transform eulerAngles (14.641061195251133 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4270829888914154
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4766328388819205
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11723471412295985
"cameras/drone/drone0" SET Transform localPosition (1.1885463439409423 0.183643516399345 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0145534297740137 0.9424381282522897 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -5 -3)
"cameras/drone/drone0" SET Transform localScale (1.348443249599255 1.348443249599255 1.348443249599255)
"cameras/drone/drone1" SET Transform localEulerAngles (19 5 -4)
"cameras/drone/drone1" SET Transform localScale (0.9554055632125125 0.9554055632125125 0.9554055632125125)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.18143257918235 0)
"cameras" SET Transform eulerAngles (-5.726696388032352 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2534444945157892
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1790684120036328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22888720497869997
"cameras/drone/drone0" SET Transform localPosition (0.47221729485768504 0.6379468749224189 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8358718429024774 0.9554984749296348 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 11 -4)
"cameras/drone/drone0" SET Transform localScale (1.434415364335396 1.434415364335396 1.434415364335396)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 8 19)
"cameras/drone/drone1" SET Transform localScale (1.43727035937376 1.43727035937376 1.43727035937376)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.188403440201419 0)
"cameras" SET Transform eulerAngles (9.699089488049694 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4605600199827332
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.660334010409636
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1801924277507214
"cameras/drone/drone0" SET Transform localPosition (-0.6031519116399525 0.3730256752155798 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.007797531342648156 0.8729128394194842 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -20 18)
"cameras/drone/drone0" SET Transform localScale (1.1310110978734524 1.1310110978734524 1.1310110978734524)
"cameras/drone/drone1" SET Transform localEulerAngles (3 9 2)
"cameras/drone/drone1" SET Transform localScale (1.4209037297799207 1.4209037297799207 1.4209037297799207)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.509092506638559 0)
"cameras" SET Transform eulerAngles (-1.5828779719142645 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.488115296970733
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9621168187388667
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3900297113264599
"cameras/drone/drone0" SET Transform localPosition (-0.8315434661359363 0.5134078360953256 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8946418505196578 0.9046958304068269 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -3 -10)
"cameras/drone/drone0" SET Transform localScale (0.9260374541509054 0.9260374541509054 0.9260374541509054)
"cameras/drone/drone1" SET Transform localEulerAngles (14 17 3)
"cameras/drone/drone1" SET Transform localScale (0.8120712592070345 0.8120712592070345 0.8120712592070345)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.034871768917521 0)
"cameras" SET Transform eulerAngles (4.954180989223062 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6443626247550788
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2752290360869813
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10461312620931636
"cameras/drone/drone0" SET Transform localPosition (-0.20226787249386902 -0.25063624947770907 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0333327124652778 1.2904408050043372 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -10 -3)
"cameras/drone/drone0" SET Transform localScale (1.2630224726454586 1.2630224726454586 1.2630224726454586)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -8 -19)
"cameras/drone/drone1" SET Transform localScale (1.2111668920045928 1.2111668920045928 1.2111668920045928)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0612242000200958 0)
"cameras" SET Transform eulerAngles (7.502085032677137 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2860350900721471
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1176424701169385
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2580878330831402
"cameras/drone/drone0" SET Transform localPosition (0.9618031452080553 0.5364078797378464 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08305043448177796 0.8051038446277076 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -17 15)
"cameras/drone/drone0" SET Transform localScale (0.8164772127250367 0.8164772127250367 0.8164772127250367)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -16 0)
"cameras/drone/drone1" SET Transform localScale (0.9491866240280415 0.9491866240280415 0.9491866240280415)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.162138694213086 0)
"cameras" SET Transform eulerAngles (-16.95728575323276 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3972043743523503
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4710731030493125
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07804572183094241
"cameras/drone/drone0" SET Transform localPosition (0.6098676585522711 0.04180125978833221 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.028667208915105 1.0529860116643524 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -10 -7)
"cameras/drone/drone0" SET Transform localScale (0.7138465932810067 0.7138465932810067 0.7138465932810067)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -19 9)
"cameras/drone/drone1" SET Transform localScale (0.7591894711728829 0.7591894711728829 0.7591894711728829)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.560021671612681 0)
"cameras" SET Transform eulerAngles (-1.486203832859477 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5020676278140266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4364373282780574
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3372617961811307
"cameras/drone/drone0" SET Transform localPosition (-0.4206196580190489 -0.003034852086461981 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5956289659075434 0.8966070269249209 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 10 0)
"cameras/drone/drone0" SET Transform localScale (1.4338315018558512 1.4338315018558512 1.4338315018558512)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -11 15)
"cameras/drone/drone1" SET Transform localScale (0.8202227547789622 0.8202227547789622 0.8202227547789622)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5177776759498913 0)
"cameras" SET Transform eulerAngles (18.866496965926373 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6644578302987887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.524708063431659
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.335225683996971
"cameras/drone/drone0" SET Transform localPosition (-0.41007666218096694 0.3973895051828182 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.721688649338343 0.9363713541212461 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 7 5)
"cameras/drone/drone0" SET Transform localScale (0.7399710920030143 0.7399710920030143 0.7399710920030143)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -15 4)
"cameras/drone/drone1" SET Transform localScale (0.8309742148758209 0.8309742148758209 0.8309742148758209)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4114352752327495 0)
"cameras" SET Transform eulerAngles (-5.885430193269855 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9698049857297925
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1269844602931356
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38388793646986735
"cameras/drone/drone0" SET Transform localPosition (-0.2594089894546209 -0.12580151635509967 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.34136117532837296 0.973110259308069 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -6 -16)
"cameras/drone/drone0" SET Transform localScale (1.2344109452490701 1.2344109452490701 1.2344109452490701)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -5 -14)
"cameras/drone/drone1" SET Transform localScale (0.9769232085299997 0.9769232085299997 0.9769232085299997)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.842700636088146 0)
"cameras" SET Transform eulerAngles (-8.78373388944964 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0477696720349665
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9091592962260171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13337874095817895
"cameras/drone/drone0" SET Transform localPosition (-0.20108176699492153 -0.0365131516708615 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7579472770099578 1.2113168765849958 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -10 0)
"cameras/drone/drone0" SET Transform localScale (1.4477721779465322 1.4477721779465322 1.4477721779465322)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -9 -3)
"cameras/drone/drone1" SET Transform localScale (0.7321294453587619 0.7321294453587619 0.7321294453587619)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.625798463313479 0)
"cameras" SET Transform eulerAngles (11.365526522615582 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6251978291634126
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.677161165689323
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16209241235699015
"cameras/drone/drone0" SET Transform localPosition (-0.3660099974730874 0.5581719923762312 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17206038928145762 0.8499912870341269 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -9 12)
"cameras/drone/drone0" SET Transform localScale (1.1083847926753767 1.1083847926753767 1.1083847926753767)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -2 11)
"cameras/drone/drone1" SET Transform localScale (1.1688864463711544 1.1688864463711544 1.1688864463711544)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.341733717026816 0)
"cameras" SET Transform eulerAngles (-15.559259194227032 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4279801556387466
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.589409934581671
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05279733213600327
"cameras/drone/drone0" SET Transform localPosition (-0.30339463792961274 0.14046610541325116 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8414358241069386 1.0066379146452475 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -9 15)
"cameras/drone/drone0" SET Transform localScale (1.0514394029126242 1.0514394029126242 1.0514394029126242)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -12 -19)
"cameras/drone/drone1" SET Transform localScale (0.9671201199278252 0.9671201199278252 0.9671201199278252)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8412810503912755 0)
"cameras" SET Transform eulerAngles (14.55556758456202 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3525124820971004
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.660966453001643
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2524852343277941
"cameras/drone/drone0" SET Transform localPosition (-0.656255665481663 0.06550827554643707 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.007378936138877634 0.9176437626809727 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 10 -16)
"cameras/drone/drone0" SET Transform localScale (1.1748984152033015 1.1748984152033015 1.1748984152033015)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 13 -20)
"cameras/drone/drone1" SET Transform localScale (0.8859666839151742 0.8859666839151742 0.8859666839151742)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.282598857448238 0)
"cameras" SET Transform eulerAngles (12.231457522523755 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.456819701569093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4087261869312908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3977438459653033
"cameras/drone/drone0" SET Transform localPosition (1.1351247877092214 -0.2502305421121907 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.42620884825538063 1.1500306821000525 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 7 6)
"cameras/drone/drone0" SET Transform localScale (1.450057148929755 1.450057148929755 1.450057148929755)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -1 10)
"cameras/drone/drone1" SET Transform localScale (0.6877860932495063 0.6877860932495063 0.6877860932495063)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.942079378988809 0)
"cameras" SET Transform eulerAngles (9.791242921231195 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1267346982725395
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3894879670119222
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3988703766596826
"cameras/drone/drone0" SET Transform localPosition (1.1983308175866865 -0.12624592412546537 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4091946331740115 1.2161618087499324 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 3 19)
"cameras/drone/drone0" SET Transform localScale (0.6799649241805642 0.6799649241805642 0.6799649241805642)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -6 8)
"cameras/drone/drone1" SET Transform localScale (0.6203583365094177 0.6203583365094177 0.6203583365094177)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0098262981871686 0)
"cameras" SET Transform eulerAngles (7.214603624707706 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.332076990038771
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1085976179069392
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20201852189390782
"cameras/drone/drone0" SET Transform localPosition (0.6784946527123839 -0.29143994635366005 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1459812397788705 0.8297400592190064 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -2 17)
"cameras/drone/drone0" SET Transform localScale (0.8594950874276787 0.8594950874276787 0.8594950874276787)
"cameras/drone/drone1" SET Transform localEulerAngles (8 10 0)
"cameras/drone/drone1" SET Transform localScale (1.03990046282441 1.03990046282441 1.03990046282441)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7975933292236324 0)
"cameras" SET Transform eulerAngles (8.641195048611685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6245383492997858
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9366192419359216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.030912884125930653
"cameras/drone/drone0" SET Transform localPosition (-0.123094160242601 0.2448628066910577 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.852083864498401 0.9929552400753698 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 6 -9)
"cameras/drone/drone0" SET Transform localScale (0.7676803781231212 0.7676803781231212 0.7676803781231212)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -9 9)
"cameras/drone/drone1" SET Transform localScale (0.9781707279566575 0.9781707279566575 0.9781707279566575)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2742338986611754 0)
"cameras" SET Transform eulerAngles (11.554923413559074 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2138523019366185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8356092414741396
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39422690580044567
"cameras/drone/drone0" SET Transform localPosition (-0.32866728351447116 0.09988380924906698 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.583406687306776 0.9337241514783117 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 18 3)
"cameras/drone/drone0" SET Transform localScale (1.472996178151464 1.472996178151464 1.472996178151464)
"cameras/drone/drone1" SET Transform localEulerAngles (19 12 -2)
"cameras/drone/drone1" SET Transform localScale (0.6460262726263571 0.6460262726263571 0.6460262726263571)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.398943632516324 0)
"cameras" SET Transform eulerAngles (-16.29287185899186 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9950163282253174
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0525707305302745
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3153549156971063
"cameras/drone/drone0" SET Transform localPosition (-0.4755035416548875 0.6642772854642385 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5813369907160606 0.8686973529032096 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -1 -4)
"cameras/drone/drone0" SET Transform localScale (0.9648350010933234 0.9648350010933234 0.9648350010933234)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -6 15)
"cameras/drone/drone1" SET Transform localScale (1.1987095283440123 1.1987095283440123 1.1987095283440123)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.854710852656691 0)
"cameras" SET Transform eulerAngles (-15.833993027972495 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.347692561904596
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9293068709552097
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2630694220029429
"cameras/drone/drone0" SET Transform localPosition (1.0322561539577177 0.3548633282650075 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7745589239258277 1.264119072275342 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -10 10)
"cameras/drone/drone0" SET Transform localScale (1.1701710695747294 1.1701710695747294 1.1701710695747294)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -3 -2)
"cameras/drone/drone1" SET Transform localScale (0.6273539355903268 0.6273539355903268 0.6273539355903268)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.696628830817434 0)
"cameras" SET Transform eulerAngles (-4.681152585687812 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4262749322793016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0224368870455907
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1450841119973581
"cameras/drone/drone0" SET Transform localPosition (-1.1505231324851535 -0.17946107304438003 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7759204852606698 0.8268705724023255 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 4 -17)
"cameras/drone/drone0" SET Transform localScale (1.2127095063755124 1.2127095063755124 1.2127095063755124)
"cameras/drone/drone1" SET Transform localEulerAngles (9 19 -1)
"cameras/drone/drone1" SET Transform localScale (1.0698251845024962 1.0698251845024962 1.0698251845024962)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.917142006522461 0)
"cameras" SET Transform eulerAngles (-19.29244270652798 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9701558250713549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8256484247153406
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30033975969536797
"cameras/drone/drone0" SET Transform localPosition (-0.6481345883775002 -0.06509637293233811 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.964982248547579 1.1273925839010746 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -7 2)
"cameras/drone/drone0" SET Transform localScale (0.7978733090617534 0.7978733090617534 0.7978733090617534)
"cameras/drone/drone1" SET Transform localEulerAngles (7 8 12)
"cameras/drone/drone1" SET Transform localScale (1.1808107068656089 1.1808107068656089 1.1808107068656089)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.145009820929666 0)
"cameras" SET Transform eulerAngles (2.2332278881168897 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.374147558702532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6225638106101417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17131765993698142
"cameras/drone/drone0" SET Transform localPosition (-0.8489799699579004 0.5258237835513586 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04510970508805667 0.8636254190418324 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -20 12)
"cameras/drone/drone0" SET Transform localScale (1.2389210326571112 1.2389210326571112 1.2389210326571112)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 17 12)
"cameras/drone/drone1" SET Transform localScale (1.2006524682717412 1.2006524682717412 1.2006524682717412)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4056233053003755 0)
"cameras" SET Transform eulerAngles (-8.613962988901394 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48984654476710265
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9226087750930372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19660571494913467
"cameras/drone/drone0" SET Transform localPosition (-0.9511046555788809 0.151999607578915 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3601086026139759 1.1506016910694066 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -12 -14)
"cameras/drone/drone0" SET Transform localScale (0.6871345315386804 0.6871345315386804 0.6871345315386804)
"cameras/drone/drone1" SET Transform localEulerAngles (1 3 -18)
"cameras/drone/drone1" SET Transform localScale (1.1161945647213019 1.1161945647213019 1.1161945647213019)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1891683889321207 0)
"cameras" SET Transform eulerAngles (-9.258482223200168 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0010157568246805
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9765769347508613
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3309707614665234
"cameras/drone/drone0" SET Transform localPosition (0.17820609939566312 0.6089137313253412 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9358924819820384 0.8555276595468588 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 17 -17)
"cameras/drone/drone0" SET Transform localScale (0.7800135730120865 0.7800135730120865 0.7800135730120865)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -10 -10)
"cameras/drone/drone1" SET Transform localScale (1.1093188247800798 1.1093188247800798 1.1093188247800798)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2125132547897266 0)
"cameras" SET Transform eulerAngles (-1.4221892705044752 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5923546818976422
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8744421658599066
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1941519784317055
"cameras/drone/drone0" SET Transform localPosition (0.16664856429174968 -0.23778160752186012 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9397658924040899 1.010036479368239 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 16 -6)
"cameras/drone/drone0" SET Transform localScale (1.2950348276836092 1.2950348276836092 1.2950348276836092)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 1 3)
"cameras/drone/drone1" SET Transform localScale (1.0550856710591643 1.0550856710591643 1.0550856710591643)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0081165381064667 0)
"cameras" SET Transform eulerAngles (-6.634843251514324 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.960450028337302
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.780361783739941
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.046192937430483964
"cameras/drone/drone0" SET Transform localPosition (-0.32153580354302114 0.25534640920394874 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9216633954406717 0.9642673617483253 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 17 7)
"cameras/drone/drone0" SET Transform localScale (0.7126405959919975 0.7126405959919975 0.7126405959919975)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -9 -13)
"cameras/drone/drone1" SET Transform localScale (1.4322629365458743 1.4322629365458743 1.4322629365458743)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.467548886954093 0)
"cameras" SET Transform eulerAngles (-10.891745693039505 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2661941854805547
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0111259306245184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20412375723451825
"cameras/drone/drone0" SET Transform localPosition (0.7238244460970165 -0.2986485714299782 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3020307677700217 1.156793474122293 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 15 11)
"cameras/drone/drone0" SET Transform localScale (1.3266827396788679 1.3266827396788679 1.3266827396788679)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -16 13)
"cameras/drone/drone1" SET Transform localScale (1.3769539100207484 1.3769539100207484 1.3769539100207484)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8318194963480385 0)
"cameras" SET Transform eulerAngles (-0.8877854563478422 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8477706451647982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.648851078948875
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22772374730128445
"cameras/drone/drone0" SET Transform localPosition (0.555305058730831 0.15453785359250666 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9373112814568765 1.029271469806456 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 8 -15)
"cameras/drone/drone0" SET Transform localScale (1.1826766913146245 1.1826766913146245 1.1826766913146245)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -8 -16)
"cameras/drone/drone1" SET Transform localScale (0.9375952900706066 0.9375952900706066 0.9375952900706066)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.054721269330805 0)
"cameras" SET Transform eulerAngles (18.48430109095385 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5186738385019964
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.130276298616071
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17431198317403596
"cameras/drone/drone0" SET Transform localPosition (-0.25467624675956146 -0.09100198992813607 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9765228692978447 0.9169273523278798 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 7 20)
"cameras/drone/drone0" SET Transform localScale (0.7334265829216033 0.7334265829216033 0.7334265829216033)
"cameras/drone/drone1" SET Transform localEulerAngles (0 9 17)
"cameras/drone/drone1" SET Transform localScale (1.055586158505267 1.055586158505267 1.055586158505267)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.284030291041563 0)
"cameras" SET Transform eulerAngles (-8.10771608124297 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8303709419962491
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5385607824161545
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05127882329328384
"cameras/drone/drone0" SET Transform localPosition (-0.5115092604634071 0.32607027948828354 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.04682048054820953 0.9881356179479023 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 19 16)
"cameras/drone/drone0" SET Transform localScale (1.0113106935474416 1.0113106935474416 1.0113106935474416)
"cameras/drone/drone1" SET Transform localEulerAngles (10 15 20)
"cameras/drone/drone1" SET Transform localScale (1.3882261063804524 1.3882261063804524 1.3882261063804524)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.962291892504258 0)
"cameras" SET Transform eulerAngles (6.0873399342179795 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.194336034037055
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.334148536389333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12971898883001284
"cameras/drone/drone0" SET Transform localPosition (0.85689010348561 -0.10903838704802876 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1671454369304546 1.0298584554254215 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 14 4)
"cameras/drone/drone0" SET Transform localScale (0.9799038521088 0.9799038521088 0.9799038521088)
"cameras/drone/drone1" SET Transform localEulerAngles (10 8 0)
"cameras/drone/drone1" SET Transform localScale (1.155174504333795 1.155174504333795 1.155174504333795)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.27990832664567 0)
"cameras" SET Transform eulerAngles (-4.072826330015555 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7474062529964536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.91138377644108
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33635217089944947
"cameras/drone/drone0" SET Transform localPosition (-0.8164679310112903 0.38713617605922995 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.875804771984001 1.0536093786471181 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 11 -6)
"cameras/drone/drone0" SET Transform localScale (1.0854142999193135 1.0854142999193135 1.0854142999193135)
"cameras/drone/drone1" SET Transform localEulerAngles (2 2 -18)
"cameras/drone/drone1" SET Transform localScale (1.058539979385782 1.058539979385782 1.058539979385782)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.810491015397262 0)
"cameras" SET Transform eulerAngles (-6.658948075990011 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3760703401396164
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9212014299236537
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23579394749883936
"cameras/drone/drone0" SET Transform localPosition (0.43673875434866183 0.23694246129919666 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1558351040340435 1.2133351018301404 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -15 19)
"cameras/drone/drone0" SET Transform localScale (0.620007116345385 0.620007116345385 0.620007116345385)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -4 -8)
"cameras/drone/drone1" SET Transform localScale (1.38169963223147 1.38169963223147 1.38169963223147)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.921602081320938 0)
"cameras" SET Transform eulerAngles (17.283681715223196 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8529341663632721
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2964746028250074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04041902860188862
"cameras/drone/drone0" SET Transform localPosition (-0.5821032849220132 0.3507006234724291 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6914861799475959 1.1549595638046741 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 11 15)
"cameras/drone/drone0" SET Transform localScale (0.8368940547963117 0.8368940547963117 0.8368940547963117)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -15 -11)
"cameras/drone/drone1" SET Transform localScale (1.0749781940197343 1.0749781940197343 1.0749781940197343)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0685752365504637 0)
"cameras" SET Transform eulerAngles (3.9488931132605387 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2451378085976403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6482502272644854
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13190711894446228
"cameras/drone/drone0" SET Transform localPosition (0.3106762625525916 0.40609983906283836 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06807080305479829 1.1489839195874059 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 19 -4)
"cameras/drone/drone0" SET Transform localScale (0.8361570575937671 0.8361570575937671 0.8361570575937671)
"cameras/drone/drone1" SET Transform localEulerAngles (20 0 -18)
"cameras/drone/drone1" SET Transform localScale (0.9206580721652954 0.9206580721652954 0.9206580721652954)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3740686478642594 0)
"cameras" SET Transform eulerAngles (12.465122756238827 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0456039495186955
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.288816109729588
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06720366440749861
"cameras/drone/drone0" SET Transform localPosition (-0.3066375847339283 0.24277407506819965 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03249115188545959 1.0232151273057821 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -8 18)
"cameras/drone/drone0" SET Transform localScale (0.8448170802627328 0.8448170802627328 0.8448170802627328)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -16 -4)
"cameras/drone/drone1" SET Transform localScale (0.9894942177608117 0.9894942177608117 0.9894942177608117)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.72574203783023 0)
"cameras" SET Transform eulerAngles (-12.854624721637812 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5411398158379672
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4156253837065353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3454757991625583
"cameras/drone/drone0" SET Transform localPosition (-1.086121445899572 0.11768270274028009 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1100284295265024 0.9279151821284155 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -7 4)
"cameras/drone/drone0" SET Transform localScale (1.3426414645655274 1.3426414645655274 1.3426414645655274)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 6 5)
"cameras/drone/drone1" SET Transform localScale (1.4027172830360288 1.4027172830360288 1.4027172830360288)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5597016056897317 0)
"cameras" SET Transform eulerAngles (-2.684783308084132 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5118072867755372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2365220413083526
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09033689213039078
"cameras/drone/drone0" SET Transform localPosition (0.03545413723474167 0.30487976831791547 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06487648572595472 1.1692442761729351 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -14 -19)
"cameras/drone/drone0" SET Transform localScale (1.0690012633096497 1.0690012633096497 1.0690012633096497)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -6 -1)
"cameras/drone/drone1" SET Transform localScale (1.346712359452087 1.346712359452087 1.346712359452087)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6615648639213587 0)
"cameras" SET Transform eulerAngles (17.866513048437852 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6281346455554231
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0626178024158133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.016021198353361712
"cameras/drone/drone0" SET Transform localPosition (0.7151694205430819 0.5573292494047548 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.824309560384062 0.9920529135505562 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -1 4)
"cameras/drone/drone0" SET Transform localScale (1.149893613868235 1.149893613868235 1.149893613868235)
"cameras/drone/drone1" SET Transform localEulerAngles (19 12 15)
"cameras/drone/drone1" SET Transform localScale (1.4974867038029767 1.4974867038029767 1.4974867038029767)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.239046313427578 0)
"cameras" SET Transform eulerAngles (-2.470292205953154 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4175539305656455
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6181741270848158
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31008185352137463
"cameras/drone/drone0" SET Transform localPosition (-0.6080952201468486 0.11229645656844384 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5409665652529971 1.1078213427258699 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -17 9)
"cameras/drone/drone0" SET Transform localScale (1.4166873796875123 1.4166873796875123 1.4166873796875123)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -10 5)
"cameras/drone/drone1" SET Transform localScale (1.1816489128788539 1.1816489128788539 1.1816489128788539)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.739162239213174 0)
"cameras" SET Transform eulerAngles (-17.63362007395203 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3752024028099368
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9887137016107402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39803765519224393
"cameras/drone/drone0" SET Transform localPosition (0.9895886842529793 0.5688393570706447 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.550239146227756 0.8282294306514528 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -3 9)
"cameras/drone/drone0" SET Transform localScale (1.4979449369885245 1.4979449369885245 1.4979449369885245)
"cameras/drone/drone1" SET Transform localEulerAngles (4 14 -5)
"cameras/drone/drone1" SET Transform localScale (0.9495420456426653 0.9495420456426653 0.9495420456426653)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.456390571862206 0)
"cameras" SET Transform eulerAngles (1.2526644491941994 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4864982461042562
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.819196298190159
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10128179003502247
"cameras/drone/drone0" SET Transform localPosition (-0.1845066562409592 0.4346045384328891 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7968327606575776 1.2466130708066 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -12 4)
"cameras/drone/drone0" SET Transform localScale (0.819411245720186 0.819411245720186 0.819411245720186)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -17 1)
"cameras/drone/drone1" SET Transform localScale (1.418820997341096 1.418820997341096 1.418820997341096)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9316819493322974 0)
"cameras" SET Transform eulerAngles (-7.925035970619621 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6121556496851692
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1327279339198255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21481444835513994
"cameras/drone/drone0" SET Transform localPosition (-0.4978895537857444 -0.04578695334056787 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19775401115408453 0.8686059809059705 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -4 3)
"cameras/drone/drone0" SET Transform localScale (1.2457303135371136 1.2457303135371136 1.2457303135371136)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 19 11)
"cameras/drone/drone1" SET Transform localScale (0.8703167350847115 0.8703167350847115 0.8703167350847115)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
