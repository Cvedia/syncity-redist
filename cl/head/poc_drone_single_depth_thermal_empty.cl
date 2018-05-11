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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 169 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 78 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 59 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-1.1378369286610202 0 0)
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
"cameras" SET Transform position (0 4.371113248083876 0)
"cameras" SET Transform eulerAngles (13.020635837126918 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0752489007011585
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8563704078407706
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23479758188926386
"cameras/drone/drone0" SET Transform localPosition (1.0797699781359726 0.33200742734799565 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5241887530037932 0.8626461405037797 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 17 0)
"cameras/drone/drone0" SET Transform localScale (0.843119966733783 0.843119966733783 0.843119966733783)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 16 -12)
"cameras/drone/drone1" SET Transform localScale (0.7582627729852888 0.7582627729852888 0.7582627729852888)
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
"cameras" SET Transform position (0 3.4877037793031658 0)
"cameras" SET Transform eulerAngles (-12.544564001685622 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4615877854146193
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5166016718550481
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22816485885703253
"cameras/drone/drone0" SET Transform localPosition (0.2562001807395753 -0.2004806628216746 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.768936417297664 1.0278323580339115 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -3 3)
"cameras/drone/drone0" SET Transform localScale (0.6139017192318139 0.6139017192318139 0.6139017192318139)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 2 0)
"cameras/drone/drone1" SET Transform localScale (0.6584236053579773 0.6584236053579773 0.6584236053579773)
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
"cameras" SET Transform position (0 4.049470947703063 0)
"cameras" SET Transform eulerAngles (18.795099889038 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1125741379957381
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4832272078745028
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23139866875834103
"cameras/drone/drone0" SET Transform localPosition (0.009996713638449783 0.5598625022766728 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.01620687808766519 1.177454440057026 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 6 6)
"cameras/drone/drone0" SET Transform localScale (0.8609300461382356 0.8609300461382356 0.8609300461382356)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -3 -3)
"cameras/drone/drone1" SET Transform localScale (1.1223735480768613 1.1223735480768613 1.1223735480768613)
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
"cameras" SET Transform position (0 3.155237869255008 0)
"cameras" SET Transform eulerAngles (-5.978352820938767 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5738370000954212
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5912935616493902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26265057730117203
"cameras/drone/drone0" SET Transform localPosition (-0.3444411772935305 0.10277284380978507 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08094193876441258 1.0878147420373034 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 19 -2)
"cameras/drone/drone0" SET Transform localScale (1.453834715831071 1.453834715831071 1.453834715831071)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 4 -6)
"cameras/drone/drone1" SET Transform localScale (1.1259620044795362 1.1259620044795362 1.1259620044795362)
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
"cameras" SET Transform position (0 4.9815047246275 0)
"cameras" SET Transform eulerAngles (12.682149812104022 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0594271463660685
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1512465020095424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10333002755408255
"cameras/drone/drone0" SET Transform localPosition (-0.5748743891904977 0.03188718103444893 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.44676731467127573 0.9222528493078834 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -3 1)
"cameras/drone/drone0" SET Transform localScale (1.171190914861715 1.171190914861715 1.171190914861715)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 10 4)
"cameras/drone/drone1" SET Transform localScale (1.148601993830666 1.148601993830666 1.148601993830666)
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
"cameras" SET Transform position (0 4.953384410408813 0)
"cameras" SET Transform eulerAngles (16.57257464762371 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1210677722408247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9026172691011176
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2512106283552909
"cameras/drone/drone0" SET Transform localPosition (0.010815088656325855 0.4421571649556258 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.0393959905542165 1.0069128994802183 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 1 7)
"cameras/drone/drone0" SET Transform localScale (0.7413235904120888 0.7413235904120888 0.7413235904120888)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 12 -11)
"cameras/drone/drone1" SET Transform localScale (0.6205661999442863 0.6205661999442863 0.6205661999442863)
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
"cameras" SET Transform position (0 3.196723473440719 0)
"cameras" SET Transform eulerAngles (-6.456905116666372 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.546041949731753
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9552015255988505
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22685095100144417
"cameras/drone/drone0" SET Transform localPosition (-1.0394813508504168 -0.27362169961149957 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8104084683130204 0.8750754820620459 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 10 -10)
"cameras/drone/drone0" SET Transform localScale (0.8612367913980301 0.8612367913980301 0.8612367913980301)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -4 3)
"cameras/drone/drone1" SET Transform localScale (1.0662911500447045 1.0662911500447045 1.0662911500447045)
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
"cameras" SET Transform position (0 4.414553614933615 0)
"cameras" SET Transform eulerAngles (-0.9345539120130653 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4987688954876033
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6185446803689696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.026685841443551572
"cameras/drone/drone0" SET Transform localPosition (0.6164998416970304 0.6210162246404496 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8210219163769648 1.297554321499184 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -15 -9)
"cameras/drone/drone0" SET Transform localScale (0.8703096385392559 0.8703096385392559 0.8703096385392559)
"cameras/drone/drone1" SET Transform localEulerAngles (18 13 0)
"cameras/drone/drone1" SET Transform localScale (0.7562170648200628 0.7562170648200628 0.7562170648200628)
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
"cameras" SET Transform position (0 3.9154044640842818 0)
"cameras" SET Transform eulerAngles (7.109890442739669 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6518380419879626
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7454869025799509
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09077839803500393
"cameras/drone/drone0" SET Transform localPosition (1.1903613136734086 0.4417290368756606 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6507355630177862 1.1269034769063686 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 8 -6)
"cameras/drone/drone0" SET Transform localScale (1.3472832474446528 1.3472832474446528 1.3472832474446528)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -19 -13)
"cameras/drone/drone1" SET Transform localScale (1.4842296868966827 1.4842296868966827 1.4842296868966827)
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
"cameras" SET Transform position (0 3.1171231655556464 0)
"cameras" SET Transform eulerAngles (15.952404360677825 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8606793382822855
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4852875430081935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22822124194926818
"cameras/drone/drone0" SET Transform localPosition (-0.5392744861102278 0.06776854177798225 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16295592775470435 0.9119412760432832 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -15 -1)
"cameras/drone/drone0" SET Transform localScale (0.9909906830739418 0.9909906830739418 0.9909906830739418)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -6 -9)
"cameras/drone/drone1" SET Transform localScale (1.2230105482491835 1.2230105482491835 1.2230105482491835)
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
"cameras" SET Transform position (0 3.1719254779089283 0)
"cameras" SET Transform eulerAngles (-14.543438586046484 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4555712594570318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5077169080962118
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0549861139954702
"cameras/drone/drone0" SET Transform localPosition (-1.1326702161182522 -0.10450117919521212 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.544366274438792 1.1916543207617059 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -14 -4)
"cameras/drone/drone0" SET Transform localScale (1.367123424352048 1.367123424352048 1.367123424352048)
"cameras/drone/drone1" SET Transform localEulerAngles (13 3 -5)
"cameras/drone/drone1" SET Transform localScale (1.1605627591668644 1.1605627591668644 1.1605627591668644)
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
"cameras" SET Transform position (0 4.866412998110346 0)
"cameras" SET Transform eulerAngles (-2.2859488785304976 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6547021831261457
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.826854990018548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2091101123042139
"cameras/drone/drone0" SET Transform localPosition (0.24203430909354884 -0.16091438237802097 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7012638235584497 0.9596586975584633 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -6 17)
"cameras/drone/drone0" SET Transform localScale (1.0532399675143962 1.0532399675143962 1.0532399675143962)
"cameras/drone/drone1" SET Transform localEulerAngles (6 17 -16)
"cameras/drone/drone1" SET Transform localScale (1.3267777600873223 1.3267777600873223 1.3267777600873223)
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
"cameras" SET Transform position (0 3.8910028173209295 0)
"cameras" SET Transform eulerAngles (-4.718230078971054 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7145721174390509
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4839277090520802
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31123562276452266
"cameras/drone/drone0" SET Transform localPosition (-0.9509193327408483 0.23476356219481692 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17439812158792733 1.0660169967739204 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -15 -5)
"cameras/drone/drone0" SET Transform localScale (1.149370243761349 1.149370243761349 1.149370243761349)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -15 19)
"cameras/drone/drone1" SET Transform localScale (0.6965344952616256 0.6965344952616256 0.6965344952616256)
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
"cameras" SET Transform position (0 3.3598366235407084 0)
"cameras" SET Transform eulerAngles (10.761023389916776 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0235464354460884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3366198329637737
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2533343930968841
"cameras/drone/drone0" SET Transform localPosition (1.064494319255622 0.461644920636792 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08043305051897853 0.8570261508139747 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -18 -20)
"cameras/drone/drone0" SET Transform localScale (0.9051030891977696 0.9051030891977696 0.9051030891977696)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -17 18)
"cameras/drone/drone1" SET Transform localScale (0.7910865503363795 0.7910865503363795 0.7910865503363795)
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
"cameras" SET Transform position (0 4.2360502352322005 0)
"cameras" SET Transform eulerAngles (19.81729451389799 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5047340537999632
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8157185456131995
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07172967605266027
"cameras/drone/drone0" SET Transform localPosition (-0.1347029608425221 0.345424778550603 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3843547920185837 1.2286034899577118 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 17 -19)
"cameras/drone/drone0" SET Transform localScale (1.1195354650774845 1.1195354650774845 1.1195354650774845)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -8 -2)
"cameras/drone/drone1" SET Transform localScale (0.8063294984031566 0.8063294984031566 0.8063294984031566)
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
"cameras" SET Transform position (0 3.1448054649907897 0)
"cameras" SET Transform eulerAngles (-15.370358802436348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4766929111059217
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4447470031175587
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.015927186265229577
"cameras/drone/drone0" SET Transform localPosition (-0.30867781750190904 -0.1914214221466381 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6555413808604802 0.9517273278513213 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -16 5)
"cameras/drone/drone0" SET Transform localScale (1.0695285106940606 1.0695285106940606 1.0695285106940606)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -14 -5)
"cameras/drone/drone1" SET Transform localScale (1.2705321714276296 1.2705321714276296 1.2705321714276296)
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
"cameras" SET Transform position (0 4.182592331588182 0)
"cameras" SET Transform eulerAngles (7.632670636119542 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4412542449142838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.946024254359886
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0774361800319034
"cameras/drone/drone0" SET Transform localPosition (0.04393294859190511 0.3560336784788684 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.467803682263883 1.0074010917362317 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -5 -3)
"cameras/drone/drone0" SET Transform localScale (1.2484923233701588 1.2484923233701588 1.2484923233701588)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -12 -13)
"cameras/drone/drone1" SET Transform localScale (1.0462618699777402 1.0462618699777402 1.0462618699777402)
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
"cameras" SET Transform position (0 3.4474911360160716 0)
"cameras" SET Transform eulerAngles (-8.929489248862508 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4020907295630436
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6247521021868283
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05958232636274188
"cameras/drone/drone0" SET Transform localPosition (1.0353343374460768 0.16995161490812521 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6800312910311799 1.043190577226595 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -11 -7)
"cameras/drone/drone0" SET Transform localScale (1.4772852729415615 1.4772852729415615 1.4772852729415615)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 16 -18)
"cameras/drone/drone1" SET Transform localScale (1.0243253096464742 1.0243253096464742 1.0243253096464742)
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
"cameras" SET Transform position (0 3.025819167111478 0)
"cameras" SET Transform eulerAngles (7.190721441927302 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3347047326181518
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9692653648622325
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27277212050968463
"cameras/drone/drone0" SET Transform localPosition (-0.7860631289648741 0.5558047832405961 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8597229490067468 0.9586810233007306 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -19 -9)
"cameras/drone/drone0" SET Transform localScale (1.3036934226235175 1.3036934226235175 1.3036934226235175)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -19 -3)
"cameras/drone/drone1" SET Transform localScale (0.6599407541119651 0.6599407541119651 0.6599407541119651)
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
"cameras" SET Transform position (0 3.5070619617994767 0)
"cameras" SET Transform eulerAngles (5.009129385397287 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4060439583988871
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1814733319843786
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20186713033639478
"cameras/drone/drone0" SET Transform localPosition (-1.139176455108092 0.2263789810191405 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2458343099102146 1.2640928980407984 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 6 -13)
"cameras/drone/drone0" SET Transform localScale (1.0490795294936799 1.0490795294936799 1.0490795294936799)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -17 1)
"cameras/drone/drone1" SET Transform localScale (0.7387198833927793 0.7387198833927793 0.7387198833927793)
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
"cameras" SET Transform position (0 4.375912783155981 0)
"cameras" SET Transform eulerAngles (11.989249227667436 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2426105094117013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7594815237547476
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34191053846746994
"cameras/drone/drone0" SET Transform localPosition (1.1131737898672036 -0.016688185920187115 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6762457208197474 1.2536210213208832 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -3 4)
"cameras/drone/drone0" SET Transform localScale (1.2688649476784177 1.2688649476784177 1.2688649476784177)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -11 15)
"cameras/drone/drone1" SET Transform localScale (0.9086791398219833 0.9086791398219833 0.9086791398219833)
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
"cameras" SET Transform position (0 3.362840234717014 0)
"cameras" SET Transform eulerAngles (3.8415058799844317 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7807169472331787
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.13536796923884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14872536116127208
"cameras/drone/drone0" SET Transform localPosition (-0.2105457609766329 -0.12218339380737547 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0956690010157033 1.177306888823485 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 16 16)
"cameras/drone/drone0" SET Transform localScale (1.4513009945490631 1.4513009945490631 1.4513009945490631)
"cameras/drone/drone1" SET Transform localEulerAngles (20 1 16)
"cameras/drone/drone1" SET Transform localScale (0.6901702878284813 0.6901702878284813 0.6901702878284813)
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
"cameras" SET Transform position (0 4.788191606419481 0)
"cameras" SET Transform eulerAngles (-12.074721979693752 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5470590241089566
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1774818193771712
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06471288079643962
"cameras/drone/drone0" SET Transform localPosition (0.3452659481887941 -0.2873431483889651 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.567552595483078 1.1193428387815185 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 0 -19)
"cameras/drone/drone0" SET Transform localScale (0.9118899230104992 0.9118899230104992 0.9118899230104992)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -7 -3)
"cameras/drone/drone1" SET Transform localScale (1.378635463091911 1.378635463091911 1.378635463091911)
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
"cameras" SET Transform position (0 3.713323353051808 0)
"cameras" SET Transform eulerAngles (2.431525067180953 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0761568104691541
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1620613991664035
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025778805857572307
"cameras/drone/drone0" SET Transform localPosition (0.16366518532058483 0.4426411706842632 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.49565437940369417 1.1746113213444505 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -15 -14)
"cameras/drone/drone0" SET Transform localScale (0.8551862240049437 0.8551862240049437 0.8551862240049437)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -11 15)
"cameras/drone/drone1" SET Transform localScale (1.132830651130742 1.132830651130742 1.132830651130742)
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
"cameras" SET Transform position (0 4.864135636836213 0)
"cameras" SET Transform eulerAngles (-10.468593453308097 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8000909291352234
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6723428395673041
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07479565080303296
"cameras/drone/drone0" SET Transform localPosition (-0.9882296265592233 0.48496920460555265 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6599827811752396 0.9864892539689011 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 10 -12)
"cameras/drone/drone0" SET Transform localScale (1.1859966699253555 1.1859966699253555 1.1859966699253555)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -14 -8)
"cameras/drone/drone1" SET Transform localScale (0.844813768160965 0.844813768160965 0.844813768160965)
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
"cameras" SET Transform position (0 4.567827801519517 0)
"cameras" SET Transform eulerAngles (-14.934320793773392 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5165640249195211
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8139299468557373
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1706317120274452
"cameras/drone/drone0" SET Transform localPosition (0.5282372847639758 0.4962522292704588 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.048460408456145 1.28399004330695 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -20 20)
"cameras/drone/drone0" SET Transform localScale (1.0384687121472749 1.0384687121472749 1.0384687121472749)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 2 -3)
"cameras/drone/drone1" SET Transform localScale (0.7945026783213939 0.7945026783213939 0.7945026783213939)
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
"cameras" SET Transform position (0 4.408744224727697 0)
"cameras" SET Transform eulerAngles (-18.09725555581101 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1661448803306627
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4493896719070594
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2403966688642928
"cameras/drone/drone0" SET Transform localPosition (0.1327265717813384 -0.24074993204777445 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.38531854532581433 1.0543469183314604 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -1 6)
"cameras/drone/drone0" SET Transform localScale (0.6841890763028227 0.6841890763028227 0.6841890763028227)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 8 -3)
"cameras/drone/drone1" SET Transform localScale (0.8110116090319406 0.8110116090319406 0.8110116090319406)
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
"cameras" SET Transform position (0 4.237335854433676 0)
"cameras" SET Transform eulerAngles (3.5065351442298365 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7261999722184371
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3041545072225333
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05441679417481376
"cameras/drone/drone0" SET Transform localPosition (-0.40031790372606546 -0.005419894783362744 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1962585671336412 1.293079619158293 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 19 -1)
"cameras/drone/drone0" SET Transform localScale (1.3713319428560897 1.3713319428560897 1.3713319428560897)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -18 -20)
"cameras/drone/drone1" SET Transform localScale (0.6712749656508029 0.6712749656508029 0.6712749656508029)
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
"cameras" SET Transform position (0 3.1334932403244786 0)
"cameras" SET Transform eulerAngles (-9.12722734954726 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.413267968902139
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2973131310254318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.285411926271271
"cameras/drone/drone0" SET Transform localPosition (0.2105055763933268 0.1023523001385645 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4174496483656641 0.9361187433987183 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 3 -13)
"cameras/drone/drone0" SET Transform localScale (1.2242352394793592 1.2242352394793592 1.2242352394793592)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -1 -17)
"cameras/drone/drone1" SET Transform localScale (0.6738250489238464 0.6738250489238464 0.6738250489238464)
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
"cameras" SET Transform position (0 3.791056680170594 0)
"cameras" SET Transform eulerAngles (16.517516229508374 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5153149175552048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0733932628928524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1281607339658289
"cameras/drone/drone0" SET Transform localPosition (-0.8069013483712772 0.5038081750524535 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.11430877574740927 1.1048855405218525 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -13 -19)
"cameras/drone/drone0" SET Transform localScale (1.4562840710444434 1.4562840710444434 1.4562840710444434)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -9 -13)
"cameras/drone/drone1" SET Transform localScale (0.8266598526926587 0.8266598526926587 0.8266598526926587)
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
"cameras" SET Transform position (0 4.635946342216884 0)
"cameras" SET Transform eulerAngles (17.547337734587757 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.480119425998648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3870477223940303
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38727164680148196
"cameras/drone/drone0" SET Transform localPosition (0.21752911931400454 0.6315156607806223 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0691349359768616 0.861497241729162 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 8 19)
"cameras/drone/drone0" SET Transform localScale (0.7797584261295172 0.7797584261295172 0.7797584261295172)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -18 0)
"cameras/drone/drone1" SET Transform localScale (1.078102002768889 1.078102002768889 1.078102002768889)
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
"cameras" SET Transform position (0 3.227533086179762 0)
"cameras" SET Transform eulerAngles (13.544214932175336 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4000270774673077
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6831713522930176
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2931998817351262
"cameras/drone/drone0" SET Transform localPosition (0.8183378692360261 -0.10095302638400844 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.02565627377714219 0.8257965564358045 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 6 7)
"cameras/drone/drone0" SET Transform localScale (0.7968066880406844 0.7968066880406844 0.7968066880406844)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -7 13)
"cameras/drone/drone1" SET Transform localScale (1.2099485570780835 1.2099485570780835 1.2099485570780835)
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
"cameras" SET Transform position (0 4.088339941044441 0)
"cameras" SET Transform eulerAngles (0.9496701852086211 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2669254066733586
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8375547664299643
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3885253325903854
"cameras/drone/drone0" SET Transform localPosition (-0.08153128929249953 0.14830931488170734 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9454799389581965 0.9964921486328098 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -4 -3)
"cameras/drone/drone0" SET Transform localScale (1.4406980791053643 1.4406980791053643 1.4406980791053643)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -7 11)
"cameras/drone/drone1" SET Transform localScale (1.1978012885378286 1.1978012885378286 1.1978012885378286)
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
"cameras" SET Transform position (0 3.61358734848078 0)
"cameras" SET Transform eulerAngles (-5.298070560460349 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4619297195259313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8321862401737514
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33957712652022226
"cameras/drone/drone0" SET Transform localPosition (-1.1391621002032628 0.1457729311177824 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.37249020346607287 1.1545127805308883 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 18 15)
"cameras/drone/drone0" SET Transform localScale (0.7333801181180124 0.7333801181180124 0.7333801181180124)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 5 -1)
"cameras/drone/drone1" SET Transform localScale (0.6782508211899371 0.6782508211899371 0.6782508211899371)
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
"cameras" SET Transform position (0 3.9964942422474405 0)
"cameras" SET Transform eulerAngles (4.231909541187775 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5516179792463257
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0239475725490872
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14460538017683638
"cameras/drone/drone0" SET Transform localPosition (-1.1453884525854519 -0.011678039752212765 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6252762221498893 1.2684345517789772 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 17 8)
"cameras/drone/drone0" SET Transform localScale (0.7107811217799289 0.7107811217799289 0.7107811217799289)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -20 -10)
"cameras/drone/drone1" SET Transform localScale (1.0083446418637616 1.0083446418637616 1.0083446418637616)
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
"cameras" SET Transform position (0 3.6124222072891214 0)
"cameras" SET Transform eulerAngles (-5.28852023254775 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.007467770208343
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5639570603902508
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23285561007825933
"cameras/drone/drone0" SET Transform localPosition (0.7425530655935599 0.10148221315292 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2663680783489788 0.9984373362022757 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 3 19)
"cameras/drone/drone0" SET Transform localScale (0.710941221841177 0.710941221841177 0.710941221841177)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 20 -15)
"cameras/drone/drone1" SET Transform localScale (1.1560216434440824 1.1560216434440824 1.1560216434440824)
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
"cameras" SET Transform position (0 3.833961803547949 0)
"cameras" SET Transform eulerAngles (-13.005146301700123 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5936593986073819
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4641449989268231
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24916168550657047
"cameras/drone/drone0" SET Transform localPosition (0.8045409317311376 0.19320401174791185 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5620952207792267 1.1862361532954386 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 0 -1)
"cameras/drone/drone0" SET Transform localScale (1.2804374352297931 1.2804374352297931 1.2804374352297931)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -13 4)
"cameras/drone/drone1" SET Transform localScale (0.616191201689362 0.616191201689362 0.616191201689362)
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
"cameras" SET Transform position (0 3.397175441907928 0)
"cameras" SET Transform eulerAngles (5.23132224584829 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.885578851159089
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4671349883713223
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20490827182263838
"cameras/drone/drone0" SET Transform localPosition (0.13610249205194336 0.5606860715159039 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7555696699578167 0.9144183273255791 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 11 11)
"cameras/drone/drone0" SET Transform localScale (0.8971367705173438 0.8971367705173438 0.8971367705173438)
"cameras/drone/drone1" SET Transform localEulerAngles (5 4 3)
"cameras/drone/drone1" SET Transform localScale (0.6045863896478233 0.6045863896478233 0.6045863896478233)
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
"cameras" SET Transform position (0 3.0752522803704077 0)
"cameras" SET Transform eulerAngles (8.774438818193218 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3195576133051559
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8124627268603843
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2831811023240725
"cameras/drone/drone0" SET Transform localPosition (-0.5970943641398382 0.4801631366346992 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.725000571361459 1.103373737510115 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 11 0)
"cameras/drone/drone0" SET Transform localScale (1.1810986296677577 1.1810986296677577 1.1810986296677577)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -5 16)
"cameras/drone/drone1" SET Transform localScale (0.6111426165168938 0.6111426165168938 0.6111426165168938)
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
"cameras" SET Transform position (0 3.118085054187496 0)
"cameras" SET Transform eulerAngles (13.774822823417288 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8724866248652956
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8983462250529801
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3228993881199862
"cameras/drone/drone0" SET Transform localPosition (0.47570870591502223 0.19649625078426253 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8830377907055051 0.8013284592705607 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 9 -2)
"cameras/drone/drone0" SET Transform localScale (0.7337115691258388 0.7337115691258388 0.7337115691258388)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -2 11)
"cameras/drone/drone1" SET Transform localScale (1.4075299071396743 1.4075299071396743 1.4075299071396743)
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
"cameras" SET Transform position (0 4.1959982421542295 0)
"cameras" SET Transform eulerAngles (11.993324027357694 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7404865606498514
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9601928500898314
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0617919062803991
"cameras/drone/drone0" SET Transform localPosition (-0.40705648569516784 0.016365781698992554 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0093347203488492 0.8450048504693136 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 9 20)
"cameras/drone/drone0" SET Transform localScale (0.9056310813222588 0.9056310813222588 0.9056310813222588)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -6 13)
"cameras/drone/drone1" SET Transform localScale (1.2257970095780975 1.2257970095780975 1.2257970095780975)
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
"cameras" SET Transform position (0 4.013173743828806 0)
"cameras" SET Transform eulerAngles (-11.117605726064092 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4943426152319463
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9702212743213003
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09962039051836524
"cameras/drone/drone0" SET Transform localPosition (-1.0176466573146041 -0.11136972750852975 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.13602510941065327 0.9757079635713228 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 17 7)
"cameras/drone/drone0" SET Transform localScale (1.3321461607958953 1.3321461607958953 1.3321461607958953)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -17 9)
"cameras/drone/drone1" SET Transform localScale (1.2670193619817132 1.2670193619817132 1.2670193619817132)
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
"cameras" SET Transform position (0 3.8024218514338637 0)
"cameras" SET Transform eulerAngles (-4.359130959140373 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5355958939741101
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4421832458238013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20986490104684546
"cameras/drone/drone0" SET Transform localPosition (-0.7349257609425885 -0.14383676161230835 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.36254337877943 0.8018876125923831 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -8 4)
"cameras/drone/drone0" SET Transform localScale (0.7175857854778764 0.7175857854778764 0.7175857854778764)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 20 5)
"cameras/drone/drone1" SET Transform localScale (1.071697601284884 1.071697601284884 1.071697601284884)
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
"cameras" SET Transform position (0 3.9182588970198644 0)
"cameras" SET Transform eulerAngles (4.543491856127492 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3092054258672507
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6408558317382922
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2543146663403452
"cameras/drone/drone0" SET Transform localPosition (-1.1213473065343316 0.5334079162495977 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1548345430257896 1.195825627578809 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 11 19)
"cameras/drone/drone0" SET Transform localScale (1.4844001372271218 1.4844001372271218 1.4844001372271218)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 3 -4)
"cameras/drone/drone1" SET Transform localScale (1.4450220792498865 1.4450220792498865 1.4450220792498865)
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
"cameras" SET Transform position (0 4.8156710228485 0)
"cameras" SET Transform eulerAngles (-11.092772826307908 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5021138833185568
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4452979074476566
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20918060731318616
"cameras/drone/drone0" SET Transform localPosition (-1.032683764780688 0.6510207952235649 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08974684974181169 1.1719209010147502 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -3 20)
"cameras/drone/drone0" SET Transform localScale (1.2278331895971224 1.2278331895971224 1.2278331895971224)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 19 10)
"cameras/drone/drone1" SET Transform localScale (0.9258880987115867 0.9258880987115867 0.9258880987115867)
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
"cameras" SET Transform position (0 4.075198862675586 0)
"cameras" SET Transform eulerAngles (14.24675017662451 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6748484176463247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.325186214152528
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15467762411156127
"cameras/drone/drone0" SET Transform localPosition (-0.6746590435683937 0.3910209942164648 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8944011958755365 0.8378434368404465 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 1 2)
"cameras/drone/drone0" SET Transform localScale (1.2918119406875737 1.2918119406875737 1.2918119406875737)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 18 12)
"cameras/drone/drone1" SET Transform localScale (1.2162969959963594 1.2162969959963594 1.2162969959963594)
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
"cameras" SET Transform position (0 4.436003885887054 0)
"cameras" SET Transform eulerAngles (-4.750202356361196 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4616911024710571
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0949604884849002
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.00929595185161376
"cameras/drone/drone0" SET Transform localPosition (-0.7681561970856279 0.45837756606260066 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.285520862136581 1.1114778695620093 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -6 6)
"cameras/drone/drone0" SET Transform localScale (0.6493072704906494 0.6493072704906494 0.6493072704906494)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -12 5)
"cameras/drone/drone1" SET Transform localScale (1.0268685940865978 1.0268685940865978 1.0268685940865978)
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
"cameras" SET Transform position (0 3.127739112933547 0)
"cameras" SET Transform eulerAngles (3.0746001469267057 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5032019721903582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9140713459620144
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.041244936537163615
"cameras/drone/drone0" SET Transform localPosition (-0.9963551015256898 0.477082846682601 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0249232793150849 0.9211310176655993 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -18 -7)
"cameras/drone/drone0" SET Transform localScale (1.1794924794285948 1.1794924794285948 1.1794924794285948)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 16 -16)
"cameras/drone/drone1" SET Transform localScale (0.7694429029919252 0.7694429029919252 0.7694429029919252)
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
"cameras" SET Transform position (0 4.253284582576119 0)
"cameras" SET Transform eulerAngles (1.600587502054779 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2335730338369042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3108640137929812
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26821728307184833
"cameras/drone/drone0" SET Transform localPosition (-0.7509777731723086 -0.09910984515770332 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9750234694093802 0.9587953196926855 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -16 11)
"cameras/drone/drone0" SET Transform localScale (1.2936372541325554 1.2936372541325554 1.2936372541325554)
"cameras/drone/drone1" SET Transform localEulerAngles (8 7 -1)
"cameras/drone/drone1" SET Transform localScale (1.3638809030367511 1.3638809030367511 1.3638809030367511)
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
"cameras" SET Transform position (0 4.235881276987365 0)
"cameras" SET Transform eulerAngles (-7.2910139902714555 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9217936246556582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9282794902318052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1168930041614805
"cameras/drone/drone0" SET Transform localPosition (-1.15981593184184 -0.2698293880577261 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08345593864251133 1.0936684140941848 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 7 14)
"cameras/drone/drone0" SET Transform localScale (1.4214525657279342 1.4214525657279342 1.4214525657279342)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -13 5)
"cameras/drone/drone1" SET Transform localScale (0.6845158124476787 0.6845158124476787 0.6845158124476787)
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
"cameras" SET Transform position (0 4.986756137584495 0)
"cameras" SET Transform eulerAngles (-4.644031475243352 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6899412188829623
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9486743342630405
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1148148603867592
"cameras/drone/drone0" SET Transform localPosition (0.12295730612327649 0.4199246287412119 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1586785787614893 1.0011591381206755 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -12 5)
"cameras/drone/drone0" SET Transform localScale (0.9046802042624762 0.9046802042624762 0.9046802042624762)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -6 20)
"cameras/drone/drone1" SET Transform localScale (1.0976034516658268 1.0976034516658268 1.0976034516658268)
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
"cameras" SET Transform position (0 4.945109312379848 0)
"cameras" SET Transform eulerAngles (16.21147333090142 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8275948570834903
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.259881363585183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17335066271200536
"cameras/drone/drone0" SET Transform localPosition (0.7899631352202494 -0.16827284033111317 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6249982934587183 1.090431546726569 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 20 5)
"cameras/drone/drone0" SET Transform localScale (1.3659368360033701 1.3659368360033701 1.3659368360033701)
"cameras/drone/drone1" SET Transform localEulerAngles (15 14 -12)
"cameras/drone/drone1" SET Transform localScale (1.4178173000169454 1.4178173000169454 1.4178173000169454)
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
"cameras" SET Transform position (0 3.6889038729511627 0)
"cameras" SET Transform eulerAngles (-18.096728532584756 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.005678954752098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7232810465084714
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05333927058083119
"cameras/drone/drone0" SET Transform localPosition (-0.7722519939625774 0.4547611516199422 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0119624584362572 0.9121002057223582 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -12 -18)
"cameras/drone/drone0" SET Transform localScale (0.7234160991346787 0.7234160991346787 0.7234160991346787)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -1 -3)
"cameras/drone/drone1" SET Transform localScale (0.9730355564073097 0.9730355564073097 0.9730355564073097)
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
"cameras" SET Transform position (0 3.3170361021193466 0)
"cameras" SET Transform eulerAngles (16.607281406272342 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.590523279533853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1713876599313102
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21326543186710079
"cameras/drone/drone0" SET Transform localPosition (0.7826700027548843 0.3018096907523306 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6564919487956683 1.0701760407624301 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 18 10)
"cameras/drone/drone0" SET Transform localScale (1.1469022418108066 1.1469022418108066 1.1469022418108066)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -2 9)
"cameras/drone/drone1" SET Transform localScale (0.6602940009081599 0.6602940009081599 0.6602940009081599)
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
"cameras" SET Transform position (0 4.764134349717239 0)
"cameras" SET Transform eulerAngles (-15.382270595665272 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4159152980980414
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8804259819117748
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3728414613590349
"cameras/drone/drone0" SET Transform localPosition (-0.5168151097288114 -0.23369636520167597 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.07126425807970249 0.9585067694822096 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 19 -1)
"cameras/drone/drone0" SET Transform localScale (0.7786440834981565 0.7786440834981565 0.7786440834981565)
"cameras/drone/drone1" SET Transform localEulerAngles (3 13 13)
"cameras/drone/drone1" SET Transform localScale (1.4523742244854652 1.4523742244854652 1.4523742244854652)
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
"cameras" SET Transform position (0 3.7717647078818834 0)
"cameras" SET Transform eulerAngles (16.161156405134292 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3785830569503807
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.286611733657876
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13889829824310782
"cameras/drone/drone0" SET Transform localPosition (0.9719335062655234 0.6701064359872189 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4704240916824297 1.1832642184141964 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -8 -1)
"cameras/drone/drone0" SET Transform localScale (1.160785299213578 1.160785299213578 1.160785299213578)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -8 -19)
"cameras/drone/drone1" SET Transform localScale (1.2714169919750469 1.2714169919750469 1.2714169919750469)
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
"cameras" SET Transform position (0 4.892937778911584 0)
"cameras" SET Transform eulerAngles (-7.786102476771685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.091901517881961
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3498378238500475
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3702763791200708
"cameras/drone/drone0" SET Transform localPosition (-0.9933739060426854 -0.23122366745363004 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5303606273263166 1.2784619511818807 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -5 -11)
"cameras/drone/drone0" SET Transform localScale (1.1057944448871853 1.1057944448871853 1.1057944448871853)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -13 -11)
"cameras/drone/drone1" SET Transform localScale (1.480405993773806 1.480405993773806 1.480405993773806)
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
"cameras" SET Transform position (0 3.6833277206794013 0)
"cameras" SET Transform eulerAngles (-19.193182961144547 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5426614951088435
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3823958955900026
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.002057642619826261
"cameras/drone/drone0" SET Transform localPosition (-0.7992708665009005 -0.05990983927654098 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6744611266089263 1.0596917477379901 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 10 -19)
"cameras/drone/drone0" SET Transform localScale (0.6714363497737449 0.6714363497737449 0.6714363497737449)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -20 -4)
"cameras/drone/drone1" SET Transform localScale (0.6045075033266759 0.6045075033266759 0.6045075033266759)
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
"cameras" SET Transform position (0 3.6296677819201513 0)
"cameras" SET Transform eulerAngles (-1.4000897291983172 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.023730844626483
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8672729292585537
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3636619288367089
"cameras/drone/drone0" SET Transform localPosition (-0.7735072795020307 0.2921340669068552 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17602233175371707 0.8199884729667173 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -19 2)
"cameras/drone/drone0" SET Transform localScale (1.3873590069775723 1.3873590069775723 1.3873590069775723)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -13 14)
"cameras/drone/drone1" SET Transform localScale (0.9969685533574003 0.9969685533574003 0.9969685533574003)
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
"cameras" SET Transform position (0 3.4004278854171623 0)
"cameras" SET Transform eulerAngles (-3.6384944907604613 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2778254082391065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.656656611951101
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3171631177624974
"cameras/drone/drone0" SET Transform localPosition (0.2309097757630445 0.3999427230646742 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5829313753071792 0.8281948907634155 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 20 2)
"cameras/drone/drone0" SET Transform localScale (1.461460775107221 1.461460775107221 1.461460775107221)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -4 20)
"cameras/drone/drone1" SET Transform localScale (1.2509950322172392 1.2509950322172392 1.2509950322172392)
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
"cameras" SET Transform position (0 3.427478359522251 0)
"cameras" SET Transform eulerAngles (12.500077877954759 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7505464800859416
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5606640796367803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2073924742401786
"cameras/drone/drone0" SET Transform localPosition (-1.15591111917942 0.4773177460737306 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9204540925992741 1.0374369242774115 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -8 -12)
"cameras/drone/drone0" SET Transform localScale (1.4548266676294785 1.4548266676294785 1.4548266676294785)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 11 14)
"cameras/drone/drone1" SET Transform localScale (0.9325139503875453 0.9325139503875453 0.9325139503875453)
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
"cameras" SET Transform position (0 3.4719109313074363 0)
"cameras" SET Transform eulerAngles (-17.19833475326237 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7503616611108844
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9828373483725876
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35412295325843246
"cameras/drone/drone0" SET Transform localPosition (-0.41766061769140916 0.18328335527870204 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.24950355195198992 0.816170263543684 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -18 13)
"cameras/drone/drone0" SET Transform localScale (0.6671792574005794 0.6671792574005794 0.6671792574005794)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -10 19)
"cameras/drone/drone1" SET Transform localScale (1.3777430008554101 1.3777430008554101 1.3777430008554101)
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
"cameras" SET Transform position (0 3.5821912527884328 0)
"cameras" SET Transform eulerAngles (-10.31083498255244 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0812222855376803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7229685904220966
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18977431448029294
"cameras/drone/drone0" SET Transform localPosition (1.1442322941178389 0.29934459381787953 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.37183882182786077 1.1173031760038352 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 4 -16)
"cameras/drone/drone0" SET Transform localScale (1.0294801797193922 1.0294801797193922 1.0294801797193922)
"cameras/drone/drone1" SET Transform localEulerAngles (20 3 17)
"cameras/drone/drone1" SET Transform localScale (1.2811406281991973 1.2811406281991973 1.2811406281991973)
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
"cameras" SET Transform position (0 3.1438052144533493 0)
"cameras" SET Transform eulerAngles (-15.72651374235397 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42791913218620703
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.846464364149106
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12837619372554201
"cameras/drone/drone0" SET Transform localPosition (0.7512874160369993 0.6335361344831072 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.29802879265427284 1.2344267976370245 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 6 13)
"cameras/drone/drone0" SET Transform localScale (0.6633944777297419 0.6633944777297419 0.6633944777297419)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 15 1)
"cameras/drone/drone1" SET Transform localScale (1.4563965914748163 1.4563965914748163 1.4563965914748163)
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
"cameras" SET Transform position (0 4.454897047168263 0)
"cameras" SET Transform eulerAngles (5.7457638011192245 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8536007162207783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5899463210619902
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3655314049845856
"cameras/drone/drone0" SET Transform localPosition (0.4751384367820932 0.2139355987585802 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.016364387377373113 1.186520405001236 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -11 3)
"cameras/drone/drone0" SET Transform localScale (0.8828593894049936 0.8828593894049936 0.8828593894049936)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -9 6)
"cameras/drone/drone1" SET Transform localScale (0.959307417940392 0.959307417940392 0.959307417940392)
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
"cameras" SET Transform position (0 4.824381943215322 0)
"cameras" SET Transform eulerAngles (15.252651429890832 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1207991644260198
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5207049447840673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21079967019843188
"cameras/drone/drone0" SET Transform localPosition (-0.3978220169877954 0.5707947133675826 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1997821923764884 0.8955572405514058 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 12 -9)
"cameras/drone/drone0" SET Transform localScale (0.6168024687100383 0.6168024687100383 0.6168024687100383)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -3 13)
"cameras/drone/drone1" SET Transform localScale (0.9361257225698348 0.9361257225698348 0.9361257225698348)
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
"cameras" SET Transform position (0 3.6143338439409884 0)
"cameras" SET Transform eulerAngles (-5.039731558523943 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5259025907082489
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2978131445060148
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2360658873585801
"cameras/drone/drone0" SET Transform localPosition (-0.5757438391496789 0.3900429371947491 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6891154055708831 0.857251766933032 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 9 -2)
"cameras/drone/drone0" SET Transform localScale (0.8669882068521408 0.8669882068521408 0.8669882068521408)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -20 4)
"cameras/drone/drone1" SET Transform localScale (0.9842783395922146 0.9842783395922146 0.9842783395922146)
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
"cameras" SET Transform position (0 3.16414466138615 0)
"cameras" SET Transform eulerAngles (-4.887718866719744 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9127422685191653
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5433546791023307
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18993589862833127
"cameras/drone/drone0" SET Transform localPosition (0.33173213809543123 0.6693061121280182 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5602634791746219 1.06061344230217 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 9 -6)
"cameras/drone/drone0" SET Transform localScale (1.4689706688515116 1.4689706688515116 1.4689706688515116)
"cameras/drone/drone1" SET Transform localEulerAngles (11 4 10)
"cameras/drone/drone1" SET Transform localScale (0.8237012488662058 0.8237012488662058 0.8237012488662058)
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
"cameras" SET Transform position (0 4.70951243292417 0)
"cameras" SET Transform eulerAngles (14.569434349886258 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3122999463390606
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2370935277654178
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.010457225631879341
"cameras/drone/drone0" SET Transform localPosition (-1.179887734271236 -0.07846294017700167 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.117268308246126 0.8954068842602488 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 17 13)
"cameras/drone/drone0" SET Transform localScale (0.7424189356981744 0.7424189356981744 0.7424189356981744)
"cameras/drone/drone1" SET Transform localEulerAngles (6 8 0)
"cameras/drone/drone1" SET Transform localScale (0.6910240752514137 0.6910240752514137 0.6910240752514137)
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
"cameras" SET Transform position (0 3.619743581829969 0)
"cameras" SET Transform eulerAngles (-6.5842624435755415 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.525704951876885
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9212763248384671
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20646947799669838
"cameras/drone/drone0" SET Transform localPosition (-0.13451167417054366 -0.096808179523382 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2116168277821886 1.187303307805895 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -14 -14)
"cameras/drone/drone0" SET Transform localScale (0.7722383249289 0.7722383249289 0.7722383249289)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -15 -19)
"cameras/drone/drone1" SET Transform localScale (1.1290506736104664 1.1290506736104664 1.1290506736104664)
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
"cameras" SET Transform position (0 4.451050264389529 0)
"cameras" SET Transform eulerAngles (-13.554332069853512 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5033038819078173
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.052669611515507
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30717459935082286
"cameras/drone/drone0" SET Transform localPosition (-1.1422921037608043 0.024983390089043434 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5055703560538941 1.018051245648377 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -14 -16)
"cameras/drone/drone0" SET Transform localScale (1.1437178243834905 1.1437178243834905 1.1437178243834905)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 15 -1)
"cameras/drone/drone1" SET Transform localScale (1.4081152062258844 1.4081152062258844 1.4081152062258844)
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
"cameras" SET Transform position (0 3.6593442020415674 0)
"cameras" SET Transform eulerAngles (-13.752018892776729 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3314956923705907
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7475498350039569
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21878193331079387
"cameras/drone/drone0" SET Transform localPosition (-0.8566930297386576 0.39386064930766757 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9255726218714524 0.9002416838347125 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -2 6)
"cameras/drone/drone0" SET Transform localScale (1.0002682974317938 1.0002682974317938 1.0002682974317938)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -3 -7)
"cameras/drone/drone1" SET Transform localScale (1.3837300454228634 1.3837300454228634 1.3837300454228634)
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
"cameras" SET Transform position (0 4.712911781091172 0)
"cameras" SET Transform eulerAngles (13.840455107983765 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8294493769856104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0272956744149173
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35732503140152844
"cameras/drone/drone0" SET Transform localPosition (-0.9702710088074001 -0.19850657946026323 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5878015985021594 1.0898141074528822 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 0 20)
"cameras/drone/drone0" SET Transform localScale (1.011916550936242 1.011916550936242 1.011916550936242)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -8 11)
"cameras/drone/drone1" SET Transform localScale (0.6411606583297992 0.6411606583297992 0.6411606583297992)
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
"cameras" SET Transform position (0 3.4465006052577634 0)
"cameras" SET Transform eulerAngles (-11.12344576596223 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.506131979408953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5079147565391648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09774026372072338
"cameras/drone/drone0" SET Transform localPosition (-0.3678831689829011 0.4670902918033292 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.45489938146462805 1.043880215810002 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -4 -13)
"cameras/drone/drone0" SET Transform localScale (1.1681335664235761 1.1681335664235761 1.1681335664235761)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 2 -1)
"cameras/drone/drone1" SET Transform localScale (1.1002076753653156 1.1002076753653156 1.1002076753653156)
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
"cameras" SET Transform position (0 4.311360037932037 0)
"cameras" SET Transform eulerAngles (-15.160207970472847 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9126372568559151
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.471418915091707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2779489916352659
"cameras/drone/drone0" SET Transform localPosition (0.9305978537368012 0.6068918930559217 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6144535510480922 1.0348185664378222 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 11 -17)
"cameras/drone/drone0" SET Transform localScale (0.8240722365719468 0.8240722365719468 0.8240722365719468)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 15 12)
"cameras/drone/drone1" SET Transform localScale (1.4920447039364557 1.4920447039364557 1.4920447039364557)
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
"cameras" SET Transform position (0 3.650491712617387 0)
"cameras" SET Transform eulerAngles (-9.732430087695288 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7912332111744462
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9770446187781254
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08224468719342917
"cameras/drone/drone0" SET Transform localPosition (0.20987458122488722 0.14723814028659682 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09297852848351407 0.996546988487277 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -18 -1)
"cameras/drone/drone0" SET Transform localScale (1.1747801194550902 1.1747801194550902 1.1747801194550902)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -16 -20)
"cameras/drone/drone1" SET Transform localScale (0.8790288402116535 0.8790288402116535 0.8790288402116535)
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
"cameras" SET Transform position (0 3.0510008741695276 0)
"cameras" SET Transform eulerAngles (11.912865975970625 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5583791068763226
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4089934236411674
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2663433798710606
"cameras/drone/drone0" SET Transform localPosition (0.47958382479183714 -0.15173228305968206 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3430329541099324 1.2449903194432652 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -15 18)
"cameras/drone/drone0" SET Transform localScale (1.42254331645051 1.42254331645051 1.42254331645051)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -1 11)
"cameras/drone/drone1" SET Transform localScale (0.9458394430035627 0.9458394430035627 0.9458394430035627)
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
"cameras" SET Transform position (0 3.9017872670547846 0)
"cameras" SET Transform eulerAngles (0.060008907156760216 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4153431156281577
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2425862082261132
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3940999490135423
"cameras/drone/drone0" SET Transform localPosition (0.1465631021081113 0.583935087105729 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.29640869871815045 1.1571392266478593 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 1 17)
"cameras/drone/drone0" SET Transform localScale (0.8186354155959784 0.8186354155959784 0.8186354155959784)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -20 11)
"cameras/drone/drone1" SET Transform localScale (0.7355968427222777 0.7355968427222777 0.7355968427222777)
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
"cameras" SET Transform position (0 4.604908549132006 0)
"cameras" SET Transform eulerAngles (-12.109095454575375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.187962347079707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3600287205812518
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19346982500515741
"cameras/drone/drone0" SET Transform localPosition (0.5064386178433204 0.07381702786628458 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.584860669534969 1.0610083453848027 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 0 11)
"cameras/drone/drone0" SET Transform localScale (1.4981377682994177 1.4981377682994177 1.4981377682994177)
"cameras/drone/drone1" SET Transform localEulerAngles (12 11 20)
"cameras/drone/drone1" SET Transform localScale (0.78901203977836 0.78901203977836 0.78901203977836)
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
"cameras" SET Transform position (0 3.3165243674995772 0)
"cameras" SET Transform eulerAngles (-17.45479606230916 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8495512952647208
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0159185601243317
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2917118694064122
"cameras/drone/drone0" SET Transform localPosition (0.4344067775430056 0.5905909918711878 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5926171843497531 0.97666701926281 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 16 12)
"cameras/drone/drone0" SET Transform localScale (1.3935413718637766 1.3935413718637766 1.3935413718637766)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -13 -8)
"cameras/drone/drone1" SET Transform localScale (0.644522767440616 0.644522767440616 0.644522767440616)
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
"cameras" SET Transform position (0 3.375817544431634 0)
"cameras" SET Transform eulerAngles (17.601825770964673 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5297987028020903
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2941906949762658
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30701121736634995
"cameras/drone/drone0" SET Transform localPosition (0.973625292710566 -0.1381752697298015 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.28064740825694634 1.030545373461889 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -13 18)
"cameras/drone/drone0" SET Transform localScale (0.8931149959617941 0.8931149959617941 0.8931149959617941)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 7 -3)
"cameras/drone/drone1" SET Transform localScale (1.0716894513890511 1.0716894513890511 1.0716894513890511)
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
"cameras" SET Transform position (0 3.5947168538338667 0)
"cameras" SET Transform eulerAngles (6.810863628676493 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9968218039200573
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1098424910381972
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2826427378080833
"cameras/drone/drone0" SET Transform localPosition (0.30275248846917324 0.12132111836600418 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1842871055986712 0.9835650602274104 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 7 19)
"cameras/drone/drone0" SET Transform localScale (0.6713063606414104 0.6713063606414104 0.6713063606414104)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -5 -3)
"cameras/drone/drone1" SET Transform localScale (1.045868555877309 1.045868555877309 1.045868555877309)
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
"cameras" SET Transform position (0 4.870725533904119 0)
"cameras" SET Transform eulerAngles (-12.26617270035289 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4201970847883789
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3630023140058105
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3705334586933197
"cameras/drone/drone0" SET Transform localPosition (0.4435091462422658 -0.2937255668107858 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.619815155797979 1.1373160151364794 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 20 -1)
"cameras/drone/drone0" SET Transform localScale (0.8464707779519179 0.8464707779519179 0.8464707779519179)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -12 17)
"cameras/drone/drone1" SET Transform localScale (0.7599447289737093 0.7599447289737093 0.7599447289737093)
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
"cameras" SET Transform position (0 3.9132898157507965 0)
"cameras" SET Transform eulerAngles (13.149478556081945 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0009125436114816
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2401734887739178
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17165169397943336
"cameras/drone/drone0" SET Transform localPosition (-0.02363065206739634 0.5031861106689501 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0103276664254566 0.9489591469911984 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 14 -7)
"cameras/drone/drone0" SET Transform localScale (1.4970636370170873 1.4970636370170873 1.4970636370170873)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -2 -5)
"cameras/drone/drone1" SET Transform localScale (0.732472629789807 0.732472629789807 0.732472629789807)
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
"cameras" SET Transform position (0 3.9880590708706922 0)
"cameras" SET Transform eulerAngles (8.25039363573493 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4085375020341091
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.58059109910397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24649662459540966
"cameras/drone/drone0" SET Transform localPosition (-0.2963928206098497 0.6739354725718563 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.010848135684737414 1.261345532690311 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 17 15)
"cameras/drone/drone0" SET Transform localScale (0.6336564981613568 0.6336564981613568 0.6336564981613568)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -15 3)
"cameras/drone/drone1" SET Transform localScale (0.8869478187529749 0.8869478187529749 0.8869478187529749)
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
"cameras" SET Transform position (0 3.997633749123569 0)
"cameras" SET Transform eulerAngles (19.123581631771998 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46751794286771164
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9746975475037988
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06527478500661914
"cameras/drone/drone0" SET Transform localPosition (-1.0213833748012262 0.4002527829121508 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.158755899093608 0.9440637697019254 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -19 -13)
"cameras/drone/drone0" SET Transform localScale (0.6646990286650879 0.6646990286650879 0.6646990286650879)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -9 -16)
"cameras/drone/drone1" SET Transform localScale (0.7623645792256655 0.7623645792256655 0.7623645792256655)
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
"cameras" SET Transform position (0 3.088106319308757 0)
"cameras" SET Transform eulerAngles (6.783748863067245 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9879552241062828
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7369715650642803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08802044229706563
"cameras/drone/drone0" SET Transform localPosition (-0.9352989543123329 0.4465625651434882 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2392372164278289 0.9897830953284643 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 15 -15)
"cameras/drone/drone0" SET Transform localScale (1.0631243181016146 1.0631243181016146 1.0631243181016146)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 11 20)
"cameras/drone/drone1" SET Transform localScale (0.9844267548983033 0.9844267548983033 0.9844267548983033)
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
"cameras" SET Transform position (0 3.0844055481745327 0)
"cameras" SET Transform eulerAngles (15.509178449025207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7518446802635876
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.618816467837316
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2534258782645676
"cameras/drone/drone0" SET Transform localPosition (0.018101504704137072 0.08182011504873093 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3880554988893806 1.0676446012956937 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 14 9)
"cameras/drone/drone0" SET Transform localScale (0.6736818984374003 0.6736818984374003 0.6736818984374003)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -8 -5)
"cameras/drone/drone1" SET Transform localScale (1.384661338089754 1.384661338089754 1.384661338089754)
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
"cameras" SET Transform position (0 4.737432913706417 0)
"cameras" SET Transform eulerAngles (-11.29113259681214 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7813168234743524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3372709049320068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02950750293820588
"cameras/drone/drone0" SET Transform localPosition (0.9195749457681581 0.2558264442373472 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1548702226751486 1.1500446529562796 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -13 5)
"cameras/drone/drone0" SET Transform localScale (0.9326991409048595 0.9326991409048595 0.9326991409048595)
"cameras/drone/drone1" SET Transform localEulerAngles (9 19 9)
"cameras/drone/drone1" SET Transform localScale (1.1484653293428022 1.1484653293428022 1.1484653293428022)
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
"cameras" SET Transform position (0 4.092879128331377 0)
"cameras" SET Transform eulerAngles (14.900252875969116 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5753306297526427
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.403865783294561
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24582495548986916
"cameras/drone/drone0" SET Transform localPosition (0.5099848124136184 0.5298835820397771 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5380205739451861 1.2664728871916167 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 19 -17)
"cameras/drone/drone0" SET Transform localScale (1.0665017622233672 1.0665017622233672 1.0665017622233672)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -1 -7)
"cameras/drone/drone1" SET Transform localScale (1.1684119649748792 1.1684119649748792 1.1684119649748792)
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
"cameras" SET Transform position (0 3.161477984662099 0)
"cameras" SET Transform eulerAngles (4.356244443921192 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5648280325001913
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7175680101410742
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24817749685725965
"cameras/drone/drone0" SET Transform localPosition (0.6480622813760997 -0.2816191109246759 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07841413699439181 0.9062817505976983 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 17 4)
"cameras/drone/drone0" SET Transform localScale (0.6418361508329508 0.6418361508329508 0.6418361508329508)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -11 -20)
"cameras/drone/drone1" SET Transform localScale (1.1390550572154634 1.1390550572154634 1.1390550572154634)
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
"cameras" SET Transform position (0 3.699427813110111 0)
"cameras" SET Transform eulerAngles (5.524709306858249 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2025285767939793
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0830993514499698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3956812073939992
"cameras/drone/drone0" SET Transform localPosition (-0.13595496796333073 -0.04048135613810239 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9105093491205575 1.1801100140072491 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 1 -4)
"cameras/drone/drone0" SET Transform localScale (0.9122257780568679 0.9122257780568679 0.9122257780568679)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -9 19)
"cameras/drone/drone1" SET Transform localScale (1.0370718458406871 1.0370718458406871 1.0370718458406871)
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
"cameras" SET Transform position (0 3.6545474897322805 0)
"cameras" SET Transform eulerAngles (-17.185493961334835 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3582613998042783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0649561614070466
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21848829884918042
"cameras/drone/drone0" SET Transform localPosition (-0.8360271950945617 -0.13204519991931146 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9542427983824373 1.1174086308425302 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 20 14)
"cameras/drone/drone0" SET Transform localScale (1.3005622873124607 1.3005622873124607 1.3005622873124607)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -8 3)
"cameras/drone/drone1" SET Transform localScale (1.2603985782722282 1.2603985782722282 1.2603985782722282)
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
"cameras" SET Transform position (0 3.5054950687234454 0)
"cameras" SET Transform eulerAngles (14.793459215975048 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6361216475402203
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.411685946060445
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06513204655736078
"cameras/drone/drone0" SET Transform localPosition (1.0744504986024952 0.3518526824118217 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6311765124686354 0.9126600798160492 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -4 10)
"cameras/drone/drone0" SET Transform localScale (0.9669116276314258 0.9669116276314258 0.9669116276314258)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 11 18)
"cameras/drone/drone1" SET Transform localScale (0.7640995378683989 0.7640995378683989 0.7640995378683989)
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
"cameras" SET Transform position (0 4.708243767706782 0)
"cameras" SET Transform eulerAngles (-3.9508176655806473 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8443350258979652
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7342636385068817
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03329203665664502
"cameras/drone/drone0" SET Transform localPosition (-0.8795301297723949 0.12672411469064976 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.186868948629243 1.2660450500229377 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -9 -3)
"cameras/drone/drone0" SET Transform localScale (1.1638957716618399 1.1638957716618399 1.1638957716618399)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -3 -4)
"cameras/drone/drone1" SET Transform localScale (0.7260798200990591 0.7260798200990591 0.7260798200990591)
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
"cameras" SET Transform position (0 4.739085510395763 0)
"cameras" SET Transform eulerAngles (-8.242898453899588 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0629697623572008
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4879915641862274
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2130684650051861
"cameras/drone/drone0" SET Transform localPosition (0.19472141322563408 0.42699080806757433 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.724598885816516 1.2095483425187894 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -11 -14)
"cameras/drone/drone0" SET Transform localScale (1.0793405746555949 1.0793405746555949 1.0793405746555949)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 9 17)
"cameras/drone/drone1" SET Transform localScale (1.2237706703484346 1.2237706703484346 1.2237706703484346)
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
"cameras" SET Transform position (0 4.426217213756663 0)
"cameras" SET Transform eulerAngles (0.45197062753341655 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1816857255549056
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9715438451663232
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15191677801283843
"cameras/drone/drone0" SET Transform localPosition (0.8387059533980314 0.42447718348500246 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.01937008846662014 0.9812823536868491 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -2 -9)
"cameras/drone/drone0" SET Transform localScale (0.7797273598403683 0.7797273598403683 0.7797273598403683)
"cameras/drone/drone1" SET Transform localEulerAngles (15 0 12)
"cameras/drone/drone1" SET Transform localScale (1.411699018321703 1.411699018321703 1.411699018321703)
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
"cameras" SET Transform position (0 3.047546359301702 0)
"cameras" SET Transform eulerAngles (13.701618715240357 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3014663945648008
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5016632347438552
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04982035833813701
"cameras/drone/drone0" SET Transform localPosition (0.33984340408918534 0.049893996367424365 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3411989606475798 0.977924966859482 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -3 -20)
"cameras/drone/drone0" SET Transform localScale (0.6352008170132974 0.6352008170132974 0.6352008170132974)
"cameras/drone/drone1" SET Transform localEulerAngles (14 18 17)
"cameras/drone/drone1" SET Transform localScale (0.9634847724178324 0.9634847724178324 0.9634847724178324)
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
"cameras" SET Transform position (0 4.414094955288301 0)
"cameras" SET Transform eulerAngles (8.022314891311666 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3127409911991634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6046801097443257
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16402392207408434
"cameras/drone/drone0" SET Transform localPosition (0.9463951946224889 0.49764399740659454 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3488212195048215 1.1684428880083284 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 17 -9)
"cameras/drone/drone0" SET Transform localScale (1.0956712719278794 1.0956712719278794 1.0956712719278794)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -1 6)
"cameras/drone/drone1" SET Transform localScale (1.1577099230640377 1.1577099230640377 1.1577099230640377)
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
"cameras" SET Transform position (0 3.2672385633490495 0)
"cameras" SET Transform eulerAngles (18.034596393342667 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1391544935297508
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9337019305021065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20264670784003447
"cameras/drone/drone0" SET Transform localPosition (0.1738582551829433 0.1323272054341212 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5784284286261459 0.9143653992394527 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -16 1)
"cameras/drone/drone0" SET Transform localScale (1.2681556391677002 1.2681556391677002 1.2681556391677002)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -18 0)
"cameras/drone/drone1" SET Transform localScale (1.2465586615910422 1.2465586615910422 1.2465586615910422)
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.BoundingBoxes boundingBoxes
NOOP
