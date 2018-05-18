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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 165 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 30 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 89 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 42 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-4.436166507731663 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 62
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.925285671039623 0)
"cameras" SET Transform eulerAngles (15.120086090937221 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.435917433881094
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6750446712210532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.172120316104665
"cameras/drone/drone0" SET Transform localPosition (-0.3748650522060928 0.4185688110712545 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.078958902597453 1.0611578752355342 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 1 -12)
"cameras/drone/drone0" SET Transform localScale (0.7832854991175532 0.7832854991175532 0.7832854991175532)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -14 17)
"cameras/drone/drone1" SET Transform localScale (0.9024693816919773 0.9024693816919773 0.9024693816919773)
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
"cameras" SET Transform position (0 3.95087080279927 0)
"cameras" SET Transform eulerAngles (-18.431413888630214 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9743912916107061
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.964956244012467
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38351535263466435
"cameras/drone/drone0" SET Transform localPosition (-0.10401405173272904 0.24147180738661062 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8474358601422849 0.8434063231802909 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 17 6)
"cameras/drone/drone0" SET Transform localScale (1.0217542885421291 1.0217542885421291 1.0217542885421291)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -13 -10)
"cameras/drone/drone1" SET Transform localScale (1.3673035997852816 1.3673035997852816 1.3673035997852816)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0942323616153 0)
"cameras" SET Transform eulerAngles (-14.337696438224672 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5905427606929209
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.178040207501738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14850557837797815
"cameras/drone/drone0" SET Transform localPosition (1.13932551404157 0.1320579142462997 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16369749873562678 0.8550270354836828 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -15 11)
"cameras/drone/drone0" SET Transform localScale (1.2929262119828624 1.2929262119828624 1.2929262119828624)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -3 -18)
"cameras/drone/drone1" SET Transform localScale (0.9383242636289364 0.9383242636289364 0.9383242636289364)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4915938022796724 0)
"cameras" SET Transform eulerAngles (-4.998549428812854 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9726912857954125
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2764906544524854
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18703338172617615
"cameras/drone/drone0" SET Transform localPosition (0.2626568734544119 -0.07590909402948448 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9670274694660261 0.9152431260661957 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 19 3)
"cameras/drone/drone0" SET Transform localScale (1.4168455778882643 1.4168455778882643 1.4168455778882643)
"cameras/drone/drone1" SET Transform localEulerAngles (18 7 0)
"cameras/drone/drone1" SET Transform localScale (0.6179179900665502 0.6179179900665502 0.6179179900665502)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.834386831155711 0)
"cameras" SET Transform eulerAngles (-7.6146701639510805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0619640411285864
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.196894081993459
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34101529767771277
"cameras/drone/drone0" SET Transform localPosition (-0.14554022627030072 0.5106108434108731 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3170080121715635 0.8252419219657381 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -15 7)
"cameras/drone/drone0" SET Transform localScale (0.7546252309691182 0.7546252309691182 0.7546252309691182)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -7 -10)
"cameras/drone/drone1" SET Transform localScale (0.9710535614595379 0.9710535614595379 0.9710535614595379)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.632077381268949 0)
"cameras" SET Transform eulerAngles (16.117424222612996 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1956034500395674
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6324126713051665
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06994592686706268
"cameras/drone/drone0" SET Transform localPosition (-0.4592486628096627 0.6400731594217388 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4896157751608069 1.1154242271734405 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 20 13)
"cameras/drone/drone0" SET Transform localScale (1.3936593022917994 1.3936593022917994 1.3936593022917994)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -16 18)
"cameras/drone/drone1" SET Transform localScale (0.9101572605545614 0.9101572605545614 0.9101572605545614)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5378954537149925 0)
"cameras" SET Transform eulerAngles (18.847980999976485 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5951681443820798
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5019282746872293
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20650713290845946
"cameras/drone/drone0" SET Transform localPosition (-0.7465344277743196 0.025983470286836285 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11891690299386304 0.8812912074397636 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -14 -6)
"cameras/drone/drone0" SET Transform localScale (0.7425360496822098 0.7425360496822098 0.7425360496822098)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 3 -11)
"cameras/drone/drone1" SET Transform localScale (1.1861140404249948 1.1861140404249948 1.1861140404249948)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1903816961194136 0)
"cameras" SET Transform eulerAngles (14.396019610640508 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4001014407739527
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9780999616297384
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0649694853618771
"cameras/drone/drone0" SET Transform localPosition (-0.47867710249724793 -0.12788500338863945 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.085910563707327 0.8958194593132938 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -19 18)
"cameras/drone/drone0" SET Transform localScale (0.8738533584669799 0.8738533584669799 0.8738533584669799)
"cameras/drone/drone1" SET Transform localEulerAngles (6 1 15)
"cameras/drone/drone1" SET Transform localScale (0.6449366196867184 0.6449366196867184 0.6449366196867184)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8483075934991513 0)
"cameras" SET Transform eulerAngles (19.649108218133392 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4111412638562104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.999712138942984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2865208261924519
"cameras/drone/drone0" SET Transform localPosition (-0.6380789965069461 0.2342028539353153 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.15454255674755712 0.8732281119049341 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -9 -1)
"cameras/drone/drone0" SET Transform localScale (0.9577169937236574 0.9577169937236574 0.9577169937236574)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -14 20)
"cameras/drone/drone1" SET Transform localScale (0.6070586353139975 0.6070586353139975 0.6070586353139975)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.264967479285428 0)
"cameras" SET Transform eulerAngles (-17.602343359594002 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7076781688138217
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4990969817951882
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08189759083261175
"cameras/drone/drone0" SET Transform localPosition (0.8581267869815445 0.3960778126188533 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3379067499829437 0.8516836979433271 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -10 -7)
"cameras/drone/drone0" SET Transform localScale (0.9593153199669299 0.9593153199669299 0.9593153199669299)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -5 -14)
"cameras/drone/drone1" SET Transform localScale (1.1057690559591982 1.1057690559591982 1.1057690559591982)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6446316130313345 0)
"cameras" SET Transform eulerAngles (-17.072097801648283 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.179565082058024
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4378303164029673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20934617734194594
"cameras/drone/drone0" SET Transform localPosition (-0.9907145754843381 0.17528513402742557 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7929750626648482 1.0317061302037076 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -14 14)
"cameras/drone/drone0" SET Transform localScale (1.28580481902228 1.28580481902228 1.28580481902228)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -3 -4)
"cameras/drone/drone1" SET Transform localScale (1.3977411608280361 1.3977411608280361 1.3977411608280361)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.533952724489329 0)
"cameras" SET Transform eulerAngles (-10.479959839586325 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0686754093010047
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1256453232031045
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1091084980879606
"cameras/drone/drone0" SET Transform localPosition (-0.13084126409163033 0.546858082915971 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7521963404136532 1.164774171538959 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -4 17)
"cameras/drone/drone0" SET Transform localScale (1.4328706193448555 1.4328706193448555 1.4328706193448555)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -7 -16)
"cameras/drone/drone1" SET Transform localScale (0.8640107675775934 0.8640107675775934 0.8640107675775934)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.02419697115955 0)
"cameras" SET Transform eulerAngles (11.170877875936803 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46782151036804054
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.100056396568404
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0006254868608365438
"cameras/drone/drone0" SET Transform localPosition (1.1249368507872266 0.606973181048825 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5336830007422007 1.1444981551903208 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -11 -8)
"cameras/drone/drone0" SET Transform localScale (0.9757848094209574 0.9757848094209574 0.9757848094209574)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 20 7)
"cameras/drone/drone1" SET Transform localScale (1.1014811734443644 1.1014811734443644 1.1014811734443644)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4434550097151124 0)
"cameras" SET Transform eulerAngles (-17.597742461645673 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5529083913715171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8689450396048168
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2463012810641112
"cameras/drone/drone0" SET Transform localPosition (1.1384548912995982 -0.16530691024314886 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.15847990499791642 1.1764393064576062 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 8 -16)
"cameras/drone/drone0" SET Transform localScale (0.6409565514819974 0.6409565514819974 0.6409565514819974)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -14 16)
"cameras/drone/drone1" SET Transform localScale (0.6346193960771519 0.6346193960771519 0.6346193960771519)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5696013346970705 0)
"cameras" SET Transform eulerAngles (-19.08408892009124 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4683555881262462
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2881184570896411
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2720212191791979
"cameras/drone/drone0" SET Transform localPosition (-1.0661173486704902 0.3748559437691736 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4054914157517173 0.8962725268474638 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -3 -6)
"cameras/drone/drone0" SET Transform localScale (1.3445268609742804 1.3445268609742804 1.3445268609742804)
"cameras/drone/drone1" SET Transform localEulerAngles (20 7 -20)
"cameras/drone/drone1" SET Transform localScale (1.3946643927697329 1.3946643927697329 1.3946643927697329)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1734996139045384 0)
"cameras" SET Transform eulerAngles (18.080412258598052 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1382083919834507
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2228391663037796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19880296157389168
"cameras/drone/drone0" SET Transform localPosition (0.14540124527172593 -0.239951447473217 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4953319090719748 1.253013247076416 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 11 4)
"cameras/drone/drone0" SET Transform localScale (1.0957135104153053 1.0957135104153053 1.0957135104153053)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 3 6)
"cameras/drone/drone1" SET Transform localScale (0.9944757892626728 0.9944757892626728 0.9944757892626728)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8655022802215404 0)
"cameras" SET Transform eulerAngles (4.300250278747249 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43919525628383144
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0191100374100515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36798223196936497
"cameras/drone/drone0" SET Transform localPosition (0.7657083870109449 0.034580834865016896 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8246747503845324 0.9085675947988183 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -2 -17)
"cameras/drone/drone0" SET Transform localScale (1.0663544207977633 1.0663544207977633 1.0663544207977633)
"cameras/drone/drone1" SET Transform localEulerAngles (2 0 -13)
"cameras/drone/drone1" SET Transform localScale (1.0854692537717059 1.0854692537717059 1.0854692537717059)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8379442539622795 0)
"cameras" SET Transform eulerAngles (-19.845800605398594 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.147520271261853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5459995035324412
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14865026742911414
"cameras/drone/drone0" SET Transform localPosition (0.6608164471588325 0.5625238352857005 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1933540899310497 1.0120162037630664 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 10 -6)
"cameras/drone/drone0" SET Transform localScale (0.9947284394353018 0.9947284394353018 0.9947284394353018)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 15 -7)
"cameras/drone/drone1" SET Transform localScale (0.967202767920074 0.967202767920074 0.967202767920074)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8942546066290378 0)
"cameras" SET Transform eulerAngles (1.0774901445907474 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1743066985319035
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2084693870453438
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18676053544511464
"cameras/drone/drone0" SET Transform localPosition (-0.4530960149556823 -0.1695383410872367 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8301051328704778 0.9574281165877913 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -13 -15)
"cameras/drone/drone0" SET Transform localScale (0.9625629128729225 0.9625629128729225 0.9625629128729225)
"cameras/drone/drone1" SET Transform localEulerAngles (5 11 13)
"cameras/drone/drone1" SET Transform localScale (1.4111675815609341 1.4111675815609341 1.4111675815609341)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5008563271975826 0)
"cameras" SET Transform eulerAngles (-12.825674573164134 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9662102276306124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1721857988716342
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3886224845025204
"cameras/drone/drone0" SET Transform localPosition (-0.08770269026096766 0.13073925261519465 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.47845666768246464 1.225469017708294 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -10 13)
"cameras/drone/drone0" SET Transform localScale (0.7918751346160304 0.7918751346160304 0.7918751346160304)
"cameras/drone/drone1" SET Transform localEulerAngles (9 7 -17)
"cameras/drone/drone1" SET Transform localScale (1.0116423993411092 1.0116423993411092 1.0116423993411092)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.136865061476934 0)
"cameras" SET Transform eulerAngles (-1.1636590220176934 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7018078901807863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9341444765536084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09672752694896647
"cameras/drone/drone0" SET Transform localPosition (-0.053836678874362276 -0.062385961335757745 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5409667853540793 0.8533288952209679 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 17 -7)
"cameras/drone/drone0" SET Transform localScale (1.1200564818829721 1.1200564818829721 1.1200564818829721)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -4 18)
"cameras/drone/drone1" SET Transform localScale (0.9019127997296227 0.9019127997296227 0.9019127997296227)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1824671075949276 0)
"cameras" SET Transform eulerAngles (4.949483280814 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7043307534065673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0618469874164997
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0011901805079072682
"cameras/drone/drone0" SET Transform localPosition (0.3860728940553546 -0.1597255576201994 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8040577214871765 1.2202419024144033 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -1 -19)
"cameras/drone/drone0" SET Transform localScale (0.956816846346308 0.956816846346308 0.956816846346308)
"cameras/drone/drone1" SET Transform localEulerAngles (6 5 -10)
"cameras/drone/drone1" SET Transform localScale (0.7309285777895786 0.7309285777895786 0.7309285777895786)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.606579229981579 0)
"cameras" SET Transform eulerAngles (15.784123819341303 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.282494341828004
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9250921812492727
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18200281216601502
"cameras/drone/drone0" SET Transform localPosition (-0.5724129540918342 0.3872631745494958 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7286901425094632 0.8647512058955484 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -5 15)
"cameras/drone/drone0" SET Transform localScale (1.471958828498505 1.471958828498505 1.471958828498505)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -2 3)
"cameras/drone/drone1" SET Transform localScale (1.0795935331837856 1.0795935331837856 1.0795935331837856)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6077296564695285 0)
"cameras" SET Transform eulerAngles (-15.71479909759423 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5351517988400847
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.984744526400958
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28636964061973913
"cameras/drone/drone0" SET Transform localPosition (0.8921720585779178 0.14434213821385672 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.20049744116351342 0.932108599550671 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -6 12)
"cameras/drone/drone0" SET Transform localScale (1.0310821178991987 1.0310821178991987 1.0310821178991987)
"cameras/drone/drone1" SET Transform localEulerAngles (18 20 -14)
"cameras/drone/drone1" SET Transform localScale (0.8020114010606818 0.8020114010606818 0.8020114010606818)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4238943802235773 0)
"cameras" SET Transform eulerAngles (8.831330795686544 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5397414598497443
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3253016003441358
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19893992098007343
"cameras/drone/drone0" SET Transform localPosition (-1.192493660126947 0.3589059146824653 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0980482018694409 1.1189647497505253 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -3 18)
"cameras/drone/drone0" SET Transform localScale (1.0231325742919135 1.0231325742919135 1.0231325742919135)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -2 12)
"cameras/drone/drone1" SET Transform localScale (0.6043793099099009 0.6043793099099009 0.6043793099099009)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.788264805959184 0)
"cameras" SET Transform eulerAngles (-4.6510751605725975 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6149747727325798
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9547283540852964
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11614024088611329
"cameras/drone/drone0" SET Transform localPosition (-0.48500093854440096 0.6602941621448741 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6363138177072096 1.295478203441621 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 13 -8)
"cameras/drone/drone0" SET Transform localScale (0.7281694064196883 0.7281694064196883 0.7281694064196883)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -16 7)
"cameras/drone/drone1" SET Transform localScale (0.6632111025959185 0.6632111025959185 0.6632111025959185)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.832775050208945 0)
"cameras" SET Transform eulerAngles (13.958392232144504 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.548676247317594
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1967108383611236
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1393658578610972
"cameras/drone/drone0" SET Transform localPosition (0.5960068338695643 0.09437878491958523 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7675389601111128 1.0833589259938083 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 2 5)
"cameras/drone/drone0" SET Transform localScale (1.0782720747006103 1.0782720747006103 1.0782720747006103)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -20 -18)
"cameras/drone/drone1" SET Transform localScale (1.229009008861509 1.229009008861509 1.229009008861509)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.068080289664435 0)
"cameras" SET Transform eulerAngles (7.659188667942022 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.431746207065389
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0130452741823786
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36834804241306573
"cameras/drone/drone0" SET Transform localPosition (-0.3851174653313796 0.52348702568166 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3733712523834478 0.8198252523912821 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 13 19)
"cameras/drone/drone0" SET Transform localScale (0.8411342647258468 0.8411342647258468 0.8411342647258468)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -17 -1)
"cameras/drone/drone1" SET Transform localScale (0.7975134360728429 0.7975134360728429 0.7975134360728429)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.48537646032974 0)
"cameras" SET Transform eulerAngles (-12.646931815914781 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3309171470781715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3332429067762335
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2568995415931873
"cameras/drone/drone0" SET Transform localPosition (0.09995553425217096 0.1500667574846581 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.045349852533654644 0.8318554199311099 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -4 -3)
"cameras/drone/drone0" SET Transform localScale (1.4892876656492857 1.4892876656492857 1.4892876656492857)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 5 18)
"cameras/drone/drone1" SET Transform localScale (1.4014897640804655 1.4014897640804655 1.4014897640804655)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7418242873198713 0)
"cameras" SET Transform eulerAngles (-9.98261008586736 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.679500953151333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9577833689966075
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15328965029279096
"cameras/drone/drone0" SET Transform localPosition (0.39427447303172736 0.284735224425856 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.028104546440558 1.0759531000866889 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 3 -19)
"cameras/drone/drone0" SET Transform localScale (0.9341097553715959 0.9341097553715959 0.9341097553715959)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -18 8)
"cameras/drone/drone1" SET Transform localScale (0.6856210118302914 0.6856210118302914 0.6856210118302914)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7662117723331474 0)
"cameras" SET Transform eulerAngles (19.741889701477177 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7528177929151205
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7726880265844933
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34175630924044287
"cameras/drone/drone0" SET Transform localPosition (-0.7628698826106195 0.5717210359237588 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3101223415449882 0.8821934198536084 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -20 16)
"cameras/drone/drone0" SET Transform localScale (1.2387629344813416 1.2387629344813416 1.2387629344813416)
"cameras/drone/drone1" SET Transform localEulerAngles (3 9 15)
"cameras/drone/drone1" SET Transform localScale (0.8447656322035845 0.8447656322035845 0.8447656322035845)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.054048230792495 0)
"cameras" SET Transform eulerAngles (-3.92249488708665 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5145996714653144
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0679806396836897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21815803101882467
"cameras/drone/drone0" SET Transform localPosition (-0.30215748853512503 0.01587386821720399 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5813813147250257 0.8919010753705081 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 20 -9)
"cameras/drone/drone0" SET Transform localScale (1.4353458761931555 1.4353458761931555 1.4353458761931555)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 17 13)
"cameras/drone/drone1" SET Transform localScale (1.095662733396076 1.095662733396076 1.095662733396076)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.74346208718136 0)
"cameras" SET Transform eulerAngles (3.8435641699497154 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.677907950954056
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7126752429640575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.011980141026311932
"cameras/drone/drone0" SET Transform localPosition (-0.3385801147746451 -0.2773283555889548 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1344615613910185 0.9653067786616709 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 7 2)
"cameras/drone/drone0" SET Transform localScale (0.8153685104609114 0.8153685104609114 0.8153685104609114)
"cameras/drone/drone1" SET Transform localEulerAngles (9 13 11)
"cameras/drone/drone1" SET Transform localScale (0.7524028811804115 0.7524028811804115 0.7524028811804115)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4994211832821556 0)
"cameras" SET Transform eulerAngles (11.125161811521835 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9326551588755139
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6906066669241893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38817548259369017
"cameras/drone/drone0" SET Transform localPosition (1.0372481226707777 0.5177824261176314 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3223923666692199 0.996275453880771 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 7 13)
"cameras/drone/drone0" SET Transform localScale (1.4180271921040384 1.4180271921040384 1.4180271921040384)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -4 7)
"cameras/drone/drone1" SET Transform localScale (0.7306383230662421 0.7306383230662421 0.7306383230662421)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.451927182082622 0)
"cameras" SET Transform eulerAngles (-14.802484120187454 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9406549001001624
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4004875507678967
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25107215764963664
"cameras/drone/drone0" SET Transform localPosition (1.10066825219021 -0.07425077563200783 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1125759949019665 0.9198062112100553 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 11 1)
"cameras/drone/drone0" SET Transform localScale (1.4645389919001195 1.4645389919001195 1.4645389919001195)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 6 -8)
"cameras/drone/drone1" SET Transform localScale (0.9155186123261487 0.9155186123261487 0.9155186123261487)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.367498399651935 0)
"cameras" SET Transform eulerAngles (-0.2939343131010901 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4630404352863042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0123863331490501
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25187991087675243
"cameras/drone/drone0" SET Transform localPosition (0.6617159975212192 0.12298162521859729 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28379785995111195 1.0516861578377341 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 2 3)
"cameras/drone/drone0" SET Transform localScale (0.8575127475339456 0.8575127475339456 0.8575127475339456)
"cameras/drone/drone1" SET Transform localEulerAngles (9 17 12)
"cameras/drone/drone1" SET Transform localScale (0.7529283431989777 0.7529283431989777 0.7529283431989777)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0002831764959685 0)
"cameras" SET Transform eulerAngles (-0.2542205888669784 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3878372288339684
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6392413511603623
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3118636067178744
"cameras/drone/drone0" SET Transform localPosition (1.1030038654724905 0.587727081952022 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7485643105986155 0.9156797980587046 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -20 -3)
"cameras/drone/drone0" SET Transform localScale (0.9505463196785426 0.9505463196785426 0.9505463196785426)
"cameras/drone/drone1" SET Transform localEulerAngles (0 14 6)
"cameras/drone/drone1" SET Transform localScale (0.9354184788660467 0.9354184788660467 0.9354184788660467)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.558144012879511 0)
"cameras" SET Transform eulerAngles (9.097563626814932 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7532335809420887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9198031926160115
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14138723559717992
"cameras/drone/drone0" SET Transform localPosition (-1.0633155194568802 0.24272307562198975 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8728913207062801 0.8126525797240629 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 13 -9)
"cameras/drone/drone0" SET Transform localScale (1.3378057520228062 1.3378057520228062 1.3378057520228062)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -6 5)
"cameras/drone/drone1" SET Transform localScale (1.3204804029468804 1.3204804029468804 1.3204804029468804)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.380313934836732 0)
"cameras" SET Transform eulerAngles (-14.646074845168386 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2738029511156768
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3143521762661177
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14588996470901422
"cameras/drone/drone0" SET Transform localPosition (0.9057334784720219 0.4640992814286567 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7335400909146153 0.8996725354189046 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 8 20)
"cameras/drone/drone0" SET Transform localScale (1.1980865372507266 1.1980865372507266 1.1980865372507266)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -7 11)
"cameras/drone/drone1" SET Transform localScale (1.3451851208203962 1.3451851208203962 1.3451851208203962)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.333707482927484 0)
"cameras" SET Transform eulerAngles (2.5037512317532844 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6622400206837852
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0489033141011996
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28769199720270305
"cameras/drone/drone0" SET Transform localPosition (0.16457211238593272 -0.07162127553545078 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1687700045182412 1.0525048689110414 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 19 20)
"cameras/drone/drone0" SET Transform localScale (1.2040958637354726 1.2040958637354726 1.2040958637354726)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -11 -8)
"cameras/drone/drone1" SET Transform localScale (0.710058705906013 0.710058705906013 0.710058705906013)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.198111262277675 0)
"cameras" SET Transform eulerAngles (-16.03438025120196 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8609087567701013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4470663402600428
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3745771982596593
"cameras/drone/drone0" SET Transform localPosition (-1.0181108307306455 0.08479835412437248 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1071565812666595 1.1710042006768333 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -6 -20)
"cameras/drone/drone0" SET Transform localScale (0.6429106926747629 0.6429106926747629 0.6429106926747629)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 9 -7)
"cameras/drone/drone1" SET Transform localScale (0.9492333138113004 0.9492333138113004 0.9492333138113004)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.924527200737643 0)
"cameras" SET Transform eulerAngles (1.258252293344782 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5971329095156932
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5373325199788122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2325234760482128
"cameras/drone/drone0" SET Transform localPosition (-0.337918527998571 0.3976305291574666 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.178944454610532 0.9665523170822992 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 13 10)
"cameras/drone/drone0" SET Transform localScale (0.9376142941352549 0.9376142941352549 0.9376142941352549)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -13 12)
"cameras/drone/drone1" SET Transform localScale (1.214378197941202 1.214378197941202 1.214378197941202)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.016647621900294 0)
"cameras" SET Transform eulerAngles (-15.040237085828409 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6994286057047547
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9482533489893497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01846030200631028
"cameras/drone/drone0" SET Transform localPosition (0.9168604500122026 0.10897655895058839 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7722267608712368 1.0641931973135703 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -5 -12)
"cameras/drone/drone0" SET Transform localScale (1.2604986533214904 1.2604986533214904 1.2604986533214904)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -12 -1)
"cameras/drone/drone1" SET Transform localScale (0.8015997819549264 0.8015997819549264 0.8015997819549264)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.842231113442635 0)
"cameras" SET Transform eulerAngles (-16.052318034907245 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5599739050316327
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.645758559725637
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29695237248700906
"cameras/drone/drone0" SET Transform localPosition (-0.786764674087072 0.5212897912142453 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.374484909908 1.1561771482663243 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 2 -5)
"cameras/drone/drone0" SET Transform localScale (1.1901352067047573 1.1901352067047573 1.1901352067047573)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -20 -3)
"cameras/drone/drone1" SET Transform localScale (0.6822918008194896 0.6822918008194896 0.6822918008194896)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.788795194285683 0)
"cameras" SET Transform eulerAngles (-3.791383302339149 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46110724208437565
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4416826022356013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3547833928776183
"cameras/drone/drone0" SET Transform localPosition (0.7345507860130651 0.0420072134590152 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8023096593154331 1.035295807839777 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 11 -3)
"cameras/drone/drone0" SET Transform localScale (1.4615219980541132 1.4615219980541132 1.4615219980541132)
"cameras/drone/drone1" SET Transform localEulerAngles (0 11 7)
"cameras/drone/drone1" SET Transform localScale (0.981970588812521 0.981970588812521 0.981970588812521)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.860677632011126 0)
"cameras" SET Transform eulerAngles (5.046584249182885 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2559695489190357
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0918125992393015
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33005966879620074
"cameras/drone/drone0" SET Transform localPosition (-0.08205429374562545 0.0007375339859662655 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.49969773103451065 1.2915997142585904 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 14 -8)
"cameras/drone/drone0" SET Transform localScale (0.9033262159224029 0.9033262159224029 0.9033262159224029)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -3 -6)
"cameras/drone/drone1" SET Transform localScale (1.3680064152273035 1.3680064152273035 1.3680064152273035)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.756881041544956 0)
"cameras" SET Transform eulerAngles (-1.1740364571840836 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4030054435036811
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1558590391609809
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09240820889378575
"cameras/drone/drone0" SET Transform localPosition (1.1997871633023303 -0.048019547274810004 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.15435511355742948 1.2253168868254414 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -4 -13)
"cameras/drone/drone0" SET Transform localScale (1.2177969732814335 1.2177969732814335 1.2177969732814335)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -10 -17)
"cameras/drone/drone1" SET Transform localScale (0.6845516722183246 0.6845516722183246 0.6845516722183246)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4406033914644025 0)
"cameras" SET Transform eulerAngles (-9.670339703040622 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2569447210411377
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5070171524918536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38280646025431597
"cameras/drone/drone0" SET Transform localPosition (0.4455849553854119 0.3030091325963516 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.019086425281776 1.0735071828704923 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 6 0)
"cameras/drone/drone0" SET Transform localScale (1.4315954200452885 1.4315954200452885 1.4315954200452885)
"cameras/drone/drone1" SET Transform localEulerAngles (6 18 -6)
"cameras/drone/drone1" SET Transform localScale (1.0470138285943724 1.0470138285943724 1.0470138285943724)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9459473531759706 0)
"cameras" SET Transform eulerAngles (-13.168070751670218 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4484804863045264
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.561946169539955
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24268680496056044
"cameras/drone/drone0" SET Transform localPosition (-1.0360877800129622 0.2607793501913119 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1510557196429871 1.2935531793275898 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -3 -16)
"cameras/drone/drone0" SET Transform localScale (1.352940020355721 1.352940020355721 1.352940020355721)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 20 -9)
"cameras/drone/drone1" SET Transform localScale (1.1935185857536568 1.1935185857536568 1.1935185857536568)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8651933043489937 0)
"cameras" SET Transform eulerAngles (14.53433456453763 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7105004081593853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4957441282660011
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12167812391186202
"cameras/drone/drone0" SET Transform localPosition (0.24546833310322036 -0.09497233297131574 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.475594315317454 1.070340631210482 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 11 -8)
"cameras/drone/drone0" SET Transform localScale (0.9754528812646712 0.9754528812646712 0.9754528812646712)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -6 -15)
"cameras/drone/drone1" SET Transform localScale (0.8965245883958635 0.8965245883958635 0.8965245883958635)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3689916719222 0)
"cameras" SET Transform eulerAngles (-13.645502424099988 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.274967914821043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.229584619118132
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3875224614831536
"cameras/drone/drone0" SET Transform localPosition (-0.5474679103638328 0.5157489406258842 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.706653297311181 0.8828708803082117 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -13 1)
"cameras/drone/drone0" SET Transform localScale (1.4307621864363762 1.4307621864363762 1.4307621864363762)
"cameras/drone/drone1" SET Transform localEulerAngles (6 16 15)
"cameras/drone/drone1" SET Transform localScale (0.6846619575167043 0.6846619575167043 0.6846619575167043)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.671866167478097 0)
"cameras" SET Transform eulerAngles (7.666410904463781 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.731151643423468
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9941471259041184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.207652311667963
"cameras/drone/drone0" SET Transform localPosition (-0.8692890531649275 -0.15259877615794187 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.35271367709831325 1.096683960319925 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 12 4)
"cameras/drone/drone0" SET Transform localScale (0.8161692912024667 0.8161692912024667 0.8161692912024667)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -18 -4)
"cameras/drone/drone1" SET Transform localScale (1.3680167990420056 1.3680167990420056 1.3680167990420056)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5884278549546984 0)
"cameras" SET Transform eulerAngles (18.702173303456348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3519148420573575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6760266140555675
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37286313259027265
"cameras/drone/drone0" SET Transform localPosition (0.15464212848562964 0.028311964409954038 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09912106632176743 1.2235790126036097 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -1 -19)
"cameras/drone/drone0" SET Transform localScale (1.4211277191102525 1.4211277191102525 1.4211277191102525)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 7 -10)
"cameras/drone/drone1" SET Transform localScale (0.6310828638659719 0.6310828638659719 0.6310828638659719)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.382346421369379 0)
"cameras" SET Transform eulerAngles (-1.5651211727086611 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5807059788675257
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7409316333639635
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07919000716184504
"cameras/drone/drone0" SET Transform localPosition (1.0880697151337813 0.2707811872959162 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9626645239864955 0.9414832983706434 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 12 -14)
"cameras/drone/drone0" SET Transform localScale (1.3422307359349521 1.3422307359349521 1.3422307359349521)
"cameras/drone/drone1" SET Transform localEulerAngles (13 19 0)
"cameras/drone/drone1" SET Transform localScale (0.7856787122345703 0.7856787122345703 0.7856787122345703)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0412292534410965 0)
"cameras" SET Transform eulerAngles (4.675175914659057 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.382392092255217
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7192989858439827
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24562793350289805
"cameras/drone/drone0" SET Transform localPosition (-0.25493178370799996 -0.2357038438819668 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6546446056427134 1.0544295949363907 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 14 -10)
"cameras/drone/drone0" SET Transform localScale (0.9967119562616393 0.9967119562616393 0.9967119562616393)
"cameras/drone/drone1" SET Transform localEulerAngles (10 13 15)
"cameras/drone/drone1" SET Transform localScale (0.9775235547184933 0.9775235547184933 0.9775235547184933)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.564835328401591 0)
"cameras" SET Transform eulerAngles (2.6857241246307026 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4642461768035335
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9554143165385991
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13173583924564278
"cameras/drone/drone0" SET Transform localPosition (0.061260289004387625 0.2815317124986965 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5415637010332202 1.2199361465588867 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 7 5)
"cameras/drone/drone0" SET Transform localScale (0.698150017978545 0.698150017978545 0.698150017978545)
"cameras/drone/drone1" SET Transform localEulerAngles (6 3 1)
"cameras/drone/drone1" SET Transform localScale (0.8418430024648792 0.8418430024648792 0.8418430024648792)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1865068139088812 0)
"cameras" SET Transform eulerAngles (10.609522090121033 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5151211825604392
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3985115849709275
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04848187212035256
"cameras/drone/drone0" SET Transform localPosition (-0.6611340005402412 0.30897650006973404 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1764136143421033 1.1909342955366822 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -16 -15)
"cameras/drone/drone0" SET Transform localScale (1.0269688109862405 1.0269688109862405 1.0269688109862405)
"cameras/drone/drone1" SET Transform localEulerAngles (4 9 8)
"cameras/drone/drone1" SET Transform localScale (1.234289236127624 1.234289236127624 1.234289236127624)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.131625568043564 0)
"cameras" SET Transform eulerAngles (-5.488153139313443 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9385958390113027
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1633032947789175
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3376270813999582
"cameras/drone/drone0" SET Transform localPosition (0.009546585160866039 0.6201671807261875 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1054319959416523 0.9891404200448515 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 3 -16)
"cameras/drone/drone0" SET Transform localScale (0.6971701644692107 0.6971701644692107 0.6971701644692107)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 7 -17)
"cameras/drone/drone1" SET Transform localScale (1.1880497702776855 1.1880497702776855 1.1880497702776855)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.645916310636766 0)
"cameras" SET Transform eulerAngles (19.84859901572711 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0211473013263412
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8748979947788105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2272042002740888
"cameras/drone/drone0" SET Transform localPosition (0.31036246906416753 0.5219429406500744 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.029361250636873 0.8519450261512811 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 18 -7)
"cameras/drone/drone0" SET Transform localScale (1.2873857974169098 1.2873857974169098 1.2873857974169098)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -20 9)
"cameras/drone/drone1" SET Transform localScale (1.0428413559266598 1.0428413559266598 1.0428413559266598)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.028753539606088 0)
"cameras" SET Transform eulerAngles (-7.73301082729375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.491169558403127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.646463284190998
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2952159485741501
"cameras/drone/drone0" SET Transform localPosition (-1.069217059159956 -0.09464107787774717 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0580014929577561 1.1290982834308405 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 3 1)
"cameras/drone/drone0" SET Transform localScale (1.0785311695651856 1.0785311695651856 1.0785311695651856)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -3 -15)
"cameras/drone/drone1" SET Transform localScale (1.4675714204723742 1.4675714204723742 1.4675714204723742)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9476097807031487 0)
"cameras" SET Transform eulerAngles (-8.77158494449275 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1236064480609114
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6103617689982068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23422051413271366
"cameras/drone/drone0" SET Transform localPosition (-1.0496168311780953 -0.05818416734611426 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6814985007541663 1.12630846599004 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -19 -12)
"cameras/drone/drone0" SET Transform localScale (1.063727899746499 1.063727899746499 1.063727899746499)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 17 11)
"cameras/drone/drone1" SET Transform localScale (0.7685996395030974 0.7685996395030974 0.7685996395030974)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.562719916966233 0)
"cameras" SET Transform eulerAngles (16.30243799445914 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.536436977405483
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9888846227633645
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24380284850085118
"cameras/drone/drone0" SET Transform localPosition (-0.11194979274039385 0.2891450796615183 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0377557951797292 1.0686600494876861 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -18 -14)
"cameras/drone/drone0" SET Transform localScale (1.1738485929026583 1.1738485929026583 1.1738485929026583)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 15 -5)
"cameras/drone/drone1" SET Transform localScale (0.7856546532799313 0.7856546532799313 0.7856546532799313)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.323576561105048 0)
"cameras" SET Transform eulerAngles (12.460713401737507 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0959933501039532
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6688337160202253
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14952537342611547
"cameras/drone/drone0" SET Transform localPosition (0.5280754215740602 0.29159217197198267 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9909108577542056 0.9531887463941062 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 6 17)
"cameras/drone/drone0" SET Transform localScale (1.4308423799322294 1.4308423799322294 1.4308423799322294)
"cameras/drone/drone1" SET Transform localEulerAngles (9 13 -15)
"cameras/drone/drone1" SET Transform localScale (0.8990898073392398 0.8990898073392398 0.8990898073392398)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.358905624208737 0)
"cameras" SET Transform eulerAngles (13.662153328896338 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5806388386188669
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8228920313463326
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.024297071869782985
"cameras/drone/drone0" SET Transform localPosition (0.045326826113987195 -0.0032465402320511205 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5615548248913412 1.0537957787516592 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -1 5)
"cameras/drone/drone0" SET Transform localScale (0.9986966583720036 0.9986966583720036 0.9986966583720036)
"cameras/drone/drone1" SET Transform localEulerAngles (1 17 0)
"cameras/drone/drone1" SET Transform localScale (1.1483206714382517 1.1483206714382517 1.1483206714382517)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2030284000110347 0)
"cameras" SET Transform eulerAngles (-8.01777930281801 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7947042899233947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3459255469861136
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15679876328765224
"cameras/drone/drone0" SET Transform localPosition (-0.19387559634274165 0.15163974198344238 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6175516543386731 0.8837488679714944 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 2 18)
"cameras/drone/drone0" SET Transform localScale (1.0281798385650687 1.0281798385650687 1.0281798385650687)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 9 -17)
"cameras/drone/drone1" SET Transform localScale (0.6431640132246309 0.6431640132246309 0.6431640132246309)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.863108991338091 0)
"cameras" SET Transform eulerAngles (-0.00790048517275821 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4939360842765598
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0907052361179865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35228154657651256
"cameras/drone/drone0" SET Transform localPosition (0.7336532061216119 0.3763093407501877 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08488355729928676 1.127971422139198 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 17 8)
"cameras/drone/drone0" SET Transform localScale (0.6470472827036698 0.6470472827036698 0.6470472827036698)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 12 -13)
"cameras/drone/drone1" SET Transform localScale (1.454409687596459 1.454409687596459 1.454409687596459)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.804549490412867 0)
"cameras" SET Transform eulerAngles (15.102639501323225 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4794337735168344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7740112260588592
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3725456819169412
"cameras/drone/drone0" SET Transform localPosition (-1.1099636957899368 0.37294625784224594 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22168865332675303 0.8306524980362439 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 17 1)
"cameras/drone/drone0" SET Transform localScale (1.1455139962267926 1.1455139962267926 1.1455139962267926)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -20 19)
"cameras/drone/drone1" SET Transform localScale (0.8872476611902653 0.8872476611902653 0.8872476611902653)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7157913277047454 0)
"cameras" SET Transform eulerAngles (-19.171047975800878 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.064895347619509
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3008503110296248
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20560404719737255
"cameras/drone/drone0" SET Transform localPosition (-0.11986068802368344 0.10752109166534857 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.525455578169011 0.8460933260144267 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 18 4)
"cameras/drone/drone0" SET Transform localScale (1.025097684421937 1.025097684421937 1.025097684421937)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -20 3)
"cameras/drone/drone1" SET Transform localScale (0.8956053018071414 0.8956053018071414 0.8956053018071414)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.864035858503448 0)
"cameras" SET Transform eulerAngles (-5.588778813846748 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8915820605980408
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9367020433539497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.009816248598240929
"cameras/drone/drone0" SET Transform localPosition (0.7897560594861321 -0.08444993616313773 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1293032806797334 1.2860650208872664 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -6 -12)
"cameras/drone/drone0" SET Transform localScale (0.7252629261834522 0.7252629261834522 0.7252629261834522)
"cameras/drone/drone1" SET Transform localEulerAngles (5 3 -8)
"cameras/drone/drone1" SET Transform localScale (1.2101042005938245 1.2101042005938245 1.2101042005938245)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.282517629495069 0)
"cameras" SET Transform eulerAngles (9.4652056088757 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1536882176456424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.337426540550227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3562906657636903
"cameras/drone/drone0" SET Transform localPosition (-1.1855636027112277 0.4565979802526569 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.009514224928290904 1.2742297826370919 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 12 -19)
"cameras/drone/drone0" SET Transform localScale (1.0477264022560817 1.0477264022560817 1.0477264022560817)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -10 15)
"cameras/drone/drone1" SET Transform localScale (0.8790240831900595 0.8790240831900595 0.8790240831900595)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.146159459056408 0)
"cameras" SET Transform eulerAngles (-18.396027065376465 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.313142773961642
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4598929073502172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.046872379585095915
"cameras/drone/drone0" SET Transform localPosition (-0.4022007431853364 0.2362738032633956 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2494243063977465 0.8445594936229187 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 2 15)
"cameras/drone/drone0" SET Transform localScale (0.8040319921901851 0.8040319921901851 0.8040319921901851)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -12 8)
"cameras/drone/drone1" SET Transform localScale (0.8053348850523413 0.8053348850523413 0.8053348850523413)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.260451999385524 0)
"cameras" SET Transform eulerAngles (-14.29515129140626 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5541290501979169
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9164041831216233
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18638851986987112
"cameras/drone/drone0" SET Transform localPosition (0.4685769426753037 0.01566791174143417 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7664796098099134 0.961032769817425 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 4 5)
"cameras/drone/drone0" SET Transform localScale (1.0021742733102292 1.0021742733102292 1.0021742733102292)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -4 -15)
"cameras/drone/drone1" SET Transform localScale (1.15344061726196 1.15344061726196 1.15344061726196)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3093852418665133 0)
"cameras" SET Transform eulerAngles (14.450805508876591 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7565920593675359
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2612032394184314
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.340318592605072
"cameras/drone/drone0" SET Transform localPosition (-0.8763191075696466 -0.2391958347887227 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5881331821048206 1.0200443571843494 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 10 -9)
"cameras/drone/drone0" SET Transform localScale (0.6265918092999124 0.6265918092999124 0.6265918092999124)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 15 -13)
"cameras/drone/drone1" SET Transform localScale (1.0841778135517286 1.0841778135517286 1.0841778135517286)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.435657326193713 0)
"cameras" SET Transform eulerAngles (5.981908135118324 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5367627231173548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1376359786017132
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0034589643760935653
"cameras/drone/drone0" SET Transform localPosition (-0.8272733472537159 0.5952116438333193 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22622331968565224 1.2064229658871068 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -18 -3)
"cameras/drone/drone0" SET Transform localScale (1.2054917915533179 1.2054917915533179 1.2054917915533179)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -1 1)
"cameras/drone/drone1" SET Transform localScale (1.08311185700262 1.08311185700262 1.08311185700262)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1375891231026785 0)
"cameras" SET Transform eulerAngles (8.700178046474303 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9589859958602479
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.19489051026522
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29267185004640445
"cameras/drone/drone0" SET Transform localPosition (-0.07379102966786943 -0.10411311967995246 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2412340883804004 0.8377029625639044 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -20 13)
"cameras/drone/drone0" SET Transform localScale (0.9323930200743673 0.9323930200743673 0.9323930200743673)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -14 -10)
"cameras/drone/drone1" SET Transform localScale (0.7295422244832034 0.7295422244832034 0.7295422244832034)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.082576505488929 0)
"cameras" SET Transform eulerAngles (7.012867984021398 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9957314367451204
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3853293733539056
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38412797242960717
"cameras/drone/drone0" SET Transform localPosition (0.0962507530818244 0.45398655454999753 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3169581758590977 1.0319874694346716 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -15 14)
"cameras/drone/drone0" SET Transform localScale (1.426299285840165 1.426299285840165 1.426299285840165)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -7 15)
"cameras/drone/drone1" SET Transform localScale (0.7420481849541108 0.7420481849541108 0.7420481849541108)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5638462484863815 0)
"cameras" SET Transform eulerAngles (-11.371659352228004 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5534200162347251
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8956459473467766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01368942908351163
"cameras/drone/drone0" SET Transform localPosition (-0.17486506411294966 -0.03818781539205102 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.30327155804823036 0.8146502574259729 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 20 -4)
"cameras/drone/drone0" SET Transform localScale (0.8413885401830946 0.8413885401830946 0.8413885401830946)
"cameras/drone/drone1" SET Transform localEulerAngles (0 5 -12)
"cameras/drone/drone1" SET Transform localScale (1.2309292721154268 1.2309292721154268 1.2309292721154268)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.819177338430233 0)
"cameras" SET Transform eulerAngles (1.9792913430590957 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.191189213719341
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5997667119156316
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3896527050604969
"cameras/drone/drone0" SET Transform localPosition (0.7365240898500267 0.5882262585864506 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.535203363837372 0.8316887854618051 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 0 9)
"cameras/drone/drone0" SET Transform localScale (0.9854698767610122 0.9854698767610122 0.9854698767610122)
"cameras/drone/drone1" SET Transform localEulerAngles (16 16 11)
"cameras/drone/drone1" SET Transform localScale (1.134575986677421 1.134575986677421 1.134575986677421)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4600110149096626 0)
"cameras" SET Transform eulerAngles (-12.781383221617055 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1041928466372881
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3015425253597237
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11223065145372293
"cameras/drone/drone0" SET Transform localPosition (0.4482710238824459 0.19186076969142934 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5115696686150917 0.8860263112582707 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 8 -6)
"cameras/drone/drone0" SET Transform localScale (1.3894431012794217 1.3894431012794217 1.3894431012794217)
"cameras/drone/drone1" SET Transform localEulerAngles (9 18 8)
"cameras/drone/drone1" SET Transform localScale (0.8131839576971035 0.8131839576971035 0.8131839576971035)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4536232286610327 0)
"cameras" SET Transform eulerAngles (-18.65157304102742 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9355929681270744
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.341090465515888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.234027790975626
"cameras/drone/drone0" SET Transform localPosition (-0.5462438310287233 0.3499350875893796 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9751496587280661 0.941380731094239 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 5 -2)
"cameras/drone/drone0" SET Transform localScale (1.0202158261478984 1.0202158261478984 1.0202158261478984)
"cameras/drone/drone1" SET Transform localEulerAngles (5 2 -13)
"cameras/drone/drone1" SET Transform localScale (0.9541330310747509 0.9541330310747509 0.9541330310747509)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.918258549737236 0)
"cameras" SET Transform eulerAngles (8.221887598506296 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4828152247984292
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.35132487402608
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01997218591442871
"cameras/drone/drone0" SET Transform localPosition (-0.014674904422223634 -0.24956204046028402 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3515338037615263 0.9328375860927176 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -13 -14)
"cameras/drone/drone0" SET Transform localScale (1.396821345564006 1.396821345564006 1.396821345564006)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -7 -19)
"cameras/drone/drone1" SET Transform localScale (1.0754974765548138 1.0754974765548138 1.0754974765548138)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8809636762547655 0)
"cameras" SET Transform eulerAngles (-11.968830248348695 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5475468092600524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.819291106638337
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0470962467550363
"cameras/drone/drone0" SET Transform localPosition (-1.0733768141226157 0.36726321113835175 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1918130365581807 1.0888147314155385 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 13 -12)
"cameras/drone/drone0" SET Transform localScale (1.3751765338753539 1.3751765338753539 1.3751765338753539)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 2 -2)
"cameras/drone/drone1" SET Transform localScale (0.913259438969622 0.913259438969622 0.913259438969622)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.344094058591417 0)
"cameras" SET Transform eulerAngles (-0.2864662670785023 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2470713769467905
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8647772236130247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.01399314393629516
"cameras/drone/drone0" SET Transform localPosition (-0.5027715229479247 0.6682023538195245 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9566206252595191 0.8678416020280604 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 1 -2)
"cameras/drone/drone0" SET Transform localScale (0.9089620277352317 0.9089620277352317 0.9089620277352317)
"cameras/drone/drone1" SET Transform localEulerAngles (14 4 17)
"cameras/drone/drone1" SET Transform localScale (0.6212124304023993 0.6212124304023993 0.6212124304023993)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.514466685476285 0)
"cameras" SET Transform eulerAngles (-8.509384894071204 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5511277132756853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2687799168326463
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2308483899666987
"cameras/drone/drone0" SET Transform localPosition (-1.0514615911569043 -0.12939843437703885 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8620974783606201 1.2696461862631625 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -20 3)
"cameras/drone/drone0" SET Transform localScale (0.6607753774988345 0.6607753774988345 0.6607753774988345)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -7 19)
"cameras/drone/drone1" SET Transform localScale (1.276186869371169 1.276186869371169 1.276186869371169)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.892289636124042 0)
"cameras" SET Transform eulerAngles (-17.317599315413503 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0024175903236685
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9925649777456239
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13455156682888955
"cameras/drone/drone0" SET Transform localPosition (-0.7607286995769739 -0.27324909256528535 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9311096478454621 0.9497518316475089 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 1 -3)
"cameras/drone/drone0" SET Transform localScale (1.3710278958991364 1.3710278958991364 1.3710278958991364)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -10 -5)
"cameras/drone/drone1" SET Transform localScale (0.8171065765794254 0.8171065765794254 0.8171065765794254)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3894566231032393 0)
"cameras" SET Transform eulerAngles (7.393922565314753 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4727922248923515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0806867492608423
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3077855211477455
"cameras/drone/drone0" SET Transform localPosition (-0.5246620196201284 0.1998843115590801 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6674484409655133 1.235119705854776 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 17 -11)
"cameras/drone/drone0" SET Transform localScale (0.9155951756211507 0.9155951756211507 0.9155951756211507)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 18 18)
"cameras/drone/drone1" SET Transform localScale (1.3336108123839359 1.3336108123839359 1.3336108123839359)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.86964335047194 0)
"cameras" SET Transform eulerAngles (-4.951369883859517 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4654543496482406
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2052633530061663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.043330327221254586
"cameras/drone/drone0" SET Transform localPosition (-0.040700691002990785 -0.07347537417238431 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.14461029476508958 0.8214353090959292 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 18 -17)
"cameras/drone/drone0" SET Transform localScale (1.1945284068994675 1.1945284068994675 1.1945284068994675)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -6 -15)
"cameras/drone/drone1" SET Transform localScale (0.9760517280171315 0.9760517280171315 0.9760517280171315)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.444491015369501 0)
"cameras" SET Transform eulerAngles (-2.5669663160704843 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5839306330970409
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6255090539658972
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08360757269753903
"cameras/drone/drone0" SET Transform localPosition (1.14720259959099 -0.24461123836002624 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0631466494441455 0.8547562528355677 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -14 -14)
"cameras/drone/drone0" SET Transform localScale (1.0965974746691343 1.0965974746691343 1.0965974746691343)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 12 18)
"cameras/drone/drone1" SET Transform localScale (1.038999466431 1.038999466431 1.038999466431)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.9862273508284485 0)
"cameras" SET Transform eulerAngles (1.4845064319935304 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0508077944370586
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5122821022380037
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27136333974562027
"cameras/drone/drone0" SET Transform localPosition (0.8319504139219933 0.19505917301055226 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8172163413689362 1.2644596013073843 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -14 -11)
"cameras/drone/drone0" SET Transform localScale (0.7455632933945303 0.7455632933945303 0.7455632933945303)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -3 10)
"cameras/drone/drone1" SET Transform localScale (1.326079006084453 1.326079006084453 1.326079006084453)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.474143670261583 0)
"cameras" SET Transform eulerAngles (-1.4985900289134833 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4511592520155476
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.655186686319398
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05741241470726144
"cameras/drone/drone0" SET Transform localPosition (1.0911456475548327 0.08873328707842026 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7695388617294221 1.2493257241223392 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -18 14)
"cameras/drone/drone0" SET Transform localScale (1.1757289597013143 1.1757289597013143 1.1757289597013143)
"cameras/drone/drone1" SET Transform localEulerAngles (6 15 14)
"cameras/drone/drone1" SET Transform localScale (0.9618483260822059 0.9618483260822059 0.9618483260822059)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.447620646968237 0)
"cameras" SET Transform eulerAngles (2.2405947042384646 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.14464704977651
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1404659923010938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09233041449570063
"cameras/drone/drone0" SET Transform localPosition (-0.49156349126840526 0.1609364799040483 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5905769874655051 1.07320838452607 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -16 -14)
"cameras/drone/drone0" SET Transform localScale (1.1095181718249727 1.1095181718249727 1.1095181718249727)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 19 -16)
"cameras/drone/drone1" SET Transform localScale (0.6937166880712068 0.6937166880712068 0.6937166880712068)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.936512730178863 0)
"cameras" SET Transform eulerAngles (-4.3821561925025865 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4444636451543733
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9667852476044222
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24042745310072547
"cameras/drone/drone0" SET Transform localPosition (0.02755163148141504 0.514397609335596 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.00461888726121451 1.1085472312763218 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 10 -20)
"cameras/drone/drone0" SET Transform localScale (0.9326143553025512 0.9326143553025512 0.9326143553025512)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -17 -13)
"cameras/drone/drone1" SET Transform localScale (0.9487564625786875 0.9487564625786875 0.9487564625786875)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1738145492402685 0)
"cameras" SET Transform eulerAngles (-5.076626854247625 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4865769891898982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9440703373290953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04891670262601231
"cameras/drone/drone0" SET Transform localPosition (0.1899978148299024 0.5157245370184471 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8534007656355467 0.8347366244265756 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 9 -18)
"cameras/drone/drone0" SET Transform localScale (0.8757996757231077 0.8757996757231077 0.8757996757231077)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 3 -20)
"cameras/drone/drone1" SET Transform localScale (0.7675781252360191 0.7675781252360191 0.7675781252360191)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0552703467034736 0)
"cameras" SET Transform eulerAngles (-10.637549552687378 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2208842821657206
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5685901530356956
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2191403816819217
"cameras/drone/drone0" SET Transform localPosition (-0.9136213166575773 -0.25918505082214766 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.190706173569655 1.0405264916248531 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -20 4)
"cameras/drone/drone0" SET Transform localScale (1.2967082925744506 1.2967082925744506 1.2967082925744506)
"cameras/drone/drone1" SET Transform localEulerAngles (10 11 20)
"cameras/drone/drone1" SET Transform localScale (0.7534436763293455 0.7534436763293455 0.7534436763293455)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.301178907804627 0)
"cameras" SET Transform eulerAngles (17.63403523433101 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4614533111373853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7393096124080576
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02516366710518039
"cameras/drone/drone0" SET Transform localPosition (0.6549096059876647 0.012193998435723497 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12628065158085322 0.95025991096236 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -8 12)
"cameras/drone/drone0" SET Transform localScale (1.0517605222447952 1.0517605222447952 1.0517605222447952)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -16 -2)
"cameras/drone/drone1" SET Transform localScale (1.044702887581252 1.044702887581252 1.044702887581252)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6457673259957173 0)
"cameras" SET Transform eulerAngles (-4.5651583417072885 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8287849352831659
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6864968828733897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.026358590827180173
"cameras/drone/drone0" SET Transform localPosition (-0.8509081976987947 -0.06931792547600418 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1955192388805387 1.1471740458994608 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -14 8)
"cameras/drone/drone0" SET Transform localScale (1.0365113228868346 1.0365113228868346 1.0365113228868346)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -14 -17)
"cameras/drone/drone1" SET Transform localScale (0.8117164998686665 0.8117164998686665 0.8117164998686665)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.029076915036838 0)
"cameras" SET Transform eulerAngles (13.953902671532752 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9128800104648822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9271088401296805
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29246344064536917
"cameras/drone/drone0" SET Transform localPosition (-0.07525686484267036 0.3658193747534922 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.98395833764372 1.1935224587960682 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -13 5)
"cameras/drone/drone0" SET Transform localScale (1.4710406567586967 1.4710406567586967 1.4710406567586967)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -9 6)
"cameras/drone/drone1" SET Transform localScale (0.9531651483622139 0.9531651483622139 0.9531651483622139)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.66928900498645 0)
"cameras" SET Transform eulerAngles (-7.196953400006132 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5739156117540394
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4679868058073497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3690582182508433
"cameras/drone/drone0" SET Transform localPosition (-0.9136614489172143 -0.06351044443111936 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20457880026882047 1.1318863642285324 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -2 -6)
"cameras/drone/drone0" SET Transform localScale (1.2746608250406597 1.2746608250406597 1.2746608250406597)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -18 -7)
"cameras/drone/drone1" SET Transform localScale (1.0078049474373438 1.0078049474373438 1.0078049474373438)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7842453325429752 0)
"cameras" SET Transform eulerAngles (-14.216096371657333 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.320802354802213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2397768863807048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2090302967030011
"cameras/drone/drone0" SET Transform localPosition (0.06476864933632864 0.3377539138568187 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9732543963347762 0.9192177138436644 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -20 -18)
"cameras/drone/drone0" SET Transform localScale (0.7845820650015503 0.7845820650015503 0.7845820650015503)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -9 -5)
"cameras/drone/drone1" SET Transform localScale (0.9634311254263277 0.9634311254263277 0.9634311254263277)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.583458882306865 0)
"cameras" SET Transform eulerAngles (-11.350721132846541 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1271868159356315
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5439322977719048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2470282281947406
"cameras/drone/drone0" SET Transform localPosition (0.5222577144673655 0.004900690100442084 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6954326012693216 0.9481299297813575 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 18 15)
"cameras/drone/drone0" SET Transform localScale (1.442058699050059 1.442058699050059 1.442058699050059)
"cameras/drone/drone1" SET Transform localEulerAngles (2 14 -2)
"cameras/drone/drone1" SET Transform localScale (1.1277978308042131 1.1277978308042131 1.1277978308042131)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
