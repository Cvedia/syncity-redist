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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 164 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 36 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 26 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 28 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-6.859578097708832 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 68
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.575466651854135 0)
"cameras" SET Transform eulerAngles (-9.350531060538518 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.893498898803005
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5766117920842673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11442135335854449
"cameras/drone/drone0" SET Transform localPosition (0.4303528166098187 -0.22469731078590732 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08985038562732717 1.1711296187595779 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -7 14)
"cameras/drone/drone0" SET Transform localScale (1.2443507504690836 1.2443507504690836 1.2443507504690836)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -5 0)
"cameras/drone/drone1" SET Transform localScale (1.2205332599622172 1.2205332599622172 1.2205332599622172)
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
"cameras" SET Transform position (0 3.175725997886896 0)
"cameras" SET Transform eulerAngles (-8.196529115170485 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8974653689284908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.462565303953033
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09918654373351027
"cameras/drone/drone0" SET Transform localPosition (-0.9051167697931195 0.23147651264207253 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3212186139624925 0.9541421272531172 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -14 15)
"cameras/drone/drone0" SET Transform localScale (0.9456638912934754 0.9456638912934754 0.9456638912934754)
"cameras/drone/drone1" SET Transform localEulerAngles (11 9 -12)
"cameras/drone/drone1" SET Transform localScale (0.6142395189685421 0.6142395189685421 0.6142395189685421)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.85433490219038 0)
"cameras" SET Transform eulerAngles (-14.40996125261048 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2293064469361141
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6903909086885776
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3136172206964136
"cameras/drone/drone0" SET Transform localPosition (1.127720086729392 0.5308106484553832 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.033123097102941035 1.086781347593408 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 19 1)
"cameras/drone/drone0" SET Transform localScale (0.7062389996620426 0.7062389996620426 0.7062389996620426)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -17 10)
"cameras/drone/drone1" SET Transform localScale (0.9437173928443077 0.9437173928443077 0.9437173928443077)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6791461451367606 0)
"cameras" SET Transform eulerAngles (1.6016111031636804 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5203447492823888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2514942279452912
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3805185290126018
"cameras/drone/drone0" SET Transform localPosition (-0.559123868218596 0.5912573809365063 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9133428764654552 1.1180891063858065 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -9 17)
"cameras/drone/drone0" SET Transform localScale (1.30098524670416 1.30098524670416 1.30098524670416)
"cameras/drone/drone1" SET Transform localEulerAngles (5 13 2)
"cameras/drone/drone1" SET Transform localScale (0.8461615526434814 0.8461615526434814 0.8461615526434814)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.663409497243286 0)
"cameras" SET Transform eulerAngles (-18.03520310838139 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7030211152543475
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.036903032293076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.019732162089998485
"cameras/drone/drone0" SET Transform localPosition (-0.5244944118468053 0.06485264021343956 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8915539393698064 0.8934674787603958 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 20 11)
"cameras/drone/drone0" SET Transform localScale (1.4618516669598762 1.4618516669598762 1.4618516669598762)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -14 9)
"cameras/drone/drone1" SET Transform localScale (0.9155639144606939 0.9155639144606939 0.9155639144606939)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.552324451653935 0)
"cameras" SET Transform eulerAngles (-19.499622961210918 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7762445205002794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9455235310844516
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3355623842556521
"cameras/drone/drone0" SET Transform localPosition (-0.704461729237154 0.5081083215087836 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5098382221572961 1.0661014473941197 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -11 12)
"cameras/drone/drone0" SET Transform localScale (1.1234528091178582 1.1234528091178582 1.1234528091178582)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -16 -7)
"cameras/drone/drone1" SET Transform localScale (1.3004054237460156 1.3004054237460156 1.3004054237460156)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.111312642707711 0)
"cameras" SET Transform eulerAngles (-11.445895113848138 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2723782011905458
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4153249112675061
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39618468763217124
"cameras/drone/drone0" SET Transform localPosition (1.0908127566169383 -0.2680801897391966 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7189052534758209 0.9369706992230947 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -12 -6)
"cameras/drone/drone0" SET Transform localScale (1.4503300213810406 1.4503300213810406 1.4503300213810406)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 3 -20)
"cameras/drone/drone1" SET Transform localScale (1.4548180376221018 1.4548180376221018 1.4548180376221018)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.421199657355057 0)
"cameras" SET Transform eulerAngles (12.474383364932656 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5562528640773374
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.07967427229678
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3904572481450322
"cameras/drone/drone0" SET Transform localPosition (0.9687638308019799 0.2567116722330462 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.073956696112931 1.0223668679069884 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 18 6)
"cameras/drone/drone0" SET Transform localScale (0.9726323867874032 0.9726323867874032 0.9726323867874032)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -17 10)
"cameras/drone/drone1" SET Transform localScale (1.2791047520893613 1.2791047520893613 1.2791047520893613)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.515463548676886 0)
"cameras" SET Transform eulerAngles (3.9391217086696813 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3638666209258465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9110889185759943
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05311009523846924
"cameras/drone/drone0" SET Transform localPosition (-1.1714085523011808 0.15377387906116696 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1941801895968436 1.1897252399812506 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -3 5)
"cameras/drone/drone0" SET Transform localScale (1.3404281686272588 1.3404281686272588 1.3404281686272588)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -18 -9)
"cameras/drone/drone1" SET Transform localScale (1.0049106319941998 1.0049106319941998 1.0049106319941998)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5051700434968875 0)
"cameras" SET Transform eulerAngles (-9.979305460567605 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5071357937512792
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5417459942401974
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28884721141712677
"cameras/drone/drone0" SET Transform localPosition (-0.659448419337405 -0.1616349661095789 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0901043359931404 1.1017463889471946 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 18 16)
"cameras/drone/drone0" SET Transform localScale (1.3492188914573005 1.3492188914573005 1.3492188914573005)
"cameras/drone/drone1" SET Transform localEulerAngles (0 17 19)
"cameras/drone/drone1" SET Transform localScale (1.1537476592815514 1.1537476592815514 1.1537476592815514)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9831824342690854 0)
"cameras" SET Transform eulerAngles (-4.947210911858978 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8134546840266556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8452906249794978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20665204622552938
"cameras/drone/drone0" SET Transform localPosition (0.7869151861018011 -0.08393202410587347 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1173163127908714 1.200681003491172 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 1 -13)
"cameras/drone/drone0" SET Transform localScale (0.7056693917555402 0.7056693917555402 0.7056693917555402)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -17 9)
"cameras/drone/drone1" SET Transform localScale (0.7348989074857921 0.7348989074857921 0.7348989074857921)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.257272261130475 0)
"cameras" SET Transform eulerAngles (11.202929306521149 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5760286728231083
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.731378204274887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38918835092896464
"cameras/drone/drone0" SET Transform localPosition (0.6693081668650223 -0.14060478067919796 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8708836088928624 0.9043558028056842 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 0 -10)
"cameras/drone/drone0" SET Transform localScale (0.8757068009136508 0.8757068009136508 0.8757068009136508)
"cameras/drone/drone1" SET Transform localEulerAngles (17 13 6)
"cameras/drone/drone1" SET Transform localScale (1.4844998360176602 1.4844998360176602 1.4844998360176602)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.227203542531566 0)
"cameras" SET Transform eulerAngles (-17.380877382545556 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44062129325547184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9169254065046789
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18434530951802586
"cameras/drone/drone0" SET Transform localPosition (0.2571919144974415 0.16309784956022705 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8449038991146145 1.01561306174766 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -6 13)
"cameras/drone/drone0" SET Transform localScale (1.2236328950105406 1.2236328950105406 1.2236328950105406)
"cameras/drone/drone1" SET Transform localEulerAngles (15 3 15)
"cameras/drone/drone1" SET Transform localScale (1.2591928888257755 1.2591928888257755 1.2591928888257755)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.265942455037494 0)
"cameras" SET Transform eulerAngles (12.318538826626707 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5687967253339539
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1733352758788347
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03305414362994088
"cameras/drone/drone0" SET Transform localPosition (0.748573996511847 0.5091286421997361 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5222326496730691 1.2656923896191743 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 1 -6)
"cameras/drone/drone0" SET Transform localScale (1.2566436199477922 1.2566436199477922 1.2566436199477922)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -17 4)
"cameras/drone/drone1" SET Transform localScale (1.1925910716089017 1.1925910716089017 1.1925910716089017)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2457409425625086 0)
"cameras" SET Transform eulerAngles (-0.2824007592908764 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0602391235507067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6710764276174235
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.365806567922377
"cameras/drone/drone0" SET Transform localPosition (1.0458463963149855 0.1980204255207017 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0714621910293223 1.194211454410837 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -9 -19)
"cameras/drone/drone0" SET Transform localScale (1.2965997646929117 1.2965997646929117 1.2965997646929117)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -4 19)
"cameras/drone/drone1" SET Transform localScale (1.0516498249413757 1.0516498249413757 1.0516498249413757)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5464839483472 0)
"cameras" SET Transform eulerAngles (-17.281182013486912 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4639481867261177
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.928912208031949
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3787064323764254
"cameras/drone/drone0" SET Transform localPosition (-0.8874292923650546 -0.0433837090769667 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3616025711832097 1.2400054782664656 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -9 3)
"cameras/drone/drone0" SET Transform localScale (1.4048712418822427 1.4048712418822427 1.4048712418822427)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 2 -6)
"cameras/drone/drone1" SET Transform localScale (0.7684766384430409 0.7684766384430409 0.7684766384430409)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.728485993287366 0)
"cameras" SET Transform eulerAngles (0.1512968908899559 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8054806401432067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2833165798234483
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2940928260906956
"cameras/drone/drone0" SET Transform localPosition (0.7643482229850906 0.5546016127893607 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28628342259756456 1.2906744371157899 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -6 16)
"cameras/drone/drone0" SET Transform localScale (0.6070894785387145 0.6070894785387145 0.6070894785387145)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 3 2)
"cameras/drone/drone1" SET Transform localScale (1.2467526144688343 1.2467526144688343 1.2467526144688343)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.496855002957151 0)
"cameras" SET Transform eulerAngles (-11.692075513308847 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9001471916135457
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4026259536375068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16472739496750088
"cameras/drone/drone0" SET Transform localPosition (-0.005932587187134519 0.6321165199488805 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.16915049948295025 0.9330628764667028 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 15 -6)
"cameras/drone/drone0" SET Transform localScale (1.0911186574690341 1.0911186574690341 1.0911186574690341)
"cameras/drone/drone1" SET Transform localEulerAngles (8 20 7)
"cameras/drone/drone1" SET Transform localScale (0.8629582893915971 0.8629582893915971 0.8629582893915971)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3408763571629736 0)
"cameras" SET Transform eulerAngles (-19.25276978394784 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1916132291707968
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.196474487828584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09008288025971432
"cameras/drone/drone0" SET Transform localPosition (0.981644530529963 0.40286309889666644 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40448306386417143 1.0150508970262055 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 0 5)
"cameras/drone/drone0" SET Transform localScale (1.2754238468611376 1.2754238468611376 1.2754238468611376)
"cameras/drone/drone1" SET Transform localEulerAngles (19 5 17)
"cameras/drone/drone1" SET Transform localScale (1.331344217323954 1.331344217323954 1.331344217323954)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.353430161323393 0)
"cameras" SET Transform eulerAngles (6.369120286777445 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4221636014452956
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7405591250304093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2968573512229222
"cameras/drone/drone0" SET Transform localPosition (0.31842704957518553 0.05341191799996242 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6863454371425988 1.0620696311077182 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -1 18)
"cameras/drone/drone0" SET Transform localScale (1.4701308860849331 1.4701308860849331 1.4701308860849331)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -9 8)
"cameras/drone/drone1" SET Transform localScale (1.1014242281107727 1.1014242281107727 1.1014242281107727)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0288554071183436 0)
"cameras" SET Transform eulerAngles (-9.226182280368732 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2686304498001235
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.806215303055871
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24601469086112226
"cameras/drone/drone0" SET Transform localPosition (-0.5226095762804236 0.3033212811253329 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1052037045699847 1.0910237657252015 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 5 -10)
"cameras/drone/drone0" SET Transform localScale (0.8979023641413659 0.8979023641413659 0.8979023641413659)
"cameras/drone/drone1" SET Transform localEulerAngles (4 4 13)
"cameras/drone/drone1" SET Transform localScale (1.3144500103377497 1.3144500103377497 1.3144500103377497)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.086410130725119 0)
"cameras" SET Transform eulerAngles (17.25149033476813 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.535795187789173
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.957716053782276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07857646208211531
"cameras/drone/drone0" SET Transform localPosition (0.04429555005153918 -0.053106516845770446 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6229877987324889 1.0165232032358869 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -6 12)
"cameras/drone/drone0" SET Transform localScale (1.2579298368804792 1.2579298368804792 1.2579298368804792)
"cameras/drone/drone1" SET Transform localEulerAngles (4 16 14)
"cameras/drone/drone1" SET Transform localScale (1.3401251044573632 1.3401251044573632 1.3401251044573632)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.037374514266361 0)
"cameras" SET Transform eulerAngles (13.099901317445067 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.464222215222386
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.615627960932831
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2000219318815209
"cameras/drone/drone0" SET Transform localPosition (-0.1712529482289864 0.44481456458057195 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.27774668169431904 0.8422722022822092 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 20 -18)
"cameras/drone/drone0" SET Transform localScale (0.6083034826973294 0.6083034826973294 0.6083034826973294)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 5 13)
"cameras/drone/drone1" SET Transform localScale (1.315765138671809 1.315765138671809 1.315765138671809)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.269507159708411 0)
"cameras" SET Transform eulerAngles (8.203619055786731 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1665777279753227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2470906402325577
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3113012457068688
"cameras/drone/drone0" SET Transform localPosition (0.019904695773812264 -0.162226507615768 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.45679424914070843 1.2788272943066294 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 17 -6)
"cameras/drone/drone0" SET Transform localScale (1.2091307665412367 1.2091307665412367 1.2091307665412367)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -11 -4)
"cameras/drone/drone1" SET Transform localScale (0.9259833387227012 0.9259833387227012 0.9259833387227012)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.168157238711049 0)
"cameras" SET Transform eulerAngles (1.6792830696358365 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4134349422901984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.419519587201303
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09101752250645308
"cameras/drone/drone0" SET Transform localPosition (0.09498594521945392 -0.06049872163112141 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2613029789649839 1.0516796225263985 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 17 -20)
"cameras/drone/drone0" SET Transform localScale (0.8461527633852766 0.8461527633852766 0.8461527633852766)
"cameras/drone/drone1" SET Transform localEulerAngles (16 10 -15)
"cameras/drone/drone1" SET Transform localScale (1.0804806371394753 1.0804806371394753 1.0804806371394753)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.772620101229843 0)
"cameras" SET Transform eulerAngles (-1.4768025874439061 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5254839955516903
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1131523215351142
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3860145678999769
"cameras/drone/drone0" SET Transform localPosition (-0.6963367131530378 0.3025906753455007 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9841410709528929 1.181952298239685 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 5 15)
"cameras/drone/drone0" SET Transform localScale (1.1935566205364991 1.1935566205364991 1.1935566205364991)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -18 2)
"cameras/drone/drone1" SET Transform localScale (0.7666836703719222 0.7666836703719222 0.7666836703719222)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2346451193218 0)
"cameras" SET Transform eulerAngles (-17.964028082454504 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2064887793888408
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9226370649927672
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37958071888908673
"cameras/drone/drone0" SET Transform localPosition (0.2553740499228363 0.6766353270483225 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9949818740457388 0.9966884358524588 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -6 10)
"cameras/drone/drone0" SET Transform localScale (1.396616362629961 1.396616362629961 1.396616362629961)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -20 -9)
"cameras/drone/drone1" SET Transform localScale (1.3021527747604233 1.3021527747604233 1.3021527747604233)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.106739193892926 0)
"cameras" SET Transform eulerAngles (-14.358154314617057 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.757820150411951
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7069724841668361
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1622381497145372
"cameras/drone/drone0" SET Transform localPosition (1.1345569167926761 0.1390234381111492 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.671600658456931 1.2148653693802316 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 17 7)
"cameras/drone/drone0" SET Transform localScale (0.8745117087117398 0.8745117087117398 0.8745117087117398)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -3 7)
"cameras/drone/drone1" SET Transform localScale (1.190213871039346 1.190213871039346 1.190213871039346)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.649749285301506 0)
"cameras" SET Transform eulerAngles (-5.6645123928377 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5402697432462013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.867993440682047
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3296026895516415
"cameras/drone/drone0" SET Transform localPosition (-0.477770257734755 -0.05826003395436169 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.114760866013728 0.9556387773214206 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -10 1)
"cameras/drone/drone0" SET Transform localScale (1.3485328491435853 1.3485328491435853 1.3485328491435853)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 16 -8)
"cameras/drone/drone1" SET Transform localScale (0.9541071787472206 0.9541071787472206 0.9541071787472206)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8396828581122335 0)
"cameras" SET Transform eulerAngles (0.08778844943097397 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8621024892605157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5024266385879397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38127618969054067
"cameras/drone/drone0" SET Transform localPosition (0.5320210244380874 0.46509989509139255 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08711500942480632 1.1255202174471173 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 20 -9)
"cameras/drone/drone0" SET Transform localScale (0.7450789605121239 0.7450789605121239 0.7450789605121239)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -13 -16)
"cameras/drone/drone1" SET Transform localScale (0.8095205160765595 0.8095205160765595 0.8095205160765595)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1166422963137945 0)
"cameras" SET Transform eulerAngles (-2.3382669833029794 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4504604138655893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4654182390299033
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10094309293839113
"cameras/drone/drone0" SET Transform localPosition (-0.9990008099221916 0.3800715701209733 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1943204268087244 1.2877713312981842 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -7 -19)
"cameras/drone/drone0" SET Transform localScale (1.419383815355019 1.419383815355019 1.419383815355019)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 15 -3)
"cameras/drone/drone1" SET Transform localScale (1.2576827430639228 1.2576827430639228 1.2576827430639228)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.06170379950302 0)
"cameras" SET Transform eulerAngles (-4.977126862838519 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5811268685294357
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7792856025781676
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17262759215301307
"cameras/drone/drone0" SET Transform localPosition (-0.7178397853677526 0.5988539744073231 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5965877264287519 0.996794552607224 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -11 12)
"cameras/drone/drone0" SET Transform localScale (1.4701598085549359 1.4701598085549359 1.4701598085549359)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 7 6)
"cameras/drone/drone1" SET Transform localScale (0.8591923041127033 0.8591923041127033 0.8591923041127033)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7519784948058073 0)
"cameras" SET Transform eulerAngles (-11.838580666974053 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8413687880583004
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4298809445842795
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3783489833649132
"cameras/drone/drone0" SET Transform localPosition (-0.028835592514175 0.1457788402399594 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1402423388434129 0.8703885719738063 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 14 -11)
"cameras/drone/drone0" SET Transform localScale (1.2980878563446598 1.2980878563446598 1.2980878563446598)
"cameras/drone/drone1" SET Transform localEulerAngles (18 6 -3)
"cameras/drone/drone1" SET Transform localScale (1.0810955569026186 1.0810955569026186 1.0810955569026186)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5366615515100825 0)
"cameras" SET Transform eulerAngles (-3.5255347016134877 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.577431524728413
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9314532148700372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10603339869280673
"cameras/drone/drone0" SET Transform localPosition (-0.31617812276781554 0.46337779828270315 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.22138691214947603 0.8897389156723954 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -8 -9)
"cameras/drone/drone0" SET Transform localScale (0.668363086121056 0.668363086121056 0.668363086121056)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 19 4)
"cameras/drone/drone1" SET Transform localScale (1.2892207809599432 1.2892207809599432 1.2892207809599432)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.209277863156073 0)
"cameras" SET Transform eulerAngles (-15.60414291075264 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5553083751628471
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.768830281146665
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09059961960442285
"cameras/drone/drone0" SET Transform localPosition (-0.8469605496909445 0.6354178226458538 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.34787437188058024 1.2711935696521315 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 13 -17)
"cameras/drone/drone0" SET Transform localScale (1.3769439822846223 1.3769439822846223 1.3769439822846223)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -11 20)
"cameras/drone/drone1" SET Transform localScale (0.9931979366553322 0.9931979366553322 0.9931979366553322)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.754878036733237 0)
"cameras" SET Transform eulerAngles (-3.9986199399513467 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7277018251145785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6722865314820816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.030797196453141096
"cameras/drone/drone0" SET Transform localPosition (0.8404875151077793 0.09433061526037384 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24337778573588764 1.1851467283964419 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -13 -13)
"cameras/drone/drone0" SET Transform localScale (1.1764706178658486 1.1764706178658486 1.1764706178658486)
"cameras/drone/drone1" SET Transform localEulerAngles (14 3 20)
"cameras/drone/drone1" SET Transform localScale (1.3580386073380128 1.3580386073380128 1.3580386073380128)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.112865363455189 0)
"cameras" SET Transform eulerAngles (-0.0029785228787382323 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0099396324202923
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.038109846491528
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3687345900812199
"cameras/drone/drone0" SET Transform localPosition (-1.1975562007365785 0.02396960491354122 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.42090557455493083 0.8086861233818925 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -1 -5)
"cameras/drone/drone0" SET Transform localScale (1.3356274934399333 1.3356274934399333 1.3356274934399333)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -14 -3)
"cameras/drone/drone1" SET Transform localScale (1.0300435907823204 1.0300435907823204 1.0300435907823204)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.916691075940445 0)
"cameras" SET Transform eulerAngles (-13.434403138109108 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5564663515216358
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.975876504726143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.042513461833225775
"cameras/drone/drone0" SET Transform localPosition (-0.7164050241970197 -0.047423328372117546 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09488068921183768 0.9819571205319683 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -13 -20)
"cameras/drone/drone0" SET Transform localScale (1.2489520645615273 1.2489520645615273 1.2489520645615273)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -15 -16)
"cameras/drone/drone1" SET Transform localScale (1.0893808338907256 1.0893808338907256 1.0893808338907256)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.521076089273622 0)
"cameras" SET Transform eulerAngles (0.7277820722512409 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9746605826601519
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4564270932241181
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22749074709041817
"cameras/drone/drone0" SET Transform localPosition (0.42547006045733315 0.02275873006722401 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5720950271886652 0.8508978347823789 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -9 -2)
"cameras/drone/drone0" SET Transform localScale (1.4247217108159718 1.4247217108159718 1.4247217108159718)
"cameras/drone/drone1" SET Transform localEulerAngles (7 11 3)
"cameras/drone/drone1" SET Transform localScale (1.2343734119503575 1.2343734119503575 1.2343734119503575)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6093851544810844 0)
"cameras" SET Transform eulerAngles (-17.39625455580741 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8338630547072533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1081548461256392
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35061407170347053
"cameras/drone/drone0" SET Transform localPosition (-0.6424622052894702 0.4506232223682803 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4845185364268476 0.9989808634916895 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -18 15)
"cameras/drone/drone0" SET Transform localScale (0.6637014921445942 0.6637014921445942 0.6637014921445942)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -16 -12)
"cameras/drone/drone1" SET Transform localScale (0.7366929069644359 0.7366929069644359 0.7366929069644359)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9231624920876405 0)
"cameras" SET Transform eulerAngles (10.70772192552981 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.284740148566141
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9016390610809801
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11092941322382677
"cameras/drone/drone0" SET Transform localPosition (-0.32484988132076176 -0.14432528985175092 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5011001560462317 1.008437445612448 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -11 -4)
"cameras/drone/drone0" SET Transform localScale (0.9312700121952926 0.9312700121952926 0.9312700121952926)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 0 9)
"cameras/drone/drone1" SET Transform localScale (1.1527585731092382 1.1527585731092382 1.1527585731092382)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.497104512851283 0)
"cameras" SET Transform eulerAngles (-2.715522651268035 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8198412970224597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0270615786216113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3639859701553156
"cameras/drone/drone0" SET Transform localPosition (-0.4761151012602377 0.06255833773639602 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.692054370748022 1.1189982941213021 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 13 -18)
"cameras/drone/drone0" SET Transform localScale (0.8127426394726589 0.8127426394726589 0.8127426394726589)
"cameras/drone/drone1" SET Transform localEulerAngles (18 2 5)
"cameras/drone/drone1" SET Transform localScale (0.9747861215627732 0.9747861215627732 0.9747861215627732)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.057907123829846 0)
"cameras" SET Transform eulerAngles (15.914261768803776 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2290523071488386
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5323031449394744
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2647987907638897
"cameras/drone/drone0" SET Transform localPosition (-1.0392744746958797 -0.27460296496543507 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7769555156152546 1.287377782354107 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 5 -2)
"cameras/drone/drone0" SET Transform localScale (1.4095897306790348 1.4095897306790348 1.4095897306790348)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -8 -14)
"cameras/drone/drone1" SET Transform localScale (0.9366495440084336 0.9366495440084336 0.9366495440084336)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.447852093970246 0)
"cameras" SET Transform eulerAngles (18.90216934558871 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3922014394989812
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9190576006416546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17702914443779627
"cameras/drone/drone0" SET Transform localPosition (-0.7637166533838406 0.23445563835942135 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8275708312333578 0.8531617509494638 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 16 -5)
"cameras/drone/drone0" SET Transform localScale (1.334796702597789 1.334796702597789 1.334796702597789)
"cameras/drone/drone1" SET Transform localEulerAngles (6 15 9)
"cameras/drone/drone1" SET Transform localScale (0.8478202668794845 0.8478202668794845 0.8478202668794845)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.483432686544635 0)
"cameras" SET Transform eulerAngles (8.041211226552747 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1123618154597026
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7240678046260365
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2954654332759096
"cameras/drone/drone0" SET Transform localPosition (0.6781211697047731 -0.10920852407870102 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.784940361128788 0.9233152585378563 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -5 -14)
"cameras/drone/drone0" SET Transform localScale (0.7699390912051917 0.7699390912051917 0.7699390912051917)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -11 -6)
"cameras/drone/drone1" SET Transform localScale (1.3278556998867577 1.3278556998867577 1.3278556998867577)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.613743975448069 0)
"cameras" SET Transform eulerAngles (3.418780348450184 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5546161432173312
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8370337469373965
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0038974492933955053
"cameras/drone/drone0" SET Transform localPosition (0.6011666053052336 0.5955419614706081 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.42703244782011684 1.07441646001694 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 20 5)
"cameras/drone/drone0" SET Transform localScale (0.6202906905271935 0.6202906905271935 0.6202906905271935)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 12 1)
"cameras/drone/drone1" SET Transform localScale (0.9330484046535332 0.9330484046535332 0.9330484046535332)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.125454806727959 0)
"cameras" SET Transform eulerAngles (3.68313945543283 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44491696028636907
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0645635219888596
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2632064511424832
"cameras/drone/drone0" SET Transform localPosition (1.17207566240708 -0.09286918017483475 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.093601423211228 0.8008063599856289 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 4 -12)
"cameras/drone/drone0" SET Transform localScale (1.498771906830417 1.498771906830417 1.498771906830417)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -4 19)
"cameras/drone/drone1" SET Transform localScale (0.6019026766189207 0.6019026766189207 0.6019026766189207)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4405351357133487 0)
"cameras" SET Transform eulerAngles (19.446460246933576 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0380535493320746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9297150678904769
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04494100800200425
"cameras/drone/drone0" SET Transform localPosition (0.5124446498130402 -0.05849909458326791 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.44023634151505675 1.112280097899914 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 3 -18)
"cameras/drone/drone0" SET Transform localScale (1.0082632054433973 1.0082632054433973 1.0082632054433973)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 15 -10)
"cameras/drone/drone1" SET Transform localScale (1.4959041151337562 1.4959041151337562 1.4959041151337562)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4271286167012893 0)
"cameras" SET Transform eulerAngles (-14.241507636342096 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.123990570554641
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2419478120284642
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10660214688881453
"cameras/drone/drone0" SET Transform localPosition (-0.6037373030584083 -0.06527560003081695 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2274647643177714 0.8847393867461447 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -10 18)
"cameras/drone/drone0" SET Transform localScale (0.8558612058340811 0.8558612058340811 0.8558612058340811)
"cameras/drone/drone1" SET Transform localEulerAngles (6 0 18)
"cameras/drone/drone1" SET Transform localScale (0.9389764544834373 0.9389764544834373 0.9389764544834373)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.361932218299344 0)
"cameras" SET Transform eulerAngles (-19.894973383136232 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3581268340327282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7466810296315127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23065624156680242
"cameras/drone/drone0" SET Transform localPosition (0.4828076293551742 0.4106020442023152 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5147768091813862 0.9796037054233726 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 14 -7)
"cameras/drone/drone0" SET Transform localScale (0.7732409759460133 0.7732409759460133 0.7732409759460133)
"cameras/drone/drone1" SET Transform localEulerAngles (6 10 14)
"cameras/drone/drone1" SET Transform localScale (1.2952423240483424 1.2952423240483424 1.2952423240483424)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.299589360083225 0)
"cameras" SET Transform eulerAngles (-14.214600616076627 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9784811507944179
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7611825914501051
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3381777569735893
"cameras/drone/drone0" SET Transform localPosition (-0.7374925706479409 0.6117748063110213 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7419778640273571 0.9994657136825917 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -14 -16)
"cameras/drone/drone0" SET Transform localScale (0.8382960184499937 0.8382960184499937 0.8382960184499937)
"cameras/drone/drone1" SET Transform localEulerAngles (2 20 -8)
"cameras/drone/drone1" SET Transform localScale (0.7458306600495296 0.7458306600495296 0.7458306600495296)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.451180013169847 0)
"cameras" SET Transform eulerAngles (-11.844333219341374 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5110001490966112
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.64691681230425
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14163181812064757
"cameras/drone/drone0" SET Transform localPosition (0.3887321866169777 0.6759649905869134 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.19699018430700432 1.2220643698618352 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -8 1)
"cameras/drone/drone0" SET Transform localScale (1.2900839089119303 1.2900839089119303 1.2900839089119303)
"cameras/drone/drone1" SET Transform localEulerAngles (19 0 -2)
"cameras/drone/drone1" SET Transform localScale (0.850235005707448 0.850235005707448 0.850235005707448)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5403403407824334 0)
"cameras" SET Transform eulerAngles (-15.64693135004041 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5608603025418339
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.061120033321312
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16862321269129343
"cameras/drone/drone0" SET Transform localPosition (0.804530711268512 -0.21399760153539243 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2807468619235999 0.8030034260490959 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 13 6)
"cameras/drone/drone0" SET Transform localScale (0.9926679576502573 0.9926679576502573 0.9926679576502573)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 1 16)
"cameras/drone/drone1" SET Transform localScale (0.9036216644152057 0.9036216644152057 0.9036216644152057)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.608710896201518 0)
"cameras" SET Transform eulerAngles (-19.83113010354769 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5907724823316771
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8959564588577869
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3642556089203981
"cameras/drone/drone0" SET Transform localPosition (-0.8051771738202966 0.4682430899131132 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.747990507482154 1.1717699711446863 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -18 -10)
"cameras/drone/drone0" SET Transform localScale (0.7731038372421575 0.7731038372421575 0.7731038372421575)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -3 -16)
"cameras/drone/drone1" SET Transform localScale (0.8921518330629856 0.8921518330629856 0.8921518330629856)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2735241418734216 0)
"cameras" SET Transform eulerAngles (2.922141915296276 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8431263065984076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5634941262710487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34853381129814
"cameras/drone/drone0" SET Transform localPosition (-0.23491375202733433 0.5679296118222703 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7864841492964911 1.0763299839107088 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 14 -4)
"cameras/drone/drone0" SET Transform localScale (0.6032926947230663 0.6032926947230663 0.6032926947230663)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -18 13)
"cameras/drone/drone1" SET Transform localScale (0.7991324790432576 0.7991324790432576 0.7991324790432576)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.244829805343164 0)
"cameras" SET Transform eulerAngles (2.234576298483976 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9454365773548833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5176256366125997
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2594460496980958
"cameras/drone/drone0" SET Transform localPosition (0.8550400874873392 0.1398625099655178 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.03133637707887016 1.2532864492265894 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -17 18)
"cameras/drone/drone0" SET Transform localScale (1.1133012487310625 1.1133012487310625 1.1133012487310625)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -19 -1)
"cameras/drone/drone1" SET Transform localScale (1.416942089872958 1.416942089872958 1.416942089872958)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.849483042212294 0)
"cameras" SET Transform eulerAngles (2.883552671626866 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6523693421392103
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5674925358320266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11222910563392743
"cameras/drone/drone0" SET Transform localPosition (0.1929676254501631 0.1577834863752326 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9504633386213561 1.169161085896183 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 14 -11)
"cameras/drone/drone0" SET Transform localScale (1.1659844779582489 1.1659844779582489 1.1659844779582489)
"cameras/drone/drone1" SET Transform localEulerAngles (1 18 11)
"cameras/drone/drone1" SET Transform localScale (0.8976489971743791 0.8976489971743791 0.8976489971743791)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.136524647170602 0)
"cameras" SET Transform eulerAngles (14.276837838698519 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3213439643834128
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5782488371645735
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07073044034432296
"cameras/drone/drone0" SET Transform localPosition (-0.047020168981516175 -0.04199143667676203 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6898434837296279 1.0230882048641394 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 11 -12)
"cameras/drone/drone0" SET Transform localScale (0.6873979825814398 0.6873979825814398 0.6873979825814398)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -15 6)
"cameras/drone/drone1" SET Transform localScale (0.6032371893371843 0.6032371893371843 0.6032371893371843)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.748453120905154 0)
"cameras" SET Transform eulerAngles (-6.723780603117628 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4661451220994661
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6387192655817238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17715137472132533
"cameras/drone/drone0" SET Transform localPosition (0.8749647804493355 0.34634790724215186 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8307763457317763 1.2454256975235827 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 13 -7)
"cameras/drone/drone0" SET Transform localScale (0.6834732848608037 0.6834732848608037 0.6834732848608037)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -4 11)
"cameras/drone/drone1" SET Transform localScale (0.8133562743602164 0.8133562743602164 0.8133562743602164)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.153480926728289 0)
"cameras" SET Transform eulerAngles (-18.896034731888776 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7972998526113934
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9536711311695636
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06615250903541221
"cameras/drone/drone0" SET Transform localPosition (-0.03543147140196057 0.6638494046772387 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7761099540428893 0.8924616943262217 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 19 4)
"cameras/drone/drone0" SET Transform localScale (0.8051415895614772 0.8051415895614772 0.8051415895614772)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -13 9)
"cameras/drone/drone1" SET Transform localScale (0.9826393687155515 0.9826393687155515 0.9826393687155515)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.087031670155326 0)
"cameras" SET Transform eulerAngles (-13.483287645428629 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5888652404772464
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4252718486934164
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22367668387290043
"cameras/drone/drone0" SET Transform localPosition (1.0079415533614215 0.013809630065009404 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1780547121131695 0.8857421603794459 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -11 -16)
"cameras/drone/drone0" SET Transform localScale (1.1429221980875806 1.1429221980875806 1.1429221980875806)
"cameras/drone/drone1" SET Transform localEulerAngles (19 8 17)
"cameras/drone/drone1" SET Transform localScale (1.4820565941779895 1.4820565941779895 1.4820565941779895)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.321641852877265 0)
"cameras" SET Transform eulerAngles (6.23900386483534 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1101976417127513
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9958970632065995
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37777064157360224
"cameras/drone/drone0" SET Transform localPosition (-1.067957634298412 -0.08567198624617972 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4766665265697949 1.0658404247202293 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -13 -20)
"cameras/drone/drone0" SET Transform localScale (1.4378666036135765 1.4378666036135765 1.4378666036135765)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 2 -13)
"cameras/drone/drone1" SET Transform localScale (1.049435578114581 1.049435578114581 1.049435578114581)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.339345601701232 0)
"cameras" SET Transform eulerAngles (-0.22261698244850336 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.960963075324518
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0201355824883085
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.035643486421722506
"cameras/drone/drone0" SET Transform localPosition (-0.9206717112046191 -0.04969214854718612 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3591966202387138 1.1545675171048309 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 11 12)
"cameras/drone/drone0" SET Transform localScale (1.4631255428371106 1.4631255428371106 1.4631255428371106)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -4 -10)
"cameras/drone/drone1" SET Transform localScale (0.9066404930987305 0.9066404930987305 0.9066404930987305)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.05058947908992 0)
"cameras" SET Transform eulerAngles (-3.5944164833330383 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7593300587798504
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9202659897286172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07406197944525057
"cameras/drone/drone0" SET Transform localPosition (0.6811495633048554 0.29092331389020226 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8864557568591842 0.8009230338687061 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -16 -17)
"cameras/drone/drone0" SET Transform localScale (1.4718630416875986 1.4718630416875986 1.4718630416875986)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -7 6)
"cameras/drone/drone1" SET Transform localScale (0.6020069082706005 0.6020069082706005 0.6020069082706005)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.349971511839907 0)
"cameras" SET Transform eulerAngles (7.484486253775707 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4188218954900962
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3393657677723956
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2723670558624098
"cameras/drone/drone0" SET Transform localPosition (0.18077446098230165 0.12073488226669044 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1583689258991712 0.9041925934217916 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -3 5)
"cameras/drone/drone0" SET Transform localScale (1.1083368351952134 1.1083368351952134 1.1083368351952134)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -19 20)
"cameras/drone/drone1" SET Transform localScale (0.9475476708877661 0.9475476708877661 0.9475476708877661)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.63164267985443 0)
"cameras" SET Transform eulerAngles (7.736251963694045 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1939900768825127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4853565295619982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28133564924633464
"cameras/drone/drone0" SET Transform localPosition (-1.0166084000805502 0.3945540319558068 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.42756655515076514 1.1257835194998318 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 14 -16)
"cameras/drone/drone0" SET Transform localScale (0.6993095119602813 0.6993095119602813 0.6993095119602813)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -11 12)
"cameras/drone/drone1" SET Transform localScale (1.1524389029518574 1.1524389029518574 1.1524389029518574)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.504646138232669 0)
"cameras" SET Transform eulerAngles (15.340927615304167 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3063455367743475
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9300660104868791
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11698868754223196
"cameras/drone/drone0" SET Transform localPosition (0.9617540202924613 -0.10346851289918929 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24297067475506262 1.059731471225864 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -9 -10)
"cameras/drone/drone0" SET Transform localScale (1.0470513392868028 1.0470513392868028 1.0470513392868028)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -20 -18)
"cameras/drone/drone1" SET Transform localScale (1.4447558681642996 1.4447558681642996 1.4447558681642996)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.191782459164855 0)
"cameras" SET Transform eulerAngles (-2.9570365349088057 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.394376051221877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6300745660800762
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2349983898321098
"cameras/drone/drone0" SET Transform localPosition (-1.0853899282034842 0.14678856939871093 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2670237602471086 0.887875141465616 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -2 -18)
"cameras/drone/drone0" SET Transform localScale (0.8296034041161703 0.8296034041161703 0.8296034041161703)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -9 1)
"cameras/drone/drone1" SET Transform localScale (1.3500642737706334 1.3500642737706334 1.3500642737706334)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.727520705831562 0)
"cameras" SET Transform eulerAngles (-1.5041538942805524 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1968301704525293
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9620665766006442
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2935399368753534
"cameras/drone/drone0" SET Transform localPosition (0.002611936339296461 -0.15440512490312636 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9309065999687645 0.819431761367922 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -16 5)
"cameras/drone/drone0" SET Transform localScale (1.041357937324884 1.041357937324884 1.041357937324884)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -7 4)
"cameras/drone/drone1" SET Transform localScale (1.309066626175993 1.309066626175993 1.309066626175993)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.845612500238721 0)
"cameras" SET Transform eulerAngles (-11.143132069824881 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7274034180481346
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5217131040836898
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14188317400059056
"cameras/drone/drone0" SET Transform localPosition (-0.19124695404743663 -0.12447991840506317 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.078919141641151 1.0624533845624264 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -16 18)
"cameras/drone/drone0" SET Transform localScale (0.9853889698352329 0.9853889698352329 0.9853889698352329)
"cameras/drone/drone1" SET Transform localEulerAngles (17 11 -14)
"cameras/drone/drone1" SET Transform localScale (0.7398967341922704 0.7398967341922704 0.7398967341922704)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6681774842682215 0)
"cameras" SET Transform eulerAngles (2.3559510391435836 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4367469553471972
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0663595599119136
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02330904422160032
"cameras/drone/drone0" SET Transform localPosition (-1.0978062982515568 0.4742531419420399 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12054829722563176 0.8226935210425996 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -1 -20)
"cameras/drone/drone0" SET Transform localScale (1.4041283565179121 1.4041283565179121 1.4041283565179121)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -8 -14)
"cameras/drone/drone1" SET Transform localScale (0.8069438889920576 0.8069438889920576 0.8069438889920576)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.82497251826068 0)
"cameras" SET Transform eulerAngles (16.49559895770455 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4384792119074423
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.918259627857196
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29060657391631634
"cameras/drone/drone0" SET Transform localPosition (-0.6348057727867059 0.4907327481764952 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5364813664016386 0.9080930687273556 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 9 -18)
"cameras/drone/drone0" SET Transform localScale (0.7719169853168706 0.7719169853168706 0.7719169853168706)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -10 0)
"cameras/drone/drone1" SET Transform localScale (0.9466648480218292 0.9466648480218292 0.9466648480218292)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.057697732554579 0)
"cameras" SET Transform eulerAngles (4.969423054709097 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2427985374257715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9904466257586156
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04957935821057533
"cameras/drone/drone0" SET Transform localPosition (-0.5425689642646233 0.4132606148517794 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8353408319391897 1.0274455338093431 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 14 20)
"cameras/drone/drone0" SET Transform localScale (1.1034186099996317 1.1034186099996317 1.1034186099996317)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -9 -6)
"cameras/drone/drone1" SET Transform localScale (0.8719390673327414 0.8719390673327414 0.8719390673327414)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2231440185170688 0)
"cameras" SET Transform eulerAngles (8.200784346878809 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0837266483076027
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.480397731154747
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11412106447218795
"cameras/drone/drone0" SET Transform localPosition (1.110693991040128 -0.035540851120059724 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3660366376303168 1.2887925248114933 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -2 19)
"cameras/drone/drone0" SET Transform localScale (0.9591907224769807 0.9591907224769807 0.9591907224769807)
"cameras/drone/drone1" SET Transform localEulerAngles (20 9 -13)
"cameras/drone/drone1" SET Transform localScale (0.6503920703044138 0.6503920703044138 0.6503920703044138)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.186281317116011 0)
"cameras" SET Transform eulerAngles (-16.064854613655726 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.58141824798526
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9112327134658655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.055396597305525846
"cameras/drone/drone0" SET Transform localPosition (0.051765367666512185 0.2125879899517234 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8132924287073198 1.043199642091061 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 14 -5)
"cameras/drone/drone0" SET Transform localScale (1.3772519184863299 1.3772519184863299 1.3772519184863299)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 6 -19)
"cameras/drone/drone1" SET Transform localScale (1.403565525178297 1.403565525178297 1.403565525178297)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.86819724717485 0)
"cameras" SET Transform eulerAngles (6.603391460032732 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.216451854812306
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5757992842251416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3500367245415463
"cameras/drone/drone0" SET Transform localPosition (-0.9286458140743247 -0.12821940779008217 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.008601967123484489 1.0697462220399847 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -10 -9)
"cameras/drone/drone0" SET Transform localScale (0.7463620370343512 0.7463620370343512 0.7463620370343512)
"cameras/drone/drone1" SET Transform localEulerAngles (1 6 2)
"cameras/drone/drone1" SET Transform localScale (1.3736077157778959 1.3736077157778959 1.3736077157778959)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8854319024164 0)
"cameras" SET Transform eulerAngles (-10.198839044850928 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4690110359460031
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6706533171331683
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21757171746090018
"cameras/drone/drone0" SET Transform localPosition (-0.619300338835378 -0.16288553652157983 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.530370549179083 0.9364332849097697 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -14 12)
"cameras/drone/drone0" SET Transform localScale (1.2688899068458825 1.2688899068458825 1.2688899068458825)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -10 -11)
"cameras/drone/drone1" SET Transform localScale (0.7152694857186035 0.7152694857186035 0.7152694857186035)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.942135003365511 0)
"cameras" SET Transform eulerAngles (14.291483167270286 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.276389725701189
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7245853570047367
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36672729838727525
"cameras/drone/drone0" SET Transform localPosition (-1.1260507976516518 0.23628456051224872 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1330962285864523 1.220876966018303 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -19 8)
"cameras/drone/drone0" SET Transform localScale (0.7386165982034385 0.7386165982034385 0.7386165982034385)
"cameras/drone/drone1" SET Transform localEulerAngles (10 11 0)
"cameras/drone/drone1" SET Transform localScale (0.7175121252532173 0.7175121252532173 0.7175121252532173)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5773174309715876 0)
"cameras" SET Transform eulerAngles (15.496435180598446 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3128646579686505
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9259731571907944
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2990742399284058
"cameras/drone/drone0" SET Transform localPosition (0.5550228109699549 0.33041116545232946 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8936358887600899 1.0113939146777866 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -3 20)
"cameras/drone/drone0" SET Transform localScale (1.4720141600720238 1.4720141600720238 1.4720141600720238)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -15 18)
"cameras/drone/drone1" SET Transform localScale (1.2276715851870557 1.2276715851870557 1.2276715851870557)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7877084171473987 0)
"cameras" SET Transform eulerAngles (1.6612447968915056 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0449518018526698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9455467670465245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3103031532377753
"cameras/drone/drone0" SET Transform localPosition (-0.5616564613892183 0.12686978761663076 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6025079789541803 0.9735604496359507 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 6 -7)
"cameras/drone/drone0" SET Transform localScale (1.4811250144464876 1.4811250144464876 1.4811250144464876)
"cameras/drone/drone1" SET Transform localEulerAngles (11 7 -2)
"cameras/drone/drone1" SET Transform localScale (1.412572549633428 1.412572549633428 1.412572549633428)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.900971568219881 0)
"cameras" SET Transform eulerAngles (-1.5255304152085145 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2086657250860842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9088690863625736
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0680825677323783
"cameras/drone/drone0" SET Transform localPosition (0.23956352202890585 -0.2930195549690187 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3980929806041038 1.2290035235482282 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 12 7)
"cameras/drone/drone0" SET Transform localScale (1.1549771861542037 1.1549771861542037 1.1549771861542037)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -18 3)
"cameras/drone/drone1" SET Transform localScale (1.4686638557121328 1.4686638557121328 1.4686638557121328)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.882213137767465 0)
"cameras" SET Transform eulerAngles (10.350205725434755 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5568478511430973
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.506446036111404
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31689612755571345
"cameras/drone/drone0" SET Transform localPosition (0.9211783082352134 -0.2814696902237334 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.11798693607974187 0.8218614713188412 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -14 -2)
"cameras/drone/drone0" SET Transform localScale (1.194187245701244 1.194187245701244 1.194187245701244)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -2 19)
"cameras/drone/drone1" SET Transform localScale (1.2539022672154736 1.2539022672154736 1.2539022672154736)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.878717456328722 0)
"cameras" SET Transform eulerAngles (-17.644268844761207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4196502061245626
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3830415432713525
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3462559182168814
"cameras/drone/drone0" SET Transform localPosition (1.031153205582249 -0.275138138311441 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5905041713788686 1.171716070371641 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 10 0)
"cameras/drone/drone0" SET Transform localScale (1.337286468460129 1.337286468460129 1.337286468460129)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -10 -10)
"cameras/drone/drone1" SET Transform localScale (1.3099278824992142 1.3099278824992142 1.3099278824992142)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.648481807151777 0)
"cameras" SET Transform eulerAngles (-14.210554489746801 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5222728342593819
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9263117509383998
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04953168599836691
"cameras/drone/drone0" SET Transform localPosition (1.0717780045963512 0.2068594509908785 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.078897694917619 1.0203872297343595 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -18 -7)
"cameras/drone/drone0" SET Transform localScale (0.7434536728420003 0.7434536728420003 0.7434536728420003)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -18 5)
"cameras/drone/drone1" SET Transform localScale (1.3867079412212855 1.3867079412212855 1.3867079412212855)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.687120510150417 0)
"cameras" SET Transform eulerAngles (-3.4638824479437282 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5382197928072792
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.574440208702644
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1520550492853215
"cameras/drone/drone0" SET Transform localPosition (-1.0681917221591954 -0.1000091709917435 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12690168218086284 1.245041679274761 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 17 -20)
"cameras/drone/drone0" SET Transform localScale (0.9954282999972177 0.9954282999972177 0.9954282999972177)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 3 -6)
"cameras/drone/drone1" SET Transform localScale (0.6312291071880667 0.6312291071880667 0.6312291071880667)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.6564489283935995 0)
"cameras" SET Transform eulerAngles (16.293748224592527 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3308244719551876
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6431542257421357
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.007476516082984253
"cameras/drone/drone0" SET Transform localPosition (-0.36900007029038007 0.3691957909422228 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9537040036892833 1.0035387357237995 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 17 -10)
"cameras/drone/drone0" SET Transform localScale (1.269637404111648 1.269637404111648 1.269637404111648)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 3 20)
"cameras/drone/drone1" SET Transform localScale (1.3920791278730857 1.3920791278730857 1.3920791278730857)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.728532626087336 0)
"cameras" SET Transform eulerAngles (-12.08286377291397 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2786197210047425
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8785227908657074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21220112952640272
"cameras/drone/drone0" SET Transform localPosition (-0.8433413623928117 0.011079227409947878 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.104439811393888 0.8725615292679132 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -8 18)
"cameras/drone/drone0" SET Transform localScale (0.9395437033006808 0.9395437033006808 0.9395437033006808)
"cameras/drone/drone1" SET Transform localEulerAngles (7 2 6)
"cameras/drone/drone1" SET Transform localScale (1.0481713144806966 1.0481713144806966 1.0481713144806966)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.217472054038522 0)
"cameras" SET Transform eulerAngles (-18.578855126327525 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2613873314038968
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.690661408006377
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31635360849016547
"cameras/drone/drone0" SET Transform localPosition (1.0859196272211695 -0.1421266863729212 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1676684851247436 1.0026246760996396 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -5 14)
"cameras/drone/drone0" SET Transform localScale (0.9214615484517932 0.9214615484517932 0.9214615484517932)
"cameras/drone/drone1" SET Transform localEulerAngles (9 3 -19)
"cameras/drone/drone1" SET Transform localScale (0.6942619698299124 0.6942619698299124 0.6942619698299124)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.202564811023972 0)
"cameras" SET Transform eulerAngles (-4.528983209771514 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3614806008838807
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1301044314941497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3297739399972155
"cameras/drone/drone0" SET Transform localPosition (0.7088699465624486 -0.11907007560519361 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7995419162252779 1.2882022739034578 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 13 3)
"cameras/drone/drone0" SET Transform localScale (1.2518841995551833 1.2518841995551833 1.2518841995551833)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -19 13)
"cameras/drone/drone1" SET Transform localScale (1.2639006696875308 1.2639006696875308 1.2639006696875308)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.060665526705458 0)
"cameras" SET Transform eulerAngles (6.693641837135914 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3411955632885715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9836226744461493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31073639563325695
"cameras/drone/drone0" SET Transform localPosition (0.4594483897898054 -0.10295276016716509 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8245330447572627 1.180225760743646 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 18 -13)
"cameras/drone/drone0" SET Transform localScale (0.9359335762050971 0.9359335762050971 0.9359335762050971)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -6 -15)
"cameras/drone/drone1" SET Transform localScale (1.4858227441102998 1.4858227441102998 1.4858227441102998)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.886679003524092 0)
"cameras" SET Transform eulerAngles (15.370133453346085 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6773609301572121
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5937336725167417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05320403174740718
"cameras/drone/drone0" SET Transform localPosition (0.9027882167634191 -0.020673745457879977 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6281528461664855 0.8590495190151611 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -1 -5)
"cameras/drone/drone0" SET Transform localScale (1.179946958507788 1.179946958507788 1.179946958507788)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -6 10)
"cameras/drone/drone1" SET Transform localScale (1.164180687049101 1.164180687049101 1.164180687049101)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.44418627047063 0)
"cameras" SET Transform eulerAngles (8.02570146641407 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7979879416935349
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3728374509214345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08353799296459759
"cameras/drone/drone0" SET Transform localPosition (-1.1652926747381551 0.19359941878509918 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11318218881623676 0.9049005990902321 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -13 -1)
"cameras/drone/drone0" SET Transform localScale (1.4841374185892602 1.4841374185892602 1.4841374185892602)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 0 4)
"cameras/drone/drone1" SET Transform localScale (1.0486327108103253 1.0486327108103253 1.0486327108103253)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.32806424400365 0)
"cameras" SET Transform eulerAngles (-5.821032524644512 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8005551300902796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9521420657022328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2283943064328948
"cameras/drone/drone0" SET Transform localPosition (0.7027972971693461 0.4443930151869531 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09043156990896062 1.0029449265442814 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 12 11)
"cameras/drone/drone0" SET Transform localScale (1.3723812060633684 1.3723812060633684 1.3723812060633684)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -11 -9)
"cameras/drone/drone1" SET Transform localScale (0.6535723340818694 0.6535723340818694 0.6535723340818694)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.833780476980737 0)
"cameras" SET Transform eulerAngles (8.758506109098207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9835361875382457
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5129044463471502
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2198157911493009
"cameras/drone/drone0" SET Transform localPosition (0.736517859114205 0.2769649535004351 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9708382205067826 1.0584342422412927 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -15 -20)
"cameras/drone/drone0" SET Transform localScale (1.020489519136107 1.020489519136107 1.020489519136107)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -17 11)
"cameras/drone/drone1" SET Transform localScale (0.7448366843103853 0.7448366843103853 0.7448366843103853)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.682093202304279 0)
"cameras" SET Transform eulerAngles (1.6887255400384689 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1641807030107274
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6193182409026243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33366360847536713
"cameras/drone/drone0" SET Transform localPosition (-0.3876492268693781 0.1091454273708124 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9696131307406104 1.0121311148259005 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 20 19)
"cameras/drone/drone0" SET Transform localScale (1.1091110288219657 1.1091110288219657 1.1091110288219657)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -8 14)
"cameras/drone/drone1" SET Transform localScale (0.7543088189763832 0.7543088189763832 0.7543088189763832)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.424703345144719 0)
"cameras" SET Transform eulerAngles (16.067055934551057 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4560062551103935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9743567059666534
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06264030982578683
"cameras/drone/drone0" SET Transform localPosition (-0.5866115041894441 -0.03668393190111491 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.049568319497143 1.1540596581026044 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -15 -14)
"cameras/drone/drone0" SET Transform localScale (1.3906712294049868 1.3906712294049868 1.3906712294049868)
"cameras/drone/drone1" SET Transform localEulerAngles (16 4 15)
"cameras/drone/drone1" SET Transform localScale (1.0832870674451314 1.0832870674451314 1.0832870674451314)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5131745994269785 0)
"cameras" SET Transform eulerAngles (-19.008113622720625 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6222707032701241
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3662080416880649
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.263972725439206
"cameras/drone/drone0" SET Transform localPosition (-0.5014908488360247 0.13155380564051705 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.06211460564814186 0.881389166385527 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 17 1)
"cameras/drone/drone0" SET Transform localScale (1.0931044961782734 1.0931044961782734 1.0931044961782734)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -8 -9)
"cameras/drone/drone1" SET Transform localScale (0.6040239191444347 0.6040239191444347 0.6040239191444347)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.029853107612646 0)
"cameras" SET Transform eulerAngles (17.392387313655277 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7025287603813419
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4061233679749423
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08667331473765146
"cameras/drone/drone0" SET Transform localPosition (1.1918306727556185 0.3711157062286277 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8921863325915187 0.8930251340593915 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -10 20)
"cameras/drone/drone0" SET Transform localScale (1.0899223544303478 1.0899223544303478 1.0899223544303478)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -20 8)
"cameras/drone/drone1" SET Transform localScale (0.9267214891089639 0.9267214891089639 0.9267214891089639)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.493397801204963 0)
"cameras" SET Transform eulerAngles (7.103726894077088 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1823539564924728
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7229425654770174
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21961993767186627
"cameras/drone/drone0" SET Transform localPosition (-0.6257063381139517 -0.04789593312423329 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7829741199211953 1.1691707527612893 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -4 -12)
"cameras/drone/drone0" SET Transform localScale (1.300233828984617 1.300233828984617 1.300233828984617)
"cameras/drone/drone1" SET Transform localEulerAngles (2 20 -16)
"cameras/drone/drone1" SET Transform localScale (1.0481763284983387 1.0481763284983387 1.0481763284983387)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.399249926152454 0)
"cameras" SET Transform eulerAngles (8.922694870546657 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2520778783282545
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6264815419828418
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13008845043387574
"cameras/drone/drone0" SET Transform localPosition (-1.1042877763085202 0.6180039687840178 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8902687074548707 0.8599417949625381 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 18 10)
"cameras/drone/drone0" SET Transform localScale (0.8636401416504693 0.8636401416504693 0.8636401416504693)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -2 -15)
"cameras/drone/drone1" SET Transform localScale (0.9538982283895889 0.9538982283895889 0.9538982283895889)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
