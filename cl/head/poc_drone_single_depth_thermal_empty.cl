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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 173 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 16 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 34 collisionCheck true stickToGround false 
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
"cameras" SET Transform eulerAngles (-9.478248598972627 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 78
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.643352982812212 0)
"cameras" SET Transform eulerAngles (15.594688954825891 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.184818825541202
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4863869275681778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37592291597341654
"cameras/drone/drone0" SET Transform localPosition (-0.19917989701181749 0.33049321266489734 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8349987000371619 1.072384632559359 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -5 13)
"cameras/drone/drone0" SET Transform localScale (0.7499983876814862 0.7499983876814862 0.7499983876814862)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -20 -6)
"cameras/drone/drone1" SET Transform localScale (0.6365428674198697 0.6365428674198697 0.6365428674198697)
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
"cameras" SET Transform position (0 3.45586638164536 0)
"cameras" SET Transform eulerAngles (16.152344869600036 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.45845732580448173
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.699692375868364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3000039261360515
"cameras/drone/drone0" SET Transform localPosition (-0.45782204333379284 -0.22724862643374427 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1938236476674606 1.2102564943414775 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 17 13)
"cameras/drone/drone0" SET Transform localScale (0.7859612846315074 0.7859612846315074 0.7859612846315074)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 17 16)
"cameras/drone/drone1" SET Transform localScale (0.6811866941105664 0.6811866941105664 0.6811866941105664)
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
"cameras" SET Transform position (0 4.325902943128431 0)
"cameras" SET Transform eulerAngles (-8.3793462068554 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6525982655242536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7771376207611822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24601619517598605
"cameras/drone/drone0" SET Transform localPosition (-0.9892668214100988 0.0529618154569928 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8939436812814756 0.8547797218049387 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -12 7)
"cameras/drone/drone0" SET Transform localScale (1.17607184608971 1.17607184608971 1.17607184608971)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -4 -15)
"cameras/drone/drone1" SET Transform localScale (1.1944536831166495 1.1944536831166495 1.1944536831166495)
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
"cameras" SET Transform position (0 4.363439747420207 0)
"cameras" SET Transform eulerAngles (-18.727418322958282 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3930846304676971
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3479123055830893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35733378485027356
"cameras/drone/drone0" SET Transform localPosition (-0.6639904070435525 0.6612286787351576 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1282713528332666 0.9678068961174692 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 8 -3)
"cameras/drone/drone0" SET Transform localScale (0.7440124660474481 0.7440124660474481 0.7440124660474481)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -3 12)
"cameras/drone/drone1" SET Transform localScale (1.1458701477176783 1.1458701477176783 1.1458701477176783)
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
"cameras" SET Transform position (0 4.495508023229167 0)
"cameras" SET Transform eulerAngles (-7.656593264799238 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3855808257955655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9007974543844166
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13294189658017977
"cameras/drone/drone0" SET Transform localPosition (0.008346212092742888 0.6618476070314239 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1723749004067294 1.282388828732782 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -18 12)
"cameras/drone/drone0" SET Transform localScale (1.2971286158806357 1.2971286158806357 1.2971286158806357)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 15 -12)
"cameras/drone/drone1" SET Transform localScale (0.9965536369499208 0.9965536369499208 0.9965536369499208)
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
"cameras" SET Transform position (0 4.845717734342005 0)
"cameras" SET Transform eulerAngles (17.971465066471836 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7572613253214222
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2435971574384581
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025469676218666137
"cameras/drone/drone0" SET Transform localPosition (-0.1207086507225148 -0.12401191522039773 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7790609028172892 1.1640224900653413 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 10 -17)
"cameras/drone/drone0" SET Transform localScale (0.9029266481926108 0.9029266481926108 0.9029266481926108)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -4 -19)
"cameras/drone/drone1" SET Transform localScale (1.3271042495816059 1.3271042495816059 1.3271042495816059)
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
"cameras" SET Transform position (0 3.545851372448084 0)
"cameras" SET Transform eulerAngles (-8.232119462208377 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7081016768899653
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9682066882088711
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3038418744583291
"cameras/drone/drone0" SET Transform localPosition (0.4952002329427374 0.32525753377164485 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8810699693550252 0.8939630263212868 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -16 12)
"cameras/drone/drone0" SET Transform localScale (0.7824363940799598 0.7824363940799598 0.7824363940799598)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -20 -4)
"cameras/drone/drone1" SET Transform localScale (1.0976684045812677 1.0976684045812677 1.0976684045812677)
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
"cameras" SET Transform position (0 3.0509185143837563 0)
"cameras" SET Transform eulerAngles (-7.054778683673151 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0363697298739285
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.965470218524994
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37288008168541786
"cameras/drone/drone0" SET Transform localPosition (-0.3743070817698062 -0.14655345498770028 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4173003693325086 0.8482780738556969 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 2 7)
"cameras/drone/drone0" SET Transform localScale (1.4503811229232542 1.4503811229232542 1.4503811229232542)
"cameras/drone/drone1" SET Transform localEulerAngles (12 0 14)
"cameras/drone/drone1" SET Transform localScale (1.2962319751080191 1.2962319751080191 1.2962319751080191)
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
"cameras" SET Transform position (0 3.168031750949466 0)
"cameras" SET Transform eulerAngles (-8.640094721758986 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4565764681587088
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4946325320570746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1687311941303185
"cameras/drone/drone0" SET Transform localPosition (0.15112789289678163 -0.07199428006018088 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5343077551319022 0.8466313057985231 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -17 -11)
"cameras/drone/drone0" SET Transform localScale (0.9311503701410829 0.9311503701410829 0.9311503701410829)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -4 -14)
"cameras/drone/drone1" SET Transform localScale (1.141160683442956 1.141160683442956 1.141160683442956)
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
"cameras" SET Transform position (0 3.659182925767288 0)
"cameras" SET Transform eulerAngles (-11.909218099490468 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2636553720765171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3762675091652785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21053355758561026
"cameras/drone/drone0" SET Transform localPosition (-0.5031088241459711 0.12725580862892777 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1496196379457282 1.174785327759878 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 8 -12)
"cameras/drone/drone0" SET Transform localScale (0.657802434516615 0.657802434516615 0.657802434516615)
"cameras/drone/drone1" SET Transform localEulerAngles (7 15 12)
"cameras/drone/drone1" SET Transform localScale (1.036007701381937 1.036007701381937 1.036007701381937)
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
"cameras" SET Transform position (0 3.316228923723677 0)
"cameras" SET Transform eulerAngles (10.955356463469581 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0549649143241122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9319235730010376
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11927317757788441
"cameras/drone/drone0" SET Transform localPosition (0.3194183611285195 0.5375171623143129 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9993479777651719 1.2666281762877292 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -13 19)
"cameras/drone/drone0" SET Transform localScale (1.3433829689714787 1.3433829689714787 1.3433829689714787)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -6 2)
"cameras/drone/drone1" SET Transform localScale (1.007235863191822 1.007235863191822 1.007235863191822)
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
"cameras" SET Transform position (0 4.6008457888432766 0)
"cameras" SET Transform eulerAngles (19.838479900604867 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7938926758553162
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8201026713165733
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19110974197889752
"cameras/drone/drone0" SET Transform localPosition (-0.9686133141517527 0.6581297316906469 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.47558118362856083 1.1342404911254165 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -6 -19)
"cameras/drone/drone0" SET Transform localScale (0.6002278914470888 0.6002278914470888 0.6002278914470888)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -1 -17)
"cameras/drone/drone1" SET Transform localScale (0.8382841737865337 0.8382841737865337 0.8382841737865337)
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
"cameras" SET Transform position (0 3.989183777613478 0)
"cameras" SET Transform eulerAngles (-4.959580763647299 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8468662210869877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.985761408120145
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2355966648362723
"cameras/drone/drone0" SET Transform localPosition (0.4865931612535226 0.36592031048066204 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7803035049447065 0.926424746725407 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 1 8)
"cameras/drone/drone0" SET Transform localScale (1.286844189431035 1.286844189431035 1.286844189431035)
"cameras/drone/drone1" SET Transform localEulerAngles (13 4 -13)
"cameras/drone/drone1" SET Transform localScale (0.9962098397675904 0.9962098397675904 0.9962098397675904)
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
"cameras" SET Transform position (0 3.8697744507390883 0)
"cameras" SET Transform eulerAngles (3.10655649363369 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1779097158163725
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9536653648392557
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16402660031206484
"cameras/drone/drone0" SET Transform localPosition (-1.0196507792907783 0.6926382966018145 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9194284760814042 0.8604160614207799 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -3 -8)
"cameras/drone/drone0" SET Transform localScale (1.2670387034964206 1.2670387034964206 1.2670387034964206)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -7 -11)
"cameras/drone/drone1" SET Transform localScale (0.8534692204793871 0.8534692204793871 0.8534692204793871)
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
"cameras" SET Transform position (0 3.3090121148293656 0)
"cameras" SET Transform eulerAngles (-11.986825521491733 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0109833993074644
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0420465061184014
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03560272647921976
"cameras/drone/drone0" SET Transform localPosition (-1.0934759235564802 0.25034122964309685 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1379728459456486 1.002506264123686 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -16 -9)
"cameras/drone/drone0" SET Transform localScale (0.8850852961221785 0.8850852961221785 0.8850852961221785)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -1 4)
"cameras/drone/drone1" SET Transform localScale (1.097136750966323 1.097136750966323 1.097136750966323)
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
"cameras" SET Transform position (0 4.188188775474117 0)
"cameras" SET Transform eulerAngles (-8.00845107595945 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2731938480879488
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5621002371357742
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05044929272687848
"cameras/drone/drone0" SET Transform localPosition (-1.0059768331112073 0.40693460252100727 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8077796088550129 0.9615555627683311 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 3 5)
"cameras/drone/drone0" SET Transform localScale (0.9432139004161801 0.9432139004161801 0.9432139004161801)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 13 -14)
"cameras/drone/drone1" SET Transform localScale (0.6333742406518656 0.6333742406518656 0.6333742406518656)
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
"cameras" SET Transform position (0 4.5101765905679105 0)
"cameras" SET Transform eulerAngles (4.083474123951554 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8080098280342343
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7099148457995696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.014405984550005791
"cameras/drone/drone0" SET Transform localPosition (-1.0059006042219327 -0.251971656127672 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7047873269792975 0.9036317595204219 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -12 5)
"cameras/drone/drone0" SET Transform localScale (0.6152188557034345 0.6152188557034345 0.6152188557034345)
"cameras/drone/drone1" SET Transform localEulerAngles (8 11 -13)
"cameras/drone/drone1" SET Transform localScale (0.9678753926318178 0.9678753926318178 0.9678753926318178)
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
"cameras" SET Transform position (0 3.4641498852579633 0)
"cameras" SET Transform eulerAngles (-2.202687380013714 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46429737667850796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.827324097541715
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06313893308191809
"cameras/drone/drone0" SET Transform localPosition (1.1507979508946662 0.48863972512380144 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.20863933400146972 1.0687482127887562 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 2 11)
"cameras/drone/drone0" SET Transform localScale (1.2032419418038836 1.2032419418038836 1.2032419418038836)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -4 -12)
"cameras/drone/drone1" SET Transform localScale (1.0579210112110604 1.0579210112110604 1.0579210112110604)
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
"cameras" SET Transform position (0 4.01311157236053 0)
"cameras" SET Transform eulerAngles (-9.230454237281066 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4791345007921528
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5604926241892974
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2814799975840614
"cameras/drone/drone0" SET Transform localPosition (0.3133000761193878 0.6505054595124538 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9701482090428972 1.141817639127606 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 7 0)
"cameras/drone/drone0" SET Transform localScale (1.1355213970888363 1.1355213970888363 1.1355213970888363)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 17 -14)
"cameras/drone/drone1" SET Transform localScale (0.7070145420971679 0.7070145420971679 0.7070145420971679)
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
"cameras" SET Transform position (0 3.936681344492645 0)
"cameras" SET Transform eulerAngles (2.8637454481081974 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9702567878848012
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9188085224044498
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31471058407696456
"cameras/drone/drone0" SET Transform localPosition (0.8312988933657588 0.6924402670439949 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.011224168905489051 0.9270635904552218 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 16 -18)
"cameras/drone/drone0" SET Transform localScale (1.2355976406929878 1.2355976406929878 1.2355976406929878)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -19 3)
"cameras/drone/drone1" SET Transform localScale (1.3060129456513587 1.3060129456513587 1.3060129456513587)
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
"cameras" SET Transform position (0 3.738898138072377 0)
"cameras" SET Transform eulerAngles (6.9142300767596225 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.865319919250704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8058062302482307
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19801521268901134
"cameras/drone/drone0" SET Transform localPosition (-0.1928775287105704 0.39609057476715465 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9609719036052111 1.0901450627441334 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -15 -14)
"cameras/drone/drone0" SET Transform localScale (1.3465139983261816 1.3465139983261816 1.3465139983261816)
"cameras/drone/drone1" SET Transform localEulerAngles (11 12 11)
"cameras/drone/drone1" SET Transform localScale (1.3478766586100088 1.3478766586100088 1.3478766586100088)
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
"cameras" SET Transform position (0 3.684997047278678 0)
"cameras" SET Transform eulerAngles (-19.56926826170955 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4670118011652644
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6303063548951902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10845291381739007
"cameras/drone/drone0" SET Transform localPosition (0.5879626171829955 0.6616190279402108 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17963897106709115 0.8953179573970995 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 1 3)
"cameras/drone/drone0" SET Transform localScale (1.2740519945676052 1.2740519945676052 1.2740519945676052)
"cameras/drone/drone1" SET Transform localEulerAngles (4 4 -19)
"cameras/drone/drone1" SET Transform localScale (0.8839335712034808 0.8839335712034808 0.8839335712034808)
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
"cameras" SET Transform position (0 3.218279708550551 0)
"cameras" SET Transform eulerAngles (-7.41189148471685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8046380676505025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0232919781569851
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23678552888223808
"cameras/drone/drone0" SET Transform localPosition (0.8080916866933736 0.3613039296455291 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6837939344248456 1.0386589842792175 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 18 -2)
"cameras/drone/drone0" SET Transform localScale (1.2811019052362917 1.2811019052362917 1.2811019052362917)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -15 1)
"cameras/drone/drone1" SET Transform localScale (1.3698720853630653 1.3698720853630653 1.3698720853630653)
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
"cameras" SET Transform position (0 4.022117288928454 0)
"cameras" SET Transform eulerAngles (-4.752656666016048 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5025012888818958
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2285468693959487
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3496816485214943
"cameras/drone/drone0" SET Transform localPosition (1.0020675573366395 -0.11391003610208833 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.02572976962073037 1.0878026957782563 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 13 10)
"cameras/drone/drone0" SET Transform localScale (0.8389491479914264 0.8389491479914264 0.8389491479914264)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -20 19)
"cameras/drone/drone1" SET Transform localScale (1.355959823082938 1.355959823082938 1.355959823082938)
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
"cameras" SET Transform position (0 3.6491697299289725 0)
"cameras" SET Transform eulerAngles (-3.761897361854892 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2697096159347858
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.707810189598705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14790195285202606
"cameras/drone/drone0" SET Transform localPosition (0.9823213916319944 0.3001918882678633 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.14913892612328516 0.8022079331354843 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -1 20)
"cameras/drone/drone0" SET Transform localScale (1.4213033446160495 1.4213033446160495 1.4213033446160495)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -9 5)
"cameras/drone/drone1" SET Transform localScale (0.843939882824607 0.843939882824607 0.843939882824607)
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
"cameras" SET Transform position (0 3.2894701525959658 0)
"cameras" SET Transform eulerAngles (-6.78787171083191 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5153402704235326
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0678037253055537
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16875151159939988
"cameras/drone/drone0" SET Transform localPosition (-1.1318032922489618 0.6342262056281069 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21515310515764607 1.0031427736476408 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -5 -9)
"cameras/drone/drone0" SET Transform localScale (1.4112267371723335 1.4112267371723335 1.4112267371723335)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -6 17)
"cameras/drone/drone1" SET Transform localScale (0.652415803276482 0.652415803276482 0.652415803276482)
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
"cameras" SET Transform position (0 3.0417590084290396 0)
"cameras" SET Transform eulerAngles (-3.701018917930938 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1453082143609734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2353972577610817
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3716982993481093
"cameras/drone/drone0" SET Transform localPosition (1.189491937098479 -0.15467844812285608 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1502049446044813 1.2986427889862708 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 1 18)
"cameras/drone/drone0" SET Transform localScale (1.0523037597879825 1.0523037597879825 1.0523037597879825)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 13 -11)
"cameras/drone/drone1" SET Transform localScale (0.8938056407063188 0.8938056407063188 0.8938056407063188)
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
"cameras" SET Transform position (0 4.80900426006998 0)
"cameras" SET Transform eulerAngles (-9.54870723851226 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4427323953651038
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4095444635790306
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.388116069703271
"cameras/drone/drone0" SET Transform localPosition (-1.094172065827941 0.2773681898944535 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.47624821582173116 1.113330323498591 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 5 -8)
"cameras/drone/drone0" SET Transform localScale (0.7668715440819727 0.7668715440819727 0.7668715440819727)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 3 -7)
"cameras/drone/drone1" SET Transform localScale (0.738404776326152 0.738404776326152 0.738404776326152)
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
"cameras" SET Transform position (0 4.023783958344161 0)
"cameras" SET Transform eulerAngles (0.9731465420505074 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42805095671457977
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7572592179406121
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29086656156476776
"cameras/drone/drone0" SET Transform localPosition (-0.9985858076063557 0.6612884172260591 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9874208919032339 0.8616307421696355 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -1 3)
"cameras/drone/drone0" SET Transform localScale (1.0681209715149989 1.0681209715149989 1.0681209715149989)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -9 -2)
"cameras/drone/drone1" SET Transform localScale (1.3476364942004166 1.3476364942004166 1.3476364942004166)
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
"cameras" SET Transform position (0 3.7996256915831568 0)
"cameras" SET Transform eulerAngles (5.75260338580707 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5542048254718662
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6801276256261262
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1863651858367823
"cameras/drone/drone0" SET Transform localPosition (0.9643612797856267 0.42842696635674876 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.25723863309646766 1.0693228575755693 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 6 14)
"cameras/drone/drone0" SET Transform localScale (0.7126800945727184 0.7126800945727184 0.7126800945727184)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 7 10)
"cameras/drone/drone1" SET Transform localScale (1.4656146048170722 1.4656146048170722 1.4656146048170722)
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
"cameras" SET Transform position (0 3.4080769061875467 0)
"cameras" SET Transform eulerAngles (-5.402188231466717 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47962723132454166
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3722805732952597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14726217511313364
"cameras/drone/drone0" SET Transform localPosition (0.007234655318812289 -0.09975342477685317 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.43274816621202383 1.173037508333456 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -18 -17)
"cameras/drone/drone0" SET Transform localScale (0.6424810546148628 0.6424810546148628 0.6424810546148628)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 20 17)
"cameras/drone/drone1" SET Transform localScale (1.3174986997272575 1.3174986997272575 1.3174986997272575)
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
"cameras" SET Transform position (0 3.734230259792992 0)
"cameras" SET Transform eulerAngles (-15.482418000702655 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3192458230183801
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2865056766591398
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2035259862530186
"cameras/drone/drone0" SET Transform localPosition (-0.20078897681339303 0.6030059736842817 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9609506406180153 0.8022301079491071 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 8 -12)
"cameras/drone/drone0" SET Transform localScale (0.9068836227103034 0.9068836227103034 0.9068836227103034)
"cameras/drone/drone1" SET Transform localEulerAngles (20 4 -13)
"cameras/drone/drone1" SET Transform localScale (1.3947678976183502 1.3947678976183502 1.3947678976183502)
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
"cameras" SET Transform position (0 3.584152067318065 0)
"cameras" SET Transform eulerAngles (-2.2559820281637855 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5065902739489467
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1729320082629953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3582714746428244
"cameras/drone/drone0" SET Transform localPosition (-0.8666310845237781 -0.10363767585601896 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.91125539136263 1.2106329990111289 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -14 15)
"cameras/drone/drone0" SET Transform localScale (1.3280303059763967 1.3280303059763967 1.3280303059763967)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -4 -5)
"cameras/drone/drone1" SET Transform localScale (1.2099529859425542 1.2099529859425542 1.2099529859425542)
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
"cameras" SET Transform position (0 4.186571247777487 0)
"cameras" SET Transform eulerAngles (-1.3113367103736948 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2245080826529728
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9171251589569778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03526375627271823
"cameras/drone/drone0" SET Transform localPosition (0.12598932039010036 0.10338298468939905 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.42394750371405854 0.8967262217708736 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 4 12)
"cameras/drone/drone0" SET Transform localScale (0.6514423903566505 0.6514423903566505 0.6514423903566505)
"cameras/drone/drone1" SET Transform localEulerAngles (20 0 14)
"cameras/drone/drone1" SET Transform localScale (0.8780709495208913 0.8780709495208913 0.8780709495208913)
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
"cameras" SET Transform position (0 3.8523119117222775 0)
"cameras" SET Transform eulerAngles (-0.010525550418641672 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7371977245813275
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4326676171022243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10142739428698509
"cameras/drone/drone0" SET Transform localPosition (-0.567417222114355 0.39370187731406775 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8835867145032412 0.971298176894092 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -12 -7)
"cameras/drone/drone0" SET Transform localScale (0.9167686974055534 0.9167686974055534 0.9167686974055534)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -4 -18)
"cameras/drone/drone1" SET Transform localScale (0.9220361248344713 0.9220361248344713 0.9220361248344713)
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
"cameras" SET Transform position (0 4.346696973172045 0)
"cameras" SET Transform eulerAngles (3.586237456825401 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1648926464790013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6815880673886627
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2098183543003331
"cameras/drone/drone0" SET Transform localPosition (-0.33507811876640614 0.4056608710438407 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.19239165610917 1.1442746638962975 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 11 10)
"cameras/drone/drone0" SET Transform localScale (1.369593767110652 1.369593767110652 1.369593767110652)
"cameras/drone/drone1" SET Transform localEulerAngles (20 6 -7)
"cameras/drone/drone1" SET Transform localScale (0.8702753079247803 0.8702753079247803 0.8702753079247803)
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
"cameras" SET Transform position (0 3.309621122144819 0)
"cameras" SET Transform eulerAngles (-5.652378778165019 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7886745296861897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3924703148621742
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0712126606399841
"cameras/drone/drone0" SET Transform localPosition (-0.9538072963152966 0.5937570547961051 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.47701876031072454 1.113092408107084 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 1 -10)
"cameras/drone/drone0" SET Transform localScale (0.689129583822044 0.689129583822044 0.689129583822044)
"cameras/drone/drone1" SET Transform localEulerAngles (8 19 -1)
"cameras/drone/drone1" SET Transform localScale (1.2245444742531628 1.2245444742531628 1.2245444742531628)
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
"cameras" SET Transform position (0 4.187217790365205 0)
"cameras" SET Transform eulerAngles (-15.942853442237972 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.176866036461737
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3413220412901286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2595614666455132
"cameras/drone/drone0" SET Transform localPosition (0.058326327919255405 0.1645245863858748 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1143242141736065 0.9515931601492885 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -12 8)
"cameras/drone/drone0" SET Transform localScale (0.7032129926657882 0.7032129926657882 0.7032129926657882)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -16 13)
"cameras/drone/drone1" SET Transform localScale (0.6143654915513721 0.6143654915513721 0.6143654915513721)
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
"cameras" SET Transform position (0 4.035727462026711 0)
"cameras" SET Transform eulerAngles (19.905360334296958 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6702619447351772
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7996700494021693
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2753010893239249
"cameras/drone/drone0" SET Transform localPosition (-0.7406830212759534 -0.01669745839862452 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1867899244075688 0.8966520515281777 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 3 13)
"cameras/drone/drone0" SET Transform localScale (1.3797125022956231 1.3797125022956231 1.3797125022956231)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 20 5)
"cameras/drone/drone1" SET Transform localScale (0.8841238331581622 0.8841238331581622 0.8841238331581622)
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
"cameras" SET Transform position (0 4.595456470206379 0)
"cameras" SET Transform eulerAngles (3.2406741828278385 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1623837565240005
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5103215811290611
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2864675941918317
"cameras/drone/drone0" SET Transform localPosition (-1.189898750365923 0.5301272882237344 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3772855609974095 0.840136555190323 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 19 -18)
"cameras/drone/drone0" SET Transform localScale (0.8352066255671953 0.8352066255671953 0.8352066255671953)
"cameras/drone/drone1" SET Transform localEulerAngles (17 16 7)
"cameras/drone/drone1" SET Transform localScale (0.9505035023794859 0.9505035023794859 0.9505035023794859)
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
"cameras" SET Transform position (0 4.960312171595608 0)
"cameras" SET Transform eulerAngles (12.328041294636108 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.397777588382652
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4755868788575608
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.023372566749112658
"cameras/drone/drone0" SET Transform localPosition (-0.7332797015815389 0.5579858442337462 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.74705818441234 1.1813220886707025 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -7 0)
"cameras/drone/drone0" SET Transform localScale (1.1943188690289077 1.1943188690289077 1.1943188690289077)
"cameras/drone/drone1" SET Transform localEulerAngles (18 20 17)
"cameras/drone/drone1" SET Transform localScale (0.8579529370830807 0.8579529370830807 0.8579529370830807)
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
"cameras" SET Transform position (0 3.0904608509792535 0)
"cameras" SET Transform eulerAngles (15.423414987423882 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6132860041262678
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0094993174882567
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33513444003084847
"cameras/drone/drone0" SET Transform localPosition (-1.037154371450187 0.6910130512827841 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0107543820114806 1.0399900678529874 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 3 5)
"cameras/drone/drone0" SET Transform localScale (1.0269107823559804 1.0269107823559804 1.0269107823559804)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -4 18)
"cameras/drone/drone1" SET Transform localScale (0.8086230961662785 0.8086230961662785 0.8086230961662785)
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
"cameras" SET Transform position (0 4.114581648586841 0)
"cameras" SET Transform eulerAngles (-17.570844345827883 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6030037024004492
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.500809016005881
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39011621094784393
"cameras/drone/drone0" SET Transform localPosition (-0.805467762821077 -0.11800637280381704 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4172915680426996 1.2699510687296107 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -12 -8)
"cameras/drone/drone0" SET Transform localScale (1.3392934102032528 1.3392934102032528 1.3392934102032528)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 15 12)
"cameras/drone/drone1" SET Transform localScale (1.4343712330716918 1.4343712330716918 1.4343712330716918)
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
"cameras" SET Transform position (0 4.903359965733965 0)
"cameras" SET Transform eulerAngles (-2.70839558297196 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.410058688262005
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.813923089638159
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3261437762824948
"cameras/drone/drone0" SET Transform localPosition (0.7535848042825972 -0.2502679420373031 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8579246912922449 0.8338448629039876 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 4 -16)
"cameras/drone/drone0" SET Transform localScale (1.429864778169001 1.429864778169001 1.429864778169001)
"cameras/drone/drone1" SET Transform localEulerAngles (9 0 -20)
"cameras/drone/drone1" SET Transform localScale (0.7377503887739467 0.7377503887739467 0.7377503887739467)
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
"cameras" SET Transform position (0 4.551701457471254 0)
"cameras" SET Transform eulerAngles (16.03648351352306 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.231372376855509
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8657200579638953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.351903042229055
"cameras/drone/drone0" SET Transform localPosition (0.08932272710382594 -0.07485221562274275 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.22618893999188838 1.2263705822476436 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -8 2)
"cameras/drone/drone0" SET Transform localScale (1.0463209099327986 1.0463209099327986 1.0463209099327986)
"cameras/drone/drone1" SET Transform localEulerAngles (12 4 -14)
"cameras/drone/drone1" SET Transform localScale (1.4770084821803118 1.4770084821803118 1.4770084821803118)
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
"cameras" SET Transform position (0 3.2854812324834226 0)
"cameras" SET Transform eulerAngles (9.700592292327102 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2796946498981927
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5962751151170091
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3649888347952058
"cameras/drone/drone0" SET Transform localPosition (-0.4958655071280713 -0.1757389577118446 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.310387866182936 0.8119791694513273 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 6 8)
"cameras/drone/drone0" SET Transform localScale (1.1412108710791191 1.1412108710791191 1.1412108710791191)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -7 -18)
"cameras/drone/drone1" SET Transform localScale (1.1772057632006607 1.1772057632006607 1.1772057632006607)
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
"cameras" SET Transform position (0 4.636328733009704 0)
"cameras" SET Transform eulerAngles (19.52296490542669 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41373394937741104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.821822632274166
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1903068752033955
"cameras/drone/drone0" SET Transform localPosition (0.120536430033505 0.4914502726756225 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.28280720480973176 1.0353530842464718 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 9 20)
"cameras/drone/drone0" SET Transform localScale (1.4608326178966842 1.4608326178966842 1.4608326178966842)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 15 -7)
"cameras/drone/drone1" SET Transform localScale (1.0535050308060838 1.0535050308060838 1.0535050308060838)
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
"cameras" SET Transform position (0 4.864632819628355 0)
"cameras" SET Transform eulerAngles (17.28434040799526 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1986756274678225
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2353307702895424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3341324579735431
"cameras/drone/drone0" SET Transform localPosition (-1.0603882939750535 0.06622729592736992 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9815091625960803 0.8034302787762451 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 6 2)
"cameras/drone/drone0" SET Transform localScale (0.7612087256997258 0.7612087256997258 0.7612087256997258)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 10 -4)
"cameras/drone/drone1" SET Transform localScale (1.0023864450501652 1.0023864450501652 1.0023864450501652)
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
"cameras" SET Transform position (0 4.309021421290299 0)
"cameras" SET Transform eulerAngles (-6.369963633148341 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9654280266149619
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1902966772197772
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19781073785142841
"cameras/drone/drone0" SET Transform localPosition (-1.1106053588785871 0.2075002859300305 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9820543383491003 1.1219882367703966 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -13 11)
"cameras/drone/drone0" SET Transform localScale (0.9254911342871948 0.9254911342871948 0.9254911342871948)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -4 -12)
"cameras/drone/drone1" SET Transform localScale (1.0110481242555716 1.0110481242555716 1.0110481242555716)
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
"cameras" SET Transform position (0 3.0276776867246817 0)
"cameras" SET Transform eulerAngles (-17.994173953741637 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5230147297478644
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.865857362392886
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3011581109423768
"cameras/drone/drone0" SET Transform localPosition (-0.4368135805353841 0.5518108830701896 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0829255850640245 0.8639894543215976 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -5 -10)
"cameras/drone/drone0" SET Transform localScale (1.4447645813727652 1.4447645813727652 1.4447645813727652)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 18 -11)
"cameras/drone/drone1" SET Transform localScale (1.3458100124609849 1.3458100124609849 1.3458100124609849)
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
"cameras" SET Transform position (0 4.871714979990442 0)
"cameras" SET Transform eulerAngles (10.551691564023763 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5636527658788776
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.703825799544021
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33744069497364737
"cameras/drone/drone0" SET Transform localPosition (-0.794944880332012 0.4830553779853745 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6054177177798189 1.16442762622064 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -8 -5)
"cameras/drone/drone0" SET Transform localScale (0.6217623956360256 0.6217623956360256 0.6217623956360256)
"cameras/drone/drone1" SET Transform localEulerAngles (6 8 0)
"cameras/drone/drone1" SET Transform localScale (0.9913689363287785 0.9913689363287785 0.9913689363287785)
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
"cameras" SET Transform position (0 3.8658595445701076 0)
"cameras" SET Transform eulerAngles (3.206801035613843 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3199178795429614
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1018982580789072
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31736979019403533
"cameras/drone/drone0" SET Transform localPosition (1.1902547177001048 0.26679770785983364 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9920915659030063 0.9626472416598864 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -14 6)
"cameras/drone/drone0" SET Transform localScale (0.7224170118061537 0.7224170118061537 0.7224170118061537)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 0 -3)
"cameras/drone/drone1" SET Transform localScale (0.9282806025116288 0.9282806025116288 0.9282806025116288)
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
"cameras" SET Transform position (0 3.2881525864455567 0)
"cameras" SET Transform eulerAngles (-4.171774741475387 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1021151547169084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8901833718481795
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2685416479245705
"cameras/drone/drone0" SET Transform localPosition (-0.9758878340968553 0.2684720712189033 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3076041380092752 0.8010390395007723 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -20 5)
"cameras/drone/drone0" SET Transform localScale (1.0118652304642977 1.0118652304642977 1.0118652304642977)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -2 -4)
"cameras/drone/drone1" SET Transform localScale (1.2059143388529714 1.2059143388529714 1.2059143388529714)
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
"cameras" SET Transform position (0 3.572276778949921 0)
"cameras" SET Transform eulerAngles (-17.768459663685086 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9814994990306574
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5764684415461159
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3280298719422014
"cameras/drone/drone0" SET Transform localPosition (1.1122239540335819 -0.1255932884719025 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1953646427590392 1.1077592178940705 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -12 -12)
"cameras/drone/drone0" SET Transform localScale (1.1567245646514834 1.1567245646514834 1.1567245646514834)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 2 -3)
"cameras/drone/drone1" SET Transform localScale (0.7421209695387534 0.7421209695387534 0.7421209695387534)
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
"cameras" SET Transform position (0 3.1381352364015136 0)
"cameras" SET Transform eulerAngles (1.6787188466575351 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.883770925561593
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7873291788874845
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09887306812892178
"cameras/drone/drone0" SET Transform localPosition (0.9333697375367442 -0.2152138855423706 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17421909218601983 1.0875999372281644 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 0 -1)
"cameras/drone/drone0" SET Transform localScale (0.9453473983807741 0.9453473983807741 0.9453473983807741)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 3 7)
"cameras/drone/drone1" SET Transform localScale (0.9156300108200877 0.9156300108200877 0.9156300108200877)
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
"cameras" SET Transform position (0 4.0265086663599945 0)
"cameras" SET Transform eulerAngles (1.163343615369243 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5431024703393286
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6739839510266927
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2860551680275699
"cameras/drone/drone0" SET Transform localPosition (-0.1010275983462483 -0.18047256591064237 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1517027865427412 1.0228655383405938 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 6 -9)
"cameras/drone/drone0" SET Transform localScale (1.1055207526752702 1.1055207526752702 1.1055207526752702)
"cameras/drone/drone1" SET Transform localEulerAngles (20 5 8)
"cameras/drone/drone1" SET Transform localScale (0.6474808269698684 0.6474808269698684 0.6474808269698684)
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
"cameras" SET Transform position (0 4.888734251006026 0)
"cameras" SET Transform eulerAngles (-3.3826051519826095 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5872199441026433
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4304234055001492
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2556701952739524
"cameras/drone/drone0" SET Transform localPosition (-0.28101668875648367 0.13389228717917018 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7906935099273913 0.9010964111806079 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 9 5)
"cameras/drone/drone0" SET Transform localScale (0.8489695838012682 0.8489695838012682 0.8489695838012682)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -1 -9)
"cameras/drone/drone1" SET Transform localScale (1.1577371371338354 1.1577371371338354 1.1577371371338354)
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
"cameras" SET Transform position (0 4.6274738693192825 0)
"cameras" SET Transform eulerAngles (-0.943877166190866 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9571503266375406
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7305422278504146
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09334322877144832
"cameras/drone/drone0" SET Transform localPosition (-0.17200399287185286 0.38987003810891346 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4670121667156605 1.0454919578119741 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 2 18)
"cameras/drone/drone0" SET Transform localScale (0.9634760171951243 0.9634760171951243 0.9634760171951243)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -4 -13)
"cameras/drone/drone1" SET Transform localScale (1.2046666120506644 1.2046666120506644 1.2046666120506644)
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
"cameras" SET Transform position (0 4.941357242402978 0)
"cameras" SET Transform eulerAngles (9.14292228278235 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.396955818838727
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9736061535459692
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06882091622648155
"cameras/drone/drone0" SET Transform localPosition (-0.8128711364644768 0.1816192990549887 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6735804341829988 1.1432758531224012 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -1 19)
"cameras/drone/drone0" SET Transform localScale (1.469731996578957 1.469731996578957 1.469731996578957)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 12 -1)
"cameras/drone/drone1" SET Transform localScale (0.806022389347813 0.806022389347813 0.806022389347813)
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
"cameras" SET Transform position (0 4.383040578414795 0)
"cameras" SET Transform eulerAngles (-18.130151258706505 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5778138159005106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9877093615184909
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32847488895470617
"cameras/drone/drone0" SET Transform localPosition (-0.8350725229186169 0.1674371502076621 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3492314321402281 1.1656640305295323 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 1 -7)
"cameras/drone/drone0" SET Transform localScale (0.6283792448405554 0.6283792448405554 0.6283792448405554)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -5 -5)
"cameras/drone/drone1" SET Transform localScale (0.7449413988344217 0.7449413988344217 0.7449413988344217)
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
"cameras" SET Transform position (0 4.183547816164255 0)
"cameras" SET Transform eulerAngles (2.190105134560145 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9844890852085998
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.849300898923714
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34380308040648516
"cameras/drone/drone0" SET Transform localPosition (0.3198832654635062 0.22655235714352256 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06988877231600199 1.2814092124251963 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -2 14)
"cameras/drone/drone0" SET Transform localScale (1.3162539259726675 1.3162539259726675 1.3162539259726675)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 20 -5)
"cameras/drone/drone1" SET Transform localScale (0.9236188792087496 0.9236188792087496 0.9236188792087496)
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
"cameras" SET Transform position (0 4.452004878797612 0)
"cameras" SET Transform eulerAngles (10.267838420062333 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49011311608950087
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.506502585754287
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24785502281261995
"cameras/drone/drone0" SET Transform localPosition (-0.8383551422013088 0.49359072078110183 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0323949818274931 1.0252474170231798 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -11 -15)
"cameras/drone/drone0" SET Transform localScale (0.9151902404928527 0.9151902404928527 0.9151902404928527)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -17 4)
"cameras/drone/drone1" SET Transform localScale (0.9173061323189509 0.9173061323189509 0.9173061323189509)
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
"cameras" SET Transform position (0 3.838983969792352 0)
"cameras" SET Transform eulerAngles (12.108955519866889 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.98550016114773
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2637242337182653
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2946949832340618
"cameras/drone/drone0" SET Transform localPosition (0.9970402370307598 0.4377429856314475 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5539290899393114 1.0275437653485007 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -6 1)
"cameras/drone/drone0" SET Transform localScale (0.7172498759311814 0.7172498759311814 0.7172498759311814)
"cameras/drone/drone1" SET Transform localEulerAngles (10 17 -4)
"cameras/drone/drone1" SET Transform localScale (1.2230600203760762 1.2230600203760762 1.2230600203760762)
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
"cameras" SET Transform position (0 4.458976989711273 0)
"cameras" SET Transform eulerAngles (10.325086673940444 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6909210763651366
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9281765572721121
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08432235775793542
"cameras/drone/drone0" SET Transform localPosition (-0.19071667594711394 0.5734178803843457 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.620452391332863 1.0046710475224687 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 8 -1)
"cameras/drone/drone0" SET Transform localScale (1.1984999610426588 1.1984999610426588 1.1984999610426588)
"cameras/drone/drone1" SET Transform localEulerAngles (19 7 -7)
"cameras/drone/drone1" SET Transform localScale (1.3439524862985373 1.3439524862985373 1.3439524862985373)
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
"cameras" SET Transform position (0 4.909790725003881 0)
"cameras" SET Transform eulerAngles (-4.483285783205467 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7447591995627767
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.624723255024303
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25003371876527986
"cameras/drone/drone0" SET Transform localPosition (0.7532253983854009 0.4269174667859225 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.47723506429623075 1.24897171512744 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -7 -4)
"cameras/drone/drone0" SET Transform localScale (1.0314296733124773 1.0314296733124773 1.0314296733124773)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 11 10)
"cameras/drone/drone1" SET Transform localScale (0.6040002635052077 0.6040002635052077 0.6040002635052077)
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
"cameras" SET Transform position (0 4.938112577276578 0)
"cameras" SET Transform eulerAngles (-2.906495868888463 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6393459645256419
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.528068939922867
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17663033098771663
"cameras/drone/drone0" SET Transform localPosition (1.0822610211839006 0.37815784331415375 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1830251287615539 1.0866899225368858 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 2 -11)
"cameras/drone/drone0" SET Transform localScale (1.4315060789326757 1.4315060789326757 1.4315060789326757)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -9 11)
"cameras/drone/drone1" SET Transform localScale (1.2974062983106815 1.2974062983106815 1.2974062983106815)
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
"cameras" SET Transform position (0 3.425861588837856 0)
"cameras" SET Transform eulerAngles (-10.433020409515041 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7557544337103738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7709675321796259
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3492127412378167
"cameras/drone/drone0" SET Transform localPosition (0.5447254158768478 -0.27821878541135553 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.39631883834306403 0.9676204087871416 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -15 18)
"cameras/drone/drone0" SET Transform localScale (1.2929876815661125 1.2929876815661125 1.2929876815661125)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 10 -10)
"cameras/drone/drone1" SET Transform localScale (0.7312750587595253 0.7312750587595253 0.7312750587595253)
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
"cameras" SET Transform position (0 3.59518500325725 0)
"cameras" SET Transform eulerAngles (-6.053553612676023 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9845006563138178
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5501893126175752
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2333769524011895
"cameras/drone/drone0" SET Transform localPosition (-0.25305014376491664 0.16754556604870768 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7219222270029126 1.1847072712034514 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -17 13)
"cameras/drone/drone0" SET Transform localScale (0.9052058589996458 0.9052058589996458 0.9052058589996458)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 16 -10)
"cameras/drone/drone1" SET Transform localScale (1.0526596498285385 1.0526596498285385 1.0526596498285385)
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
"cameras" SET Transform position (0 3.5446783103267547 0)
"cameras" SET Transform eulerAngles (-6.727462201687974 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5284733484658735
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9442821649498545
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.026180647749147745
"cameras/drone/drone0" SET Transform localPosition (-0.45451110135365946 0.5148756945877133 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8222308645792562 1.1943344095224329 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -14 13)
"cameras/drone/drone0" SET Transform localScale (0.972290481482696 0.972290481482696 0.972290481482696)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -9 13)
"cameras/drone/drone1" SET Transform localScale (0.8964008140670313 0.8964008140670313 0.8964008140670313)
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
"cameras" SET Transform position (0 3.5288461668007125 0)
"cameras" SET Transform eulerAngles (-1.231150766971826 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8855279332796824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9926140556440357
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35327105807182907
"cameras/drone/drone0" SET Transform localPosition (-0.720096547757588 0.35438632860766267 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1457286065671848 1.1713502828412086 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -6 11)
"cameras/drone/drone0" SET Transform localScale (0.7869159598037307 0.7869159598037307 0.7869159598037307)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -13 16)
"cameras/drone/drone1" SET Transform localScale (1.4504753814331088 1.4504753814331088 1.4504753814331088)
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
"cameras" SET Transform position (0 3.155292471432773 0)
"cameras" SET Transform eulerAngles (19.486397406717998 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.220117638232119
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9815023673535905
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1405606397726853
"cameras/drone/drone0" SET Transform localPosition (0.2443843022401555 0.1025140138958956 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1721552654180754 0.8401605105424753 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -5 -12)
"cameras/drone/drone0" SET Transform localScale (1.3910441012058086 1.3910441012058086 1.3910441012058086)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -7 -5)
"cameras/drone/drone1" SET Transform localScale (1.1813887902542763 1.1813887902542763 1.1813887902542763)
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
"cameras" SET Transform position (0 4.798202136255566 0)
"cameras" SET Transform eulerAngles (-11.481493859597496 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1012274498756556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0513775228763103
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3081456824300797
"cameras/drone/drone0" SET Transform localPosition (0.14376475860425475 0.47942716327750506 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8496720952110739 0.8333545439792132 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 5 20)
"cameras/drone/drone0" SET Transform localScale (1.0212071189978824 1.0212071189978824 1.0212071189978824)
"cameras/drone/drone1" SET Transform localEulerAngles (14 7 5)
"cameras/drone/drone1" SET Transform localScale (1.0856037028255432 1.0856037028255432 1.0856037028255432)
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
"cameras" SET Transform position (0 3.599976049900846 0)
"cameras" SET Transform eulerAngles (-15.069748578418324 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7071647070482998
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.876289634823027
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.044710879712330835
"cameras/drone/drone0" SET Transform localPosition (-0.1246488160503747 0.6276042205923462 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21532269371983004 0.9558494370768724 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 4 -20)
"cameras/drone/drone0" SET Transform localScale (1.4919284383210736 1.4919284383210736 1.4919284383210736)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -20 -10)
"cameras/drone/drone1" SET Transform localScale (1.4144453643930044 1.4144453643930044 1.4144453643930044)
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
"cameras" SET Transform position (0 4.6655543015619445 0)
"cameras" SET Transform eulerAngles (-17.23466287952764 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5220827515758061
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7000167393919938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12192673304554882
"cameras/drone/drone0" SET Transform localPosition (-0.5200031974824642 0.02722748396440383 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1081615517329368 0.8314591226789927 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 7 17)
"cameras/drone/drone0" SET Transform localScale (1.1410728733456674 1.1410728733456674 1.1410728733456674)
"cameras/drone/drone1" SET Transform localEulerAngles (0 7 12)
"cameras/drone/drone1" SET Transform localScale (1.0422820141621876 1.0422820141621876 1.0422820141621876)
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
"cameras" SET Transform position (0 3.318683000287848 0)
"cameras" SET Transform eulerAngles (7.485724111785018 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6754614539573796
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.763444096105093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16653521167106533
"cameras/drone/drone0" SET Transform localPosition (0.7719456281286694 0.07958772741408998 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0003048582035696 1.0177201286205784 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -15 8)
"cameras/drone/drone0" SET Transform localScale (1.3438641333210355 1.3438641333210355 1.3438641333210355)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -11 10)
"cameras/drone/drone1" SET Transform localScale (0.8327033435191253 0.8327033435191253 0.8327033435191253)
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
"cameras" SET Transform position (0 3.0019941658758906 0)
"cameras" SET Transform eulerAngles (-10.632655562509633 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.099120650398266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0193730849044962
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.027795590022969077
"cameras/drone/drone0" SET Transform localPosition (0.8994068031825619 0.2859642321708193 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4239791014442513 1.1195679608404903 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 12 -15)
"cameras/drone/drone0" SET Transform localScale (1.3010407289532973 1.3010407289532973 1.3010407289532973)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -15 14)
"cameras/drone/drone1" SET Transform localScale (1.302932046859807 1.302932046859807 1.302932046859807)
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
"cameras" SET Transform position (0 3.2415394950404104 0)
"cameras" SET Transform eulerAngles (11.55068291385274 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5914056494675117
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7540834648438235
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1305050183679648
"cameras/drone/drone0" SET Transform localPosition (0.4043845974280327 -0.17263826386716447 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19562686336606872 1.0150039387684138 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -6 3)
"cameras/drone/drone0" SET Transform localScale (1.1502968317632218 1.1502968317632218 1.1502968317632218)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -5 5)
"cameras/drone/drone1" SET Transform localScale (0.8195110592917858 0.8195110592917858 0.8195110592917858)
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
"cameras" SET Transform position (0 4.6378983999901955 0)
"cameras" SET Transform eulerAngles (17.763772155253257 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2699449326027528
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.367319920485902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1549399908566639
"cameras/drone/drone0" SET Transform localPosition (0.4413500997917996 -0.08138515025169196 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5181024027414203 0.8299723699815664 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 15 14)
"cameras/drone/drone0" SET Transform localScale (0.7481296590653015 0.7481296590653015 0.7481296590653015)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 13 0)
"cameras/drone/drone1" SET Transform localScale (1.0176703712393829 1.0176703712393829 1.0176703712393829)
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
"cameras" SET Transform position (0 4.314394367074809 0)
"cameras" SET Transform eulerAngles (9.358989072113921 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46552992401630194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6840255605977332
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11039455250700136
"cameras/drone/drone0" SET Transform localPosition (0.16065468731280852 -0.2711299508736435 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.38937261299200054 1.2851369370310783 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -20 -15)
"cameras/drone/drone0" SET Transform localScale (0.605641903148031 0.605641903148031 0.605641903148031)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -6 5)
"cameras/drone/drone1" SET Transform localScale (1.0124818903462303 1.0124818903462303 1.0124818903462303)
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
"cameras" SET Transform position (0 3.5646290889025836 0)
"cameras" SET Transform eulerAngles (-13.812771617172949 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5232420933768946
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0374861337095393
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2240055932123274
"cameras/drone/drone0" SET Transform localPosition (0.49108942902307384 -0.2132839410944431 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5329131647093069 1.226376954401011 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 0 14)
"cameras/drone/drone0" SET Transform localScale (0.6335287833455101 0.6335287833455101 0.6335287833455101)
"cameras/drone/drone1" SET Transform localEulerAngles (10 0 -13)
"cameras/drone/drone1" SET Transform localScale (1.1785816130955156 1.1785816130955156 1.1785816130955156)
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
"cameras" SET Transform position (0 3.3375433923465474 0)
"cameras" SET Transform eulerAngles (7.301835449016835 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.128224711270327
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.866303567779465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03513660508394358
"cameras/drone/drone0" SET Transform localPosition (-0.7691554786415374 -0.29597657891582535 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5542859379424132 0.8491265717190524 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 12 4)
"cameras/drone/drone0" SET Transform localScale (1.1193451474540441 1.1193451474540441 1.1193451474540441)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -15 -10)
"cameras/drone/drone1" SET Transform localScale (0.98358606937576 0.98358606937576 0.98358606937576)
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
"cameras" SET Transform position (0 3.1220159364259006 0)
"cameras" SET Transform eulerAngles (15.226931671284149 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5156357937889685
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5851530866655428
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29735889062282145
"cameras/drone/drone0" SET Transform localPosition (1.0029690089531231 0.4930206229720638 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8520274390561741 1.0380781874031604 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 14 -8)
"cameras/drone/drone0" SET Transform localScale (0.8806497491253349 0.8806497491253349 0.8806497491253349)
"cameras/drone/drone1" SET Transform localEulerAngles (9 15 2)
"cameras/drone/drone1" SET Transform localScale (1.1187164673818462 1.1187164673818462 1.1187164673818462)
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
"cameras" SET Transform position (0 4.657598615334584 0)
"cameras" SET Transform eulerAngles (15.778936093305546 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5762130230438706
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2267617555012966
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.061729907162401704
"cameras/drone/drone0" SET Transform localPosition (0.049729379477557956 0.14037200723902338 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4966542351613523 0.9834667623113711 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 9 -8)
"cameras/drone/drone0" SET Transform localScale (1.4983561308429065 1.4983561308429065 1.4983561308429065)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -19 -20)
"cameras/drone/drone1" SET Transform localScale (1.2331083362819282 1.2331083362819282 1.2331083362819282)
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
"cameras" SET Transform position (0 4.510143977868073 0)
"cameras" SET Transform eulerAngles (-7.750913399882204 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6975627625628205
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8212444369517078
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.056284922015637485
"cameras/drone/drone0" SET Transform localPosition (-0.5996732705624486 0.24964076259763074 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8896375714276148 1.1472279211236884 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -18 9)
"cameras/drone/drone0" SET Transform localScale (1.203449662028461 1.203449662028461 1.203449662028461)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -5 -12)
"cameras/drone/drone1" SET Transform localScale (1.3341839386020435 1.3341839386020435 1.3341839386020435)
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
"cameras" SET Transform position (0 4.501183786068905 0)
"cameras" SET Transform eulerAngles (9.40494423433741 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1405737276970611
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2530533814251519
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09309943073842014
"cameras/drone/drone0" SET Transform localPosition (-0.47934374809512825 0.031248383185503548 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.44736288249494427 0.8609868605349704 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 13 -18)
"cameras/drone/drone0" SET Transform localScale (1.2450037717092555 1.2450037717092555 1.2450037717092555)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 19 16)
"cameras/drone/drone1" SET Transform localScale (0.8232061669762876 0.8232061669762876 0.8232061669762876)
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
"cameras" SET Transform position (0 3.981901619432465 0)
"cameras" SET Transform eulerAngles (-6.485947023435234 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1598993291046864
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9904158463119225
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3961946075952152
"cameras/drone/drone0" SET Transform localPosition (-0.4680785480902344 0.3763268532835821 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5489872821310865 1.2099491947172183 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 10 -15)
"cameras/drone/drone0" SET Transform localScale (1.2446500597611243 1.2446500597611243 1.2446500597611243)
"cameras/drone/drone1" SET Transform localEulerAngles (10 2 -16)
"cameras/drone/drone1" SET Transform localScale (0.7978675056722551 0.7978675056722551 0.7978675056722551)
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
"cameras" SET Transform position (0 3.8761619077354865 0)
"cameras" SET Transform eulerAngles (-10.411707845976924 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8697219071054745
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8065684943554783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21343255727456403
"cameras/drone/drone0" SET Transform localPosition (0.5346094019098926 0.5106428599685149 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.27175539877389543 0.8790228163333578 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 15 -20)
"cameras/drone/drone0" SET Transform localScale (1.031557990889544 1.031557990889544 1.031557990889544)
"cameras/drone/drone1" SET Transform localEulerAngles (19 12 2)
"cameras/drone/drone1" SET Transform localScale (1.3673076232728558 1.3673076232728558 1.3673076232728558)
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
"cameras" SET Transform position (0 3.89966709881996 0)
"cameras" SET Transform eulerAngles (18.23751689252107 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5889719709766914
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7040199554136435
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06247582593955756
"cameras/drone/drone0" SET Transform localPosition (-0.3966430705761286 -0.048872972456511066 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.13046267183784743 1.0812674566742584 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -12 -4)
"cameras/drone/drone0" SET Transform localScale (1.1298236037626546 1.1298236037626546 1.1298236037626546)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -19 3)
"cameras/drone/drone1" SET Transform localScale (0.8933457361461341 0.8933457361461341 0.8933457361461341)
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
"cameras" SET Transform position (0 4.608508866863333 0)
"cameras" SET Transform eulerAngles (15.889932939045345 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3623887624919206
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5416792171079985
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3140814590374654
"cameras/drone/drone0" SET Transform localPosition (-0.5505173686493473 0.554852918928288 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8737646751894437 1.1319423339015366 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -2 -12)
"cameras/drone/drone0" SET Transform localScale (0.9369261325559224 0.9369261325559224 0.9369261325559224)
"cameras/drone/drone1" SET Transform localEulerAngles (19 12 -6)
"cameras/drone/drone1" SET Transform localScale (0.6999834092446986 0.6999834092446986 0.6999834092446986)
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
"cameras" SET Transform position (0 4.345487448489463 0)
"cameras" SET Transform eulerAngles (-19.37374516805678 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9171869009092144
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9991417738414987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19980642713475807
"cameras/drone/drone0" SET Transform localPosition (-1.198527182681516 0.22491079911603712 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0059185587414852 1.1541484219909321 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 16 -2)
"cameras/drone/drone0" SET Transform localScale (1.162288150349278 1.162288150349278 1.162288150349278)
"cameras/drone/drone1" SET Transform localEulerAngles (9 4 17)
"cameras/drone/drone1" SET Transform localScale (0.6988805620410105 0.6988805620410105 0.6988805620410105)
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
"cameras" SET Transform position (0 3.0525967571278914 0)
"cameras" SET Transform eulerAngles (-11.068879331096158 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5414122970598845
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8698566672721049
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04326816442601605
"cameras/drone/drone0" SET Transform localPosition (0.4645714181953926 -0.019546411051557133 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17288138317693846 0.8056130222452529 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -11 19)
"cameras/drone/drone0" SET Transform localScale (0.7519646829057074 0.7519646829057074 0.7519646829057074)
"cameras/drone/drone1" SET Transform localEulerAngles (20 1 -15)
"cameras/drone/drone1" SET Transform localScale (1.3302853247122761 1.3302853247122761 1.3302853247122761)
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
"cameras" SET Transform position (0 4.410570837734969 0)
"cameras" SET Transform eulerAngles (17.0503358158551 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0225106908213433
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6711920541790484
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2051559470119111
"cameras/drone/drone0" SET Transform localPosition (0.936211171652013 0.6885983858150697 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9050159253990708 1.1004766315749863 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 19 15)
"cameras/drone/drone0" SET Transform localScale (0.9271056341156046 0.9271056341156046 0.9271056341156046)
"cameras/drone/drone1" SET Transform localEulerAngles (20 3 -2)
"cameras/drone/drone1" SET Transform localScale (1.039278277386349 1.039278277386349 1.039278277386349)
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
"cameras" SET Transform position (0 4.074639522871387 0)
"cameras" SET Transform eulerAngles (14.428706022552106 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5233134456325383
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3706806270512855
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.024261522845724803
"cameras/drone/drone0" SET Transform localPosition (-1.0797937314761394 0.280155076724428 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0826659794171385 0.8376496788598111 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -2 -1)
"cameras/drone/drone0" SET Transform localScale (1.1690323192234202 1.1690323192234202 1.1690323192234202)
"cameras/drone/drone1" SET Transform localEulerAngles (17 17 -2)
"cameras/drone/drone1" SET Transform localScale (1.314946767482872 1.314946767482872 1.314946767482872)
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
"cameras" SET Transform position (0 4.7321607917095525 0)
"cameras" SET Transform eulerAngles (4.8548984218026305 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0179057549839916
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.37676884179065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18866295139745268
"cameras/drone/drone0" SET Transform localPosition (0.5884155557333814 0.15499750331674572 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.792543089328948 1.230017565137175 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -15 6)
"cameras/drone/drone0" SET Transform localScale (1.345123583930505 1.345123583930505 1.345123583930505)
"cameras/drone/drone1" SET Transform localEulerAngles (11 19 -13)
"cameras/drone/drone1" SET Transform localScale (0.6352761596844788 0.6352761596844788 0.6352761596844788)
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
"cameras" SET Transform position (0 4.231790818045711 0)
"cameras" SET Transform eulerAngles (8.109113729682665 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.022203074080679
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.554517913962226
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22561242872946444
"cameras/drone/drone0" SET Transform localPosition (-0.3063696117840248 0.222035092080699 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0854468071676788 1.1824646313593634 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -20 -18)
"cameras/drone/drone0" SET Transform localScale (1.2335215949896772 1.2335215949896772 1.2335215949896772)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 20 16)
"cameras/drone/drone1" SET Transform localScale (0.7245540534348495 0.7245540534348495 0.7245540534348495)
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
"cameras" SET Transform position (0 3.7668721047472316 0)
"cameras" SET Transform eulerAngles (-15.747253486015452 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5809354740640762
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6116078952899306
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39755842979262834
"cameras/drone/drone0" SET Transform localPosition (-0.7461606112966297 -0.26566044696724805 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09624170271394261 1.2768811347263587 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 1 -13)
"cameras/drone/drone0" SET Transform localScale (1.3445508663205605 1.3445508663205605 1.3445508663205605)
"cameras/drone/drone1" SET Transform localEulerAngles (7 20 -3)
"cameras/drone/drone1" SET Transform localScale (1.3354992516609936 1.3354992516609936 1.3354992516609936)
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
"cameras" SET Transform position (0 4.490248272583851 0)
"cameras" SET Transform eulerAngles (-17.704962481080535 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.031124023015736
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7125689177115588
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21548142226098863
"cameras/drone/drone0" SET Transform localPosition (-0.0812192945107637 0.5283314932253373 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4181205095505961 1.2803059945887594 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 4 14)
"cameras/drone/drone0" SET Transform localScale (1.108027612658847 1.108027612658847 1.108027612658847)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 16 -20)
"cameras/drone/drone1" SET Transform localScale (0.8983903922591667 0.8983903922591667 0.8983903922591667)
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
"cameras" SET Transform position (0 4.862093196913486 0)
"cameras" SET Transform eulerAngles (18.631713261752743 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4077882359384705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0794175011045488
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07362254103669295
"cameras/drone/drone0" SET Transform localPosition (-0.6095872259605649 -0.15098835924726411 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.198383050147285 0.9857722374734612 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 17 9)
"cameras/drone/drone0" SET Transform localScale (0.8978641312565767 0.8978641312565767 0.8978641312565767)
"cameras/drone/drone1" SET Transform localEulerAngles (7 3 -12)
"cameras/drone/drone1" SET Transform localScale (1.3899814299700788 1.3899814299700788 1.3899814299700788)
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
"cameras" SET Transform position (0 4.999578837735894 0)
"cameras" SET Transform eulerAngles (-17.79051862696219 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0393092117851461
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3205579797276865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1716211820018455
"cameras/drone/drone0" SET Transform localPosition (-0.28961932595692574 0.40946231153806817 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5574686773906117 1.029798597093091 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 16 4)
"cameras/drone/drone0" SET Transform localScale (1.3803527465992684 1.3803527465992684 1.3803527465992684)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -10 -6)
"cameras/drone/drone1" SET Transform localScale (1.0998274265182109 1.0998274265182109 1.0998274265182109)
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
"cameras" SET Transform position (0 4.143324562199163 0)
"cameras" SET Transform eulerAngles (1.396092256490995 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9037377030748882
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8171582478150734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07370345378863478
"cameras/drone/drone0" SET Transform localPosition (-0.39439950145067304 0.5483167682487822 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6367665481405755 0.8393746926563024 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -5 12)
"cameras/drone/drone0" SET Transform localScale (0.8999444366016343 0.8999444366016343 0.8999444366016343)
"cameras/drone/drone1" SET Transform localEulerAngles (6 12 -20)
"cameras/drone/drone1" SET Transform localScale (1.3008415821596335 1.3008415821596335 1.3008415821596335)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
