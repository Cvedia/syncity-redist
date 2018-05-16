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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 153 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 43 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET Transform position (0 39 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-10.776828415615462 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 60
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.7250264428059094 0)
"cameras" SET Transform eulerAngles (-7.390646004913375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5072228256187379
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3299206700653863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17710203888594098
"cameras/drone/drone0" SET Transform localPosition (1.111933472428383 0.15954797816213723 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17013837219683214 1.2789749537596133 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 0 11)
"cameras/drone/drone0" SET Transform localScale (0.9191080807230052 0.9191080807230052 0.9191080807230052)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -16 0)
"cameras/drone/drone1" SET Transform localScale (1.1732236649323327 1.1732236649323327 1.1732236649323327)
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
"cameras" SET Transform position (0 4.8522191271091 0)
"cameras" SET Transform eulerAngles (-1.748088527969255 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.673229177230883
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5413797890386665
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07828042787285852
"cameras/drone/drone0" SET Transform localPosition (-0.4708145136430485 0.4461709501146291 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8441716635731538 1.1627966905244997 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 1 17)
"cameras/drone/drone0" SET Transform localScale (1.4289443924239327 1.4289443924239327 1.4289443924239327)
"cameras/drone/drone1" SET Transform localEulerAngles (3 12 -19)
"cameras/drone/drone1" SET Transform localScale (1.0602795447454967 1.0602795447454967 1.0602795447454967)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.894545305702307 0)
"cameras" SET Transform eulerAngles (-4.072795405313695 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5841488999319497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6550517485298202
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3070992462881886
"cameras/drone/drone0" SET Transform localPosition (0.6308339993398253 0.21229360187001883 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8015599191618856 1.188160512392287 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 2 13)
"cameras/drone/drone0" SET Transform localScale (1.2783399420750803 1.2783399420750803 1.2783399420750803)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -18 -9)
"cameras/drone/drone1" SET Transform localScale (1.4341971596772451 1.4341971596772451 1.4341971596772451)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.989913759098801 0)
"cameras" SET Transform eulerAngles (-13.770133259271828 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4109878536359317
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7234259981822975
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1310074503979013
"cameras/drone/drone0" SET Transform localPosition (0.18051005553380128 0.2982424908118641 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1239611246673249 1.2707795332973675 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 1 -12)
"cameras/drone/drone0" SET Transform localScale (0.9017510178038877 0.9017510178038877 0.9017510178038877)
"cameras/drone/drone1" SET Transform localEulerAngles (10 15 2)
"cameras/drone/drone1" SET Transform localScale (1.2556096716345952 1.2556096716345952 1.2556096716345952)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.950556265032806 0)
"cameras" SET Transform eulerAngles (-5.97333022067312 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7500978398291906
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8575687713075557
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3426066954218267
"cameras/drone/drone0" SET Transform localPosition (-0.4261351502782671 0.5534400306526703 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.066381289788594 1.03658077737802 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 6 -16)
"cameras/drone/drone0" SET Transform localScale (1.0395377456676176 1.0395377456676176 1.0395377456676176)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -6 -12)
"cameras/drone/drone1" SET Transform localScale (1.1131016665039746 1.1131016665039746 1.1131016665039746)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.017553803352661 0)
"cameras" SET Transform eulerAngles (13.778214929588401 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.530225451344807
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8200307735343464
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07744337226349583
"cameras/drone/drone0" SET Transform localPosition (-0.8021001446541902 0.6557099604269268 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5013945014976195 0.8366158434704938 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -16 -3)
"cameras/drone/drone0" SET Transform localScale (0.9794637197058246 0.9794637197058246 0.9794637197058246)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -19 -10)
"cameras/drone/drone1" SET Transform localScale (1.1307686149694516 1.1307686149694516 1.1307686149694516)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.348203138658118 0)
"cameras" SET Transform eulerAngles (-2.470632275255742 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3687516180629182
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8644003953995685
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1371209043054225
"cameras/drone/drone0" SET Transform localPosition (-0.22099327307510064 0.08655366713522766 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32582920161064455 1.1485456442148587 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 19 -15)
"cameras/drone/drone0" SET Transform localScale (1.1753197744884254 1.1753197744884254 1.1753197744884254)
"cameras/drone/drone1" SET Transform localEulerAngles (1 19 -20)
"cameras/drone/drone1" SET Transform localScale (1.356352651838041 1.356352651838041 1.356352651838041)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3552886556410644 0)
"cameras" SET Transform eulerAngles (-15.8905257606136 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2001411063425838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.274539868353361
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16040638148453623
"cameras/drone/drone0" SET Transform localPosition (-0.8901916936793584 -0.05758847690253138 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7772171010565294 0.8061571496411157 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 0 17)
"cameras/drone/drone0" SET Transform localScale (1.4271495149472815 1.4271495149472815 1.4271495149472815)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -7 -5)
"cameras/drone/drone1" SET Transform localScale (0.61986378608624 0.61986378608624 0.61986378608624)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9604737353942596 0)
"cameras" SET Transform eulerAngles (-9.20857537761635 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8546832573653129
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.016377870445333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05026382757778661
"cameras/drone/drone0" SET Transform localPosition (0.9343435103901572 0.5719600002943286 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5564535960130692 1.1017251594658801 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -10 12)
"cameras/drone/drone0" SET Transform localScale (0.8194874703702391 0.8194874703702391 0.8194874703702391)
"cameras/drone/drone1" SET Transform localEulerAngles (11 10 3)
"cameras/drone/drone1" SET Transform localScale (1.4175910578471669 1.4175910578471669 1.4175910578471669)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2896428263055784 0)
"cameras" SET Transform eulerAngles (-5.435334993665464 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0628559094947985
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0351232730051902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23638177133468985
"cameras/drone/drone0" SET Transform localPosition (0.5565341738854173 -0.06623387921993013 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3576413050950793 1.279778491415303 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -12 -13)
"cameras/drone/drone0" SET Transform localScale (1.2452176799393553 1.2452176799393553 1.2452176799393553)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -12 -9)
"cameras/drone/drone1" SET Transform localScale (1.4364812697861462 1.4364812697861462 1.4364812697861462)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.757812696613332 0)
"cameras" SET Transform eulerAngles (19.609019742654375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0650254182068808
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9692593665973918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3290459685240605
"cameras/drone/drone0" SET Transform localPosition (0.2655320309960403 0.06514152950101865 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7831723903441654 1.0947741286225545 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 15 -9)
"cameras/drone/drone0" SET Transform localScale (1.4223135768343087 1.4223135768343087 1.4223135768343087)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -3 7)
"cameras/drone/drone1" SET Transform localScale (1.141093014000616 1.141093014000616 1.141093014000616)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2239025623455433 0)
"cameras" SET Transform eulerAngles (-1.6263755364494088 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9451343035382294
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4677535445795993
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3532691036389368
"cameras/drone/drone0" SET Transform localPosition (0.03268962604956127 0.10883325318311005 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9777732587685011 0.9634891678373763 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -16 -1)
"cameras/drone/drone0" SET Transform localScale (0.753704781228693 0.753704781228693 0.753704781228693)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -15 19)
"cameras/drone/drone1" SET Transform localScale (0.9422927123565966 0.9422927123565966 0.9422927123565966)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.154471890400955 0)
"cameras" SET Transform eulerAngles (16.643164651981735 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.080027686422331
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9255491776162001
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30572581320500475
"cameras/drone/drone0" SET Transform localPosition (-0.19415040427773644 -0.10306050322100652 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09231660435681288 1.1252106425919604 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 11 0)
"cameras/drone/drone0" SET Transform localScale (1.043939787053138 1.043939787053138 1.043939787053138)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 0 -7)
"cameras/drone/drone1" SET Transform localScale (1.0765523282947917 1.0765523282947917 1.0765523282947917)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.052318971338892 0)
"cameras" SET Transform eulerAngles (-6.911340485961759 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4005102242010901
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3523562228379042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28323814681279763
"cameras/drone/drone0" SET Transform localPosition (-0.6301215444368103 0.30033149892189054 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5160422773447642 1.1092656622624526 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -15 10)
"cameras/drone/drone0" SET Transform localScale (1.4800198418722856 1.4800198418722856 1.4800198418722856)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -16 12)
"cameras/drone/drone1" SET Transform localScale (1.0483738634767745 1.0483738634767745 1.0483738634767745)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.609070365829329 0)
"cameras" SET Transform eulerAngles (-2.2121969400232153 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5861515255195076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3722994478167114
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1886490881994657
"cameras/drone/drone0" SET Transform localPosition (0.4443466466581816 0.3679141000886505 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.35169768979565097 1.082152742401508 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -19 -6)
"cameras/drone/drone0" SET Transform localScale (1.1177511113868417 1.1177511113868417 1.1177511113868417)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -6 -20)
"cameras/drone/drone1" SET Transform localScale (1.1106654796139157 1.1106654796139157 1.1106654796139157)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.548102718524677 0)
"cameras" SET Transform eulerAngles (5.820143047759036 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2301510643594002
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7446017125942466
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39070495510062353
"cameras/drone/drone0" SET Transform localPosition (-0.4411233194159476 0.3398916904535793 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5807812099200376 1.12704119274138 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -4 14)
"cameras/drone/drone0" SET Transform localScale (1.4965231376224333 1.4965231376224333 1.4965231376224333)
"cameras/drone/drone1" SET Transform localEulerAngles (13 6 -7)
"cameras/drone/drone1" SET Transform localScale (1.474270831941723 1.474270831941723 1.474270831941723)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0473115009746135 0)
"cameras" SET Transform eulerAngles (-8.3820361069946 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7381785180898606
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.980329504970935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32790902015081236
"cameras/drone/drone0" SET Transform localPosition (0.765332750189623 0.20971013327091886 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0919208017176194 1.0226772604832775 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -13 5)
"cameras/drone/drone0" SET Transform localScale (0.9146354518603391 0.9146354518603391 0.9146354518603391)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 2 -20)
"cameras/drone/drone1" SET Transform localScale (1.126170267510874 1.126170267510874 1.126170267510874)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.666688953622514 0)
"cameras" SET Transform eulerAngles (5.013294562668129 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.01544027372071
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9606187071990694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11058585929223015
"cameras/drone/drone0" SET Transform localPosition (-0.5592770469163226 0.6360563979945086 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8036917355478284 1.1738181022539518 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -16 -12)
"cameras/drone/drone0" SET Transform localScale (0.8973240864616384 0.8973240864616384 0.8973240864616384)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -14 -2)
"cameras/drone/drone1" SET Transform localScale (0.9534934327933143 0.9534934327933143 0.9534934327933143)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.381680060922674 0)
"cameras" SET Transform eulerAngles (13.921912927045966 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.169917012079575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4944913781148654
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03774113385250577
"cameras/drone/drone0" SET Transform localPosition (0.7974872154337687 -0.20827513791754132 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2778800068054297 0.8273770472080477 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 0 0)
"cameras/drone/drone0" SET Transform localScale (0.7313478584481482 0.7313478584481482 0.7313478584481482)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 15 -11)
"cameras/drone/drone1" SET Transform localScale (0.6622635579306313 0.6622635579306313 0.6622635579306313)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2316338283825097 0)
"cameras" SET Transform eulerAngles (-10.687322794283315 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1472842463790913
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.29664057782136
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16673658703388955
"cameras/drone/drone0" SET Transform localPosition (-0.4364802168906232 0.2911395486382587 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8273443196024253 1.1821057865624665 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 11 -10)
"cameras/drone/drone0" SET Transform localScale (0.6143507620399907 0.6143507620399907 0.6143507620399907)
"cameras/drone/drone1" SET Transform localEulerAngles (19 14 -11)
"cameras/drone/drone1" SET Transform localScale (1.3840139235911386 1.3840139235911386 1.3840139235911386)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6145890752610375 0)
"cameras" SET Transform eulerAngles (-8.1848979896489 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41739973758664095
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7323435263360918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3237797981697739
"cameras/drone/drone0" SET Transform localPosition (0.40381703760576215 0.08182192913596681 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1486927114780423 1.1635396837797505 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -4 -7)
"cameras/drone/drone0" SET Transform localScale (1.0009785737472474 1.0009785737472474 1.0009785737472474)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -3 12)
"cameras/drone/drone1" SET Transform localScale (1.0996071292684362 1.0996071292684362 1.0996071292684362)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.815951483119236 0)
"cameras" SET Transform eulerAngles (18.872320215395227 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.258658008305833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2772352432226355
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09692682233078852
"cameras/drone/drone0" SET Transform localPosition (-0.760797238420756 0.5096994230297933 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.07847446309865136 1.165370731499328 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 16 10)
"cameras/drone/drone0" SET Transform localScale (0.9412453932523228 0.9412453932523228 0.9412453932523228)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -4 17)
"cameras/drone/drone1" SET Transform localScale (1.2229362967305084 1.2229362967305084 1.2229362967305084)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.551208530950719 0)
"cameras" SET Transform eulerAngles (-1.7462913738694184 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4603448308854419
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.176318882404599
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17879273997751524
"cameras/drone/drone0" SET Transform localPosition (-0.3626212325793563 0.11701971202735023 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8451923873915421 1.2376302981274951 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 11 19)
"cameras/drone/drone0" SET Transform localScale (0.7273492973564345 0.7273492973564345 0.7273492973564345)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 15 1)
"cameras/drone/drone1" SET Transform localScale (1.0695948400316433 1.0695948400316433 1.0695948400316433)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.257148561390653 0)
"cameras" SET Transform eulerAngles (7.575497836583512 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9480237955049698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2885645260699359
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39821271644198514
"cameras/drone/drone0" SET Transform localPosition (-1.0608962547789123 0.0105405340810098 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6898464664396258 0.9516768693894324 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 16 -9)
"cameras/drone/drone0" SET Transform localScale (0.8961804197115508 0.8961804197115508 0.8961804197115508)
"cameras/drone/drone1" SET Transform localEulerAngles (3 19 0)
"cameras/drone/drone1" SET Transform localScale (0.8816430619888078 0.8816430619888078 0.8816430619888078)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.484765847967466 0)
"cameras" SET Transform eulerAngles (-0.5825976997958264 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42702641958350074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4768049916835784
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11309661625034569
"cameras/drone/drone0" SET Transform localPosition (1.1258720734302397 0.4616581419787091 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.36846634870442785 1.2236591899966085 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 17 20)
"cameras/drone/drone0" SET Transform localScale (0.6334762316563846 0.6334762316563846 0.6334762316563846)
"cameras/drone/drone1" SET Transform localEulerAngles (17 4 -3)
"cameras/drone/drone1" SET Transform localScale (1.1887221914153754 1.1887221914153754 1.1887221914153754)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9101021346842737 0)
"cameras" SET Transform eulerAngles (19.824016726849045 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2692581159412057
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.920778627051352
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3827400811322403
"cameras/drone/drone0" SET Transform localPosition (0.9112599828597288 0.3125411369050605 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17332673636274043 1.0714445285189784 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -6 -9)
"cameras/drone/drone0" SET Transform localScale (1.327221630107628 1.327221630107628 1.327221630107628)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -7 -16)
"cameras/drone/drone1" SET Transform localScale (0.9111410249147616 0.9111410249147616 0.9111410249147616)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5973082958251945 0)
"cameras" SET Transform eulerAngles (17.921163652924562 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49678184838961514
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1166809019371
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14660793533763364
"cameras/drone/drone0" SET Transform localPosition (-0.5427701740429037 -0.005377767377705178 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0944502350974392 0.9230106028866567 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 4 13)
"cameras/drone/drone0" SET Transform localScale (1.097646840416333 1.097646840416333 1.097646840416333)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 20 -7)
"cameras/drone/drone1" SET Transform localScale (1.1215730489801379 1.1215730489801379 1.1215730489801379)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.206795665706447 0)
"cameras" SET Transform eulerAngles (18.046014161800095 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5724001813809704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7892004075068846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3721891876822826
"cameras/drone/drone0" SET Transform localPosition (0.46455996367944685 0.23962647616953497 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11598233006435077 0.9536338052495511 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -19 -3)
"cameras/drone/drone0" SET Transform localScale (1.3988414246105134 1.3988414246105134 1.3988414246105134)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 4 14)
"cameras/drone/drone1" SET Transform localScale (1.3378156164824557 1.3378156164824557 1.3378156164824557)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0737529716081777 0)
"cameras" SET Transform eulerAngles (-6.057021279807881 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2783798375529627
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7627439875732478
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.374991823019777
"cameras/drone/drone0" SET Transform localPosition (0.9511834339209246 -0.25362616451617 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5219144045259883 1.110368058897081 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 19 -9)
"cameras/drone/drone0" SET Transform localScale (1.432229087426383 1.432229087426383 1.432229087426383)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -2 17)
"cameras/drone/drone1" SET Transform localScale (0.6336281492206757 0.6336281492206757 0.6336281492206757)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.487644705273976 0)
"cameras" SET Transform eulerAngles (15.776333960471753 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0871683784472197
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2934700880062717
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29592249061261394
"cameras/drone/drone0" SET Transform localPosition (1.1172727569938743 0.5931285041639773 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06822893821819687 1.1083859498019573 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -7 -17)
"cameras/drone/drone0" SET Transform localScale (1.111982080006485 1.111982080006485 1.111982080006485)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 14 0)
"cameras/drone/drone1" SET Transform localScale (0.6235156109198755 0.6235156109198755 0.6235156109198755)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.72653250019183 0)
"cameras" SET Transform eulerAngles (-5.0629017880931535 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1958202486920095
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9449475989105813
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32605822209367535
"cameras/drone/drone0" SET Transform localPosition (0.47242969450371186 0.6971104847869412 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9703380879023695 0.9010464686119619 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -17 -6)
"cameras/drone/drone0" SET Transform localScale (1.0100136306772602 1.0100136306772602 1.0100136306772602)
"cameras/drone/drone1" SET Transform localEulerAngles (17 1 0)
"cameras/drone/drone1" SET Transform localScale (0.7538180802507215 0.7538180802507215 0.7538180802507215)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4100208442917594 0)
"cameras" SET Transform eulerAngles (-1.2694648974871825 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1793577528625578
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5116138049352466
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24157951107918715
"cameras/drone/drone0" SET Transform localPosition (-0.33821562300763486 0.4323841984043741 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8618707929458885 1.220223676554612 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 2 13)
"cameras/drone/drone0" SET Transform localScale (1.249991221938683 1.249991221938683 1.249991221938683)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -15 -9)
"cameras/drone/drone1" SET Transform localScale (0.9985772512855633 0.9985772512855633 0.9985772512855633)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5446151434762 0)
"cameras" SET Transform eulerAngles (19.258082771090095 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2471927612594584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2667799134770972
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22556149254564506
"cameras/drone/drone0" SET Transform localPosition (-0.534695181789797 0.337739458056773 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9141360410360748 1.241258177649181 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -14 -3)
"cameras/drone/drone0" SET Transform localScale (1.2543184402188532 1.2543184402188532 1.2543184402188532)
"cameras/drone/drone1" SET Transform localEulerAngles (3 2 -4)
"cameras/drone/drone1" SET Transform localScale (1.1393255645821037 1.1393255645821037 1.1393255645821037)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.68408891656678 0)
"cameras" SET Transform eulerAngles (-1.373110740962261 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9356293869565216
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.051270889437665
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.083535650385363
"cameras/drone/drone0" SET Transform localPosition (-0.7413470229073793 0.4423666390985544 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1704741236016976 1.204910244927325 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 3 -20)
"cameras/drone/drone0" SET Transform localScale (0.977560496498407 0.977560496498407 0.977560496498407)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 12 7)
"cameras/drone/drone1" SET Transform localScale (1.3126837760734618 1.3126837760734618 1.3126837760734618)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.485195200598081 0)
"cameras" SET Transform eulerAngles (16.961444466491315 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9105268177342739
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.438001390222118
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.026659528261532242
"cameras/drone/drone0" SET Transform localPosition (0.19922738476258117 -0.15053888462113146 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6440142164976865 1.083598508094995 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -14 -16)
"cameras/drone/drone0" SET Transform localScale (1.0520674632475968 1.0520674632475968 1.0520674632475968)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 20 2)
"cameras/drone/drone1" SET Transform localScale (0.6851357678712185 0.6851357678712185 0.6851357678712185)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.945348341378958 0)
"cameras" SET Transform eulerAngles (13.705838779932165 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8185706397053286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.974408268654929
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2053719248467854
"cameras/drone/drone0" SET Transform localPosition (0.5401557342584631 0.37288870966488546 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5376818228788569 0.8718406002651304 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 1 5)
"cameras/drone/drone0" SET Transform localScale (1.3451060396452155 1.3451060396452155 1.3451060396452155)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -20 1)
"cameras/drone/drone1" SET Transform localScale (1.1396667325515286 1.1396667325515286 1.1396667325515286)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.650293674760367 0)
"cameras" SET Transform eulerAngles (-6.746623895467145 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9573461660661545
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2394043828180326
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3911775141281375
"cameras/drone/drone0" SET Transform localPosition (-0.08842708467081328 -0.020411040898633714 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3586431165134545 0.8175897426880505 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 12 -5)
"cameras/drone/drone0" SET Transform localScale (1.2018713633982274 1.2018713633982274 1.2018713633982274)
"cameras/drone/drone1" SET Transform localEulerAngles (3 9 12)
"cameras/drone/drone1" SET Transform localScale (1.0209068718279326 1.0209068718279326 1.0209068718279326)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.254643739462926 0)
"cameras" SET Transform eulerAngles (6.508422940362863 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0638307532695261
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9166956310921408
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3571024058776822
"cameras/drone/drone0" SET Transform localPosition (-0.1567936165807189 0.34492218163601024 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17505410150862422 1.2871355078423496 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -18 -5)
"cameras/drone/drone0" SET Transform localScale (0.9115230883075722 0.9115230883075722 0.9115230883075722)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -18 10)
"cameras/drone/drone1" SET Transform localScale (1.3098259611630612 1.3098259611630612 1.3098259611630612)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.643706951067227 0)
"cameras" SET Transform eulerAngles (10.322991288775448 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8840014586975825
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7727224719050767
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22973915192858152
"cameras/drone/drone0" SET Transform localPosition (1.0994424826274785 0.42848402994075135 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.49686379200921094 1.2794629870494565 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 6 -6)
"cameras/drone/drone0" SET Transform localScale (0.8951807051622702 0.8951807051622702 0.8951807051622702)
"cameras/drone/drone1" SET Transform localEulerAngles (11 14 15)
"cameras/drone/drone1" SET Transform localScale (1.2020692855166761 1.2020692855166761 1.2020692855166761)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.697538843194982 0)
"cameras" SET Transform eulerAngles (18.372317369755308 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49858728531979624
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0651733785109418
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3196716246982123
"cameras/drone/drone0" SET Transform localPosition (-1.198268771253531 0.36888494588533766 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1257059056566536 1.2353395850198656 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 3 14)
"cameras/drone/drone0" SET Transform localScale (1.4532804669017074 1.4532804669017074 1.4532804669017074)
"cameras/drone/drone1" SET Transform localEulerAngles (18 9 -18)
"cameras/drone/drone1" SET Transform localScale (1.3097392360501037 1.3097392360501037 1.3097392360501037)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.637376617244816 0)
"cameras" SET Transform eulerAngles (-16.961224235735997 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.562310004237304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5155784392604117
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2734223677820093
"cameras/drone/drone0" SET Transform localPosition (-0.20541051910611152 -0.18320706915429658 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.177398422204943 0.8002716806062022 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 18 4)
"cameras/drone/drone0" SET Transform localScale (1.2241727910308136 1.2241727910308136 1.2241727910308136)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -14 19)
"cameras/drone/drone1" SET Transform localScale (0.6662476918614358 0.6662476918614358 0.6662476918614358)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.444903723921376 0)
"cameras" SET Transform eulerAngles (17.778719101383544 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.563723195670976
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.329680035661377
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15281094327793082
"cameras/drone/drone0" SET Transform localPosition (0.18671322938887802 0.6883934500858824 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9878320924964792 0.9589821686234237 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 4 0)
"cameras/drone/drone0" SET Transform localScale (1.4865205822367717 1.4865205822367717 1.4865205822367717)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 19 15)
"cameras/drone/drone1" SET Transform localScale (0.8178470722181607 0.8178470722181607 0.8178470722181607)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.446866076112038 0)
"cameras" SET Transform eulerAngles (1.9706547476322456 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9098636359470149
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6846930903385728
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3697918703221579
"cameras/drone/drone0" SET Transform localPosition (-0.9246060833539733 0.011897614039466375 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.603695138368542 1.238380493128327 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 13 -19)
"cameras/drone/drone0" SET Transform localScale (0.9224905822736145 0.9224905822736145 0.9224905822736145)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -4 13)
"cameras/drone/drone1" SET Transform localScale (1.0660740213977946 1.0660740213977946 1.0660740213977946)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.34371430281343 0)
"cameras" SET Transform eulerAngles (12.0699605655348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6717632090696701
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5182065702642038
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31331807605338335
"cameras/drone/drone0" SET Transform localPosition (-0.8123837803913248 -0.17223252372280057 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7561207572099948 0.93940889737492 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -12 4)
"cameras/drone/drone0" SET Transform localScale (0.8421597851362614 0.8421597851362614 0.8421597851362614)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 11 13)
"cameras/drone/drone1" SET Transform localScale (1.3103904241121842 1.3103904241121842 1.3103904241121842)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.90328203537565 0)
"cameras" SET Transform eulerAngles (15.769674157140898 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.340910638926466
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3188355537212217
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3000943247522623
"cameras/drone/drone0" SET Transform localPosition (-0.3167384512429613 -0.050121800001411254 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16671037996184213 1.119510611433387 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -19 -3)
"cameras/drone/drone0" SET Transform localScale (1.2317641063122 1.2317641063122 1.2317641063122)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -5 -3)
"cameras/drone/drone1" SET Transform localScale (1.0672845887250375 1.0672845887250375 1.0672845887250375)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4887599733675927 0)
"cameras" SET Transform eulerAngles (6.929268122097323 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3724625527400347
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.915658186589536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19432432362012975
"cameras/drone/drone0" SET Transform localPosition (-0.5060119492992273 0.6543156116626276 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4524418273590366 1.1514016428396285 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 13 -10)
"cameras/drone/drone0" SET Transform localScale (1.1165665693810256 1.1165665693810256 1.1165665693810256)
"cameras/drone/drone1" SET Transform localEulerAngles (10 6 2)
"cameras/drone/drone1" SET Transform localScale (0.8872371822235967 0.8872371822235967 0.8872371822235967)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.381172846828987 0)
"cameras" SET Transform eulerAngles (15.249060254332207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5781912956636117
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3732875620785006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2521467014913493
"cameras/drone/drone0" SET Transform localPosition (0.44066539802334237 0.12714544840833725 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5666246541593765 1.1051636979010737 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 9 -20)
"cameras/drone/drone0" SET Transform localScale (0.7741292110382535 0.7741292110382535 0.7741292110382535)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -8 11)
"cameras/drone/drone1" SET Transform localScale (1.2102314606475373 1.2102314606475373 1.2102314606475373)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6681626512337617 0)
"cameras" SET Transform eulerAngles (10.39222242783815 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1069763906061205
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.162904858053436
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03293297617636681
"cameras/drone/drone0" SET Transform localPosition (0.2999350443854727 -0.06661932360030715 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2959649315114248 1.24851626521763 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 7 -9)
"cameras/drone/drone0" SET Transform localScale (1.246077667042817 1.246077667042817 1.246077667042817)
"cameras/drone/drone1" SET Transform localEulerAngles (16 10 -1)
"cameras/drone/drone1" SET Transform localScale (1.4910421035606967 1.4910421035606967 1.4910421035606967)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6726188173665344 0)
"cameras" SET Transform eulerAngles (15.252502017281394 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9123673846325969
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9458712741416204
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08488235314014464
"cameras/drone/drone0" SET Transform localPosition (-0.33505306628122666 -0.1040202173779558 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.197440941937788 0.8929184948359203 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -10 3)
"cameras/drone/drone0" SET Transform localScale (1.1959299142108677 1.1959299142108677 1.1959299142108677)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 8 -11)
"cameras/drone/drone1" SET Transform localScale (0.646173539787695 0.646173539787695 0.646173539787695)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.927211719577002 0)
"cameras" SET Transform eulerAngles (11.886239703380209 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9731479342508808
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9863247130140896
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.00985510787690802
"cameras/drone/drone0" SET Transform localPosition (-0.10403224744612904 0.2975722805516729 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3220577742118498 0.8043243453634703 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -11 -19)
"cameras/drone/drone0" SET Transform localScale (1.4756952635050191 1.4756952635050191 1.4756952635050191)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -10 18)
"cameras/drone/drone1" SET Transform localScale (1.4196793653617685 1.4196793653617685 1.4196793653617685)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.520128322663076 0)
"cameras" SET Transform eulerAngles (-7.860421454194508 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44035215349378865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.438615074414991
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09851209989871622
"cameras/drone/drone0" SET Transform localPosition (-0.5110284534576423 0.5673793459771859 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.128920237672781 1.2309166298659036 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -1 -8)
"cameras/drone/drone0" SET Transform localScale (0.8487779332183398 0.8487779332183398 0.8487779332183398)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 2 -12)
"cameras/drone/drone1" SET Transform localScale (1.1442316553659273 1.1442316553659273 1.1442316553659273)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3269090303451208 0)
"cameras" SET Transform eulerAngles (18.662097086047524 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2248316941337776
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3323764363114923
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38612939732568785
"cameras/drone/drone0" SET Transform localPosition (0.7086920479131644 0.3959531087730272 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3666376928047157 1.144440634222338 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 2 2)
"cameras/drone/drone0" SET Transform localScale (1.466322842574395 1.466322842574395 1.466322842574395)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -7 1)
"cameras/drone/drone1" SET Transform localScale (1.1953715025327525 1.1953715025327525 1.1953715025327525)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.435684954113734 0)
"cameras" SET Transform eulerAngles (-4.01026652160283 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45737219754810365
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6049508397643542
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04106460591072456
"cameras/drone/drone0" SET Transform localPosition (-1.1766122545995301 0.05927227727790857 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6301000871547818 0.9063141986807308 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -10 0)
"cameras/drone/drone0" SET Transform localScale (0.9005913847573059 0.9005913847573059 0.9005913847573059)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -16 1)
"cameras/drone/drone1" SET Transform localScale (0.7743190585959564 0.7743190585959564 0.7743190585959564)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.06907670046661 0)
"cameras" SET Transform eulerAngles (4.151036423863395 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5993258645736024
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9386165834970006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10795223052016478
"cameras/drone/drone0" SET Transform localPosition (0.18012864513955962 0.14616283862578888 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.13759480643469 1.2577919964099007 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -14 -8)
"cameras/drone/drone0" SET Transform localScale (0.6790841436691177 0.6790841436691177 0.6790841436691177)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -9 8)
"cameras/drone/drone1" SET Transform localScale (1.4717737107596434 1.4717737107596434 1.4717737107596434)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.679855172380786 0)
"cameras" SET Transform eulerAngles (5.21745358592819 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6902729877221746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3496726574221547
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07026218919022323
"cameras/drone/drone0" SET Transform localPosition (-0.7435645960564483 -0.09550942928231881 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.14885595613782399 0.802096672423153 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 11 7)
"cameras/drone/drone0" SET Transform localScale (0.90335079377468 0.90335079377468 0.90335079377468)
"cameras/drone/drone1" SET Transform localEulerAngles (3 0 6)
"cameras/drone/drone1" SET Transform localScale (1.0284357728795337 1.0284357728795337 1.0284357728795337)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.555807983286204 0)
"cameras" SET Transform eulerAngles (-9.870858813125105 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3964578261232936
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0678821925098785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26991400069608196
"cameras/drone/drone0" SET Transform localPosition (-0.5185310353481171 -0.23593695406926413 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.010419923238153661 0.8055898556330972 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -8 0)
"cameras/drone/drone0" SET Transform localScale (0.8822845419297772 0.8822845419297772 0.8822845419297772)
"cameras/drone/drone1" SET Transform localEulerAngles (9 11 20)
"cameras/drone/drone1" SET Transform localScale (0.9820661317114466 0.9820661317114466 0.9820661317114466)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.9474183834885865 0)
"cameras" SET Transform eulerAngles (13.282927092752345 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5525432391453209
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9351902635711116
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0738453406579879
"cameras/drone/drone0" SET Transform localPosition (0.6911175944659507 0.285462149798483 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1429705651759725 1.1107528488617837 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 15 -10)
"cameras/drone/drone0" SET Transform localScale (1.2040724047587594 1.2040724047587594 1.2040724047587594)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -16 -17)
"cameras/drone/drone1" SET Transform localScale (1.3465983586887518 1.3465983586887518 1.3465983586887518)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.817430324004045 0)
"cameras" SET Transform eulerAngles (8.777211454431896 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8996993907125548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9558611993701449
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3525050874113609
"cameras/drone/drone0" SET Transform localPosition (1.0490807377646993 0.4763921171924325 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5590207952854347 1.040567042567702 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -2 -10)
"cameras/drone/drone0" SET Transform localScale (1.3440480539977426 1.3440480539977426 1.3440480539977426)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 18 -4)
"cameras/drone/drone1" SET Transform localScale (0.6854948857866269 0.6854948857866269 0.6854948857866269)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2832851651319683 0)
"cameras" SET Transform eulerAngles (15.355290449455552 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7435611820571075
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9962147838450157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16547560523059668
"cameras/drone/drone0" SET Transform localPosition (-0.50483200538611 0.2913362460988735 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6920145313254018 0.8747689336123243 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -3 -17)
"cameras/drone/drone0" SET Transform localScale (0.6258949411408643 0.6258949411408643 0.6258949411408643)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -5 12)
"cameras/drone/drone1" SET Transform localScale (0.9231919681531602 0.9231919681531602 0.9231919681531602)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.862853817448669 0)
"cameras" SET Transform eulerAngles (13.973372509928353 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3251828797373166
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3864652038374068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1561925588588005
"cameras/drone/drone0" SET Transform localPosition (-0.2873157956133239 0.6399142865738281 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.06224521876912803 1.041158200997208 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 12 20)
"cameras/drone/drone0" SET Transform localScale (0.6988207458819482 0.6988207458819482 0.6988207458819482)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -4 -15)
"cameras/drone/drone1" SET Transform localScale (1.1872651450506875 1.1872651450506875 1.1872651450506875)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.053586670584048 0)
"cameras" SET Transform eulerAngles (-0.2769379090247668 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1861497212359402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1627111530493486
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05995913502195549
"cameras/drone/drone0" SET Transform localPosition (-0.8846489292806454 0.2558869217777792 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0405005957955913 1.2249254854137275 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 11 -19)
"cameras/drone/drone0" SET Transform localScale (0.9105037520801014 0.9105037520801014 0.9105037520801014)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -14 -7)
"cameras/drone/drone1" SET Transform localScale (0.8114913376742543 0.8114913376742543 0.8114913376742543)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.380065985097893 0)
"cameras" SET Transform eulerAngles (4.110235526499082 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.928990726348243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.484478447306468
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2283680808370433
"cameras/drone/drone0" SET Transform localPosition (-0.974705758242342 0.6271212636611849 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7753834261125032 1.2739478315115278 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 15 -20)
"cameras/drone/drone0" SET Transform localScale (1.3674168611013258 1.3674168611013258 1.3674168611013258)
"cameras/drone/drone1" SET Transform localEulerAngles (7 17 4)
"cameras/drone/drone1" SET Transform localScale (0.7031229738120035 0.7031229738120035 0.7031229738120035)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.024542011012525 0)
"cameras" SET Transform eulerAngles (-0.5027938318474447 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.004378135306183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4623343121296628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.386388446818187
"cameras/drone/drone0" SET Transform localPosition (0.7730870466111066 -0.05173038534465163 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1005910932723582 1.057230240987458 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -6 -3)
"cameras/drone/drone0" SET Transform localScale (1.4963367681659911 1.4963367681659911 1.4963367681659911)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 9 8)
"cameras/drone/drone1" SET Transform localScale (1.3187595059907586 1.3187595059907586 1.3187595059907586)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3891867768672217 0)
"cameras" SET Transform eulerAngles (19.574365269321547 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8549696662871953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0778126349429842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06805614056805336
"cameras/drone/drone0" SET Transform localPosition (0.5802096914211474 0.2424696061831168 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04133458477819163 1.0068016392002952 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 2 3)
"cameras/drone/drone0" SET Transform localScale (1.2796925586469665 1.2796925586469665 1.2796925586469665)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -3 -4)
"cameras/drone/drone1" SET Transform localScale (1.1950854339218164 1.1950854339218164 1.1950854339218164)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8830759679107523 0)
"cameras" SET Transform eulerAngles (-16.629486449074598 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4142271247589426
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7254906591061636
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0003529956773354659
"cameras/drone/drone0" SET Transform localPosition (0.3139186303758923 0.18141237405719085 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9259157360649513 0.8181224420055762 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 3 -20)
"cameras/drone/drone0" SET Transform localScale (1.185223408764833 1.185223408764833 1.185223408764833)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -7 -15)
"cameras/drone/drone1" SET Transform localScale (0.6131189273787445 0.6131189273787445 0.6131189273787445)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.289918009447997 0)
"cameras" SET Transform eulerAngles (-8.422450067582382 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5113405865972888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7441994776490488
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34552247070434217
"cameras/drone/drone0" SET Transform localPosition (-0.7939045269056693 0.382349999588176 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4739636959587791 1.000750015096669 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 19 -14)
"cameras/drone/drone0" SET Transform localScale (0.6665457246700873 0.6665457246700873 0.6665457246700873)
"cameras/drone/drone1" SET Transform localEulerAngles (1 3 12)
"cameras/drone/drone1" SET Transform localScale (0.8991632843025547 0.8991632843025547 0.8991632843025547)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.522425424826155 0)
"cameras" SET Transform eulerAngles (2.626035368351726 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4425118244389559
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9189911418257721
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21834873094167428
"cameras/drone/drone0" SET Transform localPosition (0.30379687515133424 0.2125638854863468 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.907519658236092 0.8268372762751117 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 14 0)
"cameras/drone/drone0" SET Transform localScale (1.3263122260372122 1.3263122260372122 1.3263122260372122)
"cameras/drone/drone1" SET Transform localEulerAngles (2 6 -11)
"cameras/drone/drone1" SET Transform localScale (0.7326364473287512 0.7326364473287512 0.7326364473287512)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4699460432637608 0)
"cameras" SET Transform eulerAngles (-16.641567610794716 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.491589438817173
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2620823374161563
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2570940655039545
"cameras/drone/drone0" SET Transform localPosition (-0.22296079151202441 0.12087733622836311 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4086625534236863 1.169245270226594 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 9 -5)
"cameras/drone/drone0" SET Transform localScale (0.8663019695919856 0.8663019695919856 0.8663019695919856)
"cameras/drone/drone1" SET Transform localEulerAngles (0 6 14)
"cameras/drone/drone1" SET Transform localScale (1.4959039849642222 1.4959039849642222 1.4959039849642222)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.478245034745187 0)
"cameras" SET Transform eulerAngles (8.892682731047756 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4404778997852417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9568496552854087
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02559062368269918
"cameras/drone/drone0" SET Transform localPosition (0.4646595444093824 0.4942253319454822 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6519547658537428 1.0808663439240906 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -14 -19)
"cameras/drone/drone0" SET Transform localScale (1.4704166338400375 1.4704166338400375 1.4704166338400375)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -14 -2)
"cameras/drone/drone1" SET Transform localScale (1.2351186008321444 1.2351186008321444 1.2351186008321444)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4617191353599237 0)
"cameras" SET Transform eulerAngles (1.1358797353684906 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.594981343634782
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8740160939308377
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0940409033765056
"cameras/drone/drone0" SET Transform localPosition (-0.8878502045244483 -0.025520082436875147 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7664907940920795 1.003398974764701 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -7 -2)
"cameras/drone/drone0" SET Transform localScale (0.7521131076905432 0.7521131076905432 0.7521131076905432)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 4 -18)
"cameras/drone/drone1" SET Transform localScale (0.8400877379153775 0.8400877379153775 0.8400877379153775)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6000198146718914 0)
"cameras" SET Transform eulerAngles (0.3387478445250558 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9056710714929461
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.836066983294757
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3089596811842733
"cameras/drone/drone0" SET Transform localPosition (0.8903905964742405 0.542971534983208 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23232683645703656 1.1114015288455374 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 9 5)
"cameras/drone/drone0" SET Transform localScale (0.6221094210567506 0.6221094210567506 0.6221094210567506)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 15 -12)
"cameras/drone/drone1" SET Transform localScale (1.0560539881922473 1.0560539881922473 1.0560539881922473)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.733018365265558 0)
"cameras" SET Transform eulerAngles (0.18972865730529165 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6865499955329759
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4921484573258863
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15469572860915873
"cameras/drone/drone0" SET Transform localPosition (-0.32481627936204793 0.4754862510701267 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1596447608369431 1.1450824712446064 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 16 19)
"cameras/drone/drone0" SET Transform localScale (0.711664662682072 0.711664662682072 0.711664662682072)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 16 -18)
"cameras/drone/drone1" SET Transform localScale (1.3322528303426031 1.3322528303426031 1.3322528303426031)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.817411185454957 0)
"cameras" SET Transform eulerAngles (-9.417091022935304 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.283246943050355
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.550272149534274
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32345859064284066
"cameras/drone/drone0" SET Transform localPosition (0.6693503983903784 -0.2259232482375098 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2327630965418579 1.0983720560271948 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 7 12)
"cameras/drone/drone0" SET Transform localScale (1.397846437688701 1.397846437688701 1.397846437688701)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 0 -16)
"cameras/drone/drone1" SET Transform localScale (0.9975667905384941 0.9975667905384941 0.9975667905384941)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.570513827656983 0)
"cameras" SET Transform eulerAngles (-6.637696012512343 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6329031565487798
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9805392342569723
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14872634115711358
"cameras/drone/drone0" SET Transform localPosition (-0.2222991425392562 -0.042557684928988315 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9596995653759479 1.2397550860009947 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -7 -20)
"cameras/drone/drone0" SET Transform localScale (1.3330591751590197 1.3330591751590197 1.3330591751590197)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -5 14)
"cameras/drone/drone1" SET Transform localScale (1.1455743867519912 1.1455743867519912 1.1455743867519912)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.781741799027552 0)
"cameras" SET Transform eulerAngles (4.577488065228149 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3056011547467952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0183707981347274
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22815235704384718
"cameras/drone/drone0" SET Transform localPosition (-0.5917667389771625 -0.28553508021293966 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5475673390365736 1.0318340993857666 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 8 -14)
"cameras/drone/drone0" SET Transform localScale (1.156622512153132 1.156622512153132 1.156622512153132)
"cameras/drone/drone1" SET Transform localEulerAngles (14 3 8)
"cameras/drone/drone1" SET Transform localScale (0.7762164956893229 0.7762164956893229 0.7762164956893229)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.905112226802949 0)
"cameras" SET Transform eulerAngles (-10.858702162918359 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.193242722717335
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.768478852111357
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06374756662256341
"cameras/drone/drone0" SET Transform localPosition (-0.4075349384785737 0.19035806155757357 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.186810466899978 1.2860450280235982 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -8 9)
"cameras/drone/drone0" SET Transform localScale (1.0423837664889886 1.0423837664889886 1.0423837664889886)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 14 -6)
"cameras/drone/drone1" SET Transform localScale (1.0670415009063456 1.0670415009063456 1.0670415009063456)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9020872853269255 0)
"cameras" SET Transform eulerAngles (7.8504918549494604 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7617417761329129
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7896533464749524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05617638384650228
"cameras/drone/drone0" SET Transform localPosition (-1.160747657558443 0.3956811395026342 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8141222195065005 1.133200992775085 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 9 4)
"cameras/drone/drone0" SET Transform localScale (1.0558288056015541 1.0558288056015541 1.0558288056015541)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 17 12)
"cameras/drone/drone1" SET Transform localScale (0.7134390310693345 0.7134390310693345 0.7134390310693345)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.733414897211437 0)
"cameras" SET Transform eulerAngles (8.180258780416487 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9401891881763126
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7379847421575614
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07417307521180168
"cameras/drone/drone0" SET Transform localPosition (-0.8469288565707738 0.4002295591005312 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4481266554390735 0.8582779388815802 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -2 5)
"cameras/drone/drone0" SET Transform localScale (0.9538607037633476 0.9538607037633476 0.9538607037633476)
"cameras/drone/drone1" SET Transform localEulerAngles (10 13 -6)
"cameras/drone/drone1" SET Transform localScale (0.8522279222038887 0.8522279222038887 0.8522279222038887)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7551553019087276 0)
"cameras" SET Transform eulerAngles (13.598257323249719 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1946657802565865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4888260951635135
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38762439888626454
"cameras/drone/drone0" SET Transform localPosition (-0.3609470451744652 0.5552401731140433 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1002903471217234 0.8134820390061225 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -7 -6)
"cameras/drone/drone0" SET Transform localScale (1.3579399619557544 1.3579399619557544 1.3579399619557544)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -18 -13)
"cameras/drone/drone1" SET Transform localScale (0.9199606375972125 0.9199606375972125 0.9199606375972125)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5964386585178216 0)
"cameras" SET Transform eulerAngles (16.77756119642182 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5890456776419086
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9111308929726196
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23108281336961556
"cameras/drone/drone0" SET Transform localPosition (-0.5818912839717209 -0.2622055802347914 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6491797404963464 0.9065463660765818 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 1 -17)
"cameras/drone/drone0" SET Transform localScale (0.7766905941278217 0.7766905941278217 0.7766905941278217)
"cameras/drone/drone1" SET Transform localEulerAngles (1 4 12)
"cameras/drone/drone1" SET Transform localScale (0.6166303203621718 0.6166303203621718 0.6166303203621718)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.245622659583871 0)
"cameras" SET Transform eulerAngles (4.789253033305609 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5282925845820254
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9094212528167924
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37885361886332025
"cameras/drone/drone0" SET Transform localPosition (0.5262994237708694 0.18814152995951877 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21828935512568792 1.2527677416079541 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 10 16)
"cameras/drone/drone0" SET Transform localScale (0.7737075840783051 0.7737075840783051 0.7737075840783051)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -14 19)
"cameras/drone/drone1" SET Transform localScale (1.1561350698788835 1.1561350698788835 1.1561350698788835)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2799769519429782 0)
"cameras" SET Transform eulerAngles (10.470997044503125 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0970598242843068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2556302450573784
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22834395665219162
"cameras/drone/drone0" SET Transform localPosition (0.5823564763497036 -0.10564714805560033 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.35987179706670647 0.8087393894908759 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -4 10)
"cameras/drone/drone0" SET Transform localScale (0.7851106064091636 0.7851106064091636 0.7851106064091636)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -14 7)
"cameras/drone/drone1" SET Transform localScale (1.0617806629790316 1.0617806629790316 1.0617806629790316)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.491271435430679 0)
"cameras" SET Transform eulerAngles (7.342736129699944 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2805830723174358
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4332708702343375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19964790796593715
"cameras/drone/drone0" SET Transform localPosition (0.5622777182163254 0.1985463575709862 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4224640979093759 0.8849122741413575 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 10 8)
"cameras/drone/drone0" SET Transform localScale (1.0070836727905266 1.0070836727905266 1.0070836727905266)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -9 -6)
"cameras/drone/drone1" SET Transform localScale (1.1460470026386944 1.1460470026386944 1.1460470026386944)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.662897839642002 0)
"cameras" SET Transform eulerAngles (17.994727895328275 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5160187048960669
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3862976195465877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1704356841891783
"cameras/drone/drone0" SET Transform localPosition (0.44076457334256225 0.2754658616429915 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4358374190519686 1.2246922910534432 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -20 -3)
"cameras/drone/drone0" SET Transform localScale (0.9836733190900189 0.9836733190900189 0.9836733190900189)
"cameras/drone/drone1" SET Transform localEulerAngles (10 19 -12)
"cameras/drone/drone1" SET Transform localScale (0.9382743951156501 0.9382743951156501 0.9382743951156501)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.113234549882263 0)
"cameras" SET Transform eulerAngles (-6.517979959212404 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4057210941357479
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.19426648598063
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.006588741288765166
"cameras/drone/drone0" SET Transform localPosition (0.26359487321135977 -0.08740135616945138 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1573427834139829 1.1066989916579761 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -17 18)
"cameras/drone/drone0" SET Transform localScale (0.6141224741358007 0.6141224741358007 0.6141224741358007)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 9 15)
"cameras/drone/drone1" SET Transform localScale (0.8278536775790011 0.8278536775790011 0.8278536775790011)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.495620555928186 0)
"cameras" SET Transform eulerAngles (-14.173418560185883 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.013605340133295
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.926907544075437
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24122712889869385
"cameras/drone/drone0" SET Transform localPosition (-0.461609943660065 -0.2879523336429169 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40689239082027573 1.1232847904158763 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -4 8)
"cameras/drone/drone0" SET Transform localScale (1.1005713843766145 1.1005713843766145 1.1005713843766145)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -3 -16)
"cameras/drone/drone1" SET Transform localScale (0.8848158675416185 0.8848158675416185 0.8848158675416185)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3875412529446907 0)
"cameras" SET Transform eulerAngles (-2.4763738813838927 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9847642632229475
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4288809436559888
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12942118615687193
"cameras/drone/drone0" SET Transform localPosition (0.6994764515736724 0.5033455580908226 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6228706805917409 1.0797493564319507 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 10 17)
"cameras/drone/drone0" SET Transform localScale (1.0148894748268456 1.0148894748268456 1.0148894748268456)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 0 -13)
"cameras/drone/drone1" SET Transform localScale (1.4465939137456214 1.4465939137456214 1.4465939137456214)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0100461856134624 0)
"cameras" SET Transform eulerAngles (11.090777856891979 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0937046718306989
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9928305604047067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26482481499013977
"cameras/drone/drone0" SET Transform localPosition (0.5437917686620457 0.025451546263634384 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.49394305599577715 0.9024782630320977 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 1 -16)
"cameras/drone/drone0" SET Transform localScale (0.8354998378896874 0.8354998378896874 0.8354998378896874)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -6 1)
"cameras/drone/drone1" SET Transform localScale (1.0812263230334056 1.0812263230334056 1.0812263230334056)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.204914333840716 0)
"cameras" SET Transform eulerAngles (-12.918531985019639 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3498020636521488
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.357877103335651
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31289977609443187
"cameras/drone/drone0" SET Transform localPosition (-1.0984399139136867 0.6970309804869752 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.747945592060143 1.2362316139697878 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 10 7)
"cameras/drone/drone0" SET Transform localScale (0.7769327315275744 0.7769327315275744 0.7769327315275744)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 13 10)
"cameras/drone/drone1" SET Transform localScale (0.9456362726990152 0.9456362726990152 0.9456362726990152)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2643752270327466 0)
"cameras" SET Transform eulerAngles (12.650135478782467 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6875363792019515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.113346679784944
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20570868562846278
"cameras/drone/drone0" SET Transform localPosition (0.4012465004172474 -0.28842024606213784 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0971160567156393 0.8855443865857955 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -16 -8)
"cameras/drone/drone0" SET Transform localScale (0.6656647830168436 0.6656647830168436 0.6656647830168436)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -13 10)
"cameras/drone/drone1" SET Transform localScale (0.7106539082477692 0.7106539082477692 0.7106539082477692)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.504408044551412 0)
"cameras" SET Transform eulerAngles (-1.300156432614319 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7051213574433064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5868667801491274
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10886498039832043
"cameras/drone/drone0" SET Transform localPosition (0.9468769653223494 0.6941293524190422 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6312903127641663 1.1202378583910906 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -5 13)
"cameras/drone/drone0" SET Transform localScale (0.6693330616334562 0.6693330616334562 0.6693330616334562)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -1 -19)
"cameras/drone/drone1" SET Transform localScale (0.710418422967379 0.710418422967379 0.710418422967379)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.207561306009632 0)
"cameras" SET Transform eulerAngles (-15.136274113175286 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1543671850852002
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5553604463468784
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3402107220018777
"cameras/drone/drone0" SET Transform localPosition (0.7421223884577226 0.12833678989040959 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2702473348942702 1.0455782379953429 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -15 -20)
"cameras/drone/drone0" SET Transform localScale (1.3350833439256493 1.3350833439256493 1.3350833439256493)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -8 -6)
"cameras/drone/drone1" SET Transform localScale (1.0251782673961785 1.0251782673961785 1.0251782673961785)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.116976639783768 0)
"cameras" SET Transform eulerAngles (17.993025090785807 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1051350983889332
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1798308275113758
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.009746280604536217
"cameras/drone/drone0" SET Transform localPosition (0.047475751999021876 0.11786528186682349 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20171268217501837 1.2100021443512432 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 19 17)
"cameras/drone/drone0" SET Transform localScale (1.0326276460179986 1.0326276460179986 1.0326276460179986)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 20 19)
"cameras/drone/drone1" SET Transform localScale (0.8543965590300049 0.8543965590300049 0.8543965590300049)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.417322393904046 0)
"cameras" SET Transform eulerAngles (11.482281982088555 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9968219306820134
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0419925185677883
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3081451252640495
"cameras/drone/drone0" SET Transform localPosition (-0.08952338209606725 -0.06117522824055216 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5394052930872864 0.8736523825535716 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -9 -2)
"cameras/drone/drone0" SET Transform localScale (1.3736825789737321 1.3736825789737321 1.3736825789737321)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -4 6)
"cameras/drone/drone1" SET Transform localScale (1.2139763680360676 1.2139763680360676 1.2139763680360676)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.395056988053242 0)
"cameras" SET Transform eulerAngles (-2.0694568090059953 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1818145446867634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7908062906648898
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03343818022528131
"cameras/drone/drone0" SET Transform localPosition (-0.5263359857629181 0.32316141659103365 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8023258049915566 1.1787524507463587 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -5 1)
"cameras/drone/drone0" SET Transform localScale (0.7730855542062715 0.7730855542062715 0.7730855542062715)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 6 12)
"cameras/drone/drone1" SET Transform localScale (1.204922077453388 1.204922077453388 1.204922077453388)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.434051257167644 0)
"cameras" SET Transform eulerAngles (3.501831066033489 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1071649669572468
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2353010584620743
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18839565977145642
"cameras/drone/drone0" SET Transform localPosition (-0.11081549871319396 0.5300144678288177 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2498972811315523 0.8544591954743986 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 6 7)
"cameras/drone/drone0" SET Transform localScale (1.0590384525325578 1.0590384525325578 1.0590384525325578)
"cameras/drone/drone1" SET Transform localEulerAngles (0 3 12)
"cameras/drone/drone1" SET Transform localScale (1.0323466418772427 1.0323466418772427 1.0323466418772427)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.786610074677194 0)
"cameras" SET Transform eulerAngles (6.362333674857158 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0015832991776992
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6205918344072456
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05604750382101997
"cameras/drone/drone0" SET Transform localPosition (-0.5953120146946896 0.24646985027655927 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6699073526466834 1.1611047510161785 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 19 1)
"cameras/drone/drone0" SET Transform localScale (1.2389557012650174 1.2389557012650174 1.2389557012650174)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 2 -13)
"cameras/drone/drone1" SET Transform localScale (1.422369135461731 1.422369135461731 1.422369135461731)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6001183253241384 0)
"cameras" SET Transform eulerAngles (-0.2726784361892882 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0592346004236322
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7640617493483064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1999205490138948
"cameras/drone/drone0" SET Transform localPosition (1.095983747863276 -0.15289995960391528 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1024571431213206 0.8702337604343717 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -20 -5)
"cameras/drone/drone0" SET Transform localScale (1.1631929656013478 1.1631929656013478 1.1631929656013478)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -12 -17)
"cameras/drone/drone1" SET Transform localScale (1.3964091245183567 1.3964091245183567 1.3964091245183567)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.079122853362049 0)
"cameras" SET Transform eulerAngles (-6.79746017209486 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7925480061428721
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8372840105119956
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08782847675112469
"cameras/drone/drone0" SET Transform localPosition (0.6171738677302041 0.1547174755499529 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.30008554126378306 0.9802923002550016 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 11 9)
"cameras/drone/drone0" SET Transform localScale (0.8263043390446023 0.8263043390446023 0.8263043390446023)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 10 -12)
"cameras/drone/drone1" SET Transform localScale (0.8647769155382001 0.8647769155382001 0.8647769155382001)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.783909551991586 0)
"cameras" SET Transform eulerAngles (8.894939548137284 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4426941928685513
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.190088706881573
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3674420429594504
"cameras/drone/drone0" SET Transform localPosition (-0.915641122674858 0.6513899883249681 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7903576557268197 0.9855843812821621 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -13 -16)
"cameras/drone/drone0" SET Transform localScale (0.6712836651098304 0.6712836651098304 0.6712836651098304)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -9 -2)
"cameras/drone/drone1" SET Transform localScale (0.8506284257920178 0.8506284257920178 0.8506284257920178)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
